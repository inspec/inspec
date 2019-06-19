module Inspec::Reporters
  class Base
    attr_reader :run_data

    def initialize(config)
      @config = config
      @run_data = config[:run_data]
      @output = ""
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
