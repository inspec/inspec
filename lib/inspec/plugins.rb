# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'forwardable'

module Inspec
  module Plugins
    autoload :Resource, 'inspec/plugins/resource'
  end

  class PluginCtl
    extend Forwardable

    attr_reader :registry
    def_delegator :registry, :keys, :list

    def initialize(home = nil)
      @home = home || File.join(Dir.home, '.inspec', 'plugins')
      @paths = Dir[File.join(@home, '**{,/*/**}', '*.gemspec')]
               .map { |x| File.dirname(x) }
               .map { |x| Dir[File.join(x, 'lib', 'inspec-*.rb')] }
               .flatten
      # map paths to names
      @registry = Hash[@paths.map { |x|
        [File.basename(x, '.rb'), x]
      }]
    end

    def load(name)
      path = @registry[name]
      if path.nil?
        fail "Couldn't find plugin #{name}. Searching in #{@home}"
      end
      puts "Loading plugin #{name} from #{path}"
      require path
    end
  end
end

# Load all plugins on startup
ctl = Inspec::PluginCtl.new
ctl.list.each { |x| ctl.load(x) }
