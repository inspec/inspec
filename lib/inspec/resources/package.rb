# Resource to determine package information
#
# Usage:
# describe package('nginx') do
#   it { should be_installed }
# end
module Inspec::Resources
  class Package < Inspec.resource(1)
    name 'package'
    supports platform: 'unix'
    supports platform: 'windows'
    desc 'Use the package InSpec audit resource to test if the named package and/or package version is installed on the system.'
    example <<~EXAMPLE
      describe package('nginx') do
        it { should be_installed }
        it { should_not be_held } # for dpkg platforms that support holding a version from being upgraded
        its('version') { should eq 1.9.5 }
      end
    EXAMPLE
    def initialize(package_name, opts = {}) # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
      @package_name = package_name
      @name = @package_name
      @cache = nil
      # select package manager
      @pkgman = nil

      os = inspec.os
      if os.debian?
        @pkgman = Deb.new(inspec)
      elsif os.redhat? || %w{suse amazon fedora}.include?(os[:family])
        @pkgman = Rpm.new(inspec, opts)
      elsif ['arch'].include?(os[:name])
        @pkgman = Pacman.new(inspec)
      elsif ['darwin'].include?(os[:family])
        @pkgman = Brew.new(inspec)
      elsif os.windows?
        @pkgman = WindowsPkg.new(inspec)
      elsif ['aix'].include?(os[:family])
        @pkgman = BffPkg.new(inspec)
      elsif os.solaris?
        @pkgman = SolarisPkg.new(inspec)
      elsif ['hpux'].include?(os[:family])
        @pkgman = HpuxPkg.new(inspec)
      elsif ['alpine'].include?(os[:name])
        @pkgman = AlpinePkg.new(inspec)
      else
        raise Inspec::Exceptions::ResourceSkipped, 'The `package` resource is not supported on your OS yet.'
      end

      evaluate_missing_requirements
    end

    # returns true if the package is installed
    def installed?(_provider = nil, _version = nil)
      info[:installed] == true
    end

    # returns true it the package is held (if the OS supports it)
    def held?(_provider = nil, _version = nil)
      info[:held] == true
    end

    # returns the package description
    def info
      return @cache if !@cache.nil?
      # All `@pkgman.info` methods return `{}`. This matches that
      # behavior if `@pkgman` can't be determined, thus avoiding the
      # `undefined method 'info' for nil:NilClass` error
      return {} if @pkgman.nil?
      @pkgman.info(@package_name)
    end

    # return the package version
    def version
      info = @pkgman.info(@package_name)
      info[:version]
    end

    def to_s
      "System Package #{@package_name}"
    end

    private

    def evaluate_missing_requirements
      missing_requirements_string = @pkgman.missing_requirements.uniq.join(', ')
      return if missing_requirements_string.empty?
      raise Inspec::Exceptions::ResourceSkipped, "The following requirements are not met for this resource: #{missing_requirements_string}"
    end
  end

  class PkgManagement
    attr_reader :inspec
    def initialize(inspec)
      @inspec = inspec
    end

    def missing_requirements
      # Each provider can provide an Array of missing requirements that will be
      # combined into a `ResourceSkipped` exception message.
      []
    end
  end

  # Debian / Ubuntu
  class Deb < PkgManagement
    def info(package_name)
      cmd = inspec.command("dpkg -s #{package_name}")
      return {} if cmd.exit_status.to_i != 0

      params = SimpleConfig.new(
        cmd.stdout.chomp,
        assignment_regex: /^\s*([^:]*?)\s*:\s*(.*?)\s*$/,
        multiple_values: false,
      ).params
      # If the package is installed, Status is "install ok installed"
      # If the package is installed and marked hold, Status is "hold ok installed"
      # If the package is removed and not purged, Status is "deinstall ok config-files" with exit_status 0
      # If the package is purged cmd fails with non-zero exit status
      {
        name: params['Package'],
        installed: params['Status'].split(' ')[2] == 'installed',
        held: params['Status'].split(' ')[0] == 'hold',
        version: params['Version'],
        type: 'deb',
      }
    end
  end

  # RHEL family
  class Rpm < PkgManagement
    def initialize(inspec, opts)
      super(inspec)

      @dbpath = opts.fetch(:rpm_dbpath, nil)
    end

    def missing_requirements
      missing_requirements = []

      unless @dbpath.nil? || inspec.directory(@dbpath).directory?
        missing_requirements << "RPMDB #{@dbpath} does not exist"
      end

      missing_requirements
    end

    def info(package_name)
      rpm_cmd = rpm_command(package_name)
      cmd = inspec.command(rpm_cmd)
      # CentOS does not return an error code if the package is not installed,
      # therefore we need to check for emptyness
      return {} if cmd.exit_status.to_i != 0 || cmd.stdout.chomp.empty?
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

    private

    def rpm_command(package_name)
      cmd = ''
      cmd += 'rpm -qi'
      cmd += " --dbpath #{@dbpath}" if @dbpath
      cmd += ' ' + package_name

      cmd
    end
  end

  # MacOS / Darwin implementation
  class Brew < PkgManagement
    def info(package_name)
      brew_path = inspec.command('brew').exist? ? 'brew' : '/usr/local/bin/brew'
      cmd = inspec.command("#{brew_path} info --json=v1 #{package_name}")

      # If no available formula exists, then `brew` will exit non-zero
      return {} if cmd.exit_status.to_i != 0

      pkg = JSON.parse(cmd.stdout)[0]

      # If package exists but is not installed, then `brew` output will not
      # contain `pkg['installed'][0]['version']
      return {} unless pkg.dig('installed', 0, 'version')

      {
        name: pkg['name'],
        installed: true,
        version: pkg['installed'][0]['version'],
        type: 'brew',
      }
    rescue JSON::ParserError => e
      raise Inspec::Exceptions::ResourceFailed,
            'Failed to parse JSON from `brew` command. ' \
            "Error: #{e}"
    end
  end

  # Arch Linux
  class Pacman < PkgManagement
    def info(package_name)
      cmd = inspec.command("pacman -Qi #{package_name}")
      return {} if cmd.exit_status.to_i != 0

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
      return {} if cmd.exit_status.to_i != 0
      pkg = cmd.stdout.strip.split(' ')
      {
        name: pkg[0],
        installed: true,
        version: pkg[1],
        type: 'pkg',
      }
    end
  end

  class AlpinePkg < PkgManagement
    def info(package_name)
      cmd = inspec.command("apk info -vv --no-network | grep #{package_name}")
      return {} if cmd.exit_status.to_i != 0

      pkg_info = cmd.stdout.split("\n").delete_if { |e| e =~ /^WARNING/i }
      pkg = pkg_info[0].split(' - ')[0]

      {
        name: pkg.partition('-')[0],
        installed: true,
        version: pkg.partition('-')[2],
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
        Where-Object { $_.DisplayName -match "^\s*#{package_name.shellescape}\.*" -or $_.PSChildName -match "^\s*#{package_name.shellescape}\.*" } |
        Select-Object -Property DisplayName,DisplayVersion | ConvertTo-Json
      EOF

      # We cannot rely on `exit_status` since PowerShell always exits 0 from the
      # above command. Instead, if no package is found the output of the command
      # will be `''` so we can use that to return `{}` to match the behavior of
      # other package managers.
      return {} if cmd.stdout == ''

      begin
        package = JSON.parse(cmd.stdout)
      rescue JSON::ParserError => e
        raise Inspec::Exceptions::ResourceFailed,
              'Failed to parse JSON from PowerShell. ' \
              "Error: #{e}"
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
      return {} if cmd.exit_status.to_i != 0

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
      return {} if cmd.exit_status.to_i != 0

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
      return {} if cmd.exit_status.to_i != 0

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
