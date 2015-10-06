# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'docker'

module Vulcano::Backends
  class Docker < Vulcano.backend(1)
    name 'docker'

    attr_reader :os
    def initialize(conf)
      @conf = conf
      @files = {}
      id = @conf['host'] ||
           fail('You must specify a docker container ID.')
      @container = ::Docker::Container.get(id) ||
                   fail("Can't find Docker container #{id}")
      @os = OS.new(self)
    end

    def file(path)
      @files[path] ||= LinuxFile.new(self, path)
    end

    def run_command(cmd)
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
