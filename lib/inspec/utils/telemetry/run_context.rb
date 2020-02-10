module Inspec
  module Telemetry
    # Guesses the run context of InSpec - how were we invoked?
    class RunContextProbe
      def self.guess_run_context
        stack = caller_locations(4)
        return "cli" if run_by_thor?(stack)
        # audit-cookbook
        # kitchen-inspec
        # "unknown"
      end


      def self.run_by_thor?(stack)
        stack_match(stack: stack[-14..-9], path: "thor/command", label: "run") &&
        stack_match(stack: stack[-14..-9], path: "thor/invocation", label: "invoke_command")
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
