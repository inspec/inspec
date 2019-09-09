require "singleton"
require "json"
require "inspec/globals"

module Inspec::Plugin; end

module Inspec::Plugin::V2
  Exclusion = Struct.new(:plugin_name, :rationale)

  class PluginFilter
    include Singleton
    def initialize
      read_filter_data
    end

    def self.exclude?(plugin_name)
      instance.exclude?(plugin_name)
    end

    def exclude?(plugin_name)
      # Currently, logic is very simple: is there an exact match?
      # In the future, we might add regexes on names, or exclude version ranges
      return false unless @filter_data[:exclude].detect { |e| e.plugin_name == plugin_name }

      # OK, return entire data structure.
      @filter_data[:exclude].detect { |e| e.plugin_name == plugin_name }
    end

    private

    def read_filter_data
      path = File.join(Inspec.src_root, "etc", "plugin_filters.json")
      @filter_data = JSON.parse(File.read(path))

      unless @filter_data["file_version"] == "1.0.0"
        raise Inspec::Plugin::V2::ConfigError, "Unknown plugin fillter file format at #{path}"
      end

      validate_plugin_filter_file("1.0.0")

      @filter_data[:exclude] = @filter_data["exclude"].map do |entry|
        Exclusion.new(entry["plugin_name"], entry["rationale"])
      end
      @filter_data.delete("exclude")
    end

    def validate_plugin_filter_file(_file_version)
      unless @filter_data.key?("exclude") && @filter_data["exclude"].is_a?(Array)
        raise Inspec::Plugin::V2::ConfigError, 'Unknown plugin fillter file format: expected "exclude" to be an array'
      end

      @filter_data["exclude"].each_with_index do |entry, idx|
        unless entry.is_a? Hash
          raise Inspec::Plugin::V2::ConfigError, "Unknown plugin fillter file format: expected entry #{idx} to be a Hash / JS Object"
        end
        unless entry.key?("plugin_name")
          raise Inspec::Plugin::V2::ConfigError, "Unknown plugin fillter file format: expected entry #{idx} to have a \"plugin_name\" field"
        end
        unless entry.key?("rationale")
          raise Inspec::Plugin::V2::ConfigError, "Unknown plugin fillter file format: expected entry #{idx} to have a \"rationale\" field"
        end
      end
    end
  end

  # To be a valid plugin name, the plugin must beign with either
  # inspec- or train-, AND ALSO not be on the exclusion list.
  # We maintain this exclusion list to avoid confusing users.
  # For example, we want to have a real gem named inspec-test-fixture,
  # but we don't want the users to see that.
  module FilterPredicates
    def train_plugin_name?(name)
      valid_plugin_name?(name, :train)
    end

    def inspec_plugin_name?(name)
      valid_plugin_name?(name, :inspec)
    end

    def valid_plugin_name?(name, kind = :either)
      # Must have a permitted prefix.
      return false unless case kind
      when :inspec
        name.to_s.start_with?("inspec-")
      when :train
        name.to_s.start_with?("train-")
      when :either
        name.to_s.match(/^(inspec|train)-/)
      else false
      end # rubocop: disable Layout/EndAlignment

      # And must not be on the exclusion list.
      ! Inspec::Plugin::V2::PluginFilter.exclude?(name)
    end
  end
end
