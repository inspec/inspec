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

  it "fails when no IBM db2 database name is provided on Windows" do
    resource = MockLoader.new(:windows).load_resource("ibmdb2_session")
    _(resource.resource_failed?).must_equal true
    _(resource.resource_exception_message).must_equal "Can't run IBM DB2 queries without db_name option provided."
  end

  it "verify ibmdb2_session query output on Windows" do
    skip_windows!
    resource = quick_resource(:ibmdb2_session, :windows, db_name: "sample") do |cmd|
      cmd.strip!
      case cmd
      when "set-item -path env:DB2CLP -value \"**$$**\"; db2 connect to sample; db2 \"select rolename from syscat.roleauth\";" then
        stdout_file "test/fixtures/cmd/ibmdb2_query_output"
      else
        raise cmd.inspect
      end
    end

    _(resource.resource_failed?).must_equal false
    query = resource.query("select rolename from syscat.roleauth")
    _(query.output).must_match(/SYSTS_ADM/)
  end

  it "verify ibmdb2_session query on Linux" do
    skip_windows!
    resource = quick_resource(:ibmdb2_session, :linux, db2_executable_file_path: "/opt/ibm/db2/V11.5/bin/db2", db_instance: "db2inst1", db_name: "sample") do |cmd|
      cmd.strip!
      case cmd
      when "/opt/ibm/db2/V11.5/bin/db2 attach to db2inst1; /opt/ibm/db2/V11.5/bin/db2 connect to sample; /opt/ibm/db2/V11.5/bin/db2 select rolename from syscat.roleauth;" then
        stdout_file "test/fixtures/cmd/ibmdb2_query_output"
      else
        raise cmd.inspect
      end
    end

    _(resource.resource_failed?).must_equal false
    query = resource.query("select rolename from syscat.roleauth")
    _(query.output).must_match(/SYSTS_ADM/)
  end
end
