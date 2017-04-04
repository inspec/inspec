# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

# Usage:
# describe host('example.com') do
#   it { should be_resolvable }
#   it { should be_reachable }
#   its('ipaddress') { should include '93.184.216.34' }
# end
#
# To verify a hostname with protocol and port
# describe host('example.com', port: 53, proto: 'udp') do
#   it { should be_reachable }
# end
#
# We do not support the following serverspec syntax:
# describe host('example.com') do
#   it { should be_reachable.with( :port => 22 ) }
#   it { should be_reachable.with( :port => 22, :proto => 'tcp' ) }
#   it { should be_reachable.with( :port => 53, :proto => 'udp' ) }
#
#   it { should be_resolvable.by('hosts') }
#   it { should be_resolvable.by('dns') }
# end

module Inspec::Resources
  class Host < Inspec.resource(1)
    name 'host'
    desc 'Use the host InSpec audit resource to test the name used to refer to a specific host and its availability, including the Internet protocols and ports over which that host name should be available.'
    example "
      describe host('example.com') do
        it { should be_reachable }
      end

      describe host('example.com', port: '80') do
        it { should be_reachable }
      end
    "

    def initialize(hostname, params = {})
      @hostname = hostname
      @port = params[:port]   || nil
      @proto = params[:proto] || nil

      return skip_resource 'The UDP protocol for the `host` resource is not supported yet.' if @proto == 'udp'

      @host_provider = nil
      if inspec.os.linux?
        @host_provider = LinuxHostProvider.new(inspec)
      elsif inspec.os.windows?
        @host_provider = WindowsHostProvider.new(inspec)
      elsif inspec.os.darwin?
        @host_provider = DarwinHostProvider.new(inspec)
      else
        return skip_resource 'The `host` resource is not supported on your OS yet.'
      end
    end

    # if we get the IP address, the host is resolvable
    def resolvable?(type = nil)
      warn "The `host` resource ignores #{type} parameters. Continue to resolve host." if !type.nil?
      resolve.nil? || resolve.empty? ? false : true
    end

    def reachable?(port = nil, proto = nil, timeout = nil)
      raise "Use `host` resource with host('#{@hostname}', port: #{port}, proto: '#{proto}') parameters." if !port.nil? || !proto.nil? || !timeout.nil?
      ping.nil? ? false : ping
    end

    # returns all A records of the IP address, will return an array
    def ipaddress
      resolve.nil? || resolve.empty? ? nil : resolve
    end

    def to_s
      "Host #{@hostname}"
    end

    private

    def ping
      return @ping_cache if defined?(@ping_cache)
      @ping_cache = @host_provider.ping(@hostname, @port, @proto) if !@host_provider.nil?
    end

    def resolve
      return @ip_cache if defined?(@ip_cache)
      @ip_cache = @host_provider.resolve(@hostname) if !@host_provider.nil?
    end
  end

  class HostProvider
    attr_reader :inspec
    def initialize(inspec)
      @inspec = inspec
    end
  end

  class DarwinHostProvider < HostProvider
    def ping(hostname, port = nil, proto = nil)
      if proto == 'tcp'
        resp = inspec.command("nc -vz -G 1 #{hostname} #{port}")
      else
        resp = inspec.command("ping -W 1 -c 1 #{hostname}")
      end
      resp.exit_status.to_i != 0 ? false : true
    end

    def resolve(hostname)
      # Resolve IPv6 address first, if that fails try IPv4 to match Linux behaivor
      cmd = inspec.command("host -t AAAA #{hostname}")
      if cmd.exit_status.to_i != 0
        cmd = inspec.command("host -t A #{hostname}")
      end
      return nil if cmd.exit_status.to_i != 0

      resolve = /^.* has IPv\d address\s+(?<ip>\S+)\s*$/.match(cmd.stdout.chomp)
      [resolve[1]] if resolve
    end
  end

  class LinuxHostProvider < HostProvider
    # ping is difficult to achieve, since we are not sure
    def ping(hostname, _port = nil, _proto = nil)
      # fall back to ping, but we can only test ICMP packages with ping
      # therefore we have to skip the test, if we do not have everything on the node to run the test
      ping = inspec.command("ping -w 1 -c 1 #{hostname}")
      ping.exit_status.to_i != 0 ? false : true
    end

    def resolve(hostname)
      # TODO: we rely on getent hosts for now, but it prefers to return IPv6, only then IPv4
      cmd = inspec.command("getent hosts #{hostname}")
      return nil if cmd.exit_status.to_i != 0

      # extract ip adress
      resolve = /^\s*(?<ip>\S+)\s+(.*)\s*$/.match(cmd.stdout.chomp)
      [resolve[1]] if resolve
    end
  end

  # Windows
  # TODO: UDP is not supported yey, we need a custom ps1 script to add udp support
  # @see http://blogs.technet.com/b/josebda/archive/2015/04/18/windows-powershell-equivalents-for-common-networking-commands-ipconfig-ping-nslookup.aspx
  # @see http://blogs.technet.com/b/heyscriptingguy/archive/2014/03/19/creating-a-port-scanner-with-windows-powershell.aspx
  class WindowsHostProvider < HostProvider
    def ping(hostname, port = nil, _proto = nil)
      # ICMP: Test-NetConnection www.microsoft.com
      # TCP and port: Test-NetConnection -ComputerName www.microsoft.com -RemotePort 80
      request = "Test-NetConnection -ComputerName #{hostname}"
      request += " -RemotePort #{port}" unless port.nil?
      request += '| Select-Object -Property ComputerName, TcpTestSucceeded, PingSucceeded | ConvertTo-Json'
      cmd = inspec.command(request)

      begin
        ping = JSON.parse(cmd.stdout)
      rescue JSON::ParserError => _e
        return nil
      end

      # Logic being if you provided a port you wanted to check it was open
      if port.nil?
        ping['PingSucceeded']
      else
        ping['TcpTestSucceeded']
      end
    end

    def resolve(hostname)
      cmd = inspec.command("Resolve-DnsName –Type A #{hostname} | ConvertTo-Json")
      begin
        resolv = JSON.parse(cmd.stdout)
      rescue JSON::ParserError => _e
        return nil
      end

      resolv = [resolv] unless resolv.is_a?(Array)
      resolv.map { |entry| entry['IPAddress'] }
    end
  end
end
