require "helper"
require "inspec/resource"
require "inspec/resources/ipnat"

describe "Inspec::Resources::Ipnat" do
  # freebsd11
  it "verify ipfilter on freebsd" do
    resource = MockLoader.new(:freebsd11).load_resource("ipnat")
    _(resource.has_rule?("map net1 192.168.0.0/24 -> 0/32")).must_equal true
    _(resource.has_rule?("map en0 192.0.0.0/8 -> 10.9.0.1/32")).must_equal true
    _(resource.has_rule?("map en0 192.0.0.0/8 -> 10.9.0.1/32 proxy port ftp ftp/tcp")).must_equal true
    _(resource.has_rule?(nil)).must_equal false
  end

  # solaris11
  it "verify ipfilter on freebsd" do
    resource = MockLoader.new(:solaris11).load_resource("ipnat")
    _(resource.has_rule?("map net1 192.168.0.0/24 -> 0/32")).must_equal true
    _(resource.has_rule?("map en0 192.0.0.0/8 -> 10.9.0.1/32")).must_equal true
    _(resource.has_rule?("map en0 192.0.0.0/8 -> 10.9.0.1/32 proxy port ftp ftp/tcp")).must_equal true
    _(resource.has_rule?(nil)).must_equal false
  end

  # undefined
  it "verify ipfilter on unsupported os" do
    resource = MockLoader.new(:undefined).load_resource("ipnat")
    _(resource.has_rule?("map net1 192.168.0.0/24 -> 0/32")).must_equal false
    _(resource.has_rule?("map en0 192.0.0.0/8 -> 10.9.0.1/32")).must_equal false
    _(resource.has_rule?("map en0 192.0.0.0/8 -> 10.9.0.1/32 proxy port ftp ftp/tcp")).must_equal false
  end

end
