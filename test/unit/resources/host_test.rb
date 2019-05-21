
require 'helper'

describe 'Inspec::Resources::Host' do

  it 'check host ping on ubuntu with dig' do
    resource = MockLoader.new(:ubuntu1404).load_resource('host', 'example.com')
    _(resource.resolvable?).must_equal true
    _(resource.reachable?).must_equal true
    _(resource.ipaddress).must_equal ["12.34.56.78", "2606:2800:220:1:248:1893:25c8:1946"]
    _(resource.to_s).must_equal 'Host example.com'
  end

  it 'check host ping on centos 7' do
    resource = MockLoader.new(:centos7).load_resource('host', 'example.com')
    _(resource.resolvable?).must_equal true
    _(resource.reachable?).must_equal true
    _(resource.ipaddress).must_equal ["12.34.56.78", "2606:2800:220:1:248:1893:25c8:1946"]
    _(resource.to_s).must_equal 'Host example.com'
  end

  it 'check host ping on darwin' do
    resource = MockLoader.new(:osx104).load_resource('host', 'example.com')
    _(resource.resolvable?).must_equal true
    _(resource.reachable?).must_equal true
    _(resource.ipaddress).must_equal ["12.34.56.78", "2606:2800:220:1:248:1893:25c8:1946"]
    _(resource.to_s).must_equal 'Host example.com'
  end

  it 'check host ping on windows' do
    resource = MockLoader.new(:windows).load_resource('host', 'microsoft.com')
    _(resource.resolvable?).must_equal true
    _(resource.reachable?).must_equal false
    _(resource.ipaddress).must_equal ['134.170.185.46', '134.170.188.221']
    _(resource.to_s).must_equal 'Host microsoft.com'
  end

  it 'check host ping on unsupported os' do
    resource = MockLoader.new(:undefined).load_resource('host', 'example.com')
    _(resource.resolvable?).must_equal false
    _(resource.reachable?).must_equal false
    _(resource.ipaddress).must_be_nil
    _(resource.to_s).must_equal 'Host example.com'
  end

  it 'check host tcp on ubuntu' do
    resource = MockLoader.new(:ubuntu1404).load_resource('host', 'example.com', port: 1234, protocol: 'tcp')
    _(resource.resolvable?).must_equal true
    _(resource.reachable?).must_equal true
    _(resource.ipaddress).must_equal ["12.34.56.78", "2606:2800:220:1:248:1893:25c8:1946"]
    _(resource.to_s).must_equal 'Host example.com port 1234 proto tcp'
  end

  it 'check host udp on ubuntu' do
    resource = MockLoader.new(:ubuntu1404).load_resource('host', 'example.com', port: 1234, protocol: 'udp')
    _(resource.resolvable?).must_equal true
    _(resource.reachable?).must_equal true
    _(resource.ipaddress).must_equal ["12.34.56.78", "2606:2800:220:1:248:1893:25c8:1946"]
    _(resource.to_s).must_equal 'Host example.com port 1234 proto udp'
  end

  it 'check host tcp on centos 7' do
    resource = MockLoader.new(:centos7).load_resource('host', 'example.com', port: 1234, protocol: 'tcp')
    _(resource.resolvable?).must_equal true
    _(resource.reachable?).must_equal true
    _(resource.ipaddress).must_equal ["12.34.56.78", "2606:2800:220:1:248:1893:25c8:1946"]
    _(resource.to_s).must_equal 'Host example.com port 1234 proto tcp'
  end

  it 'check host udp on centos 7' do
    resource = MockLoader.new(:centos7).load_resource('host', 'example.com', port: 1234, protocol: 'udp')
    _(resource.resolvable?).must_equal true
    _(resource.reachable?).must_equal true
    _(resource.ipaddress).must_equal ["12.34.56.78", "2606:2800:220:1:248:1893:25c8:1946"]
    _(resource.to_s).must_equal 'Host example.com port 1234 proto udp'
  end

  it 'check host tcp on darwin' do
    resource = MockLoader.new(:osx104).load_resource('host', 'example.com', port: 1234, protocol: 'tcp')
    _(resource.resolvable?).must_equal true
    _(resource.reachable?).must_equal true
    _(resource.ipaddress).must_equal ["12.34.56.78", "2606:2800:220:1:248:1893:25c8:1946"]
    _(resource.to_s).must_equal 'Host example.com port 1234 proto tcp'
  end

  it 'check host udp on darwin' do
    resource = MockLoader.new(:osx104).load_resource('host', 'example.com', port: 1234, protocol: 'udp')
    _(resource.resolvable?).must_equal true
    _(resource.reachable?).must_equal true
    _(resource.ipaddress).must_equal ["12.34.56.78", "2606:2800:220:1:248:1893:25c8:1946"]
    _(resource.to_s).must_equal 'Host example.com port 1234 proto udp'
  end

  it 'check host tcp on windows' do
    resource = MockLoader.new(:windows).load_resource('host', 'microsoft.com', port: 1234, protocol: 'tcp')
    _(resource.resolvable?).must_equal true
    _(resource.reachable?).must_equal true
    _(resource.ipaddress).must_equal ['134.170.185.46', '134.170.188.221']
    _(resource.to_s).must_equal 'Host microsoft.com port 1234 proto tcp'
  end

  it 'check host tcp on unsupported os' do
    resource = MockLoader.new(:undefined).load_resource('host', 'example.com', port: 1234, protocol: 'tcp')
    _(resource.resolvable?).must_equal false
    _(resource.reachable?).must_equal false
    _(resource.ipaddress).must_be_nil
    _(resource.to_s).must_equal 'Host example.com port 1234 proto tcp'
  end
