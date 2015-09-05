# encoding: utf-8

require 'helper'
require 'vulcano/resource'

describe 'Vulcano::Resources::RegistryKey' do
  describe 'registry_key' do
    let(:resource) { loadResource('registry_key', 'Task Scheduler', 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Schedule') }
    let(:resource_without_name) { loadResource('registry_key', 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Schedule') }

    it 'read reg key with human readable name' do
      _(resource.Start).must_equal 2
    end

    it 'read reg key without human readable name' do
      _(resource_without_name.Start).must_equal 2
    end
  end
end
