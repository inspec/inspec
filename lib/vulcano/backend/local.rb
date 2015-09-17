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
      rescue StandardError => _
        nil
      end

      %w{
        exists? file? socket? directory? symlink? pipe?
      }.each do |m|
        define_method m.to_sym do
          ::File.method(m.to_sym).call(@path)
        end
      end

      def link_path
        return nil unless symlink?
        @link_path ||= ::File.readlink(@path)
      end

      def block_device?
        ::File.blockdev?(@path)
      end

      def character_device?
        ::File.chardev?(@path)
      end

      private

      def pw_username(uid)
        Etc.getpwuid(uid).name
      rescue ArgumentError => _
        nil
      end

      def pw_groupname(gid)
        Etc.getgrgid(gid).name
      rescue ArgumentError => _
        nil
      end

      def stat
        return @stat unless @stat.nil?

        begin
          file_stat = ::File.lstat(@path)
        rescue StandardError => _err
          return @stat = {}
        end

        tmask = file_stat.mode
        type = TYPES.find { |_, mask| mask & tmask == mask }
        type ||= [:unknown]

        @stat = {
          type: type[0],
          mode: tmask & 00777,
          mtime: file_stat.mtime.to_i,
          size: file_stat.size,
          user: pw_username(file_stat.uid),
          group: pw_groupname(file_stat.gid),
        }

        res = @backend.run_command("stat #{@spath} 2>/dev/null --printf '%C'")
        if res.exit_status == 0 && !res.stdout.empty? && res.stdout != '?'
          @stat[:selinux_label] = res.stdout.strip
        end

        @stat
      end
    end
  end
end
