# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'forwardable'
require 'yaml'
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

    attr_reader :registry
    def_delegator :registry, :keys, :list

    def initialize()
      determine_plugin_conf_file
      read_conf_file
      append_bundled_plugins
      setup_registry
      # load_known_plugins
    end

    def determine_plugin_conf_file
      # TODO: this assumes we can't read the --config-dir CLI option yet
      @plugin_conf_file_path = ENV['INSPEC_CONFIG_DIR'] ? ENV['INSPEC_CONFIG_DIR'] : File.join(Dir.home, '.inspec')
      @plugin_conf_file_path = File.join(@plugin_conf_file_path, 'plugins.yaml')
    end

    def read_conf_file
      # TODO
    end

    def append_bundled_plugins
      # bundled_dir = File.expand_path(File.dirname(__FILE__))
      # @paths += Dir[File.join(bundled_dir, '..', 'bundles', 'inspec-*.rb')].flatten
    end

    def setup_registry
      # map paths to names
      # @registry = Hash[@paths.map { |x|
      #   [File.basename(x, '.rb'), x]
      # }]
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

      # load bundled plugins
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
  end
end
