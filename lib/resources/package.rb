# encoding: utf-8

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
    case os[:family]
    when 'ubuntu', 'debian'
      @pkgman = Deb.new(vulcano)
    when 'redhat', 'fedora'
      @pkgman = Rpm.new(vulcano)
    when 'arch'
      @pkgman = Pacman.new(vulcano)
    when 'darwin'
      @pkgman = Brew.new(vulcano)
    else
      fail 'The `package` resource is not supported on your OS yet. Please open an issue on Github.'
    end
  end

  # returns true if the package is installed
  def installed?(provider = nil, version = nil)
    !info.nil?
  end

  # returns the package description
  def info
    return @cache if !@cache.nil?
    @pkgman.info(@package_name)
  end

  # return the package version
  def version
    info = @pkgman.info(@package_name)
    return nil if info.nil?
    info[:version]
  end

  def to_s
    "System package #{@package_name}"
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
    cmd = @vulcano.run_command("dpkg -s #{package_name}")
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
    cmd = @vulcano.run_command("rpm -qia  #{package_name}")
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
    cmd = @vulcano.run_command("brew info --json=v1 #{package_name}")
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
    cmd = @vulcano.run_command("pacman -Qi  #{package_name}")
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
