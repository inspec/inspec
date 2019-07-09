require "json"

module Inspec::Plugin::V2
  # Represents the plugin config file on disk.
  class ConfigFile
    include Enumerable

    attr_reader :path

    def initialize(path = nil)
      @path = path || self.class.default_path
      @data = blank_structure

      read_and_validate_file if File.exist?(@path)
    end

    # Returns the defaut path for a config file.
    # This respects ENV['INSPEC_CONFIG_DIR'].
    def self.default_path
      File.join(Inspec.config_dir, "plugins.json")
    end

    # Implement Enumerable. All Enumerable methds act
    # on the plugins list, and yield Hashes that represent
    # an entry.
    def each(&block)
      @data[:plugins].each(&block)
    end

    # Look for a plugin by name.
    def plugin_by_name(name)
      detect { |entry| entry[:name] == name.to_sym }
    end

    # Check for a plugin
    def existing_entry?(name)
      !plugin_by_name(name).nil?
    end

    # Add an entry with full validation.
    def add_entry(proposed_entry)
      unless proposed_entry.keys.all? { |field| field.is_a? Symbol }
        raise Inspec::Plugin::V2::ConfigError, "All keys to ConfigFile#add_entry must be symbols"
      end

      validate_entry(proposed_entry)

      if existing_entry?(proposed_entry[:name])
        raise Inspec::Plugin::V2::ConfigError, "Duplicate plugin name in call to ConfigFile#add_entry: '#{proposed_entry[:name]}'"
      end

      @data[:plugins] << proposed_entry
    end

    # Removes an entry specified by plugin name.
    def remove_entry(name)
      unless existing_entry?(name)
        raise Inspec::Plugin::V2::ConfigError, "No such entry with plugin name '#{name}'"
      end

      @data[:plugins].delete_if { |entry| entry[:name] == name.to_sym }
    end

    # Save the file to disk as a JSON structure at the path.
    def save
      dir = File.dirname(path)
      FileUtils.mkdir_p(dir)
      File.write(path, JSON.pretty_generate(@data))
    end

    private

    def blank_structure
      {
        plugins_config_version: "1.0.0",
        plugins: [],
      }
    end

    def read_and_validate_file
      @data = JSON.parse(File.read(path), symbolize_names: true)
      validate_file
    rescue JSON::ParserError => e
      raise Inspec::Plugin::V2::ConfigError, "Failed to load plugins JSON configuration from #{path}:\n#{e}"
    end

    def validate_file # rubocop: disable Metrics/AbcSize
      unless @data[:plugins_config_version]
        raise Inspec::Plugin::V2::ConfigError, "Missing 'plugins_config_version' entry at #{path} - currently support versions: 1.0.0"
      end

      unless @data[:plugins_config_version] == "1.0.0"
        raise Inspec::Plugin::V2::ConfigError, "Unsupported plugins.json file version #{@data[:plugins_config_version]} at #{path} - currently support versions: 1.0.0"
      end

      plugin_entries = @data[:plugins]
      if plugin_entries.nil?
        raise Inspec::Plugin::V2::ConfigError, "Malformed plugins.json file at #{path} - missing top-level key named 'plugins', whose value should be an array"
      end

      unless plugin_entries.is_a?(Array)
        raise Inspec::Plugin::V2::ConfigError, "Malformed plugins.json file at #{path} - top-level key named 'plugins' should be an array"
      end

      plugin_entries.each_with_index do |plugin_entry, idx|
        begin
          validate_entry(plugin_entry)
        rescue Inspec::Plugin::V2::ConfigError => ex
          # append some context to the message
          raise Inspec::Plugin::V2::ConfigError, "Malformed plugins.json file - " + ex.message + " at index #{idx}"
        end

        # Check for duplicates
        plugin_entries.each_with_index do |other_entry, other_idx|
          next if idx == other_idx
          next unless other_entry.is_a? Hash # We'll catch that invalid entry later
          next if plugin_entry[:name] != other_entry[:name]

          indices = [idx, other_idx].sort
          raise Inspec::Plugin::V2::ConfigError, "Malformed plugins.json file - duplicate plugin entry '#{plugin_entry[:name]}' detected at index #{indices[0]} and #{indices[1]}"
        end
      end
    end

    def validate_entry(plugin_entry)
      unless plugin_entry.is_a? Hash
        raise Inspec::Plugin::V2::ConfigError, "each 'plugins' entry should be a Hash / JSON object"
      end

      unless plugin_entry.key? :name
        raise Inspec::Plugin::V2::ConfigError, "'plugins' entry missing 'name' field"
      end

      # Symbolize the name.
      plugin_entry[:name] = plugin_entry[:name].to_sym

      if plugin_entry.key? :installation_type
        seen_type = plugin_entry[:installation_type]
        unless %i{gem path}.include? seen_type.to_sym
          raise Inspec::Plugin::V2::ConfigError, "'plugins' entry with unrecognized installation_type (must be one of 'gem' or 'path')"
        end

        plugin_entry[:installation_type] = seen_type.to_sym

        if plugin_entry[:installation_type] == :path && !plugin_entry.key?(:installation_path)
          raise Inspec::Plugin::V2::ConfigError, "'plugins' entry with a 'path' installation_type missing installation path"
        end
      end
    end
  end
end
