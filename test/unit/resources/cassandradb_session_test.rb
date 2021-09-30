require "helper"
require "inspec/resource"
require "inspec/resources/cassandradb_session"

describe "Inspec::Resources::CassandradbSession" do
  it "verify cassandradb_session configuration" do
    resource = load_resource("cassandradb_session", host: "localhost", port: 9042)
    _(resource.resource_failed?).must_equal false
    _(resource.user).must_equal "cassandra"
    _(resource.password).must_equal "cassandra"
    _(resource.host).must_equal "localhost"
    _(resource.port).must_equal 9042
  end

  it "success when connection is estalished" do
    resource = quick_resource(:cassandradb_session, :linux, user: "USER", password: "rightpassword", host: "localhost", port: 9042) do |cmd|
      cmd.strip!
      case cmd
      when "cqlsh localhost 9042 -u USER -p rightpassword --execute 'SELECT cluster_name FROM system.local'" then
        stdout_file "test/fixtures/cmd/cassandra-connection-success"
      else
        raise cmd.inspect
      end
    end

    _(resource.resource_failed?).must_equal false
    query = resource.query("SELECT cluster_name FROM system.local")
    _(query.exit_status).must_equal 0
    _(query.output).must_match(/Test Cluster/)
  end

  it "fails when no connection established" do
    resource = quick_resource(:cassandradb_session, :linux, user: "USER", password: "wrongpassword", host: "localhost", port: 1234) do |cmd|
      cmd.strip!
      case cmd
      when "cqlsh localhost 1234 -u USER -p wrongpassword --execute 'SELECT cluster_name FROM system.local'" then
        stdout_file "test/fixtures/cmd/cassandra-connection-error"
      else
        raise cmd.inspect
      end
      ex = assert_raises(Inspec::Exceptions::ResourceFailed) { resource.query("SELECT cluster_name FROM system.local") }
      _(ex.message).must_include("Cassandra query with errors")
    end
  end

  it "does not fails auth when no user or no password is provided" do
    resource = quick_resource(:cassandradb_session, :linux)
    _(resource.resource_failed?).must_equal false
  end

end
