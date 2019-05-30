
require 'helper'
require 'inspec/resource'
require 'inspec/resources/postgres_session'

describe 'Inspec::Resources::PostgresSession' do
  it 'verify postgres_session create_psql_cmd with a basic query' do
    resource = load_resource('postgres_session','myuser','mypass','127.0.0.1')
    _(resource.send(:create_psql_cmd, "SELECT * FROM STUDENTS;",['testdb'])).must_equal "PGPASSWORD='mypass' psql -U myuser -d testdb -h 127.0.0.1 -A -t -c SELECT\\ \\*\\ FROM\\ STUDENTS\\;"
  end
  it 'verify postgres_session escaped_query with a complex query' do
    resource = load_resource('postgres_session','myuser','mypass','127.0.0.1')
    _(resource.send(:create_psql_cmd, "SELECT current_setting('client_min_messages')",['testdb'])).must_equal "PGPASSWORD='mypass' psql -U myuser -d testdb -h 127.0.0.1 -A -t -c SELECT\\ current_setting\\(\\'client_min_messages\\'\\)"
  end
end
