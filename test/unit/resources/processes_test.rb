# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::Processes' do
  it 'handles empty process results' do
    resource = load_resource('processes', 'nothing')
    _(resource.list).must_equal []
  end

  it 'verify processes resource' do
    resource = MockLoader.new(:freebsd10).load_resource('processes', '/bin/bash')
    _(resource.list.length).must_equal 1
    _(resource.list[0].to_h).must_equal({
      label: nil,
      pid: 1,
      cpu: '0.0',
      mem: '0.0',
      vsz: 18084,
      rss: 3228,
      tty: '?',
      stat: 'Ss',
      start: '14:15',
      time: '0:00',
      command: '/bin/bash',
      user: 'root',
    })
  end

  it 'verify processes resource on linux os' do
    resource = MockLoader.new(:centos6).load_resource('processes', '/sbin/init')
    _(resource.list.length).must_equal 1
    _(resource.list[0].to_h).must_equal({
      label: 'system_u:system_r:kernel_t:s0',
      pid: 1,
      cpu: '0.0',
      mem: '0.0',
      vsz: 19232,
      rss: 1492,
      tty: '?',
      stat: 'Ss',
      start: 'May04',
      time: '0:01',
      command: '/sbin/init',
      user: 'root',
    })
  end

  it 'access attributes of a process' do
    resource = MockLoader.new(:centos6).load_resource('processes', '/sbin/init')
    process = resource.list[0]
    process.user.must_equal 'root'
    process[:user].must_equal 'root'
    process['user'].must_equal 'root'
    process[-1].must_equal 'root'
    process[1].must_equal 1
  end

  it 'retrieves the users and states as arrays' do
    resource = MockLoader.new(:freebsd10).load_resource('processes', 'svc')
    _(resource.users.sort).must_equal ['noot']
    _(resource.states.sort).must_equal ['S', 'Ss']
  end

  it 'retrieves the users and states as arrays on linux os' do
    resource = MockLoader.new(:centos6).load_resource('processes', 'crypto/0')
    _(resource.users.sort).must_equal ['root']
    _(resource.states.sort).must_equal ['S']
  end
end
