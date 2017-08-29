# encoding: utf-8
# author: Matthew Dromazos

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::FirewallD' do
  resource = load_resource('firewalld')
  centResource = MockLoader.new(:centos7).load_resource('firewalld')

  it 'verify firewalld detects a zone' do
    centResource.stubs(:has_zone?).with('public').returns(true)
    centResource.stubs(:has_zone?).with('zonenotinfirewalld').returns(false)
  end

  it 'verity firewalld is running' do
    _(centResource.running?).must_equal true
  end

  it 'verify firewalld detects a default_zone' do
    _(resource.default_zone).must_equal 'public'
  end

  it 'verify firewalld detects attributes for active zones' do
    entries = resource.where { zone == 'public' }
    _(entries.interfaces).must_equal [['enp0s3', 'eno2']]
    _(entries.services).must_equal [['ssh', 'icmp']]
    _(entries.sources).must_equal [['192.168.1.0/24', '192.168.1.2']]
  end

  it 'verify firewalld detects a whether or not a service is allowed in a zone' do
    resource.stubs(:has_service_enabled_in_zone?).with('public', 'ssh').returns(true)
  end

  it 'verify firewalld detects ports enabled for a service in a zone' do
    resource.stubs(:service_ports_enabled_in_zone).with('public', 'ssh').returns('22/udp')
  end

  it 'verify firewalld detects protocols enabled for a service in a zone' do
    resource.stubs(:service_protocols_enabled_in_zone).with('public', 'ssh').returns('')
  end

  it 'verify firewalld detects a whether or not a service is allowed in a zone' do
    resource.stubs(:has_port_enabled_in_zone?).with('public', '22/udp').returns(true)
  end

  it 'verify firewalld detects a whether or not a rule is enabled in a zone' do
    resource.stubs(:has_rule_enabled?).with('public', 'rule family=ipv4 source address=192.168.0.14 accept').returns(true)
  end
end
