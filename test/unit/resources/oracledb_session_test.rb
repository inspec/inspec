# encoding: utf-8
# author: Nolan Davidson
# author: Aaron Lippold

require 'helper'

describe 'Inspec::Resources::OracledbSession' do
  it 'verify oracledb_session configuration' do
    resource = load_resource('oracledb_session', user: 'myuser', password: 'mypass', host: 'oraclehost', sid: 'mysid')
    _(resource.user).must_equal 'myuser'
    _(resource.password).must_equal 'mypass'
    _(resource.host).must_equal 'oraclehost'
    _(resource.sid).must_equal 'mysid'
    _(resource.sqlplus_bin).must_equal 'sqlplus'
  end
end
