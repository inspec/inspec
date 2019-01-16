module Inspec::Plugin::V2::PluginType
  # Test plugin type
  class Mock < Inspec::Plugin::V2::PluginBase
    register_plugin_type(:mock_plugin_type)

    # This is the API for the mock plugin type: when a mock plugin is
    # activated, it is expected to be able to respond to this, and "do something"
    def mock_hook
      raise NotImplementedError, "Mock plugins must implement mock_hook"
    end
  end
end
