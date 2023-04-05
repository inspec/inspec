require "helper"
require "inspec/resource"
require "inspec/resources/nftables"

describe "Inspec::Resources::NfTables" do

  # ubuntu
  it "verify nftables chain on ubuntu" do
    resource = MockLoader.new(:ubuntu).load_resource("nftables", { family: "inet", table: "filter", chain: "INPUT" })
    _(resource.type).must_equal "filter"
    _(resource.hook).must_equal "input"
    _(resource.prio).must_equal 0
    _(resource.policy).must_equal "accept"
    _(resource.has_rule?('iifname "eth0" tcp dport 80 accept comment "http on 80"')).must_equal true
    _(resource.has_rule?('iifname "eth1" tcp dport 80 accept')).must_equal false
    _(resource.resource_id).must_equal "nftables (family: inet table: filter chain: INPUT )"
  end
  it "verify nftables set on ubuntu" do
    resource = MockLoader.new(:ubuntu).load_resource("nftables", { family: "inet", table: "filter", set: "OPEN_PORTS" })
    _(resource.type).must_equal "ipv4_addr"
    _(resource.flags).must_include "interval"
    _(resource.size).must_equal 65536
    _(resource.has_element?("1.1.1.1")).must_equal true
    _(resource.has_element?("2.2.2.2")).must_equal false
    _(resource.resource_id).must_equal "nftables (family: inet table: filter  set: OPEN_PORTS)"
  end
end
