
require 'inspec/utils/parser'
require 'inspec/utils/filter'
require 'ipaddr'

# TODO: currently we return local ip only
# TODO: improve handling of same port on multiple interfaces
module Inspec::Resources
  class Port < Inspec.resource(1)
    name 'port'
    supports platform: 'unix'
    supports platform: 'windows'
    desc "Use the port InSpec audit resource to test basic port properties, such as port, process, if it's listening."
    example <<~EXAMPLE
      describe port(80) do
        it { should be_listening }
        its('protocols') {should eq ['tcp']}
        its('addresses') {should eq ['127.0.0.1']}
      end

      describe port.where { protocol =~ /tcp/ && port > 80 } do
        it { should_not be_listening }
      end
    EXAMPLE

    def initialize(*args)
      args.unshift(nil) if args.length <= 1 # add the ip address to the front
      @ip = args[0]
      @port = if args[1].nil?
                nil
              else
                args[1].to_i
              end

      @cache = nil
      @port_manager = port_manager_for_os
      return skip_resource 'The `port` resource is not supported on your OS yet.' if @port_manager.nil?
    end

    filter = FilterTable.create
    filter.register_column(:ports,     field: 'port', style: :simple)
          .register_column(:addresses, field: 'address', style: :simple)
          .register_column(:protocols, field: 'protocol', style: :simple)
          .register_column(:processes, field: 'process', style: :simple)
          .register_column(:pids,      field: 'pid', style: :simple)
          .register_custom_matcher(:listening?) { |x| !x.entries.empty? }
    filter.install_filter_methods_on_resource(self, :info)

    def to_s
      "Port #{@port}"
    end

    private

    def port_manager_for_os
      os = inspec.os
      if os.linux?
        LinuxPorts.new(inspec)
      elsif os.aix?
        # AIX: see http://www.ibm.com/developerworks/aix/library/au-lsof.html#resources
        #      and https://www-01.ibm.com/marketing/iwm/iwm/web/reg/pick.do?source=aixbp
        AixPorts.new(inspec)
      elsif os.darwin?
        # Darwin: https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man8/lsof.8.html
        # Careful: make sure darwin comes before BSD, below
        LsofPorts.new(inspec)
      elsif os.windows?
        WindowsPorts.new(inspec)
      elsif os.bsd?
        # Relies on sockstat, usually present on FreeBSD and NetBSD (but not MacOS X)
        FreeBsdPorts.new(inspec)
      elsif os.solaris?
        SolarisPorts.new(inspec)
      elsif os.hpux?
        HpuxPorts.new(inspec)
      end
    end

    def info
      return @cache if !@cache.nil?
      # abort if os detection has not worked
      return @cache = [] if @port_manager.nil?
      # query ports
      cache = @port_manager.info || []
      cache.select! { |x| x['port'] == @port } unless @port.nil?
      cache.select! { |x| x['address'] == @ip } unless @ip.nil?
      @cache = cache
    end
  end

  # implements an info method and returns all ip adresses and protocols for
  # each port
  # [{
  #   'port' => 22,
  #   'address' => '0.0.0.0'
  #   'protocol' => 'tcp'
  # },
  # {
  #   'port' => 22,
  #   'address' => '::'
  #   'protocol' => 'tcp6'
  # }]
  class PortsInfo
    attr_reader :inspec
    def initialize(inspec)
      @inspec = inspec
    end
  end

  # TODO: Add UDP infromation Get-NetUDPEndpoint
  # TODO: currently Windows only supports tcp ports
  # TODO: Get-NetTCPConnection does not return PIDs
  # TODO: double-check output with 'netstat -ano'
  # @see https://connect.microsoft.com/PowerShell/feedback/details/1349420/get-nettcpconnection-does-not-show-processid
  class WindowsPorts < PortsInfo
    def info
      netstat_info || powershell_info
    end

    private

    def powershell_info
      cmd = inspec.command('Get-NetTCPConnection -state Listen | Select-Object -Property State, Caption, Description, LocalAddress, LocalPort, RemoteAddress, RemotePort, DisplayName, Status | ConvertTo-Json')
      return nil if cmd.exit_status != 0

      entries = JSON.parse(cmd.stdout)
      return nil if entries.nil?

      entries.map { |x|
        {
          'port'     => x['LocalPort'],
          'address'  => x['LocalAddress'],
          'protocol' => 'tcp',
        }
      }
    rescue JSON::ParserError => _e
      return nil
    end

    def netstat_info
      # retrieve processes grepping by LISTENING state with 0 lines before and 1 after to catch the process name
      # also UDP ports have nothing in the State column
      cmd = inspec.command('netstat -anbo | Select-String  -CaseSensitive -pattern "^\s+UDP|\s+LISTENING\s+\d+$" -context 0,1')
      return nil if cmd.exit_status != 0
      lines = cmd.stdout.scan(/^>\s*(tcp\S*|udp\S*)\s+(\S+):(\d+)\s+(\S+)\s+(\S*)\s+(\d+)\s+(.+)/i)
      lines.map do |line|
        pid = line[5].to_i
        process = line[6].delete('[').delete(']').strip
        process = 'System' if process == 'Can not obtain ownership information' && pid == 4
        {
          'port'     => line[2].to_i,
          'address'  => line[1].delete('[').delete(']'),
          'protocol' => line[0].downcase,
          'pid'      => pid,
          'process'  => process,
        }
      end
    end
  end

  # extracts udp and tcp ports from the lsof command
  class LsofPorts < PortsInfo
    attr_reader :lsof

    def initialize(inspec, lsofpath = nil)
      @lsof = lsofpath || 'lsof'
      super(inspec)
    end

    def info
      ports = []

      # check that lsof is available, otherwise fail
      raise 'Please ensure `lsof` is available on the machine.' if !inspec.command(@lsof.to_s).exist?

      # -F p=pid, c=command, P=protocol name, t=type, n=internet addresses
      # see 'OUTPUT FOR OTHER PROGRAMS' in LSOF(8)
      lsof_cmd = inspec.command("#{@lsof} -nP -i -FpctPn")
      return nil if lsof_cmd.exit_status.to_i != 0

      # map to desired return struct
      lsof_parser(lsof_cmd).each do |process, port_ids|
        pid, cmd = process.split(':')
        port_ids.each do |port_str|
          # should not break on ipv6 addresses
          ipv, proto, port, host = port_str.split(':', 4)
          ports.push({ 'port'     => port.to_i,
                       'address'  => host,
                       'protocol' => ipv == 'ipv6' ? proto + '6' : proto,
                       'process'  => cmd,
                       'pid'      => pid.to_i })
        end
      end

      ports
    end

    # rubocop:disable Metrics/CyclomaticComplexity
    # rubocop:disable Metrics/AbcSize
    def lsof_parser(lsof_cmd)
      procs = {}
      # build this with formatted output (-F) from lsof
      # procs = {
      #   '123:sshd' => [
      #      'ipv4:tcp:22:127.0.0.1',
      #      'ipv6:tcp:22:::1',
      #      'ipv4:tcp:*',
      #      'ipv6:tcp:*',
      #   ],
      #   '456:ntpd' => [
      #      'ipv4:udp:123:*',
      #      'ipv6:udp:123:*',
      #   ]
      # }
      proc_id = port_id = nil
      lsof_cmd.stdout.each_line do |line|
        line.chomp!
        key = line.slice!(0)
        case key
        when 'p'
          proc_id = line
          port_id = nil
        when 'c'
          proc_id += ':' + line
        when 't'
          port_id = line.downcase
        when 'P'
          port_id += ':' + line.downcase
        when 'n'
          src, dst = line.split('->')

          # skip active comm streams
          next if dst

          host, port = /^(\S+):(\d+|\*)$/.match(src)[1, 2]

          # skip channels from port 0 - what does this mean?
          next if port == '*'

          # create new array stub if !exist?
          procs[proc_id] = [] unless procs.key?(proc_id)

          # change address '*' to zero
          host = port_id =~ /^ipv6:/ ? '[::]' : '0.0.0.0' if host == '*'
          # entrust URI to scrub the host and port
          begin
            uri = URI("addr://#{host}:#{port}")
            uri.host && uri.port
          rescue => e
            warn "could not parse URI 'addr://#{host}:#{port}' - #{e}"
            next
          end

          # e.g. 'ipv4:tcp:22:127.0.0.1'
          #                             strip ipv6 squares for inspec
          port_id += ':' + port + ':' + host.gsub(/^\[|\]$/, '')

          # lsof will give us another port unless it's done
          procs[proc_id] << port_id
        end
      end

      procs
    end
  end

  class AixPorts < PortsInfo
    def info
      ports_via_netstat || ports_via_lsof
    end

    def ports_via_lsof
      return nil unless inspec.command('lsof').exist?
      LsofPorts.new(inspec).info
    end

    def ports_via_netstat
      return nil unless inspec.command('netstat').exist?

      cmd = inspec.command('netstat -Aan | grep LISTEN')
      return nil unless cmd.exit_status.to_i.zero?

      ports = []
      # parse all lines
      cmd.stdout.each_line do |line|
        port_info = parse_netstat_line(line)

        # only push protocols we are interested in
        next unless %w{tcp tcp6 udp udp6}.include?(port_info['protocol'])
        ports.push(port_info)
      end

      ports
    end

    def parse_netstat_line(line)
      # parse each line
      # 1 - Socket, 2 - Proto, 3 - Receive-Q, 4 - Send-Q, 5 - Local address, 6 - Foreign Address, 7 - State
      parsed = /^(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)?\s+(\S+)/.match(line)
      return {} if parsed.nil?

      # parse ip4 and ip6 addresses
      protocol = parsed[2].downcase

      # detect protocol if not provided
      protocol += '6' if parsed[5].count(':') > 1 && %w{tcp udp}.include?(protocol)
      protocol.chop! if %w{tcp4 upd4}.include?(protocol)

      # extract host and port information
      host, port = parse_net_address(parsed[5], protocol)
      return {} if host.nil?

      # extract PID
      cmd = inspec.command("rmsock #{parsed[1]} tcpcb")
      parsed_pid = /^The socket (\S+) is being held by proccess (\d+) \((\S+)\)/.match(cmd.stdout)
      return {} if parsed_pid.nil?
      process = parsed_pid[3]
      pid = parsed_pid[2]
      pid = pid.to_i if pid =~ /^\d+$/

      {
        'port'     => port,
        'address'  => host,
        'protocol' => protocol,
        'process'  => process,
        'pid'      => pid,
      }
    end

    def parse_net_address(net_addr, protocol)
      # local/foreign addresses on AIX use a '.' to separate the addresss
      # from the port
      address, _sep, port = net_addr.rpartition('.')
      if protocol.eql?('tcp6') || protocol.eql?('udp6')
        ip6addr = address
        # AIX uses the wildcard character for ipv6 addresses listening on
        # all interfaces.
        ip6addr = '::' if ip6addr =~ /^\*$/

        # v6 addresses need to end in a double-colon when using
        # shorthand notation. netstat ends with a single colon.
        # IPAddr will fail to properly parse an address unless it
        # uses a double-colon for short-hand notation.
        ip6addr += ':' if ip6addr =~ /\w:$/

        begin
          ip_parser = IPAddr.new(ip6addr)
        rescue IPAddr::InvalidAddressError
          # This IP is not parsable. There appears to be a bug in netstat
          # output that truncates link-local IP addresses:
          # example: udp6 0 0 fe80::42:acff:fe11::123 :::* 0 54550 3335/ntpd
          # actual link address: inet6 fe80::42:acff:fe11:5/64 scope link
          #
          # in this example, the "5" is truncated making the netstat output
          # an invalid IP address.
          return [nil, nil]
        end

        # Check to see if this is a IPv4 address in a tcp6/udp6 line.
        # If so, don't put brackets around the IP or URI won't know how
        # to properly handle it.
        # example: f000000000000000 tcp6       0      0 127.0.0.1.8005          *.*                    LISTEN
        if ip_parser.ipv4?
          ip_addr = URI("addr://#{ip6addr}:#{port}")
          host = ip_addr.host
        else
          ip_addr = URI("addr://[#{ip6addr}]:#{port}")
          host = ip_addr.host[1..ip_addr.host.size-2]
        end
      else
        ip4addr = address
        # In AIX the wildcard character is used to match all interfaces
        ip4addr = '0.0.0.0' if ip4addr =~ /^\*$/
        ip_addr = URI("addr://#{ip4addr}:#{port}")
        host = ip_addr.host
      end

      [host, port.to_i]
    end
  end

  # extract port information from netstat
  class LinuxPorts < PortsInfo
    ALLOWED_PROTOCOLS = %w{tcp tcp6 udp udp6}.freeze

    def info
      ports_via_ss || ports_via_netstat
    end

    def ports_via_ss
      return nil unless inspec.command('ss').exist?

      cmd = inspec.command('ss -tulpen')
      return nil unless cmd.exit_status.to_i.zero?

      ports = []

      cmd.stdout.each_line do |line|
        parsed_line = parse_ss_line(line)
        ports << parsed_line unless parsed_line.nil?
      end

      ports
    end

    def ports_via_netstat
      return nil unless inspec.command('netstat').exist?

      cmd = inspec.command('netstat -tulpen')
      return nil unless cmd.exit_status.to_i.zero?

      ports = []
      # parse all lines
      cmd.stdout.each_line do |line|
        port_info = parse_netstat_line(line)

        # only push protocols we are interested in
        next unless %w{tcp tcp6 udp udp6}.include?(port_info['protocol'])
        ports.push(port_info)
      end
      ports
    end

    def parse_net_address(net_addr, protocol)
      if protocol.eql?('tcp6') || protocol.eql?('udp6')
        # prep for URI parsing, parse ip6 port
        ip6 = /^(\S+):(\d+)$/.match(net_addr)
        ip6addr = ip6[1]
        ip6addr = '::' if ip6addr =~ /^:::$/

        # v6 addresses need to end in a double-colon when using
        # shorthand notation. netstat ends with a single colon.
        # IPAddr will fail to properly parse an address unless it
        # uses a double-colon for short-hand notation.
        ip6addr += ':' if ip6addr =~ /\w:$/

        begin
          ip_parser = IPAddr.new(ip6addr)
        rescue IPAddr::InvalidAddressError
          # This IP is not parsable. There appears to be a bug in netstat
          # output that truncates link-local IP addresses:
          # example: udp6 0 0 fe80::42:acff:fe11::123 :::* 0 54550 3335/ntpd
          # actual link address: inet6 fe80::42:acff:fe11:5/64 scope link
          #
          # in this example, the "5" is truncated making the netstat output
          # an invalid IP address.
          return [nil, nil]
        end

        # Check to see if this is a IPv4 address in a tcp6/udp6 line.
        # If so, don't put brackets around the IP or URI won't know how
        # to properly handle it.
        # example: tcp6       0      0 127.0.0.1:8005          :::*                    LISTEN
        if ip_parser.ipv4?
          ip_addr = URI("addr://#{ip6addr}:#{ip6[2]}")
          host = ip_addr.host
        else
          ip_addr = URI("addr://[#{ip6addr}]:#{ip6[2]}")
          # strip []
          host = ip_addr.host[1..ip_addr.host.size-2]
        end
      else
        ip_addr = URI('addr://'+net_addr)
        host = ip_addr.host
      end

      port = ip_addr.port

      [host, port]
    rescue URI::InvalidURIError => e
      warn "Could not parse #{net_addr}, #{e}"
      nil
    end

    def parse_netstat_line(line)
      # parse each line
      # 1 - Proto, 2 - Recv-Q, 3 - Send-Q, 4 - Local Address, 5 - Foreign Address, 6 - State, 7 - User, 8 - Inode, 9 - PID/Program name
      # * UDP lines have an empty State column and the Busybox variant lacks
      # the User and Inode columns.
      reg =  /^(?<proto>\S+)\s+(\S+)\s+(\S+)\s+(?<local_addr>\S+)\s+(?<foreign_addr>\S+)\s+(\S+)?\s+((\S+)\s+(\S+)\s+)?(?<pid_prog>\S+)/
      parsed = reg.match(line)

      return {} if parsed.nil? || line.match(/^proto/i)

      # parse ip4 and ip6 addresses
      protocol = parsed[:proto].downcase

      # detect protocol if not provided
      protocol += '6' if parsed[:local_addr].count(':') > 1 && %w{tcp udp}.include?(protocol)

      # extract host and port information
      host, port = parse_net_address(parsed[:local_addr], protocol)
      return {} if host.nil?

      # extract PID
      process = parsed[:pid_prog].split('/')
      pid = process[0]
      pid = pid.to_i if pid =~ /^\d+$/
      process = process[1]

      {
        'port'     => port,
        'address'  => host,
        'protocol' => protocol,
        'process'  => process,
        'pid'      => pid,
      }
    end

    def tokenize_ss_line(line)
      # iproute-2.6.32-54.el6 output:
      # Netid State      Recv-Q Send-Q  Local Address:Port Peer Address:Port
      # udp   UNCONN     0      0       *:111              *:*                 users:(("rpcbind",1123,6)) ino=8680 sk=ffff8801390cf7c0
      # tcp   LISTEN     0      128     *:22               *:*                 users:(("sshd",3965,3)) ino:11604 sk:ffff88013a3b5800
      #
      # iproute-2.6.32-20.el6 output:
      # Netid            Recv-Q Send-Q  Local Address:Port Peer Address:Port
      # udp              0      0       *:111              *:*                 users:(("rpcbind",1123,6)) ino=8680 sk=ffff8801390cf7c0
      # tcp              0      128     *:22               *:*                 users:(("sshd",3965,3)) ino:11604 sk:ffff88013a3b5800
      tokens = line.split(/\s+/, 7)
      if tokens[1] =~ /^\d+$/ # iproute-2.6.32-20
        {
          netid: tokens[0],
          local_addr: tokens[3],
          process_info: tokens[5],
        }
      else # iproute-2.6.32-54
        {
          netid: tokens[0],
          local_addr: tokens[4],
          process_info: tokens[6],
        }
      end
    end

    def parse_ss_line(line)
      # parsed = line.split(/\s+/, 7)
      parsed = tokenize_ss_line(line)

      # ss only returns "tcp" and "udp" as the protocol. However, netstat would return
      # "tcp6" and "udp6" as necessary. In order to maintain backward compatibility, we
      # will manually modify the protocol value if the line we're parsing is an IPv6
      # entry.
      process_info = parsed[:process_info]
      protocol = parsed[:netid]
      protocol += '6' if process_info.include?('v6only:1')
      return nil unless ALLOWED_PROTOCOLS.include?(protocol)

      # parse the Local Address:Port
      # examples:
      #   *:22
      #   :::22
      #   10.0.2.15:1234
      #   ::ffff:10.0.2.15:9300
      #   fe80::a00:27ff:fe32:ed09%enp0s3:9200
      parsed_net_address = parsed[:local_addr].match(/(\S+):(\*|\d+)$/)
      return nil if parsed_net_address.nil?
      host = parsed_net_address[1]
      port = parsed_net_address[2]
      return nil if host.nil? && port.nil?

      # For backward compatibility with the netstat output, ensure the
      # port is stored as an integer
      port = port.to_i

      # for those "v4-but-listed-in-v6" entries, strip off the
      # leading IPv6 value at the beginning
      # example: ::ffff:10.0.2.15:9200
      host.delete!('::ffff:') if host.start_with?('::ffff:')

      # To remove brackets that might surround the IPv6 address
      # example: [::] and [fe80::dc11:b9b6:514b:134]%eth0:123
      host = host.tr('[]', '')

      # if there's an interface name in the local address, which is common for
      # IPv6 listeners, strip that out too.
      # example: fe80::a00:27ff:fe32:ed09%enp0s3
      host = host.split('%').first

      # if host is "*", replace with "0.0.0.0" to maintain backward compatibility with
      # the netstat-provided data
      host = '0.0.0.0' if host == '*'

      # in case process list parsing is not successfull
      process = nil
      pid = nil

      # parse process and pid from the process list
      #
      # remove the "users:((" and  "))" parts
      # input: users:((\"nginx\",pid=583,fd=8),(\"nginx\",pid=582,fd=8),(\"nginx\",pid=580,fd=8),(\"nginx\",pid=579,fd=8))
      # res: \"nginx\",pid=583,fd=8),(\"nginx\",pid=582,fd=8),(\"nginx\",pid=580,fd=8),(\"nginx\",pid=579,fd=8
      process_list_match = parsed[:process_info].match(/users:\(\((.+)\)\)/)
      if process_list_match
        # list entires are seperated by "," the braces can also be removed
        # input: \"nginx\",pid=583,fd=8),(\"nginx\",pid=582,fd=8),(\"nginx\",pid=580,fd=8),(\"nginx\",pid=579,fd=8
        # res: ["\"nginx\",pid=583,fd=8", "\"nginx\",pid=582,fd=8", "\"nginx\",pid=580,fd=8", "\"nginx\",pid=579,fd=8"]
        process_list = process_list_match[1].split('),(')
        # To stay backwards compatible with netstat we need to select
        # the last element in the resulting array.
        # res: "\"nginx\",pid=579,fd=8"

        # parse the process name from the process list
        process_match = process_list.last.match(/^\"(\S+)\"/)
        process = process_match.nil? ? nil : process_match[1]

        # parse the PID from the process list
        pid_match = process_list.last.match(/pid=(\d+)/)
        pid = pid_match.nil? ? nil : pid_match[1].to_i
      end

      {
        'port'     => port,
        'address'  => host,
        'protocol' => protocol,
        'process'  => process,
        'pid'      => pid,
      }
    end
  end

  # extracts information from sockstat
  class FreeBsdPorts < PortsInfo
    def info
      cmd = inspec.command('sockstat -46l')
      return nil if cmd.exit_status.to_i != 0

      ports = []
      # split on each newline
      cmd.stdout.each_line do |line|
        port_info = parse_sockstat_line(line)

        # push data, if not headerfile
        next unless %w{tcp tcp6 udp udp6}.include?(port_info['protocol'])
        ports.push(port_info)
      end
      ports
    end

    def parse_net_address(net_addr, protocol)
      case protocol
      when 'tcp4', 'udp4', 'tcp', 'udp'
        # replace * with 0.0.0.0
        net_addr = net_addr.gsub(/^\*:/, '0.0.0.0:') if net_addr =~ /^*:(\d+)$/
        ip_addr = URI('addr://'+net_addr)
        host = ip_addr.host
        port = ip_addr.port
      when 'tcp6', 'udp6'
        return [] if net_addr == '*:*' # abort for now
        # replace * with 0:0:0:0:0:0:0:0
        net_addr = net_addr.gsub(/^\*:/, '0:0:0:0:0:0:0:0:') if net_addr =~ /^*:(\d+)$/
        # extract port
        ip6 = /^(\S+):(\d+)$/.match(net_addr)
        ip6addr = ip6[1]
        ip_addr = URI("addr://[#{ip6addr}]:#{ip6[2]}")
        # replace []
        host = ip_addr.host[1..ip_addr.host.size-2]
        port = ip_addr.port
      end
      [host, port]
    rescue URI::InvalidURIError => e
      warn "Could not parse #{net_addr}, #{e}"
      nil
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
      pid = pid.to_i if pid =~ /^\d+$/

      # map tcp4 and udp4
      protocol = 'tcp' if protocol.eql?('tcp4')
      protocol = 'udp' if protocol.eql?('udp4')

      {
        'port'     => port,
        'address'  => host,
        'protocol' => protocol,
        'process'  => process,
        'pid'      => pid,
      }
    end
  end

  class SolarisPorts < FreeBsdPorts
    include SolarisNetstatParser

    def info
      # extract all port info
      cmd = inspec.command('netstat -an -f inet -f inet6')
      return nil if cmd.exit_status.to_i != 0

      # parse the content
      netstat_ports = parse_netstat(cmd.stdout)

      # filter all ports, where we `listen`
      listen = netstat_ports.select { |val|
        !val['state'].nil? && 'listen'.casecmp(val['state']) == 0
      }

      # map the data
      ports = listen.map { |val|
        protocol = val['protocol']
        local_addr = val['local-address']

        # solaris uses 127.0.0.1.57455 instead 127.0.0.1:57455, lets convert the
        # the last . to :
        local_addr[local_addr.rindex('.')] = ':'
        host, port = parse_net_address(local_addr, protocol)
        if host.nil?
          nil
        else
          {
            'port'     => port,
            'address'  => host,
            'protocol' => protocol,
          }
        end
      }
      ports.compact
    end
  end

  # extracts information from netstat for hpux
  class HpuxPorts < FreeBsdPorts
    def info
      ## Can't use 'netstat -an -f inet -f inet6' as the latter -f option overrides the former one and return only inet ports
      cmd1 = inspec.command('netstat -an -f inet')
      return nil if cmd1.exit_status.to_i != 0
      cmd2 = inspec.command('netstat -an -f inet6')
      return nil if cmd2.exit_status.to_i != 0
      cmd = cmd1.stdout + cmd2.stdout
      ports = []
      # parse all lines
      cmd.each_line do |line|
        port_info = parse_netstat_line(line)
        next unless %w{tcp tcp6 udp udp6}.include?(port_info['protocol'])
        ports.push(port_info)
      end
      # select all ports, where we `listen`
      ports.select { |val| val if 'listen'.casecmp(val['state']) == 0 }
    end

    def parse_netstat_line(line)
      # parse each line
      # 1 - Proto, 2 - Recv-Q, 3 - Send-Q, 4 - Local Address, 5 - Foreign Address, 6 - (state)
      parsed = /^(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)?/.match(line)

      return {} if parsed.nil? || line.match(/^proto/i) || line.match(/^active/i)
      protocol = parsed[1].downcase
      state = parsed[6].nil?? ' ' : parsed[6].downcase
      local_addr = parsed[4]
      local_addr[local_addr.rindex('.')] = ':'
      # extract host and port information
      host, port = parse_net_address(local_addr, protocol)
      return {} if host.nil?
      # map data
      {
        'port'     => port,
        'address'  => host,
        'protocol' => protocol,
        'state'    => state,
      }
    end
  end
end
