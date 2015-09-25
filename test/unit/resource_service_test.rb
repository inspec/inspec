# encoding utf-8

require 'helper'
require 'vulcano/resource'

describe 'Vulcano::Resources::Service' do

  # windows
  it 'verify service parsing' do
    resource = MockLoader.new(:windows).load_resource('service', 'dhcp')
    srv = { name: 'dhcp', description: 'DHCP Client', installed: true, running: true, enabled: true, type: 'windows' }
    _(resource.info).must_equal srv
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
  end

  # # ubuntu 14.04 with upstart
  it 'verify ubuntu package parsing' do
    resource = MockLoader.new(:ubuntu1404).load_resource('service', 'ssh')
    srv = { name: 'ssh', description: '', installed: true, running: true, enabled: true, type: 'upstart' }
    _(resource.info).must_equal srv
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
  end

  # centos 7 with systemd
  it 'verify centos package parsing' do
    resource = MockLoader.new(:centos7).load_resource('service', 'sshd')
    srv = { name: 'sshd.service', description: 'OpenSSH server daemon', installed: true, running: true, enabled: true, type: 'systemd' }
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
