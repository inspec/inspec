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

  it 'verify group on ubuntu with UPPER CASE' do
    resource = MockLoader.new(:ubuntu1404).load_resource('group', 'ROOT')
    _(resource.exists?).must_equal true
    _(resource.gid).must_equal 0
    _(resource.has_gid?(0)).must_equal true
  end

  # ubuntu with non-existent group
  it 'verify group on ubuntu' do
    resource = MockLoader.new(:ubuntu1404).load_resource('group', 'nogroup')
    _(resource.exists?).must_equal false
    _(resource.gid).must_equal nil
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
  it 'verify group on windows' do
    resource = MockLoader.new(:windows).load_resource('group', 'Administrators')
    _(resource.exists?).must_equal true
    _(resource.gid).must_equal nil
    _(resource.has_gid?(0)).must_equal false
  end

  it 'verify group on windows' do
    resource = MockLoader.new(:windows).load_resource('group', 'Administrators', 'WIN-K0AKLED332V')
    _(resource.exists?).must_equal true
    _(resource.gid).must_equal nil
    _(resource.has_gid?(0)).must_equal false
  end

  # windows with domain group
  it 'verify domain group on windows' do
    resource = MockLoader.new(:windows).load_resource('group', 'Domain Admins', 'EXAMPLE')
    _(resource.exists?).must_equal true
    _(resource.gid).must_equal nil
    _(resource.has_gid?(0)).must_equal false
  end

  # windows with domain group
  it 'verify domain group on windows wiht lower case' do
    resource = MockLoader.new(:windows).load_resource('group', 'domain admins', 'example')
    _(resource.exists?).must_equal true
    _(resource.gid).must_equal nil
    _(resource.has_gid?(0)).must_equal false
  end

  # windows non-existent group
  it 'verify non-existing group on windows' do
    resource = MockLoader.new(:windows).load_resource('group', 'dhcp')
    _(resource.exists?).must_equal false
    _(resource.gid).must_equal nil
    _(resource.has_gid?(0)).must_equal false
  end

  # undefined
  it 'verify package handling on unsupported os' do
    resource = MockLoader.new(:undefined).load_resource('group', 'root')
    _(resource.exists?).must_equal false
    _(resource.gid).must_equal nil
    _(resource.has_gid?(0)).must_equal false
  end

end
