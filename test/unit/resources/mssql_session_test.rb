require "helper"
require "inspec/resource"
require "inspec/resources/mssql_session"

describe "Inspec::Resources::MssqlSession" do
  it "verify default mssql_session configuration" do
    resource = load_resource("mssql_session", user: "sa", password: "yourStrong(!)Password")
    _(resource.resource_id).must_equal "mssql_session:User:sa:Host:localhost:Database::Instance:"
    _(resource.user).must_equal "sa"
    _(resource.password).must_equal "yourStrong(!)Password"
    _(resource.host).must_equal "localhost"
  end

  it "verify mssql_session configuration with custom hostname" do
    resource = load_resource("mssql_session", user: "sa", password: "yourStrong(!)Password", host: "inspec.domain.tld")
    _(resource.user).must_equal "sa"
    _(resource.password).must_equal "yourStrong(!)Password"
    _(resource.host).must_equal "inspec.domain.tld"
  end

  it "verify mssql_session configuration with custom instance" do
    resource = load_resource("mssql_session", user: "sa", password: "yourStrong(!)Password", instance: "SQL2012INSPEC")
    _(resource.user).must_equal "sa"
    _(resource.password).must_equal "yourStrong(!)Password"
    _(resource.host).must_equal "localhost"
    _(resource.instance).must_equal "SQL2012INSPEC"
  end

  it "verify mssql_session configuration with custom instance and port" do
    resource = load_resource("mssql_session", user: "sa", password: "yourStrong(!)Password", instance: "SQL2012INSPEC", port: "1691")
    _(resource.resource_id).must_equal "mssql_session:User:sa:Host:localhost:Database::Instance:SQL2012INSPEC"
    _(resource.user).must_equal "sa"
    _(resource.password).must_equal "yourStrong(!)Password"
    _(resource.host).must_equal "localhost"
    _(resource.port).must_equal "1691"
    _(resource.instance).must_equal "SQL2012INSPEC"
  end

  it "verify mssql_session configuration with custom sqlserver port and user in domain" do
    resource = load_resource("mssql_session", user: 'DOMAIN\sa', password: "yourStrong(!)Password", host: "localhost", port: "1533")
    _(resource.user).must_equal 'DOMAIN\sa'
    _(resource.password).must_equal "yourStrong(!)Password"
    _(resource.host).must_equal "localhost"
    _(resource.port).must_equal "1533"
  end

  it "verify mssql_session configuration with port explicitly nil" do
    resource = load_resource("mssql_session", user: "sa", password: "yourStrong(!)Password", host: "localhost", port: nil)
    _(resource.user).must_equal "sa"
    _(resource.password).must_equal "yourStrong(!)Password"
    _(resource.host).must_equal "localhost"
    _(resource.port).must_be_nil
  end

  it "verify mssql_session configuration with local mode" do
    resource = load_resource("mssql_session", local_mode: true)
    _(resource.user).must_be_nil
    _(resource.password).must_be_nil
    _(resource.host).must_be_nil
    _(resource.port).must_be_nil
    _(resource.local_mode).must_equal true
  end

  it "run a SQL query" do
    resource = load_resource("mssql_session", user: "sa", password: "yourStrong(!)Password", host: "localhost", port: "1433")
    query = resource.query("SELECT SERVERPROPERTY('ProductVersion') as result")
    _(query.size).must_equal 1
    _(query.row(0).column("result").value).must_equal "14.0.600.250"
  end

  it "run a SQL query with multiline output" do
    resource = quick_resource(:mssql_session, :linux, user: "sa", password: "yourStrong(!)Password", host: "localhost", port: "1433") do |cmd|
      cmd.strip!
      case cmd
      when "sqlcmd -Q \"set nocount on; SELECT * FROM example as result\" -W -w 1024 -s ',' -U 'sa' -P 'yourStrong(!)Password' -S 'localhost,1433'" then
        stdout_file "test/fixtures/cmd/mssql-multiline-result"
      else
        raise cmd.inspect
      end
    end

    query = resource.query("SELECT * FROM example as result")
    _(query.row(1).column("result").value).must_include "multiline"
  end
end
