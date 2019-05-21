
require 'helper'

describe 'Inspec::Resources::Iptables' do

  # ubuntu 14.04
  it 'verify iptables on ubuntu' do
    resource = MockLoader.new(:ubuntu1404).load_resource('iptables')
    _(resource.has_rule?('-P OUTPUT ACCEPT')).must_equal true
    _(resource.has_rule?('-P OUTPUT DROP')).must_equal false
  end

  it 'verify iptables with comments on ubuntu' do
    resource = MockLoader.new(:ubuntu1404).load_resource('iptables')
    _(resource.has_rule?('-A INPUT -i eth0 -p tcp -m tcp --dport 80 -m state --state NEW -m comment --comment "http like its 1990" -j ACCEPT')).must_equal true
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
