
require 'helper'
require 'inspec/resource'
require 'inspec/resources/etc_hosts_allow_deny'

describe 'Inspec::Resources::EtcHostsAllow' do
  describe 'EtcHostsAllow Paramaters' do
    resource = load_resource('etc_hosts_allow')
    it 'Verify etc_hosts_allow filtering by `daemon`'  do
      entries = resource.where { daemon == 'ALL' }
      _(entries.client_list).must_include ['127.0.0.1', '[::1]']
      _(entries.options).must_equal [[]]
    end
    it 'Verify etc_hosts_allow filtering by `client_list`'  do
      entries = resource.where { client_list == ['127.0.1.154',  '[:fff:fAb0::]'] }
      _(entries.daemon).must_equal ['vsftpd', 'sshd']
      _(entries.options).must_include ['deny', '/etc/bin/']
    end
    it 'Verify etc_hosts_allow filtering by `options`'  do
      entries = resource.where { options == ['deny', '/etc/bin/'] }
      _(entries.daemon).must_equal ['vsftpd', 'sshd']
      _(entries.client_list).must_include ['127.0.1.154',  '[:fff:fAb0::]']
    end
  end

  describe '#parse_line' do
    resource = load_resource('etc_hosts_allow')
    it 'parses a line with multiple clients' do
      line = 'foo: client1, client2 : some_option'
      entry_properties = resource.send(:parse_line, line)
      _(entry_properties['daemon']).must_equal 'foo'
      _(entry_properties['client_list']).must_equal ['client1', 'client2']
    end

    it 'parses a line with one option' do
      line = 'foo: client1, client2 : some_option'
      entry_properties = resource.send(:parse_line, line)
      _(entry_properties['daemon']).must_equal 'foo'
      _(entry_properties['client_list']).must_equal ['client1', 'client2']
      _(entry_properties['options']).must_equal ['some_option']
    end

    it 'parses a line with multiple options' do
      line = 'foo: client1, client2 : some_option : other_option'
      entry_properties = resource.send(:parse_line, line)
      _(entry_properties['daemon']).must_equal 'foo'
      _(entry_properties['client_list']).must_equal ['client1', 'client2']
      _(entry_properties['options']).must_equal ['some_option', 'other_option']
    end
  end
end

describe 'Inspec::Resources::EtcHostsDeny' do
  describe 'EtcHostsDeny Paramaters' do
    resource = load_resource('etc_hosts_deny')
    it 'Verify etc_hosts_deny filtering by `daemon`'  do
      entries = resource.where { daemon == 'ALL' }
      _(entries.client_list).must_include ['127.0.0.1', '[::1]']
      _(entries.options).must_equal [[]]
    end
    it 'Verify etc_hosts_deny filtering by `client_list`'  do
      entries = resource.where { client_list == ['127.0.1.154',  '[:fff:fAb0::]'] }
      _(entries.daemon).must_equal ['vsftpd', 'sshd']
      _(entries.options).must_include ['deny', '/etc/bin/']
    end
    it 'Verify etc_hosts_deny filtering by `options`'  do
      entries = resource.where { options == ['deny', '/etc/bin/'] }
      _(entries.daemon).must_equal ['vsftpd', 'sshd']
      _(entries.client_list).must_include ['127.0.1.154',  '[:fff:fAb0::]']
    end
  end
end
