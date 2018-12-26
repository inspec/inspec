
require 'utils/deprecation/config_file'
require 'inspec/log'

module Inspec
  module Deprecation
    class Deprecator

      attr_reader :config, :groups

      # This is used only in functional testing
      def self.set_class_test_cfg_io(io)
        @@test_cfg_io = io
      end

      def initialize(opts = {})
        @@test_cfg_io ||= nil
        @config = Inspec::Deprecation::ConfigFile.new(opts[:config_io] || @@test_cfg_io)
        @groups = @config.groups
      end

      def handle_deprecation(group_name, message, opts = {})
        group = groups[group_name.to_sym] # Will be nil if unrecognized group
        annotate_stack_information(opts)
        assembled_message = assemble_message(message, group, group_name, opts)

        action = (group ? group[:action] : :warn) || :warn
        action_method = ('handle_' + action.to_s + '_action').to_sym
        send(action_method, assembled_message, group)
      end

      private

      def annotate_stack_information(opts)
        stack = caller_locations(1,25)

        # Attempt to give a meaningful stack location of the place
        # where the deprecated functionality was used.  This is likely
        # user (profile) code.
        used_at = nil

        # If we are in a profile, call stack will first include RSpec its,
        # then a single call from the profile that originated within a load_with_context.
        used_at ||= stack.detect { |frame| frame.label.include? 'load_with_context' }
        # Any additional heuristics?

        opts[:used_at_stack_frame] = used_at if used_at
      end

      def assemble_message(message, group, group_name, opts)
        prefix = group ? (group.prefix || '') : ''
        suffix = group ? (group.suffix || '') : ''
        suffix += "Additionally, the deprecation message is in an unknown group '#{group_name}'." unless group
        prefix += ' ' unless prefix.empty?
        suffix = ' ' + suffix unless suffix.empty?

        suffix += (' (used at ' + opts[:used_at_stack_frame].path+ ':' + opts[:used_at_stack_frame].lineno.to_s + ')' ) if opts.key?(:used_at_stack_frame)

        'DEPRECATION: ' + prefix + message + suffix
      end

      def called_from_control?
        # Heuristics for determining if the deprecation is coming from within a control
        stack = caller_locations(10,45)

        # Within a control block, that is actually an RSpec:ExampleGroup
        stack.each do |frame|
          return true if frame.path.end_with?('rspec/core/example_group.rb')
        end

        false
      end

      def handle_ignore_action(message, group)
        # Inspec::Log.debug("Ignoring deprecation message from #{opts[:caller][:path]}:#{opts[:caller][:lineno]}" )
      end

      def handle_log_action(message, level, group)
        case level
        when :warn
          Inspec::Log.warn message
        when :error
          Inspec::Log.error message
        end
      end

      def handle_warn_action(message, group)
        handle_log_action(message, :warn, group)
      end

      def handle_error_action(message, group)
        handle_log_action(message, :error, group)
      end


      def handle_fail_control_action(message, group)
        if called_from_control?
          raise Inspec::Exceptions::ResourceFailed.new(message)
        else
          handle_warn_action(message, group)
        end
      end

      def handle_exit_action(message, group)
        handle_error_action(message, group)
        status = (group ? group[:exit_status] : :fatal_deprecation) || :fatal_deprecation
        Inspec::UI.new.exit(status)
      end

    end
  end
end