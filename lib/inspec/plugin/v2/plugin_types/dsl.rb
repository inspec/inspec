# All DSL plugin types are defined here.

module Inspec::Plugin::V2::PluginType
  class Dsl < Inspec::Plugin::V2::PluginBase
    register_plugin_type(:outer_profile_dsl)
    register_plugin_type(:control_dsl)
    register_plugin_type(:describe_dsl)
    register_plugin_type(:test_dsl)
    register_plugin_type(:resource_dsl)
  end
end
