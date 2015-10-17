# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'vulcano/resource'

describe 'Vulcano::Resources::AptRepo' do

  it 'check apt on ubuntu' do
    resource = MockLoader.new(:ubuntu1504).load_resource('apt', 'http://archive.ubuntu.com/ubuntu/')
    _(resource.exists?).must_equal true
    _(resource.enabled?).must_equal true
  end

  it 'check apt on ubuntu with ppa' do
    resource = MockLoader.new(:ubuntu1504).load_resource('apt', 'ubuntu-wine/ppa')
    _(resource.exists?).must_equal true
    _(resource.enabled?).must_equal true
  end

  it 'check apt on ubuntu with ppa' do
    resource = MockLoader.new(:ubuntu1504).load_resource('apt', 'ppa:ubuntu-wine/ppa')
    _(resource.exists?).must_equal true
    _(resource.enabled?).must_equal true
  end

  it 'check apt on debian' do
    resource = MockLoader.new(:ubuntu1504).load_resource('apt', 'http://archive.ubuntu.com/ubuntu/')
    _(resource.exists?).must_equal true
    _(resource.enabled?).must_equal true
  end

  it 'check apt on unknown os' do
    resource = MockLoader.new(:undefined).load_resource('apt', 'ubuntu-wine/ppa')
    _(resource.exists?).must_equal false
    _(resource.enabled?).must_equal false
  end

  # check ppa resource
  it 'check apt on ubuntu' do
    resource = MockLoader.new(:ubuntu1504).load_resource('ppa', 'ubuntu-wine/ppa')
    _(resource.exists?).must_equal true
    _(resource.enabled?).must_equal true
  end
end
