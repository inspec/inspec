require_relative "../dist"
require_relative "../version"
require "time" unless defined?(Time.zone_offset)

require_relative "license_data_collector/http"
require_relative "license_data_collector/offline"
require_relative "telemetry/run_context_probe"
require_relative "../globals"

module Inspec
  class LicenseDataCollector

    @@instance = nil

    def self.scan_starting(opts)
      instance.scan_starting(opts)
    end

    def self.scan_finishing(opts)
      instance.scan_finishing(opts)
    end

    def self.instance
      @@instance ||= determine_backend_class.new
    end

    def self.determine_backend_class
      # Don't perform license data collection unless feature flag enabled
      return Inspec::LicenseDataCollector::Null unless ENV["CHEF_FEATURE_LDC_CLIENT"]

      # Don't perform license data collection if we are not the official Progress Chef InSpec distro
      return Inspec::LicenseDataCollector::Null if Inspec::Dist::EXEC_NAME != "inspec"

      # Don't perform LDC if running under Automate - assume Automate does LDC tracking for us
      return Inspec::LicenseDataCollector::Null if Inspec::Telemetry::RunContextProbe.under_automate?

      # Switch between Offline and Http intelligently
      if Inspec::LicenseDataCollector::Offline.airgap_mode?
        Inspec::LicenseDataCollector::Offline
      else
        Inspec::LicenseDataCollector::Http
      end
    end

    class Base
      attr_accessor :payload
      attr_accessor :headers

      def self.license_data_dir
        File.join(Inspec.config_dir, "license-data")
      end

      def scan_starting(opts)
        start_time = Time.now.getutc.iso8601

        # Populate header
        @headers = {
          Principal: "#{Inspec::Dist::EXEC_NAME}:#{Inspec::VERSION}",
          Customer: fetch_customer_id,
        }

        # Initialize payload
        @payload = {
          Periods: [
            Version: "#{Inspec::VERSION}",
            Date: start_time,
            Period: {
              Start: start_time,
            },
            Summary: {
              Nodes: { Total: 0, Active: 0 },
              Scans: { Targets: 1, Total: 1 },
            },
            Evidence: {
              Nodes: [],
              Scans: [
                {
                  Identifier: opts[:runner].backend.backend.platform.uuid,
                  Executions: 1, # TODO: Do they mean resource count here?
                  Version: "#{Inspec::VERSION}",
                  Activity: { Start: start_time },
                },
              ],
              Content: [], # Populated dynamically below
            },
          ],
        }

        # Create one content evidence for each licensed profile to be scanned
        opts[:runner].target_profiles.each do |profile|
          next unless profile.licensed?

          payload[:Periods][0][:Evidence][:Content] << {
            Identifier: profile.metadata.params[:profile_content_id],
            Executions: 1,
            # Version: "#{Inspec::VERSION}",
            Version: profile.metadata.params[:version],
            Type: "Profile",
            Activity: { Start: start_time },
          }
        end
      end

      def scan_finishing(_opts)
        end_time = Time.now.getutc.iso8601
        payload[:Periods][0][:Period][:End] = end_time
        payload[:Periods][0][:Evidence][:Scans][0][:Activity][:End] = end_time

        # TODO: Arguably, we should be looking through run_data and finding each profile's end time
        payload[:Periods][0][:Evidence][:Content].each { |c| c[:Activity][:End] = end_time }
      end

      def fetch_customer_id
        # TODO: obtain customer ID from some mechanism
        "TODOTODOTODOTODOTO"
      end

      # Merge two payloads
      def aggregate_ldc_payload(merged, newer)
        if merged.empty?
          merged[:headers] = newer[:headers]
          merged[:payload] = newer[:payload]
          return
        end

        # Merge headers
        # Header is always the newer
        merged[:headers] = newer[:headers]

        # Merge payloads
        mp0 = merged[:payload][:Periods][0]
        np0 = newer[:payload][:Periods][0]

        mp0[:Version] = np0[:Version] # Take newer version
        # Use original Date
        # Use earlier of Period:Start
        mp0[:Period][:Start] = np0[:Period][:Start] < mp0[:Period][:Start] ? np0[:Period][:Start] : mp0[:Period][:Start]
        # Use later of Period:End
        mp0[:Period][:End] = np0[:Period][:End] > mp0[:Period][:End] ? np0[:Period][:End] : mp0[:Period][:End]
        # Use original Summary:Nodes
        # Calculate Summary:Scans later

        # Determine if a new scan has occured
        new_target_id = np0[:Evidence][:Scans][0][:Identifier]
        existing_scan_record = mp0[:Evidence][:Scans].detect { |s| s[:Identifier] == new_target_id }
        if existing_scan_record
          existing_scan_record[:Executions] += 1
          # Keep existing Identifier (we matched on that)
          # Use greater of the two versions
          existing_scan_record[:Version] = Gem::Version.new(np0[:Evidence][:Scans][0][:Version]) > Gem::Version.new(existing_scan_record[:Version]) ? np0[:Evidence][:Scans][0][:Version] : existing_scan_record[:Version]
          # Use earlier of the two start records
          existing_scan_record[:Activity][:Start] = np0[:Evidence][:Scans][0][:Activity][:Start] < existing_scan_record[:Activity][:Start] ? np0[:Evidence][:Scans][0][:Activity][:Start] : existing_scan_record[:Activity][:Start]
          # Use later of the two end records
          existing_scan_record[:Activity][:End] = np0[:Evidence][:Scans][0][:Activity][:End] > existing_scan_record[:Activity][:End] ? np0[:Evidence][:Scans][0][:Activity][:End] : existing_scan_record[:Activity][:End]
        else
          # Simply append the new Scan record
          mp0[:Evidence][:Scans] << np0[:Evidence][:Scans][0]
        end

        # Now we can calculate new Summary:Scan numbers
        mp0[:Summary][:Scans][:Targets] = mp0[:Evidence][:Scans].length
        mp0[:Summary][:Scans][:Total] = mp0[:Evidence][:Scans].length

        # Determine if a new content record is needed
        # This section is optional
        unless np0[:Evidence][:Content].empty?
          new_audit_id = np0[:Evidence][:Content][0][:Identifier]
          new_audit_version = np0[:Evidence][:Content][0][:Version]
          existing_content = mp0[:Evidence][:Content].detect { |c| c[:Identifier] == new_audit_id && c[:Version] == new_audit_version }
          if existing_content
            existing_content[:Executions] += 1
            # Keep existing Identifier and Version (we matched on those)
            # Use earlier of the two start records
            existing_content[:Activity][:Start] = np0[:Evidence][:Content][0][:Activity][:Start] < existing_content[:Activity][:Start] ? np0[:Evidence][:Content][0][:Activity][:Start] : existing_content[:Activity][:Start]
            # Use later of the two end records
            existing_content[:Activity][:End] = np0[:Evidence][:Content][0][:Activity][:End] > existing_content[:Activity][:End] ? np0[:Evidence][:Content][0][:Activity][:End] : existing_content[:Activity][:End]
          else
            # Simply append the new Content record
            mp0[:Evidence][:Content] << np0[:Evidence][:Content][0]
          end
        end
      end

      def aggregate_payload_to_file(file)
        # TODO: compress aggregate file

        # If aggregate file exists, read it
        merged = {}
        if file.size > 0
          merged = JSON.parse(file.read, symbolize_names: true)
        end

        # Merge in current payload and headers
        aggregate_ldc_payload(merged, { headers: headers, payload: payload } )

        # Write new aggregate file
        file.rewind
        file.write(JSON.generate(merged))
        file.flush
        merged
      end

      # We need to lock the aggregate file because certain commands like
      # `inspec parallel` use multiprocess parallelism and could corrupt
      # the file with multiple simultaneous writes
      # TODO: verify cross platform support for flock()
      def lock_aggregate_file
        FileUtils.mkdir_p(Base.license_data_dir)
        aggregate_path = File.join(Base.license_data_dir, "aggregate.json")
        File.open(aggregate_path, File::RDWR | File::CREAT) do |file|
          file.flock(File::LOCK_EX)
          yield(file)
          file.flock(File::LOCK_UN)
        end
      end

    end

    class Null < Base
      def scan_starting(_opts); end
      def scan_finishing(_opts); end
    end
  end
end
