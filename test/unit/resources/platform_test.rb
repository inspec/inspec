
require 'helper'
require 'inspec/resource'
require 'inspec/resources/platform'

describe 'Inspec::Resources::Platform' do
  let(:resource) { resource = MockLoader.new(:ubuntu1504).load_resource('platform') }

  it 'verify platform parsing on Ubuntu' do
    _(resource.name).must_equal 'ubuntu'
    _(resource.family).must_equal 'debian'
    _(resource.release).must_equal '15.04'
    _(resource.arch).must_equal 'x86_64'
  end

  it 'verify platform hash parsing on Ubuntu' do
    _(resource[:name]).must_equal 'ubuntu'
    _(resource[:family]).must_equal 'debian'
    _(resource[:release]).must_equal '15.04'
    _(resource[:arch]).must_equal 'x86_64'
  end

  it 'verify platform families' do
    expect = ["debian", "linux", "unix", "os"]
    _(resource.families).must_equal expect
  end

  it 'verify platform? responds correctly' do
    _(resource.platform?('windows')).must_equal false
    _(resource.platform?('unix')).must_equal true
    _(resource.platform?('ubuntu')).must_equal true
    _(resource.platform?('mac_os_x')).must_equal false
  end

  it 'verify family? responds correctly' do
    _(resource.in_family?('windows')).must_equal false
    _(resource.in_family?('unix')).must_equal true
    _(resource.in_family?('ubuntu')).must_equal false
    _(resource.in_family?('mac_os_x')).must_equal false
  end

  it 'verify supported? with multiple families' do
    supports = [
      { os_family: 'windows' },
      { os_family: 'unix' }
    ]
    resource.supported?(supports).must_equal true
  end

  it 'loads a profile which supports multiple names' do
    supports = [
      { 'os-family': 'windows', 'os-name': 'windows_2000'},
      { 'os-family': 'unix', 'os-name': 'ubuntu' }
    ]
    resource.supported?(supports).must_equal true
  end

  it 'reject a profile which supports multiple families' do
    supports = [
      { os_family: 'windows' },
      { os_family: 'redhat' }
    ]
    resource.supported?(supports).must_equal false
  end

  it 'loads a profile which supports release 15.04' do
    supports = [
      { 'os-family': 'windows', 'os-name': 'windows_2000'},
      { 'os-name': 'ubuntu', 'release': '15.04'}
    ]
    resource.supported?(supports).must_equal true
  end

  it 'loads a profile which supports release 15.*' do
    supports = [
      { 'os-family': 'windows', 'os-name': 'windows_2000'},
      { 'os-name': 'ubuntu', 'release': '15.*'}
    ]
    resource.supported?(supports).must_equal true
  end

  it 'loads a profile which supports release *.04' do
    supports = [
      { 'os-family': 'windows', 'os-name': 'windows_2000'},
      { 'os-name': 'ubuntu', 'release': '*.04'}
    ]
    resource.supported?(supports).must_equal true
  end

  it 'reject a profile which supports release 12.*' do
    supports = [
      { 'os-family': 'windows', 'os-name': 'windows_2000'},
      { 'os-name': 'ubuntu', 'release': '12.*'}
    ]
    resource.supported?(supports).must_equal false
  end
end
