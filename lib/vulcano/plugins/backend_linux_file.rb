# encoding: utf-8

require 'shellwords'

class Vulcano::Plugins::Backend
  class LinuxFile < FileCommon
    attr_reader :path
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
      return bsd_stat unless bsd_stat.nil?

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

    def bsd_stat
      return nil unless @backend.os[:family] == 'freebsd'
      return @bsd_stat unless @bsd_stat.nil?

      # From stat man page on FreeBSD:
      # z       The size of file in bytes (st_size).
      # p       File type and permissions (st_mode).
      # u, g    User ID and group ID of file's owner (st_uid, st_gid).
      # a, m, c, B
      #         The time file was last accessed or modified, or when the
      #         inode was last changed, or the birth time of the inode
      #         (st_atime, st_mtime, st_ctime, st_birthtime).
      #
      # The special output specifier S may be used to indicate that the
      # output, if applicable, should be in string format.  May be used
      # in combination with:
      #      ...
      #      gu      Display group or user name.
      res = @backend.run_command("stat -f '%z\n%p\n%Su\n%u\n%Sg\n%g\n%a\n%m' #{@spath}")

      return @bsd_stat = {} if res.exit_status != 0

      fields = res.stdout.split("\n")
      if fields.length != 8
        return @bsd_stat = {}
      end

      tmask = fields[1].to_i(8)
      type = TYPES.find { |_, mask| mask & tmask == mask }
      type ||= [:unknown]

      @bsd_stat = {
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
