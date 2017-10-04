# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'inspec/resource'

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

  it 'check host tcp on centos 7' do
    resource = MockLoader.new(:centos7).load_resource('host', 'example.com', port: 1234, protocol: 'tcp')
    _(resource.resolvable?).must_equal true
    _(resource.reachable?).must_equal true
    _(resource.ipaddress).must_equal ["12.34.56.78", "2606:2800:220:1:248:1893:25c8:1946"]
    _(resource.to_s).must_equal 'Host example.com port 1234 proto tcp'
  end

  it 'check host tcp on darwin' do
    resource = MockLoader.new(:osx104).load_resource('host', 'example.com', port: 1234, protocol: 'tcp')
    _(resource.resolvable?).must_equal true
    _(resource.reachable?).must_equal true
    _(resource.ipaddress).must_equal ["12.34.56.78", "2606:2800:220:1:248:1893:25c8:1946"]
    _(resource.to_s).must_equal 'Host example.com port 1234 proto tcp'
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
  describe '#resolve_with_dig' do
    let(:provider) { Inspec::Resources::UnixHostProvider.new(inspec) }
    let(:inspec)   { mock('inspec-backend') }
    let(:v4_command) { mock('v4_command') }
    let(:v6_command) { mock('v6_command') }

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
    it 'returns an array of IP addresses when successful' do
      command_output = "123.123.123.123 STREAM testdomain.com\n2607:f8b0:4004:805::200e     STREAM\n"
      command = mock('getent_command')
      command.stubs(:stdout).returns(command_output)
      command.stubs(:exit_status).returns(0)

      inspec = mock('inspec')
      inspec.stubs(:command).with('getent ahosts testdomain.com').returns(command)

      provider = Inspec::Resources::UnixHostProvider.new(inspec)
      provider.resolve_with_getent('testdomain.com').must_equal(['123.123.123.123', '2607:f8b0:4004:805::200e'])
    end

    it 'returns nil if command is not successful' do
      command = mock('getent_command')
      command.stubs(:exit_status).returns(1)

      inspec = mock('inspec')
      inspec.stubs(:command).with('getent ahosts testdomain.com').returns(command)

      provider = Inspec::Resources::UnixHostProvider.new(inspec)
      provider.resolve_with_getent('testdomain.com').must_be_nil
    end
  end
end

describe Inspec::Resources::LinuxHostProvider do
  let(:provider)     { Inspec::Resources::LinuxHostProvider.new(inspec) }
  let(:inspec)       { mock('inspec-backend') }
  let(:nc_command)   { mock('nc-command') }
  let(:ncat_command) { mock('ncat-command') }

  before do
    provider.stubs(:inspec).returns(inspec)
  end

  describe '#missing_requirements' do
    it "returns an empty array if nc is installed but ncat is not installed" do
      inspec.stubs(:command).with('nc').returns(nc_command)
      nc_command.stubs(:exist?).returns(true)
      inspec.stubs(:command).with('ncat').returns(ncat_command)
      ncat_command.stubs(:exist?).returns(false)

      provider.missing_requirements('tcp').must_equal([])
    end

    it "returns an empty array if nc is not installed but ncat is installed" do
      inspec.stubs(:command).with('nc').returns(nc_command)
      nc_command.stubs(:exist?).returns(false)
      inspec.stubs(:command).with('ncat').returns(ncat_command)
      ncat_command.stubs(:exist?).returns(true)

      provider.missing_requirements('tcp').must_equal([])
    end

    it "returns an empty array if both nc and ncat are installed" do
      inspec.stubs(:command).with('nc').returns(nc_command)
      nc_command.stubs(:exist?).returns(true)
      inspec.stubs(:command).with('ncat').returns(ncat_command)
      ncat_command.stubs(:exist?).returns(true)

      provider.missing_requirements('tcp').must_equal([])
    end

    it "returns a missing requirement when neither nc nor ncat are installed" do
      inspec.stubs(:command).with('nc').returns(nc_command)
      nc_command.stubs(:exist?).returns(false)
      inspec.stubs(:command).with('ncat').returns(ncat_command)
      ncat_command.stubs(:exist?).returns(false)

      provider.missing_requirements('tcp').must_equal(['netcat must be installed'])
    end
  end

  describe '#tcp_check_command' do
    it 'returns an nc command when nc exists' do
      inspec.expects(:command).with('nc').returns(nc_command)
      nc_command.expects(:exist?).returns(true)
      provider.tcp_check_command('foo', 1234).must_equal 'echo | nc -v -w 1 foo 1234'
    end

    it 'returns an ncat command when nc does not exist but ncat exists' do
      inspec.expects(:command).with('nc').returns(nc_command)
      inspec.expects(:command).with('ncat').returns(ncat_command)
      nc_command.expects(:exist?).returns(false)
      ncat_command.expects(:exist?).returns(true)
      provider.tcp_check_command('foo', 1234).must_equal 'echo | ncat -v -w 1 foo 1234'
    end

    it 'returns nil if neither nc or ncat exist' do
      inspec.expects(:command).with('nc').returns(nc_command)
      inspec.expects(:command).with('ncat').returns(ncat_command)
      nc_command.expects(:exist?).returns(false)
      ncat_command.expects(:exist?).returns(false)
      provider.tcp_check_command('foo', 1234).must_be_nil
    end
  end
end
