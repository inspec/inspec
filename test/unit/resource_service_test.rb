# encoding utf-8

require 'helper'
require 'vulcano/resource'

describe 'Vulcano::Resources::Service' do
  # TODO: make OS dependent
  let(:resource) { load_resource('service', 'dhcp') }

  # windows
  # it 'verify service parsing' do
  #   pkg = { name: 'dhcp', description: 'DHCP Client', installed: true, running: true, enabled: true, type: 'windows' }
  #   _(resource.info).must_equal pkg
  #   _(resource.installed?).must_equal true
  #   _(resource.enabled?).must_equal true
  #   _(resource.running?).must_equal true
  # end
end
