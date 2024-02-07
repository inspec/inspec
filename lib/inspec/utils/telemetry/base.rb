# frozen_string_literal: true
require "chef-licensing"
require "securerandom" unless defined?(SecureRandom)
require "digest" unless defined?(Digest)
require_relative "../../dist"
module Inspec
  class Telemetry
    class Base
      attr_accessor :scratch

      def fetch_license_ids
        @license_keys ||= ChefLicensing.license_keys
      end

      def create_wrapper(payload_type)
        {
          version: "2.0",
          createdTimeUTC: Time.now.getutc.iso8601,
          environment: "CLI", # TODO: Consider replacing this with run context probe
          licenseIds: fetch_license_ids,
          source: "#{Inspec::Dist::EXEC_NAME}:#{Inspec::VERSION}",
          type: payload_type,
        }
      end

      def note_feature_usage(feature_name)
        @scratch ||= {}
        @scratch[:features] ||= []
        @scratch[:features] << feature_name
      end

      def run_starting(_opts = {})
        @scratch ||= {}
        @scratch[:features] ||= []
        @scratch[:run_start_time] = Time.current
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
            type: "profile",
            id: "", # TODO determine profile ID
            # TODO: add profileContentId
            # parentProfile: obscure(profile[:parent_profile]) || "",
          }

          profile[:controls].each do |control|
            payload[:jobs][0][:steps] << {
              id: obscure(control[:id]),
              name: "inspec-control",
              description: control[:desc] || "",
              target: {}, # TODO
              resources: [],
              features: [],
              tags: format_tags(control[:tags]),
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
            payload[:jobs][0][:steps].last[:features] << "waivers" unless control[:waiver_data].nil? || control[:waiver_data].empty?
          end
        end

        # Return payload object for testing
        payload
      end

      def format_tags(tags)
        tags_list = []
        tags.each do |key, value|
          tags_list << { name: key, value: value }
        end
        tags_list
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
  end
end
