require "inspec-streaming-reporter-progress-bar/version"

module InspecPlugins
  module StreamingReporterProgressBar
    class Plugin < ::Inspec.plugin(2)
      plugin_name :"inspec-streaming-reporter-progress-bar"
      streaming_reporter :"progress-bar" do
        require "inspec-streaming-reporter-progress-bar/streaming_reporter"
        InspecPlugins::StreamingReporterProgressBar::StreamingReporter
      end
    end
  end
end
