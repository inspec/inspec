require "inspec/globals"
require "#{Inspec.src_root}/test/helper"
require_relative "../../../lib/inspec/resources/ppa"

describe Inspec::Resources::PpaRepository do

  it "checks on ubuntu as name/ppa" do
    resource = MockLoader.new(:ubuntu).load_resource("ppa", "ubuntu-wine/ppa")
    _(resource.resource_id).must_equal "http://ppa.launchpad.net/ubuntu-wine/ppa/ubuntu"
    _(resource.exists?).must_equal true
    _(resource.enabled?).must_equal true
  end

  it "checks on ubuntu as ppa:name/ppa" do
    resource = MockLoader.new(:ubuntu).load_resource("ppa", "ppa:ubuntu-wine/ppa")
    _(resource.resource_id).must_equal "http://ppa.launchpad.net/ubuntu-wine/ppa/ubuntu"
    _(resource.exists?).must_equal true
    _(resource.enabled?).must_equal true
  end

  it "checks on mint as name/ppa" do
    resource = MockLoader.new(:mint18).load_resource("ppa", "ubuntu-wine/ppa")
    _(resource.exists?).must_equal true
    _(resource.enabled?).must_equal true
  end

  it "checks on mint as ppa:name/ppa" do
    resource = MockLoader.new(:mint18).load_resource("ppa", "ppa:ubuntu-wine/ppa")
    _(resource.exists?).must_equal true
    _(resource.enabled?).must_equal true
  end

  it "checks on debian as http://name/" do
    resource = MockLoader.new(:debian8).load_resource("ppa", "http://archive.ubuntu.com/ubuntu/")
    _(resource.exists?).must_equal true
    _(resource.enabled?).must_equal true
  end

  it "checks on unknown os" do
    resource = MockLoader.new(:undefined).load_resource("ppa", "ubuntu-wine/ppa")
    _(resource.resource_id).must_equal "ubuntu-wine/ppa"
    _(resource.exists?).must_equal false
    _(resource.enabled?).must_equal false
  end
end
