# encoding: utf-8

require 'pathname'
require_relative 'renderer'

module Init
  class CLI < Inspec::BaseCLI
    namespace 'init'

    # TODO: find another solution, once https://github.com/erikhuda/thor/issues/261 is fixed
    def self.banner(command, _namespace = nil, _subcommand = false)
      "#{basename} #{subcommand_prefix} #{command.usage}"
    end

    def self.subcommand_prefix
      namespace
    end

    # Look in the 'template' directory, and register a subcommand
    # for each template directory found there.
    template_dir = File.join(File.dirname(__FILE__), 'templates')
    Dir.glob(File.join(template_dir, '*')) do |template|
      template_name = Pathname.new(template).relative_path_from(Pathname.new(template_dir)).to_s

      # register command for the template
      desc "#{template_name} NAME", "Create a new #{template_name}"
      option :overwrite, type: :boolean, default: false,
        desc: 'Overwrites existing directory'
      define_method template_name.to_sym do |name_for_new_structure|
        renderer = Init::Renderer.new(self, options)
        renderer.render_with_values(template_name, name: name_for_new_structure)
      end
    end
  end

  # register the subcommand to Inspec CLI registry
  Inspec::Plugins::CLI.add_subcommand(Init::CLI, 'init', 'init TEMPLATE ...', 'Scaffolds a new project', {})
end
