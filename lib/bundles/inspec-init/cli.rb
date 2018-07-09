# encoding: utf-8

require 'pathname'

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

    # read template directory
    template_dir = File.join(File.dirname(__FILE__), 'templates')
    Dir.glob(File.join(template_dir, '*')) do |template|
      relative = Pathname.new(template).relative_path_from(Pathname.new(template_dir))

      # register command for the template
      desc "#{relative} NAME", "Create a new #{relative}"
      option :overwrite, type: :boolean, default: false,
        desc: 'Overwrites existing directory'
      define_method relative.to_s.to_sym do |name|
        Init::Profile.generator(relative.to_s, { name: name }, options)
      end
    end
  end

  # register the subcommand to Inspec CLI registry
  Inspec::Plugins::CLI.add_subcommand(Init::CLI, 'init', 'init TEMPLATE ...', 'Scaffolds a new project', {})
end
