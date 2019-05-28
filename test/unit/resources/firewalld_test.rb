require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::FirewallD' do
  centResource = MockLoader.new(:centos7).load_resource('firewalld')

  it 'verify firewalld detects a zone' do
    _(centResource.has_zone?('public')).must_equal true
    _(centResource.has_zone?('zonenotinfirewalld')).must_equal false
  end

  it 'verity firewalld is running' do
    _(centResource.running?).must_equal true
  end

  it 'verify firewalld detects a default_zone' do
    _(centResource.default_zone).must_equal 'public'
  end

  it 'parses zones with multiple interfaces' do
    entries = centResource.where { zone == 'public' }
    _(entries.interfaces).must_equal [['enp0s3', 'eno2']]
  end

  it 'detects services in an active zone' do
    entries = centResource.where { zone == 'public' }
    _(entries.services).must_equal [['ssh', 'icmp']]
  end

  it 'detects multiple active zones' do
    entries = centResource.where { zone == 'public' }
    _(entries.interfaces).must_equal [['enp0s3', 'eno2']]
    entries = centResource.where { zone == 'default' }
    _(entries.interfaces).must_equal [['enp0s3']]
  end

  it 'detects sources in an active zone' do
    entries = centResource.where { zone == 'public' }
    _(entries.sources).must_equal [['192.168.1.0/24', '192.168.1.2']]
  end

  it 'verify firewalld detects a whether or not a service is allowed in a zone' do
    _(centResource.has_service_enabled_in_zone?('ssh', 'public')).must_equal true
  end

  it 'verify firewalld detects ports enabled for a service in a zone' do
    _(centResource.service_ports_enabled_in_zone('ssh', 'public')).must_equal ['22/tcp']
  end

  it 'verify firewalld detects protocols enabled for a service in a zone' do
    _(centResource.service_protocols_enabled_in_zone('ssh', 'public')).must_equal ['icmp']
  end

  it 'verify firewalld detects a whether or not a service is allowed in a zone' do
    _(centResource.has_port_enabled_in_zone?('22/udp', 'public')).must_equal true
  end

  it 'verify firewalld detects a whether or not a rule is enabled in a zone included rule text' do
    _(centResource.has_rule_enabled?('rule family=ipv4 source address=192.168.0.14 accept', 'public')).must_equal true
  end

  it 'verify firewalld detects a whether or not a rule is enabled in a zone exluding rule text' do
    _(centResource.has_rule_enabled?('family=ipv4 source address=192.168.0.14 accept', 'public')).must_equal true
  end
end
