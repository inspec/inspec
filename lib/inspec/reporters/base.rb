module Inspec::Reporters
  class Base
    attr_reader :run_data

    def initialize(config)
      @config = config
      @run_data = config[:run_data]
      apply_options_to_run_data
      @output = ""
    end

    # Apply options such as message truncation and removal of backtraces
    def apply_options_to_run_data
      message_truncation = @config[:message_truncation] || "ALL"
      trunc = -1
      if message_truncation != "ALL"
        if message_truncation.to_i.to_s != message_truncation
          Inspec::Log.warn("Messages will not be truncated because #{message_truncation} is not an integer value")
        else
          trunc = message_truncation.to_i
        end
      end
      include_backtrace = @config[:include_backtrace].nil? ? true : @config[:include_backtrace]

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
