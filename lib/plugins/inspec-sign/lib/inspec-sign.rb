module InspecPlugins
  module Sign
    class Plugin < Inspec.plugin(2)
      plugin_name :'inspec-sign'

      cli_command :sign do
        require_relative "inspec-sign/cli"
        InspecPlugins::Sign::CLI
      end
    end
  end
end
