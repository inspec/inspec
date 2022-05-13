require "inspec/globals"
require "#{Inspec.src_root}/test/helper"
require_relative "../../../lib/inspec/resources/zfs"

describe Inspec::Resources::Zfs do
  # freebsd
  it "checks zfs pool properties on freebsd" do
    resource = MockLoader.new("freebsd10".to_sym).load_resource("zfs", "tank")
    _(resource.exists?).must_equal true
    _(resource.has_property?({ "health" => "ONLINE", "failmode" => "continue", "feature@sha512" => "enabled" })).must_equal true
  end

  # ubuntu
  it "checks zfs pool properties on ubuntu" do
    resource = MockLoader.new("ubuntu".to_sym).load_resource("zfs", "tank")
    _(resource.exists?).must_equal true
    _(resource.has_property?({ "guid" => "4711279777582057513", "feature@extensible_dataset" => "enabled", "feature@sha512" => "enabled" })).must_equal true
  end

  # ubuntu
  it "checks zfs pool properties on ubuntu providing empty input" do
    resource = MockLoader.new("ubuntu".to_sym).load_resource("zfs", "tank")
    ex = _ { resource.has_property?({}) }.must_raise(Inspec::Exceptions::ResourceSkipped)
    _(ex.message).must_include "Provide a valid key-value pair of the zfs properties."
  end

  # windows
  it "checks zfs pool properties on windows" do
    resource = MockLoader.new("windows".to_sym).load_resource("zfs", "tank")
    _(resource.resource_skipped?).must_equal true
    _(resource.resource_failed?).must_equal true
  end
end
