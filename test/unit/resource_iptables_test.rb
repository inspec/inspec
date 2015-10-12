# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'vulcano/resource'

describe 'Vulcano::Resources::Iptables' do

  # ubuntu 14.04
  it 'verify iptables on ubuntu' do
    resource = MockLoader.new(:ubuntu1404).load_resource('iptables')
    _(resource.has_rule?('-P OUTPUT ACCEPT')).must_equal true
    _(resource.has_rule?('-P OUTPUT DROP')).must_equal false
  end

  it 'verify iptables on windows' do
    resource = MockLoader.new(:windows).load_resource('iptables')
    _(resource.has_rule?('-P OUTPUT ACCEPT')).must_equal false
    _(resource.has_rule?('-P OUTPUT DROP')).must_equal false
  end

  # undefined
  it 'verify iptables on unsupported os' do
    resource = MockLoader.new(:undefined).load_resource('iptables')
    _(resource.has_rule?('-P OUTPUT ACCEPT')).must_equal false
    _(resource.has_rule?('-P OUTPUT DROP')).must_equal false
  end

end
