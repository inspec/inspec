# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::Host' do

  it 'check host on ubuntu' do
    loader = MockLoader.new(:ubuntu1404)
    resource = loader.load_resource('host', 'example.com')
    _(resource.resolvable?).must_equal true
    _(resource.reachable?).must_equal true
    _(resource.ipaddress).must_equal ['2606:2800:220:1:248:1893:25c8:1946']

    resource = MockLoader.new(:ubuntu1404).load_resource('host', 'example.com', 80)
    _(resource.reachable?).must_equal true

    resource = MockLoader.new(:ubuntu1404).load_resource('host', 'example.com', 8080)
    _(resource.reachable?).must_equal false

    resource = MockLoader.new(:ubuntu1404).load_resource('host', 'example.com', 80, 'tcp')
    _(resource.reachable?).must_equal true

    resource = MockLoader.new(:ubuntu1404).load_resource('host', 'example.com', 8080, 'tcp')
    _(resource.reachable?).must_equal false
  end

  it 'check host with port reachable on ubuntu' do
    resource = MockLoader.new(:ubuntu1404).load_resource('host', 'example.com', 80)
    _(resource.reachable?).must_equal true
  end

  it 'check host with port unreachable on ubuntu' do
    resource = MockLoader.new(:ubuntu1404).load_resource('host', 'example.com', 8080)
    _(resource.reachable?).must_equal false
  end

  it 'check host with port tcp protocol reachable on ubuntu' do
    resource = MockLoader.new(:ubuntu1404).load_resource('host', 'example.com', 80, 'tcp')
    _(resource.reachable?).must_equal true
  end

  it 'check host with port tcp protocol unreachable on ubuntu' do
    resource = MockLoader.new(:ubuntu1404).load_resource('host', 'example.com', 8080, 'tcp')
    _(resource.reachable?).must_equal false
  end

  it 'check host on centos 7' do
    resource = MockLoader.new(:centos7).load_resource('host', 'example.com')
    _(resource.resolvable?).must_equal true
    _(resource.reachable?).must_equal true
    _(resource.ipaddress).must_equal ['2606:2800:220:1:248:1893:25c8:1946']

    resource = MockLoader.new(:centos7).load_resource('host', 'example.com', 80)
    _(resource.reachable?).must_equal true

    resource = MockLoader.new(:ubuntu1404).load_resource('host', 'example.com', 8080)
    _(resource.reachable?).must_equal false

    resource = MockLoader.new(:ubuntu1404).load_resource('host', 'example.com', 80, 'tcp')
    _(resource.reachable?).must_equal true

    resource = MockLoader.new(:ubuntu1404).load_resource('host', 'example.com', 8080, 'tcp')
    _(resource.reachable?).must_equal false
  end

  it 'check host with port reachable on centos 7' do
    resource = MockLoader.new(:ubuntu1404).load_resource('host', 'example.com', 80)
    _(resource.reachable?).must_equal true
  end

  it 'check host with port unreachable on centos 7' do
    resource = MockLoader.new(:centos7).load_resource('host', 'example.com', 8080)
    _(resource.reachable?).must_equal false
  end

  it 'check host with port tcp protocol reachable on centos 7' do
    resource = MockLoader.new(:centos7).load_resource('host', 'example.com', 80, 'tcp')
    _(resource.reachable?).must_equal true
  end

  it 'check host with port tcp protocol unreachable on centos 7' do
    resource = MockLoader.new(:centos7).load_resource('host', 'example.com', 8080, 'tcp')
    _(resource.reachable?).must_equal false
  end

  it 'check host on darwin' do
    resource = MockLoader.new(:osx104).load_resource('host', 'example.com')
    _(resource.resolvable?).must_equal true
    _(resource.reachable?).must_equal true
    _(resource.ipaddress).must_equal ['2606:2800:220:1:248:1893:25c8:1946']
  end

  it 'check host on windows' do
    resource = MockLoader.new(:windows).load_resource('host', 'microsoft.com')
    _(resource.resolvable?).must_equal true
    _(resource.reachable?).must_equal false
    _(resource.ipaddress).must_equal ['134.170.185.46', '134.170.188.221']
  end

  it 'check host on unsupported os' do
    resource = MockLoader.new(:undefined).load_resource('host', 'example.com')
    _(resource.resolvable?).must_equal false
    _(resource.reachable?).must_equal false
    _(resource.ipaddress).must_equal nil
  end

end
