module Inspec::Reporters
  class Base
    attr_reader :run_data

    def initialize(config)
      @config = config
      @run_data = config[:run_data]
      apply_report_resize_options unless @run_data.nil?
      @output = ""
    end

    # Apply options such as message truncation and removal of backtraces
    def apply_report_resize_options
      runtime_config = Inspec::Config.cached.respond_to?(:final_options) ? Inspec::Config.cached.final_options : {}

      message_truncation = runtime_config[:reporter_message_truncation] || "ALL"
      trunc = message_truncation == "ALL" ? -1 : message_truncation.to_i
      include_backtrace = runtime_config[:reporter_backtrace_inclusion].nil? ? true : runtime_config[:reporter_backtrace_inclusion]

      @run_data[:profiles]&.each do |p|
        p[:controls].each do |c|
          c[:results]&.map! do |r|
            r.delete(:backtrace) unless include_backtrace
            if r.key?(:message) && r[:message] != "" && trunc > -1
              r[:message] = r[:message][0...trunc] + "[Truncated to #{trunc} characters]"
            end
            r
          end
        end
      end
    end

    def output(str, newline = true)
      @output << str
      @output << "\n" if newline
    end

    def rendered_output
      @output
    end

    # each reporter must implement #render
    def render
      raise NotImplementedError, "#{self.class} must implement a `#render` method to format its output."
    end
  end
end
