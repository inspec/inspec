# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter
# license: All rights reserved

# Usage:
# describe service('dhcp') do
#   it { should be_enabled }
#   it { should be_installed }
#   it { should be_running }
# end
#
# We detect the init system for each operating system, based on the operating
# system.
#
# Fedora 15 : systemd
# RedHat 7 : systemd
# Ubuntu 15.04 : systemd
# Ubuntu < 15.04 : upstart
#
# TODO: extend the logic to detect the running init system, independently of OS
class Service < Inspec.resource(1)
  name 'service'
  desc 'Use the service InSpec audit resource to test if the named service is installed, running and/or enabled.'
  example "
    describe service('service_name') do
      it { should be_installed }
      it { should be_enabled }
      it { should be_running }
    end
  "

  def initialize(service_name)
    @service_name = service_name
    @service_mgmt = nil
    @cache = nil
    select_package_manager
  end

  def select_package_manager # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
    family = inspec.os[:family]

    case family
    # Ubuntu
    # @see: https://wiki.ubuntu.com/SystemdForUpstartUsers
    # Ubuntu 15.04 : Systemd
    #   Systemd runs with PID 1 as /sbin/init.
    #   Upstart runs with PID 1 as /sbin/upstart.
    # Ubuntu < 15.04 : Upstart
    # Upstart runs with PID 1 as /sbin/init.
    # Systemd runs with PID 1 as /lib/systemd/systemd.
    when 'ubuntu'
      version = inspec.os[:release].to_f
      if version < 15.04
        @service_mgmt = Upstart.new(inspec)
      else
        @service_mgmt = Systemd.new(inspec)
      end
    when 'debian'
      version = inspec.os[:release].to_i
      if version > 7
        @service_mgmt = Systemd.new(inspec)
      else
        @service_mgmt = SysV.new(inspec)
      end
    when 'redhat', 'fedora', 'centos'
      version = inspec.os[:release].to_i
      if (%w{ redhat centos }.include?(family) && version >= 7) || (family == 'fedora' && version >= 15)
        @service_mgmt = Systemd.new(inspec)
      else
        @service_mgmt = SysV.new(inspec)
      end
    when 'wrlinux'
      @service_mgmt = SysV.new(inspec)
    when 'darwin'
      @service_mgmt = LaunchCtl.new(inspec)
    when 'windows'
      @service_mgmt = WindowsSrv.new(inspec)
    when 'freebsd'
      @service_mgmt = BSDInit.new(inspec)
    when 'arch', 'opensuse'
      @service_mgmt = Systemd.new(inspec)
    when 'aix'
      @service_mgmt = SrcMstr.new(inspec)
    end

    return skip_resource 'The `service` resource is not supported on your OS yet.' if @service_mgmt.nil?
  end

  def info
    return @cache if !@cache.nil?
    return nil if @service_mgmt.nil?
    @cache = @service_mgmt.info(@service_name)
  end

  # verifies the service is enabled
  def enabled?(_level = nil)
    return false if info.nil?
    info[:enabled]
  end

  # verifies the service is registered
  def installed?(_name = nil, _version = nil)
    return false if info.nil?
    info[:installed]
  end

  # verifies the service is currently running
  def running?(_under = nil)
    return false if info.nil?
    info[:running]
  end

  def to_s
    "Service #{@service_name}"
  end
end

class ServiceManager
  attr_reader :inspec
  def initialize(inspec)
    @inspec = inspec
  end
end

# @see: http://www.freedesktop.org/software/systemd/man/systemctl.html
# @see: http://www.freedesktop.org/software/systemd/man/systemd-system.conf.html
class Systemd < ServiceManager
  def info(service_name)
    cmd = inspec.command("systemctl show --all #{service_name}")
    return nil if cmd.exit_status.to_i != 0

    # parse data
    params = SimpleConfig.new(
      cmd.stdout.chomp,
      assignment_re: /^\s*([^=]*?)\s*=\s*(.*?)\s*$/,
      multiple_values: false,
    ).params

    # LoadState values eg. loaded, not-found
    params['LoadState'] == 'loaded' ? (installed = true) : (installed = false)
    # test via 'systemctl is-active service'
    # SubState values running
    params['SubState'] == 'running' ? (running = true) : (running = false)
    # test via systemctl --quiet is-enabled
    # ActiveState values eg.g inactive, active
    params['UnitFileState'] == 'enabled' ? (enabled = true) : (enabled = false)

    {
      name: params['Id'],
      description: params['Description'],
      installed: installed,
      running: running,
      enabled: enabled,
      type: 'systemd',
    }
  end
