require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::Os' do
  it 'verify os parsing on CentOS' do
    resource = MockLoader.new(:centos7).load_resource('os')
    _(resource.name).must_equal 'centos'
    _(resource.family).must_equal 'redhat'
    _(resource.release).must_equal '7.1.1503'
    _(resource.arch).must_equal 'x86_64'
  end

  it 'read env variable on Windows' do
    resource = MockLoader.new(:windows).load_resource('os')
    _(resource.name).must_equal 'windows'
    _(resource.family).must_equal 'windows'
    _(resource.release).must_equal '6.2.9200'
    _(resource.arch).must_equal 'x86_64'
  end

  it 'verify os parsing on Debian' do
    resource = MockLoader.new(:debian8).load_resource('os')
    _(resource.name).must_equal 'debian'
    _(resource.family).must_equal 'debian'
    _(resource.release).must_equal '8'
    _(resource.arch).must_equal 'x86_64'
  end

  it 'verify os parsing on Ubuntu' do
    resource = MockLoader.new(:ubuntu1504).load_resource('os')
    _(resource.name).must_equal 'ubuntu'
    _(resource.family).must_equal 'debian'
    _(resource.release).must_equal '15.04'
    _(resource.arch).must_equal 'x86_64'
  end

  it 'verify os parsing on Mint' do
    resource = MockLoader.new(:mint18).load_resource('os')
    _(resource.name).must_equal 'linuxmint'
    _(resource.family).must_equal 'debian'
    _(resource.release).must_equal '18'
    _(resource.arch).must_equal 'x86_64'
  end
end
