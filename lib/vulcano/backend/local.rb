# encoding: utf-8
require 'etc'

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

    class File < LinuxFile
      def content
        @content ||= ::File.read(@path)
      end

      %w{
        exists? file? socket? directory? symlink? pipe?
      }.each do |m|
        define_method m.to_sym do
          ::File.method(m.to_sym).call(@path)
        end
      end

      def block_device?
        ::File.blockdev?(@path)
      end

      def character_device?
        ::File.chardev?(@path)
      end

      private

      def stat
        return @stat unless @stat.nil?

        begin
          file_stat = ::File.stat(@path)
        rescue RuntimeError => _
          @stat = {}
          return
        end

        tmask = file_stat.mode
        type = TYPES.find { |_, mask| mask & tmask == mask }
        type ||= [:unknown]

        @stat = {
          type: type[0],
          mode: tmask & 00777,
          mtime: file_stat.mtime.to_i,
          size: file_stat.size,
        }

        begin
          u = Etc.getpwuid(file_stat.uid)
          @stat[:owner] = u.name
        rescue ArgumentError => _
          @stat[:owner] = nil
        end

        begin
          g = Etc.getgrgid(file_stat.gid)
          @stat[:group] = g.name
        rescue ArgumentError => _
          @stat[:group] = nil
        end
      end
    end
  end
end
