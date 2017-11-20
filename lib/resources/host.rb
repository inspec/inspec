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
# describe host('example.com', port: 443, protocol: 'tcp') do
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

require 'resolv'

module Inspec::Resources
  class Host < Inspec.resource(1)
    name 'host'
    desc 'Use the host InSpec audit resource to test the name used to refer to a specific host and its availability, including the Internet protocols and ports over which that host name should be available.'
    example "
      describe host('example.com') do
        it { should be_reachable }
        it { should be_resolvable }
        its('ipaddress') { should include '12.34.56.78' }
      end

      describe host('example.com', port: '80', protocol: 'tcp') do
        it { should be_reachable }
      end
    "

    attr_reader :hostname, :port, :protocol

    def initialize(hostname, params = {})
      @hostname = hostname
      @port = params[:port]

      if params[:proto]
        warn '[DEPRECATION] The `proto` parameter is deprecated. Use `protocol` instead.'
        @protocol = params[:proto]
      else
        @protocol = params.fetch(:protocol, 'icmp')
      end

      return skip_resource 'Invalid protocol: only `tcp` and `icmp` protocols are support for the `host` resource.' unless
        %w{icmp tcp}.include?(@protocol)

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

      missing_requirements = @host_provider.missing_requirements(protocol)
      return skip_resource 'The following requirements are not met for this resource: ' \
        "#{missing_requirements.join(', ')}" unless missing_requirements.empty?
    end

    def proto
      warn '[DEPRECATION] The `proto` method is deprecated. Use `protocol` instead.'
      protocol
    end

    # if we get the IP address, the host is resolvable
    def resolvable?(type = nil)
      warn "The `host` resource ignores #{type} parameters. Continue to resolve host." if !type.nil?
      resolve.nil? || resolve.empty? ? false : true
    end

    def reachable?
      # ping checks do not require port or protocol
      return ping.fetch(:success, false) if protocol == 'icmp'

      # if either port or protocol are specified but not both, we cannot proceed.
      if port.nil? || protocol.nil?
        raise "Protocol required with port. Use `host` resource with host('#{hostname}', port: 1234, proto: 'tcp') parameters." if port.nil? || protocol.nil?
      end

      # perform the protocol-specific reachability test
      ping.fetch(:success, false)
    end

    def connection
      ping[:connection]
    end

    def socket
      ping[:socket]
    end

    # returns all A records of the IP address, will return an array
    def ipaddress
      resolve.nil? || resolve.empty? ? nil : resolve
    end

    def to_s
      resource_name = "Host #{hostname}"
      resource_name += " port #{port} proto #{protocol}" if port

      resource_name
    end

    private

    def ping
      return @ping_cache if defined?(@ping_cache)
      return {} if @host_provider.nil?

      @ping_cache = @host_provider.ping(hostname, port, protocol)
    end

    def resolve
      return @ip_cache if defined?(@ip_cache)
      @ip_cache = @host_provider.resolve(hostname) if !@host_provider.nil?
    end
  end

  class HostProvider
    attr_reader :inspec
    def initialize(inspec)
      @inspec = inspec
    end

    def missing_requirements(_protocol)
      # each provider can return an array of missing requirements that can
      # be enumerated in a skip_resource message
      []
    end
  end

  class UnixHostProvider < HostProvider
    def resolve_with_dig(hostname)
      addresses = []

      # look for IPv4 addresses
      cmd = inspec.command("dig +short A #{hostname}")
      cmd.stdout.lines.each do |line|
        matched = line.chomp.match(Resolv::IPv4::Regex)
        addresses << matched.to_s unless matched.nil?
      end

      # look for IPv6 addresses
      cmd = inspec.command("dig +short AAAA #{hostname}")
      cmd.stdout.lines.each do |line|
        matched = line.chomp.match(Resolv::IPv6::Regex)
        addresses << matched.to_s unless matched.nil?
      end

      addresses.empty? ? nil : addresses
    end

    def resolve_with_getent(hostname)
      cmd = inspec.command("getent ahosts #{hostname}")
      return nil unless cmd.exit_status.to_i.zero?

      # getent ahosts output is formatted like so:
      # $ getent ahosts www.google.com
      # 172.217.8.4     STREAM www.google.com
      # 172.217.8.4     DGRAM
      # 172.217.8.4     RAW
      # 2607:f8b0:4004:803::2004 STREAM
      # 2607:f8b0:4004:803::2004 DGRAM
      # 2607:f8b0:4004:803::2004 RAW
      addresses = []
      cmd.stdout.lines.each do |line|
        ip, = line.split(/\s+/, 2)
        next unless ip.match(Resolv::IPv4::Regex) || ip.match(Resolv::IPv6::Regex)
        addresses << ip unless addresses.include?(ip)
      end

      addresses
    end
  end

  class DarwinHostProvider < UnixHostProvider
    def missing_requirements(protocol)
      missing = []

      if protocol == 'tcp'
        missing << 'netcat must be installed' unless inspec.command('nc').exist?
      end

      missing
    end

    def ping(hostname, port, protocol)
      if protocol == 'tcp'
        resp = inspec.command("nc -vz -G 1 #{hostname} #{port}")
      else
        resp = inspec.command("ping -W 1 -c 1 #{hostname}")
      end

      {
        success: resp.exit_status.to_i.zero?,
        connection: resp.stderr,
        socket: resp.stdout,
      }
    end

    def resolve(hostname)
      resolve_with_dig(hostname)
    end
  end

  class LinuxHostProvider < UnixHostProvider
    def missing_requirements(protocol)
      missing = []

      if protocol == 'tcp' && (!inspec.command('nc').exist? && !inspec.command('ncat').exist?)
        missing << 'netcat must be installed'
      end

      missing
    end

    def ping(hostname, port, protocol)
      if protocol == 'tcp'
        resp = inspec.command(tcp_check_command(hostname, port))
      else
        # fall back to ping, but we can only test ICMP packages with ping
        resp = inspec.command("ping -w 1 -c 1 #{hostname}")
      end

      {
        success: resp.exit_status.to_i.zero?,
        connection: resp.stderr,
        socket: resp.stdout,
      }
    end

    def tcp_check_command(hostname, port)
      if inspec.command('nc').exist?
        base_cmd = 'nc'
      elsif inspec.command('ncat').exist?
        base_cmd = 'ncat'
      else
        return
      end

      "echo | #{base_cmd} -v -w 1 #{hostname} #{port}"
    end

    def resolve(hostname)
      resolve_with_getent(hostname)
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
      request = "Test-NetConnection -ComputerName #{hostname} -WarningAction SilentlyContinue"
      request += " -RemotePort #{port}" unless port.nil?
      request += '| Select-Object -Property ComputerName, TcpTestSucceeded, PingSucceeded | ConvertTo-Json'
      cmd = inspec.command(request)

      begin
        ping = JSON.parse(cmd.stdout)
      rescue JSON::ParserError => _e
        return {}
      end

      { success: port.nil? ? ping['PingSucceeded'] : ping['TcpTestSucceeded'] }
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
