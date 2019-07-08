require "helper"
require "inspec/resource"
require "inspec/resources/ip6tables"

describe "Inspec::Resources::Ip6tables" do

  # ubuntu 14.04
  it "verify ip6tables on ubuntu" do
    resource = MockLoader.new(:ubuntu1404).load_resource("ip6tables")
    _(resource.has_rule?("-P OUTPUT ACCEPT")).must_equal true
    _(resource.has_rule?("-P OUTPUT DROP")).must_equal false
  end

  it "verify ip6tables with comments on ubuntu" do
    resource = MockLoader.new(:ubuntu1404).load_resource("ip6tables")
    _(resource.has_rule?('-A INPUT -i eth0 -p tcp -m tcp --dport 80 -m state --state NEW -m comment --comment "http-v6 like its 1990" -j ACCEPT')).must_equal true
  end

  it "verify ip6tables on windows" do
    resource = MockLoader.new(:windows).load_resource("ip6tables")
    _(resource.has_rule?("-P OUTPUT ACCEPT")).must_equal false
    _(resource.has_rule?("-P OUTPUT DROP")).must_equal false
  end

  # undefined
  it "verify ip6tables on unsupported os" do
    resource = MockLoader.new(:undefined).load_resource("ip6tables")
    _(resource.has_rule?("-P OUTPUT ACCEPT")).must_equal false
    _(resource.has_rule?("-P OUTPUT DROP")).must_equal false
  end

end
