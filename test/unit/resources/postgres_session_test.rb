# encoding: utf-8
# author: Aaron Lippold

require 'helper'

describe 'Inspec::Resources::PostgresSession' do
  it 'verify postgres_session basic init configuration' do
    resource = load_resource('postgres_session','myuser','mypass','127.0.0.1')
      _(resource.user).must_equal "myuser"
      _(resource.pass).must_equal "mypass"
      _(resource.host).must_equal "127.0.0.1"
  end

  it 'verify postgres_session create_psql_cmd function' do
    resource = load_resource('postgres_session','myuser','mypass','127.0.0.1')
      _(resource.create_psql_cmd("SELECT * FROM STUDENTS;",['testdb'])).must_equal "PGPASSWORD='mypass' psql -U myuser -d testdb -h 127.0.0.1 -A -t -c SELECT\\ \\*\\ FROM\\ STUDENTS\\;"
      _(resource.db).must_equal ['testdb']
  end

  it 'verify postgres_session escaped_query function' do
    resource = load_resource('postgres_session','myuser','mypass','127.0.0.1')
      _(resource.escaped_query("SELECT * FROM STUDENTS;")).must_equal "SELECT\\ \\*\\ FROM\\ STUDENTS\\;"
    resource = load_resource('postgres_session','myuser','mypass','127.0.0.1')
      _(resource.escaped_query("SELECT current_setting('client_min_messages')")).must_equal "SELECT\\ current_setting\\(\\'client_min_messages\\'\\)"
  end
end
