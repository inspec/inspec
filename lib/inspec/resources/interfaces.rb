require "inspec/utils/filter"
require "inspec/resources/command"

module Inspec::Resources
  class Interfaces < Inspec.resource(1)
    name "interfaces"
    supports platform: "unix"
    supports platform: "windows"
    desc "Use the interfaces InSpec audit resource to test properties for multiple network interfaces installed on the system"
    example <<~EXAMPLE
      describe interfaces do
        its('names') { should include 'eth0' }
      end
    EXAMPLE

    attr_reader :iface_data

    def to_s
      "Interfaces"
    end

    filter = FilterTable.create
    filter.register_column(:names, field: "name")
      .install_filter_methods_on_resource(self, :scan_interfaces)

    def ipv4_address
      require "ipaddr"

      # Loop over interface names
      # Select those that are up and have an ipv4 address
      interfaces = names.map { |n| inspec.interface(n) }.select do |i|
        i.ipv4_address? && i.up?
      end

      addrs = interfaces.map(&:ipv4_addresses).flatten.map { |a| IPAddr.new(a) }

      # Look for progressively "better" IP addresses
      [
        # Loopback and private IP ranges
        IPAddr.new("127.0.0.0/8"),
        IPAddr.new("192.168.0.0/16"),
        IPAddr.new("172.16.0.0/12"),
        IPAddr.new("10.0.0.0/8"),
      ].each do |private_range|
        filtered_addrs = addrs.reject { |a| private_range.include?(a) }
        if filtered_addrs.empty?
          # Everything we had was a private or loopback IP. Return the "best" thing we were left with.
          return addrs.first.to_s
        end

        addrs = filtered_addrs
      end
      addrs.first.to_s
    end

    private

    def scan_interfaces
      @iface_data ||= begin
                    provider = LinuxInterfaceLister.new(inspec) if inspec.os.linux?
                    provider = WindowsInterfaceLister.new(inspec) if inspec.os.windows?
                    provider = BsdInterfaceLister.new(inspec) if inspec.os.bsd? # includes macOS
                    Array(provider && provider.scan_interfaces)
                  end
    end

    class InterfaceLister
      attr_reader :inspec
      def initialize(inspec)
        @inspec = inspec
      end
    end

    class BsdInterfaceLister < InterfaceLister
      def scan_interfaces
        iface_data = []
        cmd = inspec.command("ifconfig -a")
        cmd.stdout.split("\n").each do |line|
          # lo0: flags=8049<UP,LOOPBACK,RUNNING,MULTICAST> metric 0 mtu 16384
          m = line.match(/^(\S+):/)
          if m
            iface_data << { "name" => m[1] }
          end
        end
        iface_data
      end
    end

    class LinuxInterfaceLister < InterfaceLister
      def scan_interfaces
        iface_data = []
        cmd = inspec.command("ls /sys/class/net")
        cmd.stdout.split("\n").each do |iface|
          iface_data << { "name" => iface }
        end
        iface_data
      end
    end

    class WindowsInterfaceLister < InterfaceLister
      def scan_interfaces
        iface_data = []
        cmd = inspec.command("Get-NetAdapter | Select-Object -Property Name | ConvertTo-Json")
        begin
          adapter_info = JSON.parse(cmd.stdout)
          # May be a Hash if only one, or Array if multiple - normalize to Array
          adapter_info = [ adapter_info ] if adapter_info.is_a? Hash
        rescue JSON::ParserError => _e
          return nil
        end
        adapter_info.each do |info|
          iface_data << { "name" => info["Name"] }
        end
        iface_data
      end
    end

  end
end
