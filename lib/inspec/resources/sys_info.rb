require "inspec/resources/command"
require "inspec/resources/powershell"

module Inspec::Resources
  # this resource returns additional system informatio
  class SysInfo < Inspec.resource(1)
    name "sys_info"
    supports platform: "linux"
    supports platform: "windows"

    desc "Use the sys_info resource to test for operating system properties."
    example <<~EXAMPLE
      describe sys_info do
        its('hostname') { should eq 'hostname' }
      end

      describe sys_info do
        its('fqdn') { should eq 'hostname.example.com' }
      end

    EXAMPLE

    def initialize
      os = inspec.os
      @cache = nil

      if os.linux?
        @cache = LinuxInfo.new(inspec).info
      elsif os.windows?
        @cache = WindowsInfo.new(inspec).info
      elsif os.darwin?
        @cache = DarwinInfo.new(inspec).info
      else
        return skip_resource "The `sys_info` resource is not supported on your OS yet."
      end
    end

    def domain
      @cache[:domain]
    end

    def ip_address
      @cache[:ip]
    end

    def manufacturer
      @cache[:manufacturer]
    end

    def model
      @cache[:model]
    end

    def totalmemory_kb
      @cache[:totalmemory_kb]
    end

    def hostname(opt = nil)
      case opt
        when nil
          @cache[:hostname]
        when "f","long","fqdn","full"
          @cache[:fqdn]
        when "d","domain"
          @cache[:domain]
        when "i", "ip_address"
          @cache[:ip_address]
        when "s","short"
          @cache[:hostname]
        else
          skip_resource "The sys_info.hostname resource is not supported with that option."
      end
    end

    def fqdn
      @cache[:fqdn]
    end

    def to_s
      "System Information"
    end
  end

  class LinuxInfo < SysInfo
    attr_reader :inspec
    def initialize(inspec)
      @inspec = inspec
    end

    def info
      fqdn = inspec.command("hostname -f").stdout.chomp
      domain = inspec.command("hostname -d").stdout.chomp
      ip = inspec.command("hostname -I").stdout.chomp
      short = inspec.command("hostname -s").stdout.chomp
      manufacturer = inspec.command("cat /sys/class/dmi/id/sys_vendor").stdout.chomp
      model = inspec.command("cat /sys/class/dmi/id/product_name").stdout.chomp
      totalmemory_kb = inspec.command("awk '/MemTotal/ {print $2}' /proc/meminfo").stdout.chomp

      {
        fqdn: fqdn,
        domain: domain,
        ip: ip,
        hostname: short,
        manufacturer: manufacturer,
        model: model,
        totalmemory_kb: totalmemory_kb,
      }
    end
  end

  class WindowsInfo < SysInfo
    attr_reader :inspec
    def initialize(inspec)
      @inspec = inspec
    end

    def info
      cmd = inspec.command <<-EOF
        Get-WmiObject Win32_ComputerSystem -Property * | convertto-json
      EOF

      cmd = {} if cmd.stdout == ""
      begin
        info = JSON.parse(cmd.stdout)
      rescue JSON::ParserError => _e
        return nil
      end

      ip_cmd = inspec.command("(Get-WmiObject Win32_NetWorkAdapterConfiguration | Where IPAddress -ne $null | select -Property ipaddress).IPAddress | ConvertTo-Json")
      ip_cmd = {} if ip_cmd.stdout == ""
      begin
        ip_info = JSON.parse(ip_cmd.stdout)
      rescue JSON::ParserError => _e
        return nil
      end

      if info["DomainRole"] == 2 || info["DomainRole"] == 0
        fqdn = info["DNSHostName"]
        domain = nil
      else
        fqdn = "#{info["DNSHostName"]}.#{info["Domain"]}"
        domain = info["Domain"]
      end

      memory = info["TotalPhysicalMemory"] / 1024 rescue nil
      {
        fqdn: fqdn,
        domain: domain,
        ip: ip_info,
        hostname: info["DNSHostName"],
        manufacturer: info["Manufacturer"],
        model: info["Model"],
        totalmemory_kb: memory,
      }
    end
  end

  class DarwinInfo < SysInfo
    attr_reader :inspec
    def initialize(inspec)
      @inspec = inspec
    end

    def info
      fqdn = inspec.command("hostname -f").stdout.chomp
      domain = "The `sys_info.domain` is not supported on your OS yet."
      ip = "The `sys_info.ip_adress` is not supported on your OS yet."
      short = inspec.command("hostname -s").stdout.chomp
      manufacturer = "Apple Inc."
      model = inspec.command("sysctl -n hw.model").stdout.chomp
      totalmemory_kb = "The `sys_info.totalmemory_kb` is not supported on your OS yet."

      {
        fqdn: fqdn,
        domain: domain,
        ip: ip,
        hostname: short,
        manufacturer: manufacturer,
        model: model,
        totalmemory_kb: totalmemory_kb,
      }
    end
  end
end
