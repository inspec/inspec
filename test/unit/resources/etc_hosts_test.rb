# encoding: utf-8
# author: Matthew Dromazos

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::EtcHosts' do
  let(:resource) { load_resource('etc_hosts') }
  it 'Verify etc_hosts filtering by `ip_address`'  do
    entries = resource.where { ip_address == '127.0.0.1' }
    _(entries.canonical_hostname).must_equal ['localhost']
    _(entries.aliases_list).must_equal [['localhost.localdomain', 'localhost4', 'localhost4.localdomain4']]
  end

  it 'Verify etc_hosts filtering by `canonical_hostname`'  do
    entries = resource.where { canonical_hostname == 'localhost' }
    _(entries.ip_address).must_equal ['127.0.0.1', '::1']
    _(entries.aliases_list).must_equal [['localhost.localdomain', 'localhost4', 'localhost4.localdomain4'],  ['localhost.localdomain', 'localhost6', 'localhost6.localdomain6']]
  end

  it 'Verify etc_hosts filtering by `aliases_list`'  do
    entries = resource.where { aliases_list == ['localhost.localdomain', 'localhost4', 'localhost4.localdomain4'] }
    _(entries.ip_address).must_equal ['127.0.0.1']
    _(entries.canonical_hostname).must_equal ['localhost']
  end

  it 'Verify etc_hosts with no `aliases_list`'  do
    entries = resource.where { ip_address == '127.0.0.5'}
    _(entries.canonical_hostname).must_equal ['randomhost']
    _(entries.canonical_hostname).must_equal ['']
  end
end
