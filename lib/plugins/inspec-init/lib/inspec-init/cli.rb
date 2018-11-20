# encoding: utf-8

require 'pathname'
require_relative 'renderer'

module InspecPlugins
  module Init
    class CLI < Inspec.plugin(2, :cli_command)
      subcommand_desc 'init SUBCOMMAND', 'Generate InSpec code'

      # require_relative 'cli_profile'
      require_relative 'cli_plugin'
    end
  end
end
