# encoding: utf-8

require 'pathname'
require_relative 'renderer'

module InspecPlugins
  module Init
    class CLI < Inspec.plugin(2, :cli_command)
      subcommand_desc 'init SUBCOMMAND', 'Initialize InSpec objects'

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
          renderer = InspecPlugins::Init::Renderer.new(self, options)
          renderer.render_with_values(template_name, name: name_for_new_structure)
        end
      end
    end
  end
end