end

# AIX services
class SrcMstr < ServiceManager
  attr_reader :name

  def info(service_name)
    @name = service_name
    running = status?
    return nil if running.nil?

    {
      name: service_name,
      description: nil,
      installed: true,
      running: running,
      enabled: enabled?,
      type: 'srcmstr',
    }
  end

  def status?
    status_cmd = inspec.command("lssrc -s #{@name}")
    return nil if status_cmd.exit_status.to_i != 0
    status_cmd.stdout.split(/\n/).last.chomp.match(/active$/) ? true : false
  end

  def enabled?
    enabled_rc_tcpip? || enabled_inittab?
  end

  private

  # rubocop:disable Style/TrailingComma
  def enabled_rc_tcpip?
    if inspec.command(
      "grep -v ^# /etc/rc.tcpip | grep 'start ' | grep -Eq '(/{0,1}| )#{@name} '"
    ).exit_status == 0
      true
    else
      false
    end
  end

  def enabled_inittab?
    inspec.command("lsitab #{@name}").exit_status.to_i == 0 ? true : false
  end
end

# @see: http://upstart.ubuntu.com
class Upstart < ServiceManager
  def info(service_name)
    # get the status of upstart service
    status = inspec.command("initctl status #{service_name}")

    # fallback for systemv services, those are not handled via `initctl`
    return SysV.new(inspec).info(service_name) if status.exit_status.to_i != 0

    # @see: http://upstart.ubuntu.com/cookbook/#job-states
    # grep for running to indicate the service is there
    running = !status.stdout[/running/].nil?

    {
      name: service_name,
      description: nil,
      installed: true,
      running: running,
      enabled: info_enabled(status, service_name),
      type: 'upstart',
    }
  end

  private

  def info_enabled(status, service_name)
    # check if a service is enabled
    # http://upstart.ubuntu.com/cookbook/#determine-if-a-job-is-disabled
    # $ initctl show-config $job | grep -q "^  start on" && echo enabled || echo disabled
    # Ubuntu 10.04 show-config is not supported
    # @see http://manpages.ubuntu.com/manpages/maverick/man8/initctl.8.html
    config = inspec.command("initctl show-config #{service_name}")
    enabled = !config.stdout[/^\s*start on/].nil?

    # implement fallback for Ubuntu 10.04
    if inspec.os[:family] == 'ubuntu' &&
       inspec.os[:release].to_f >= 10.04 &&
       inspec.os[:release].to_f < 12.04 &&
       status.exit_status == 0
      enabled = true
    end

    enabled
  end
end

