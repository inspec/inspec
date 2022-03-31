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

        # Aggregate the reports for eventual collection using an out of band means
        Thread.new { aggregate_payload_to_file }
      end
    end
  end
end
