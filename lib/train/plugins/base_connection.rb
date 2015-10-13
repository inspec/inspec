# encoding: utf-8
#
# Author:: Salim Afiune (<salim@afiunemaya.com.mx>)
# Author:: Fletcher Nichol (<fnichol@nichol.ca>)
# Author:: Dominik Richter (<dominik.richter@gmail.com>)

require 'train/errors'
require 'train/plugins/common'
require 'logger'

class Train::Plugins::Transport
  # A Connection instance can be generated and re-generated, given new
  # connection details such as connection port, hostname, credentials, etc.
  # This object is responsible for carrying out the actions on the remote
  # host such as executing commands, transferring files, etc.
  #
  # @author Fletcher Nichol <fnichol@nichol.ca>
  class BaseConnection
    include Train::Plugins::Common

    # Create a new Connection instance.
    #
    # @param options [Hash] connection options
    # @yield [self] yields itself for block-style invocation
    def initialize(options = nil)
      @options = options || {}
      @logger = @options.delete(:logger) || Logger.new(STDOUT)
    end

    # Closes the session connection, if it is still active.
    def close
      # this method may be left unimplemented if that is applicable
    end

    # Execute a command using this connection.
    #
    # @param command [String] command string to execute
    # @return [CommandResult] contains the result of running the command
    def run_command(_command)
      fail Train::ClientError, "#{self.class} does not implement #run_command()"
    end

    # Get information on the operating system which this transport connects to.
    #
    # @return [OSCommon] operating system information
    def os
      fail Train::ClientError, "#{self.class} does not implement #os()"
    end

    # Interact with files on the target. Read, write, and get metadata
    # from files via the transport.
    #
    # @param [String] path which is being inspected
    # @return [FileCommon] file object that allows for interaction
    def file(_path, *_args)
      fail Train::ClientError, "#{self.class} does not implement #file(...)"
    end

    # Builds a LoginCommand which can be used to open an interactive
    # session on the remote host.
    #
    # @return [LoginCommand] array of command line tokens
    def login_command
      fail Train::ClientError, "#{self.class} does not implement #run_command()"
    end

    # Block and return only when the remote host is prepared and ready to
    # execute command and upload files. The semantics and details will
    # vary by implementation, but a round trip through the hosted
    # service is preferred to simply waiting on a socket to become
    # available.
    def wait_until_ready
      # this method may be left unimplemented if that is applicablelog
    end

    private

    # @return [Logger] logger for reporting information
    # @api private
    attr_reader :logger

    # @return [Hash] connection options
    # @api private
    attr_reader :options
  end
end
