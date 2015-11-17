# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::RegistryKey' do
  it 'read reg key with human readable name' do
    resource = MockLoader.new(:windows).load_resource('registry_key', 'Task Scheduler', 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Schedule')
    _(resource.Start).must_equal 2
  end

  it 'read reg key without human readable name' do
    resource_without_name = MockLoader.new(:windows).load_resource('registry_key', 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Schedule')
    _(resource_without_name.Start).must_equal 2
  end
end
