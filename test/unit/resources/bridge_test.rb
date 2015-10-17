# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'vulcano/resource'

describe 'Vulcano::Resources::Bridge' do

  it 'check linux bridge on ubuntu' do
    resource = MockLoader.new(:ubuntu1404).load_resource('bridge', 'br0')
    _(resource.exists?).must_equal true

    # check network interfaced attached to bridge
    _(resource.has_interface?('eth0')).must_equal false
    _(resource.has_interface?('eth1')).must_equal true
    _(resource.has_interface?('eth2')).must_equal true

    # get associated interfaces
    _(resource.interfaces).must_equal %w{eth1 eth2}
  end

  it 'check linux bridge on centos 7' do
    resource = MockLoader.new(:centos7).load_resource('bridge', 'br0')
    _(resource.exists?).must_equal true

    # check network interfaced attached to bridge
    _(resource.has_interface?('eth0')).must_equal false
    _(resource.has_interface?('eth1')).must_equal true
    _(resource.has_interface?('eth2')).must_equal true

    # get associated interfaces
    _(resource.interfaces).must_equal %w{eth1 eth2}
  end

  it 'check windows bridge' do
    resource = MockLoader.new(:windows).load_resource('bridge', 'Network Bridge')
    _(resource.exists?).must_equal true

    # get associated interfaces is not supported on windows
    _(resource.interfaces).must_equal nil
  end

  it 'check bridge on unsupported os' do
    resource = MockLoader.new(:undefined).load_resource('bridge', 'br0')
    _(resource.exists?).must_equal false

    # check network interfaced attached to bridge
    _(resource.has_interface?('eth0')).must_equal false
    _(resource.has_interface?('eth1')).must_equal false
    _(resource.has_interface?('eth2')).must_equal false

    # get associated interfaces
    _(resource.interfaces).must_equal nil
  end
end
