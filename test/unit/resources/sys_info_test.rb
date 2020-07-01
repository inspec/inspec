require "helper"
require "inspec/resource"
require "inspec/resources/sys_info"

describe "Inspec::Resources::SysInfo" do
  describe "sys_info" do
    it "check sys_info on Ubuntu" do
      resource = MockLoader.new(:ubuntu1504).load_resource("sys_info")
      _(resource.hostname).must_equal "example.com"
      _(resource.manufacturer).must_equal "ACME Corp."
      _(resource.model).must_equal "Flux Capacitor"
    end

    it "check sys_info on OSX" do
      resource = MockLoader.new(:macos10_10).load_resource("sys_info")
      _(resource.hostname).must_equal "example.com"
      _(resource.manufacturer).must_equal "Apple Inc."
      _(resource.model).must_equal "MacBookPro13,3"
    end

    it "check sys_info on Windows" do
      resource = MockLoader.new(:windows).load_resource("sys_info")
      _(resource.hostname).must_equal "WIN-CIV7VMLVHLD"
      _(resource.manufacturer).must_equal "ACME Corp."
      _(resource.model).must_equal "Flux Capacitor"
    end

    it "check sysinfo on freebsd" do
      resource = MockLoader.new(:freebsd10).load_resource("sys_info")
      _(resource.hostname).must_equal "The `sys_info.hostname` resource is not supported on your OS yet."
      _(resource.manufacturer).must_equal "The `sys_info.manufacturer` resource is not supported on your OS yet."
      _(resource.model).must_equal "The `sys_info.model` resource is not supported on your OS yet."
    end
  end
end
