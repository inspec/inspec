# encoding: utf-8
# author: Matthew Dromazos

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::EtcHostsAllow' do
  describe 'EtcHostsAllow Paramaters' do
    resource = load_resource('etc_hosts_allow')
    it 'Verify etc_hosts_allow filtering by `daemon_list`'  do
      entries = resource.where { daemon_list == ['ALL'] }
      _(entries.client_list.flatten).must_equal ['127.0.0.1', '[::1]']
      _(entries.options.flatten).must_equal []
    end
    it 'Verify etc_hosts_allow filtering by `client_list`'  do
      entries = resource.where { client_list == ['127.0.1.154',  '[:fff:fAb0::]'] }
      _(entries.daemon_list.flatten).must_equal ['UNKNOWN', 'sshd']
      _(entries.options.flatten).must_equal ['deny', '/etc/bin/']
    end
    it 'Verify etc_hosts_allow filtering by `options`'  do
      entries = resource.where { options == ['deny', '/etc/bin/'] }
      _(entries.daemon_list.flatten).must_equal ['UNKNOWN', 'sshd']
      _(entries.client_list.flatten).must_equal ['127.0.1.154',  '[:fff:fAb0::]']
    end
  end
end
