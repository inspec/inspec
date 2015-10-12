# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'vulcano/resource'

describe 'Vulcano::Resources::Bond' do

  it 'check linux bond on ubuntu' do
    resource = MockLoader.new(:ubuntu1404).load_resource('bond', 'bond0')
    # bond must be available
    resource.exist?.must_equal true
    # eth0 is part of bond
    _(resource.has_interface?('eth0')).must_equal true
    _(resource.has_interface?('eth1')).must_equal false
    _(resource.has_interface?('eth2')).must_equal true
    # get all interfaces
    _(resource.interfaces).must_equal %w{eth0 eth2}
    # get proc content
    _(resource.content).wont_equal nil
    _(resource.content).wont_equal ''
  end
end
