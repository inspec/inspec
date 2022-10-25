require "helper"
require "inspec/resource"
require "inspec/resources/interface"

describe "Inspec::Resources::Interface" do

  # ubuntu
  it "verify interface on ubuntu" do
    resource = MockLoader.new(:ubuntu).load_resource("interface", "eth0")
    _(resource.exists?).must_equal true
    _(resource.up?).must_equal true
    _(resource.speed).must_equal 10000
    _(resource.name).must_equal "eth0"
    _(resource.ipv4_cidrs).must_include "127.0.0.1/8"
    _(resource.ipv4_address).must_equal "127.0.0.1"
    _(resource.ipv4_addresses).must_include "127.0.0.1"
    _(resource.ipv4_addresses_netmask).must_include "127.0.0.1/255.0.0.0"
    _(resource.ipv6_cidrs).must_include "::1/128"
    _(resource.ipv6_address).must_equal "::1"
    _(resource.ipv6_addresses).must_include "::1"
    _(resource.ipv4_address?).must_equal true
    _(resource.ipv6_address?).must_equal true
    _(resource.resource_id).must_equal "eth0"
  end

  it "verify invalid interface on ubuntu" do
    resource = MockLoader.new(:ubuntu).load_resource("interface", "eth1")
    _(resource.exists?).must_equal false
    _(resource.up?).must_equal false
    _(resource.name).must_be_nil
    _(resource.speed).must_be_nil
    _(resource.ipv4_cidrs).must_be_empty
    _(resource.ipv4_address).must_be_nil
    _(resource.ipv4_addresses).must_be_empty
    _(resource.ipv4_addresses_netmask).must_be_empty
    _(resource.ipv6_address).must_be_nil
    _(resource.ipv6_cidrs).must_be_empty
    _(resource.ipv6_addresses).must_be_empty
    _(resource.ipv4_address?).must_equal false
    _(resource.ipv6_address?).must_equal false
    _(resource.resource_id).must_equal "eth1"
  end

  # windows
  it "verify interface on windows" do
    resource = MockLoader.new(:windows).load_resource("interface", "ethernet0")
    _(resource.exists?).must_equal true
    _(resource.up?).must_equal false
    _(resource.name).must_equal "Ethernet0"
    _(resource.speed).must_equal 0
    _(resource.ipv4_address).must_be_nil
    _(resource.ipv4_address?).must_equal false
    _(resource.ipv6_address?).must_equal false
    _(resource.ipv4_addresses).must_be_empty
    _(resource.ipv4_addresses_netmask).must_be_empty
    _(resource.ipv6_address).must_be_nil
    _(resource.ipv6_addresses).must_be_empty
    _(resource.ipv4_cidrs).must_be_empty
    _(resource.ipv6_cidrs).must_be_empty
    _(resource.resource_id).must_equal "ethernet0"
  end

  it "verify interface on windows" do
    resource = MockLoader.new(:windows).load_resource("interface", "vEthernet (Intel(R) PRO 1000 MT Network Connection - Virtual Switch)")
    _(resource.exists?).must_equal true
    _(resource.up?).must_equal true
    _(resource.name).must_equal "vEthernet (Intel(R) PRO 1000 MT Network Connection - Virtual Switch)"
    _(resource.speed).must_equal 10000000
    _(resource.ipv4_cidrs).must_include "127.0.0.1/8"
    _(resource.ipv4_address).must_equal "127.0.0.1"
    _(resource.ipv4_addresses).must_include "127.0.0.1"
    _(resource.ipv4_addresses_netmask).must_include "127.0.0.1/255.0.0.0"
    _(resource.ipv6_cidrs).must_include "::1/128"
    _(resource.ipv6_address).must_equal "::1"
    _(resource.ipv6_addresses).must_include "::1"
    _(resource.ipv4_address?).must_equal true
    _(resource.ipv6_address?).must_equal true
    _(resource.resource_id).must_equal "vEthernet (Intel(R) PRO 1000 MT Network Connection - Virtual Switch)"
  end

  it "verify invalid interface on windows" do
    resource = MockLoader.new(:windows).load_resource("interface", "eth1")
    _(resource.exists?).must_equal false
    _(resource.up?).must_equal false
    _(resource.name).must_be_nil
    _(resource.speed).must_be_nil
    _(resource.ipv4_address?).must_equal false
    _(resource.ipv6_address?).must_equal false
    _(resource.ipv4_addresses).must_be_empty
    _(resource.ipv4_addresses_netmask).must_be_empty
    _(resource.ipv6_addresses).must_be_empty
    _(resource.ipv4_cidrs).must_be_empty
    _(resource.ipv6_cidrs).must_be_empty
    _(resource.resource_id).must_equal "eth1"
  end

  it "verify interface on macos" do
    resource = MockLoader.new(:macos10_10).load_resource("interface", "en0")
    _(resource.exists?).must_equal true
    _(resource.up?).must_equal true
    _(resource.speed).must_equal 1000
    _(resource.name).must_equal "en0"
    _(resource.ipv4_cidrs).must_include "192.168.1.2/24"
    _(resource.ipv4_address).must_equal "192.168.1.2"
    _(resource.ipv4_addresses).must_include "192.168.1.2"
    _(resource.ipv4_addresses_netmask).must_include "192.168.1.2/255.255.255.0"
    _(resource.ipv6_cidrs).must_include "fe80::8b6:c2cc:2928:3b61/64"
    _(resource.ipv6_address).must_equal "fe80::8b6:c2cc:2928:3b61"
    _(resource.ipv6_addresses).must_include "fe80::8b6:c2cc:2928:3b61"
    _(resource.ipv4_address?).must_equal true
    _(resource.ipv6_address?).must_equal true
    _(resource.resource_id).must_equal "en0"
  end

  # undefined
  it "verify interface on unsupported os" do
    resource = MockLoader.new(:undefined).load_resource("interface", "eth0")
    _(resource.exists?).must_equal false
    _(resource.up?).must_equal false
    _(resource.name).must_be_nil
    _(resource.speed).must_be_nil
    _(resource.resource_id).must_equal "eth0"
  end

end
