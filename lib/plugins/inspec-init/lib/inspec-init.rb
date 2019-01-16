module InspecPlugins
  module Init
    class Plugin < Inspec.plugin(2)
      plugin_name :'inspec-init'

      cli_command :init do
        require_relative "inspec-init/cli"
        InspecPlugins::Init::CLI
      end
    end
  end
end
