require "helper"
require "inspec/resource"
require "inspec/resources/ibmdb2_session"

describe "Inspec::Resources::ibmdb2_session" do
  it "fails when no IBM db2 instance name is provided" do
    resource = load_resource("ibmdb2_session", db_instance: "db2inst1", db_name: "sample")
    _(resource.resource_failed?).must_equal true
    _(resource.resource_exception_message).must_equal "Can't run IBM DB2 queries without db2_executable_file_path, db_instance, db_name options provided."
  end

  it "fails when no IBM db2 instance name is provided" do
    resource = load_resource("ibmdb2_session", db2_executable_file_path: "/opt/ibm/db2/V11.5/bin/db2", db_name: "sample")
    _(resource.resource_failed?).must_equal true
    _(resource.resource_exception_message).must_equal "Can't run IBM DB2 queries without db2_executable_file_path, db_instance, db_name options provided."
  end

  it "fails when no IBM db2 database name is provided" do
    resource = load_resource("ibmdb2_session", db2_executable_file_path: "/opt/ibm/db2/V11.5/bin/db2", db_instance: "db2inst1")
    _(resource.resource_failed?).must_equal true
    _(resource.resource_exception_message).must_equal "Can't run IBM DB2 queries without db2_executable_file_path, db_instance, db_name options provided."
  end

  it "returns expected result" do
    resource = load_resource("ibmdb2_session", db2_executable_file_path: "/opt/ibm/db2/V11.5/bin/db2", db_instance: "db2inst1", db_name: "sample")
    _(resource.resource_failed?).must_equal false
    _(resource.query("select rolename from syscat.roleauth").output).must_match(/SYSTS_ADM/)
  end
end
