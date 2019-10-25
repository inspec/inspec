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

      describe sys_info do
        its('fqdn') { should eq 'user.example.com' }
      end

    EXAMPLE

    %w{ domain fqdn ip_address short }.each do |opt|
      define_method(opt.to_sym) do
        hostname(opt)
      end
    end
    @cache = nil
    
    def win_cache
      return {} if !inspec.os.windows?
      cmd = inspec.command <<-EOF
        Get-WmiObject Win32_ComputerSystem -Property * | ConvertTo-Json
      EOF

      return {} if cmd.stdout == ""
      begin
        sysinfo = JSON.parse(cmd.stdout)
      rescue JSON::ParserError => each
        raise Inspec::Exceptions::ResourceFailed,
          "Failed to parse JSON from Powershell. " \
          "Error: #{e}"
      end
      return sysinfo
    end

    # returns the hostname of the local system
    def hostname(opt = nil)
      os = inspec.os
      if os.linux?
        linux_hostname(opt)
      elsif os.darwin?
        mac_hostname(opt)
      elsif os.windows?
        opt = "s" if opt.nil?
        windows_hostname(opt)
      else
        skip_resource "The `sys_info.hostname` resource is not supported on your OS yet."
      end
    end
    
    def windows_hostname(opt = nil)
      if @cache.nil?
        @cache = win_cache
      end
      if !opt.nil?
        opt = case opt
          when "f", "long", "fqdn", "full"
            #https://docs.microsoft.com/en-us/windows/win32/cimwin32prov/win32-computersystem
            return @cache["DNSHostName"] if (@cache["DomainRole"] == 2 || @cache["DomainRole"] == 0)
            return "#{@cache["DNSHostName"]}.#{@cache["Domain"]}"
          when "d", "domain"
            return nil if (@cache["DomainRole"] == 2 || @cache["DomainRole"] == 0)
            return @cache["Domain"]
          when "i", "ip_address"
            cmd = inspec.command("(Get-WmiObject Win32_NetWorkAdapterConfiguration | Where IPAddress -ne $null | select -Property ipaddress).IPAddress | ConvertTo-Json")
            return {} if cmd.stdout == ""
            begin
              ip = JSON.parse(cmd.stdout)
            rescue JSON::ParserError => each
              raise Inspec::Exceptions::ResourceFailed,
                "Failed to parse JSON from Powershell. " \
                "Error: #{e}"
            end
            return ip
          when "s", "short"
            return @cache["DNSHostName"]
          else "ERROR"
        end
      end
      if opt == "ERROR"
        skip_resource "The `sys_info.hostname` resource is not supported with that option on your OS."
      end
    end

    def linux_hostname(opt = nil)
      if !opt.nil?
        opt = case opt
              when "f", "long", "fqdn", "full"
                " -f"
              when "d", "domain"
                " -d"
              when "i", "ip_address"
                " -I"
              when "s", "short"
                " -s"
              else
                "ERROR"
              end
      end
      if opt == "ERROR"
        skip_resource "The `sys_info.hostname` resource is not supported with that option on your OS."
      else
        inspec.command("hostname#{opt}").stdout.chomp
      end
    end

    def mac_hostname(opt = nil)
      if !opt.nil?
        opt = case opt
              when "f", "long", "fqdn", "full"
                " -f"
              when "s", "short"
                " -s"
              else
                "ERROR"
              end
      end
      if opt == "ERROR"
        skip_resource "The `sys_info.hostname` resource is not supported with that option on your OS."
      else
        inspec.command("hostname#{opt}").stdout.chomp
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
        if @cache.nil?
          @cache = win_cache
        end
        @cache["Manufacturer"]
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
        if @cache.nil?
          @cache = win_cache
        end
        @cache["Model"]
      else
        skip_resource "The `sys_info.model` resource is not supported on your OS yet."
      end
    end
    
    def totalmemory
      os = inspec.os
      if os.linux?
        inspec.command("awk '/MemTotal/ {print $2}' /proc/meminfo").stdout.chomp
      elsif os.windows?
        if @cache.nil?
          @cache = win_cache
        end
        #Calculation requried - Windows return bytes where linux returns kB
        @cache["TotalPhysicalMemory"] / 1024 rescue nil
      else
        skip_resource "The `sys_info.totalmemory` resource is not supported on your OS yet."
      end
    end

    def to_s
      "System Information"
    end
  end
end
