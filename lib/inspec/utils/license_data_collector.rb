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
        # TBD Do we need it at all?
        @headers = {}

        # Initialize payload
        @payload = {
          customer: "",
          license: fetch_license_key,
          expiration: fetch_license_expiration,
          name: fetch_license_name,
          periods: [
            version: "#{Inspec::VERSION}",
            date: start_time,
            period: {
              start: start_time,
            },
            summary: {
              nodes: { total: 0, active: 0 },
              scans: { targets: 1, total: 1 },
            },
            evidence: {
              nodes: [],
              scans: [
                {
                  identifier: opts[:runner].backend.backend.platform.uuid,
                  executions: 1, # TODO: Do they mean resource count here?
                  # TODO: Add resource count. Aggregate by summing like executions
                  version: "#{Inspec::VERSION}",
                  activity: { start: start_time },
                },
              ],
              content: [], # Populated dynamically below
            },
          ],
        }

        # Create one content evidence for each licensed profile to be scanned
        opts[:runner].target_profiles.each do |profile|
          next unless profile.licensed?

          payload[:periods][0][:evidence][:content] << {
            identifier: profile.metadata.params[:profile_content_id],
            executions: 1,
            version: profile.metadata.params[:version],
            type: "Profile",
            activity: { start: start_time },
          }
        end
      end

      def scan_finishing(opts)
        end_time = Time.now.getutc.iso8601
        payload[:periods][0][:period][:end] = end_time
        payload[:periods][0][:evidence][:scans][0][:activity][:end] = end_time
        payload[:periods][0][:evidence][:content].each { |c| c[:activity][:end] = end_time }
      end

      def fetch_license_key
        # TODO: obtain license key
        "TODO"
      end

      def fetch_license_expiration
        # TODO: obtain license expiration
        "TODO"
      end

      def fetch_license_name
        # TODO: obtain license user name
        "TODO"
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
        mp0 = merged[:payload][:periods][0]
        np0 = newer[:payload][:periods][0]

        mp0[:version] = np0[:version] # Take newer version
        # Use original Date
        # Use earlier of period:start
        mp0[:period][:start] = np0[:period][:start] < mp0[:period][:start] ? np0[:period][:start] : mp0[:period][:start]
        # Use later of period:End
        mp0[:period][:end] = np0[:period][:end] > mp0[:period][:end] ? np0[:period][:end] : mp0[:period][:end]
        # Use original Summary:Nodes
        # Calculate Summary:Scans later

        # Determine if a new scan has occured
        new_target_id = np0[:evidence][:scans][0][:identifier]
        existing_scan_record = mp0[:evidence][:scans].detect { |s| s[:identifier] == new_target_id }
        if existing_scan_record
          # Keep existing identifier (we matched on that)
          # Keep existing Transport - unlikely they would mismatch without the identifier changing too
          # Increment Executions
          existing_scan_record[:executions] += 1
          # Use greater of the two versions
          existing_scan_record[:version] = Gem::Version.new(np0[:evidence][:scans][0][:version]) > Gem::Version.new(existing_scan_record[:version]) ? np0[:evidence][:scans][0][:version] : existing_scan_record[:version]
          # Use earlier of the two start records
          existing_scan_record[:activity][:start] = np0[:evidence][:scans][0][:activity][:start] < existing_scan_record[:activity][:start] ? np0[:evidence][:scans][0][:activity][:start] : existing_scan_record[:activity][:start]
          # Use later of the two end records
          existing_scan_record[:activity][:end] = np0[:evidence][:scans][0][:activity][:end] > existing_scan_record[:activity][:end] ? np0[:evidence][:scans][0][:activity][:end] : existing_scan_record[:activity][:end]
        else
          # Simply append the new Scan record
          mp0[:evidence][:scans] << np0[:evidence][:scans][0]
        end

        # Now we can calculate new Summary:Scan numbers
        mp0[:summary][:scans][:targets] = mp0[:evidence][:scans].length
        mp0[:summary][:scans][:total] = mp0[:evidence][:scans].map { |s| s[:executions] }.sum

        # Determine if a new content record is needed
        # This section is optional
        unless np0[:evidence][:content].empty?
          new_audit_id = np0[:evidence][:content][0][:identifier]
          new_audit_version = np0[:evidence][:content][0][:version]
          existing_content = mp0[:evidence][:content].detect { |c| c[:identifier] == new_audit_id && c[:version] == new_audit_version }
          if existing_content
            existing_content[:executions] += 1
            # Keep existing identifier and Version (we matched on those)
            # Use earlier of the two start records
            existing_content[:activity][:start] = np0[:evidence][:content][0][:activity][:start] < existing_content[:activity][:start] ? np0[:evidence][:content][0][:activity][:start] : existing_content[:activity][:start]
            # Use later of the two end records
            existing_content[:activity][:end] = np0[:evidence][:content][0][:activity][:end] > existing_content[:activity][:end] ? np0[:evidence][:content][0][:activity][:end] : existing_content[:activity][:end]
          else
            # Simply append the new Content record
            mp0[:evidence][:content] << np0[:evidence][:content][0]
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
