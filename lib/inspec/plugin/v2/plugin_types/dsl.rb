# All DSL plugin types are defined here.

module Inspec::Plugin::V2::PluginType
  class Dsl < Inspec::Plugin::V2::PluginBase
    # This is a dummy plugin type that you can use
    # for superclassing
    register_plugin_type(:dsl)

    # These are the actual plugintypes used for activation hooks.
    register_plugin_type(:control_dsl)
    register_plugin_type(:describe_dsl)
  end
end
