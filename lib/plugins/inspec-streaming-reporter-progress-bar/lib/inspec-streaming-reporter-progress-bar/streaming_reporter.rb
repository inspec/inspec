require "progress_bar"
module InspecPlugins::StreamingReporterProgressBar
  # This class will provide the actual Streaming Reporter implementation.
  # Its superclass is provided by another call to Inspec.plugin,
  # this time with two args.  The first arg specifies we are requesting
  # version 2 of the Plugins API.  The second says we are making a
  # Streaming Reporter plugin component, so please make available any DSL needed
  # for that.

  class StreamingReporter < Inspec.plugin(2, :streaming_reporter)
    # Registering these methods with RSpec::Core::Formatters class is mandatory
    RSpec::Core::Formatters.register self, :example_passed, :example_failed, :example_pending

    case RUBY_PLATFORM
    when /windows|mswin|msys|mingw|cygwin/
      # Most currently available Windows terminals have poor support
      # for ANSI extended colors
      COLORS = {
        "failed" => "\033[0;1;31m",
        "passed" => "\033[0;1;32m",
        "skipped" => "\033[0;37m",
        "reset" => "\033[0m",
      }.freeze

      # Most currently available Windows terminals have poor support
      # for UTF-8 characters so use these boring indicators
      INDICATORS = {
        "failed" => "[FAIL]",
        "skipped" => "[SKIP]",
        "passed" => "[PASS]",
      }.freeze
    else
      # Extended colors for everyone else
      COLORS = {
        "failed" => "\033[38;5;9m",
        "passed" => "\033[38;5;41m",
        "skipped" => "\033[38;5;247m",
        "reset" => "\033[0m",
      }.freeze

      # Groovy UTF-8 characters for everyone else...
      # ...even though they probably only work on Mac
      INDICATORS = {
        "failed" => "×",
        "skipped" => "↺",
        "passed" => "✔",
      }.freeze
    end

    def initialize(output)
      @bar = nil
      @status_mapping = {}
      initialize_streaming_reporter
    end

    def example_passed(notification)
      control_id = notification.example.metadata[:id]
      set_status_mapping(control_id, "passed")
      show_progress(control_id) if control_ended?(control_id)
    end

    def example_failed(notification)
      control_id = notification.example.metadata[:id]
      set_status_mapping(control_id, "failed")
      show_progress(control_id) if control_ended?(control_id)
    end

    def example_pending(notification)
      control_id = notification.example.metadata[:id]
      set_status_mapping(control_id, "skipped")
      show_progress(control_id) if control_ended?(control_id)
    end

    private

    def show_progress(control_id)
      @bar ||= ProgressBar.new(controls_count, :bar, :counter, :percentage)
      sleep 0.1
      @bar.increment!
      @bar.puts format_it(control_id)
    rescue Exception => ex
      raise "Exception in Progress Bar streaming reporter: #{ex}"
    end

    def format_it(control_id)
      control_status = if @status_mapping[control_id].include? "failed"
                         "failed"
                       elsif @status_mapping[control_id].include? "skipped"
                         "skipped"
                       elsif @status_mapping[control_id].include? "passed"
                         "passed"
                       end

      indicator = INDICATORS[control_status]
      message_to_format = ""
      message_to_format += "#{indicator}  "
      message_to_format += control_id.to_s.lstrip.force_encoding(Encoding::UTF_8)
      format_with_color(control_status, message_to_format)
    end

    def format_with_color(color_name, text)
      "#{COLORS[color_name]}#{text}#{COLORS["reset"]}"
    end

    # status mapping with control id to decide the final state of the control
    def set_status_mapping(control_id, status)
      @status_mapping[control_id] = [] if @status_mapping[control_id].nil?
      @status_mapping[control_id].push(status)
    end

  end
end
