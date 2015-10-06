# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

class Vulcano::Backends::SpecinfraHelper
  class File < LinuxFile
    def initialize(backend, path)
      super(backend, path)
    end

    def exist?
      Specinfra::Runner.check_file_exists(@path)
    end

    def mode
      return stat[:mode] if @backend.os.bsd?
      m = Specinfra::Runner.get_file_mode(@path).stdout.strip
      return nil if m.empty? || m.include?('cannot stat')
      m.to_i(8)
    end

    def owner
      return stat[:owner] if @backend.os.bsd?
      o = Specinfra::Runner.get_file_owner_user(@path).stdout.strip
      return nil if o.empty? || o.include?('cannot stat')
      o
    end

    def group
      return stat[:group] if @backend.os.bsd?
      g = Specinfra::Runner.get_file_owner_group(@path).stdout.strip
      return nil if g.empty? || g.include?('cannot stat')
      g
    end

    def link_path
      return nil unless symlink?
      path = Shellwords.escape(@path)
      Specinfra::Runner.run_command("readlink #{path}").stdout.strip
    end

    def content
      s = Specinfra::Runner.get_file_content(@path).stdout
      # if we get some content, return it
      return s unless s.empty?

      # if we didn't get any content, we have to decide if this is
      # really an empty file (i.e. where content == empty string)
      # or if something else is going on.

      # in case it is a folder or the path doesn't exist, always
      # return nil instead of empty content
      return nil if directory? or !exist?

      # in case we can't get the size, something is wrong, so return nil
      # in case the size is non-zero, we couldn't read the file, so
      # return nil to indicate that
      i = size
      return nil if i.nil? or i > 0

      # return the empty string, as the file doesn't contain anything
      s
    end

    def md5sum
      s = Specinfra::Runner.get_file_md5sum(@path).stdout.strip
      return nil if s.empty? or s.include?(' ')
      s
    end

    def sha256sum
      s = Specinfra::Runner.get_file_sha256sum(@path).stdout.strip
      return nil if s.empty? or s.include?(' ')
      s
    end

    def mtime
      mt = Specinfra::Runner.get_file_mtime(@path).stdout.strip
      return nil if mt.empty? || mt.include?(' ')
      mt.to_i
    end

    def size
      s = Specinfra::Runner.get_file_size(@path).stdout.strip
      return nil if s.empty? || s.include?(' ')
      s.to_i
    end

    def selinux_label
      res = Specinfra::Runner.get_file_selinuxlabel(@path).stdout.strip
      return nil if res.empty? or res == '?' or
                    res.include?('failed to get security context') or
                    res.include?('cannot stat')
      res
    rescue NotImplementedError => _
      nil
    end

    def mounted?(opts = {}, only_with = nil)
      Specinfra::Runner.check_file_is_mounted(@path, opts, only_with)
    end

    def immutable?
      Specinfra::Runner.get_file_immutable(@path)
    end

    def product_version
      return nil unless @backend.os[:family] == 'windows'
      res = Specinfra::Runner.
            run_command("(Get-Command '#{@path}').FileVersionInfo.ProductVersion").
            stdout.strip
      res.empty? ? nil : res
    end

    def file_version
      return nil unless @backend.os[:family] == 'windows'
      res = Specinfra::Runner.
            run_command("(Get-Command '#{@path}').FileVersionInfo.FileVersion").
            stdout.strip
      res.empty? ? nil : res
    end
  end
end
