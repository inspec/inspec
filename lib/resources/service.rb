# encoding: utf-8
# license: All rights reserved

# Usage:
# describe service('dhcp') do
#   it { should be_enabled }
#   it { should be_installed }
#   it { should be_running }
# end
class Service < Vulcano.resource(1)
  name 'service'

  def initialize(service_name)
    @service_name = service_name

    # select package manager
    @service_mgmt = nil
    @cache = nil
    case vulcano.os[:family]
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
    info[:enabled] if info.nil?
  end

  # verifies the service is registered
  def installed?(_name = nil, _version = nil)
    !info.nil?
  end

  # verifies the service is currently running
  def running?(_under = nil)
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
  #

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
