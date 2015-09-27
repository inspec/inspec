# encoding: utf-8
#
# This is heavily based on:
#
#   OHAI https://github.com/chef/ohai
#   by Adam Jacob, Chef Software Inc
#

require 'vulcano/plugins/backend_detect_darwin'
require 'vulcano/plugins/backend_detect_linux'
require 'vulcano/plugins/backend_detect_unix'
require 'vulcano/plugins/backend_detect_windows'

class Vulcano::Plugins::Backend
  class OSCommon
    include DetectDarwin
    include DetectLinux
    include DetectUnix
    include DetectWindows

    def initialize(backend, platform = nil)
      @backend = backend
      @platform = platform || {}
      detect_family
    end

    def [](key)
      @platform[key]
    end

    REDHAT_FAMILY = %w{
      redhat oracle centos fedora
    }

    DEBIAN_FAMILY = %w{
      debian ubuntu linuxmint raspbian
    }

    SUSE_FAMILY = %w{
      suse opensuse
    }

    LINUX_FAMILY = %w{gentoo arch slackware exherbo alpine coreos} +
                   REDHAT_FAMILY + DEBIAN_FAMILY + SUSE_FAMILY

    OSX_FAMILY = %{darwin mac_os_x}

    SOLARIS_FAMILY = %w{
      solaris smartos openindiana opensolaris solaris2 nexentacore
    }

    BSD_FAMILY = %w{freebsd netbsd openbsd}

    UNIX_FAMILY = %w{unix aix} + LINUX_FAMILY + OSX_FAMILY + SOLARIS_FAMILY

    # Helper methods to check the OS type
    def unix?
      UNIX_FAMILY.include?(@platform[:family])
    end

    def bsd?
      BSD_FAMILY.include?(@platform[:family])
    end

    def solaris?
      SOLARIS_FAMILY.include?(@platform[:family])
    end

    def linux?
      LINUX_FAMILY.include?(@platform[:family])
    end

    private

    def detect_family
      # if some information is already defined, try to verify it
      # with the remaining detection
      unless @platform[:family].nil?
        # return ok if the preconfigured family yielded a good result
        return true if detect_family_type
        # if not, reset the platform to presets and run the full detection
        # TODO: print an error message in this case, as the instantiating
        # backend is doing something wrong
        @platform = {}
      end

      # TODO: extend base implementation for detecting the family type
      # to Windows and others
      case uname_s
      when /linux/i
        @platform[:family] = 'linux'
      when /./
        @platform[:family] = 'unix'
      else
        # Don't know what this is
        @platform[:family] = nil
      end

      # try to detect the platform
      return nil unless @platform[:family].nil?
      detect_family_type
    end

    def detect_family_type
      pf = @platform[:family]

      return detect_windos if pf == 'windows'
      return detect_darwin if pf == 'darwin'

      if %w{freebsd netbsd openbsd aix solaris2}.include?(pf)
        return detect_via_uname
      end

      # unix based systems combine the above
      return true if pf == 'unix' and detect_darwin
      return true if pf == 'unix' and detect_via_uname

      # if we arrive here, we most likey have a regular linux
      detect_linux
    end

    def get_config(path)
      res = @backend.run_command("test -f #{path} && cat #{path}")
      # ignore files that can't be read
      return nil if res.exit_status != 0
      res.stdout
    end

    def unix_file?(path)
      @backend.run_command("test -f #{path}").exit_status == 0
    end
  end
end
