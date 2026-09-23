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
        Inspec::Log.debug "Initiating telemetry for InSpec"
        @scratch ||= {}
        @scratch[:features] ||= []
        @scratch[:run_start_time] = Time.now.getutc.iso8601
      end

      def run_ending(opts)
        note_per_run_features(opts)

        payload = create_wrapper

        train_platform = opts[:runner].backend.backend.platform
        payload[:platform] = safe_platform_field(train_platform, :name)

        payload[:jobs] = [{
                            type: JOB_TYPE,

                            # Target platform info
                            environment: {
                              host: obscure(URI(opts[:runner].backend.backend.uri).host) || "unknown",
                              os: safe_platform_field(train_platform, :name) || "unknown",
                              version: safe_platform_field(train_platform, :release) || "unknown",
                              architecture: safe_platform_field(train_platform, :arch) || "unknown",
                              id: hash_to_uuid(safe_platform_field(train_platform, :uuid)),
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
        Inspec::Log.debug "Finishing telemetry for InSpec"
        # Return payload object for testing
        payload
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

      # Safely access platform fields that may not exist
      def safe_platform_field(platform, field)
        return nil if platform.nil?
        return nil unless platform.respond_to?(field)

        platform.send(field)
      end

      # Train's platform.uuid can return a raw 64-char hex identifier (e.g. a Docker
      # container ID from /proc/self/mountinfo) instead of a proper UUID when running
      # inside a container. Normalize such values into a valid RFC 4122 (v5-like) UUID
      # so downstream consumers can always rely on the UUID format. Values that are
      # already a valid UUID, or that don't match a 64-char hex string, are returned as-is.
      def hash_to_uuid(value)
        return nil if value.nil?

        value_str = value.to_s
        return nil if value_str.empty?

        uuid_format = /^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$/i
        return value_str if value_str =~ uuid_format

        hex_64_format = /^[0-9a-fA-F]{64}$/i
        return value_str unless value_str =~ hex_64_format

        bytes = value_str[0, 32].scan(/.{2}/).map { |byte| byte.to_i(16) }

        time_low        = bytes[0..3].inject(0)   { |a, b| (a << 8) | b }
        time_mid        = bytes[4..5].inject(0)   { |a, b| (a << 8) | b }
        time_hi_version = bytes[6..7].inject(0)   { |a, b| (a << 8) | b }
        clock_seq       = bytes[8..9].inject(0)   { |a, b| (a << 8) | b }
        node            = bytes[10..15].inject(0) { |a, b| (a << 8) | b }

        # Set version (5) and variant (RFC 4122) bits per the UUID spec
        time_hi_version = (time_hi_version & 0x0FFF) | (5 << 12)
        clock_seq       = (clock_seq & 0x3FFF) | 0x8000

        format("%08x-%04x-%04x-%04x-%012x", time_low, time_mid, time_hi_version, clock_seq, node)
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
