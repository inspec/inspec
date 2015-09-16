# encoding: utf-8
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
class Service < Vulcano.resource(1)
  name 'service'

  def initialize(service_name)
    @service_name = service_name

    # select package manager
    @service_mgmt = nil
    @cache = nil
    case vulcano.os[:family]
    # Ubuntu
    # @see: https://wiki.ubuntu.com/SystemdForUpstartUsers
    # Ubuntu 15.04 : Systemd
    #   Systemd runs with PID 1 as /sbin/init.
    #   Upstart runs with PID 1 as /sbin/upstart.
    # Ubuntu < 15.04 : Upstart
    # Upstart runs with PID 1 as /sbin/init.
    # Systemd runs with PID 1 as /lib/systemd/systemd.
    when 'ubuntu'
      version = os[:release].to_f
      if version < 15.04
        @service_mgmt = Upstart.new(vulcano)
      else
        @service_mgmt = Systemd.new(vulcano)
      end
    when 'debian'
      version = os[:release].to_i
      if version >= 7
        @service_mgmt = Systemd.new(vulcano)
      else
        @service_mgmt = SysV.new(vulcano)
      end
    when 'redhat', 'fedora'
      version = os[:release].to_i
      if version >= 7
        @service_mgmt = Systemd.new(vulcano)
      else
        @service_mgmt = SysV.new(vulcano)
      end
    when 'darwin'
      @service_mgmt = LaunchCtl.new(vulcano)
    when 'windows'
      @service_mgmt = WindowsSrv.new(vulcano)
    end

    return skip_resource 'The `service` resource is not supported on your OS yet.' if @service_mgmt.nil?
  end

  def info
    return @cache if !@cache.nil?
    @cache = @service_mgmt.info(@service_name)
  end

  # verifies the service is enabled
  def enabled?(_level = nil)
    return nil if info.nil?
    info[:enabled]
  end

  # verifies the service is registered
  def installed?(_name = nil, _version = nil)
    !info.nil?
  end

  # verifies the service is currently running
  def running?(_under = nil)
    return nil if info.nil?
    info[:running]
  end

  def to_s
    "Service #{@service_name}"
  end
end

class ServiceManager
  def initialize(vulcano)
    @vulcano = vulcano
  end
end

# @see: http://www.freedesktop.org/software/systemd/man/systemctl.html
# @see: http://www.freedesktop.org/software/systemd/man/systemd-system.conf.html
class Systemd < ServiceManager
  def info(service_name)

    cmd = @vulcano.run_command("systemctl show --all #{service_name}")
    return nil if cmd.exit_status.to_i != 0

    # parse data
    params = SimpleConfig.new(
      cmd.stdout.chomp,
      assignment_re: /^\s*([^:]*?)\s*:\s*(.*?)\s*$/,
      multiple_values: false,
    ).params

    # LoadState values eg. loaded, not-found
    params['LoadState'] == 'loaded' ? (installed = true) : (installed = false)
    # test via 'systemctl is-active service'
    # SubState values running
    params['LoadState'] == 'running' ? (running = true) : (running = false)
    # test via systemctl --quiet is-enabled
    # ActiveState values eg.g inactive, active
    params['ActiveState'] == 'active' ? (enabled = true) : (enabled = false)

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

# @see: http://upstart.ubuntu.com
class Upstart < ServiceManager
  def info(service_name)
    # get the status of upstart service
    cmd = @vulcano.run_command("initctl status #{service_name}")
    return nil if cmd.exit_status != 0

    # @see: http://upstart.ubuntu.com/cookbook/#job-states
    # grep for running to indicate the service is there
    match_running = /running/.match(cmd.stdout)
    !match_running.nil? ? (running = true) : (running = false)

    # check if a service is enabled
    # http://upstart.ubuntu.com/cookbook/#determine-if-a-job-is-disabled
    # $ initctl show-config $job | grep -q "^  start on" && echo enabled || echo disabled
    config = @vulcano.run_command("initctl show-config #{service_name}")
    match_enabled = /^\s*start on/.match(config.stdout)
    !match_running.nil? ? (enabled = true) : (enabled = false)

    {
      name: service_name,
      description: '',
      installed: true,
      running: running,
      enabled: enabled,
      type: 'upstart',
    }
  end
end

class SysV < ServiceManager
  def info(service_name)

    # check if service is installed
    filename = "/etc/init/#{service_name}.conf"
    service = @vulcano.file(filename)

    # check if service is installed
    return nil if !service.exists?

    # check if service is enabled
    match_enabled = /^\s*start on/.match(service.content)
    !match_enabled.nil? ? (enabled = true) : (enabled = false)

    # check if service is really running
    # service throws an exit code if the service is not installed or
    # not enabled
    cmd = @vulcano.run_command("service #{service_name} status")
    cmd.exit_status == 0 ? (running = true) : (running = false)

    {
      name: service_name,
      description: '',
      installed: true,
      running: running,
      enabled: enabled,
      type: 'upstart',
    }
  end
end

# MacOS / Darwin
# new launctl on macos 10.10
class LaunchCtl < ServiceManager
  def info(service_name)
    # get the status of upstart service
    cmd = @vulcano.run_command("launchctl list")
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

    {
      name: service_name,
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
    srv_cmd = "New-Object -Type PSObject | Add-Member -MemberType NoteProperty -Name Service -Value (Get-Service -Name #{service_name}| Select-Object -Property Name, DisplayName, Status) -PassThru | Add-Member -MemberType NoteProperty -Name WMI -Value (Get-WmiObject -Class Win32_Service | Where-Object {$_.Name -eq '#{service_name}' -or $_.DisplayName -eq '#{service_name}'} | Select-Object -Property StartMode) -PassThru | ConvertTo-Json"
    cmd = @vulcano.run_command(srv_cmd)

    # cannot rely on exit code for now, successful command returns exit code 1
    # return nil if cmd.exit_status != 0
    # try to parse json
    begin
      service = JSON.parse(cmd.stdout)
    rescue JSON::ParserError => _e
      return nil
    end

    service['Service']['Status'] == 4 ? (running = true) : (running = false)
    service['WMI']['StartMode'] == 'Auto' ? (enabled = true) : (enabled = false)

    {
      name: service['Service']['Name'],
      description: service['Service']['DisplayName'],
      installed: true,
      running: running,
      enabled: enabled,
      type: 'windows',
    }
  end
end
