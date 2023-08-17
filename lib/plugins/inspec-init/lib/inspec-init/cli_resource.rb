require_relative "renderer"

module InspecPlugins
  module Init
    class CLI < Inspec.plugin(2, :cli_command)
      #-------------------------------------------------------------------#
      #                 inspec init resource
      #-------------------------------------------------------------------#
      desc "resource RESOURCE_NAME [options]", "Generates an InSpec resource, which can extend the scope of InSpec resources support"
      # General options
      option :prompt, type: :boolean, default: true, desc: "Interactively prompt for information to put in your generated resource."
      option :overwrite, type: :boolean, default: false, desc: "Overwrite existing files"
      option :layout, type: :string, default: "resource-pack", desc: "File layout, either 'resource-pack' or 'core'"
      option :template, type: :string, default: "basic", desc: "Which type of resource template to use"

      # Templating vars
      option :supports_platform, type: :string, default: "linux", desc: "the platform supported by this resource"
      option :description, type: :string, default: "Resource description ...", desc: "the description of this resource"
      option :class_name, type: :string, default: "MyCustomResource", desc: "Class Name for your resource."
      option :path, type: :string, default: ".", desc: "Subdirectory under which to create files"

      # Wishlist:
      #  Make make_rename_map_resource dynamic:
      #   + Add a --path option which defaults to ., which will create the tree under that path
      #   + Add a --layout option which changes all the tree to act as placing the files in core inspec (lib/inspec/resources, docs-chef-io/)
      #   - Add a --template=plural option which changes the templates to use a set of Filtertable based templates
      #   - Add a --template=inherit option which provides a template for inheriting from the core resources
      #   - Add a template=aws
      #  + Generate properties and matchers:
      #   + generate a has_bells? matcher => it { should have_bells }
      #   + generate a is_purple? matcher => it { should be_purple }
      #   + generate a shoe_size => its('shoe_size') { should cmp 10 }
      #  + Generate unit tests for above properties and matchers
      #  + Generate docs for properties and matchers
      #  + Add --overwrite option

      def resource(resource_name)
        Inspec.with_feature("inspec-cli-init-resource") {
          resource_vars_from_opts_resource
          template_vars = {
            name: options[:path], # This is used for the path prefix
            resource_name: resource_name,
          }
          template_vars.merge!(options)
          template_path = File.join("resources", template_vars["template"])

          render_opts = {
            templates_path: TEMPLATES_PATH,
            overwrite: options[:overwrite],
            file_rename_map: make_rename_map_resource(template_vars),
          }
          renderer = InspecPlugins::Init::Renderer.new(ui, render_opts)
          renderer.render_with_values(template_path, "resource", template_vars)
        }
      end

      private

      def make_rename_map_resource(vars)
        if vars["layout"] == "resource-pack"
          {
            File.join("libraries", "inspec-resource-template.erb") => File.join("libraries", vars[:resource_name] + ".rb"),
            File.join("docs", "resource-doc.erb") => File.join("docs", vars[:resource_name] + ".md"),
            File.join("test", "unit", "inspec-resource-test-template.erb") => File.join("test", "unit", vars[:resource_name] + "_test.rb"),
          }
        elsif vars["layout"] == "core"
          {
            File.join("libraries", "inspec-resource-template.erb") => File.join("lib", "inspec", "resources", vars[:resource_name] + ".rb"),
            File.join("docs", "resource-doc.erb") => File.join("docs-chef-io", "content", "inspec", "resources", vars[:resource_name] + ".md"),
            File.join("test", "unit", "inspec-resource-test-template.erb") => File.join("test", "unit", "resources", vars[:resource_name] + "_test.rb"),
          }
        else
          ui.error("Unrecognized value for 'layout' - please enter either 'resource-pack' or 'core'")
          ui.exit(:usage_error)
        end
      end

      def resource_vars_from_opts_resource
        if options[:prompt] && ui.interactive?
          options.dup.merge(prompt_for_options_resource)
        elsif !options[:prompt]
          # Nothing to do - unless we need to calculate dynamic defaults in the future
        else
          ui.error("You requested interactive prompting for the template variables, but this does not seem to be an interactive terminal.")
          ui.exit(:usage_error)
        end
      end

      def prompt_for_options_resource # rubocop: disable Metrics/AbcSize
        option_defs = self.class.all_commands["resource"].options
        options_order = {
          path: {},
          layout: {
            mode: :select,
            choices: [
              { name: "Resource Pack", value: "resource-pack", default: true },
              { name: "InSpec Core", value: "core" },
            ],
          },
          template: {
            mode: :select,
            choices: [
              { name: "Basic", value: "basic", default: true },
              { name: "Plural", value: "plural" },
            ],
          },
          supports_platform: {},
          description: {},
          class_name: {},
        }

        options_order.each do |opt_name, prompt_options|
          opt_def = option_defs[opt_name]

          case prompt_options[:mode]
          when :select
            options[opt_name] = ui.prompt.select("Choose " + opt_def.description + ":", prompt_options[:choices])
          when :multiline
            options[opt_name] = ui.prompt.multiline("Enter " + opt_def.description + ". Press Control-D to end.", default: options[opt_name])
          else
            # Assume plain ask
            options[opt_name] = ui.prompt.ask("Enter " + opt_def.description + ":", default: options[opt_name])
          end
        end
      end
    end
  end
end
