require 'forwardable'
require 'singleton'

module Inspec
  module Plugin
    Status = Struct.new(
      :api_generation,    # 0,1,2 # TODO: convert all bundled (v0) to v2
      :class,             # Plugin class
      :entry_point,       # a gem name or filesystem path
      :installation_type, # :gem, :path, :core, bundle # TODO: combine core and bundle
      :loaded,            # true, false False could mean not attempted or failed
      :load_exception,    # Exception class if it failed to load
      :name,              # String name
      :plugin_type,       # :cli, :transport, TODO: :fetcher, :attribute_provider, :source_reader, :control_dsl?
      :version,           # three-digit version.  Core / bundled plugins use InSpec version here.
    )

    class Registry
      include Singleton
      extend Forwardable

      attr_reader :registry
      def_delegator :registry, :each
      def_delegator :registry, :[]
      def_delegator :registry, :key?, :known_plugin?
      def_delegator :registry, :keys, :plugin_names
      def_delegator :registry, :values, :plugin_statuses
      def_delegator :registry, :select

      def initialize
        @registry = {}
      end

      def any_load_failures?
        !registry.plugin_statuses.select { |status| status.load_exception }.empty?
      end

      def loaded_plugin?(name)
        registry.dig(name, :loaded)
      end

      def loaded_count
        registry.values.select { |status| status.loaded }.count
      end

      def loaded_plugin_names
        registry.values.select { |status| status.loaded }.map(&:name)
      end

      def register(name, status)
        if registry.key? name
          Inspec::Log.warn "PluginLoader: refusing to re-register plugin '#{name}'"
        else
          registry[name.to_sym] = status
        end
      end

      alias :[]= :register

      # Provided for test support. Purges the registry.
      def __reset
        @registry.clear
      end
    end
  end
end