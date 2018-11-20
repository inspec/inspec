# encoding: utf-8

require_relative 'renderer'
require 'byebug'

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

        plugin_type = plugin_type[1]
        unless plugin_type == 'inspec'
          ui.error('Sorry, only inspec plugins are supported at this time: train support is not implemented yet.')
          ui.exit(:usage_error)
        end

        template_path = File.join('plugins', plugin_type + '-plugin-template')

        render_opts = {
          templates_path: TEMPLATES_PATH,
          overwrite: options[:overwrite],
        }
        renderer = InspecPlugins::Init::Renderer.new(ui, render_opts)

        vars = {
          name: plugin_name,
          camel_case: plugin_name.sub(/^(inspec|train)\-/, '').split('-').map(&:capitalize).join(''),
          snake_case: plugin_name.tr('-', '_')
        }
        renderer.render_with_values(template_path, plugin_type + ' plugin', vars)
      end
    end
  end
end
