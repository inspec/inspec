require "inspec-reporter-child-status/version"

module InspecPlugins
  module ReporterChildStatus
    class Plugin < ::Inspec.plugin(2)
      plugin_name :"inspec-reporter-child-status"
      streaming_reporter :"child-status" do
        require "inspec-reporter-child-status/streaming_reporter"
        InspecPlugins::ReporterChildStatus::StreamingReporter
      end
    end
  end
end
