require "time" unless defined?(Time.zone_offset)
require_relative "../dist"
require "securerandom" unless defined?(SecureRandom)
require "digest" unless defined?(Digest)

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

      Inspec::Telemetry::Debug
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

    class Base
      attr_accessor :scratch
      attr_reader :session_id

      def fetch_customer_id
        # TODO: obtain customer ID from some mechanism
        "unknown"
      end

      def fetch_session_id
        @session_id ||= SecureRandom.uuid
      end

      def create_wrapper(payload_type)
        {
          version: "2.0",
          createdTimeUTC: Time.now.getutc.iso8601, # like 3339 but always uses T
          environment: "CLI", # TODO: Consider replacing this with run context probe
          # licenseId # We will never have this
          customerId: fetch_customer_id,
          source: "#{Inspec::Dist::EXEC_NAME}:#{Inspec::VERSION}",
          type: payload_type,
          correlationId: fetch_session_id,
        }
      end

      def note_feature_usage(feature_name)
        @scratch ||= {}
        @scratch[:features] ||= []
        @scratch[:features] << feature_name
      end

      def run_starting(_opts)
        @scratch ||= {}
        @scratch[:features] ||= []
        @scratch[:run_start_time] = Time.now # TODO: This is not used
      end

      def run_ending(opts)
        note_per_run_features(opts)

        payload = create_wrapper("job")

        train_platform = opts[:runner].backend.backend.platform

        payload[:jobs] = [{
          type: "InSpec",

          # Target platform info
          environment: {
            host: obscure(URI(opts[:runner].backend.backend.uri).host) || "unknown",
            os: train_platform.name,
            version: train_platform.release,
            architecture: train_platform.arch || "",
            id: train_platform.uuid,
          },

          runtime: Inspec::VERSION,
          content: [],  # one content == one profile
          steps: [],    # one step == one control
          features: scratch[:features].dup, # TODO: proposed new field (promoted up from steps)
        }]

        opts[:run_data][:profiles].each do |profile|
          payload[:jobs][0][:content] << {
            name: obscure(profile[:name]),
            version: profile[:version],
            sha256: profile[:sha256],
            maintainer: profile[:maintainer],
            parentProfile: obscure(profile[:parent_profile]) || "",
            # TODO: add profileContentId
          }

          profile[:controls].each do |control|
            payload[:jobs][0][:steps] << {
              id: obscure(control[:id]),
              name: "inspec-control",
              resources: [],
              features: [],
            }

            control[:results]&.each do |resource_block|
              payload[:jobs][0][:steps].last[:resources] << {
                type: "inspec-resource",
                name: resource_block[:resource_class],
                id: obscure(resource_block[:resource_title].respond_to?(:resource_id) ? resource_block[:resource_title].resource_id : nil) || "unknown",
              }
            end

            # Per-control features.
            # Waivers
            payload[:jobs][0][:steps].last[:features] << "waivers" unless control[:waiver_data].empty?
          end
        end

        # Return payload object for testing
        payload
      end

      # Hash text if non-nil
      def obscure(cleartext)
        return nil if cleartext.nil?
        return nil if cleartext.empty?

        Digest::SHA2.new(256).hexdigest(cleartext)
      end

      def note_per_run_features(opts)
        note_reporters
        note_gem_dependency_usage(opts)
        # TODO: what other features should be observed?
      end

      def note_reporters
        Inspec::Config.cached[:reporter]
          .keys
          .each { |name| Inspec::Telemetry.note_feature_usage("reporter:#{name}") }
      end

      def note_gem_dependency_usage(opts)
        unless opts[:runner].target_profiles.map do |tp|
          tp.metadata.gem_dependencies + \
              tp.locked_dependencies.list.map { |_k, v| v.profile.metadata.gem_dependencies }.flatten
        end.flatten.empty?
          Inspec::Telemetry.note_feature_usage("gem-deps-in-profiles")
        end
      end
    end

    class Null < Base
      def run_starting(_opts); end
      def run_ending(_opts); end
    end

    class Debug < Base
      def run_ending(opts)
        # payload = super(opts)
        # require "byebug"; byebug
        # 1
      end
    end

  end
end
