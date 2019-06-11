module InspecPlugins
  module Habitat
    class Plugin < Inspec.plugin(2)
      plugin_name :'inspec-habitat'
      cli_command :habitat do
        require_relative "inspec-habitat/cli"
        InspecPlugins::Habitat::CLI
      end
    end
  end
end
