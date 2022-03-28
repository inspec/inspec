require "json" unless defined?(JSON)
require "fileutils" unless defined?(FileUtils)
require_relative "../../config"

module Inspec
  class LicenseDataCollector
    class Base; end

    class Offline < Base

      AIRGAP_MARKER_FILE = "airgap-mode".freeze

      # Return true if the system should operate offline.
      def self.airgap_mode?
        airgap_by_cli_option? ||
          airgap_by_file_marker? ||
          too_many_recent_http_errors?
      end

      # Return true if the user passed the --airgap option.
      def self.airgap_by_cli_option?
        Inspec::Config.cached.final_options[:airgap]
      end

      # Return true if the file ~/.inspec/license-data/airgap-mode exists
      def self.airgap_by_file_marker?
        File.exist?(File.join(license_data_dir, AIRGAP_MARKER_FILE))
      end

      # Return true if ~/.inspec/license-data/http-*.fail exists
      # and has at least 5 failures in the last 7 days
      def self.too_many_recent_http_errors?
        seven_days_ago = Time.now - 7 * 24 * 60 * 60
        Dir.glob(File.join(license_data_dir, "http-*.fail"))
          .map { |f| File.stat(f).mtime }
          .filter { |t| t > seven_days_ago }
          .length >= 5
      end

      def scan_finishing(opts)
        super(opts)

        aggregate_files
      end

      # Aggregate the reports for eventual collection using an out of band means
      def aggregate_files
        # TODO: compress aggregate file
        aggregate_path = File.join(Base.license_data_dir, "aggregate.json")
        # If aggregate file exists, read it
        merged = {}
        if File.exist?(aggregate_path)
          merged = JSON.parse(File.read(aggregate_path), symbolize_names: true)
        end

        # Read each http-*.json file and merge it into the aggregate file
        Dir.glob(File.join(Base.license_data_dir, "http-*.json")).sort.each do |http_file|
          data = JSON.parse(File.read(http_file), symbolize_names: true)
          aggregate_ldc_payload(merged, data)
        end

        # Merge in current payload and headers
        aggregate_ldc_payload(merged, { headers: headers, payload: payload } )

        # Write new aggregate file
        FileUtils.mkdir_p(Base.license_data_dir)
        File.write(aggregate_path, JSON.generate(merged))

        # Delete the http-*.json files.
        FileUtils.rm(File.join(license_data_dir, "http-*.json"))
      end
    end
  end
end
