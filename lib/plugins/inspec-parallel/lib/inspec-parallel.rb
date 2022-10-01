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

      streaming_reporter :"parallel-list" do
        require_relative "inspec-parallel/list_reporter"
        InspecPlugins::Parallelism::ListReporter
      end

    end
  end
end
