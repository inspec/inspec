require "inspec/cli"
require "parallel"
require "concurrent"
module InspecPlugins
  module Parallelism
    class Runner
      attr_accessor :runner_options, :sub_cmd, :total_jobs

      def initialize(runner_options, cli_options, sub_cmd = "exec")
        @runner_options = runner_options
        @sub_cmd = sub_cmd
        @total_jobs = cli_options["jobs"] || Concurrent.physical_processor_count
      end

      def run
        Parallel.map(runner_options, in_processes: total_jobs) do |runner_option|
          profile_to_run = runner_option[:value].split(" ")[0].split("/")[-1]
          begin
            puts "Worker #{Parallel.worker_number}: Running #{profile_to_run}"
            runner_invocation(runner_option[:value])
          rescue SystemExit
            next
          end
        rescue StandardError => e
          File.join(Inspec.src_root, "#{profile_to_run}_#{Time.now.getutc.strftime("%Y%m%d-%H%M%S-%L")}.fail")
          File.write(failure_file, e)
        end
      end

      private

      def runner_invocation(runner_option)
        splitted_result = runner_option.split(" ")
        profile_to_run = splitted_result[0]
        splitted_result.delete_at(0)

        # thor invocation
        arguments = [sub_cmd, profile_to_run, splitted_result].flatten
        Inspec::InspecCLI.start(arguments, enforce_license: true)
      end
    end
  end
end