end

describe Inspec::Resources::UnixHostProvider do
  let(:provider)        { Inspec::Resources::UnixHostProvider.new(inspec) }
  let(:inspec)          { mock('inspec-backend') }
  let(:nc_command)      { mock('nc-command') }
  let(:ncat_command)    { mock('ncat-command') }
  let(:timeout_command) { mock("timeout-command") }
  let(:strings_command) { mock("strings-command") }

  before do
    inspec.stubs(:command).with('nc').returns(nc_command)
    inspec.stubs(:command).with('ncat').returns(ncat_command)
    inspec.stubs(:command).with('timeout').returns(timeout_command)
    inspec.stubs(:command).with('gtimeout').returns(timeout_command)
    inspec.stubs(:command).with("strings `which bash` | grep -qE '/dev/(tcp|udp)/'").returns(strings_command)
  end

  describe '#resolve_with_dig' do
    let(:v4_command) { mock('v4_command') }
    let(:v6_command) { mock('v6_command') }

    before do
      strings_command.stubs(:exit_status).returns(0)
      nc_command.stubs(:exist?).returns(false)
      ncat_command.stubs(:exist?).returns(false)
    end

    it 'returns an array of IP addresses' do
      ipv4_command_output = <<-EOL
a.cname.goes.here
another.cname.cool
12.34.56.78
EOL
      ipv6_command_output = <<-EOL
a.cname.goes.here
another.cname.cool
2A03:2880:F112:83:FACE:B00C::25DE
EOL

      v4_command.stubs(:stdout).returns(ipv4_command_output)
      v6_command.stubs(:stdout).returns(ipv6_command_output)
      inspec.stubs(:command).with('dig +short AAAA testdomain.com').returns(v6_command)
      inspec.stubs(:command).with('dig +short A testdomain.com').returns(v4_command)
      provider.resolve_with_dig('testdomain.com').must_equal(['12.34.56.78', '2A03:2880:F112:83:FACE:B00C::25DE'])
    end

    it 'returns only v4 addresses if no v6 addresses are available' do
      ipv4_command_output = <<-EOL
a.cname.goes.here
another.cname.cool
12.34.56.78
EOL
      ipv6_command_output = <<-EOL
a.cname.goes.here
another.cname.cool
EOL

      v4_command.stubs(:stdout).returns(ipv4_command_output)
      v6_command.stubs(:stdout).returns(ipv6_command_output)
      inspec.stubs(:command).with('dig +short AAAA testdomain.com').returns(v6_command)
      inspec.stubs(:command).with('dig +short A testdomain.com').returns(v4_command)
      provider.resolve_with_dig('testdomain.com').must_equal(['12.34.56.78'])
    end

    it 'returns only v6 addresses if no v4 addresses are available' do
      ipv4_command_output = <<-EOL
a.cname.goes.here
another.cname.cool
EOL
      ipv6_command_output = <<-EOL
a.cname.goes.here
another.cname.cool
2A03:2880:F112:83:FACE:B00C::25DE
EOL

      v4_command.stubs(:stdout).returns(ipv4_command_output)
      v6_command.stubs(:stdout).returns(ipv6_command_output)
      inspec.stubs(:command).with('dig +short AAAA testdomain.com').returns(v6_command)
      inspec.stubs(:command).with('dig +short A testdomain.com').returns(v4_command)
      provider.resolve_with_dig('testdomain.com').must_equal(['2A03:2880:F112:83:FACE:B00C::25DE'])
    end

    it 'returns nil if no addresses are available' do
      ipv4_command_output = <<-EOL
a.cname.goes.here
another.cname.cool
EOL
      ipv6_command_output = <<-EOL
