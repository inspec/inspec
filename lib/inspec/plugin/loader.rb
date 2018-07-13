require 'json'

module Inspec
  module Plugin
    class Loader
      attr_reader :registry, :options

      def initialize(options = {})
        @options = options
        @registry = Plugin::Registry.instance
        @config = {}
        determine_plugin_conf_file
        read_conf_file
        unpack_conf_file
        detect_bundled_plugins unless options[:omit_bundles]
        # TODO: actually load things
      end

      private
      def detect_bundled_plugins
        bundle_dir = File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'bundles'))
        globs = [
          File.join(bundle_dir, 'inspec-*.rb'),
          File.join(bundle_dir, 'train-*.rb')
        ]
        Dir.glob(globs).each do |loader_file|
          name = File.basename(loader_file, '.rb').gsub(/^(inspec|train)-/,'')
          status = Plugin::Status.new
          status.name = name
          status.entry_point = loader_file
          status.installation_type = :core
          status.loaded = false
          registry[name] = status
        end
      end

      def determine_plugin_conf_file
        # TODO: this assumes we can't read the --config-dir CLI option yet
        @plugin_conf_file_path = ENV['INSPEC_CONFIG_DIR'] ? ENV['INSPEC_CONFIG_DIR'] : File.join(Dir.home, '.inspec')
        @plugin_conf_file_path = File.join(@plugin_conf_file_path, 'plugins.json')
      end

      def read_conf_file
        if File.exist?(@plugin_conf_file_path)
          @plugin_file_contents = JSON.parse(File.read(@plugin_conf_file_path))
        else
          @plugin_file_contents = {
            'plugins_config_version' => '1.0.0',
            'plugins' => []
          }
        end
      rescue JSON::ParserError => e
        raise Plugin::ConfigError.new("Failed to load plugins JSON configuration from #{@plugin_conf_file_path}:\n#{e}")
      end

      def unpack_conf_file
        validate_conf_file
        @plugin_file_contents['plugins'].each do |plugin_json|
          status = Status.new
          status.name = plugin_json['name']
          status.loaded = false
          status.installation_type = plugin_json['installation_type'].to_sym
          case status.installation_type
          when :gem
            status.entry_point = status.name
            status.version = plugin_json['version']
          when :path
            status.entry_point = plugin_json['installation_path']
          end

          registry[status.name] = status
        end
      end

      def validate_conf_file
        unless @plugin_file_contents['plugins_config_version'] == '1.0.0'
          raise Plugin::ConfigError.new "Unsupported plugins.json file version #{@plugin_file_contents[:plugins_config_version]} at #{@plugin_conf_file_path} - currently support versions: 1.0.0"
        end

        # TODO: validate config
      end
    end
  end
end