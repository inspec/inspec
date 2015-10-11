# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann
#
# This is heavily based on:
#
#   OHAI https://github.com/chef/ohai
#   by Adam Jacob, Chef Software Inc
#

require 'rbconfig'

class Train::Transports::Local
  class OS < OSCommon
    def initialize(backend)
      super(backend, { family: detect_local_os })
    end

    private

    def detect_local_os
      case ::RbConfig::CONFIG['host_os']
      when /aix(.+)$/
        return 'aix'
      when /darwin(.+)$/
        return 'darwin'
      when /hpux(.+)$/
        return 'hpux'
      when /linux/
        return 'linux'
      when /freebsd(.+)$/
        return 'freebsd'
      when /openbsd(.+)$/
        return 'openbsd'
      when /netbsd(.*)$/
        return 'netbsd'
      when /solaris2/
        return 'solaris2'
      when /mswin|mingw32|windows/
        # After long discussion in IRC the "powers that be" have come to a consensus
        # that no Windows platform exists that was not based on the
        # Windows_NT kernel, so we herby decree that "windows" will refer to all
        # platforms built upon the Windows_NT kernel and have access to win32 or win64
        # subsystems.
        return 'windows'
      else
        return ::RbConfig::CONFIG['host_os']
      end
    end
  end
end
