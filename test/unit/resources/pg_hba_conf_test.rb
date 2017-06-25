# encoding: utf-8
# copyright: 2017
# author: Aaron Lippold, lippold@gmail.com
# author: Rony Xavier, rx294@nyu.edu
# license: All rights reserved

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::PGHbaConf' do
  describe 'PGHbaConf Paramaters' do
    it 'Verify pg_hba_conf parsing `type.first` - "local"' do
      resource = load_resource('pg_hba_conf')
      _(resource.type.first).must_match 'local'
    end

    it 'Verify pg_hba_conf parsing `database.first` - "all"' do
      resource = load_resource('pg_hba_conf')
      _(resource.database.first).must_match 'all'
    end

    it 'Verify pg_hba_conf parsing `user.first` - "all"' do
      resource = load_resource('pg_hba_conf')
      _(resource.user.first).must_match 'all'
    end

    it 'Verify pg_hba_conf parsing `address.last` - "0.0.0.0/0"' do
      resource = load_resource('pg_hba_conf')
      _(resource.address.last).must_match "0.0.0.0/0"
    end

    it 'Verify pg_hba_conf parsing `auth_method.first` - "peer"' do
      resource = load_resource('pg_hba_conf')
      _(resource.auth_method.first).must_match 'peer'
    end

    it 'Verify pg_hba_conf parsing `auth_params.last` - "clientcert=1 map=ssl-test"' do
      resource = load_resource('pg_hba_conf')
      _(resource.auth_params.last).must_match "clientcert=1 map=ssl-test"
    end
  end
end
