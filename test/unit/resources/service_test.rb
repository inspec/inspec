# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::Service' do
  let(:runlevels) { {0=>false, 1=>false, 2=>true, 3=>true, 4=>true, 5=>true, 6=>false} }

  # windows
  it 'verify service parsing' do
    resource = MockLoader.new(:windows).load_resource('service', 'dhcp')
    srv = { name: 'dhcp', description: 'DHCP Client', installed: true, running: true, enabled: true, type: 'windows' }
    _(resource.info).must_equal srv
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
  end

  # ubuntu 14.04 with upstart
  it 'verify ubuntu package parsing' do
    resource = MockLoader.new(:ubuntu1404).load_resource('service', 'ssh')
    srv = { name: 'ssh', description: nil, installed: true, running: true, enabled: true, type: 'upstart' }
    _(resource.info).must_equal srv
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
  end

  it 'verify ubuntu package parsing with default upstart_service' do
    resource = MockLoader.new(:ubuntu1404).load_resource('upstart_service', 'ssh')
    srv = { name: 'ssh', description: nil, installed: true, running: true, enabled: true, type: 'upstart' }
    _(resource.info).must_equal srv
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
  end

  # ubuntu 15.04 with systemd
  it 'verify ubuntu package parsing' do
    resource = MockLoader.new(:ubuntu1504).load_resource('service', 'sshd')
    srv = { name: 'sshd.service', description: 'OpenSSH server daemon', installed: true, running: true, enabled: true, type: 'systemd' }
    _(resource.info).must_equal srv
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
  end

  it 'verify ubuntu package parsing with default systemd_service' do
    resource = MockLoader.new(:ubuntu1504).load_resource('systemd_service', 'sshd')
    srv = { name: 'sshd.service', description: 'OpenSSH server daemon', installed: true, running: true, enabled: true, type: 'systemd' }
    _(resource.info).must_equal srv
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
  end

  # centos 6 with sysv
  it 'verify centos 6 package parsing' do
    resource = MockLoader.new(:centos6).load_resource('service', 'sshd')
    srv = { name: 'sshd', description: nil, installed: true, running: true, enabled: true, runlevels: runlevels, type: 'sysv' }
    _(resource.info).must_equal srv
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
  end

  it 'verify centos 6 package parsing with default sysv_service' do
    resource = MockLoader.new(:centos6).load_resource('sysv_service', 'sshd')
    srv = { name: 'sshd', description: nil, installed: true, running: true, enabled: true, runlevels: runlevels, type: 'sysv' }
    _(resource.info).must_equal srv
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
  end

  # centos 7 with systemd
  it 'verify centos 7 package parsing' do
    resource = MockLoader.new(:centos7).load_resource('service', 'sshd')
    srv = { name: 'sshd.service', description: 'OpenSSH server daemon', installed: true, running: true, enabled: true, type: 'systemd' }
    _(resource.info).must_equal srv
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
  end

  it 'verify centos 7 package parsing with systemd_service and service_ctl override' do
    resource = MockLoader.new(:centos7).load_resource('systemd_service', 'sshd', '/path/to/systemctl')
    srv = { name: 'sshd.service', description: 'OpenSSH server daemon', installed: true, running: true, enabled: true, type: 'systemd' }
    _(resource.info).must_equal srv
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
  end

  it 'verify centos 7 package parsing with static loaded service' do
    resource = MockLoader.new(:centos7).load_resource('service', 'dbus')
    srv = { name: 'dbus.service', description: 'D-Bus System Message Bus', installed: true, running: true, enabled: true, type: 'systemd' }
    _(resource.info).must_equal srv
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
  end

  # freebsd
  it 'verify freebsd10 package parsing' do
    resource = MockLoader.new(:freebsd10).load_resource('service', 'sendmail')
    srv = { name: 'sendmail', description: nil, installed: true, running: true, enabled: true, type: 'bsd-init' }
    _(resource.info).must_equal srv
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
  end

  it 'verify freebsd10 package parsing with default bsd_service' do
    resource = MockLoader.new(:freebsd10).load_resource('bsd_service', 'sendmail')
    srv = { name: 'sendmail', description: nil, installed: true, running: true, enabled: true, type: 'bsd-init' }
    _(resource.info).must_equal srv
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
  end

  # arch linux with systemd
  it 'verify arch linux package parsing' do
    resource = MockLoader.new(:arch).load_resource('service', 'sshd')
    srv = { name: 'sshd.service', description: 'OpenSSH server daemon', installed: true, running: true, enabled: true, type: 'systemd' }
    _(resource.info).must_equal srv
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
  end

  # debian 7 with systemv
  it 'verify debian 7 package parsing' do
    resource = MockLoader.new(:debian7).load_resource('service', 'sshd')
    srv = { name: 'sshd', description: nil, installed: true, running: true, enabled: true, runlevels: runlevels, type: 'sysv' }
    _(resource.info).must_equal srv
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
  end

  # debian 8 with systemd
  it 'verify debian 8 package parsing' do
    resource = MockLoader.new(:debian8).load_resource('service', 'sshd')
    srv = { name: 'sshd.service', description: 'OpenSSH server daemon', installed: true, running: true, enabled: true, type: 'systemd' }
    _(resource.info).must_equal srv
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
  end

  # macos test
  it 'verify mac osx package parsing' do
    resource = MockLoader.new(:osx104).load_resource('service', 'ssh')
    srv = { name: 'org.openbsd.ssh-agent', description: nil, installed: true, running: true, enabled: true, type: 'darwin' }
    _(resource.info).must_equal srv
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
  end

  it 'verify mac osx package parsing with not-running service' do
    resource = MockLoader.new(:osx104).load_resource('service', 'FilesystemUI')
    srv = { name: 'com.apple.FilesystemUI', description: nil, installed: true, running: false, enabled: true, type: 'darwin' }
    _(resource.info).must_equal srv
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal false
  end

  it 'verify mac osx package parsing with default launchd_service' do
    resource = MockLoader.new(:osx104).load_resource('launchd_service', 'ssh')
    srv = { name: 'org.openbsd.ssh-agent', description: nil, installed: true, running: true, enabled: true, type: 'darwin' }
    _(resource.info).must_equal srv
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
  end

  # wrlinux
  it 'verify wrlinux package parsing' do
    resource = MockLoader.new(:wrlinux).load_resource('service', 'sshd')
    srv = { name: 'sshd', description: nil, installed: true, running: true, enabled: true, runlevels: runlevels, type: 'sysv' }
    _(resource.info).must_equal srv
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
  end


  # unknown OS
  it 'verify package handling on unsupported os' do
    resource = MockLoader.new(:undefined).load_resource('service', 'dhcp')
    _(resource.installed?).must_equal false
    _(resource.info).must_equal nil
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
