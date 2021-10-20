require "helper"
require "inspec/resource"
require "inspec/resources/ibmdb2_conf"

describe "Inspec::Resources::ibmdb2_conf" do
  it "fails when no IBM db2 executable path is provided" do
    resource = load_resource("ibmdb2_conf", db_instance: "db2inst1")
    _(resource.resource_failed?).must_equal true
    _(resource.resource_exception_message).must_equal "Can't connect to IBM DB2 without db2_executable_file_path, db_instance options provided."
  end

  it "fails when no IBM db2 instance name is provided" do
    resource = load_resource("ibmdb2_conf", db2_executable_file_path: "/opt/ibm/db2/V11.5/bin/db2")
    _(resource.resource_failed?).must_equal true
    _(resource.resource_exception_message).must_equal "Can't connect to IBM DB2 without db2_executable_file_path, db_instance options provided."
  end

  it "verify ibmdb2_conf on windows" do
    resource = MockLoader.new(:windows).load_resource("ibmdb2_conf")
    _(resource.resource_failed?).must_equal false
    _(resource.output).must_be_kind_of Array
  end

  it "return the output in array format" do
    resource = load_resource("ibmdb2_conf", db2_executable_file_path: "/opt/ibm/db2/V11.5/bin/db2", db_instance: "db2inst1")
    _(resource.resource_failed?).must_equal false
    _(resource.output).must_be_kind_of Array
  end

  it "returns expected result" do
    resource = load_resource("ibmdb2_conf", db2_executable_file_path: "/opt/ibm/db2/V11.5/bin/db2", db_instance: "db2inst1")
    _(resource.resource_failed?).must_equal false
    _(resource.output).must_include "Audit buffer size (4KB) (AUDIT_BUF_SZ) = 0"
  end
end
