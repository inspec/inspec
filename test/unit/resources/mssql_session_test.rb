# encoding: utf-8
# author: Nolan Davidson

require 'helper'

describe 'Inspec::Resources::MssqlSession' do
  it 'verify mssql_session configuration' do
    resource = load_resource('mssql_session', user: 'myuser', pass: 'mypass', host: 'windowshost')
    _(resource.user).must_equal 'myuser'
    _(resource.pass).must_equal 'mypass'
    _(resource.host).must_equal 'windowshost'
  end
end
