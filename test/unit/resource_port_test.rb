# encoding: utf-8

require 'helper'
require 'vulcano/resource'

describe 'Vulcano::Resources::Port' do

  it 'verify port on Ubuntu 14.04' do
    resource = MockLoader.new(:ubuntu1404).load_resource('port', 22)
    _(resource.listening?).must_equal true
    _(resource.protocol).must_equal 'tcp'
    _(resource.pid).must_equal 1
    _(resource.process).must_equal 'sshd'
  end

  it 'verify port on MacOs x' do
    resource = MockLoader.new(:osx104).load_resource('port', 2022)
    _(resource.listening?).must_equal true
    _(resource.protocol).must_equal 'tcp'
    _(resource.process).must_equal 'VBoxHeadl'
  end

  it 'verify running on undefined' do
    resource = MockLoader.new(:undefined).load_resource('port', 22)
    _(resource.listening?).must_equal false
    _(resource.protocol).must_equal nil
    _(resource.pid).must_equal nil
    _(resource.process).must_equal nil
  end
end
