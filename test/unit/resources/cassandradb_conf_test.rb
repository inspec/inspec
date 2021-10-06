require "helper"
require "inspec/resource"
require "inspec/resources/cassandradb_conf"

describe "Inspec::Resources::CassandradbConf" do
  it "verify configurations of cassandra DB in linux when conf path is passed" do
    resource = MockLoader.new(:centos7).load_resource("cassandradb_conf", "/etc/cassandra/cassandra.yaml")
    _(resource.params["listen_address"]).must_equal "localhost"
    _(resource.params["native_transport_port"]).must_equal 9042
    _(resource.params["audit_logging_options"]["enabled"]).must_equal false
  end

  it "verify configurations of cassandra DB in windows when conf path is passed" do
    resource = MockLoader.new(:windows).load_resource("cassandradb_conf", "C:\\Program Files\\apache-cassandra-3.11.4-bin\\apache-cassandra-3.11.4\\conf\\cassandra.yaml")
    _(resource.params["listen_address"]).must_equal "localhost"
    _(resource.params["native_transport_port"]).must_equal 9042
    _(resource.params["audit_logging_options"]["enabled"]).must_equal false
  end

  it "verify configurations of cassandra DB in linux when conf path is not passed" do
    resource = MockLoader.new(:centos7).load_resource("cassandradb_conf", nil)
    _(resource.params["listen_address"]).must_equal "localhost"
    _(resource.params["native_transport_port"]).must_equal 9042
    _(resource.params["audit_logging_options"]["enabled"]).must_equal false
  end

  it "verify configurations of cassandra DB in windows when conf path is not passed" do
    resource = MockLoader.new(:windows).load_resource("cassandradb_conf", nil)
    _(resource.params["listen_address"]).must_equal "localhost"
    _(resource.params["native_transport_port"]).must_equal 9042
    _(resource.params["audit_logging_options"]["enabled"]).must_equal false
  end
end
