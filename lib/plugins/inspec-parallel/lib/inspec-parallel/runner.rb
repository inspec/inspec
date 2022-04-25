require "inspec/cli"
require "parallel"
require "concurrent"
module InspecPlugins
  module Parallelism
    class Runner
      attr_accessor :invocations, :sub_cmd, :total_jobs

      def initialize(invocations, cli_options, sub_cmd = "exec")
        @invocations = invocations
        @sub_cmd = sub_cmd
        @total_jobs = cli_options["jobs"] || Concurrent.physical_processor_count
      end

      def run
        @child_tracker = {}
        if Inspec.locally_windows? || true
          run_using_spawn
        else
          run_using_fork
        end
      end

      def run_using_spawn
        until invocations.empty? && @child_tracker.empty? do
          spawn_more_processes
          fork_do_cleanup
        end
      end

      def run_using_fork
        # parent_read, parent_write = IO.pipe
        # maintain a hash by PID of child processes with read handles and other info
        until invocations.empty? && @child_tracker.empty? do
          fork_more_processes
          fork_do_cleanup
        end
      end

      def spawn_more_processes
        while @child_tracker.length < [invocations.length, total_jobs].min do
          invocation = invocations.shift[:value]

          # Construct command-line invocation
          cmd = "#{$0} #{sub_cmd} #{invocation}"
          child_pid = Process.spawn(cmd) # TODO: plumbing
          @child_tracker[child_pid] = {} # TODO: store read handle?
          puts "[#{Time.now.iso8601}] Spawned child PID #{child_pid}"
        end
      end


      def fork_more_processes
        while @child_tracker.length < [invocations.length, total_jobs].min do
          invocation = invocations.shift[:value] # Be sure to do this shift() in parent process

          if (child_pid = Process.fork) then
            # In parent with newly forked child
            @child_tracker[child_pid] = {} # TODO: store read handle?
            puts "[#{Time.now.iso8601}] Forked child PID #{child_pid}"
          else
            # In child

            # TODO: handle plumbing
            runner_invocation(invocation)

            # should be unreachable but child must exit
            exit(42)
          end
        end
      end

      # Still in parent
      # Loop over children and check for finished processes
      def fork_do_cleanup
        @child_tracker.each do |pid, info|
          if Process.wait(pid, Process::WNOHANG)
            # child exited - status in $?
            # TODO: handle UI child exit
            puts "[#{Time.now.iso8601}] Exited child PID #{pid} status #{$?}"
            @child_tracker.delete pid
          else
            # nothing happened
            # TODO: read handles and update UI
            sleep 0.1
          end
        end
      end

      def run_using_parallel
        parent_read, parent_write = IO.pipe
        Parallel.map(invocations, in_processes: total_jobs) do |runner_option|
          # In child
          parent_write.puts "Writing from child #{Parallel.worker_number}"
          parent_read.close # close copy in child
          profile_to_run = runner_option[:value].split(" ")[0].split("/")[-1]
          begin
            puts "Worker #{Parallel.worker_number}: Running #{profile_to_run}" # DANGEROUS - writing to shared STDOUT
            runner_invocation(runner_option[:value])
          rescue SystemExit
            next
          end
        rescue StandardError => e
          failure_file = File.join(Inspec.src_root, "#{profile_to_run}_#{Time.now.getutc.strftime("%Y%m%d-%H%M%S-%L")}.fail")
          File.write(failure_file, e)
        end
        parent_write.close
        puts "Parent read: [#{Time.now.iso8601}]" + parent_read.read
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
