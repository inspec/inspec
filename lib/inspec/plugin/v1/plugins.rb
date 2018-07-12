# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'forwardable'
require 'json'
require 'singleton'

module Inspec
  # Resource Plugins
  # NOTE: the autoloading here is rendered moot by the fact that
  # all core plugins are `require`'d by the base inspec.rb
  module Plugins
    autoload :Resource, 'inspec/plugin/v1/plugin_types/resource'
    autoload :CLI, 'inspec/plugin/v1/plugin_types/cli'
    autoload :Fetcher, 'inspec/plugin/v1/plugin_types/fetcher'
    autoload :SourceReader, 'inspec/plugin/v1/plugin_types/source_reader'
    autoload :Secret, 'inspec/plugin/v1/plugin_types/secret'
  end

  class PluginLoader
    extend Forwardable

    attr_reader :registry, :options

    def initialize(options = {})
      @options = options
      @registry = PluginRegistry.instance
      @config = {}
      determine_plugin_conf_file
      read_conf_file
      unpack_conf_file
      detect_bundled_plugins unless options[:omit_bundles]
      # load_known_plugins
    end

    def load(name)
      #   path = @registry[name]
      #   if path.nil?
      #     raise "Couldn't find plugin #{name}. Searching in #{@plugins_dir}"
      #   end
      #   # puts "Loading plugin #{name} from #{path}"
      #   require path
    end

    def load_plugin_type(type)
        # load CLI plugins before the Inspec CLI has been started
        # Inspec::Plugins::CLI.subcommands.each { |_subcommand, params|
        #   Inspec::InspecCLI.register(
        #     params[:klass],
        #     params[:subcommand_name],
        #     params[:usage],
        #     params[:description],
        #     params[:options],
        #   )
        # }
    end

    private
    def detect_bundled_plugins
      bundle_dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'bundles'))
      globs = [
        File.join(bundle_dir, 'inspec-*.rb'),
        File.join(bundle_dir, 'train-*.rb')
      ]
      Dir.glob(globs).each do |loader_file|
        name = File.basename(loader_file, '.rb').gsub(/^(inspec|train)-/,'')
        status = PluginStatus.new
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
      raise PluginException::ConfigError.new("Failed to load plugins JSON configuration from #{@plugin_conf_file_path}:\n#{e}")
    end

    def unpack_conf_file
      validate_conf_file
      @plugin_file_contents['plugins'].each do |plugin_json|
        status = PluginStatus.new
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
        raise PluginException::ConfigError.new "Unsupported plugins.json file version #{@plugin_file_contents[:plugins_config_version]} at #{@plugin_conf_file_path} - currently support versions: 1.0.0"
      end

      # TODO: validate config
    end

    def gem_path_scan
      @paths = []


      # load plugins in the same gem installation using a globscan approach
      # lib_home = File.expand_path(File.join(__FILE__, '..', '..', '..', '..'))
      # @paths += Dir[lib_home + '/inspec-*-*/lib/inspec-*rb']

      # traverse out of inspec-vX.Y.Z/lib/inspec/plugins.rb
      # @plugins_dir = provided_plugins_dir || File.join(Dir.home, '.inspec', 'plugins')
      # @paths += Dir[File.join(@plugins_dir, '**{,/*/**}', '*.gemspec')]
      #           .map { |x| File.dirname(x) }
      #           .map { |x| Dir[File.join(x, 'lib', 'inspec-*.rb')] }
      #           .flatten
    end
  end
end
