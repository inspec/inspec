# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

class PluginRegistry
  attr_reader :registry

  def initialize
    @registry = {}
  end

  # Resolve a target via available plugins.
  #
  # @param [String] target to resolve
  # @return [Plugin] plugin instance if it can be resolved, nil otherwise
  def resolve(target)
    modules.each do |m|
      res = m.resolve(target)
      return res unless res.nil?
    end
    nil
  end

  private

  # Get all registered plugins sorted by priority, with highest first
  #
  # @return [Array[Plugin]] sorted list of plugins
  def modules
    @registry.values
             .sort_by { |x| x.respond_to?(:priority) ? x.priority : 0 }
             .reverse
  end
end

class PluginRegistry
  class Plugin
    # Retrieve the plugin registry associated with this plugin
    #
    # @return [PluginRegistry] plugin registry for this plugin
    def self.plugin_registry
      raise "Plugin #{self} does not implement `self.plugin_registry()`. This method is required"
    end

    # Register a new plugin by name
    #
    # @param [String] the unique name of this plugin
    # @return [nil] disregard
    def self.name(name)
      raise "Trying to register #{self} with name == nil" if name.nil?
      @name = name
      plugin_registry.registry[name] = self
    end

    # This plugin's priority. Set it by providing the priority as an
    # argument. Higher numbers ensure that the plugin is
    # called early to check if a target belongs to it. When called without
    # an argument, it retrieves this plugin's priority. Defaults to 0.
    #
    # @param [Numeric] Priority as a number. Will only be set if != nil
    # @return [Numeric] This plugin's priority
    def self.priority(x = nil)
      @priority = x unless x.nil?
      @priority || 0
    end

    # Try to resolve the target. If this plugin cannot handle it, the result
    # will be nil. If, however, the plugin can resolve it, the resulting
    # object will be an instance of this plugin. This means, that the interface
    # that this base class provides, is the basis for the returned type.
    #
    # @param [String] target to try to resolve
    # @return [Plugin] instance if it can be resolved, nil otherwise
    def self.resolve(_target)
      raise "Plugin #{self} does not implement `self.resolve(target)`. This method is required"
    end

    # When a plugin's resolve doesn't lead to the final state, it can
    # use this method to hand it back for another resolver to handle.
    #
    # @param [Any] the current target that needs resolving
    # @param [Plugin] an instance of the calling resolver
    # @return [Plugin] instance if it can be resolved, nil otherwise
    def self.resolve_next(target, parent)
      res = plugin_registry.resolve(target)
      res.parent = parent
      res
    end

    attr_reader :target
    attr_accessor :parent
  end
end
