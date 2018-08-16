require 'forwardable'
require 'singleton'
require_relative 'status'
require_relative 'activator'

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
      !plugin_statuses.select(&:load_exception).empty?
    end

    def loaded_plugin?(name)
      registry.dig(name, :loaded)
    end

    def loaded_count
      registry.values.select(&:loaded).count
    end

    def known_count
      registry.values.count
    end

    def loaded_plugin_names
      registry.values.select(&:loaded).map(&:name)
    end

    def find_status_by_class(klass)
      registry.values.detect { |status| status.plugin_class == klass }
    end

    # Finds Activators matching criteria (all optional) you specify as a Hash.
    # @param [Symbol] plugin_name Restricts the search to the given plugin
    # @param [Symbol] plugin_type Restricts the search to the given plugin type
    # @param [Symbol] activator_name Name of the activator
    # @returns [Array] Possibly empty array of Activators
    def find_activators(filters = {})
      plugin_statuses.map(&:activators).flatten.select do |act|
        [:plugin_name, :plugin_type, :activator_name].all? do |criteria|
          !filters.key?(criteria) || act[criteria] == filters[criteria]
        end
      end
    end

    def register(name, status)
      if known_plugin? name
        Inspec::Log.warn "PluginLoader: refusing to re-register plugin '#{name}': an existing plugin with that name was loaded via #{existing.installation_type}-loading from #{existing.entry_point}"
      else
        registry[name.to_sym] = status
      end
    end

    alias []= register

    # Provided for test support. Purges the registry.
    def __reset
      @registry.clear
    end
  end
end
