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
    resource = MockLoader.new(:freebsd10).load_resource('processes', 'login -fp apop')
    _(resource.list.length).must_equal 2
    _(resource.list[0].to_h).must_equal({
      label: nil,
      pid: 7115,
      cpu: '0.3',
      mem: '0.0',
      vsz: 2516588,
      rss: 3052,
      tty: 'ttys008',
      stat: 'U',
      start: 'Fri05PM',
      time: '0:00.05',
      user: 'root',
      command: 'login -fp apop',
    })
  end

  it 'verify processes resource on linux os' do
    resource = MockLoader.new(:centos6).load_resource('processes', 'postgres: bifrost bifrost')
    _(resource.list.length).must_equal 1
    _(resource.list[0].to_h).must_equal({
      label: 'system_u:system_r:init_t:s0',
      pid: 5127,
      cpu: '0.0',
      mem: '0.2',
      vsz: 547208,
      rss: 5376,
      tty: '?',
      stat: 'Ss',
      start: '10:54:22',
      time: '00:00:00',
      user: 'opscode-pgsql',
      command: 'postgres: bifrost bifrost 127.0.0.1(43699) idle',
    })
  end

  it 'access attributes of a process' do
    resource = MockLoader.new(:centos6).load_resource('processes', 'postgres: bifrost bifrost')
    process = resource.list[0]
    process.user.must_equal 'opscode-pgsql'
    process[:user].must_equal 'opscode-pgsql'
    process['user'].must_equal 'opscode-pgsql'
    process[-1].must_equal 'postgres: bifrost bifrost 127.0.0.1(43699) idle'
    process[1].must_equal 5127
  end

  it 'retrieves the users and states as arrays' do
    resource = MockLoader.new(:freebsd10).load_resource('processes', 'login -fp apop')
    _(resource.users.sort).must_equal ['apop', 'root']
    _(resource.states.sort).must_equal ['Ss', 'U']
  end

  it 'retrieves the users and states as arrays on linux os' do
    resource = MockLoader.new(:centos6).load_resource('processes', 'postgres: bifrost bifrost')
    _(resource.users.sort).must_equal ['opscode-pgsql']
    _(resource.states.sort).must_equal ['Ss']
  end
end
