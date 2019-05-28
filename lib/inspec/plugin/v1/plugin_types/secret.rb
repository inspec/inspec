require 'inspec/plugin/v1/registry'

module Inspec
  module Plugins
    class Secret < PluginRegistry::Plugin
      def self.plugin_registry
        Inspec::SecretsBackend
      end
    end
  end
end
