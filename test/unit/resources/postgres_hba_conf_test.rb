# copyright: 2017

require 'helper'

describe 'Inspec::Resources::PGHbaConf' do
  describe 'PGHbaConf Paramaters' do
    resource = load_resource('postgres_hba_conf', '/test/path/to/postgres/pg_hba.conf')

    it 'Verify postgres_hba_conf filtering by `type`'  do
      entries = resource.where { type == 'local' }
      _(entries.database).must_include 'all'
      _(entries.auth_method).must_equal ['peer']
    end
    it 'Verify postgres_hba_conf filtering by `database`'  do
      entries = resource.where { database == 'acme_test' }
      _(entries.type).must_include 'host'
      _(entries.user).must_include 'all'
    end
    it 'Verify postgres_hba_conf filtering by `auth_method`'  do
      entries = resource.where { auth_method == 'cert' }
      _(entries.type).must_include 'hostssl'
      _(entries.database).must_include 'acme_test'
    end
    it 'Verify postgres_hba_conf properties'  do
      _(resource.auth_method).must_include 'cert'
      _(resource.database).must_include 'acme_test'
      _(resource.type).must_include 'hostssl'
    end
    it 'parses the pg_hba.conf file correctly' do
      _(resource.type).must_equal ["local", "host", "host", "host", "host", "hostssl", "hostssl", "hostssl", "hostssl"]
      _(resource.database).must_equal ["all", "acme_test_db", "acme_test_db", "acme_test", "acme_test", "acme_test_db", "acme_test_db", "acme_test", "acme_test"]
      _(resource.user).must_equal ["all", "all", "all", "all", "all", "all", "all", "all", "all"]
      _(resource.address).must_equal ["", "::1/0", "127.0.0.1/0", "::1/0", "127.0.0.1/0", "::/0", "0.0.0.0/0", "::/0", "0.0.0.0/0"]
      _(resource.auth_method).must_equal ["peer", "md5", "md5", "md5", "md5", "cert", "cert", "cert", "cert"]
      _(resource.auth_params).must_equal ["", "",  "",  "",  "",  "clientcert=1 map=ssl-test",  "clientcert=1 map=ssl-test",  "clientcert=1 map=ssl-test",  "clientcert=1 map=ssl-test"]
    end
  end
end
