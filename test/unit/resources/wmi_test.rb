
require 'helper'
require 'inspec/resource'
require 'inspec/resources/wmi'

describe 'Inspec::Resources::WMI' do

  # Check the following as unit test
  # describe wmi({
  #   class: 'win32_service',
  #   filter: "name like '%winrm%'"
  # }) do
  #   its(['Path','ClassName']) { should eq 'Win32_Service' }
  #   its('DisplayName') { should eq 'Windows Remote Management (WS-Management)'}
  # end

  # windows
  it 'verify wmi parsing on windows' do
    resource = MockLoader.new(:windows).load_resource('wmi', {class: 'win32_service', filter: "name like '%winrm%'" })
    _(resource.send('DisplayName')).must_equal 'Windows Remote Management (WS-Management)'
  end

  # ubuntu 14.04 with upstart
  it 'fail wmi on ubuntu' do
    resource = MockLoader.new(:ubuntu1404).load_resource('wmi', {class: 'win32_service', filter: "name like '%winrm%'" })
    _(resource.resource_failed?).must_equal true
    _(resource.resource_exception_message)
      .must_equal 'Resource `wmi` is not supported on platform ubuntu/14.04.'
  end
end
