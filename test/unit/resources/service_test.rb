# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::Service' do

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

  # ubuntu 15.04 with systemd
  it 'verify ubuntu package parsing' do
    resource = MockLoader.new(:ubuntu1504).load_resource('service', 'sshd')
    srv = { name: 'sshd.service', description: 'OpenSSH server daemon', installed: true, running: true, enabled: true, type: 'systemd' }
    _(resource.info).must_equal srv
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
  end

  # centos 6 with systemv
  it 'verify centos 6 package parsing' do
    resource = MockLoader.new(:centos6).load_resource('service', 'sshd')
    srv = { name: 'sshd', description: nil, installed: true, running: true, enabled: true, type: 'sysv' }
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

  # freebsd
  it 'verify freebsd10 package parsing' do
    resource = MockLoader.new(:freebsd10).load_resource('service', 'sendmail')
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
    srv = { name: 'sshd', description: nil, installed: true, running: true, enabled: true, type: 'sysv' }
    _(resource.info).must_equal srv
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
  end

  # debian 8 with systemd
  it 'verify arch linux package parsing' do
    resource = MockLoader.new(:debian8).load_resource('service', 'sshd')
    srv = { name: 'sshd.service', description: 'OpenSSH server daemon', installed: true, running: true, enabled: true, type: 'systemd' }
    _(resource.info).must_equal srv
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
  end

  # macos test
  it 'verify arch linux package parsing' do
    resource = MockLoader.new(:osx104).load_resource('service', 'ssh')
    srv = { name: 'org.openbsd.ssh-agent', description: nil, installed: true, running: true, enabled: true, type: 'darwin' }
    _(resource.info).must_equal srv
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
  end

  # wrlinux
  it 'verify wrlinux package parsing' do
    resource = MockLoader.new(:wrlinux).load_resource('service', 'sshd')
    srv = { name: 'sshd', description: nil, installed: true, running: true, enabled: true, type: 'sysv' }
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
end
