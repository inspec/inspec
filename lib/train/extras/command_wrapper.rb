# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'base64'
require 'train/errors'

module Train::Extras
  # Define the interface of all command wrappers.
  class CommandWrapperBase
    # Verify that the command wrapper is initialized properly and working.
    #
    # @return [Any] verification result, nil if all went well, otherwise a message
    def verify
      fail Train::ClientError, "#{self.class} does not implement #verify()"
    end

    # Wrap a command and return the augmented command which can be executed.
    #
    # @param [Strin] command that will be wrapper
    # @return [String] result of wrapping the command
    def run(_command)
      fail Train::ClientError, "#{self.class} does not implement #run(command)"
    end
  end

  # Wrap linux commands and add functionality like sudo.
  class LinuxCommand < CommandWrapperBase
    Train::Options.attach(self)

    option :sudo, default: false
    option :sudo_options, default: nil
    option :sudo_password, default: nil
    option :user

    def initialize(backend, options)
      @backend = backend
      validate_options(options)

      @sudo = options[:sudo]
      @sudo_options = options[:sudo_options]
      @sudo_password = options[:sudo_password]
      @user = options[:user]
      @prefix = build_prefix
    end

    # (see CommandWrapperBase::verify)
    def verify
      res = @backend.run_command(run('echo'))
      return nil if res.exit_status == 0
      rawerr = res.stdout + ' ' + res.stderr

      rawerr = 'Wrong sudo password.' if rawerr.include? 'Sorry, try again'
      if rawerr.include? 'sudo: no tty present and no askpass program specified'
        rawerr = 'Sudo requires a password, please configure it.'
      end
      if rawerr.include? 'sudo: command not found'
        rawerr = "Can't find sudo command. Please either install and "\
                 'configure it on the target or deactivate sudo.'
      end

      rawerr
    end

    # (see CommandWrapperBase::run)
    def run(command)
      @prefix + command
    end

    def self.active?(options)
      options.is_a?(Hash) && options[:sudo]
    end

    private

    def build_prefix
      return '' unless @sudo
      return '' if @user == 'root'

      res = 'sudo '

      unless @sudo_password.nil?
        b64pw = Base64.strict_encode64(@sudo_password + "\n")
        res = "echo #{b64pw} | base64 -d | sudo -S "
      end

      res << @sudo_options.to_s + ' ' unless @sudo_options.nil?

      res
    end
  end

  class CommandWrapper
    include_options LinuxCommand

    def self.load(transport, options)
      return nil unless LinuxCommand.active?(options)
      return nil unless transport.os.unix?
      res = LinuxCommand.new(transport, options)
      msg = res.verify
      fail Train::UserError, "Sudo failed: #{msg}" unless msg.nil?
      res
    end
  end
end
