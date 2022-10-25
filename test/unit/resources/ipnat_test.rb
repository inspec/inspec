require "helper"
require "inspec/resource"
require "inspec/resources/ipnat"

describe "Inspec::Resources::Ipnat" do
  # freebsd11
  it "verify ipfilter on freebsd" do
    resource = MockLoader.new(:freebsd11).load_resource("ipnat")
    _(resource.has_rule?("map net1 192.168.0.0/24 -> 0/32")).must_equal true
    _(resource.has_rule?(nil)).must_equal false
    _(resource.resource_id).must_equal "Ipnat"
  end

  # solaris11
  it "verify ipfilter on solaris11" do
    resource = MockLoader.new(:solaris11).load_resource("ipnat")
    _(resource.has_rule?("map net1 192.168.0.0/24 -> 0/32")).must_equal true
    _(resource.has_rule?("rule which does not exist")).must_equal false
    _(resource.resource_id).must_equal "Ipnat"
  end

  # ubuntu
  it "verify ipfilter on ubuntu" do
    resource = MockLoader.new(:ubuntu).load_resource("ipnat")
    _(resource.has_rule?("map net1 192.168.0.0/24 -> 0/32")).must_equal false
    _(resource.resource_id).must_equal "Ipnat"
  end

  # windows
  it "verify ipfilter on windows" do
    resource = MockLoader.new(:windows).load_resource("ipnat")
    _(resource.has_rule?("map net1 192.168.0.0/24 -> 0/32")).must_equal false
    _(resource.resource_id).must_equal "Ipnat"
  end

  # undefined
  it "verify ipfilter on unsupported os" do
    resource = MockLoader.new(:undefined).load_resource("ipnat")
    _(resource.has_rule?("map net1 192.168.0.0/24 -> 0/32")).must_equal false
    _(resource.resource_id).must_equal "Ipnat"
  end

end
