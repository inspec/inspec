require 'forwardable'
require 'singleton'
require_relative 'status'

module Inspec::Plugin::V2
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