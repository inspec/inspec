# encoding: utf-8
# author: Matthew Dromazos

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::Fstab' do
  let(:resource) { load_resource('etc_hosts') }
  it 'Verify etc_hosts filtering by `device_name`'  do
    entries = resource.where { device_name == '/dev/mapper/vg1-lv_root' }
    _(entries.mount_point).must_equal ['/']
    _(entries.file_system_type).must_equal ['xfs']
    _(entries.mount_options).must_equal [['defaults', 'x-systemd.device-timeout=0']]
    _(entries.dump_options).must_equal [0]
    _(entries.file_system_options).must_equal [0]
  end

  it 'Verify etc_hosts filtering by `mount_point`'  do
    entries = resource.where { mount_point == 'localhost' }
    _(entries.ip_address).must_equal ['127.0.0.1', '::1']
    _(entries.aliases_list).must_equal [['localhost.localdomain', 'localhost4', 'localhost4.localdomain4'],  ['localhost.localdomain', 'localhost6', 'localhost6.localdomain6']]
  end

  it 'Verify etc_hosts filtering by `file_system_type`'  do
    entries = resource.where { aliases_list == ['localhost.localdomain', 'localhost4', 'localhost4.localdomain4'] }
    _(entries.ip_address).must_equal ['127.0.0.1']
    _(entries.canonical_hostname).must_equal ['localhost']
  end

  it 'Verify etc_hosts filtering by `mount_options`'  do
    entries = resource.where { ip_address == '127.0.0.1' }
    _(entries.canonical_hostname).must_equal ['localhost']
    _(entries.aliases_list).must_equal [['localhost.localdomain', 'localhost4', 'localhost4.localdomain4']]
  end

  it 'Verify etc_hosts filtering by `dump_options`'  do
    entries = resource.where { canonical_hostname == 'localhost' }
    _(entries.ip_address).must_equal ['127.0.0.1', '::1']
    _(entries.aliases_list).must_equal [['localhost.localdomain', 'localhost4', 'localhost4.localdomain4'],  ['localhost.localdomain', 'localhost6', 'localhost6.localdomain6']]
  end

  it 'Verify etc_hosts filtering by `file_system_options`'  do
    entries = resource.where { aliases_list == ['localhost.localdomain', 'localhost4', 'localhost4.localdomain4'] }
    _(entries.ip_address).must_equal ['127.0.0.1']
    _(entries.canonical_hostname).must_equal ['localhost']
  end

  it 'verify firewalld is installed' do
    resource = load_resource('firewalld')
    _(resource.installed?).must_equal true
  end

  it 'verify firewalld detects a zone' do
    resource = load_resource('firewalld')
    resource.stubs(:has_zone?).with('public').returns(true)
    resource.stubs(:has_zone?).with('zonenotinfirewalld').returns(false)
  end

  it 'verity firewalld is running' do
    resource = load_resource('firewalld')
    _(resource.installed?).must_equal true
  end
end
