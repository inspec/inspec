# encoding: utf-8

require 'shellwords'

class Vulcano::Plugins::Backend
  class LinuxFile < FileCommon
    def initialize(backend, path)
      @backend = backend
      @path = path
      @spath = Shellwords.escape(@path)
      @stat = nil
    end

    def content
      @content ||= @backend.run_command(
        "cat #{@spath} 2>/dev/null || echo -n").stdout
    end

    def exists?
      @exists ||= (
        @backend.
          run_command("test -e #{@spath}").
          exit_status == 0
      )
    end

    def link_target
      return @link_target unless @link_target.nil?
      return @link_target = nil if link_path.nil?
      @link_target = @backend.file(link_path)
    end

    def link_path
      return nil unless symlink?
      @link_path ||= (
        @backend.
          run_command("readlink #{@spath}").stdout.chomp
      )
    end

    def mounted?
      @mounted ||= (
        !@backend.
          run_command("mount | grep -- ' on #{@spath}'").
          stdout.empty?
      )
    end

    %w{
      type mode owner group mtime size selinux_label
    }.each do |field|
      define_method field.to_sym do
        stat[field.to_sym]
      end
    end

    def product_version
      nil
    end

    def file_version
      nil
    end

    private

    TYPES = {
      socket:           00140000,
      symlink:          00120000,
      file:             00100000,
      block_device:     00060000,
      directory:        00040000,
      character_device: 00020000,
      pipe:             00010000,
    }

    def stat
      return @stat unless @stat.nil?
      res = @backend.run_command("stat #{@spath} 2>/dev/null --printf '%s\n%f\n%U\n%u\n%G\n%g\n%X\n%Y\n%C'")

      # ignore the exit_code: it is != 0 if selinux labels are not supported
      # on the system.

      fields = res.stdout.split("\n")
      if fields.length != 9
        return @stat = {}
      end

      tmask = fields[1].to_i(16)
      type = TYPES.find { |_, mask| mask & tmask == mask }
      type ||= [:unknown]

      @stat = {
        type: type[0],
        mode: tmask & 00777,
        owner: fields[2],
        group: fields[4],
        mtime: fields[7].to_i,
        size: fields[0].to_i,
        selinux_label: fields[8],
      }
    end
  end
end
