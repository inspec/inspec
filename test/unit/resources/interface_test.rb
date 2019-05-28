require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::Interface' do

  # ubuntu 14.04
  it 'verify interface on ubuntu' do
    resource = MockLoader.new(:ubuntu1404).load_resource('interface', 'eth0')
    _(resource.exists?).must_equal true
    _(resource.up?).must_equal true
    _(resource.speed).must_equal 10000
    _(resource.ipv4_cidrs).must_include '127.0.0.1/8'
    _(resource.ipv4_addresses).must_include '127.0.0.1'
    _(resource.ipv4_addresses_netmask).must_include '127.0.0.1/255.0.0.0'
    _(resource.ipv6_cidrs).must_include '::1/128'
    _(resource.ipv6_addresses).must_include '::1'
    _(resource.ipv4_address?).must_equal true
    _(resource.ipv6_address?).must_equal true
  end

  it 'verify invalid interface on ubuntu' do
    resource = MockLoader.new(:ubuntu1404).load_resource('interface', 'eth1')
    _(resource.exists?).must_equal false
    _(resource.up?).must_equal false
    _(resource.speed).must_be_nil
    _(resource.ipv4_cidrs).must_be_empty
    _(resource.ipv4_addresses).must_be_empty
    _(resource.ipv4_addresses_netmask).must_be_empty
    _(resource.ipv6_cidrs).must_be_empty
    _(resource.ipv6_addresses).must_be_empty
    _(resource.ipv4_address?).must_equal false
    _(resource.ipv6_address?).must_equal false
  end

  # windows
  it 'verify interface on windows' do
    resource = MockLoader.new(:windows).load_resource('interface', 'ethernet0')
    _(resource.exists?).must_equal true
    _(resource.up?).must_equal false
    _(resource.speed).must_equal 0
    _(resource.ipv4_address?).must_equal false
    _(resource.ipv6_address?).must_equal false
    _(resource.ipv4_addresses).must_be_empty
    _(resource.ipv4_addresses_netmask).must_be_empty
    _(resource.ipv6_addresses).must_be_empty
    _(resource.ipv4_cidrs).must_be_empty
    _(resource.ipv6_cidrs).must_be_empty
  end

  it 'verify interface on windows' do
    resource = MockLoader.new(:windows).load_resource('interface', 'vEthernet (Intel(R) PRO 1000 MT Network Connection - Virtual Switch)')
    _(resource.exists?).must_equal true
    _(resource.up?).must_equal true
    _(resource.speed).must_equal 10000000
    _(resource.ipv4_cidrs).must_include '127.0.0.1/8'
    _(resource.ipv4_addresses).must_include '127.0.0.1'
    _(resource.ipv4_addresses_netmask).must_include '127.0.0.1/255.0.0.0'
    _(resource.ipv6_cidrs).must_include '::1/128'
    _(resource.ipv6_addresses).must_include '::1'
    _(resource.ipv4_address?).must_equal true
    _(resource.ipv6_address?).must_equal true
  end

  it 'verify invalid interface on windows' do
    resource = MockLoader.new(:windows).load_resource('interface', 'eth1')
    _(resource.exists?).must_equal false
    _(resource.up?).must_equal false
    _(resource.speed).must_be_nil
    _(resource.ipv4_address?).must_equal false
    _(resource.ipv6_address?).must_equal false
    _(resource.ipv4_addresses).must_be_empty
    _(resource.ipv4_addresses_netmask).must_be_empty
    _(resource.ipv6_addresses).must_be_empty
    _(resource.ipv4_cidrs).must_be_empty
    _(resource.ipv6_cidrs).must_be_empty
  end

  # undefined
  it 'verify interface on unsupported os' do
    resource = MockLoader.new(:undefined).load_resource('interface', 'eth0')
    _(resource.exists?).must_equal false
    _(resource.up?).must_equal false
    _(resource.speed).must_be_nil
  end

end
