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
    when 'darwin'
      @port_manager = DarwinPorts.new(vulcano)
    when 'windows'
      @port_manager = WindowsPorts.new(vulcano)
    when 'freebsd'
      @port_manager = FreeBsdPorts.new(vulcano)
    else
      return skip_resource 'The `port` resource is not supported on your OS yet.'
    end
  end

  def listening?(_protocol = nil, _local_address = nil)
    info.size > 0
  end

  def protocol
    res = info.map { |x| x[:protocol] }.uniq.compact
    res.size > 0 ? res : nil
  end

  def process
    res = info.map { |x| x[:process] }.uniq.compact
    res.size > 0 ? res : nil
  end

  def pid
    res = info.map { |x| x[:pid] }.uniq.compact
    res.size > 0 ? res : nil
  end

  private

  def info
    return @cache if !@cache.nil?
    # abort if os detection has not worked
    return @cache = [] if @port_manager.nil?
    # query ports
    ports = @port_manager.info || []
    @cache = ports.select { |p| p[:port] == @port }
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

# TODO: Add UDP infromation Get-NetUDPEndpoint
# TODO: currently Windows only supports tcp ports
# TODO: Get-NetTCPConnection does not return PIDs
# TODO: double-check output with 'netstat -ano'
# @see https://connect.microsoft.com/PowerShell/feedback/details/1349420/get-nettcpconnection-does-not-show-processid
class WindowsPorts < PortsInfo
  def info
    # get all port information
    cmd = @vulcano.command('Get-NetTCPConnection | Select-Object -Property State, Caption, Description, LocalAddress, LocalPort, RemoteAddress, RemotePort, DisplayName, Status | ConvertTo-Json')

    begin
      ports = JSON.parse(cmd.stdout)
    rescue JSON::ParserError => _e
      return nil
    end

    return nil if ports.nil?

    ports.map { |x|
      {
        port: x['LocalPort'],
        address: x['LocalAddress'],
        protocol: 'tcp',
        process: nil,
        pid: nil,
      }
    }
  end
end

# extracts udp and tcp ports from macos
class DarwinPorts < PortsInfo
  def info
    # collects UDP and TCP information
    cmd = @vulcano.command('lsof -nP -iTCP -iUDP -sTCP:LISTEN')
    return nil if cmd.exit_status.to_i != 0

    ports = []
    # split on each newline
    cmd.stdout.each_line do |line|
      # parse each line
      # 1 - COMMAND, 2 - PID, 3 - USER, 4 - FD, 5 - TYPE, 6 - DEVICE, 7 - SIZE/OFF, 8 - NODE, 9 - NAME
      parsed = /^(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+).*$/.match(line)
      # extract network info
      net_addr = parsed[9].split(':')
      # convert to number if possible
      net_port = net_addr[1]
      net_port = net_port.to_i if /^\d+$/.match(net_port)
      protocol = parsed[8].downcase

      # add version to protocol
      type = parsed[5].downcase
      protocol += '6' if type == 'IPv6'

      # map data
      port_info = {
        port: net_port,
        address: net_addr[0],
        protocol: protocol,
        process: parsed[1],
        pid: parsed[2].to_i,
      }

      # push data, if not headerfile
      ports.push(port_info) if %w{tcp tcp6 udp udp6}.include?(protocol)
    end
    ports
  end
end

# extract port information from netstat
class LinuxPorts < PortsInfo
  def info
    cmd = @vulcano.command('netstat -tulpen')
    return nil if cmd.exit_status.to_i != 0

    ports = []
    # parse all lines
    cmd.stdout.each_line do |line|
      port_info = parse_netstat_line(line)

      # only push protocols we are interested in
      next unless %w{tcp tcp6 udp udp6}.include?(port_info[:protocol])
      ports.push(port_info)
    end
    ports
  end

  def parse_net_address(net_addr, protocol)
    if protocol.eql?('tcp6') || protocol.eql?('udp6')
      # prep for URI parsing, parse ip6 port
      ip6 = /^(\S+:)(\d+)$/.match(net_addr)
      ip6addr = ip6[1]
      ip6addr = '::' if /^:::$/.match(ip6addr)
      # build uri
      ip_addr = URI("addr://[#{ip6addr}]:#{ip6[2]}")
      # replace []
      host = ip_addr.host[1..ip_addr.host.size-2]
      port = ip_addr.port
    else
      ip_addr = URI('addr://'+net_addr)
      host = ip_addr.host
      port = ip_addr.port
    end
    [host, port]
  end

  def parse_netstat_line(line)
    # parse each line
    # 1 - Proto, 2 - Recv-Q, 3 - Send-Q, 4 - Local Address, 5 - Foreign Address, 6 - State, 7 - Inode, 8 - PID/Program name
    parsed = /^(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)$/.match(line)
    return {} if parsed.nil?

    # parse ip4 and ip6 addresses
    protocol = parsed[1].downcase
    host, port = parse_net_address(parsed[4], protocol)

    # extract PID
    process = parsed[9].split('/')
    pid = process[0]
    pid = pid.to_i if /^\d+$/.match(pid)
    process = process[1]

    # map data
    {
      port: port,
      address: host,
      protocol: protocol,
      process: process,
      pid: pid,
    }
  end
end

# extracts information from sockstat
class FreeBsdPorts < PortsInfo
  def info
    cmd = @vulcano.command('sockstat -46l')
    return nil if cmd.exit_status.to_i != 0

    ports = []
    # split on each newline
    cmd.stdout.each_line do |line|
      port_info = parse_sockstat_line(line)

      # push data, if not headerfile
      next unless %w{tcp tcp6 udp udp6}.include?(port_info[:protocol])
      ports.push(port_info)
    end
    ports
  end

  def parse_net_address(net_addr, protocol)
    case protocol
    when 'tcp4', 'udp4'
      # replace * with 0.0.0.0
      net_addr = net_addr.gsub(/^\*:/, '0.0.0.0:') if /^*:(\d+)$/.match(net_addr)
      ip_addr = URI('addr://'+net_addr)
      host = ip_addr.host
      port = ip_addr.port
    when 'tcp6', 'udp6'
      return [] if net_addr == '*:*' # abort for now
      # replace * with 0:0:0:0:0:0:0:0
      net_addr = net_addr.gsub(/^\*:/, '0:0:0:0:0:0:0:0:') if /^*:(\d+)$/.match(net_addr)
      # extract port
      ip6 = /^(\S+):(\d+)$/.match(net_addr)
      ip6addr = ip6[1]
      ip_addr = URI("addr://[#{ip6addr}]:#{ip6[2]}")
      # replace []
      host = ip_addr.host[1..ip_addr.host.size-2]
      port = ip_addr.port
    end
    [host, port]
  end

  def parse_sockstat_line(line)
    # 1 - USER, 2 - COMMAND, 3 - PID, 4 - FD 5 - PROTO, 6 - LOCAL ADDRESS, 7 - FOREIGN ADDRESS
    parsed = /^(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)$/.match(line)
    return {} if parsed.nil?

    # extract ip information
    protocol = parsed[5].downcase
    host, port = parse_net_address(parsed[6], protocol)
    return {} if host.nil? or port.nil?

    # extract process
    process = parsed[2]

    # extract PID
    pid = parsed[3]
    pid = pid.to_i if /^\d+$/.match(pid)

    # map tcp4 and udp4
    protocol = 'tcp' if protocol.eql?('tcp4')
    protocol = 'udp' if protocol.eql?('udp4')

    # map data
    {
      port: port,
      address: host,
      protocol: protocol,
      process: process,
      pid: pid,
    }
  end
end
