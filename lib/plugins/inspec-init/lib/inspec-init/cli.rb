require "pathname" unless defined?(Pathname)
require_relative "renderer"
require "inspec/feature"

module InspecPlugins
  module Init
    class CLI < Inspec.plugin(2, :cli_command)
      subcommand_desc "init SUBCOMMAND", "Generate InSpec code"

      TEMPLATES_PATH = File.expand_path(File.join(File.dirname(__FILE__), "..", "..", "templates"))

      require_relative "cli_profile"
      require_relative "cli_plugin"
      require_relative "cli_resource"
    end
  end
end
