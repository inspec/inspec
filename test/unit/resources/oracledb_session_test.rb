require 'helper'

describe 'Inspec::Resources::OracledbSession' do
  it 'verify oracledb_session configuration' do
    resource = load_resource('oracledb_session', user: 'SYSTEM', password: 'supersecurepass', host: 'localhost', service: 'ORCL.localdomain')
    _(resource.user).must_equal 'SYSTEM'
    _(resource.password).must_equal 'supersecurepass'
    _(resource.host).must_equal 'localhost'
    _(resource.service).must_equal 'ORCL.localdomain'
  end

  it 'run a SQL query' do
    resource = load_resource('oracledb_session', user: 'SYSTEM', password: 'supersecurepass', host: '127.0.0.1', service: 'ORCL.localdomain', port: 1527)
    query = resource.query('SELECT NAME AS VALUE FROM v$database;')
    _(query.size).must_equal 1
    _(query.row(0).column('value').value).must_equal 'ORCL'
  end
end
