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

      # Templating vars
      option :supports_platform, type: :string, default: "linux", desc: "the platform supported by this resource"
      option :description, type: :string, default: "Resource description ...", desc: "the description of this resource"
      option :class_name, type: :string, default: "MyCustomResource", desc: "Class Name for your resource."
      option :path, type: :string, default: ".", desc: "Subdirectory under which to create files"

      # Wishlist:
      #  Make make_rename_map dynamic:
      #   + Add a --path option which defaults to ., which will create the tree under that path
      #   - Add a --core option which changes all the tree to act as placing the files in core inspec (lib/inspec/resources, docs-chef-io/)
      #   - Add a --plural option which changes the templates to use a set of Filtertable based templates
      #   - Add a --inherit option which provides a template for inheriting from the core resources
      #   - Add options which read from a totally different set of templates (AWS for example)
      #  + Generate properties and matchers:
      #   + generate a has_bells? matcher => it { should have_bells }
      #   + generate a is_purple? matcher => it { should be_purple }
      #   + generate a shoe_size => its('shoe_size') { should cmp 10 }
      #  Generate functional tests for above proerties and matchers:
      #  Generate unit tests for above properties and matchers
      #  + Generate docs for properties and matchers
      #  + Add --overwrite option

      def resource(resource_name)
        resource_vars_from_opts
        template_vars = {
          name: options[:path], # This is used for the path prefix
          resource_name: resource_name,
        }
        template_vars.merge!(options)
        template_path = "resources"

        render_opts = {
          templates_path: TEMPLATES_PATH,
          overwrite: options[:overwrite],
          file_rename_map: make_rename_map(template_vars),
        }
        renderer = InspecPlugins::Init::Renderer.new(ui, render_opts)
        renderer.render_with_values(template_path, "resource", template_vars)
      end

      private

      def make_rename_map(vars)
        {
          File.join("libraries", "inspec-resource-template.erb") => File.join("libraries", vars[:resource_name] + ".rb"),
          File.join("docs", "resource-doc.erb") => File.join("docs", vars[:resource_name] + ".md"),
          File.join("tests", "functional", "inspec-resource-test-template.erb") => File.join("tests", "functional", vars[:resource_name] + "_test.rb"),
          File.join("tests", "unit", "inspec-resource-test-template.erb") => File.join("tests", "unit", vars[:resource_name] + "_test.rb"),
        }
      end

      def resource_vars_from_opts
        if options[:prompt] && ui.interactive?
          options.dup.merge(prompt_for_options)
        elsif !options[:prompt]
          # Nothing to do - unless we need to calculate dynamic defaults in the future
        else
          ui.error("You requested interactive prompting for the template variables, but this does not seem to be an interactive terminal.")
          ui.exit(:usage_error)
        end
      end

      def prompt_for_options # rubocop: disable Metrics/AbcSize
        option_defs = self.class.all_commands["resource"].options
        options_order = {
          path: {},
          supports_platform: {},
          description: {},
          class_name: {},
        }

        options_order.each do |opt_name, _|
          opt_def = option_defs[opt_name]
          options[opt_name] = ui.prompt.ask("Enter " + opt_def.description + ":", default: options[opt_name])
        end
      end
    end
  end
end
