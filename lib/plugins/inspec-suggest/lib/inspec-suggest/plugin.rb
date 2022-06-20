require "inspec-suggest/version"
module InspecPlugins
  module Suggest
    class Plugin < ::Inspec.plugin(2)
      plugin_name :"inspec-suggest"

      cli_command :suggest do
        require_relative "cli_command"
        InspecPlugins::Suggest::CliCommand
      end

      # Diagnostic reporter, which summarizes the results of the run.
      reporter :"suggest-debug" do
        require_relative "reporter/debug"
        InspecPlugins::Suggest::Reporter::Debug
      end
    end
  end
end
