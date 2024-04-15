require "time" unless defined?(Time.zone_offset)
require "chef-licensing"
require_relative "telemetry/null"
require_relative "telemetry/http"
require_relative "telemetry/run_context_probe"

module Inspec
  class Telemetry

    @@instance = nil
    @@config = nil

    def self.instance
      @@instance ||= determine_backend_class.new
    end

    def self.determine_backend_class
      # Don't perform telemetry call if license is a commercial license
      return Inspec::Telemetry::Null if license&.license_type&.downcase == "commercial"

      if Inspec::Dist::EXEC_NAME == "inspec" && telemetry_disabled?
        # Issue a warning if an InSpec user is explicitly trying to opt out of telemetry using cli option
        Inspec::Log.warn "Telemetry opt-out is not permissible."
      end

      # Telemetry opt-in/out enabled for other Inspec distros
      return Inspec::Telemetry::Null if Inspec::Dist::EXEC_NAME != "inspec" && telemetry_disabled?

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
      @@config ||= opts[:conf]
      instance.run_starting(opts)
    end

    def self.run_ending(opts)
      @@config ||= opts[:conf]
      instance.run_ending(opts)
    end

    def self.note_feature_usage(feature_name)
      instance.note_feature_usage(feature_name)
    end

    def self.config
      @@config
    end

    def self.telemetry_disabled?
      !config.telemetry_options["enable_telemetry"]
    end
  end
end
