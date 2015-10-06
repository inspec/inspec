# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'vulcano/resource'

describe 'Vulcano:Resources::Feature' do
  describe 'feature' do

    let(:resource) { MockLoader.new(:windows).load_resource('windows_feature', 'dhcp') }

    # TODO: set windows as mock os
    it 'verify windows feature parsing' do
      pkg = { name: 'DHCP', description: 'Dynamic Host Configuration Protocol (DHCP) Server enables you to centrally configure, manage, and provide temporary IP addresses and related information for client computers.', installed: false, type: 'windows-feature' }
      _(resource.info).must_equal pkg
      _(resource.installed?).must_equal false
    end
  end
end
