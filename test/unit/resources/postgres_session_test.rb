require "helper"
require "inspec/resource"
require "inspec/resources/postgres_session"
require "inspec/resources/command"

describe "Inspec::Resources::PostgresSession" do
  it "generates the resource_id for the current resource" do
    resource = load_resource("postgres_session", "myuser", "mypass", "127.0.0.1", 5432)
    _(resource.resource_id).must_equal "postgress_session:User:myuser:Host:127.0.0.1"
  end
  it "generates the resource_id and verifies create_psql_cmd for passwords with special characters" do
    resource = load_resource("postgres_session", "myuser", "my@pa$ss", "127.0.0.1", 5432)
    _(resource.resource_id).must_equal "postgress_session:User:myuser:Host:127.0.0.1"
    _(resource.send(:create_psql_cmd, "SELECT * FROM STUDENTS;", ["testdb"])).must_equal "psql -d postgresql://myuser:my%40pa%24ss@127.0.0.1:5432/testdb -A -t -w -c SELECT\\ \\*\\ FROM\\ STUDENTS\\;"
  end
  it "verify postgres_session create_psql_cmd with a basic query" do
    resource = load_resource("postgres_session", "myuser", "mypass", "127.0.0.1", 5432)
    _(resource.send(:create_psql_cmd, "SELECT * FROM STUDENTS;", ["testdb"])).must_equal "psql -d postgresql://myuser:mypass@127.0.0.1:5432/testdb -A -t -w -c SELECT\\ \\*\\ FROM\\ STUDENTS\\;"
  end
  it "verify postgres_session escaped_query with a complex query" do
    resource = load_resource("postgres_session", "myuser", "mypass", "127.0.0.1", 5432)
    _(resource.send(:create_psql_cmd, "SELECT current_setting('client_min_messages')", ["testdb"])).must_equal "psql -d postgresql://myuser:mypass@127.0.0.1:5432/testdb -A -t -w -c SELECT\\ current_setting\\(\\'client_min_messages\\'\\)"
  end
  it "verify postgres_session redacts output" do
    cmd = %q{psql -d postgresql://myuser:mypass@127.0.0.1:5432/testdb -A -t -w -c "SELECT current_setting('client_min_messages')"}
    options = { redact_regex: %r{(:\/\/[a-z]*:).*(@)} }
    resource = load_resource("command", cmd, options)

    expected_to_s = %q{Command: `psql -d postgresql://myuser:REDACTED@127.0.0.1:5432/testdb -A -t -w -c "SELECT current_setting('client_min_messages')"`}
    _(resource.to_s).must_equal(expected_to_s)
  end
  it "verify postgres_session works with empty port value" do
    resource = load_resource("postgres_session", "myuser", "mypass", "127.0.0.1")
    _(resource.send(:create_psql_cmd, "SELECT * FROM STUDENTS;", ["testdb"])).must_equal "psql -d postgresql://myuser:mypass@127.0.0.1:5432/testdb -A -t -w -c SELECT\\ \\*\\ FROM\\ STUDENTS\\;"
  end
  it "verify postgres_session works with empty host and port value" do
    resource = load_resource("postgres_session", "myuser", "mypass")
    _(resource.send(:create_psql_cmd, "SELECT * FROM STUDENTS;", ["testdb"])).must_equal "psql -d postgresql://myuser:mypass@localhost:5432/testdb -A -t -w -c SELECT\\ \\*\\ FROM\\ STUDENTS\\;"
  end
  it "fails when no user, password" do
    resource = load_resource("postgres_session", nil, nil, "localhost", 5432)
    _(resource.resource_failed?).must_equal true
    _(resource.resource_exception_message).must_equal "Can't run PostgreSQL SQL checks without authentication."
  end
  it "verify postgres_session create_psql_cmd in socket connection" do
    resource = load_resource("postgres_session", "myuser", "mypass", "127.0.0.1", 5432, "/var/run/postgresql")
    _(resource.send(:create_psql_cmd, "SELECT * FROM STUDENTS;", ["testdb"])).must_equal "psql -d postgresql://myuser:mypass@/testdb?host=/var/run/postgresql -p 5432 -A -t -w -c SELECT\\ \\*\\ FROM\\ STUDENTS\\;"
  end
  it "verify postgres_session create_psql_cmd in socket connection" do
    resource = load_resource("postgres_session", "myuser", "mypass", "127.0.0.1", 1234, "/var/run/postgresql")
    _(resource.send(:create_psql_cmd, "SELECT * FROM STUDENTS;", ["testdb"])).must_equal "psql -d postgresql://myuser:mypass@/testdb?host=/var/run/postgresql -p 1234 -A -t -w -c SELECT\\ \\*\\ FROM\\ STUDENTS\\;"
  end

  it "encodes the password correctly" do
    resource = load_resource("postgres_session", "myuser", "my@pa$ss", "127.0.0.1", 5432)
    _(resource.send(:encoded_password, "my@pa$ss")).must_equal "my%40pa%24ss"
  end

  it "fails when no connection established in linux" do
    resource = quick_resource(:postgres_session, :linux, "postgres", "postgres", "localhost", 5432) do |cmd, opts|
      cmd.strip!
      case cmd
      when ("psql -d postgresql://postgres:postgres@localhost:5432/mydatabase -A -t -w -c Select\\ 5\\;") then
        result(nil, "test/fixtures/cmd/psql-connection-error", 1)
      else
        raise cmd.inspect
      end
    end
    ex = assert_raises(Inspec::Exceptions::ResourceFailed) { resource.query("Select 5;", ["mydatabase"]) }
    _(ex.message).must_include("PostgreSQL connection error")
  end

  it "fails when no password authentication fails" do
    resource = quick_resource(:postgres_session, :linux, "postgres", "wrongpassword", "localhost", 5432) do |cmd, opts|
      cmd.strip!
      case cmd
      when ("psql -d postgresql://postgres:wrongpassword@localhost:5432/mydatabase -A -t -w -c Select\\ 5\\;") then
        result(nil, "test/fixtures/cmd/psql-password-authentication-error", 1)
      else
        raise cmd.inspect
      end
    end
    ex = assert_raises(Inspec::Exceptions::ResourceFailed) { resource.query("Select 5;", ["mydatabase"]) }
    _(ex.message).must_include("PostgreSQL connection error")
  end

  it "fails when no password authentication fails with fatal message" do
    resource = quick_resource(:postgres_session, :linux, "postgres", "wrongpassword", "localhost", 5432) do |cmd, opts|
      cmd.strip!
      case cmd
      when ("psql -d postgresql://postgres:wrongpassword@localhost:5432/mydatabase -A -t -w -c Select\\ 5\\;") then
        result(nil, "test/fixtures/cmd/psql-password-authentication-fatal-error", 1)
      else
        raise cmd.inspect
      end
    end
    ex = assert_raises(Inspec::Exceptions::ResourceFailed) { resource.query("Select 5;", ["mydatabase"]) }
    _(ex.message).must_include("PostgreSQL connection error")
  end

  it "returns stderr as output if there is error in the query." do
    resource = quick_resource(:postgres_session, :linux, "postgres", "postgres", "localhost", 5432) do |cmd, opts|
      cmd.strip!
      case cmd
      when ("psql -d postgresql://postgres:postgres@localhost:5432/mydatabase -A -t -w -c DROP\\ TABLE\\ accounts\\;") then
        result(nil, "test/fixtures/cmd/psql-query-error", 1)
      else
        raise cmd.inspect
      end
    end

    _(resource.resource_failed?).must_equal false
    query = resource.query("DROP TABLE accounts;", ["mydatabase"])
    _(query.output).must_match(/must be owner of table accounts/)
  end

  it "fails when no connection established on Windows" do
    resource = quick_resource(:postgres_session, :windows, "postgres", "postgres", "localhost", 5432) do |cmd, opts|
      cmd.strip!
      case cmd
      when ("psql -d postgresql://postgres:postgres@localhost:5432/mydatabase -A -t -w -c \"Select 5;\"") then
        result(nil, "test/fixtures/cmd/psql-connection-error", 1)
      else
        raise cmd.inspect
      end
    end
    ex = assert_raises(Inspec::Exceptions::ResourceFailed) { resource.query("Select 5;", ["mydatabase"]) }
    _(ex.message).must_include("PostgreSQL connection error")
  end

  it "fails when no password authentication fails on Windows" do
    resource = quick_resource(:postgres_session, :windows, "postgres", "wrongpassword", "localhost", 5432) do |cmd, opts|
      cmd.strip!
      case cmd
      when ("psql -d postgresql://postgres:wrongpassword@localhost:5432/mydatabase -A -t -w -c \"Select 5;\"") then
        result(nil, "test/fixtures/cmd/psql-password-authentication-error", 1)
      else
        raise cmd.inspect
      end
    end
    ex = assert_raises(Inspec::Exceptions::ResourceFailed) { resource.query("Select 5;", ["mydatabase"]) }
    _(ex.message).must_include("PostgreSQL connection error")
  end

  it "returns stderr as output if there is error in the query on Windows." do
    resource = quick_resource(:postgres_session, :windows, "postgres", "postgres", "localhost", 5432) do |cmd, opts|
      cmd.strip!
      case cmd
      when ("psql -d postgresql://postgres:postgres@localhost:5432/mydatabase -A -t -w -c \"DROP TABLE accounts;\"") then
        result(nil, "test/fixtures/cmd/psql-query-error", 1)
      else
        raise cmd.inspect
      end
    end

    _(resource.resource_failed?).must_equal false
    query = resource.query("DROP TABLE accounts;", ["mydatabase"])
    _(query.output).must_match(/must be owner of table accounts/)
  end
end
