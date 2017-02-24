# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'utils/convert'

module Inspec::Resources
  class NetworkInterface < Inspec.resource(1)
    name 'interface'
    desc 'Use the interface InSpec audit resource to test basic network adapter properties, such as name, status, state, address, and link speed (in MB/sec).'
    example "
      describe interface('eth0') do
        it { should exist }
        it { should be_up }
        its('speed') { should eq 1000 }
      end
    "
    def initialize(iface)
      @iface = iface

      @interface_provider = nil
      if inspec.os.linux?
        @interface_provider = LinuxInterface.new(inspec)
      elsif inspec.os.windows?
        @interface_provider = WindowsInterface.new(inspec)
      else
        return skip_resource 'The `interface` resource is not supported on your OS yet.'
      end
    end

    def exists?
      !interface_info.nil? && !interface_info[:name].nil?
    end

    def up?
      interface_info.nil? ? false : interface_info[:up]
    end

    # returns link speed in Mbits/sec
    def speed
      interface_info.nil? ? nil : interface_info[:speed]
    end

    def to_s
      "Interface #{@iface}"
    end

    private

    def interface_info
      return @cache if defined?(@cache)
      @cache = @interface_provider.interface_info(@iface) if !@interface_provider.nil?
    end
  end

  class InterfaceInfo
    include Converter
    attr_reader :inspec
    def initialize(inspec)
      @inspec = inspec
    end
  end

  class LinuxInterface < InterfaceInfo
    def interface_info(iface)
      # will return "[mtu]\n1500\n[type]\n1"
      cmd = inspec.command("find /sys/class/net/#{iface}/ -type f -maxdepth 1 -exec sh -c 'echo \"[$(basename {})]\"; cat {} || echo -n' \\;")
      return nil if cmd.exit_status.to_i != 0

      # parse values, we only recieve values, therefore we threat them as keys
      params = SimpleConfig.new(cmd.stdout.chomp).params

      # abort if we got an empty result-set
      return nil if params.empty?

      # parse state
      state = false
      if params.key?('operstate')
        operstate, _value = params['operstate'].first
        state = operstate == 'up'
      end

      # parse speed
      speed = nil
      if params.key?('speed')
        speed, _value = params['speed'].first
        speed = convert_to_i(speed)
      end

      {
        name: iface,
        up: state,
        speed: speed,
      }
    end
  end

  class WindowsInterface < InterfaceInfo
    def interface_info(iface)
      # gather all network interfaces
      cmd = inspec.command('Get-NetAdapter | Select-Object -Property Name, InterfaceDescription, Status, State, MacAddress, LinkSpeed, ReceiveLinkSpeed, TransmitLinkSpeed, Virtual | ConvertTo-Json')

      # filter network interface
      begin
        net_adapter = JSON.parse(cmd.stdout)
      rescue JSON::ParserError => _e
        return nil
      end

      # ensure we have an array of groups
      net_adapter = [net_adapter] if !net_adapter.is_a?(Array)

      # select the requested interface
      adapters = net_adapter.each_with_object([]) do |adapter, adapter_collection|
        # map object
        info = {
          name: adapter['Name'],
          up: adapter['State'] == 2,
          speed: adapter['ReceiveLinkSpeed'] / 1000,
        }
        adapter_collection.push(info) if info[:name].casecmp(iface) == 0
      end

      return nil if adapters.empty?
      warn "[Possible Error] detected multiple network interfaces with the name #{iface}" if adapters.size > 1
      adapters[0]
    end
  end
end
