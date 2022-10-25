require "inspec/globals"
require "#{Inspec.src_root}/test/helper"
require_relative "../../../lib/inspec/resources/default_gateway"

describe Inspec::Resources::Defaultgateway do
  # ubuntu
  it "check ipaddress and interface of default gateway on ubuntu" do
    resource = MockLoader.new("ubuntu".to_sym).load_resource("default_gateway")
    _(resource.ipaddress).must_equal "172.31.80.1"
    _(resource.interface).must_equal "eth0"
  end

  # darwin
  it "check ipaddress and interface of default gateway on darwin" do
    resource = MockLoader.new("macos10_10".to_sym).load_resource("default_gateway")
    _(resource.ipaddress).must_equal "172.31.80.1"
    _(resource.interface).must_equal "eth0"
  end

  # unsupported os
  it "check ipaddress and interface of default gateway on unsupported os" do
    resource = MockLoader.new("esxi".to_sym).load_resource("default_gateway")
    _(resource.resource_skipped?).must_equal true
    _(resource.resource_failed?).must_equal true
  end
end
