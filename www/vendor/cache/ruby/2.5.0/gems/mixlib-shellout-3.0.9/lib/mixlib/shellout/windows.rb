#
# Author:: Daniel DeLeo (<dan@chef.io>)
# Author:: John Keiser (<jkeiser@chef.io>)
# Author:: Ho-Sheng Hsiao (<hosh@chef.io>)
# Copyright:: Copyright (c) 2011-2019, Chef Software Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require "win32/process"
require_relative "windows/core_ext"

module Mixlib
  class ShellOut
    module Windows

      include Process::Functions
      include Process::Constants

      TIME_SLICE = 0.05

      # Option validation that is windows specific
      def validate_options(opts)
        if opts[:user] && !opts[:password]
          raise InvalidCommandOption, "You must supply a password when supplying a user in windows"
        end

        if !opts[:user] && opts[:password]
          raise InvalidCommandOption, "You must supply a user when supplying a password in windows"
        end

        if opts[:elevated] && !opts[:user] && !opts[:password]
          raise InvalidCommandOption, "`elevated` option should be passed only with `username` and `password`."
        end

        if opts[:elevated] && opts[:elevated] != true && opts[:elevated] != false
          raise InvalidCommandOption, "Invalid value passed for `elevated`. Please provide true/false."
        end
      end

      #--
      # Missing lots of features from the UNIX version, such as
      # uid, etc.
      def run_command
        #
        # Create pipes to capture stdout and stderr,
        #
        stdout_read, stdout_write = IO.pipe
        stderr_read, stderr_write = IO.pipe
        stdin_read, stdin_write = IO.pipe
        open_streams = [ stdout_read, stderr_read ]

        begin

          #
          # Set cwd, environment, appname, etc.
          #
          app_name, command_line = command_to_run(combine_args(*command))
          create_process_args = {
            app_name: app_name,
            command_line: command_line,
            startup_info: {
              stdout: stdout_write,
              stderr: stderr_write,
              stdin: stdin_read,
            },
            environment: inherit_environment.map { |k, v| "#{k}=#{v}" },
            close_handles: false,
          }
          create_process_args[:cwd] = cwd if cwd
          # default to local account database if domain is not specified
          create_process_args[:domain] = domain.nil? ? "." : domain
          create_process_args[:with_logon] = with_logon if with_logon
          create_process_args[:password] = password if password
          create_process_args[:elevated] = elevated if elevated

          #
          # Start the process
          #
          process, profile, token = Process.create3(create_process_args)
          logger.debug(format_process(process, app_name, command_line, timeout)) if logger
          begin
            # Start pushing data into input
            stdin_write << input if input

            # Close pipe to kick things off
            stdin_write.close

            #
            # Wait for the process to finish, consuming output as we go
            #
            start_wait = Time.now
            loop do
              wait_status = WaitForSingleObject(process.process_handle, 0)
              case wait_status
              when WAIT_OBJECT_0
                # Get process exit code
                exit_code = [0].pack("l")
                unless GetExitCodeProcess(process.process_handle, exit_code)
                  raise get_last_error
                end

                @status = ThingThatLooksSortOfLikeAProcessStatus.new
                @status.exitstatus = exit_code.unpack("l").first

                return self
              when WAIT_TIMEOUT
                # Kill the process
                if (Time.now - start_wait) > timeout
                  begin
                    require "wmi-lite/wmi"
                    wmi = WmiLite::Wmi.new
                    kill_process_tree(process.process_id, wmi, logger)
                    Process.kill(:KILL, process.process_id)
                  rescue SystemCallError
                    logger.warn("Failed to kill timed out process #{process.process_id}") if logger
                  end

                  raise Mixlib::ShellOut::CommandTimeout, [
                    "command timed out:",
                    format_for_exception,
                    format_process(process, app_name, command_line, timeout),
                  ].join("\n")
                end

                consume_output(open_streams, stdout_read, stderr_read)
              else
                raise "Unknown response from WaitForSingleObject(#{process.process_handle}, #{timeout * 1000}): #{wait_status}"
              end

            end

          ensure
            CloseHandle(process.thread_handle) if process.thread_handle
            CloseHandle(process.process_handle) if process.process_handle
            Process.unload_user_profile(token, profile) if profile
            CloseHandle(token) if token
          end

        ensure
          #
          # Consume all remaining data from the pipes until they are closed
          #
          stdout_write.close
          stderr_write.close

          while consume_output(open_streams, stdout_read, stderr_read)
          end
        end
      end

      class ThingThatLooksSortOfLikeAProcessStatus
        attr_accessor :exitstatus
        def success?
          exitstatus == 0
        end
      end

      private

      def consume_output(open_streams, stdout_read, stderr_read)
        return false if open_streams.length == 0

        ready = IO.select(open_streams, nil, nil, READ_WAIT_TIME)
        return true unless ready

        if ready.first.include?(stdout_read)
          begin
            next_chunk = stdout_read.readpartial(READ_SIZE)
            @stdout << next_chunk
            @live_stdout << next_chunk if @live_stdout
          rescue EOFError
            stdout_read.close
            open_streams.delete(stdout_read)
          end
        end

        if ready.first.include?(stderr_read)
          begin
            next_chunk = stderr_read.readpartial(READ_SIZE)
            @stderr << next_chunk
            @live_stderr << next_chunk if @live_stderr
          rescue EOFError
            stderr_read.close
            open_streams.delete(stderr_read)
          end
        end

        true
      end

      # Use to support array passing semantics on windows
      #
      # 1.  strings with whitespace or quotes in them need quotes around them.
      # 2.  interior quotes need to get backslash escaped (parser needs to know when it really ends).
      # 3.  random backlsashes in paths themselves remain untouched.
      # 4.  if the argument must be quoted by #1 and terminates in a sequence of backslashes then all the backlashes must themselves
      #     be backslash excaped (double the backslashes).
      # 5.  if an interior quote that must be escaped by #2 has a sequence of backslashes before it then all the backslashes must
      #     themselves be backslash excaped along with the backslash ecape of the interior quote (double plus one backslashes).
      #
      # And to restate.  We are constructing a string which will be parsed by the windows parser into arguments, and we want those
      # arguments to match the *args array we are passed here.  So call the windows parser operation A then we need to apply A^-1 to
      # our args to construct the string so that applying A gives windows back our *args.
      #
      # And when the windows parser sees a series of backslashes followed by a double quote, it has to determine if that double quote
      # is terminating or not, and how many backslashes to insert in the args.  So what it does is divide it by two (rounding down) to
      # get the number of backslashes to insert.  Then if it is even the double quotes terminate the argument.  If it is even the
      # double quotes are interior double quotes (the extra backslash quotes the double quote).
      #
      # We construct the inverse operation so interior double quotes preceeded by N backslashes get 2N+1 backslashes in front of the quote,
      # while trailing N backslashes get 2N backslashes in front of the quote that terminates the argument.
      #
      # see: https://blogs.msdn.microsoft.com/twistylittlepassagesallalike/2011/04/23/everyone-quotes-command-line-arguments-the-wrong-way/
      #
      # @api private
      # @param args [Array<String>] array of command arguments
      # @return String
      def combine_args(*args)
        return args[0] if args.length == 1

        args.map do |arg|
          if arg =~ /[ \t\n\v"]/
            arg = arg.gsub(/(\\*)"/, '\1\1\"') # interior quotes with N preceeding backslashes need 2N+1 backslashes
            arg = arg.sub(/(\\+)$/, '\1\1') # trailing N backslashes need to become 2N backslashes
            "\"#{arg}\""
          else
            arg
          end
        end.join(" ")
      end

      def command_to_run(command)
        return run_under_cmd(command) if should_run_under_cmd?(command)

        candidate = candidate_executable_for_command(command)

        if candidate.length == 0
          raise Mixlib::ShellOut::EmptyWindowsCommand, "could not parse script/executable out of command: `#{command}`"
        end

        # Check if the exe exists directly.  Otherwise, search PATH.
        exe = which(candidate)
        if exe_needs_cmd?(exe)
          run_under_cmd(command)
        else
          [ exe, command ]
        end
      end

      # Batch files MUST use cmd; and if we couldn't find the command we're looking for,
      # we assume it must be a cmd builtin.
      def exe_needs_cmd?(exe)
        !exe || exe =~ /\.bat"?$|\.cmd"?$/i
      end

      # cmd does not parse multiple quotes well unless the whole thing is wrapped up in quotes.
      # https://github.com/chef/mixlib-shellout/pull/2#issuecomment-4837859
      # http://ss64.com/nt/syntax-esc.html
      def run_under_cmd(command)
        [ ENV["COMSPEC"], "cmd /c \"#{command}\"" ]
      end

      # FIXME: this extracts ARGV[0] but is it correct?
      def candidate_executable_for_command(command)
        if command =~ /^\s*"(.*?)"/ || command =~ /^\s*([^\s]+)/
          # If we have quotes, do an exact match, else pick the first word ignoring the leading spaces
          $1
        else
          ""
        end
      end

      def inherit_environment
        result = {}
        ENV.each_pair do |k, v|
          result[k] = v
        end

        environment.each_pair do |k, v|
          if v.nil?
            result.delete(k)
          else
            result[k] = v
          end
        end
        result
      end

      # api: semi-private
      # If there are special characters parsable by cmd.exe (such as file redirection), then
      # this method should return true.
      #
      # This parser is based on
      # https://github.com/ruby/ruby/blob/9073db5cb1d3173aff62be5b48d00f0fb2890991/win32/win32.c#L1437
      def should_run_under_cmd?(command)
        return true if command =~ /^@/

        quote = nil
        env = false
        env_first_char = false

        command.dup.each_char do |c|
          case c
          when "'", '"'
            if !quote
              quote = c
            elsif quote == c
              quote = nil
            end
            next
          when ">", "<", "|", "&", "\n"
            return true unless quote
          when "%"
            return true if env

            env = env_first_char = true
            next
          else
            next unless env

            if env_first_char
              env_first_char = false
              (env = false) && next if c !~ /[A-Za-z_]/
            end
            env = false if c !~ /[A-Za-z1-9_]/
          end
        end
        false
      end

      # FIXME: reduce code duplication with chef/chef
      def which(cmd)
        exts = ENV["PATHEXT"] ? ENV["PATHEXT"].split(";") + [""] : [""]
        # windows always searches '.' first
        exts.each do |ext|
          filename = "#{cmd}#{ext}"
          return filename if File.executable?(filename) && !File.directory?(filename)
        end
        # only search through the path if the Filename does not contain separators
        if File.basename(cmd) == cmd
          paths = ENV["PATH"].split(File::PATH_SEPARATOR)
          paths.each do |path|
            exts.each do |ext|
              filename = File.join(path, "#{cmd}#{ext}")
              return filename if File.executable?(filename) && !File.directory?(filename)
            end
          end
        end
        false
      end

      def system_required_processes
        [
          "System Idle Process",
          "System",
          "spoolsv.exe",
          "lsass.exe",
          "csrss.exe",
          "smss.exe",
          "svchost.exe",
        ]
      end

      def unsafe_process?(name, logger)
        return false unless system_required_processes.include? name

        logger.debug(
          "A request to kill a critical system process - #{name} - was received and skipped."
        )
        true
      end

      # recursively kills all child processes of given pid
      # calls itself querying for children child procs until
      # none remain. Important that a single WmiLite instance
      # is passed in since each creates its own WMI rpc process
      def kill_process_tree(pid, wmi, logger)
        wmi.query("select * from Win32_Process where ParentProcessID=#{pid}").each do |instance|
          next if unsafe_process?(instance.wmi_ole_object.name, logger)

          child_pid = instance.wmi_ole_object.processid
          kill_process_tree(child_pid, wmi, logger)
          kill_process(instance, logger)
        end
      end

      def kill_process(instance, logger)
        child_pid = instance.wmi_ole_object.processid
        if logger
          logger.debug([
            "killing child process #{child_pid}::",
            "#{instance.wmi_ole_object.Name} of parent #{pid}",
          ].join)
        end
        Process.kill(:KILL, instance.wmi_ole_object.processid)
      rescue SystemCallError
        if logger
          logger.debug([
            "Failed to kill child process #{child_pid}::",
            "#{instance.wmi_ole_object.Name} of parent #{pid}",
          ].join)
        end
      end

      def format_process(process, app_name, command_line, timeout)
        msg = []
        msg << "ProcessId: #{process.process_id}"
        msg << "app_name: #{app_name}"
        msg << "command_line: #{command_line}"
        msg << "timeout: #{timeout}"
        msg.join("\n")
      end

      # DEPRECATED do not use
      class Utils
        include Mixlib::ShellOut::Windows
        def self.should_run_under_cmd?(cmd)
          Mixlib::ShellOut::Windows::Utils.new.send(:should_run_under_cmd?, cmd)
        end
      end
    end
  end
end