a.cname.goes.here
another.cname.cool
EOL

      v4_command.stubs(:stdout).returns(ipv4_command_output)
      v6_command.stubs(:stdout).returns(ipv6_command_output)
      inspec.stubs(:command).with('dig +short AAAA testdomain.com').returns(v6_command)
      inspec.stubs(:command).with('dig +short A testdomain.com').returns(v4_command)
      provider.resolve_with_dig('testdomain.com').must_be_nil
    end
  end

  describe '#resolve_with_getent' do
    before do
      strings_command.stubs(:exit_status).returns(0)
      nc_command.stubs(:exist?).returns(false)
      ncat_command.stubs(:exist?).returns(false)
    end

    it 'returns an array of IP addresses when successful' do
      command_output = "123.123.123.123 STREAM testdomain.com\n2607:f8b0:4004:805::200e     STREAM\n"
      command = mock('getent_command')
      command.stubs(:stdout).returns(command_output)
      command.stubs(:exit_status).returns(0)

      inspec.stubs(:command).with('getent ahosts testdomain.com').returns(command)

      provider.resolve_with_getent('testdomain.com').must_equal(['123.123.123.123', '2607:f8b0:4004:805::200e'])
    end

    it 'returns nil if command is not successful' do
      command = mock('getent_command')
      command.stubs(:exit_status).returns(1)

      inspec.stubs(:command).with('getent ahosts testdomain.com').returns(command)

      provider.resolve_with_getent('testdomain.com').must_be_nil
    end
  end


  describe "#ping" do
    let(:command_response) { mock('response') }

    before do
      strings_command.stubs(:exit_status).returns(0)
      ncat_command.stubs(:exist?).returns(false)

      command_response.stubs(:exit_status).returns('0')
      command_response.stubs(:stdout).returns('foo')
      command_response.stubs(:stderr).returns('bar')
    end

    it "calls netcat if available" do
      nc_command.stubs(:exist?).returns(true)
      inspec.expects(:command).with('echo | nc -v -w 1  example.com 1234').returns(command_response)

      provider.ping('example.com', '1234', 'tcp')
    end

    it "uses bash if netcat not available" do
      nc_command.stubs(:exist?).returns(false)
      inspec.expects(:command).with('timeout 1 bash -c "< /dev/tcp/example.com/1234"').returns(command_response)

      provider.ping('example.com', '1234', 'tcp')
    end

    it "uses bash if netcat not available on Darwin" do
      nc_command.stubs(:exist?).returns(false)
      inspec.expects(:command).with('gtimeout 1 bash -c "< /dev/tcp/example.com/1234"').returns(command_response)

      darwin_provider = Inspec::Resources::DarwinHostProvider.new(inspec)
      darwin_provider.ping('example.com', '1234', 'tcp')
    end
  end


  describe '#missing_requirements' do
    describe 'bash with net redirects and no netcat' do
      before do
        strings_command.stubs(:exit_status).returns(0)
        nc_command.stubs(:exist?).returns(false)
        ncat_command.stubs(:exist?).returns(false)
      end

      it "returns an empty array if timeout is available" do
        timeout_command.stubs(:exist?).returns(true)
        provider.missing_requirements('tcp').must_equal([])
      end

      it "returns a missing requirement when timeout is missing" do
        timeout_command.stubs(:exist?).returns(false)
        provider.missing_requirements('tcp').must_equal(['timeout (part of coreutils) or netcat must be installed'])
      end
    end

    describe 'bash without net redirects' do
      before do
        strings_command.stubs(:exit_status).returns(1)
      end

      it "returns an empty array if nc is installed but ncat is not installed" do
        nc_command.stubs(:exist?).returns(true)
        ncat_command.stubs(:exist?).returns(false)
        provider.missing_requirements('tcp').must_equal([])
      end

      it "returns an empty array if nc is not installed but ncat is installed" do
        nc_command.stubs(:exist?).returns(false)
        ncat_command.stubs(:exist?).returns(true)
        provider.missing_requirements('tcp').must_equal([])
      end

      it "returns an empty array if both nc and ncat are installed" do
        nc_command.stubs(:exist?).returns(true)
        ncat_command.stubs(:exist?).returns(true)
        provider.missing_requirements('tcp').must_equal([])
      end

      it "returns a missing requirement when neither nc nor ncat are installed" do
        nc_command.stubs(:exist?).returns(false)
        ncat_command.stubs(:exist?).returns(false)
        provider.missing_requirements('tcp').must_equal(['netcat must be installed'])
      end
    end
  end

  describe '#netcat_check_command' do
    before do
      strings_command.stubs(:exit_status).returns(1)
    end

    it 'returns an nc command when nc exists tcp' do
      nc_command.expects(:exist?).returns(true)
      ncat_command.expects(:exist?).returns(false)
      provider.netcat_check_command('foo', 1234, 'tcp').must_equal 'echo | nc -v -w 1  foo 1234'
    end

    it 'returns an nc command when nc exists udp' do
      nc_command.expects(:exist?).returns(true)
      ncat_command.expects(:exist?).returns(false)
      provider.netcat_check_command('foo', 1234, 'udp').must_equal 'echo | nc -v -w 1 -u foo 1234'
    end

    it 'returns an ncat command when nc does not exist but ncat exists tcp' do
      nc_command.expects(:exist?).returns(false)
      ncat_command.expects(:exist?).returns(true)
      provider.netcat_check_command('foo', 1234, 'tcp').must_equal 'echo | ncat -v -w 1  foo 1234'
    end

    it 'returns an ncat command when nc does not exist but ncat exists udp' do
      nc_command.expects(:exist?).returns(false)
      ncat_command.expects(:exist?).returns(true)
      provider.netcat_check_command('foo', 1234, 'udp').must_equal 'echo | ncat -v -w 1 -u foo 1234'
    end

    it 'returns nil if neither nc or ncat exist' do
      nc_command.expects(:exist?).returns(false)
      ncat_command.expects(:exist?).returns(false)
      provider.netcat_check_command('foo', 1234, 'tcp').must_be_nil
    end
  end
end
