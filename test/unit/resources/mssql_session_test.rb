# encoding: utf-8
# author: Nolan Davidson
# author: Christoph Hartmann

require 'helper'

describe 'Inspec::Resources::MssqlSession' do
  it 'verify mssql_session configuration' do
    resource = load_resource('mssql_session', user: 'sa', password: 'yourStrong(!)Password', host: 'localhost')
    _(resource.user).must_equal 'sa'
    _(resource.password).must_equal 'yourStrong(!)Password'
    _(resource.host).must_equal 'localhost'
  end

  it 'verify mssql_session configuration with custom sqlserver port and user in domain' do
    resource = load_resource('mssql_session', user: 'DOMAIN\sa', password: 'yourStrong(!)Password', host: 'localhost,1533')
    _(resource.user).must_equal 'DOMAIN\sa'
    _(resource.password).must_equal 'yourStrong(!)Password'
    _(resource.host).must_equal 'localhost,1533'
  end

  it 'run a SQL query' do
    resource = load_resource('mssql_session', user: 'sa', password: 'yourStrong(!)Password', host: 'localhost')
    query = resource.query("SELECT SERVERPROPERTY('ProductVersion') as result")
    _(query.size).must_equal 1
    _(query.row(0).column('result').value).must_equal '14.0.600.250'
  end
end
