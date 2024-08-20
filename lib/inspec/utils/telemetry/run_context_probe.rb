module Inspec
  class Telemetry
    # Guesses the run context of InSpec - how were we invoked?
    # All stack values here are determined experimentally

    class RunContextProbe
      # Guess if we are running under Automate
      def self.under_automate?
        # Currently assume we are under automate if we have an automate-based reporter
        Inspec::Config.cached[:reporter]
          .keys
          .map(&:to_s)
          .any? { |n| n =~ /automate/ }
      end

      # Guess, using stack introspection, if we were called under
      # test-kitchen, cli, audit-cookbook, or otherwise.
      # TODO add compliance-phase of chef-infra
      def self.guess_run_context(stack = nil)
        stack ||= caller_locations
        return "test-kitchen" if kitchen?(stack)
        return "cli" if run_by_thor?(stack)
        return "audit-cookbook" if audit_cookbook?(stack)

        "unknown"
      end

      def self.run_by_thor?(stack)
        stack_match(stack: stack, path: "thor/command", label: "run") &&
          stack_match(stack: stack, path: "thor/invocation", label: "invoke_command")
      end

      def self.kitchen?(stack)
        stack_match(stack: stack, path: "kitchen/instance", label: "verify_action") &&
          stack_match(stack: stack, path: "kitchen/instance", label: "verify")
      end

      def self.audit_cookbook?(stack)
        stack_match(stack: stack, path: "chef/handler", label: "run_report_handlers") &&
          stack_match(stack: stack, path: "handler/audit_report", label: "report")
      end

      def self.stack_match(stack: [], label: nil, path: nil)
        return false if stack.nil?

        stack.any? do |frame|
          if label && path
            frame.label == label && frame.absolute_path.include?(path)
          elsif label
            frame.label == label
          elsif path
            frame.absolute_path.include?(path)
          else
            false
          end
        end
      end
    end
  end
end
