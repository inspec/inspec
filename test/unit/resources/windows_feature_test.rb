require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::WindowsFeature' do
  it 'can retrieve feature info using PowerShell' do
    resource = MockLoader.new(:windows).load_resource(
      'windows_feature',
      'DHCP',
      :powershell,
    )
    params = {
      name: 'DHCP',
      description: 'Dynamic Host Configuration Protocol (DHCP) Server enables you to centrally configure, manage, and provide temporary IP addresses and related information for client computers.',
      installed: false,
      method: :powershell,
    }
    _(resource.info).must_equal params
    _(resource.installed?).must_equal false
  end

  it 'can retrieve feature info using DISM' do
    resource = MockLoader.new(:windows).load_resource(
      'windows_feature',
      'IIS-WebServer',
      :dism,
    )
    params = {
      name: 'IIS-WebServer',
      description: 'Installs the IIS 10.0 World Wide Web Services. Provides support for HTML web sites and optional support for ASP.NET, Classic ASP, and web server extensions.',
      installed: true,
      method: :dism,
    }
    _(resource.info).must_equal params
    _(resource.installed?).must_equal true
  end

  it 'uses DISM when Get-WindowsFeature does not exist' do
    resource = MockLoader.new(:windows)
                         .load_resource('windows_feature', 'IIS-WebServer')
    params = {
      name: 'IIS-WebServer',
      description: 'Installs the IIS 10.0 World Wide Web Services. Provides support for HTML web sites and optional support for ASP.NET, Classic ASP, and web server extensions.',
      installed: true,
      method: :dism,
    }
    _(resource.info).must_equal params
    _(resource.installed?).must_equal true
  end

  it 'fails the resource if PowerShell method is used but command not found' do
    resource = MockLoader.new(:windows).load_resource(
      'windows_feature',
      'IIS-WebServer',
      :powershell,
    )

    e = proc {
      resource.info
    }.must_raise(Inspec::Exceptions::ResourceFailed)

    e.message.must_match(/Could not find `Get-WindowsFeature`/)
  end
end
