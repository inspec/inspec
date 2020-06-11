# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require "base64"
require_relative "../errors"

module Train::Extras
  # Define the interface of all command wrappers.
  class CommandWrapperBase
    # Verify that the command wrapper is initialized properly and working.
    #
    # @return [Any] verification result, nil if all went well, otherwise a message
    def verify
      raise Train::ClientError, "#{self.class} does not implement #verify()"
    end

    # Wrap a command and return the augmented command which can be executed.
    #
    # @param [Strin] command that will be wrapper
    # @return [String] result of wrapping the command
    def run(_command)
      raise Train::ClientError, "#{self.class} does not implement #run(command)"
    end
  end

  # Wrap linux commands and add functionality like sudo.
  class LinuxCommand < CommandWrapperBase
    Train::Options.attach(self)

    option :shell,         default: false
    option :shell_options, default: nil
    option :shell_command, default: nil
    option :sudo,          default: false
    option :sudo_options,  default: nil
    option :sudo_password, default: nil
    option :sudo_command,  default: nil
    option :user

    attr_reader :backend

    def initialize(backend, options)
      @backend = backend
      validate_options(options)

      @shell         = options[:shell]
      @shell_options = options[:shell_options] # e.g. '--login'
      @shell_command = options[:shell_command] # e.g. '/bin/sh'
      @sudo          = options[:sudo]
      @sudo_options  = options[:sudo_options]
      @sudo_password = options[:sudo_password]
      @sudo_command  = options[:sudo_command]
      @user          = options[:user]
    end

    # (see CommandWrapperBase::verify)
    def verify
      # Do nothing, successfully. Don't use "true", that's not available on Windows.
      cmd = if @sudo
              # Wrap it up. It needs /dev/null on the outside to disable stdin
              "sh -c '(#{run("echo")}) < /dev/null'"
            else
              run("echo")
            end

      # rubocop:disable Style/BlockDelimiters
      res = @backend.with_sudo_pty {
        @backend.run_command(cmd)
      }
      return nil if res.exit_status == 0

      rawerr = "#{res.stdout} #{res.stderr}".strip

      case rawerr
      when /Sorry, try again/
        ["Wrong sudo password.", :bad_sudo_password]
      when /sudo: no tty present and no askpass program specified/
        ["Sudo requires a password, please configure it.", :sudo_password_required]
      when /sudo: command not found/
        ["Can't find sudo command. Please either install and "\
          "configure it on the target or deactivate sudo.", :sudo_command_not_found]
      when /sudo: sorry, you must have a tty to run sudo/
        ["Sudo requires a TTY. Please see the README on how to configure "\
          "sudo to allow for non-interactive usage.", :sudo_no_tty]
      else
        [rawerr, nil]
      end
    end

    def verify!
      msg, reason = verify
      return nil unless msg

      raise Train::UserError.new("Sudo failed: #{msg}", reason)
    end

    # (see CommandWrapperBase::run)
    def run(command)
      shell_wrap(sudo_wrap(command))
    end

    def self.active?(options)
      options.is_a?(Hash) && (
        options[:sudo] ||
        options[:shell]
      )
    end

    private

    # wrap the cmd in a sudo command
    def sudo_wrap(cmd)
      return cmd unless @sudo
      return cmd if @user == "root"

      res = (@sudo_command || "sudo") + " "

      if @sudo_password
        str = safe_string(@sudo_password + "\n")
        res = "#{str} | #{res}-S "
      end

      res << "#{@sudo_options} " if @sudo_options

      res + cmd
    end

    # wrap the cmd in a subshell allowing for options to
    # passed to the subshell
    def shell_wrap(cmd)
      return cmd unless @shell

      shell = @shell_command || "$SHELL"
      options = " #{@shell_options}" if @shell_options

      "#{safe_string(cmd)} | #{shell}#{options}"
    end

    # encapsulates encoding the string into a safe form, and decoding for use.
    # @return [String] A command line snippet that can be used as part of a pipeline.
    def safe_string(str)
      b64str = Base64.strict_encode64(str)
      "echo #{b64str} | base64 --decode"
    end
  end

  # Wrap windows commands.
  class WindowsCommand < CommandWrapperBase
    Train::Options.attach(self)

    option :shell_command, default: nil

    def initialize(backend, options)
      @backend = backend
      validate_options(options)

      @shell_command = options[:shell_command] # e.g. 'powershell'
    end

    # (see CommandWrapperBase::run)
    def run(command)
      powershell_wrap(command)
    end

    private

    # Wrap the cmd in an encoded command to allow pipes and quotes
    def powershell_wrap(cmd)
      shell = @shell_command || "powershell"

      # Prevent progress stream from leaking into stderr
      script = "$ProgressPreference='SilentlyContinue';" + cmd

      # Encode script so PowerShell can use it
      script = script.encode("UTF-16LE", "UTF-8")
      base64_script = Base64.strict_encode64(script)

      cmd = "#{shell} -NoProfile -EncodedCommand #{base64_script}"
      cmd
    end
  end

  class CommandWrapper
    include_options LinuxCommand
    include_options WindowsCommand

    def self.load(transport, options)
      if transport.platform.unix?
        return nil unless LinuxCommand.active?(options)

        res = LinuxCommand.new(transport, options)
        res.verify!

        res
      elsif transport.platform.windows?
        WindowsCommand.new(transport, options)
      end
    end
  end
end
