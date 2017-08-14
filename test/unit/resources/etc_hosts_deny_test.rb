# encoding: utf-8
# author: Matthew Dromazos

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::EtcHostsDeny' do
  describe 'EtcHostsDeny Paramaters' do
    resource = load_resource('etc_hosts_deny')
    it 'Verify etc_hosts_deny filtering by `daemon_list`'  do
      entries = resource.where { daemon_list == ['ALL'] }
      _(entries.client_list).must_equal [['127.0.0.1', '[::1]']]
      _(entries.options).must_equal [[]]
    end
    it 'Verify etc_hosts_deny filtering by `client_list`'  do
      entries = resource.where { client_list == ['127.0.1.154',  '[:fff:fAb0::]'] }
      _(entries.daemon_list).must_equal [['UNKNOWN', 'sshd']]
      _(entries.options).must_equal [['deny', '/etc/bin/']]
    end
    it 'Verify etc_hosts_deny filtering by `options`'  do
      entries = resource.where { options == ['deny', '/etc/bin/'] }
      _(entries.daemon_list).must_equal [['UNKNOWN', 'sshd']]
      _(entries.client_list).must_equal [['127.0.1.154',  '[:fff:fAb0::]']]
    end
  end
end
