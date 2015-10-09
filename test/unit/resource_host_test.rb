# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'vulcano/resource'

describe 'Vulcano::Resources::Host' do

  it 'check host on windows' do
    resource = MockLoader.new(:windows).load_resource('host', 'microsoft.com')
    _(resource.resolvable?).must_equal true
    _(resource.reachable?).must_equal false
    _(resource.ipaddress).must_equal ['134.170.185.46', '134.170.188.221']
  end

  it 'check host on unsupported os' do
    resource = MockLoader.new(:undefined).load_resource('host', 'example.com')
    _(resource.resolvable?).must_equal false
    _(resource.reachable?).must_equal false
    _(resource.ipaddress).must_equal nil
  end

end
