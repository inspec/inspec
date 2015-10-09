# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'vulcano/resource'

describe 'Vulcano::Resources::Bridge' do

  it 'check linux bridge' do
    resource = MockLoader.new(:ubuntu1404).load_resource('bridge', 'br0')
    _(resource.exists?).must_equal true

    # check network interfaced attached to bridge
    _(resource.has_interface?('eth0')).must_equal false
    _(resource.has_interface?('eth1')).must_equal true
    _(resource.has_interface?('eth2')).must_equal true

    # get associated interfaces
    _(resource.interfaces).must_equal %w{eth1 eth2}
  end
end
