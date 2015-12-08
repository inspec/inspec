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
    resource = load_resource('processes', '/bin/bash')
    _(resource.list).must_equal [{
      user: 'root',
      pid: '1',
      cpu: '0.0',
      mem: '0.0',
      vsz: '18084',
      rss: '3228',
      tty: '?',
      stat: 'Ss',
      start: '14:15',
      time: '0:00',
      command: '/bin/bash',
    }]

    _(resource.list.length).must_equal 1
  end

  it 'retrieves the users and states as arrays' do
    resource = load_resource('processes', 'svc')
    _(resource.users.sort).must_equal ['noot']
    _(resource.states.sort).must_equal ['S', 'Ss']
  end
end
