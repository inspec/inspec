# encoding: utf-8

if IO.respond_to?(:popen4)
  def open4(*args)
    IO.popen4(*args)
  end
else
  require 'open4'
end

module Vulcano::Backends
  class Local < Vulcano.backend(1)
    name 'local'

    def initialize(conf)
      @conf = conf
      @files = {}
    end

    def file(path)
      @files[path] ||= LinuxFile.new(self, path)
    end

    def run_command(cmd)
      Command.new(cmd)
    end

    def to_s
      'Local Command Runner'
    end

    class Command
      attr_reader :stdout, :stderr, :exit_status
      def initialize(cmd)
        @cmd = cmd
        pid, stdin, stdout, stderr = open4(cmd)
        stdin.close

        _, status = Process.waitpid2 pid

        @stdout = stdout.read
        @stderr = stderr.read
        @exit_status = status.exitstatus
      end
    end

  end
end
