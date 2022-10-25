require "helper"
require "inspec/resource"
require "inspec/resources/apt"

describe "Inspec::Resources::AptRepo" do

  it "check apt on ubuntu" do
    resource = MockLoader.new(:ubuntu).load_resource("apt", "http://archive.ubuntu.com/ubuntu/")
    _(resource.resource_id).must_equal "http://archive.ubuntu.com/ubuntu/"
    _(resource.exists?).must_equal true
    _(resource.enabled?).must_equal true
  end

  it "check apt on ubuntu with ppa" do
    resource = MockLoader.new(:ubuntu).load_resource("apt", "ubuntu-wine/ppa")
    _(resource.resource_id).must_equal "http://ppa.launchpad.net/ubuntu-wine/ppa/ubuntu"
    _(resource.exists?).must_equal true
    _(resource.enabled?).must_equal true
  end

  it "check apt on ubuntu with ppa" do
    resource = MockLoader.new(:ubuntu).load_resource("apt", "ppa:ubuntu-wine/ppa")
    _(resource.exists?).must_equal true
    _(resource.enabled?).must_equal true
  end

  it "check apt on mint" do
    resource = MockLoader.new(:mint18).load_resource("apt", "http://archive.ubuntu.com/ubuntu/")
    _(resource.exists?).must_equal true
    _(resource.enabled?).must_equal true
  end

  it "check apt on mint with ppa" do
    resource = MockLoader.new(:mint18).load_resource("apt", "ubuntu-wine/ppa")
    _(resource.exists?).must_equal true
    _(resource.enabled?).must_equal true
  end

  it "check apt on mint with ppa" do
    resource = MockLoader.new(:mint18).load_resource("apt", "ppa:ubuntu-wine/ppa")
    _(resource.exists?).must_equal true
    _(resource.enabled?).must_equal true
  end

  it "check apt on debian" do
    resource = MockLoader.new(:debian8).load_resource("apt", "http://archive.ubuntu.com/ubuntu/")
    _(resource.exists?).must_equal true
    _(resource.enabled?).must_equal true
  end

  it "check apt on unknown os" do
    resource = MockLoader.new(:undefined).load_resource("apt", "ubuntu-wine/ppa")
    _(resource.resource_id).must_equal "ubuntu-wine/ppa"
    _(resource.exists?).must_equal false
    _(resource.enabled?).must_equal false
  end
end
