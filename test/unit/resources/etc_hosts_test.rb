# encoding: utf-8
# author: Matthew Dromazos

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::EtcHosts' do
  let(:resource) { load_resource('etc_hosts') }
  it 'Verify etc_hosts filtering by `ip_address`'  do
    entries = resource.where { ip_address == '127.0.0.1' }
    _(entries.primary_name).must_equal ['localhost']
    _(entries.all_host_names).must_equal [['localhost', 'localhost.localdomain', 'localhost4', 'localhost4.localdomain4']]
  end

  it 'Verify etc_hosts filtering by `canonical_hostname`'  do
    entries = resource.where { primary_name == 'localhost' }
    _(entries.ip_address).must_equal ['127.0.0.1', '::1']
    _(entries.all_host_names).must_equal [['localhost', 'localhost.localdomain', 'localhost4', 'localhost4.localdomain4'],  ['localhost', 'localhost.localdomain', 'localhost6', 'localhost6.localdomain6']]
  end

  it 'Verify etc_hosts filtering by `all_host_names`'  do
    entries = resource.where { all_host_names == ['localhost', 'localhost.localdomain', 'localhost4', 'localhost4.localdomain4'] }
    _(entries.ip_address).must_equal ['127.0.0.1']
    _(entries.primary_name).must_equal ['localhost']
  end

  it 'Verify etc_hosts with no `all_host_names`'  do
    entries = resource.where { ip_address == '127.0.0.5'}
    _(entries.primary_name).must_equal ['randomhost']
    _(entries.all_host_names).must_equal [['randomhost']]
  end
end
