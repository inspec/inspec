
require 'helper'
require 'inspec/resource'
require 'inspec/resources/postgres_ident_conf'
require 'inspec/resources/directory'

describe 'Inspec::Resources::PGIdentConf' do
  describe 'PGIdentConf Paramaters' do
    resource = load_resource('postgres_ident_conf')
    it 'Verify postgres_ident_conf filtering by `system_username`'  do
      entries = resource.where { system_username == 'bryanh' }
      _(entries.map_name).must_equal ['omicron']
      _(entries.pg_username).must_equal ['bryanh']
    end
    it 'Verify postgres_ident_conf filtering by `map_name`'  do
      entries = resource.where { map_name == 'ssl-test' }
      _(entries.system_username).must_equal ['ann']
      _(entries.pg_username).must_equal ['ann']
    end
    it 'Verify postgres_ident_conf filtering by `pg_username`'  do
      entries = resource.where { pg_username == 'bob' }
      _(entries.map_name).must_equal ['pki-users']
      _(entries.system_username).must_equal ['robert']
    end
  end
end
