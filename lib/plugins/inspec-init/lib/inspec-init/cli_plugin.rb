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
      option :author_email, type: :string, default: 'you@example.com', desc: 'Author Email for gemspec'
      option :author_name, type: :string, default: 'Your Name', desc: 'Author Name for gemspec'
      option :description, type: :string, default: '', desc: 'Multi-paragraph description of the plugin.'
      option :summary, type: :string, default: 'A plugin with a default summary', desc: 'One-line summary of your plugin'
      option :license_name, type: :string, default: 'Apache-2.0', desc: 'The name of a license'

      # These vars have calulated defaults
      option :homepage, type: :string, default: '', desc: 'A URL for your project, often a GitHub link'
      option :module_name, type: :string, default: '', desc: 'Module Name for your plugin package.  Will change plugin name to CamelCase by default.'

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
        snake_case = plugin_name.tr('-', '_')

        rename_map = {
          'inspec-plugin-template.gemspec' => plugin_name + '.gemspec',
          File.join('lib', 'inspec-plugin-template') => File.join('lib', plugin_name),
          File.join('lib', 'inspec-plugin-template.rb') => File.join('lib', plugin_name + '.rb'),
          File.join('lib', 'inspec-plugin-template', 'cli_command.rb') => File.join('lib', plugin_name, 'cli_command.rb'),
          File.join('lib', 'inspec-plugin-template', 'plugin.rb') => File.join('lib', plugin_name, 'plugin.rb'),
          File.join('lib', 'inspec-plugin-template', 'version.rb') => File.join('lib', plugin_name, 'version.rb'),
          File.join('test', 'functional', 'inspec_plugin_template_test.rb') => File.join('test', 'functional', snake_case + '_test.rb'),
        }

        render_opts = {
          templates_path: TEMPLATES_PATH,
          overwrite: options[:overwrite],
          file_rename_map: rename_map,
        }
        renderer = InspecPlugins::Init::Renderer.new(ui, render_opts)

        vars = {
          name: plugin_name,
          plugin_name: plugin_name,
          snake_case: snake_case,
        }.merge(plugin_vars_from_opts(plugin_name))

        renderer.render_with_values(template_path, plugin_type + ' plugin', vars)
      end

      private
      def plugin_vars_from_opts(plugin_name)
        {
          module_name: options[:module_name].empty? ? plugin_name.sub(/^(inspec|train)\-/, '').split('-').map(&:capitalize).join('') : options[:module_name],
          author_name: options[:author_name],
          author_email: options[:author_email],
          summary: options[:summary],
          description: options[:description],
          homepage: options[:homepage].empty? ? 'https://github.com/example-org/' + plugin_name : options[:homepage],
          license_name: options[:license_name],
        }
      end
    end
  end
end
