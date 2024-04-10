# frozen_string_literal: true
require "chef-licensing"
require "securerandom" unless defined?(SecureRandom)
require "digest" unless defined?(Digest)
require_relative "../../dist"
module Inspec
  class Telemetry
    class Base
      VERSION = 2.0
      TYPE = "job"
      JOB_TYPE = "InSpec"

      attr_accessor :scratch

      def fetch_license_ids
        Inspec::Log.debug "Fetching license IDs for telemetry"
        @license_keys ||= ChefLicensing.license_keys
      end

      def create_wrapper
        Inspec::Log.debug "Initialising wrapper for telemetry"
        {
          version: VERSION,
          createdTimeUTC: Time.now.getutc.iso8601,
          environment: Inspec::Telemetry::RunContextProbe.guess_run_context,
          licenseIds: fetch_license_ids,
          source: "#{Inspec::Dist::EXEC_NAME}:#{Inspec::VERSION}",
          type: TYPE,
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
        @scratch[:run_start_time] = Time.now.getutc.iso8601
      end

      def run_ending(opts)
        note_per_run_features(opts)

        payload = create_wrapper

        train_platform = opts[:runner].backend.backend.platform
        payload[:platform] = train_platform.name

        payload[:jobs] = [{
                            type: JOB_TYPE,

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
                          }]

        opts[:run_data][:profiles].each do |profile|
          payload[:jobs][0][:content] << {
            name: obscure(profile[:name]),
            version: profile[:version],
            sha256: profile[:sha256],
            maintainer: profile[:maintainer] || "",
            type: "profile",
          }

          profile[:controls].each do |control|
            payload[:jobs][0][:steps] << {
              id: obscure(control[:id]),
              name: "inspec-control",
              description: control[:desc] || "",
              target: {
                mode: opts[:runner].backend.backend.backend_type,
                id: opts[:runner].backend.backend.platform.uuid,
              },
              resources: [],
              features: [],
              tags: format_control_tags(control[:tags]),
              results: format_control_results(control[:results]&.first),
            }

            control[:results]&.each do |resource_block|
              payload[:jobs][0][:steps].last[:resources] << {
                type: "inspec-resource",
                name: resource_block[:resource_class],
                id: obscure(resource_block[:resource_title].respond_to?(:resource_id) ? resource_block[:resource_title].resource_id : nil) || "unknown",
              }
            end

            # Per-control features.
            payload[:jobs][0][:steps].last[:features] = scratch[:features].dup
          end
        end

        Inspec::Log.debug "Final data for telemetry upload -> #{payload}"
        # Return payload object for testing
        payload
      end

      def format_control_results(run_result)
        return {} unless run_result

        {
          succeeded: (run_result[:status] != "failed"),
          message: run_result[:message] || "",
          code: control_status_code(run_result[:status]),
        }
      end

      def control_status_code(control_status)
        # Status code 1 in case of failure. Ref: runner_rspec.rb (def exit_code)
        control_status == "failed" ? 1 : 0
      end

      def format_control_tags(tags)
        tags_list = []
        tags.each do |key, value|
          tags_list << { name: key.to_s, value: (value || "").to_s }
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
        note_all_invoked_features
        note_gem_dependency_usage(opts)
      end

      def note_all_invoked_features
        Inspec::Feature.list_all_invoked_features.each do |feature|
          Inspec::Telemetry.note_feature_usage(feature.to_s)
        end
      end

      def note_gem_dependency_usage(opts)
        unless opts[:runner].target_profiles.map do |tp|
          tp.metadata.gem_dependencies + \
              tp.locked_dependencies.list.map { |_k, v| v.profile.metadata.gem_dependencies }.flatten
        end.flatten.empty?
          Inspec::Telemetry.note_feature_usage("inspec-gem-deps-in-profiles")
        end
      end
    end
  end
end
