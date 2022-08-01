require "inspec/attestations"
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
      @notifications = {}
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
      unless @control_checks_count_map[control_id].nil?
        @control_checks_count_map[control_id] -= 1
        @control_checks_count_map[control_id] == 0
      else
        false
      end
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

    def enhanced_outcomes
      @enhanced_outcomes ||= RSpec.configuration.formatters.grep(Inspec::Formatters::Base).first.enhanced_outcomes
    end

    def add_enhanced_outcomes(control_id)
      if control_has_error(@notifications[control_id])
        "error"
      elsif control_has_impact_zero(@notifications[control_id])
        "not_applicable"
      elsif control_has_all_tests_skipped(@notifications[control_id])
        "not_reviewed"
      elsif control_has_any_tests_failed(@notifications[control_id])
        "failed"
      else
        "passed"
      end
    end

    def control_has_error(notifications)
      notifications.any? do |notification_data|
        notification, _status = notification_data
        !notification.example.exception.nil? && !(notification.example.exception.is_a? RSpec::Expectations::ExpectationNotMetError) && !notification.example.exception.backtrace.nil?
      end
    end

    def control_has_all_tests_skipped(notifications)
      notifications.all? do |notification_data|
        _notification, status = notification_data
        status == "skipped"
      end
    end

    def control_has_any_tests_failed(notifications)
      notifications.any? do |notification_data|
        _notification, status = notification_data
        status == "failed"
      end
    end

    def control_has_impact_zero(notifications)
      notification_data = notifications.first
      notification_impact = notification_data.first.example.metadata[:impact]
      notification_data && !notification_impact.nil? && notification_impact.to_f == 0.0
    end

    def collect_notifications(notification, control_id, status)
      if @notifications[control_id].nil?
        @notifications[control_id] = [[notification, status]]
      else
        @notifications[control_id].push([notification, status])
      end
    end

    def attest_control(notification, control_id, control_outcome)
      status = control_outcome
      attestation_data = read_attestation_file(notification, control_id)
      Inspec::Attestations.attest_streaming_data(attestation_data, status, control_id) unless attestation_data.blank?
    end

    def read_attestation_file(notification, control_id)
      profile_id = notification.example.metadata[:profile_id]
      attestation_files = Inspec::Config.cached.final_options["attestation_file"] if Inspec::Config.cached.respond_to?(:final_options)

      attestation_data_by_profile = Inspec::AttestationFileReader.fetch_attestation_by_profile(profile_id, attestation_files) unless attestation_files.nil?

      return unless attestation_data_by_profile && attestation_data_by_profile[control_id] && attestation_data_by_profile[control_id].is_a?(Hash)

      attestation_data_by_profile[control_id]
    end
  end
end
