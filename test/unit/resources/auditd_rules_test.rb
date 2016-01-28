# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::AuditDaemonRules' do
  it 'check legacy audit policy parsing' do
    resource = MockLoader.new(:undefined).load_resource('auditd_rules')
    _(resource.send('LIST_RULES')).must_equal [
      'exit,always syscall=rmdir,unlink',
      'exit,always auid=1001 (0x3e9) syscall=open',
      'exit,always watch=/etc/group perm=wa',
      'exit,always watch=/etc/passwd perm=wa',
      'exit,always watch=/etc/shadow perm=wa',
      'exit,always watch=/etc/sudoers perm=wa',
      'exit,always watch=/etc/secret_directory perm=r',
    ]
  end
end
