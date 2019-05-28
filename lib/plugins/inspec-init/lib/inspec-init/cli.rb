require 'pathname'
require_relative 'renderer'

module InspecPlugins
  module Init
    class CLI < Inspec.plugin(2, :cli_command)
      subcommand_desc 'init SUBCOMMAND', 'Generate InSpec code'

      TEMPLATES_PATH = File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'templates'))

      require_relative 'cli_profile'
      require_relative 'cli_plugin'
    end
  end
end
