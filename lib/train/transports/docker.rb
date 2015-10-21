# encoding: utf-8
#
# Author:: Dominik Richter
# Author:: Christoph Hartmann

require 'docker'

module Train::Transports
  class Docker < Train.plugin(1)
    name 'docker'

    include_options Train::Extras::CommandWrapper
    option :host, required: true

    def connection(state = {}, &block)
      opts = merge_options(options, state || {})
      validate_options(opts)

      if @connection && @connection_options == opts
        reuse_connection(&block)
      else
        create_new_connection(opts, &block)
      end
    end

    private

    # Creates a new Docker connection instance and save it for potential future
    # reuse.
    #
    # @param options [Hash] connection options
    # @return [Docker::Connection] a Docker connection instance
    # @api private
    def create_new_connection(options, &block)
      if @connection
        logger.debug("[Docker] shutting previous connection #{@connection}")
        @connection.close
      end

      @connection_options = options
      @connection = Connection.new(options, &block)
    end

    # Return the last saved Docker connection instance.
    #
    # @return [Docker::Connection] a Docker connection instance
    # @api private
    def reuse_connection
      logger.debug("[Docker] reusing existing connection #{@connection}")
      yield @connection if block_given?
      @connection
    end
  end
end

class Train::Transports::Docker
  class Connection < BaseConnection
    def initialize(conf)
      super(conf)
      @id = options[:host]
      @container = ::Docker::Container.get(@id) ||
                   fail("Can't find Docker container #{@id}")
      @files = {}
      @cmd_wrapper = nil
      @cmd_wrapper = CommandWrapper.load(self, @options)
      self
    end

    def close
      # nothing to do at the moment
    end

    def os
      @os ||= OS.new(self)
    end

    def file(path)
      @files[path] ||= LinuxFile.new(self, path)
    end

    def run_command(cmd)
      cmd = @cmd_wrapper.run(cmd) unless @cmd_wrapper.nil?
      stdout, stderr, exit_status = @container.exec([
        '/bin/sh', '-c', cmd
      ])
      CommandResult.new(stdout.join, stderr.join, exit_status)
    rescue ::Docker::Error::DockerError => _
      raise
    rescue => _
      # @TODO: differentiate any other error
      raise
    end

    class OS < OSCommon
      def initialize(backend)
        # hardcoded to unix/linux for now, until other operating systems
        # are supported
        super(backend, { family: 'unix' })
      end
    end
  end
end
