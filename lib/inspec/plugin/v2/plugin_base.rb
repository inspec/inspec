
module Inspec::Plugin::V2
  # Base class for all plugins.  Specific plugins should inherit from a subclass of this. eg CliPLugin
  class PluginBase
    # rubocop: disable Style/ClassVars
    @@plugin_type_classes = {}
    # rubocop: enable Style/ClassVars

    #=====================================================================#
    #                         Management Methods
    #=====================================================================#

    # The global registry.
    # @returns [Inspec::Plugin::V2::Registry] the singleton Plugin Registry object.
    def self.registry
      Inspec::Plugin::V2::Registry.instance
    end

    # Inform the plugin system of a new plgin type.
    # This has the following effects:
    #  * enables Inspec.plugin(2, :your_type_here) to return the plugin
    #    type base class
    #  * defines the DSL method with the same name as the plugin type.
    #
    # @ param [Symbol] plugin_type_name
    def self.register_plugin_type(plugin_type_name)
      new_dsl_method_name = plugin_type_name
      new_plugin_type_base_class = self

      # This lets the Inspec.plugin(2,:your_plugin) work
      @@plugin_type_classes[plugin_type_name] = new_plugin_type_base_class

      # This part defines the DSL command to register a concrete plugin's implementation of a plugin type
      Inspec::Plugin::V2::PluginBase.define_singleton_method(new_dsl_method_name) do |hook_name, &hook_body|
        plugin_concrete_class = self

        # Verify class is registered (i.e. plugin_name has been called)
        status = registry.find_status_by_class(plugin_concrete_class)
        if status.nil?
          raise Inspec::Plugin::V2::LoadError, "You must call 'plugin_name' prior to calling #{plugin_type_name} for plugin class #{plugin_concrete_class}"
        end

        # Construct the Activator record
        activator = Inspec::Plugin::V2::Activator.new
        activator.plugin_name = plugin_concrete_class.plugin_name
        activator.plugin_type = plugin_type_name
        activator.activator_name = hook_name.to_sym
        activator.activation_proc = hook_body

        status.activators << activator
      end
    end

    # Determine the base class for a given plugin type
    # @param [Symbol] plugin_type_name
    # @returns [Class] the plugin type base class
    def self.base_class_for_type(plugin_type_name)
      @@plugin_type_classes[plugin_type_name]
    end

    #=====================================================================#
    #                           DSL Methods
    #=====================================================================#

    # If no name provided, looks up a known plugin by class and returns the name.
    #
    # DSL method to declare a plugin.  Once this has been called, the plugin will certainly be
    # registered (known) with the Registry, and is eligible to be activated.
    # This mainly handles status annotation.
    #
    # @param [Symbol] Name of the plugin.  If a string is provided, it is converted to a Symbol.
    # @returns [Symbol] Name of the plugin
    def self.plugin_name(name = nil)
      reg = Inspec::Plugin::V2::Registry.instance
      return reg.find_status_by_class(self).name if name.nil?

      name = name.to_sym

      # Typically our status will already exist in the registry, from loading the
      # plugin.json. If we're being loaded, presumably entry_point,
      # installation_type, version
      # are known.
      unless reg.known_plugin?(name)
        # Under some testing situations, we may not pre-exist.
        status = Inspec::Plugin::V2::Status.new
        reg.register(name, status)
        status.entry_point = 'inline'
        status.installation_type = :mock_inline
      end

      status = reg[name]
      status.api_generation = 2
      status.plugin_class = self
      status.name = name

      name
    end
  end
end
