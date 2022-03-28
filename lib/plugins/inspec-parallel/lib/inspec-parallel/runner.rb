module InspecPlugins
  module Parallel
    class Runner
      attr_accessor :runner_options, :sub_cmd

      def initialize(runner_options, sub_cmd = :exec)
        @runner_options = runner_options
        @sub_cmd = sub_cmd
      end

      def run
        runner_options.each do |runner_option|
          runner_invocation(runner_option)
        rescue SystemExit => e
          next
        end
      end

      private

      def runner_invocation(runner_option)
        splitted_result = runner_option.split(" ")
        profile_to_run = splitted_result[0]
        splitted_result.delete_at(0)
        options_to_run_with = Hash[*splitted_result.flatten(1)]
        # thor invocation
        Inspec::InspecCLI.new.invoke(sub_cmd, [profile_to_run], options_to_run_with )
      end
    end
  end
end