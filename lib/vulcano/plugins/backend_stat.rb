# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

class Vulcano::Plugins::Backend::FileCommon
  class Stat
    TYPES = {
      socket:           00140000,
      symlink:          00120000,
      file:             00100000,
      block_device:     00060000,
      directory:        00040000,
      character_device: 00020000,
      pipe:             00010000,
    }

    def self.find_type(mode)
      res = TYPES.find { |_, mask| mask & mode == mask }
      res.nil? ? :unknown : res[0]
    end

    def self.stat(shell_escaped_path, backend)
      return bsd_stat(shell_escaped_path, backend) if backend.os.bsd?
      return linux_stat(shell_escaped_path, backend) if backend.os.unix?
      # all other cases we don't handle
      # TODO: print an error if we get here, as it shouldn't be invoked
      # on non-unix
      {}
    end

    def self.linux_stat(shell_escaped_path, backend)
      res = backend.run_command("stat #{shell_escaped_path} 2>/dev/null --printf '%s\n%f\n%U\n%u\n%G\n%g\n%X\n%Y\n%C'")

      # ignore the exit_code: it is != 0 if selinux labels are not supported
      # on the system.

      fields = res.stdout.split("\n")
      return {} if fields.length != 9

      tmask = fields[1].to_i(16)
      selinux = fields[8]
      selinux = nil if selinux == '?' or selinux == '(null)'

      {
        type: find_type(tmask),
        mode: tmask & 00777,
        owner: fields[2],
        group: fields[4],
        mtime: fields[7].to_i,
        size: fields[0].to_i,
        selinux_label: selinux,
      }
    end

    def self.bsd_stat(shell_escaped_path, backend)
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
      res = backend.run_command(
        "stat -f '%z\n%p\n%Su\n%u\n%Sg\n%g\n%a\n%m' "\
        "#{shell_escaped_path}")

      return {} if res.exit_status != 0

      fields = res.stdout.split("\n")
      return {} if fields.length != 8

      tmask = fields[1].to_i(8)

      {
        type: find_type(tmask),
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
