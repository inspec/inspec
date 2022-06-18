require "inspec-suggest/version"
module InspecPlugins
  module Suggest
    class Plugin < ::Inspec.plugin(2)
      plugin_name :"inspec-suggest"

      cli_command :suggest do
        require "inspec-suggest/cli_command"
        InspecPlugins::Suggest::CliCommand
      end
    end
  end
end
