# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::Port' do
  it 'verify port on Ubuntu 14.04' do
    resource = MockLoader.new(:ubuntu1404).load_resource('port', 22)
    _(resource.listening?).must_equal true
    _(resource.protocol).must_equal %w{ tcp tcp6 }
    _(resource.pid).must_equal [1]
    _(resource.process).must_equal ['sshd']
  end

  it 'verify port on MacOs x' do
    resource = MockLoader.new(:osx104).load_resource('port', 2022)
    _(resource.listening?).must_equal true
    _(resource.protocol).must_equal ['tcp']
    _(resource.process).must_equal ['VBoxHeadl']
  end

  it 'verify port on Windows' do
    resource = MockLoader.new(:windows).load_resource('port', 135)
    _(resource.listening?).must_equal true
    _(resource.protocol).must_equal ['tcp']
    _(resource.process).must_equal nil
  end

  it 'verify port on FreeBSD' do
    resource = MockLoader.new(:freebsd10).load_resource('port', 22)
    _(resource.listening?).must_equal true
    _(resource.protocol).must_equal %w{ tcp6 tcp }
    _(resource.pid).must_equal [668]
    _(resource.process).must_equal ['sshd']
  end

  it 'verify port on wrlinux' do
    resource = MockLoader.new(:wrlinux).load_resource('port', 22)
    _(resource.listening?).must_equal true
    _(resource.protocol).must_equal %w{ tcp tcp6 }
    _(resource.process).must_equal ['sshd']
  end

  it 'verify running on undefined' do
    resource = MockLoader.new(:undefined).load_resource('port', 22)
    _(resource.listening?).must_equal false
    _(resource.protocol).must_equal nil
    _(resource.pid).must_equal nil
    _(resource.process).must_equal nil
  end
end
