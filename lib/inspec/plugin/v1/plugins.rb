require 'forwardable'

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

  # PLEASE NOTE: The Plugin system is an internal mechanism for connecting
  # inspec components. Its API is currently considered in an alpha state
  # and may change between minor version revisions. A stable plugin API will be
  # released in the future.
  class PluginCtl
    extend Forwardable

    attr_reader :registry
    def_delegator :registry, :keys, :list

    def initialize(home = nil)
      @paths = []

      # load plugins in the same gem installation
      lib_home = File.expand_path(File.join(__FILE__, '..', '..', '..', '..'))
      @paths += Dir[lib_home+'/inspec-*-*/lib/inspec-*rb']

      # traverse out of inspec-vX.Y.Z/lib/inspec/plugins.rb
      @home = home || File.join(Inspec.config_dir, 'plugins')
      @paths += Dir[File.join(@home, '**{,/*/**}', '*.gemspec')]
                .map { |x| File.dirname(x) }
                .map { |x| Dir[File.join(x, 'lib', 'inspec-*.rb')] }
                .flatten

      # load bundled plugins
      bundled_dir = File.expand_path(File.dirname(__FILE__))
      @paths += Dir[File.join(bundled_dir, '..', 'bundles', 'inspec-*.rb')].flatten

      # map paths to names
      @registry = Hash[@paths.map { |x|
        [File.basename(x, '.rb'), x]
      }]
    end

    def load(name)
      path = @registry[name]
      if path.nil?
        raise "Couldn't find plugin #{name}. Searching in #{@home}"
      end
      # puts "Loading plugin #{name} from #{path}"
      require path
    end
  end
end
