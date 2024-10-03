module InspecPlugins
  module AI
    class Plugin < ::Inspec.plugin(2)
      plugin_name :"inspec-ai"
      cli_command :ai do
        require "inspec-ai/cli"
        InspecPlugins::AI::Cli
      end
    end
  end
end
