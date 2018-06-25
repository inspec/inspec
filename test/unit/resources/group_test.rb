# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::Group' do

  # ubuntu 14.04
  it 'verify group on ubuntu' do
    resource = MockLoader.new(:ubuntu1404).load_resource('group', 'root')
    _(resource.exists?).must_equal true
    _(resource.gid).must_equal 0
    _(resource.has_gid?(0)).must_equal true
  end

  it 'verify group on ubuntu with mixed case' do
    resource = MockLoader.new(:ubuntu1404).load_resource('group', 'GroupWithCaps')
    _(resource.exists?).must_equal true
    _(resource.gid).must_equal 999
    _(resource.has_gid?(999)).must_equal true
  end

  # ubuntu with non-existent group
  it 'verify group on ubuntu' do
    resource = MockLoader.new(:ubuntu1404).load_resource('group', 'nogroup')
    _(resource.exists?).must_equal false
    _(resource.gid).must_be_nil
    _(resource.has_gid?(0)).must_equal false
  end

  # mac
  it 'verify group on mac' do
    resource = MockLoader.new(:osx104).load_resource('group', 'root')
    _(resource.exists?).must_equal true
    _(resource.gid).must_equal 0
    _(resource.has_gid?(0)).must_equal true
  end

  # freebsd
  it 'verify group on freebsd' do
    resource = MockLoader.new(:freebsd10).load_resource('group', 'root')
    _(resource.exists?).must_equal true
    _(resource.gid).must_equal 0
    _(resource.has_gid?(0)).must_equal true
  end

  # windows with local group
  it 'verify administrator group on windows' do
    resource = MockLoader.new(:windows).load_resource('group', 'Administrators')
    _(resource.exists?).must_equal true
    _(resource.gid).must_equal 'S-1-5-32-544'
    _(resource.has_gid?(0)).must_equal false
    _(resource.members).must_equal ['Administrators', 'Domain Admins']
  end

  it 'verify power users group on windows' do
    resource = MockLoader.new(:windows).load_resource('group', 'Power Users')
    _(resource.exists?).must_equal true
    _(resource.gid).must_equal 'S-1-5-32-547'
    _(resource.has_gid?(0)).must_equal false
    _(resource.members).must_equal []
  end

  # windows non-existent group
  it 'verify non-existing group on windows' do
    resource = MockLoader.new(:windows).load_resource('group', 'dhcp')
    _(resource.exists?).must_equal false
    _(resource.gid).must_be_nil
    _(resource.has_gid?(0)).must_equal false
    _(resource.members).must_equal nil
  end

  # undefined
  it 'verify package handling on unsupported os' do
    resource = MockLoader.new(:undefined).load_resource('group', 'root')
    _(resource.exists?).must_equal false
    _(resource.gid).must_be_nil
    _(resource.has_gid?(0)).must_equal false
  end
end
