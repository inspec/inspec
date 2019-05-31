require_relative 'renderer'

module InspecPlugins
  module Init
    class CLI < Inspec.plugin(2, :cli_command)
      #-------------------------------------------------------------------#
      #                 inspec init plugin
      #-------------------------------------------------------------------#
      desc 'plugin PLUGIN_NAME [options]', 'Generates an InSpec plugin, which can extend the functionality of InSpec itself.'
      # General options
      option :prompt, type: :boolean, default: true, desc: 'Interactively prompt for information to put in your generated plugin.'
      option :detail, type: :string, default: 'full', desc: "How detailed of a plugin to generate. 'full' is a normal full gem with tests; 'core' has tests but no gemspec; 'test-fixture' is stripped down for a test fixture."

      # Templating vars
      option :author_email, type: :string, default: 'you@example.com', desc: 'Author Email for gemspec'
      option :author_name, type: :string, default: 'Your Name', desc: 'Author Name for gemspec'
      option :description, type: :string, default: '', desc: 'Multi-line description of the plugin'
      option :summary, type: :string, default: 'A plugin with a default summary', desc: 'One-line summary of your plugin'
      option :license_name, type: :string, default: 'Apache-2.0', desc: 'The name of a license'
      option :hook, type: :array, default: ['cli_command:my_command'], desc: 'A list of plugin hooks, in the form type1:name1, type2:name2, etc'
      # These vars have calculated defaults
      option :homepage, type: :string, default: nil, desc: 'A URL for your project, often a GitHub link'
      option :module_name, type: :string, default: nil, desc: 'Module Name for your plugin package.  Will change plugin name to CamelCase by default.'
      option :license_text, type: :string, default: '', hide: true
      option :plugin_name, type: :string, default: '', hide: true # This is here to give a uniform interface
      option :copyright, type: :string, default: nil, desc: 'A copyright statement, to be added to LICENSE'

      def plugin(plugin_name)
        plugin_type = determine_plugin_type(plugin_name)
        snake_case = plugin_name.tr('-', '_')

        template_vars = {
          name: plugin_name,
          plugin_name: plugin_name,
          snake_case: snake_case,
        }.merge(plugin_vars_from_opts)

        template_path = File.join('plugins', plugin_type + '-plugin-template')

        render_opts = {
          templates_path: TEMPLATES_PATH,
          overwrite: options[:overwrite],
          file_rename_map: make_rename_map(plugin_type, plugin_name, snake_case),
          skip_files: make_skip_list,
        }
        renderer = InspecPlugins::Init::Renderer.new(ui, render_opts)

        renderer.render_with_values(template_path, plugin_type + ' plugin', template_vars)
      end

      private

      def determine_plugin_type(plugin_name)
        plugin_type = plugin_name.match(/^(inspec|train)\-/)
        unless plugin_type
          ui.error('Plugin names must begin with either ' + ui.emphasis('inspec') + ' or ' + ui.emphasis('train') + ' - saw ' + ui.emphasis(plugin_name))
          ui.exit(:usage_error)
        end
        options[:plugin_name] = plugin_name

        plugin_type = plugin_type[1]
        unless plugin_type == 'inspec'
          ui.error('Sorry, only InSpec (inspec-) plugins are supported at this time: Train (train-) support is not implemented yet.')
          ui.exit(:usage_error)
        end
        plugin_type
      end

      def make_rename_map(_plugin_type, plugin_name, snake_case)
        {
          'inspec-plugin-template.gemspec' => plugin_name + '.gemspec',
          File.join('lib', 'inspec-plugin-template') => File.join('lib', plugin_name),
          File.join('lib', 'inspec-plugin-template.rb') => File.join('lib', plugin_name + '.rb'),
          File.join('lib', 'inspec-plugin-template', 'cli_command.rb') => File.join('lib', plugin_name, 'cli_command.rb'),
          File.join('lib', 'inspec-plugin-template', 'plugin.rb') => File.join('lib', plugin_name, 'plugin.rb'),
          File.join('lib', 'inspec-plugin-template', 'version.rb') => File.join('lib', plugin_name, 'version.rb'),
          File.join('test', 'functional', 'inspec_plugin_template_test.rb') => File.join('test', 'functional', snake_case + '_test.rb'),
        }
      end

      def plugin_vars_from_opts
        # Set dynamic default - module name is straightforward.  Copyright, homepage, and license_text depend on other prompted vars.
        options[:module_name] ||= options[:plugin_name].sub(/^(inspec|train)\-/, '').split('-').map(&:capitalize).join('')

        if options[:prompt] && ui.interactive?
          vars = options.dup.merge(vars_from_prompts)
        elsif !options[:prompt]
          vars = options.dup.merge(vars_from_defaults)

        else
          ui.error('You requested interactive prompting for the template variables, but this does not seem to be an interactive terminal.')
          ui.exit(:usage_error)
        end
        vars.merge(parse_hook_option(options[:hook]))
      end

      def vars_from_defaults
        options[:copyright] ||= 'Copyright © ' + Date.today.year.to_s + ' ' + options[:author_name]
        options[:homepage] ||= 'https://github.com/' + options[:author_email].split('@').first + '/' + options[:plugin_name]
        options[:license_text] = fetch_license_text(options[:license_name])
        options
      end

      def vars_from_prompts
        order = {
          author_name: {},
          author_email: {},
          summary: {},
          description: { mode: :multiline },
          module_name: {},
          copyright: { default_setter: proc { options[:copyright] ||= 'Copyright © ' + Date.today.year.to_s + ' ' + options[:author_name] } },
          license_name: {
            mode: :select,
            choices: [
              { name: 'Apache 2.0', value: 'Apache-2.0', default: true },
              { name: 'Modified BSD', value: 'BSD-3-Clause' },
              { name: 'Proprietary (Closed Source)', value: 'Proprietary' },
              { name: 'Other (edit LICENSE yourself)', value: 'Other' },
            ],
          },
          homepage: { default_setter: proc { options[:homepage] ||= 'https://github.com/' + options[:author_email].split('@').first + '/' + options[:plugin_name] } }
          # TODO: Handle hooks, when we ever have more than one type of plugin
        }

        prompt_for_options(order)

        options[:license_text] = fetch_license_text(options[:license_name])

        options
      end

      def prompt_for_options(option_order) # rubocop: disable Metrics/AbcSize
        option_defs = self.class.all_commands['plugin'].options

        option_order.each do |opt_name, prompt_options|
          opt_def = option_defs[opt_name]
          prompt_options[:default_setter]&.call

          case prompt_options[:mode]
          when :select
            options[opt_name] = ui.prompt.select('Choose ' + opt_def.description + ':', prompt_options[:choices])
            if opt_name == :license_name && options[opt_name] == 'Other'
              ui.plain_line 'OK, be sure to update the ' + ui.emphasis('LICENSE') + ' file with your license details.'
            end
          when :multiline
            options[opt_name] = ui.prompt.multiline('Enter ' + opt_def.description + '. Press Control-D to end.', default: options[opt_name])
          else
            # Assume plain ask
            options[opt_name] = ui.prompt.ask('Enter ' + opt_def.description + ':', default: options[opt_name])
          end
        end
      end

      def parse_hook_option(raw_option)
        hooks_by_type = {}
        raw_option.each do |entry|
          parts = entry.split(':')
          type = parts.first.to_sym
          name = parts.last
          if hooks_by_type.key?(type)
            ui.error 'The InSpec plugin generator can currently only generate one hook of each type'
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
        when 'Proprietary'
          <<~EOL
            Proprietary software.  All Rights Reserved.
          EOL
        when 'Apache-2.0'
          <<~EOL
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
        when 'BSD-3-Clause'
          <<~EOL
            Modified BSD License
            Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
            1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
            2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
            3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
            THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
          EOL
        else
          '"Other" license selected at plugin generation time - please insert your license here.'
        end
      end

      def make_skip_list
        case options[:detail]
        when 'full'
          []
        when 'core'
          [
            'Gemfile',
            'inspec-plugin-template.gemspec',
            'LICENSE',
            'Rakefile',
          ]
        when 'test-fixture'
          [
            'Gemfile',
            'inspec-plugin-template.gemspec',
            'LICENSE',
            'Rakefile',
            File.join('test', 'fixtures', 'README.md'),
            File.join('test', 'fixtures'),
            File.join('test', 'functional', 'inspec_plugin_template_test.rb'),
            File.join('test', 'functional', 'README.md'),
            File.join('test', 'unit', 'cli_args_test.rb'),
            File.join('test', 'unit', 'plugin_def_test.rb'),
            File.join('test', 'unit', 'README.md'),
            File.join('test', 'unit'),
            File.join('test', 'helper.rb'),
            File.join('test'),
          ]
        else
          ui.error "Unrecognized value for 'detail': #{options[:detail]} - expected one of full, core, test-fixture"
          ui.exit(:usage_error)
        end
      end
    end
  end
end
