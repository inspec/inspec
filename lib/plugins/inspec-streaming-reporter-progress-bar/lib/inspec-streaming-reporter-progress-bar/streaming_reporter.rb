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
        "error" => "\033[34m",
        "not_applicable" => "\033[36m",
        "not_reviewed" => "\033[33m",
      }.freeze

      # Most currently available Windows terminals have poor support
      # for UTF-8 characters so use these boring indicators
      INDICATORS = {
        "failed" => "[FAIL]",
        "skipped" => "[SKIP]",
        "passed" => "[PASS]",
        "error" => "  [ERROR]  ",
        "not_applicable" => "  [N/A]    ",
        "not_reviewed" => "  [N/R]    ",
      }.freeze
    else
      # Extended colors for everyone else
      COLORS = {
        "failed" => "\033[38;5;9m",
        "passed" => "\033[38;5;41m",
        "skipped" => "\033[38;5;247m",
        "reset" => "\033[0m",
        "error" => "\033[0;38;5;21m",
        "not_applicable" => "\033[0;38;5;117m",
        "not_reviewed" => "\033[0;38;5;214m",
      }.freeze

      # Groovy UTF-8 characters for everyone else...
      # ...even though they probably only work on Mac
      INDICATORS = {
        "failed" => "× [FAILED] ",
        "skipped" => "↺ [SKIPPED]",
        "passed" => "✔ [PASSED] ",
        "error" => "× [ERROR]  ",
        "not_applicable" => "  [N/A]    ",
        "not_reviewed" => "  [N/R]    ",
      }.freeze
    end

    def initialize(output)
      @bar = nil
      @status_mapping = {}
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

    private

    def set_example(notification, status)
      control_id = notification.example.metadata[:id]
      title = notification.example.metadata[:title]
      full_description = notification.example.metadata[:full_description]

      # No-op exception occurs in case of not_applicable_if
      if (full_description.include? "No-op") && notification.example.exception
        full_description += notification.example.exception.message
      end

      set_status_mapping(control_id, status)
      collect_notifications(notification, control_id, status)
      show_progress(control_id, title, full_description) if control_ended?(notification, control_id)
    end

    def show_progress(control_id, title, full_description)
      @bar ||= ProgressBar.new(controls_count, :bar, :counter, :percentage)
      sleep 0.1
      @bar.increment!
      @bar.puts format_it(control_id, title, full_description)
    rescue StandardError => e
      raise "Exception in Progress Bar streaming reporter: #{e}"
    end

    def format_it(control_id, title, full_description)
      control_outcome = control_outcome(control_id)
      if control_outcome
        control_status = control_outcome
      else
        control_status = if @status_mapping[control_id].include? "failed"
                           "failed"
                         elsif @status_mapping[control_id].include? "passed"
                           "passed"
                         else
                           @status_mapping[control_id].include? "skipped"
                           "skipped"
                         end
      end
      indicator = INDICATORS[control_status]
      message_to_format = format_message(indicator, control_id, title, full_description)
      format_with_color(control_status, message_to_format)
    rescue Exception => e
      raise "Exception in show_progress: #{e}"
    end

    def format_with_color(color_name, text)
      "#{COLORS[color_name]}#{text}#{COLORS["reset"]}"
    rescue StandardError => e
      raise "Exception in format_with_color: #{e}"
    end

    # status mapping with control id to decide the final state of the control
    def set_status_mapping(control_id, status)
      @status_mapping[control_id] = [] if @status_mapping[control_id].nil?
      @status_mapping[control_id].push(status)
    rescue StandardError => e
      raise "Exception in format_with_color: #{e}"
    end

  end
end
