require 'inspec/utils/deprecation/config_file'
require 'inspec/log'

module Inspec
  module Deprecation
    class Deprecator
      attr_reader :config, :groups

      def initialize(opts = {})
        @config = Inspec::Deprecation::ConfigFile.new(opts[:config_io])
        @groups = @config.groups
      end

      def handle_deprecation(group_name, message, opts = {})
        group = groups[group_name.to_sym] || create_group_entry_for_unknown_group(group_name)
        annotate_stack_information(opts)
        assembled_message = assemble_message(message, group, opts)

        action = group[:action] || :warn
        action_method = ('handle_' + action.to_s + '_action').to_sym
        send(action_method, group_name.to_sym, assembled_message, group)
      end

      private

      def create_group_entry_for_unknown_group(group_name)
        group = ConfigFile::GroupEntry.new
        group.name = group_name
        group.action = config.unknown_group_action
        group.suffix = "Additionally, the deprecation message is in an unknown group '#{group_name}'."
        group
      end

      def annotate_stack_information(opts)
        stack = caller_locations(1, 25)

        # Attempt to give a meaningful stack location of the place
        # where the deprecated functionality was used.  This is likely
        # user (profile) code.
        used_at = nil

        # If we are in a profile, call stack will first include RSpec its,
        # then a single call from the profile that originated within a load_with_context.
        # rspec-core surrounds these.

        # First, purge the deprecation system frames
        stack.reject! { |frame| frame.path && frame.path =~ %r{lib/inspec/utils/deprecation} }
        # Next, purge all RSpec entries (at least rspec-core, rspec-support, rspec-its).
        stack.reject! { |frame| frame.path && frame.path =~ %r{rspec-.+/lib/rspec}  }
        # Now look for the frame that includes load_with_context.
        used_at ||= stack.detect { |frame| frame.label.include? 'load_with_context' }

        opts[:used_at_stack_frame] = used_at if used_at
      end

      def assemble_message(message, group, opts)
        prefix = group.prefix || ''
        suffix = group.suffix || ''
        prefix += ' ' unless prefix.empty?
        suffix = ' ' + suffix unless suffix.empty?

        suffix += (' (used at ' + opts[:used_at_stack_frame].path+ ':' + opts[:used_at_stack_frame].lineno.to_s + ')') if opts.key?(:used_at_stack_frame)

        'DEPRECATION: ' + prefix + message + suffix
      end

      def called_from_control?
        # Heuristics for determining if the deprecation is coming from within a control
        stack = caller_locations(10, 45)

        # Within a control block, that is actually an RSpec:ExampleGroup
        stack.each do |frame|
          return true if frame.path.end_with?('rspec/core/example_group.rb')
        end

        false
      end

      # Unused args needed for unit test deprecation harness
      def handle_ignore_action(_group_name, message, _group)
        handle_log_action(message, :debug)
      end

      def handle_log_action(message, level)
        case level
        when :debug
          Inspec::Log.debug message
        when :warn
          Inspec::Log.warn message
        when :error
          Inspec::Log.error message
        end
      end

      def handle_warn_action(_group_name, message, _group)
        handle_log_action(message, :warn)
      end

      def handle_error_action(_group_name, message, _group)
        handle_log_action(message, :error)
      end

      def handle_fail_control_action(group_name, message, group)
        if called_from_control?
          raise Inspec::Exceptions::ResourceFailed, message
        else
          handle_warn_action(group_name, message, group)
        end
      end

      def handle_exit_action(group_name, message, group)
        handle_error_action(group_name, message, group)
        status = group[:exit_status] || :fatal_deprecation
        Inspec::UI.new.exit(status)
      end
    end
  end
end
