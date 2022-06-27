require "progress_bar"

module InspecPlugins::Suggest
  module Reporter
    # Does not inherit from Base - needs a different superclass
    class Progress < Inspec.plugin(2, :streaming_reporter)

      RSpec::Core::Formatters.register self, :example_passed, :example_failed, :example_pending

      def initialize(output)
        @bar = nil
        initialize_streaming_reporter
      end

      def example_passed(notification)
        set_example(notification)
      end

      def example_failed(notification)
        set_example(notification)
      end

      def example_pending(notification)
        set_example(notification)
      end

      private

      def set_example(notification)
        control_id = notification.example.metadata[:id]
        show_progress(control_id) if control_ended?(control_id)
      end

      def show_progress(control_id)
        @bar ||= ProgressBar.new(controls_count, :bar, :percentage)
        @bar.increment!
      rescue StandardError => e
        raise "Exception in suggest-progress reporter: #{e}"
      end
    end
  end
end
