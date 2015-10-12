# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

# Resource to determine package information
#
# Usage:
# describe package('nginx') do
#   it { should be_installed }
# end
class Package < Vulcano.resource(1)
  name 'package'

  def initialize(package_name = nil)
    @package_name = package_name
    @name = @package_name
    @cache = nil

    # select package manager
    @pkgman = nil
    case vulcano.os[:family]
    when 'ubuntu', 'debian'
      @pkgman = Deb.new(vulcano)
    when 'redhat', 'fedora'
      @pkgman = Rpm.new(vulcano)
    when 'arch'
      @pkgman = Pacman.new(vulcano)
    when 'darwin'
      @pkgman = Brew.new(vulcano)
    when 'windows'
      @pkgman = WindowsPkg.new(vulcano)
    else
      return skip_resource 'The `package` resource is not supported on your OS yet.'
    end
  end

  # returns true if the package is installed
  def installed?(_provider = nil, _version = nil)
    !info.nil?
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
  def initialize(vulcano)
    @vulcano = vulcano
  end
end

# Debian / Ubuntu
class Deb < PkgManagement
  def info(package_name)
    cmd = @vulcano.command("dpkg -s #{package_name}")
    return nil if cmd.exit_status.to_i != 0

    params = SimpleConfig.new(
      cmd.stdout.chomp,
      assignment_re: /^\s*([^:]*?)\s*:\s*(.*?)\s*$/,
      multiple_values: false,
    ).params
    {
      name: params['Package'],
      installed: true,
      version: params['Version'],
      type: 'deb',
    }
  end
end

# RHEL family
class Rpm < PkgManagement
  def info(package_name)
    cmd = @vulcano.command("rpm -qia #{package_name}")
    return nil if cmd.exit_status.to_i != 0
    params = SimpleConfig.new(
      cmd.stdout.chomp,
      assignment_re: /^\s*([^:]*?)\s*:\s*(.*?)\s*$/,
      multiple_values: false,
    ).params
    {
      name: params['Name'],
      installed: true,
      version: params['Version'],
      type: 'rpm',
    }
  end
end

# MacOS / Darwin implementation
class Brew < PkgManagement
  def info(package_name)
    cmd = @vulcano.command("brew info --json=v1 #{package_name}")
    return nil if cmd.exit_status.to_i != 0
    # parse data
    pkg = JSON.parse(cmd.stdout)[0]
    {
      name: "#{pkg.name}",
      installed: true,
      version: "#{pkg.installed.version}",
      type: 'brew',
    }
  end
end

# Arch Linux
class Pacman < PkgManagement
  def info(package_name)
    cmd = @vulcano.command("pacman -Qi #{package_name}")
    return nil if cmd.exit_status.to_i != 0

    params = SimpleConfig.new(
      cmd.stdout.chomp,
      assignment_re: /^\s*([^:]*?)\s*:\s*(.*?)\s*$/,
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

# Determines the installed packages on Windows
# Currently we use 'Get-WmiObject -Class Win32_Product' as a detection method
# TODO: evaluate if alternative methods as proposed by Microsoft are still valid:
# @see: http://blogs.technet.com/b/heyscriptingguy/archive/2013/11/15/use-powershell-to-find-installed-software.aspx
class WindowsPkg < PkgManagement
  def info(package_name)
    # Find the package
    cmd = @vulcano.command("Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -eq '#{package_name}'} | Select-Object -Property Name,Version,Vendor,PackageCode,Caption,Description | ConvertTo-Json")

    begin
      package = JSON.parse(cmd.stdout)
    rescue JSON::ParserError => _e
      return nil
    end

    {
      name: package['Name'],
      installed: true,
      version: package['Version'],
      type: 'windows',
    }
  end
end
