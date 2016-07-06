# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'inspec/resource'
require 'hashie'

describe 'Inspec::Resources::Service' do
  let(:runlevels) { {0=>false, 1=>false, 2=>true, 3=>true, 4=>true, 5=>true, 6=>false} }

  # windows
  it 'verify service parsing' do
    resource = MockLoader.new(:windows).load_resource('service', 'dhcp')
    params = Hashie::Mash.new({})
    _(resource.type).must_equal 'windows'
    _(resource.name).must_equal 'dhcp'
    _(resource.description).must_equal 'DHCP Client'
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.params).must_equal params
  end

  # ubuntu 14.04 with upstart
  it 'verify ubuntu package parsing' do
    resource = MockLoader.new(:ubuntu1404).load_resource('service', 'ssh')
    params = Hashie::Mash.new({})
    _(resource.type).must_equal 'upstart'
    _(resource.name).must_equal 'ssh'
    _(resource.description).must_equal nil
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.params).must_equal params
  end

  it 'verify ubuntu package parsing with default upstart_service' do
    resource = MockLoader.new(:ubuntu1404).load_resource('upstart_service', 'ssh')
    params = Hashie::Mash.new({})
    _(resource.type).must_equal 'upstart'
    _(resource.name).must_equal 'ssh'
    _(resource.description).must_equal nil
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.params).must_equal params
    _(resource.params.UnitFileState).must_equal nil
  end

  # ubuntu 15.04 with systemd
  it 'verify ubuntu package parsing' do
    resource = MockLoader.new(:ubuntu1504).load_resource('service', 'sshd')
    params = Hashie::Mash.new({ 'ActiveState' => 'active', 'Description' => 'OpenSSH server daemon', 'Id' => 'sshd.service', 'LoadState' => 'loaded', 'Names' => 'sshd.service', 'SubState' => 'running', 'UnitFileState' => 'enabled' })
    _(resource.type).must_equal 'systemd'
    _(resource.name).must_equal 'sshd.service'
    _(resource.description).must_equal 'OpenSSH server daemon'
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.params).must_equal params
    _(resource.params.SubState).must_equal 'running'
  end

  it 'verify ubuntu package parsing with default systemd_service' do
    resource = MockLoader.new(:ubuntu1504).load_resource('systemd_service', 'sshd')
    params = Hashie::Mash.new({ 'ActiveState' => 'active', 'Description' => 'OpenSSH server daemon', 'Id' => 'sshd.service', 'LoadState' => 'loaded', 'Names' => 'sshd.service', 'SubState' => 'running', 'UnitFileState' => 'enabled' })
    _(resource.type).must_equal 'systemd'
    _(resource.name).must_equal 'sshd.service'
    _(resource.description).must_equal 'OpenSSH server daemon'
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.params).must_equal params
  end

  # centos 6 with sysv
  it 'verify centos 6 package parsing' do
    resource = MockLoader.new(:centos6).load_resource('service', 'sshd')
    params = Hashie::Mash.new({})
    _(resource.type).must_equal 'sysv'
    _(resource.name).must_equal 'sshd'
    _(resource.description).must_equal nil
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.params).must_equal params
    _(resource.params.SubState).must_equal nil
  end

  it 'verify centos 6 package parsing with default sysv_service' do
    resource = MockLoader.new(:centos6).load_resource('sysv_service', 'sshd')
    params = Hashie::Mash.new({})
    _(resource.type).must_equal 'sysv'
    _(resource.name).must_equal 'sshd'
    _(resource.description).must_equal nil
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.params).must_equal params
  end

  # centos 7 with systemd
  it 'verify centos 7 package parsing' do
    resource = MockLoader.new(:centos7).load_resource('service', 'sshd')
    params = Hashie::Mash.new({ 'ActiveState' => 'active', 'Description' => 'OpenSSH server daemon', 'Id' => 'sshd.service', 'LoadState' => 'loaded', 'Names' => 'sshd.service', 'SubState' => 'running', 'UnitFileState' => 'enabled' })
    _(resource.type).must_equal 'systemd'
    _(resource.name).must_equal 'sshd.service'
    _(resource.description).must_equal 'OpenSSH server daemon'
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.params).must_equal params
  end

  it 'verify centos 7 package parsing with systemd_service and service_ctl override' do
    resource = MockLoader.new(:centos7).load_resource('systemd_service', 'sshd', '/path/to/systemctl')
    params = Hashie::Mash.new({ 'ActiveState' => 'active', 'Description' => 'OpenSSH server daemon', 'Id' => 'sshd.service', 'LoadState' => 'loaded', 'Names' => 'sshd.service', 'UnitFileState' => 'enabled', 'SubState' => 'running' })
    _(resource.type).must_equal 'systemd'
    _(resource.name).must_equal 'sshd.service'
    _(resource.description).must_equal 'OpenSSH server daemon'
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.params).must_equal params
  end

  it 'verify centos 7 package parsing with static loaded service' do
    resource = MockLoader.new(:centos7).load_resource('service', 'dbus')
    params = Hashie::Mash.new({ 'Description' => 'D-Bus System Message Bus', 'Id' => 'dbus.service', 'LoadState' => 'loaded', 'Names' => 'messagebus.service dbus.service', 'SubState' => 'running', 'UnitFileState' => 'static' })
    _(resource.type).must_equal 'systemd'
    _(resource.name).must_equal 'dbus.service'
    _(resource.description).must_equal 'D-Bus System Message Bus'
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.params).must_equal params
    _(resource.params.UnitFileState).must_equal 'static'
  end

  # freebsd
  it 'verify freebsd10 package parsing' do
    resource = MockLoader.new(:freebsd10).load_resource('service', 'sendmail')
    params = Hashie::Mash.new({})
    _(resource.type).must_equal 'bsd-init'
    _(resource.name).must_equal 'sendmail'
    _(resource.description).must_equal nil
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.params).must_equal params
  end

  it 'verify freebsd10 package parsing with default bsd_service' do
    resource = MockLoader.new(:freebsd10).load_resource('bsd_service', 'sendmail')
    params = Hashie::Mash.new({})
    _(resource.type).must_equal 'bsd-init'
    _(resource.name).must_equal 'sendmail'
    _(resource.description).must_equal nil
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.params).must_equal params
  end

  # arch linux with systemd
  it 'verify arch linux package parsing' do
    resource = MockLoader.new(:arch).load_resource('service', 'sshd')
    params = Hashie::Mash.new({ 'ActiveState' => 'active', 'Description' => 'OpenSSH server daemon', 'Id' => 'sshd.service', 'LoadState' => 'loaded', 'Names' => 'sshd.service', 'SubState' => 'running', 'UnitFileState' => 'enabled' })
    _(resource.type).must_equal 'systemd'
    _(resource.name).must_equal 'sshd.service'
    _(resource.description).must_equal 'OpenSSH server daemon'
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.params).must_equal params
  end

  # debian 7 with systemv
  it 'verify debian 7 package parsing' do
    resource = MockLoader.new(:debian7).load_resource('service', 'sshd')
    params = Hashie::Mash.new({})
    _(resource.type).must_equal 'sysv'
    _(resource.name).must_equal 'sshd'
    _(resource.description).must_equal nil
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.params).must_equal params
  end

  # debian 8 with systemd
  it 'verify debian 8 package parsing' do
    resource = MockLoader.new(:debian8).load_resource('service', 'sshd')
    params = Hashie::Mash.new({ 'ActiveState' => 'active', 'Description' => 'OpenSSH server daemon', 'Id' => 'sshd.service', 'LoadState' => 'loaded', 'Names' => 'sshd.service', 'SubState' => 'running', 'UnitFileState' => 'enabled' })
    _(resource.type).must_equal 'systemd'
    _(resource.name).must_equal 'sshd.service'
    _(resource.description).must_equal 'OpenSSH server daemon'
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.params).must_equal params
  end

  # macos test
  it 'verify mac osx package parsing' do
    resource = MockLoader.new(:osx104).load_resource('service', 'ssh')
    params = Hashie::Mash.new({})
    _(resource.type).must_equal 'darwin'
    _(resource.name).must_equal 'org.openbsd.ssh-agent'
    _(resource.description).must_equal nil
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.params).must_equal params
  end

  it 'verify mac osx package parsing with not-running service' do
    resource = MockLoader.new(:osx104).load_resource('service', 'FilesystemUI')
    params = Hashie::Mash.new({})
    _(resource.type).must_equal 'darwin'
    _(resource.name).must_equal 'com.apple.FilesystemUI'
    _(resource.description).must_equal nil
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal false
    _(resource.params).must_equal params
  end

  it 'verify mac osx package parsing with default launchd_service' do
    resource = MockLoader.new(:osx104).load_resource('launchd_service', 'ssh')
    params = Hashie::Mash.new({})
    _(resource.type).must_equal 'darwin'
    _(resource.name).must_equal 'org.openbsd.ssh-agent'
    _(resource.description).must_equal nil
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.params).must_equal params
  end

  # wrlinux
  it 'verify wrlinux package parsing' do
    resource = MockLoader.new(:wrlinux).load_resource('service', 'sshd')
    params = Hashie::Mash.new({})
    _(resource.type).must_equal 'sysv'
    _(resource.name).must_equal 'sshd'
    _(resource.description).must_equal nil
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.params).must_equal params
  end


  # unknown OS
  it 'verify package handling on unsupported os' do
    resource = MockLoader.new(:undefined).load_resource('service', 'dhcp')
    params = Hashie::Mash.new({})
    _(resource.installed?).must_equal false
    _(resource.description).must_equal nil
    _(resource.params).must_equal params
  end

  # runlevel detection
  describe 'runlevels on centos 6 (system V)' do
    let(:service) { MockLoader.new(:centos6).load_resource('service', 'sshd') }

    it 'grabs all runlevels' do
      service.runlevels.keys.must_equal [0, 1, 2, 3, 4, 5, 6]
    end

    it 'grabs runlevels via filter nil' do
      service.runlevels(nil).keys.must_equal [0, 1, 2, 3, 4, 5, 6]
    end

    it 'grabs runlevels by number' do
      service.runlevels(3).keys.must_equal [3]
    end

    it 'grabs runlevels by multiple numbers' do
      service.runlevels(3, 4, 8).keys.must_equal [3, 4]
    end

    it 'grabs runlevels via regex' do
      service.runlevels(/[5-9]/).keys.must_equal [5, 6]
    end

    it 'checks enabled true if all services are enabled' do
      service.runlevels(2, 4).enabled?.must_equal true
    end

    it 'checks enabled false if some services are not enabled' do
      service.runlevels(1, 4).enabled?.must_equal false
    end

    it 'checks disabled true if all services are disabled' do
      service.runlevels(0, 1).disabled?.must_equal true
    end

    it 'checks disabled false if some services are not disabled' do
      service.runlevels(0, 4).enabled?.must_equal false
    end
  end
end
