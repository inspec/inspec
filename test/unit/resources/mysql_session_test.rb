
require 'helper'
require 'inspec/resource'
require 'inspec/resources/mysql_session'

describe 'Inspec::Resources::MysqlSession' do
  it 'verify mysql_session escaped login details with single quotes correctly' do
    resource = load_resource('mysql_session',
                             'root',
                             %q{'%"'"&^*&()'*%})
    _(resource.send(:create_mysql_cmd, 'SELECT 1 FROM DUAL;').must_equal(%q{mysql -uroot -p\'\%\"\'\"\&\^\*\&\(\)\'\*\% -h localhost -s -e "SELECT 1 FROM DUAL;"}))
  end
  it 'verify mysql_session omits optional username and password' do
    resource = load_resource('mysql_session')
    _(resource.send(:create_mysql_cmd, 'SELECT 1 FROM DUAL;').must_equal('mysql -h localhost -s -e "SELECT 1 FROM DUAL;"'))
  end
end
