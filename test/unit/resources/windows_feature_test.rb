# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::WindowsFeature' do
  it 'can retrieve feature info using Get-WindowsFeature' do
    resource = MockLoader.new(:windows).load_resource('windows_feature', 'DHCP')
    params = {
      name: 'DHCP',
      description: 'Dynamic Host Configuration Protocol (DHCP) Server enables you to centrally configure, manage, and provide temporary IP addresses and related information for client computers.',
      installed: false,
      type: 'windows-feature'
    }
    _(resource.info).must_equal params
    _(resource.installed?).must_equal false
  end

  it 'uses DISM when Get-WindowsFeature does not exist' do
    resource = MockLoader.new(:windows)
                         .load_resource('windows_feature', 'IIS-WebServer')
    params = {
      name: 'IIS-WebServer',
      description: 'Installs the IIS 10.0 World Wide Web Services. Provides support for HTML web sites and optional support for ASP.NET, Classic ASP, and web server extensions.',
      installed: true,
      type: 'dism'
    }
    _(resource.info).must_equal params
    _(resource.installed?).must_equal true
  end
end
