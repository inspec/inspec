# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

# Usage:
# describe interface('eth0') do
#   it { should exist }
#   it { should be_up }
#   its(:speed) { should eq 1000 }
# end

require 'utils/convert'

class NetworkInterface < Vulcano.resource(1)
  include Converter

  name 'interface'

  def initialize(iface)
    @iface = iface
    @cache = nil

    @interface_provider = nil
    if vulcano.os.linux?
      @interface_provider = LinuxInterface.new(vulcano)
    else
      return skip_resource 'The `interface` resource is not supported on your OS yet.'
    end
  end

  def exists?
    !interface_info.nil?
  end

  def up?
    return false if interface_info.nil? || !interface_info.key?('operstate')
    key, _value = interface_info['operstate'].first
    key == 'up'
  end

  # returns link speed in Mbits/sec
  def speed
    return nil if interface_info.nil? || !interface_info.key?('speed')
    key, _value = interface_info['speed'].first
    convert_to_i(key)
  end

  private

  def interface_info
    return @cache if !@cache.nil?
    @cache = @interface_provider.interface_info(@iface) if !@interface_provider.nil?
  end
end

class InterfaceInfo
  def initialize(vulcano)
    @vulcano = vulcano
  end
end

class LinuxInterface < InterfaceInfo
  def interface_info(iface)
    return @cache if !@cache.nil?
    # will return "[mtu]\n1500\n[type]\n1"
    cmd = @vulcano.command("find /sys/class/net/#{iface}/ -type f -maxdepth 1 -exec sh -c 'echo \"[$(basename {})]\"; cat {} || echo -n' \\;")
    return nil if cmd.exit_status.to_i != 0

    # parse values, we only recieve values, therefore we threat them as keys
    @cache = SimpleConfig.new(cmd.stdout.chomp).params
  end
end
