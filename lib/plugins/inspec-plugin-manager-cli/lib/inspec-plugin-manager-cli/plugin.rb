module InspecPlugins
  module PluginManager
    class Plugin < Inspec.plugin(2)
      plugin_name :'inspec-plugin-manager-cli'

      cli_command :plugin do
        require_relative "cli"
        InspecPlugins::PluginManager::CliCommand
      end
    end
  end
end
