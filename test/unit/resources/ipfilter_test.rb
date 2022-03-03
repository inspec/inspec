require "helper"
require "inspec/resource"
require "inspec/resources/ipfilter"

describe "Inspec::Resources::Ipfilter" do
  # freebsd11
  it "verify ipfilter on freebsd11" do
    resource = MockLoader.new(:freebsd11).load_resource("ipfilter")
    _(resource.has_rule?("pass in quick on lo0 all")).must_equal true
    _(resource.has_rule?("rule which does not exist")).must_equal false
    _(resource.has_rule?(nil)).must_equal false
  end

  # solaris11
  it "verify ipfilter on solaris11" do
    resource = MockLoader.new(:solaris11).load_resource("ipfilter")
    _(resource.has_rule?("pass out quick on lo0 all")).must_equal true
    _(resource.has_rule?("rule which does not exist")).must_equal false
  end

  # ubuntu
  it "verify ipfilter on ubuntu" do
    resource = MockLoader.new(:ubuntu).load_resource("ipfilter")
    _(resource.has_rule?("pass out quick on lo0 all")).must_equal false
  end

  # windows
  it "verify ipfilter on windows" do
    resource = MockLoader.new(:windows).load_resource("ipfilter")
    _(resource.has_rule?("pass out quick on lo0 all")).must_equal false
  end

  # undefined
  it "verify ipfilter on unsupported os" do
    resource = MockLoader.new(:undefined).load_resource("ipfilter")
    _(resource.has_rule?("pass out quick on lo0 all")).must_equal false
  end

end
