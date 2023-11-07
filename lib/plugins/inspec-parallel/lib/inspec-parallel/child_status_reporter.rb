module InspecPlugins::Parallelism
  class StreamingReporter < Inspec.plugin(2, :streaming_reporter)
    # Registering these methods with RSpec::Core::Formatters class is mandatory
    RSpec::Core::Formatters.register self, :example_passed, :example_failed, :example_pending, :close

    def initialize(output)
      @status_mapping = {}
      @control_counter = 0
      initialize_streaming_reporter
    end

    def example_passed(notification)
      set_example(notification, "passed")
    end

    def example_failed(notification)
      set_example(notification, "failed")
    end

    def example_pending(notification)
      set_example(notification, "skipped")
    end

    def close(notification)
      # HACK: if we've reached the end of the execution, send a special marker, to ease EOF detection on Windows
      puts "EOF_MARKER"
    end

    private

    def set_example(notification, status)
      control_id = notification.example.metadata[:id]
      title = notification.example.metadata[:title]
      set_status_mapping(control_id, status)
      output_status(control_id, title) if control_ended?(notification, control_id)
    end

    def output_status(control_id, title)
      @control_counter += 1
      stat = @status_mapping[control_id]
      stat = if stat.include?("failed")
               "F"
             else
               if stat.include?("skipped")
                 "S"
               else
                 stat.include?("passed") ? "P" : "E"
               end
             end
      display_name = title.gsub(/\n*\s+/, " ").to_s.force_encoding(Encoding::UTF_8) if title
      display_name = control_id.to_s.lstrip.force_encoding(Encoding::UTF_8) unless title

      puts "#{@control_counter}/#{stat}/#{controls_count}/#{display_name}"
    end

    def set_status_mapping(control_id, status)
      @status_mapping[control_id] ||= []
      @status_mapping[control_id].push(status)
    end
  end
end
