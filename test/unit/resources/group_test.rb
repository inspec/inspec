
require 'helper'

describe 'Inspec::Resources::Group' do

  # ubuntu 14.04
  it 'verify group on ubuntu' do
    resource = MockLoader.new(:ubuntu1404).load_resource('group', 'root')
    _(resource.exists?).must_equal true
    _(resource.gid).must_equal 0
  end

  it 'verify group on ubuntu with mixed case' do
    resource = MockLoader.new(:ubuntu1404).load_resource('group', 'GroupWithCaps')
    _(resource.exists?).must_equal true
    _(resource.gid).must_equal 999
  end

  it 'verify group on ubuntu with members' do
    resource = MockLoader.new(:ubuntu1404).load_resource('group', 'www-data')
    _(resource.exists?).must_equal true
    _(resource.members).must_equal "www-data,root"
  end

  # ubuntu with non-existent group
  it 'verify group on ubuntu' do
    resource = MockLoader.new(:ubuntu1404).load_resource('group', 'nogroup')
    _(resource.exists?).must_equal false
    _(resource.gid).must_be_nil
  end

  # mac
  it 'verify group on mac' do
    resource = MockLoader.new(:osx104).load_resource('group', 'root')
    _(resource.exists?).must_equal true
    _(resource.gid).must_equal 0
  end

  # freebsd
  it 'verify group on freebsd' do
    resource = MockLoader.new(:freebsd10).load_resource('group', 'root')
    _(resource.exists?).must_equal true
    _(resource.gid).must_equal 0
  end

  # windows with local group
  it 'verify administrator group on windows' do
    resource = MockLoader.new(:windows).load_resource('group', 'Administrators')
    _(resource.exists?).must_equal true
    _(resource.gid).must_equal 'S-1-5-32-544'
    _(resource.members).must_equal ['Administrators', 'Domain Admins']
  end

  it 'verify power users group on windows' do
    resource = MockLoader.new(:windows).load_resource('group', 'Power Users')
    _(resource.exists?).must_equal true
    _(resource.gid).must_equal 'S-1-5-32-547'
    _(resource.members).must_equal []
  end

  # windows non-existent group
  it 'verify non-existing group on windows' do
    resource = MockLoader.new(:windows).load_resource('group', 'dhcp')
    _(resource.exists?).must_equal false
    _(resource.gid).must_be_nil
    _(resource.members).must_be_nil
  end

  # undefined
  it 'verify package handling on unsupported os' do
    resource = MockLoader.new(:undefined).load_resource('group', 'root')
    _(resource.exists?).must_equal false
    _(resource.gid).must_be_nil
  end
end
