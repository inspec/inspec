# encoding: utf-8
#
# This is heavily based on:
#
#   OHAI https://github.com/chef/ohai
#   by Adam Jacob, Chef Software Inc
#

class Vulcano::Plugins::Backend
  class OSCommon
    def initialize(backend, platform = nil)
      @backend = backend
      @platform = platform || {}
      detect_family
    end

    def [](key)
      @platform[key]
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
      # TODO: base implementation for detecting the family type
    end

    def detect_family_type
      case @platform[:family]
      when 'windows'
        detect_windows
      when 'darwin'
        detect_darwin
      when 'freebsd', 'netbsd', 'openbsd', 'aix', 'solaris2'
        detect_via_uname
      else
        detect_other
      end
    end

    # Product Type:
    # Work Station (1)
    # Domain Controller (2)
    # Server (3)
    WindowsVersions = {
      '0' => '3.1',
      '140' => '95',
      '1410' => '98',
      '1490' => 'ME',
      '1351' => 'NT 3.51',
      '3351' => 'NT 3.51 Server',
      '1240' => 'NT 4.0',
      '3240' => 'NT 4.0 Server',
      '1250' => '2000',
      '1251' => 'XP',
      '3252' => 'Server 2003',
      '3260' => 'Server 2003 R2',
      '1252' => 'Vista',
      '3252' => 'Server 2008',
      '1261' => '7',
      '3261' => 'Server 2008 R2',
      '1262' => '8',
      '3262' => 'Server 2012',
      '1263' => '8.1',
      '3263' => 'Server 2012 R2',
      '12100' => '10',
      '32100' => 'Server 2016',
    }

    def windows_version(json)
      producttype = json['OS']['ProductType'].to_s
      producttype = '3' if producttype == '2'
      platform = json['OSVersion']['Platform'].to_s
      major = json['OSVersion']['Version']['Major'].to_s
      minor = json['OSVersion']['Version']['Minor'].to_s
      # construct it
      producttype + platform + major + minor
    end

    def detect_windows
      cmd = 'New-Object -Type PSObject | Add-Member -MemberType NoteProperty '\
            '-Name OS -Value (Get-WmiObject -Class Win32_OperatingSystem) '\
            '-PassThru | Add-Member -MemberType NoteProperty -Name OSVersion '\
            '-Value ([Environment]::OSVersion) -PassThru | ConvertTo-Json'
      res = @backend.run_command(cmd)
      # TODO: error as this shouldnt be happening at this point
      return false if res.exit_status != 0 or res.stdout.empty?

      json = JSON.parse(res.stdout)
      return false if json.nil? or json.empty?
      version = windows_version(json)

      @platform[:family] = 'windows'
      @platform[:name] = versions[version]
      @platform[:release] = version
      true
    end

    def detect_darwin
      cmd = @backend.run_command('/usr/bin/sw_vers')
      # TODO: print an error in this step of the detection,
      # as it shouldnt happen
      return false if cmd.exit_status != 0
      # TODO: ditto on error
      return false if cmd.stdout.empty?

      name = cmd.stdout[/^ProductName:\s+(.+)$/, 1]
      # TODO: ditto on error
      return false if name.nil?
      @platform[:name] = name.downcase.chomp.tr(' ', '_')
      @platform[:release] = cmd.stdout[/^ProductVersion:\s+(.+)$/, 1]
      @platform[:build] = cmd.stdout[/^BuildVersion:\s+(.+)$/, 1]
      # TODO: keep for now due to backwards compatibility with serverspec
      @platform[:family] = 'darwin'
      true
    end

    def detect_via_uname
      case uname_s.downcase
      when /aix/
        @platform[:family] = 'aix'
        out = @backend.run_command('uname -rvp').stdout
        m = out.match(/(\d+)\s+(\d+)\s+(.*)/)
        unless m.nil?
          @platform[:release] = "#{m[2]}.#{m[1]}"
          @platform[:arch] = m[3].to_s
        end

      when /freebsd/
        @platform[:family] = 'freebsd'
        @platform[:name] = uname_s.lines[0].chomp
        @platform[:release] = uname_r.lines[0].chomp

      when /netbsd/
        @platform[:family] = 'netbsd'
        @platform[:name] = uname_s.lines[0].chomp
        @platform[:release] = uname_r.lines[0].chomp

      when /openbsd/
        @platform[:family] = 'openbsd'
        @platform[:name] = uname_s.lines[0].chomp
        @platform[:release] = uname_r.lines[0].chomp

      when /sunos/
        @platform[:family] = 'solaris'
        if uname_r =~ /5\.10/
          # TODO: should be string!
          @platform[:release] = 10
        else
          rel = get_config('/etc/release')
          case rel
          when /^.*(SmartOS).*$/
            @platform[:family] = 'smartos'
          when !(m = /^\s*(OmniOS).*r(\d+).*$/).nil?
            @platform[:family] = 'omnios'
            @platform[:release] = m[2]
          when !(m = /^\s*(OpenIndiana).*oi_(\d+).*$/).nil?
            @platform[:family] = 'openindiana'
            @platform[:release] = m[2]
          when /^\s*(OpenSolaris).*snv_(\d+).*$/
            @platform[:family] = 'opensolaris'
            @platform[:release] = m[2]
          when !(m = /Oracle Solaris (\d+)/).nil?
            # TODO: should be string!
            @platform[:release] = m[1].to_i
            @platform[:family] = 'solaris2'
          when /^\s*(Solaris)\s.*$/
            @platform[:family] = 'solaris2'
          when /^\s*(NexentaCore)\s.*$/
            @platform[:family] = 'nexentacore'
          end
        end

      else
        # in all other cases we didn't detect it
        return false
      end
      # when we get here the detection returned a result
      true
    end

    def detect_linux_via_config
      if !(raw = get_config('oracle-release')).nil?
        @platform[:family] = 'oracle'
        @platform[:release] = redhatish_version(raw)
      elsif !(raw = get_config('/etc/enterprise-release')).nil?
        @platform[:family] = 'oracle'
        @platform[:release] = redhatish_version(raw)
      elsif !(_raw = get_config('/etc/debian_version')).nil?
        case lsb[:id]
        when /ubuntu/i
          @platform[:family] = 'ubuntu'
          @platform[:release] = lsb[:release]
        when /linuxmint/i
          @platform[:family] = 'linuxmint'
          @platform[:release] = lsb[:release]
        else
          @platform[:family] = 'debian'
          @platform[:family] = 'raspbian' if unix_file?('/usr/bin/raspi-config')
          if !(rel = get_config('/etc/debian_version')).nil?
            @platform[:release] = rel.chomp
          end
        end
      elsif !(raw = get_config('/etc/parallels-release')).nil?
        @platform[:family] = redhatish_platform(raw)
        @platform[:release] = raw[/(\d\.\d\.\d)/, 1]
      elsif !(raw = get_config('/etc/redhat-release')).nil?
        # TODO: Cisco
        @platform[:family] = redhatish_platform(raw)
        @platform[:release] = redhatish_version(raw)
      elsif !(raw = get_config('/etc/system-release')).nil?
        # Amazon Linux
        @platform[:family] = redhatish_platform(raw)
        @platform[:release] = redhatish_version(raw)
      elsif !(suse = get_config('/etc/SuSE-release')).nil?
        version = suse.scan(/VERSION = (\d+)\nPATCHLEVEL = (\d+)/).flatten.join('.')
        version = suse[/VERSION = ([\d\.]{2,})/, 1] if version == ''
        @platform[:release] = version
        @platform[:family] = 'suse'
        @platform[:family] = 'opensuse' if suse =~ /^openSUSE/
      elsif !(raw = get_config('/etc/arch-release')).nil?
        @platform[:family] = 'arch'
        # Because this is a rolling release distribution,
        # use the kernel release, ex. 4.1.6-1-ARCH
        @platform[:release] = uname_r
      elsif !(raw = get_config('/etc/slackware-version')).nil?
        @platform[:family] = 'slackware'
        @platform[:release] = raw.scan(/(\d+|\.+)/).join
      elsif !(raw = get_config('/etc/exherbo-release')).nil?
        @platform[:family] = 'exherbo'
        # Because this is a rolling release distribution,
        # use the kernel release, ex. 4.1.6
        @platform[:release] = uname_r
      elsif !(raw = get_config('/etc/gentoo-release')).nil?
        @platform[:family] = 'gentoo'
        @platform[:release] = raw.scan(/(\d+|\.+)/).join
      elsif !(raw = get_config('/etc/alpine-release')).nil?
        @platform[:family] = 'alpine'
        @platform[:release] = raw.strip
      elsif !(raw = get_config('/etc/coreos/update.conf')).nil?
        @platform[:family] = 'coreos'
        meta = lsb_config(raw)
        @platform[:release] = meta[:release]
      else
        # in all other cases we didn't detect it
        return false
      end
      # when we get here the detection returned a result
      true
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

    def uname_s
      @uname_s ||= @backend.run_command('uname -s').stdout
    end

    def uname_r
      @uname_r ||= (
        res = @backend.run_command('uname -r').stdout
        res.strip! unless res.nil?
        res
      )
    end

    def detect_other
      # TODO: print an error in this step of the detection
      return false if uname_s.nil? || uname_s.empty?
      return false if uname_r.nil? || uname_r.empty?

      return true if detect_linux_via_config
      return true if detect_linux_via_lsb
      # in all other cases we failed the detection
      @platform[:family] = 'unknown'
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

    def redhatish_platform(conf)
      conf[/^red hat/i] ? 'redhat' : conf[/(\w+)/i, 1].downcase
    end

    def redhatish_version(conf)
      conf[/rawhide/i] ? conf[/((\d+) \(Rawhide\))/i, 1].downcase : conf[/release ([\d\.]+)/, 1]
    end

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
      return @lsb unless @lsb.nil?
      @lsb = {}
      if !(raw = get_config('/etc/lsb-release')).nil?
        @lsb = lsb_config(raw)
      elsif unix_file?('/usr/bin/lsb_release')
        @lsb = lsb_release
      end
      @lsb
    end
  end
end
