require 'inspec-test-ui/version'

module InspecPlugins
  module TestUI
    class Plugin < ::Inspec.plugin(2)
      plugin_name :'inspec-test-ui'
      cli_command :testui do
        require 'inspec-test-ui/cli_command'
        InspecPlugins::TestUI::CliCommand
      end
    end
  end
end
