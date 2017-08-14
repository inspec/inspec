# encoding: utf-8
# author: Matthew Dromazos

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::FirewallD' do
  it 'verify firewalld is installed' do
    resource = load_resource('firewalld')
    _(resource.installed?).must_equal true
  end

  it 'verify firewalld detects a zone' do
    resource = load_resource('firewalld')
    resource.stubs(:has_zone?).with('public').returns(true)
    resource.stubs(:has_zone?).with('zonenotinfirewalld').returns(false)
  end

  it 'verity firewalld is running' do
    resource = load_resource('firewalld')
    _(resource.installed?).must_equal true
  end

  it 'verify firewalld detects a default_zone' do
    resource = load_resource('firewalld')
    _(resource.default_zone).must_equal 'public'
  end

  it 'verify firewalld detects a active_zones' do
    resource = load_resource('firewalld')
    _(resource.active_zones).must_equal 'public\n interfaces: enp0s3'
  end

  it 'verify firewalld detects a whether or not a service is allowed in a zone' do
    resource = load_resource('firewalld')
    resource.stubs(:has_service_enabled_in_zone?).with('public', 'ssh').returns(true)
  end

  it 'verify firewalld detects ports enabled for a service in a zone' do
    resource = load_resource('firewalld')
    resource.stubs(:service_ports_enabled_in_zone).with('public', 'ssh').returns('22/tcp')
  end

  it 'verify firewalld detects protocols enabled for a service in a zone' do
    resource = load_resource('firewalld')
    resource.stubs(:service_protocols_enabled_in_zone).with('public', 'ssh').returns('')
  end

  it 'verify firewalld detects a whether or not a service is allowed in a zone' do
    resource = load_resource('firewalld')
    resource.stubs(:has_port_enabled_in_zone?).with('public', '22/udp').returns(true)
  end
end
