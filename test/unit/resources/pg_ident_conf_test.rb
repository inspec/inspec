# encoding: utf-8
# copyright: 2017
# author: Aaron Lippold, lippold@gmail.com
# author: Rony Xavier, rx294@nyu.edu
# license: All rights reserved

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::PGIdentConf' do
  describe 'PGIdentConf Paramaters' do
    it 'Verify pg_ident_conf parsing `map_name.first` - "ssl-test"' do
      resource = load_resource('pg_ident_conf')
      _(resource.map_name.first).must_match 'ssl-test'
    end

    it 'Verify pg_ident_conf parsing `system_username.first` - "acme_user@inventory_hostname"' do
      resource = load_resource('pg_ident_conf')
      _(resource.system_username.first).must_match 'acme_user@inventory_hostname'
    end

    it 'Verify pg_ident_conf parsing `pg_username.first` - "acme_user"' do
      resource = load_resource('pg_ident_conf')
      _(resource.pg_username.first).must_match 'acme_user'
    end
  end
end
