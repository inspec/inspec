require 'json'

module Inspec::Plugin::V2
  # Represents the plugin config file on disk.
  class ConfigFile
    include Enumerable

    attr_reader :path

    def initialize(path = nil)
      @path = path || self.class.default_path
      @data = blank_structure

      read_and_validate_data if File.exist?(@path)
    end

    def self.default_path
      File.join(Inspec.config_dir, 'plugins.json')
    end

    def each
      @data['plugins'].each do |*args|
        yield(args)
      end
    end

    private
    def blank_structure
      {
        'plugins_config_version' => '1.0.0',
        'plugins' => [],
      }
    end

    def read_and_validate_data
      @data = JSON.parse(File.read(path))
      validate_data
    rescue JSON::ParserError => e
      raise Inspec::Plugin::V2::ConfigError, "Failed to load plugins JSON configuration from #{path}:\n#{e}"
    end

    def validate_data
      unless @data['plugins_config_version']
        raise Inspec::Plugin::V2::ConfigError, "Missing 'plugins_config_version' entry at #{path} - currently support versions: 1.0.0"
      end

      unless @data['plugins_config_version'] == '1.0.0'
        raise Inspec::Plugin::V2::ConfigError, "Unsupported plugins.json file version #{@data['plugins_config_version']} at #{path} - currently support versions: 1.0.0"
      end

      plugin_entries = @data['plugins']
      if plugin_entries.nil?
        raise Inspec::Plugin::V2::ConfigError, "Malformed plugins.json file at #{path} - missing top-level key named 'plugins', whose value should be an array"
      end

      unless plugin_entries.is_a?(Array)
        raise Inspec::Plugin::V2::ConfigError, "Malformed plugins.json file at #{path} - top-level key named 'plugins' should be an array"
      end

      plugin_entries.each_with_index do |plugin_entry, idx|
        unless plugin_entry.is_a? Hash
          raise Inspec::Plugin::V2::ConfigError, "Malformed plugins.json file - each 'plugins' entry should be a Hash / JSON object at index #{idx}"
        end

        unless plugin_entry.key? 'name'
          raise Inspec::Plugin::V2::ConfigError, "Malformed plugins.json file - 'plugins' entry missing 'name' field at index #{idx}"
        end

        if plugin_entry.key?('installation_type')
          unless %w{gem path}.include? plugin_entry['installation_type']
            raise Inspec::Plugin::V2::ConfigError, "Malformed plugins.json file - 'plugins' entry with unrecognized installation_type (must be one of 'gem' or 'path') at index #{idx}"
          end

          if plugin_entry['installation_type'] == 'path' && !plugin_entry.key?('installation_path')
            raise Inspec::Plugin::V2::ConfigError, "Malformed plugins.json file - 'plugins' entry with a 'path' installation_type missing installation path at index #{idx}"
          end
        end

        # Check for duplicates
        @data['plugins'].each_with_index do |other_entry, other_idx|
          next if idx == other_idx
          next if plugin_entry['name'] != other_entry['name']
          raise Inspec::Plugin::V2::ConfigError, "Malformed plugins.json file - duplicate plugin entry '#{plugin_entry['name']}' detected at index #{idx} and #{other_idx}"
        end
      end
    end

  end
end