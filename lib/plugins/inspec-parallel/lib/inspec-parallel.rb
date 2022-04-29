module InspecPlugins
  module Parallelism
    class Plugin < ::Inspec.plugin(2)
      plugin_name :"inspec-parallel"

      cli_command :parallel do
        require_relative "inspec-parallel/cli"
        InspecPlugins::Parallelism::CLI
      end

      streaming_reporter :"child-status" do
        require_relative "inspec-parallel/child_status_reporter"
        InspecPlugins::Parallelism::StreamingReporter
      end

    end
  end
end
