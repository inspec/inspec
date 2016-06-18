# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'inspec/resource'

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
    _(resource.send('DisplayName')).must_equal nil
  end

  # centos 7 with systemd
  it 'fail wmi on centos' do
    resource = MockLoader.new(:centos7).load_resource('wmi', {class: 'win32_service', filter: "name like '%winrm%'" })
    _(resource.send('DisplayName')).must_equal nil
  end

  # unknown OS
  it 'fail wmi on unknown os' do
    resource = MockLoader.new(:undefined).load_resource('wmi', {class: 'win32_service', filter: "name like '%winrm%'" })
    _(resource.send('DisplayName')).must_equal nil
  end
end
