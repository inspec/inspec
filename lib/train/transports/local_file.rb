# encoding: utf-8
#
# author: Dominik Richter
# author: Christoph Hartmann

class Train::Transports::Local
  class File < LinuxFile
    def content
      @content ||= ::File.read(@path, encoding: 'UTF-8')
    rescue StandardError => _
      nil
    end

    %w{
      exist? file? socket? directory? symlink? pipe?
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

      @stat = {
        type: Stat.find_type(file_stat.mode),
        mode: file_stat.mode & 00777,
        mtime: file_stat.mtime.to_i,
        size: file_stat.size,
        owner: pw_username(file_stat.uid),
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
