# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::Package' do
  # arch linux
  it 'verify arch linux package parsing' do
    resource = MockLoader.new(:arch).load_resource('package', 'curl')
    pkg = { name: 'curl', installed: true, version: '7.37.0-1', type: 'pacman' }
    _(resource.installed?).must_equal true
    _(resource.version).must_equal '7.37.0-1'
    _(resource.info).must_equal pkg
  end

  # ubuntu
  it 'verify ubuntu package parsing' do
    resource = MockLoader.new(:ubuntu1404).load_resource('package', 'curl')
    pkg = { name: 'curl', installed: true, version: '7.35.0-1ubuntu2', type: 'deb' }
    _(resource.installed?).must_equal true
    _(resource.version).must_equal '7.35.0-1ubuntu2'
    _(resource.info).must_equal pkg
  end

  # centos
  it 'verify centos package parsing' do
    resource = MockLoader.new(:centos7).load_resource('package', 'curl')
    pkg = { name: 'curl', installed: true, version: '7.29.0-19.el7', type: 'rpm' }
    _(resource.installed?).must_equal true
    _(resource.version).must_equal '7.29.0-19.el7'
    _(resource.info).must_equal pkg
  end

  # wrlinux
  it 'verify wrlinux package parsing' do
    resource = MockLoader.new(:wrlinux).load_resource('package', 'curl')
    pkg = { name: 'curl', installed: true, version: '7.29.0-19.el7', type: 'rpm' }
    _(resource.installed?).must_equal true
    _(resource.version).must_equal '7.29.0-19.el7'
    _(resource.info).must_equal pkg
  end

  # windows
  it 'verify windows package parsing' do
    resource = MockLoader.new(:windows).load_resource('package', 'Microsoft Visual C++ 2008 Redistributable - x64 9.0.30729.6161')
    pkg = { name: 'Microsoft Visual C++ 2008 Redistributable - x64 9.0.30729.6161', installed: true, version: '9.0.30729.6161', type: 'windows' }
    _(resource.installed?).must_equal true
    _(resource.version).must_equal '9.0.30729.6161'
    _(resource.info).must_equal pkg
  end

  # solaris 10
  it 'verify windows package parsing' do
    resource = MockLoader.new(:solaris10).load_resource('package', 'SUNWzfsr')
    pkg = { name: 'SUNWzfsr', installed: true, version: '11.10.0-2006.05.18.01.46', type: 'pkg' }
    _(resource.installed?).must_equal true
    _(resource.version).must_equal '11.10.0-2006.05.18.01.46'
    _(resource.info).must_equal pkg
  end

  # solaris 11
  it 'verify windows package parsing' do
    resource = MockLoader.new(:solaris11).load_resource('package', 'system/file-system/zfs')
    pkg = { name: 'system/file-system/zfs', installed: true, version: '0.5.11-0.175.3.1.0.5.0', type: 'pkg' }
    _(resource.installed?).must_equal true
    _(resource.version).must_equal '0.5.11-0.175.3.1.0.5.0'
    _(resource.info).must_equal pkg
  end

  # undefined
  it 'verify package handling on unsupported os' do
    resource = MockLoader.new(:undefined).load_resource('package', 'curl')
    _(resource.installed?).must_equal false
    _(resource.info).must_equal nil
  end
end
