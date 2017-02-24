# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

# Usage:
# describe bridge('br0') do
#   it { should exist }
#   it { should have_interface 'eth0' }
# end

module Inspec::Resources
  class Bridge < Inspec.resource(1)
    name 'bridge'
    desc 'Use the bridge InSpec audit resource to test basic network bridge properties, such as name, if an interface is defined, and the associations for any defined interface.'
    example "
      describe bridge 'br0' do
        it { should exist }
        it { should have_interface 'eth0' }
      end
    "

    def initialize(bridge_name)
      @bridge_name = bridge_name

      @bridge_provider = nil
      if inspec.os.linux?
        @bridge_provider = LinuxBridge.new(inspec)
      elsif inspec.os.windows?
        @bridge_provider = WindowsBridge.new(inspec)
      else
        return skip_resource 'The `bridge` resource is not supported on your OS yet.'
      end
    end

    def exists?
      !bridge_info.nil? && !bridge_info[:name].nil?
    end

    def has_interface?(interface)
      return skip_resource 'The `bridge` resource does not provide interface detection for Windows yet' if inspec.os.windows?
      bridge_info.nil? ? false : bridge_info[:interfaces].include?(interface)
    end

    def interfaces
      bridge_info.nil? ? nil : bridge_info[:interfaces]
    end

    def to_s
      "Bridge #{@bridge_name}"
    end

    private

    def bridge_info
      return @cache if defined?(@cache)
      @cache = @bridge_provider.bridge_info(@bridge_name) if !@bridge_provider.nil?
    end
  end

  class BridgeDetection
    attr_reader :inspec
    def initialize(inspec)
      @inspec = inspec
    end
  end

  # Linux Bridge
  # If /sys/class/net/{interface}/bridge exists then it must be a bridge
  # /sys/class/net/{interface}/brif contains the network interfaces
  # @see http://www.tldp.org/HOWTO/BRIDGE-STP-HOWTO/set-up-the-bridge.html
  # @see http://unix.stackexchange.com/questions/40560/how-to-know-if-a-network-interface-is-tap-tun-bridge-or-physical
  class LinuxBridge < BridgeDetection
    def bridge_info(bridge_name)
      # read bridge information
      bridge = inspec.file("/sys/class/net/#{bridge_name}/bridge").directory?
      return nil unless bridge

      # load interface names
      interfaces = inspec.command("ls -1 /sys/class/net/#{bridge_name}/brif/")
      interfaces = interfaces.stdout.chomp.split("\n")
      {
        name: bridge_name,
        interfaces: interfaces,
      }
    end
  end

  # Windows Bridge
  # select netadapter by adapter binding for windows
  # Get-NetAdapterBinding -ComponentID ms_bridge | Get-NetAdapter
  # @see https://technet.microsoft.com/en-us/library/jj130921(v=wps.630).aspx
  # RegKeys: HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4D36E972-E325-11CE-BFC1-08002BE10318}
  class WindowsBridge < BridgeDetection
    def bridge_info(bridge_name)
      # find all bridge adapters
      cmd = inspec.command('Get-NetAdapterBinding -ComponentID ms_bridge | Get-NetAdapter | Select-Object -Property Name, InterfaceDescription | ConvertTo-Json')

      # filter network interface
      begin
        bridges = JSON.parse(cmd.stdout)
      rescue JSON::ParserError => _e
        return nil
      end

      # ensure we have an array of groups
      bridges = [bridges] if !bridges.is_a?(Array)

      # select the requested interface
      bridges = bridges.each_with_object([]) do |adapter, adapter_collection|
        # map object
        info = {
          name: adapter['Name'],
          interfaces: nil,
        }
        adapter_collection.push(info) if info[:name].casecmp(bridge_name) == 0
      end

      return nil if bridges.empty?
      warn "[Possible Error] detected multiple bridges interfaces with the name #{bridge_name}" if bridges.size > 1
      bridges[0]
    end
  end
end
