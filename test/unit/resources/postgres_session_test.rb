require "helper"
require "inspec/resource"
require "inspec/resources/postgres_session"
require "inspec/resources/command"

describe "Inspec::Resources::PostgresSession" do
  it "verify postgres_session create_psql_cmd with a basic query" do
    resource = load_resource("postgres_session", "myuser", "mypass", "127.0.0.1", 5432)
    _(resource.send(:create_psql_cmd, "SELECT * FROM STUDENTS;", ["testdb"])).must_equal "PGPASSWORD='mypass' psql -U myuser -d testdb -h 127.0.0.1 -p 5432 -A -t -c SELECT\\ \\*\\ FROM\\ STUDENTS\\;"
  end
  it "verify postgres_session escaped_query with a complex query" do
    resource = load_resource("postgres_session", "myuser", "mypass", "127.0.0.1", 5432)
    _(resource.send(:create_psql_cmd, "SELECT current_setting('client_min_messages')", ["testdb"])).must_equal "PGPASSWORD='mypass' psql -U myuser -d testdb -h 127.0.0.1 -p 5432 -A -t -c SELECT\\ current_setting\\(\\'client_min_messages\\'\\)"
  end
  it "verify postgres_session redacts output" do
    cmd = %q{PGPASSWORD='mypass' psql -U myuser -d testdb -h 127.0.0.1 -p 5432 -A -t -c "SELECT current_setting('client_min_messages')"}
    options = { redact_regex: /(PGPASSWORD=').+(' psql .*)/ }
    resource = load_resource("command", cmd, options)

    expected_to_s = %q{Command: `PGPASSWORD='REDACTED' psql -U myuser -d testdb -h 127.0.0.1 -p 5432 -A -t -c "SELECT current_setting('client_min_messages')"`}
    _(resource.to_s).must_equal(expected_to_s)
  end
  it "verify postgres_session works with empty port value" do
    resource = load_resource("postgres_session", "myuser", "mypass", "127.0.0.1")
    _(resource.send(:create_psql_cmd, "SELECT * FROM STUDENTS;", ["testdb"])).must_equal "PGPASSWORD='mypass' psql -U myuser -d testdb -h 127.0.0.1 -p 5432 -A -t -c SELECT\\ \\*\\ FROM\\ STUDENTS\\;"
  end
  it "verify postgres_session works with empty host and port value" do
    resource = load_resource("postgres_session", "myuser", "mypass")
    _(resource.send(:create_psql_cmd, "SELECT * FROM STUDENTS;", ["testdb"])).must_equal "PGPASSWORD='mypass' psql -U myuser -d testdb -h localhost -p 5432 -A -t -c SELECT\\ \\*\\ FROM\\ STUDENTS\\;"
  end
end
