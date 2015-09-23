# encoding utf-8

require 'helper'
require 'vulcano/resource'

describe 'Vulcano::Resources::Service' do

  # windows
  it 'verify service parsing' do
    resource = MockLoader.new(:windows).load_resource('service', 'dhcp')
    srv = { name: 'dhcp', description: 'DHCP Client', installed: true, running: true, enabled: true, type: 'windows' }
    _(resource.info).must_equal srv
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
  end
  # unknown OS
  it 'verify package handling on unsupported os' do
    resource = MockLoader.new(:undefined).load_resource('service', 'dhcp')
    _(resource.installed?).must_equal false
    _(resource.info).must_equal nil
  end
end
