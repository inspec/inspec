require "time" unless defined?(Time.zone_offset)
require "chef-licensing"
require_relative "telemetry/null"
require_relative "telemetry/http"
require_relative "telemetry/run_context_probe"

module Inspec
  class Telemetry

    @@instance = nil

    def self.instance
      @@instance ||= determine_backend_class.new
    end

    def self.determine_backend_class
      # Don't perform telemetry call if license is not a free license
      return Inspec::Telemetry::Null unless license&.license_type == "free"

      # Don't perform telemetry action if running under Automate - Automate does LDC tracking for us
      return Inspec::Telemetry::Null if Inspec::Telemetry::RunContextProbe.under_automate?

      Inspec::Log.debug "Determined HTTP instance for telemetry"

      Inspec::Telemetry::HTTP
    end

    def self.license
      Inspec::Log.debug "Fetching license context for telemetry"
      @license ||= ChefLicensing.license_context
    end

    ######
    # These class methods make it convenient to call from anywhere within the InSpec codebase.
    ######
    def self.run_starting(opts)
      instance.run_starting(opts)
    end

    def self.run_ending(opts)
      instance.run_ending(opts)
    end

    def self.note_feature_usage(feature_name)
      instance.note_feature_usage(feature_name)
    end
  end
end
