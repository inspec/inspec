require 'forwardable'
require 'singleton'

module Inspec
  module Plugin
    Status = Struct.new(
      :name,
      :version,
      :entry_point,
      :plugin_type,
      :installation_type,
      :installation_status,
      :api_generation,
      :loaded,
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

      def loaded_count
        registry.values.select { |status| status.loaded }.count
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