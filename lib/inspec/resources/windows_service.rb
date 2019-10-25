require "inspec/resources/service"

module Inspec::Resources
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
    # Also see: https://msdn.microsoft.com/en-us/library/aa384896(v=vs.85).aspx
    # Use the following powershell to determine the start mode
    # PS: Get-WmiObject -Class Win32_Service | Where-Object {$_.Name -eq $name -or $_.DisplayName -eq $name} | Select-Object -Prop
    # erty Name, StartMode, State, Status, StartName | ConvertTo-Json
    # {
    #     "Name":  "Dhcp",
    #     "StartMode":  "Auto",
    #     "State":  "Running",
    #     "Status":  "OK",
    #     "StartName":  "LocalSystem"
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
      cmd = inspec.command("New-Object -Type PSObject | Add-Member -MemberType NoteProperty -Name Service -Value (Get-Service -Name '#{service_name}'| Select-Object -Property Name, DisplayName, Status) -PassThru | Add-Member -MemberType NoteProperty -Name WMI -Value (Get-WmiObject -Class Win32_Service | Where-Object {$_.Name -eq '#{service_name}' -or $_.DisplayName -eq '#{service_name}'} | Select-Object -Property StartMode, StartName) -PassThru | ConvertTo-Json")

      # cannot rely on exit code for now, successful command returns exit code 1
      # return nil if cmd.exit_status != 0
      # try to parse json
      begin
        service = JSON.parse(cmd.stdout)
      rescue JSON::ParserError => _e
        return nil
      end

      # check that we got a response
      return nil if service.nil? || service["Service"].nil?

      {
        name: service["Service"]["Name"],
        description: service["Service"]["DisplayName"],
        installed: true,
        running: service_running?(service),
        enabled: service_enabled?(service),
        startmode: service["WMI"]["StartMode"],
        startname: service["WMI"]["StartName"],
        type: "windows",
      }
    end

    private

    # detect if service is enabled
    def service_enabled?(service)
      !service["WMI"].nil? &&
        !service["WMI"]["StartMode"].nil? &&
        (service["WMI"]["StartMode"] == "Auto" ||
        service["WMI"]["StartMode"] == "Manual")
    end

    # detect if service is running
    def service_running?(service)
      !service["Service"]["Status"].nil? && service["Service"]["Status"] == 4
    end
  end
end
