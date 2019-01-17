module InspecPlugins
  module Compliance
    class Plugin < Inspec.plugin(2)
      plugin_name :'inspec-compliance'

      cli_command :compliance do
        require_relative "inspec-compliance/cli"
        InspecPlugins::Compliance::CLI
      end
    end
  end
end
