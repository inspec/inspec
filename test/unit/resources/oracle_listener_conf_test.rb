require "helper"
require "inspec/resource"
require "inspec/resources/oracledb_listener_conf"

describe "Inspec::Resources::OracleListenerConf" do
  it "verify listener settings of oracle DB in linux" do
    resource = MockLoader.new(:centos7).load_resource("oracledb_listener_conf", "network/admin/listener.ora")
    _(resource.params["DEFAULT_SERVICE_LISTENER"]).must_equal "XE"
    _(resource.params["EM_EXPRESS_PORT"]).must_equal "5500"
  end

  it "verify listener settings of oracle DB in windows" do
    resource = MockLoader.new(:windows).load_resource("oracledb_listener_conf", "network\\admin\\listener.ora")
    _(resource.params["DEFAULT_SERVICE_LISTENER"]).must_equal "XE"
    _(resource.params["EM_EXPRESS_PORT"]).must_equal "5500"
  end
end