class SysV < ServiceManager
  def info(service_name)
    # check if service is installed
    # read all available services via ls /etc/init.d/
    srvlist = inspec.command('ls -1 /etc/init.d/')
    return nil if srvlist.exit_status != 0

    # check if the service is in list
    service = srvlist.stdout.split("\n").select { |srv| srv == service_name }

    # abort if we could not find any service
    return nil if service.empty?

    # read all enabled services from runlevel
    # on rhel via: 'chkconfig --list', is not installed by default
    # bash: for i in `find /etc/rc*.d -name S*`; do basename $i | sed -r 's/^S[0-9]+//'; done | sort | uniq
    enabled_services_cmd = inspec.command('find /etc/rc*.d -name S*')
    enabled_services = enabled_services_cmd.stdout.split("\n").select { |line|
      /(^.*#{service_name}.*)/.match(line)
    }
    enabled_services.empty? ? enabled = false : enabled = true

    # check if service is really running
    # service throws an exit code if the service is not installed or
    # not enabled

    # on debian service is located /usr/sbin/service, on centos it is located here /sbin/service
    service_cmd = 'service'
    service_cmd = '/usr/sbin/service' if inspec.os[:family] == 'debian'
    service_cmd = '/sbin/service' if inspec.os[:family] == 'centos'

    cmd = inspec.command("#{service_cmd} #{service_name} status")
    cmd.exit_status == 0 ? (running = true) : (running = false)
    {
      name: service_name,
      description: nil,
      installed: true,
      running: running,
      enabled: enabled,
      type: 'sysv',
    }
  end
end

# @see: https://www.freebsd.org/doc/en/articles/linux-users/startup.html
# @see: https://www.freebsd.org/cgi/man.cgi?query=rc.conf&sektion=5
class BSDInit < ServiceManager
  def info(service_name)
    # check if service is enabled
    # services are enabled in /etc/rc.conf and /etc/defaults/rc.conf
    # via #{service_name}_enable="YES"
    # service SERVICE status returns the following result if not activated:
    #   Cannot 'status' sshd. Set sshd_enable to YES in /etc/rc.conf or use 'onestatus' instead of 'status'.
    # gather all enabled services
    cmd = inspec.command('service -e')
    return nil if cmd.exit_status != 0

    # search for the service
    srv = /(^.*#{service_name}$)/.match(cmd.stdout)
    return nil if srv.nil? || srv[0].nil?
    enabled = true

    # check if the service is running
    # if the service is not available or not running, we always get an error code
    cmd = inspec.command("service #{service_name} onestatus")
    cmd.exit_status == 0 ? (running = true) : (running = false)

    {
      name: service_name,
      description: nil,
      installed: true,
      running: running,
      enabled: enabled,
      type: 'bsd-init',
    }
  end
end

# MacOS / Darwin
# new launctl on macos 10.10
class LaunchCtl < ServiceManager
  def info(service_name)
    # get the status of upstart service
    cmd = inspec.command('launchctl list')
    return nil if cmd.exit_status != 0

    # search for the service
    srv = /(^.*#{service_name}.*)/.match(cmd.stdout)
    return nil if srv.nil? || srv[0].nil?

    # extract values from service
    parsed_srv = /^([0-9]+)\s*(\w*)\s*(\S*)/.match(srv[0])
    !parsed_srv.nil? ? (enabled = true) : (enabled = false)

    # check if the service is running
    pid = parsed_srv[0]
    !pid.nil? ? (running = true) : (running = false)

    # extract service label
    srv = parsed_srv[3] || service_name

    {
      name: srv,
      description: nil,
      installed: true,
      running: running,
      enabled: enabled,
      type: 'darwin',
    }
  end
end

# Determine the service state from Windows
# Uses Powershell to retrieve the information
class WindowsSrv < ServiceManager
  # Determine service details
  # PS: Get-Service -Name 'dhcp'| Select-Object -Property Name, DisplayName, Status | ConvertTo-Json
  # {
  #     "Name":  "dhcp",
  #     "DisplayName":  "DHCP Client",
  #     "Status":  4
  # }
  #
  # Until StartMode is not added to Get-Service, we need to do a workaround
  # @see: https://connect.microsoft.com/PowerShell/feedback/details/424948/i-would-like-to-see-the-property-starttype-added-to-get-services
  # Use the following powershell to determine the start mode
  # PS: Get-WmiObject -Class Win32_Service | Where-Object {$_.Name -eq $name -or $_.DisplayName -eq $name} | Select-Object -Prop
  # erty Name, StartMode, State, Status | ConvertTo-Json
  # {
  #     "Name":  "Dhcp",
  #     "StartMode":  "Auto",
  #     "State":  "Running",
  #     "Status":  "OK"
  # }
  #
  # Windows Services have the following status code:
  # @see: https://msdn.microsoft.com/en-us/library/windows/desktop/ms685996(v=vs.85).aspx
  # - 1: Stopped
  # - 2: Starting
  # - 3: Stopping
  # - 4: Running
  # - 5: Continue Pending
  # - 6: Pause Pending
  # - 7: Paused
  def info(service_name)
    cmd = inspec.command("New-Object -Type PSObject | Add-Member -MemberType NoteProperty -Name Service -Value (Get-Service -Name #{service_name}| Select-Object -Property Name, DisplayName, Status) -PassThru | Add-Member -MemberType NoteProperty -Name WMI -Value (Get-WmiObject -Class Win32_Service | Where-Object {$_.Name -eq '#{service_name}' -or $_.DisplayName -eq '#{service_name}'} | Select-Object -Property StartMode) -PassThru | ConvertTo-Json")

    # cannot rely on exit code for now, successful command returns exit code 1
    # return nil if cmd.exit_status != 0
    # try to parse json
    begin
      service = JSON.parse(cmd.stdout)
    rescue JSON::ParserError => _e
      return nil
    end

    # check that we got a response
    return nil if service.nil? || service['Service'].nil?

    {
      name: service['Service']['Name'],
      description: service['Service']['DisplayName'],
      installed: true,
      running: service_running?(service),
      enabled: service_enabled?(service),
      type: 'windows',
    }
  end

  private

  # detect if service is enabled
  def service_enabled?(service)
    if !service['WMI'].nil? &&
       !service['WMI']['StartMode'].nil? &&
       service['WMI']['StartMode'] == 'Auto'
      true
    else
      false
    end
  end

  # detect if service is running
  def service_running?(service)
    if !service['Service']['Status'].nil? &&
       service['Service']['Status'] == 4
      true
    else
      false
    end
  end
end
