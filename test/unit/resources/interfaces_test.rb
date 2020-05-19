require "helper"
require "inspec/resource"
require "inspec/resources/interfaces"

describe "Inspec::Resources::Interfaces" do

  # ubuntu 16.04
  it "verify interface on ubuntu" do
    resource = MockLoader.new(:ubuntu1604).load_resource("interfaces")
    _(resource.exist?).must_equal true
    _(resource.names).must_equal %w{eth0 lo}
    _(resource.ipv4_address).must_equal "127.0.0.1"
  end

  # freebsd / macos
  it "verify interface on freebsd" do
    resource = MockLoader.new(:freebsd12).load_resource("interfaces")
    _(resource.exist?).must_equal true
    _(resource.names).must_equal %w{em0 lo0}
    _(resource.ipv4_address).must_equal "1.2.3.4"
  end

  # windows
  it "verify interfaces on windows" do
    resource = MockLoader.new(:windows).load_resource("interfaces")
    _(resource.exist?).must_equal true
    _(resource.names).must_equal ["vEthernet (Intel(R) PRO 1000 MT Network Connection - Virtual Switch)", "Ethernet0"]
    _(resource.ipv4_address).must_equal "127.0.0.1"
  end
end
