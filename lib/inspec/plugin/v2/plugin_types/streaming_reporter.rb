module Inspec::Plugin::V2::PluginType
  class StreamingReporter < Inspec::Plugin::V2::PluginBase
    register_plugin_type(:streaming_reporter)

    #====================================================================#
    #                StreamingReporter plugin type API
    #====================================================================#
    # Implementation classes must implement these methods.

    def initialize_streaming_reporter
      @running_controls_list = []
      @control_checks_count_map = {}
      @controls_count = nil
    end

    private

    # method to identify when the control started running
    # this will be useful in executing operations on control's level start
    def control_started?(control_id)
      if @running_controls_list.include? control_id
        false
      else
        @running_controls_list.push(control_id)
        true
      end
    end

    # method to identify when the control ended running
    # this will be useful in executing operations on control's level end
    def control_ended?(control_id)
      set_control_checks_count_map_value
      @control_checks_count_map[control_id] -= 1
      @control_checks_count_map[control_id] == 0
    end

    # method to identify total no. of controls
    def controls_count
      @controls_count ||= RSpec.configuration.formatters.grep(Inspec::Formatters::Base).first.get_controls_count
    end

    # this method is used in the logic of determining end of control
    def set_control_checks_count_map_value
      if @control_checks_count_map.empty?
        @control_checks_count_map = RSpec.configuration.formatters.grep(Inspec::Formatters::Base).first.get_control_checks_count_map
      end
    end
  end
end
