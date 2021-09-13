require "helper"
require "inspec/resource"
require "inspec/resources/postgres_session"
require "inspec/resources/command"

describe "Inspec::Resources::PostgresSession" do
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
  it "fails when no connection established" do
    resource = load_resource("postgres_session", "postgres", "postgres", "localhost", 5432)
    _(proc { resource.send(:query, "Select 5;", ["mydatabase"]) }).must_raise Inspec::Exceptions::ResourceFailed
  end
end
