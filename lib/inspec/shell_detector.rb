# encoding: utf-8
require 'etc'
require 'rbconfig'

module Inspec
  #
  # ShellDetector attempts to detect the shell the invoking user is
  # running by checking:
  #
  #  - The command of our parent
  #  - The SHELL environment variable
  #  - The shell returned by getpwuid for our process UID
  #
  # Since none of these methods is fullproof, the detected shell is
  # verified against a list of known shells before being returned to
  # the caller.
  #
  class ShellDetector
    NOT_DETECTED = Object.new.freeze
    KNOWN_SHELLS = %w{bash zsh ksh csh sh fish}.freeze

    def initialize
      @shell = NOT_DETECTED
    end

    def shell
      @shell = detect if !detected?(@shell)
      @shell
    end

    def shell!
      @shell = detect
    end

    private

    def detect
      # Most of our detection code assumes a unix-like environment
      return nil if RbConfig::CONFIG['host_os'] =~ /mswin|mingw|cygwin/

      shellpath = detect_by_ppid

      if shellpath.nil? || shellpath.empty? || !known_shell?(shellpath)
        shellpath = detect_by_env
      end

      if shellpath.nil? || shellpath.empty? || !known_shell?(shellpath)
        shellpath = detect_by_getpwuid
      end

      shellname(shellpath) if known_shell?(shellpath)
    end

    def detected?(arg)
      arg != NOT_DETECTED
    end

    def detect_by_ppid
      ppid = Process.ppid
      if Dir.exist?('/proc')
        File.readlink("/proc/#{ppid}/exe")
      else
        `ps -cp #{ppid} -o command=`.chomp
      end
    end

    def detect_by_env
      ENV['SHELL']
    end

    def detect_by_getpwuid
      Etc.getpwuid(Process.uid).shell
    end

    #
    # Strip any leading path elements
    #
    def shellname(shellpath)
      shellpath.split('/').last
    end

    #
    # Only return shells that we know about, just to be sure we never
    # do anything very silly.
    #
    def known_shell?(shell)
      KNOWN_SHELLS.include?(shellname(shell))
    end
  end
end
