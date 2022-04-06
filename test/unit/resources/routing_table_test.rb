require "inspec/globals"
require "#{Inspec.src_root}/test/helper"
require_relative "../../../lib/inspec/resources/routing_table"

describe Inspec::Resources::Routingtable do
  # ubuntu
  it "check routing table information on ubuntu" do
    resource = MockLoader.new("ubuntu".to_sym).load_resource("routing_table")
    _(resource.has_entry?(destination: "0.0.0.0", interface: "eth0", gateway: "172.31.80.1")).must_equal true
    _(resource.has_entry?(destination: "10.123.137.0", interface: "lxdbr0", gateway: "0.0.0.0")).must_equal true
  end

  # darwin
  it "check routing table information on darwin" do
    resource = MockLoader.new("macos10_10".to_sym).load_resource("routing_table")
    _(resource.has_entry?(destination: "10.123.137.0", interface: "lxdbr0", gateway: "0.0.0.0")).must_equal true
    _(resource.has_entry?(destination: "172.31.80.1", interface: "eth0", gateway: "0.0.0.0")).must_equal true
  end

  # Ubuntu with missing key
  it "check routing table information on ubuntu with missing key input" do
    resource = MockLoader.new("ubuntu".to_sym).load_resource("routing_table")
    ex = _ { resource.has_entry?(destination: "172.31.80.1", interface: "eth0") }.must_raise(Inspec::Exceptions::ResourceSkipped)
    _(ex.message).must_include "One or more missing key, have_entry? matcher expects a hash with 3 keys: destination, gateway and interface"
  end

  # unsupported os
  it "check routing table information on unsupported os" do
    resource = MockLoader.new("undefined".to_sym).load_resource("routing_table")
    _(resource.resource_skipped?).must_equal true
    _(resource.resource_failed?).must_equal true
  end
end
