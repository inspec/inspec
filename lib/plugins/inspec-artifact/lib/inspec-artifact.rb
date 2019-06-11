module InspecPlugins
  module Artifact
    class Plugin < Inspec.plugin(2)
      plugin_name :'inspec-artifact'

      cli_command :artifact do
        require_relative "inspec-artifact/cli"
        InspecPlugins::Artifact::CLI
      end
    end
  end
end
