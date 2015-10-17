# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'vulcano/resource'

describe 'Vulcano::Resources::RegistryKey' do
  let(:resource) { load_resource('registry_key', 'Task Scheduler', 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Schedule') }
  let(:resource_without_name) { load_resource('registry_key', 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Schedule') }

  it 'read reg key with human readable name' do
    _(resource.Start).must_equal 2
  end

  it 'read reg key without human readable name' do
    _(resource_without_name.Start).must_equal 2
  end
end
