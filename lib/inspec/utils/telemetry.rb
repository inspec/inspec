require "time" unless defined?(Time.zone_offset)
require "chef-licensing"
require_relative "telemetry/debug"
require_relative "telemetry/null"
require_relative "telemetry/http"

module Inspec
  class Telemetry

    @@instance = nil

    def self.instance
      @@instance ||= determine_backend_class.new
    end

    def self.determine_backend_class
      # Don't perform telemetry call if license is not a free license
      return Inspec::Telemetry::Null unless license&.license_type == "free"

      # TODO: ask chef-telemetry gem if we should be enabled or not

      # TODO: implement online telemetry collection using chef-telemtry gem

      Inspec::Telemetry::Debug
    end

    def self.license
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
