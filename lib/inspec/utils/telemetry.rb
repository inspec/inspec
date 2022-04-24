require "time" unless defined?(Time.zone_offset)
require_relative "../dist"
require "securerandom" unless defined?(SecureRandom)

module Inspec
  class Telemetry

    @@instance = nil

    def self.instance
      @@instance ||= determine_backend_class.new
    end

    def self.determine_backend_class
      # Don't perform telemetry unless feature flag is enabled
      return Inspec::Telemetry::Null unless ENV["CHEF_FEATURE_TELEMETRY"]

      # TODO: ask chef-telemetry gem if we should be enabled or not

      # TODO: implement online telemetry collection using chef-telemtry gem

      Inspec::Telemetry::Null
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

    class Base
      attr_accessor :scratch
      attr_reader :session_id

      def fetch_customer_id
        # TODO: obtain customer ID from some mechanism
        "(unknown)"
      end

      def fetch_session_id
        @session_id ||= SecureRandom.uuid
      end

      def create_wrapper(payload_type)
        {
          version: "2.0",
          createdTimeUTC: Time.now.getutc.iso8601, # like 3339 but always uses T
          environment: "CLI",
          # licenseId # We will never have this
          customerId: fetch_customer_id,
          source: "#{Inspec::Dist::EXEC_NAME}:#{Inspec::VERSION}",
          type: payload_type,
          correlationId: fetch_session_id,
        }
      end

      def run_starting(_opts)
        @scratch ||= {}
        @scratch[:run_start_time] = Time.now
      end

      def run_ending(opts)
        # TODO: construct a Job record and send it
        # https://chefio.atlassian.net/wiki/spaces/AR/pages/2566455325/Telemetry+schemas+catalog#Jobs
        payload = create_wrapper("job")

        # Return payload object for testing
        payload
      end
    end

    class Null < Base
      def run_starting(_opts); end
      def run_ending(_opts); end
    end

  end
end
