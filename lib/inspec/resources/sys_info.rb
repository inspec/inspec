require "inspec/resources/command"
require "inspec/resources/powershell"

module Inspec::Resources
  # this resource returns additional system informatio
  class System < Inspec.resource(1)
    name "sys_info"
    supports platform: "unix"
    supports platform: "windows"

    desc "Use the user InSpec system resource to test for operating system properties."
    example <<~EXAMPLE
      describe sys_info do
        its('hostname') { should eq 'example.com' }
      end
    EXAMPLE

    # returns the hostname of the local system
    def hostname
      os = inspec.os
      if os.linux? || os.darwin?
        inspec.command("hostname").stdout.chomp
      elsif os.windows?
        inspec.powershell("$env:computername").stdout.chomp
      else
        skip_resource "The `sys_info.hostname` resource is not supported on your OS yet."
      end
    end

    # returns the Manufacturer of the local system
    def manufacturer
      os = inspec.os
      if os.darwin?
        "Apple Inc."
      elsif os.linux?
        inspec.command("cat /sys/class/dmi/id/sys_vendor").stdout.chomp
      elsif os.windows?
        inspec.powershell("Get-CimInstance -ClassName Win32_ComputerSystem | Select Manufacturer -ExpandProperty Manufacturer").stdout.chomp
      else
        skip_resource "The `sys_info.manufacturer` resource is not supported on your OS yet."
      end
    end

    # returns the ServerModel of the local system
    def model
      os = inspec.os
      if os.darwin?
        inspec.command("sysctl -n hw.model").stdout.chomp
      elsif os.linux?
        inspec.command("cat /sys/class/dmi/id/product_name").stdout.chomp
      elsif os.windows?
        inspec.powershell("Get-CimInstance -ClassName Win32_ComputerSystem | Select Model -ExpandProperty Model").stdout.chomp
      else
        skip_resource "The `sys_info.model` resource is not supported on your OS yet."
      end
    end
  end
end
