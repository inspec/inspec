# encoding: utf-8
require "train/plugins"
require "open3"
require "ostruct"
require "json"
require "mkmf"

module Train::Transports
  class VMware < Train.plugin(1)
    name "vmware"
    option :viserver, default: proc { ENV["VISERVER"]          }
    option :username, default: proc { ENV["VISERVER_USERNAME"] }
    option :password, default: proc { ENV["VISERVER_PASSWORD"] }
    option :insecure, default: false

    def connection(_ = nil)
      @connection ||= Connection.new(@options)
    end

    class Connection < BaseConnection # rubocop:disable ClassLength
      POWERSHELL_PROMPT_REGEX = /PS\s.*> $/.freeze

      def initialize(options)
        super(options)

        options[:viserver] = options[:viserver] || options[:host]
        options[:username] = options[:username] || options[:user]

        @username = options[:username]
        @viserver = options[:viserver]
        @session = nil
        @stdout_buffer = ""
        @stderr_buffer = ""

        @powershell_binary = detect_powershell_binary

        if @powershell_binary == :powershell
          require_relative "local"
          @powershell = Train::Transports::Local::Connection.new(options)
        end

        if options[:insecure] == true
          run_command_via_connection("Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Scope Session -Confirm:$False")
        end

        @platform_details = {
          release: "vmware-powercli-#{powercli_version}",
        }

        connect
      end

      def connect
        login_command = "Connect-VIServer #{options[:viserver]} -User #{options[:username]} -Password #{options[:password]} | Out-Null"
        result = run_command_via_connection(login_command)

        if result.exit_status != 0
          message = "Unable to connect to VIServer at #{options[:viserver]}. "
          case result.stderr
          when /Invalid server certificate/
            message += "Certification verification failed. Please use `--insecure` or set `Set-PowerCLIConfiguration -InvalidCertificateAction Ignore` in PowerShell"
          when /incorrect user name or password/
            message += "Incorrect username or password"
          else
            message += result.stderr.gsub(/-Password .*\s/, "-Password REDACTED")
          end

          raise message
        end
      end

      def platform
        force_platform!("vmware", @platform_details)
      end

      def run_command_via_connection(cmd, &_data_handler)
        if @powershell_binary == :pwsh
          result = parse_pwsh_output(cmd)

          # Attach exit status to result
          exit_status = parse_pwsh_output("echo $?").stdout.chomp
          result.exit_status = exit_status == "True" ? 0 : 1

          result
        else
          @powershell.run_command(cmd)
        end
      end

      def unique_identifier
        uuid_command = "(Get-VMHost | Get-View).hardware.systeminfo.uuid"
        run_command_via_connection(uuid_command).stdout.chomp
      end

      def uri
        "vmware://#{@username}@#{@viserver}"
      end

      private

      def detect_powershell_binary
        if find_executable0("pwsh")
          :pwsh
        elsif find_executable0("powershell")
          :powershell
        else
          raise "Cannot find PowerShell binary, is `pwsh` installed?"
        end
      end

      # Read from stdout pipe until prompt is received
      def flush_stdout(pipe)
        @stdout_buffer += pipe.read_nonblock(1) while @stdout_buffer !~ POWERSHELL_PROMPT_REGEX
        @stdout_buffer
      rescue IO::EAGAINWaitReadable
        # We cannot know when the stdout pipe is finished so we keep reading
        retry
      ensure
        @stdout_buffer = ""
      end

      # This must be called after `flush_stdout` to ensure buffer is full
      def flush_stderr(pipe)
        loop do
          @stderr_buffer += pipe.read_nonblock(1)
        end
      rescue IO::EAGAINWaitReadable
        # If `flush_stderr` is ran after reading stdout we know that all of
        # stderr is in the pipe. Thus, we can return the buffer once the pipe
        # is unreadable.
        @stderr_buffer
      ensure
        @stderr_buffer = ""
      end

      def parse_pwsh_output(cmd)
        session.stdin.puts(cmd)

        stdout = flush_stdout(session.stdout)

        # Remove stdin from stdout (including trailing newline)
        stdout.slice!(0, cmd.length + 1)

        # Remove prompt from stdout
        stdout.gsub!(POWERSHELL_PROMPT_REGEX, "")

        # Grab stderr
        stderr = flush_stderr(session.stderr)

        CommandResult.new(
          stdout,
          stderr,
          nil # exit_status is attached in `run_command_via_connection`
        )
      end

      def powercli_version
        version_command = "[string](Get-Module -Name VMware.PowerCLI -ListAvailable | Select -ExpandProperty Version)"
        result = run_command_via_connection(version_command)
        if result.stdout.empty? || result.exit_status != 0
          raise "Unable to determine PowerCLI Module version, is it installed?"
        end

        result.stdout.chomp
      end

      def session
        return @session unless @session.nil?

        stdin, stdout, stderr = Open3.popen3("pwsh")

        # Remove leading prompt and intro text
        flush_stdout(stdout)

        @session = OpenStruct.new
        @session.stdin = stdin
        @session.stdout = stdout
        @session.stderr = stderr

        @session
      end
    end
  end
end
