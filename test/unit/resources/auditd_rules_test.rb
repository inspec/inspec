# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::AuditDaemonRules' do
  it 'check audit rules parsing using LIST_RULES' do
    resource = MockLoader.new(:windows).load_resource('auditd_rules')
    _(resource.send('LIST_RULES')).must_equal [
      '-a always,exit -F arch=b32 -S open -S openat -F exit=-EACCES -k access',
      '-w /etc/ssh/sshd_config -p rwxa -k CFG_sshd_config',
    ]
  end

  it 'check audit rules parsing' do
    resource = MockLoader.new(:windows).load_resource('auditd_rules')
    _(resource.send('rules')).must_equal [
      '-a always,exit -F arch=b32 -S open -S openat -F exit=-EACCES -k access',
      '-w /etc/ssh/sshd_config -p rwxa -k CFG_sshd_config',
    ]
  end

  it 'check audit status querying a field' do
    resource = MockLoader.new(:windows).load_resource('auditd_rules')
    _(resource.send('status').send('backlog')).must_equal "0"
  end
end
