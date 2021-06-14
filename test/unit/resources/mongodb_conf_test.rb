require "helper"
require "inspec/resource"
require "inspec/resources/mongodb_conf"

describe "Inspec::Resources::MongodbConf" do
  it "verify mongd.conf config parsing" do
    resource = load_resource("mongodb_conf", "/etc/mongod.conf")
    _(resource.params["storage"]["dbPath"]).must_equal "/var/lib/mongodb"
    _(resource.params["systemLog"]["path"]).must_equal "/var/log/mongodb/mongod.log"
    _(resource.port).must_equal 27017
  end

  it "verify mongd.conf config parsing use default configuration file location." do
    resource = load_resource("mongodb_conf")
    _(resource.params["storage"]["dbPath"]).must_equal "/var/lib/mongodb"
    _(resource.params["systemLog"]["path"]).must_equal "/var/log/mongodb/mongod.log"
    _(resource.port).must_equal 27017
  end
end
