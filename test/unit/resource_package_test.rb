# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'vulcano/resource'

describe 'Vulcano::Resources::Passwd' do
  describe 'package' do
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
      pkg = { name: 'curl', installed: true, version: '7.29.0', type: 'rpm' }
      _(resource.installed?).must_equal true
      _(resource.version).must_equal '7.29.0'
      _(resource.info).must_equal pkg
    end

    # # windows
    it 'verify windows package parsing' do
      resource = MockLoader.new(:windows).load_resource('package', 'Microsoft Visual C++ 2008 Redistributable - x64 9.0.30729.6161')
      pkg = { name: 'Microsoft Visual C++ 2008 Redistributable - x64 9.0.30729.6161', installed: true, version: '9.0.30729.6161', type: 'windows' }
      _(resource.installed?).must_equal true
      _(resource.version).must_equal '9.0.30729.6161'
      _(resource.info).must_equal pkg
    end

    # undefined
    it 'verify package handling on unsupported os' do
      resource = MockLoader.new(:undefined).load_resource('package', 'curl')
      _(resource.installed?).must_equal false
      _(resource.info).must_equal nil
    end
  end
end
