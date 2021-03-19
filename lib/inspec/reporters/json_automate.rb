require "json" unless defined?(JSON)

module Inspec::Reporters
  class JsonAutomate < Json
    def initialize(config)
      super(config)
      @profiles = []
    end

    def render
      output(report.to_json, false)
    end

    def report
      # grab profiles from the json parent class
      @profiles = profiles

      output = {
        platform: platform,
        profiles: merge_profiles,
        statistics: {
          duration: run_data[:statistics][:duration],
        },
        version: run_data[:version],
      }

      # optional jsonconfig passthrough options
      %w{node_name environment roles job_uuid passthrough}.each do |option|
        output[option.to_sym] = @config[option] unless @config[option].nil?
      end
      output
    end

    private

    def merge_profiles
      @profiles.each do |profile|
        next unless profile.key?(:parent_profile)

        parent_profile = find_master_parent(profile)
        merge_controls(parent_profile, profile)
        merge_depends(parent_profile, profile)
      end

      # delete child profiles
      @profiles.delete_if { |p| p.key?(:parent_profile) }

      @profiles
    end

    def find_master_parent(profile)
      return profile unless profile.key?(:parent_profile)

      parent_profile = @profiles.select { |parent| parent[:name] == profile[:parent_profile] }.first
      find_master_parent(parent_profile)
    end

    def merge_controls(parent, child)
      parent[:controls].each do |control|
        child_control = child[:controls].select { |c| c[:id] == control[:id] }.first
        next if child_control.nil?

        control.each do |name, _value|
          child_value = child_control[name]
          next if child_value.nil? || (child_value.respond_to?(:empty?) && child_value.empty?)

          control[name] = child_value
        end
      end
    end

    def merge_depends(parent, child)
      return unless child.key?(:depends)

      child[:depends].each do |d|
        parent[:depends] << d
      end
    end
  end
end
