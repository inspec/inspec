# encoding: utf-8

require 'pathname'
require_relative 'renderer'

module InspecPlugins
  module Init
    class CLI < Inspec.plugin(2, :cli_command)

      #-------------------------------------------------------------------#
      #                 inspec init plugin
      #-------------------------------------------------------------------#
      desc 'PLUGIN_NAME [options]', 'Generates an InSpec plugin, which can extend the functionality of InSpec itself.'
      def plugin(plugin_name)
        plugin_type = plugin_name.match(/^(inspec|train)\-/)
        unless plugin_type
          ui.error("Plugin names must begin with either " + ui.emphasis('inspec') + ' or ' + ui.emphasis('train') + ' - saw ' + ui.emphasis(plugin_name))
          ui.exit(:usage_error)
        end
      end
    end
  end
end
