require "inspec/cli"
require "parallel"
require "concurrent"
module InspecPlugins
  module Parallelism
    class Runner
      attr_accessor :runner_options, :sub_cmd, :total_jobs

      def initialize(runner_options, sub_cmd = "exec", cli_options)
        @runner_options = runner_options
        @sub_cmd = sub_cmd
        @total_jobs = cli_options["jobs"] || Concurrent.physical_processor_count
      end

      def run
        Parallel.map(runner_options, in_processes: total_jobs, progress: "Parallel Run") do |runner_option|
          begin
            puts Thread.current[:parallel_worker_number]
            out = runner_invocation(runner_option[:value])
          rescue SystemExit
            next
          end
        rescue StandardError
          # TBD
        end
      end

      private

      def runner_invocation(runner_option)
        splitted_result = runner_option.split(" ")
        profile_to_run = splitted_result[0]
        splitted_result.delete_at(0)

        # thor invocation
        # puts "\n"
        # puts "Running command: inspec exec #{runner_option}\n"
        arguments = [sub_cmd, profile_to_run, splitted_result].flatten
        Inspec::InspecCLI.start(arguments, enforce_license: true)
      end
    end
  end
end