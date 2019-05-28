# Because this is a core plugin, we place the plugin definition here in the entry point.
# This is needed because under core testing, the entry point may be reloaded multiple times,
# and we need plugin registration to properly occur each time.
# More typically, the entry point would just load a plugin definition file.

module InspecPlugins
  module PluginManager
    class Plugin < Inspec.plugin(2)
      plugin_name :'inspec-plugin-manager-cli'

      cli_command :plugin do
        require_relative 'inspec-plugin-manager-cli/cli_command'
        InspecPlugins::PluginManager::CliCommand
      end
    end
  end
end
