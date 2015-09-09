# encoding: utf-8
require 'docker'

module Vulcano::Backends
  class Docker < Vulcano.backend(1)
    name 'docker'

    def initialize(conf)
      @conf = conf
      @files = {}
      id = @conf['host'] ||
           fail('You must specify a docker container ID.')
      @container = ::Docker::Container.get(id) ||
                   fail("Can't find Docker container #{id}")
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
  end
end
