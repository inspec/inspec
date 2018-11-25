# encoding: utf-8

require_relative 'renderer'

module InspecPlugins
  module Init
    class CLI < Inspec.plugin(2, :cli_command)

      #-------------------------------------------------------------------#
      #                 inspec init plugin
      #-------------------------------------------------------------------#
      desc 'PLUGIN_NAME [options]', 'Generates an InSpec plugin, which can extend the functionality of InSpec itself.'
      option :author_email, type: :string, default: 'you@example.com', desc: 'Author Email for gemspec'
      option :author_name, type: :string, default: 'Your Name', desc: 'Author Name for gemspec'
      option :copyright, type: :string, default: '', desc: 'A copyright statement, to be added to LICENSE'
      option :description, type: :string, default: '', desc: 'Multi-paragraph description of the plugin.'
      option :summary, type: :string, default: 'A plugin with a default summary', desc: 'One-line summary of your plugin'
      option :license_name, type: :string, default: 'Apache-2.0', desc: 'The name of a license'
      option :hook, type: :array, default: ['cli_command:my_command'], desc: 'A list of plugin hooks, in the form type1:name1, type2:name2, etc'

      # These vars have calculated defaults
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
          license_text: fetch_license_text(options[:license_name]),
          copyright: options[:copyright],
          activators: options[:activators],
        }.merge(parse_hook_option(options[:hook]))
      end

      def parse_hook_option(raw_option)
        hooks_by_type = {}
        raw_option.each do |entry|
          parts = entry.split(':')
          type = parts.first.to_sym
          name = parts.last
          if hooks_by_type.key?(type)
            ui.error 'Inspec plugin generate can currently only generate one hook of each type'
            ui.exit(:usage_error)
          end
          hooks_by_type[type] = name
        end

        vars = { hooks: hooks_by_type }
        if hooks_by_type.key?(:cli_command)
          vars[:command_name_dashes] = hooks_by_type[:cli_command].tr('_', '-')
          vars[:command_name_snake] = hooks_by_type[:cli_command].tr('-', '_')
        end
        vars
      end

      def fetch_license_text(license_name)
        case license_name
        when 'Apache-2.0'
          return <<~EOL
          Licensed under the Apache License, Version 2.0 (the "License");
          you may not use this file except in compliance with the License.
          You may obtain a copy of the License at

              http://www.apache.org/licenses/LICENSE-2.0

          Unless required by applicable law or agreed to in writing, software
          distributed under the License is distributed on an "AS IS" BASIS,
          WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
          See the License for the specific language governing permissions and
          limitations under the License.

          EOL
        when 'BSD-Modified'
          return <<~EOL

          Modified BSD License

          Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

          1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

          2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

          3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

          THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
          EOL
        else
          ''
        end
      end
    end
  end
end
