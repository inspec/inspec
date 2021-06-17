require "helper"
require "inspec/resource"
require "inspec/resources/mongodb"

describe "Inspec::Resources::Mongodb" do
  it "sets default configuration path" do
    resource = MockLoader.new(:windows).load_resource("mongodb")
    _(resource.conf_path).must_equal "C:\\Program Files\\MongoDB\\Server\\4.4\\bin\\mongod.cfg"
  end

  it "sets default configuration path" do
    resource = MockLoader.new(:centos7).load_resource("mongodb")
    _(resource.conf_path).must_equal "/etc/mongod.conf"
  end
end

