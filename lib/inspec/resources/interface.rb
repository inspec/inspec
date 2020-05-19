require "inspec/resources/command"
require "inspec/utils/convert"
require "inspec/utils/simpleconfig"

module Inspec::Resources
  class NetworkInterface < Inspec.resource(1)
    name "interface"
    supports platform: "unix"
    supports platform: "windows"
    desc "Use the interface InSpec audit resource to test basic network adapter properties, such as name, status, and link speed (in MB/sec)."
    example <<~EXAMPLE
      describe interface('eth0') do
        it { should exist }
        it { should be_up }
        its('speed') { should eq 1000 }
        its('ipv4_addresses') { should include '127.0.0.1' }
        its('ipv6_cidrs') { should include '::1/128' }
      end
    EXAMPLE

    def initialize(iface)
      @iface = iface
    end

    def exists?
      !!(interface_info && interface_info[:name])
    end

    def up?
      !!(interface_info && interface_info[:up])
    end

    def name
      interface_info[:name]
    end

    # returns link speed in Mbits/sec
    def speed
      interface_info && interface_info[:speed]
    end

    def ipv4_address?
      ipv4_addresses && !ipv4_addresses.empty?
    end

    def ipv6_address?
      ipv6_addresses && !ipv6_addresses.empty?
    end

    def ipv4_address
      ipv4_cidrs.first
    end

    def ipv4_addresses
      ipv4_cidrs.map { |i| i.split("/")[0] }
    end

    def ipv6_address
      ipv6_cidrs.first
    end

    def ipv6_addresses
      ipv6_cidrs.map { |i| i.split("/")[0] }
    end

    def ipv4_addresses_netmask
      ipv4_cidrs.map { |i| i.split("/") }.map do |addr, netlen|
        binmask = "#{"1" * netlen.to_i}#{"0" * (32 - netlen.to_i)}".to_i(2)
        netmask = []
        (1..4).each do |_byte|
          netmask.unshift(binmask & 255)
          binmask = binmask >> 8
        end
        "#{addr}/#{netmask.join(".")}"
      end
    end

    def ipv4_cidrs
      interface_info && Array(interface_info[:ipv4_addresses])
    end

    def ipv6_cidrs
      interface_info && Array(interface_info[:ipv6_addresses])
    end

    def to_s
      "Interface #{@iface}"
    end

    private

    def interface_info
      @cache ||= begin
                   provider = LinuxInterface.new(inspec) if inspec.os.linux?
                   provider = WindowsInterface.new(inspec) if inspec.os.windows?
                   provider = BsdInterface.new(inspec) if inspec.os.bsd? # includes macOS
                   Hash(provider && provider.interface_info(@iface))
                 end
    end
  end

  class InterfaceInfo
    include Converter
    attr_reader :inspec
    def initialize(inspec)
      @inspec = inspec
    end
  end

  class BsdInterface < InterfaceInfo
    def interface_info(iface)
      cmd = inspec.command("ifconfig #{iface}")
      return nil if cmd.exit_status.to_i != 0

      lines = cmd.stdout.split("\n")
      iface_info = {
        name: iface,
        ipv4_addresses: [], # Actually CIDRs
        ipv6_addresses: [], # are expected to go here
      }

      iface_info[:up] = lines[0].include?("UP")
      lines.each do |line|
        # IPv4 case
        m = line.match(/^\s+inet\s+((?:\d{1,3}\.){3}\d{1,3})\s+netmask\s+(0x[a-f0-9]{8})/)
        if m
          ip = m[1]
          hex_mask = m[2]
          cidr = hex_mask.to_i(16).to_s(2).count("1")
          iface_info[:ipv4_addresses] << "#{ip}/#{cidr}"
          next
        end

        # IPv6 case
        m = line.match(/^\s+inet6\s+([a-f0-9:]+)%#{iface}\s+prefixlen\s+(\d+)/)
        if m
          ip = m[1]
          cidr = m[2]
          iface_info[:ipv6_addresses] << "#{ip}/#{cidr}"
          next
        end

        # Speed detect, crummy - can't detect wifi, finds any number in the string
        # Ethernet autoselect (1000baseT <full-duplex>)
        m = line.match(/^\s+media:\D+(\d+)/)
        if m
          iface_info[:speed] = m[1].to_i
          next
        end
      end

      iface_info
    end
  end

  class LinuxInterface < InterfaceInfo
    def interface_info(iface)
      # will return "[mtu]\n1500\n[type]\n1"
      cmd = inspec.command("find /sys/class/net/#{iface}/ -maxdepth 1 -type f -exec sh -c 'echo \"[$(basename {})]\"; cat {} || echo -n' \\;")
      return nil if cmd.exit_status.to_i != 0

      # parse values, we only recieve values, therefore we threat them as keys
      params = SimpleConfig.new(cmd.stdout.chomp).params

      # abort if we got an empty result-set
      return nil if params.empty?

      # parse state
      state = false
      if params.key?("operstate")
        operstate, _value = params["operstate"].first
        state = operstate == "up"
      end

      # parse speed
      speed = nil
      if params.key?("speed")
        speed, _value = params["speed"].first
        speed = convert_to_i(speed)
      end

      family_addresses = addresses(iface)
      {
        name: iface,
        up: state,
        speed: speed,
        ipv4_addresses: family_addresses["inet"],
        ipv6_addresses: family_addresses["inet6"],
      }
    end

    private

    def addresses(iface)
      addrs_by_family = { "inet6" => [], "inet" => [] }
      [4, 6].each do |v|
        cmd = inspec.command("/sbin/ip -br -#{v} address show dev #{iface}")
        next unless cmd.exit_status.to_i == 0

        family = v == 6 ? "inet6" : "inet"

        cmd.stdout.each_line do |line|
          _dev, _state, *addrs = line.split(/\s+/)
          addrs_by_family[family] = addrs
        end
      end
      addrs_by_family
    end
  end

  class WindowsInterface < InterfaceInfo
    def interface_info(iface)
      # gather all network interfaces
      cmd = inspec.command("Get-NetAdapter | Select-Object -Property Name, InterfaceDescription, Status, State, " \
                           "MacAddress, LinkSpeed, ReceiveLinkSpeed, TransmitLinkSpeed, Virtual | ConvertTo-Json")

      addr_cmd = inspec.command("Get-NetIPAddress | Select-Object -Property IPv6Address, IPv4Address, InterfaceAlias," \
                                " PrefixLength | ConvertTo-Json")

      # filter network interface
      begin
        net_adapter = JSON.parse(cmd.stdout)
        addresses = JSON.parse(addr_cmd.stdout)
      rescue JSON::ParserError => _e
        return nil
      end

      # ensure we have an array of groups
      net_adapter = [net_adapter] unless net_adapter.is_a?(Array)
      addresses = [addresses] unless addresses.is_a?(Array)

      # select the requested interface
      adapters = net_adapter.each_with_object([]) do |adapter, adapter_collection|
        # map object
        info = {
          name: adapter["Name"],
          up: adapter["State"] == 2,
          speed: adapter["ReceiveLinkSpeed"] / 1000,
          ipv4_addresses: addresses_for_proto(addresses, adapter["Name"], "IPv4"),
          ipv6_addresses: addresses_for_proto(addresses, adapter["Name"], "IPv6"),
        }
        adapter_collection.push(info) if info[:name].casecmp(iface) == 0
      end

      return nil if adapters.empty?

      warn "[Possible Error] detected multiple network interfaces with the name #{iface}" if adapters.size > 1
      adapters[0]
    end

    private

    def addresses_for_proto(all_addresses, iface, proto)
      all_addresses.select { |i| i["InterfaceAlias"] == iface }
        .map { |i| "#{i["#{proto}Address"]}/#{i["PrefixLength"]}" unless i["#{proto}Address"].nil? }
        .compact
    end
  end
end
