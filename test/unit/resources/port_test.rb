
require 'helper'
require 'inspec/resource'
require 'inspec/resources/port'

describe 'Inspec::Resources::Port' do
  it 'verify port on Ubuntu 14.04' do
    resource = MockLoader.new(:ubuntu1404).load_resource('port', 22)
    _(resource.listening?).must_equal true
    _(resource.protocols).must_equal %w{ tcp tcp6 }
    _(resource.pids).must_equal [1222]
    _(resource.processes).must_equal ['sshd']
    _(resource.addresses).must_equal ["0.0.0.0", "::"]
  end

  it 'lists all ports' do
    resource = MockLoader.new(:ubuntu1404).load_resource('port')
    _(resource.entries.length).must_equal 9
    _(resource.listening?).must_equal true
    _(resource.protocols).must_equal %w{ udp tcp tcp6 }
    _(resource.pids).must_equal [1146, 1222, 1722, 579]
    _(resource.processes).must_equal ['dhclient', 'sshd', 'java', 'nginx', 'sendmail']
    _(resource.addresses).must_equal ['0.0.0.0', '10.0.2.15', 'fe80::a00:27ff:fe32:ed09', '::']
  end

  it 'filter ports by conditions' do
    resource = MockLoader.new(:ubuntu1404).load_resource('port').where { protocol =~ /udp/i }
    _(resource.entries.length).must_equal 1
    _(resource.listening?).must_equal true
    _(resource.protocols).must_equal ['udp']
    _(resource.pids).must_equal [1146]
    _(resource.processes).must_equal ['dhclient']
    _(resource.addresses).must_equal ['0.0.0.0']
  end

  it 'verify UDP port on Ubuntu 14.04' do
    resource = MockLoader.new(:ubuntu1404).load_resource('port', 68)
    _(resource.entries.length).must_equal 1
    _(resource.listening?).must_equal true
    _(resource.protocols).must_equal ['udp']
    _(resource.pids).must_equal [1146]
    _(resource.processes).must_equal ['dhclient']
    _(resource.addresses).must_equal ['0.0.0.0']
  end

  it 'accepts the port as a string' do
    resource = MockLoader.new(:ubuntu1404).load_resource('port', '68')
    _(resource.entries.length).must_equal 1
    _(resource.listening?).must_equal true
    _(resource.protocols).must_equal ['udp']
    _(resource.pids).must_equal [1146]
    _(resource.processes).must_equal ['dhclient']
    _(resource.addresses).must_equal ['0.0.0.0']
  end

  it 'properly handles multiple processes using one fd' do
    resource = MockLoader.new(:ubuntu1404).load_resource('port', '80')
    _(resource.entries.length).must_equal 1
    _(resource.listening?).must_equal true
    _(resource.protocols).must_equal ['tcp']
    _(resource.pids).must_equal [579]
    _(resource.processes).must_equal ['nginx']
    _(resource.addresses).must_equal ['0.0.0.0']
  end

  it 'properly handles a IPv4 address in a v6 listing' do
    resource = MockLoader.new(:ubuntu1404).load_resource('port', 9200)
    _(resource.protocols).must_equal %w{ tcp tcp6 }
    _(resource.addresses).must_equal ['10.0.2.15', 'fe80::a00:27ff:fe32:ed09']
  end

  it 'verify port on Alpine Linux without iproute2 installed' do
    resource = MockLoader.new(:alpine).load_resource('port', 22)
    _(resource.listening?).must_equal true
    _(resource.protocols).must_equal %w{ tcp tcp6 }
    _(resource.pids).must_equal [1]
    _(resource.processes).must_equal ['sshd']
    _(resource.addresses).must_equal ["0.0.0.0", "::"]
  end

  it 'verify port on MacOs x' do
    resource = MockLoader.new(:osx104).load_resource('port', 2022)
    _(resource.listening?).must_equal true
    _(resource.pids).must_equal [6835]
    _(resource.protocols).must_equal ['tcp']
    _(resource.processes).must_equal ['VBoxHeadl']
    _(resource.addresses).must_equal ["127.0.0.1"]
  end

  it 'verify port on Windows 2012r2' do
    resource = MockLoader.new(:windows).load_resource('port', 135)
    _(resource.listening?).must_equal true
    _(resource.pids).must_equal [564]
    _(resource.protocols).must_equal ['tcp']
    _(resource.processes).must_equal ['RpcSs']
    _(resource.addresses).must_equal ['0.0.0.0', '::']
  end

  it 'verify SSL port on Windows 2012r2' do
    resource = MockLoader.new(:windows).load_resource('port', 443)
    _(resource.listening?).must_equal true
    _(resource.pids).must_equal [4]
    _(resource.protocols).must_equal ['tcp']
    _(resource.processes).must_equal ['System']
    _(resource.addresses).must_equal ['0.0.0.0', '::']
  end

  it 'verify syslog port on Windows 2012r2' do
    resource = MockLoader.new(:windows).load_resource('port', 514)
    _(resource.listening?).must_equal true
    _(resource.pids).must_equal [1120]
    _(resource.protocols).must_equal ['udp']
    _(resource.processes).must_equal ['Syslogd_Service.exe']
    _(resource.addresses).must_equal ['0.0.0.0']
  end

  it 'verify not listening port on Windows' do
    resource = MockLoader.new(:windows).load_resource('port', 666)
    _(resource.listening?).must_equal false
    _(resource.addresses).must_equal []
    _(resource.protocols).must_equal []
    _(resource.processes).must_equal []
    _(resource.addresses).must_equal []
  end

  it 'verify all ports on Windows 2012r2' do
    resource = MockLoader.new(:windows).load_resource('port')
    resource.entries.length.must_equal 49
    resource.protocols('tcp').entries.length.must_equal 34
    resource.protocols('udp').entries.length.must_equal 15
  end

  it 'verify port on Windows 2008 (unpriviledged)' do
    ml = MockLoader.new(:windows)
    # kill windows 2012 shell commands
    ml.backend.backend.commands
      .select { |k, _| k.start_with? 'Get-NetTCPConnection' }
      .values.each { |r| r.stdout = '' }

    resource = ml.load_resource('port', 135)
    _(resource.listening?).must_equal true
    _(resource.pids).must_equal [564]
    _(resource.protocols).must_equal ['tcp']
    _(resource.processes).must_equal ['RpcSs']
    _(resource.addresses).must_equal %w{0.0.0.0 ::}
  end

  it 'verify port list on Windows 2008 (unpriviledged)' do
    ml = MockLoader.new(:windows)
    # kill windows 2012 shell commands
    ml.backend.backend.commands
      .select { |k, _| k.start_with? 'Get-NetTCPConnection' }
      .values.each { |r| r.stdout = '' }

    resource = ml.load_resource('port')
    resource.entries.length.must_equal 49
    resource.protocols('tcp').entries.length.must_equal 34
    resource.protocols('udp').entries.length.must_equal 15
  end

  it 'verify port on FreeBSD' do
    resource = MockLoader.new(:freebsd10).load_resource('port', 22)
    _(resource.listening?).must_equal true
    _(resource.protocols).must_equal %w{ tcp6 tcp }
    _(resource.pids).must_equal [668]
    _(resource.processes).must_equal ['sshd']
    _(resource.addresses).must_equal ["0:0:0:0:0:0:0:0", "0.0.0.0"]
  end

  it 'verify port on wrlinux' do
    resource = MockLoader.new(:wrlinux).load_resource('port', 22)
    _(resource.listening?).must_equal true
    _(resource.pids).must_equal [1222]
    _(resource.protocols).must_equal %w{ tcp tcp6 }
    _(resource.processes).must_equal ['sshd']
    _(resource.addresses).must_equal ["0.0.0.0", "::"]
  end

  it 'verify running on undefined' do
    resource = MockLoader.new(:undefined).load_resource('port', 22)
    _(resource.listening?).must_equal false
    _(resource.protocols).must_equal []
    _(resource.pids).must_equal []
    _(resource.processes).must_equal []
    _(resource.addresses).must_equal []
  end

  it 'verify port and interface on Ubuntu 14.04' do
    resource = MockLoader.new(:ubuntu1404).load_resource('port', '0.0.0.0', 22)
    _(resource.listening?).must_equal true
    _(resource.protocols).must_equal %w{ tcp }
    _(resource.pids).must_equal [1222]
    _(resource.processes).must_equal ['sshd']
    _(resource.addresses).must_equal ["0.0.0.0"]
  end

  it 'verify not listening port on interface on Ubuntu 14.04' do
    resource = MockLoader.new(:ubuntu1404).load_resource('port', '127.0.0.1', 22)
    _(resource.listening?).must_equal false
    _(resource.addresses).must_equal []
  end

  it 'verify port on Solaris 10' do
    resource = MockLoader.new(:solaris10).load_resource('port', 22)
    _(resource.listening?).must_equal true
    _(resource.addresses).must_equal ["0.0.0.0"]
  end

  it 'verify port on Solaris 11' do
    resource = MockLoader.new(:solaris11).load_resource('port', 22)
    _(resource.listening?).must_equal true
    _(resource.addresses).must_equal ["0.0.0.0"]
  end

  it 'verify port on hpux' do
    resource = MockLoader.new(:hpux).load_resource('port', 22)
    _(resource.listening?).must_equal true
    _(resource.protocols).must_equal %w{ tcp tcp6 }
    _(resource.addresses).must_equal ["0.0.0.0", "0:0:0:0:0:0:0:0" ]
  end

  it 'verify not listening port on hpux' do
    resource = MockLoader.new(:hpux).load_resource('port', 23)
    _(resource.listening?).must_equal false
    _(resource.protocols).must_equal []
    _(resource.addresses).must_equal []
  end

  it 'verify port on aix' do
    resource = MockLoader.new(:aix).load_resource('port', 22)
    _(resource.listening?).must_equal true
    _(resource.protocols).must_equal %w{ tcp tcp6 }
    _(resource.addresses).must_equal ["0.0.0.0", "::"]
  end

  it 'verify not listening port on aix' do
    resource = MockLoader.new(:aix).load_resource('port', 23)
    _(resource.listening?).must_equal false
    _(resource.protocols).must_equal []
    _(resource.addresses).must_equal []
  end
end
