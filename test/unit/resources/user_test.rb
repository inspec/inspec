# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::User' do

  # ubuntu 14.04 with upstart
  it 'read user on ubuntu' do
    resource = MockLoader.new(:ubuntu1404).load_resource('user', 'root')
    _(resource.exists?).must_equal true
    _(resource.group).must_equal 'root'
    _(resource.groups).must_equal ['root']
    _(resource.home).must_equal '/root'
    _(resource.shell).must_equal '/bin/bash'
    _(resource.mindays).must_equal 0
    _(resource.maxdays).must_equal 99999
    _(resource.warndays).must_equal 7
  end

  # ubuntu 14.04 test with ldap user
  it 'read user on ubuntu' do
    resource = MockLoader.new(:ubuntu1404).load_resource('user', 'jfolmer')
    _(resource.exists?).must_equal true
    _(resource.group).must_equal 'domain users'
    _(resource.groups).must_equal ['domain users', 'domain admins', 'denied rodc password replication group']
    _(resource.home).must_equal '/jfolmer'
    _(resource.shell).must_equal '/bin/bash'
    _(resource.mindays).must_equal 0
    _(resource.maxdays).must_equal 99999
    _(resource.warndays).must_equal 7
  end

  # serverspec compatibility tests (do not test matcher)
  it 'verify serverspec compatibility' do
    resource = MockLoader.new(:ubuntu1404).load_resource('user', 'root')
    _(resource.has_uid?(0)).must_equal true
    _(resource.has_home_directory?('/root')).must_equal true
    _(resource.has_login_shell?('/bin/bash')).must_equal true
    _(resource.minimum_days_between_password_change).must_equal 0
    _(resource.maximum_days_between_password_change).must_equal 99999
    # _(resource.has_authorized_key?('abc')).must_equal true
  end

  it 'read user on centos7' do
    resource = MockLoader.new(:centos7).load_resource('user', 'root')
    _(resource.exists?).must_equal true
    _(resource.group).must_equal 'root'
    _(resource.groups).must_equal ['root']
    _(resource.home).must_equal '/root'
    _(resource.shell).must_equal '/bin/bash'
    _(resource.mindays).must_equal 0
    _(resource.maxdays).must_equal 99999
    _(resource.warndays).must_equal 7
  end

  it 'read user on centos7' do
    resource = MockLoader.new(:wrlinux).load_resource('user', 'root')
    _(resource.exists?).must_equal true
    _(resource.group).must_equal 'root'
    _(resource.groups).must_equal ['root']
    _(resource.home).must_equal '/root'
    _(resource.shell).must_equal '/bin/bash'
    _(resource.mindays).must_equal 0
    _(resource.maxdays).must_equal 99999
    _(resource.warndays).must_equal 7
  end

  it 'read user on hpux' do
    resource = MockLoader.new(:hpux).load_resource('user', 'root')
    _(resource.home).must_equal '/'
    _(resource.shell).must_equal '/sbin/sh'
  end

  it 'read user on freebsd' do
    resource = MockLoader.new(:freebsd10).load_resource('user', 'root')
    _(resource.exists?).must_equal true
    _(resource.group).must_equal 'root'
    _(resource.groups).must_equal ['root']
    _(resource.home).must_equal '/root'
    _(resource.shell).must_equal '/bin/csh'
    _(resource.mindays).must_equal nil
    _(resource.maxdays).must_equal nil
    _(resource.warndays).must_equal nil
  end

  it 'read user on OSX' do
    resource = MockLoader.new(:osx104).load_resource('user', 'chartmann')
    _(resource.exists?).must_equal true
    _(resource.group).must_equal 'staff'
    _(resource.groups).must_equal ['staff', 'com.apple.sharepoint.group.1', 'everyone']
    _(resource.home).must_equal '/Users/chartmann'
    _(resource.shell).must_equal '/bin/zsh'
    _(resource.mindays).must_equal nil
    _(resource.maxdays).must_equal nil
    _(resource.warndays).must_equal nil
  end

  it 'read user on Windows' do
    resource = MockLoader.new(:windows).load_resource('user', 'example/Administrator')
    _(resource.uid).wont_be_nil
    _(resource.exists?).must_equal true
    _(resource.group).must_equal nil
    _(resource.groups).must_equal ['WIN-K0AKLED332V\\Administrators', 'EXAMPLE\\Domain Admins']
    _(resource.home).must_equal nil
    _(resource.shell).must_equal nil
    _(resource.mindays).must_equal nil
    _(resource.maxdays).must_equal nil
    _(resource.warndays).must_equal nil
    _(resource.disabled?).must_equal false
  end

  it 'read user on undefined os' do
    resource = MockLoader.new(:undefined).load_resource('user', 'example/Administrator')
    _(resource.exists?).must_equal false
    _(resource.group).must_equal nil
    _(resource.groups).must_equal nil
    _(resource.home).must_equal nil
    _(resource.shell).must_equal nil
    _(resource.mindays).must_equal nil
    _(resource.maxdays).must_equal nil
    _(resource.warndays).must_equal nil
  end
end
