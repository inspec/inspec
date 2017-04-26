# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

# Resource to determine package information
#
# Usage:
# describe package('nginx') do
#   it { should be_installed }
# end
module Inspec::Resources
  class Package < Inspec.resource(1)
    name 'package'
    desc 'Use the package InSpec audit resource to test if the named package and/or package version is installed on the system.'
    example "
      describe package('nginx') do
        it { should be_installed }
        its('version') { should eq 1.9.5 }
      end
    "

    def initialize(package_name = nil) # rubocop:disable Metrics/AbcSize
      @package_name = package_name
      @name = @package_name
      @cache = nil
      # select package manager
      @pkgman = nil

      os = inspec.os
      if os.debian?
        @pkgman = Deb.new(inspec)
      elsif os.redhat? || %w{suse amazon fedora}.include?(os[:family])
        @pkgman = Rpm.new(inspec)
      elsif ['arch'].include?(os[:family])
        @pkgman = Pacman.new(inspec)
      elsif ['darwin'].include?(os[:family])
        @pkgman = Brew.new(inspec)
      elsif inspec.os.windows?
        @pkgman = WindowsPkg.new(inspec)
      elsif ['aix'].include?(os[:family])
        @pkgman = BffPkg.new(inspec)
      elsif os.solaris?
        @pkgman = SolarisPkg.new(inspec)
      elsif ['hpux'].include?(os[:family])
        @pkgman = HpuxPkg.new(inspec)
      else
        return skip_resource 'The `package` resource is not supported on your OS yet.'
      end
    end

    # returns true if the package is installed
    def installed?(_provider = nil, _version = nil)
      return false if info.nil?
      info[:installed] == true
    end

    # returns the package description
    def info
      return @cache if !@cache.nil?
      return nil if @pkgman.nil?
      @pkgman.info(@package_name)
    end

    # return the package version
    def version
      info = @pkgman.info(@package_name)
      return nil if info.nil?
      info[:version]
    end

    def to_s
      "System Package #{@package_name}"
    end
  end

  class PkgManagement
    attr_reader :inspec
    def initialize(inspec)
      @inspec = inspec
    end
  end

  # Debian / Ubuntu
  class Deb < PkgManagement
    def info(package_name)
      cmd = inspec.command("dpkg -s #{package_name}")
      return nil if cmd.exit_status.to_i != 0

      params = SimpleConfig.new(
        cmd.stdout.chomp,
        assignment_regex: /^\s*([^:]*?)\s*:\s*(.*?)\s*$/,
        multiple_values: false,
      ).params
      # If the package is removed and not purged, Status is "deinstall ok config-files" with exit_status 0
      # If the package is purged cmd fails with non-zero exit status
      {
        name: params['Package'],
        installed: params['Status'].split(' ').first == 'install',
        version: params['Version'],
        type: 'deb',
      }
    end
  end

  # RHEL family
  class Rpm < PkgManagement
    def info(package_name)
      cmd = inspec.command("rpm -qia #{package_name}")
      # CentOS does not return an error code if the package is not installed,
      # therefore we need to check for emptyness
      return nil if cmd.exit_status.to_i != 0 || cmd.stdout.chomp.empty?
      params = SimpleConfig.new(
        cmd.stdout.chomp,
        assignment_regex: /^\s*([^:]*?)\s*:\s*(.*?)\s*$/,
        multiple_values: false,
      ).params
      # On some (all?) systems, the linebreak before the vendor line is missing
      if params['Version'] =~ /\s*Vendor:/
        v = params['Version'].split(' ')[0]
      else
        v = params['Version']
      end
      # On some (all?) systems, the linebreak before the build line is missing
      if params['Release'] =~ /\s*Build Date:/
        r = params['Release'].split(' ')[0]
      else
        r = params['Release']
      end
      {
        name: params['Name'],
        installed: true,
        version: "#{v}-#{r}",
        type: 'rpm',
      }
    end
  end

  # MacOS / Darwin implementation
  class Brew < PkgManagement
    def info(package_name)
      cmd = inspec.command("brew info --json=v1 #{package_name}")
      return nil if cmd.exit_status.to_i != 0
      # parse data
      pkg = JSON.parse(cmd.stdout)[0]
      {
        name: pkg['name'],
        installed: true,
        version: pkg['installed'][0]['version'],
        type: 'brew',
      }
    rescue JSON::ParserError => _e
      return nil
    end
  end

  # Arch Linux
  class Pacman < PkgManagement
    def info(package_name)
      cmd = inspec.command("pacman -Qi #{package_name}")
      return nil if cmd.exit_status.to_i != 0

      params = SimpleConfig.new(
        cmd.stdout.chomp,
        assignment_regex: /^\s*([^:]*?)\s*:\s*(.*?)\s*$/,
        multiple_values: false,
      ).params

      {
        name: params['Name'],
        installed: true,
        version: params['Version'],
        type: 'pacman',
      }
    end
  end

  class HpuxPkg < PkgManagement
    def info(package_name)
      cmd = inspec.command("swlist -l product | grep #{package_name}")
      return nil if cmd.exit_status.to_i != 0
      pkg = cmd.stdout.strip.split(' ')
      {
        name: pkg[0],
        installed: true,
        version: pkg[1],
        type: 'pkg',
      }
    end
  end

  # Determines the installed packages on Windows using the Windows package registry entries.
  # @see: http://blogs.technet.com/b/heyscriptingguy/archive/2013/11/15/use-powershell-to-find-installed-software.aspx
  class WindowsPkg < PkgManagement
    def info(package_name)
      search_paths = [
        'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*',
        'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*',
      ]

      # add 64 bit search paths
      if inspec.os.arch == 'x86_64'
        search_paths << 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*'
        search_paths << 'HKCU:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*'
      end

      # Find the package
      cmd = inspec.command <<-EOF.gsub(/^\s*/, '')
        Get-ItemProperty (@("#{search_paths.join('", "')}") | Where-Object { Test-Path $_ }) |
        Where-Object { $_.DisplayName -like "#{package_name}" -or $_.PSChildName -like "#{package_name}" } |
        Select-Object -Property DisplayName,DisplayVersion | ConvertTo-Json
      EOF

      begin
        package = JSON.parse(cmd.stdout)
      rescue JSON::ParserError => _e
        return nil
      end

      # What if we match multiple packages?  just pick the first one for now.
      package = package[0] if package.is_a?(Array)

      {
        name: package['DisplayName'],
        installed: true,
        version: package['DisplayVersion'],
        type: 'windows',
      }
    end
  end

  # AIX
  class BffPkg < PkgManagement
    def info(package_name)
      cmd = inspec.command("lslpp -cL #{package_name}")
      return nil if cmd.exit_status.to_i != 0

      bff_pkg = cmd.stdout.split("\n").last.split(':')
      {
        name:      bff_pkg[1],
        installed: true,
        version:   bff_pkg[2],
        type:      'bff',
      }
    end
  end

  # Solaris
  class SolarisPkg < PkgManagement
    def info(package_name)
      if inspec.os[:release].to_i <= 10
        solaris10_info(package_name)
      else
        solaris11_info(package_name)
      end
    end

    # solaris 10
    def solaris10_info(package_name)
      cmd = inspec.command("pkginfo -l #{package_name}")
      return nil if cmd.exit_status.to_i != 0

      params = SimpleConfig.new(
        cmd.stdout.chomp,
        assignment_regex: /^\s*([^:]*?)\s*:\s*(.*?)\s*$/,
        multiple_values: false,
      ).params

      # parse 11.10.0,REV=2006.05.18.01.46
      v = params['VERSION'].split(',')
      {
        name: params['PKGINST'],
        installed: true,
        version: v[0] + '-' + v[1].split('=')[1],
        type: 'pkg',
      }
    end

    # solaris 11
    def solaris11_info(package_name)
      cmd = inspec.command("pkg info #{package_name}")
      return nil if cmd.exit_status.to_i != 0

      params = SimpleConfig.new(
        cmd.stdout.chomp,
        assignment_regex: /^\s*([^:]*?)\s*:\s*(.*?)\s*$/,
        multiple_values: false,
      ).params

      {
        name: params['Name'],
        installed: true,
        # 0.5.11-0.175.3.1.0.5.0
        version: "#{params['Version']}-#{params['Branch']}",
        type: 'pkg',
      }
    end
  end
end
