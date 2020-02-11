module Inspec
  module Telemetry
    # Guesses the run context of InSpec - how were we invoked?
    # All stack values here are determined experimentally

    class RunContextProbe
      def self.guess_run_context
        stack = caller_locations(4)
        return "test-kitchen" if kitchen?(stack)
        return "cli" if run_by_thor?(stack)
        return "audit-cookbook" if audit_cookbook?(stack)
        "unknown"
      end

      def self.run_by_thor?(stack)
        stack_match(stack: stack[-14..-9], path: "thor/command", label: "run") &&
        stack_match(stack: stack[-14..-9], path: "thor/invocation", label: "invoke_command")
      end

      def self.kitchen?(stack)
        stack_match(stack: stack[-21..-11], path: "kitchen/instance", label: "verify_action") &&
        stack_match(stack: stack[-14..-4], path: "kitchen/instance", label: "verify")
      end

      def self.audit_cookbook?(stack)
        stack_match(stack: stack[-21..-11], path: "chef/handler", label: "run_report_handlers") &&
        stack_match(stack: stack[-26..-16], path: "handler/audit_report", label: "report")
      end

      def self.stack_match(stack: nil, label: nil, path: nil)
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
