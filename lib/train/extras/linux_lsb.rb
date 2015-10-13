# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann
#
# This is heavily based on:
#
#   OHAI https://github.com/chef/ohai
#   by Adam Jacob, Chef Software Inc
#

module Train::Extras
  module LinuxLSB
    def lsb_config(content)
      {
        id:       content[/^DISTRIB_ID=["']?(.+?)["']?$/, 1],
        release:  content[/^DISTRIB_RELEASE=["']?(.+?)["']?$/, 1],
        codename: content[/^DISTRIB_CODENAME=["']?(.+?)["']?$/, 1],
      }
    end

    def lsb_release
      raw = @backend.run_command('lsb_release -a').stdout
      {
        id:       raw[/^Distributor ID:\s+(.+)$/, 1],
        release:  raw[/^Release:\s+(.+)$/, 1],
        codename: raw[/^Codename:\s+(.+)$/, 1],
      }
    end

    def lsb
      return @lsb if defined?(@lsb)
      @lsb = {}
      if !(raw = get_config('/etc/lsb-release')).nil?
        @lsb = lsb_config(raw)
      elsif unix_file?('/usr/bin/lsb_release')
        @lsb = lsb_release
      end
      @lsb
    end

    def detect_linux_via_lsb
      return false if lsb[:id].nil?
      id = lsb[:id].downcase
      case id
      when /redhat/
        @platform[:family] = 'redhat'
      when /amazon/
        @platform[:family] = 'amazon'
      when /scientificsl/
        @platform[:family] = 'scientific'
      when /xenserver/
        @platform[:family] = 'xenserver'
      else
        @platform[:family] = id
      end
      @platform[:release] = lsb[:release]
      true
    end
  end
end
