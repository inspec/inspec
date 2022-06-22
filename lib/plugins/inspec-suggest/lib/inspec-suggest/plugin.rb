require "inspec-suggest/version"
module InspecPlugins
  module Suggest
    class Plugin < ::Inspec.plugin(2)
      plugin_name :"inspec-suggest"

      cli_command :"suggest-package" do
        require "inspec-suggest/package_command"
        InspecPlugins::Suggest::PackageCommand
      end

      # Diagnostic reporter, which summarizes the results of the run.
      reporter :"suggest-debug" do
        require_relative "reporter/debug"
        InspecPlugins::Suggest::Reporter::Debug
      end

      # Basic text reporter, shows only matches.
      reporter :"suggest-text" do
        require_relative "reporter/text"
        InspecPlugins::Suggest::Reporter::Text
      end

      # Streaming reporter which gives a progress bar during the run. Intended
      # to be used at the same time as one of the other reporters.
      streaming_reporter :"suggest-progress" do
        require_relative "reporter/progress"
        InspecPlugins::Suggest::Reporter::Progress
      end

    end
  end
end
