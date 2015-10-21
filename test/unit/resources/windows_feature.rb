# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'vulcano/resource'

describe 'Vulcano:Resources::Feature' do

  it 'verify windows feature parsing' do
    resource = MockLoader.new(:windows).load_resource('windows_feature', 'dhcp')
    pkg = { name: 'DHCP', description: 'Dynamic Host Configuration Protocol (DHCP) Server enables you to centrally configure, manage, and provide temporary IP addresses and related information for client computers.', installed: false, type: 'windows-feature' }
    _(resource.info).must_equal pkg
    _(resource.installed?).must_equal false
  end

  it 'windows feature on Ubuntu' do
    resource = MockLoader.new(:ubuntu1404).load_resource('windows_feature', 'powershell')
    pkg = { name: 'powershell', type: 'windows-feature' }
    _(resource.info).must_equal pkg
    _(resource.installed?).must_equal false
  end

  it 'windows feature on undefined os' do
    resource = MockLoader.new(:undefined).load_resource('windows_feature', 'powershell')
    pkg = { name: 'powershell', type: 'windows-feature' }
    _(resource.info).must_equal pkg
    _(resource.installed?).must_equal false
  end
end
