require "helper"
require "inspec/resource"
require "inspec/resources/parse_config"

describe "Inspec::Resources::ParseConfig" do

  it "verify parse_config resource" do
    options = {
      assignment_regex: /^\s*([^=]*?)\s*=\s*(.*?)\s*$/,
    }
    resource = MockLoader.new(:centos6).load_resource("parse_config", "kernel.domainname = example.com", options)
    result = { "kernel.domainname" => "example.com" }
    _(resource.resource_id).must_equal "kernel.domainname = example.com"
    _(resource.params).must_equal result
    _(resource.content).must_equal "kernel.domainname = example.com"
    _(resource.send("kernel.domainname")).must_equal "example.com"
  end

  it "verify parse_config_file resource" do
    options = {
      assignment_regex: /^\s*([^=]*?)\s*=\s*(.*?)\s*$/,
    }
    resource = MockLoader.new(:centos6).load_resource("parse_config_file", "/etc/sysctl.conf", options)
    result = { "kernel.domainname" => "example.com" }
    _(resource.resource_id).must_equal "/etc/sysctl.conf"
    _(resource.params).must_equal result
    _(resource.send("kernel.domainname")).must_equal "example.com"
  end

  it "parse_config resource accepts arrays due to rspec's its behavior" do
    options = {
      assignment_regex: /^\s*([^=]*?)\s*=\s*(.*?)\s*$/,
    }
    params = [:[], "kernel.domainname"]
    resource = MockLoader.new(:centos6).load_resource("parse_config", "kernel.domainname = example.com", options)
    _(resource.send(*params)).must_equal "example.com"
  end
end
