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
      # Don't perform telemetry action for other InSpec distros
      # Don't perform telemetry action if running under Automate - Automate does LDC tracking for us
      # Don't perform telemetry action if license is a commercial license
      # Don't perform telemetry action if running under Test Kitchen

      if Inspec::Dist::EXEC_NAME != "inspec" ||
          Inspec::Telemetry::RunContextProbe.under_automate? ||
          license&.license_type&.downcase == "commercial" ||
          Inspec::Telemetry::RunContextProbe.guess_run_context == "test-kitchen"

        Inspec::Log.debug "Determined telemetry operation is not applicable and hence aborting it."
        return Inspec::Telemetry::Null
      end

      # Handle telemetry disable option
      if telemetry_disabled_by_cli?
        if cinc_user?
          Inspec::Log.debug "Telemetry disabled by CINC user via --disable-telemetry option."
          return Inspec::Telemetry::Null
        else
          # Issue a warning if a Chef InSpec user is trying to opt out of telemetry using --disable-telemetry
          Inspec::Log.warn "The --disable-telemetry option is only available for CINC users. Telemetry opt-out is not permissible for Chef InSpec users."
        end
      end

      if Inspec::Dist::EXEC_NAME == "inspec" && telemetry_disabled?
        # Issue a warning if an InSpec user is explicitly trying to opt out of telemetry using --enable-telemetry=false
        Inspec::Log.warn "Telemetry opt-out is not permissible."
      end

      Inspec::Log.debug "Determined HTTP instance for telemetry"

      Inspec::Telemetry::HTTP
    end

    def self.license
      Inspec::Log.debug "Fetching license context for telemetry check"
      @license = ChefLicensing.license_context
    end

    ######
    # These class methods make it convenient to call from anywhere within the InSpec codebase.
    ######
    def self.run_starting(opts)
      @@config ||= opts[:conf]
      instance.run_starting(opts)
    rescue StandardError => e
      Inspec::Log.debug "Encountered error in Telemetry start run call -> #{e.message}"
    end

    def self.run_ending(opts)
      @@config ||= opts[:conf]
      instance.run_ending(opts)
    rescue StandardError => e
      Inspec::Log.debug "Encountered error in Telemetry end run call -> #{e.message}"
    end

    def self.note_feature_usage(feature_name)
      instance.note_feature_usage(feature_name)
    end

    def self.config
      @@config
    end

    def self.telemetry_disabled?
      config.telemetry_options["enable_telemetry"].nil? ? false : !config.telemetry_options["enable_telemetry"]
    end

    def self.telemetry_disabled_by_cli?
      config.telemetry_options["disable_telemetry"] == true
    end

    def self.cinc_user?
      # CINC (Community Distribution of Chef InSpec) uses "cinc-auditor" as executable name
      # while Chef InSpec uses "inspec"
      Inspec::Dist::EXEC_NAME != "inspec"
    end
  end
end
