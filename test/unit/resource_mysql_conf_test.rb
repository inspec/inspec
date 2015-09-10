# encoding: utf-8
require 'helper'

describe 'Vulcano::Resources::MysqlConf' do
  describe 'mysql_conf' do
    let(:resource) { loadResource('mysql_conf', '/etc/mysql/my.cnf') }

    it 'verify mysql.conf config parsing' do
      _(resource.client['port']).must_equal '3306'
      _(resource.mysqld['user']).must_equal 'mysql'
      _(resource.mysqld['key_buffer_size']).must_equal '16M'
    end
  end
end
