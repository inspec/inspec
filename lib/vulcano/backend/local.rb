# encoding: utf-8
require 'shellwords'

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
      @files[path] ||= File.new(self, path)
    end

    def run_command(cmd)
      Command.new(self, cmd)
    end

    def to_s
      'Local Command Runner'
    end

    class Command
      attr_reader :stdout, :stderr, :exit_status
      def initialize(backend, cmd)
        @cmd = cmd
        pid, stdin, stdout, stderr = open4(cmd)
        stdin.close

        ignored, status = Process::waitpid2 pid

        @stdout = stdout.read
        @stderr = stderr.read
        @exit_status = status.exitstatus
      end
    end

    class File < FileCommon
      def initialize(backend, path)
        @backend = backend
        @path = path
        @spath = Shellwords.escape(@path)
      end

      def content
        @content ||= @backend.
          run_command("cat #{@spath} 2>/dev/null || echo -n").stdout
      end

      def exists?
        @exists ||= (
          @backend.
            run_command("test -e #{@spath}").
            exit_status == 0
        )
      end

      def link_target
        # @TODO: handle error
        @link_target ||= (
          @backend.
            run_command("readlink #{@spath}").stdout
        )
      end

      %w{
        type mode owner group mtime size
      }.each do |field|
        define_method field.to_sym do
          stat[field.to_sym]
        end
      end

      # @TODO: selinux_label product_version file_version

      private

      TYPES = {
        socket:           00140000,
        symlink:          00120000,
        file:             00100000,
        block_device:     00060000,
        directory:        00040000,
        character_device: 00020000,
        pipe:             00010000
      }

      def stat
        return @stat unless @stat.nil?
        res = @backend.run_command("stat #{@spath} 2>/dev/null --printf '%s\n%f\n%u\n%g\n%X\n%Y'")

        if res.exit_status != 0
          return @stat = {}
        end

        fields = res.stdout.split("\n")
        if fields.length != 6
          return @stat = {}
        end

        tmask = fields[1].to_i(16)
        type = TYPES.find{ |x, mask| mask & tmask == mask }
        type ||= [:unknown]

        @stat = {
          type: type[0],
          mode: tmask & 00777,
          owner: fields[2],
          group: fields[3],
          mtime: fields[5].to_i,
          size: fields[0]
        }
      end

    end

  end
end
