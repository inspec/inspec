require "helper"
require "inspec/resource"
require "inspec/resources/nftables"

describe "Inspec::Resources::NfTables" do

  # ubuntu
  it "verify nftables on ubuntu" do
    resource = MockLoader.new(:ubuntu).load_resource("nftables", family: "inet", table: "filter", chain: "INPUT")
    _(resource.policy).must_equal "accept"
    _(resource.has_rule?('iifname "eth0" tcp dport 80 accept comment "http on 80"')).must_equal true
    _(resource.resource_id).must_equal "nftables"
  end
end
