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
  name 'interface'

  def initialize(iface)
    @iface = iface

    @interface_provider = nil
    if vulcano.os.linux?
      @interface_provider = LinuxInterface.new(vulcano)
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

  private

  def interface_info
    return @cache if defined?(@cache)
    @cache = @interface_provider.interface_info(@iface) if !@interface_provider.nil?
  end
end

class InterfaceInfo
  include Converter
  def initialize(vulcano)
    @vulcano = vulcano
  end
end

class LinuxInterface < InterfaceInfo
  def interface_info(iface)
    # will return "[mtu]\n1500\n[type]\n1"
    cmd = @vulcano.command("find /sys/class/net/#{iface}/ -type f -maxdepth 1 -exec sh -c 'echo \"[$(basename {})]\"; cat {} || echo -n' \\;")
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
