require "inspec/cli"
require "concurrent"
require_relative "super_reporter/base"

module InspecPlugins
  module Parallelism
    class Runner
      attr_accessor :invocations, :sub_cmd, :total_jobs, :run_in_background, :log_path

      def initialize(invocations, cli_options, sub_cmd = "exec")
        @invocations = invocations
        @sub_cmd = sub_cmd
        @total_jobs = cli_options["jobs"] || Concurrent.physical_processor_count
        @child_tracker = {}
        @child_tracker_persisted = {}
        @run_in_background = cli_options["bg"]
        unless run_in_background
          @ui = InspecPlugins::Parallelism::SuperReporter.make(cli_options["ui"], total_jobs, invocations)
        end
        @log_path = cli_options["log_path"]
      end

      def run
        initiate_background_run if run_in_background # running a process as daemon changes parent process pid
        until invocations.empty? && @child_tracker.empty?
          while should_start_more_jobs?
            if Inspec.locally_windows?
              spawn_another_process
            else
              fork_another_process
            end
          end

          update_ui_poll_select
          cleanup_child_processes
          sleep 0.1
        end

        # Requires renaming operations on windows only
        # Do Rename and delete operations after all child processes have exited successfully
        rename_error_log_files if Inspec.locally_windows?
        cleanup_empty_error_log_files
        cleanup_daemon_process if run_in_background
      end

      def initiate_background_run
        if Inspec.locally_windows?
          Inspec::UI.new.exit(:usage_error)
        else
          Process.daemon(true, true)
        end
      end

      def cleanup_daemon_process
        current_process_id = Process.pid
        Process.kill(9, current_process_id)
        # DO NOT TRY TO REFACTOR IT THIS WAY
        # Calling Process.kill(9,Process.pid) kills the "stopper" process itself, rather than the one it's trying to stop.
      end

      def cleanup_empty_error_log_files
        logs_dir_path = log_path || Dir.pwd
        error_files = Dir.glob("#{logs_dir_path}/logs/*.err")
        error_files.each do |error_file|
          if File.exist?(error_file) && !File.size?(error_file)
            File.delete(error_file)
          end
        end
      end

      def kill_child_processes
        @child_tracker.each do |pid, info|
          Process.kill("SIGKILL", pid)
        rescue Exception => e
          $stderr.puts "Error while shutting down process #{pid}: #{e.message}"
        end
        # Waiting for child processes to die after they have been killed
        wait_for_child_processes_to_die
      end

      def wait_for_child_processes_to_die
        until @child_tracker.empty?
          begin
            exited_pid = Process.waitpid(-1, Process::WNOHANG)
            @child_tracker.delete exited_pid if exited_pid && exited_pid > 0
            sleep 1
          rescue Errno::ECHILD
            Inspec::Log.info "Processes shutdown complete!"
          rescue Exception => e
            Inspec::Log.debug "Error while waiting for child processes to shutdown: #{e.message}"
          end
        end
      end

      def rename_error_log_files
        @child_tracker_persisted.each do |pid, info|
          rename_error_log(info[:error_log_file], pid)
        end
      end

      def should_start_more_jobs?
        @child_tracker.length < total_jobs && !invocations.empty?
      end

      def spawn_another_process
        invocation = invocations.shift[:value]

        child_reader, parent_writer = IO.pipe
        begin
          logs_dir_path = log_path || Dir.pwd
          log_dir = File.join(logs_dir_path, "logs")
          FileUtils.mkdir_p(log_dir)
          error_log_file = File.open("#{log_dir}/#{Time.now.nsec}.err", "a+")
          cmd = "#{$0} #{sub_cmd} #{invocation}"
          log_msg = "#{Time.now.iso8601} Start Time: #{Time.now}\n#{Time.now.iso8601} Arguments: #{invocation}\n"
          child_pid = Process.spawn(cmd, out: parent_writer, err: error_log_file.path)

          # Logging
          create_logs(child_pid, log_msg)
          @child_tracker[child_pid] = { io: child_reader }

          # This is used to rename error log files after all child processes are exited
          @child_tracker_persisted[child_pid] = { error_log_file: error_log_file }
          @ui.child_spawned(child_pid, invocation)

          # Close the file to unlock the error log files opened by processes
          error_log_file.close
        rescue StandardError => e
          $stderr.puts "#{Time.now.iso8601} Error Message: #{e.message}"
          $stderr.puts "#{Time.now.iso8601} Error Backtrace: #{e.backtrace}"
        end
      end

      def fork_another_process
        invocation = invocations.shift[:value] # Be sure to do this shift() in parent process
        # thing_that_reads_from_the_child, thing_that_writes_to_the_parent = IO.pipe
        child_reader, parent_writer = IO.pipe
        if (child_pid = Process.fork)
          # In parent with newly forked child
          parent_writer.close
          @child_tracker[child_pid] = { io: child_reader }
          @ui.child_forked(child_pid, invocation) unless run_in_background
        else
          # In child
          child_reader.close
          # replace stdout with writer
          $stdout = parent_writer
          create_logs(Process.pid, nil, $stderr)

          begin
            create_logs(
              Process.pid,
              "#{Time.now.iso8601} Start Time: #{Time.now}\n#{Time.now.iso8601} Arguments: #{invocation}\n"
            )
            runner_invocation(invocation)
          rescue StandardError => e
            $stderr.puts "#{Time.now.iso8601} Error Message: #{e.message}"
            $stderr.puts "#{Time.now.iso8601} Error Backtrace: #{e.backtrace}"
          end

          # should be unreachable but child MUST exit
          exit(42)
        end
      end

      # Still in parent
      # Loop over children and check for finished processes
      def cleanup_child_processes
        @child_tracker.each do |pid, info|
          if Process.wait(pid, Process::WNOHANG)
            # Expect to (probably) find EOF marker on the pipe, and close it if so
            update_ui_poll_select(pid)

            create_logs(pid, "#{Time.now.iso8601} Exit code: #{$?}\n")

            # child exited - status in $?
            @ui.child_exited(pid) unless run_in_background
            @child_tracker.delete pid
          end
        end
      end

      def update_ui_poll_select(target_pid = nil)
        # Focus on one pid's pipe if specified, otherwise poll all pipes
        pipes_for_reading = target_pid ? [ @child_tracker[target_pid][:io] ] : @child_tracker.values.map { |i| i[:io] }
        # Next line is due to a race between the close() and the wait()... shouldn't need it, but it fixes the race.
        pipes_for_reading.reject!(&:closed?)
        ready_pipes = IO.select(pipes_for_reading, [], [], 0.1)
        return unless ready_pipes

        ready_pipes[0].each do |pipe_ready_for_reading|
          # If we weren't provided a PID, hackishly look up the pid from the matching IO.
          pid = target_pid || @child_tracker.keys.detect { |p| @child_tracker[p][:io] == pipe_ready_for_reading }
          begin
            while (update_line = pipe_ready_for_reading.readline) && !pipe_ready_for_reading.closed?
              if update_line =~ /EOF_MARKER/
                pipe_ready_for_reading.close
                break
              elsif update_line =~ /WARN/ || update_line =~ /ERROR/ || update_line =~ /INFO/
                create_logs(
                  pid,
                  "#{Time.now.iso8601} Extra log: #{update_line}\n"
                )
                break
              end
              update_ui_with_line(pid, update_line) unless run_in_background
              # Only pull one line if we are doing normal updates; slurp the whole file
              # if we are doing a final pull on a targeted PID
              break unless target_pid
            end
          rescue EOFError
            # On unix, readline throws an EOFError when we hit the end. On Windows, nothing apparently happens.
            pipe_ready_for_reading.close
            next
          end
        end
        # TODO: loop over ready_pipes[2] and handle errors?
      end

      def update_ui_with_line(pid, update_line)
        @ui.child_status_update_line(pid, update_line)
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

      def create_logs(child_pid, run_log , stderr = nil)
        logs_dir_path = log_path || Dir.pwd
        log_dir = File.join(logs_dir_path, "logs")
        FileUtils.mkdir_p(log_dir)

        if stderr
          log_file = File.join(log_dir, "#{child_pid}.err") unless File.exist?("#{child_pid}.err")
          stderr.reopen(log_file, "a")
        else
          log_file = File.join(log_dir, "#{child_pid}.log") unless File.exist?("#{child_pid}.log")
          File.write(log_file, run_log, mode: "a")
        end
      end

      def rename_error_log(error_log_file, child_pid)
        logs_dir_path = log_path || Dir.pwd
        log_dir = File.join(logs_dir_path, "logs")
        FileUtils.mkdir_p(log_dir)

        if error_log_file.closed? && File.exist?(error_log_file.path)
          begin
            File.rename("#{error_log_file.path}", "#{log_dir}/#{child_pid}.err")
          rescue
            $stderr.puts "Cannot rename error log file #{error_log_file.path} for child pid #{child_pid}"
          end
        end
      end
    end
  end
end
