require_relative "../../../run_data"

module Inspec::Plugin::V2::PluginType
  class Reporter < Inspec::Plugin::V2::PluginBase
    register_plugin_type(:reporter)

    attr_reader :run_data

    def initialize(config)
      @config = config

      # Trim the run_data while still a Hash; if it is huge, this
      # saves on conversion time
      @run_data = config[:run_data] || {}
      apply_report_resize_options

      unless Inspec::RunData.compatible_schema?(self.class.run_data_schema_constraints)
        # Best we can do is warn here, the InSpec run has finished
        # TODO: one day, perhaps switch RunData implementations to try to satisfy constraints?
        Inspec::Log.warn "Reporter does not support RunData API (#{Inspec::RunData::SCHEMA_VERSION}), Reporter constraints: '#{self.class.run_data_schema_constraints}'"
      end
      # Convert to RunData object for consumption by Reporter
      @run_data = Inspec::RunData.new(@run_data)
      @output = ""
    end

    # This is a temporary duplication of code from lib/inspec/reporters/base.rb
    # To be DRY'd up once the core reporters become plugins...
    # Apply options such as message truncation and removal of backtraces
    def apply_report_resize_options
      runtime_config = Inspec::Config.cached.respond_to?(:final_options) ? Inspec::Config.cached.final_options : {}

      message_truncation = runtime_config[:reporter_message_truncation] || "ALL"
      @trunc = message_truncation == "ALL" ? -1 : message_truncation.to_i
      include_backtrace = runtime_config[:reporter_backtrace_inclusion].nil? ? true : runtime_config[:reporter_backtrace_inclusion]

      @run_data[:profiles]&.each do |p|
        p[:controls].each do |c|
          c[:results]&.map! do |r|
            r.delete(:backtrace) unless include_backtrace
            process_message_truncation(r)
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

    def self.run_data_schema_constraints
      raise NotImplementedError, "#{self.class} must implement a `run_data_schema_constraints` class method to declare its compatibiltity with the RunData API."
    end

    private

    def process_message_truncation(result)
      if result.key?(:message) && result[:message] != "" && @trunc > -1 && result[:message].length > @trunc
        result[:message] = result[:message][0...@trunc] + "[Truncated to #{@trunc} characters]"
      end
      result
    end
  end
end
