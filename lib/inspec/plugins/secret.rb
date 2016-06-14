# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'utils/plugin_registry'

module Inspec
  module Plugins
    class Secret < PluginRegistry::Plugin
      def self.plugin_registry
        Inspec::SecretsBackend
      end
    end
  end
end
