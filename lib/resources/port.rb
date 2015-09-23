# encoding: utf-8

# Usage:
# describe port(80) do
#   it { should be_listening }
#   its('protocol') {should eq 'tcp'}
# end
#
# not supported serverspec syntax
# describe port(80) do
#   it { should be_listening.with('tcp') }
# end
#
# TODO: currently we return local ip only
# TODO: improve handling of same port on multiple interfaces
class Port < Vulcano.resource(1)
  name 'port'

  def initialize(port)
    @port = port
    @port_manager = nil
    @cache = nil

    case vulcano.os[:family]
    when 'ubuntu', 'debian', 'redhat', 'fedora', 'arch'
      @port_manager = LinuxPorts.new(vulcano)
    else
      return skip_resource 'The `port` resource is not supported on your OS yet.'
    end
  end

  def listening?(_protocol = nil, _local_address = nil)
    ports = info
    return false if ports.nil?
    match = ports.select { |p| p[:port] == @port }
    match.size > 0 ? true : false
  end

  def protocol
    ports = info
    (ports.size > 0) ? ports[0][:protocol] : nil
  end

  def process
    ports = info
    (ports.size > 0) ? ports[0][:process] : nil
  end

  def pid
    ports = info
    (ports.size > 0) ? ports[0][:pid] : nil
  end

  private

  def info
    return @cache if !@cache.nil?
    # abort if os detection has not worked
    return @cache = [] if @port_manager.nil?
    # query ports
    ports = @port_manager.info
    if ports.nil?
      @cache = []
    else
      @cache = ports.select { |p| p[:port] == @port }
    end
    @cache
  end
end

# implements an info method and returns all ip adresses and protocols for
# each port
# [{
#   port: 80,
#   address: [{
#     ip: '0.0.0.0'
#     protocol: 'tcp'
#   }],
# }]
class PortsInfo
  def initialize(vulcano)
    @vulcano = vulcano
  end
end

# extract port information from netstat
class LinuxPorts < PortsInfo
  def info
    cmd = @vulcano.run_command('netstat -tulpen')
    return nil if cmd.exit_status.to_i != 0

    ports = []
    # split on each newline
    cmd.stdout.each_line do |line|
      # parse each line
      # 1 - Proto, 2 - Recv-Q, 3 - Send-Q, 4 - Local Address, 5 - Foreign Address, 6 - State, 7 - Inode, 8 - PID/Program name
      parsed = /^(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)$/.match(line)

      if !parsed.nil?
        protocol = parsed[1].downcase

        # parse ip4 and ip6 addresses
        net_addr = parsed[4]
        if protocol.eql?('tcp6') || protocol.eql?('udp6')
          # prep for URI parsing, parse ip6 port
          ip6 = /^(\S+:)(\d+)$/.match(net_addr)
          ip6addr = ip6[1]
          ip6addr = '::' if /^:::$/.match(ip6addr)
          # build uri
          ip_addr = URI('addr://[' + ip6addr +']:' + ip6[2])
          # replace []
          host = ip_addr.host[1..ip_addr.host.size-2]
          port = ip_addr.port
        else
          ip_addr = URI('addr://'+net_addr)
          host = ip_addr.host
          port = ip_addr.port
        end

        # extract PID
        process = parsed[9].split('/')
        pid = process[0]
        pid = pid.to_i if /^\d+$/.match(pid)
        process = process[1]

        # map tcp6 and udp6
        protocol = 'tcp' if protocol.eql?('tcp6')
        protocol = 'udp' if protocol.eql?('udp6')

        # map data
        port_info = {
          port: port,
          address: host,
          protocol: protocol,
          process: process,
          pid: pid,
        }

        # push data, if not headerfile
        ports.push(port_info) if protocol.eql?('tcp') || protocol.eql?('udp')
      end
    end
    ports
  end
end
