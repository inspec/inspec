# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann
module Train::Extras
  class Stat
    TYPES = {
      socket: 00140000,
      symlink: 00120000,
      file: 00100000,
      block_device: 00060000,
      directory: 00040000,
      character_device: 00020000,
      pipe: 00010000,
    }.freeze

    def self.find_type(mode)
      res = TYPES.find { |_, mask| mask & mode == mask }
      res.nil? ? :unknown : res[0]
    end

    def self.stat(shell_escaped_path, backend, follow_symlink)
      # use perl scripts for aix, solaris 10 and hpux
      if backend.os.aix? || (backend.os.solaris? && backend.os[:release].to_i < 11) || backend.os.hpux?
        return aix_stat(shell_escaped_path, backend, follow_symlink)
      end
      return bsd_stat(shell_escaped_path, backend, follow_symlink) if backend.os.bsd?
      # linux,solaris 11 and esx will use standard linux stats
      return linux_stat(shell_escaped_path, backend, follow_symlink) if backend.os.unix? || backend.os.esx?

      # all other cases we don't handle
      # TODO: print an error if we get here, as it shouldn't be invoked
      # on non-unix
      {}
    end

    def self.linux_stat(shell_escaped_path, backend, follow_symlink)
      lstat = follow_symlink ? " -L" : ""
      format = (backend.os.esx? || backend.os[:name] == "alpine" || backend.os[:name] == "yocto") ? "-c" : "--printf"
      res = backend.run_command("stat#{lstat} #{shell_escaped_path} 2>/dev/null #{format} '%s\n%f\n%U\n%u\n%G\n%g\n%X\n%Y\n%C'")
      # ignore the exit_code: it is != 0 if selinux labels are not supported
      # on the system.

      fields = res.stdout.split("\n")
      return {} if fields.length != 9

      tmask = fields[1].to_i(16)
      selinux = fields[8]
      ## selinux security context string not available on esxi
      selinux = nil if (selinux == "?") || (selinux == "(null)") || (selinux == "C")
      {
        type: find_type(tmask),
        mode: tmask & 07777,
        owner: fields[2],
        uid: fields[3].to_i,
        group: fields[4],
        gid: fields[5].to_i,
        mtime: fields[7].to_i,
        size: fields[0].to_i,
        selinux_label: selinux,
      }
    end

    def self.bsd_stat(shell_escaped_path, backend, follow_symlink)
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
      lstat = follow_symlink ? " -L" : ""
      res = backend.run_command(
        "stat#{lstat} -f '%z\n%p\n%Su\n%u\n%Sg\n%g\n%a\n%m' "\
        "#{shell_escaped_path}"
      )

      return {} if res.exit_status != 0

      fields = res.stdout.split("\n")
      return {} if fields.length != 8

      tmask = fields[1].to_i(8)

      {
        type: find_type(tmask),
        mode: tmask & 07777,
        owner: fields[2],
        uid: fields[3].to_i,
        group: fields[4],
        gid: fields[5].to_i,
        mtime: fields[7].to_i,
        size: fields[0].to_i,
        selinux_label: fields[8],
      }
    end

    def self.aix_stat(shell_escaped_path, backend, follow_symlink)
      # Perl here b/c it is default on AIX
      lstat = follow_symlink ? "lstat" : "stat"
      stat_cmd = <<-EOP
      perl -e '
      @a = #{lstat}(shift) or exit 2;
      $u = getpwuid($a[4]);
      $g = getgrgid($a[5]);
      printf("0%o\\n%s\\n%d\\n%s\\n%d\\n%d\\n%d\\n", $a[2], $u, $a[4], $g, $a[5], $a[9], $a[7])
      ' #{shell_escaped_path}
      EOP

      res = backend.run_command(stat_cmd)
      return {} if res.exit_status != 0

      fields = res.stdout.split("\n")
      return {} if fields.length != 7

      tmask = fields[0].to_i(8)
      {
        type: find_type(tmask),
        mode: tmask & 07777,
        owner: fields[1],
        uid: fields[2].to_i,
        group: fields[3],
        gid: fields[4].to_i,
        mtime: fields[5].to_i,
        size: fields[6].to_i,
        selinux_label: nil,
      }
    end
  end
end
