# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'vulcano/resource'

describe 'Vulcano::Resources::AuditDaemonRules' do
  it 'check audit policy parsing' do
    resource = MockLoader.new(:windows).load_resource('audit_daemon_rules')
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
