module InspecPlugins
  module Parallel
    class Plugin < ::Inspec.plugin(2)
      plugin_name :"inspec-parallel"

      cli_command :parallel do
        require_relative "inspec-parallel/cli"
        InspecPlugins::Parallel::CLI
      end
    end
  end
end
