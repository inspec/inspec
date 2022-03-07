module InspecPlugins::StreamerBang
  class StreamingReporter < Inspec.plugin(2, :streaming_reporter)
    RSpec::Core::Formatters.register self, :example_passed, :example_failed, :example_pending

    def initialize(output)
      @output = output
    end

    def example_passed(notification) # ExampleNotification
      @output << "!"
    end

    def example_failed(notification) # FailedExampleNotification
      @output << "F"
    end

    def example_pending(notification) # ExampleNotification
      @output << "*"
    end
  end
end
