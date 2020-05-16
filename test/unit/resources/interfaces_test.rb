require "helper"
require "inspec/resource"
require "inspec/resources/interfaces"

describe "Inspec::Resources::Interfaces" do

  # ubuntu 16.04
  it "verify interface on ubuntu" do
    resource = MockLoader.new(:ubuntu1604).load_resource("interfaces")
    _(resource.exist?).must_equal true
    _(resource.names).must_equal ["enp0s3", "lo"]
  end

  # freebsd / macos
  it "verify interface on freebsd" do
    resource = MockLoader.new(:freebsd12).load_resource("interfaces")
    _(resource.exist?).must_equal true
    _(resource.names).must_equal ["em0", "lo0"]
  end

  # windows
  it "verify interfaces on windows" do
    resource = MockLoader.new(:windows).load_resource("interfaces")
    _(resource.exist?).must_equal true
    _(resource.names).must_equal ["Ethernet"]
  end
end
