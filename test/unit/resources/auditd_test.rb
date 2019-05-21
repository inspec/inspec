
require 'helper'

describe 'Inspec::Resources::AuditDaemon' do
  it 'auditd interface' do
    resource = MockLoader.new(:centos7).load_resource('auditd')
    _(resource.send('lines')).must_equal [
      '-a always,exit -F arch=b64 -S open,openat -F exit=-EACCES -F key=access',
      '-a always,exit -F arch=b32 -S open,openat -F exit=-EPERM -F key=access',
      '-a always,exit -F arch=b32 -S chmod,fchmod,fchmodat -F auid>=500 f24!=0 -F key=perm_mod',
      '-a always,exit -S all -F path=/usr/bin/chage -F perm=x -F auid>=1000 -F auid!=-1 -F key=privileged',
      '-a always,exit -S all -F path=/usr/bin/mount -F perm=x -F auid>=1000 -F auid!=-1 -F key=privileged',
      '-w /etc/ssh/sshd_config -p rwxa -k CFG_sshd_config',
      '-w /etc/sudoers -p wa',
      '-w /etc/private-keys -p x',
    ]
  end

  it 'auditd syscall interface' do
    resource = MockLoader.new(:centos7).load_resource('auditd')
    _(resource.send('syscall', 'open').send('params')).must_equal [
      {"syscall"=>"open", "list"=>"exit", "action"=>"always", "fields"=>["arch=b64", "exit=-EACCES", "key=access"], "key"=>"access", "arch"=>"b64", "path"=>nil, "permissions"=>nil, "exit"=>"-EACCES", "fields_nokey"=>["arch=b64", "exit=-EACCES"]},
      {"syscall"=>"open", "list"=>"exit", "action"=>"always", "fields"=>["arch=b32", "exit=-EPERM", "key=access"], "key"=>"access", "arch"=>"b32", "path"=>nil, "permissions"=>nil, "exit"=>"-EPERM", "fields_nokey"=>["arch=b32", "exit=-EPERM"]}
    ]
  end

  it 'auditd syscall query chaining' do
    resource = MockLoader.new(:centos7).load_resource('auditd')
    _(resource.send('syscall', 'open').send('key', 'access').send('params')).must_equal [
      {"syscall"=>"open", "list"=>"exit", "action"=>"always", "fields"=>["arch=b64", "exit=-EACCES", "key=access"], "key"=>"access", "arch"=>"b64", "path"=>nil, "permissions"=>nil, "exit"=>"-EACCES", "fields_nokey"=>["arch=b64", "exit=-EACCES"]},
      {"syscall"=>"open", "list"=>"exit", "action"=>"always", "fields"=>["arch=b32", "exit=-EPERM", "key=access"], "key"=>"access", "arch"=>"b32", "path"=>nil, "permissions"=>nil, "exit"=>"-EPERM", "fields_nokey"=>["arch=b32", "exit=-EPERM"]}
    ]
  end

  it 'auditd syscall query chaining filter on architecture' do
    resource = MockLoader.new(:centos7).load_resource('auditd')
    _(resource.send('syscall', 'open').send('key', 'access').send('arch', 'b32').send('params')).must_equal [
      {"syscall"=>"open", "list"=>"exit", "action"=>"always", "fields"=>["arch=b32", "exit=-EPERM", "key=access"], "key"=>"access", "arch"=>"b32", "path"=>nil, "permissions"=>nil, "exit"=>"-EPERM", "fields_nokey"=>["arch=b32", "exit=-EPERM"]}
    ]
  end

  it 'check auditd syscall query chaining empty results' do
    resource = MockLoader.new(:centos7).load_resource('auditd')
    _(resource.send('syscall', 'open').send('key', 'access').send('arch', 'bar').send('params')).must_equal []
  end

  it 'check auditd file watch with syscall syntax' do
    resource = MockLoader.new(:centos7).load_resource('auditd')
    _(resource.send('file', '/usr/bin/chage').send('params')).must_equal [
      {"file"=>"/usr/bin/chage", "list"=>"exit", "action"=>"always", "fields"=>["path=/usr/bin/chage", "perm=x", "auid>=1000", "auid!=-1", "key=privileged"], "permissions"=>["x"], "key"=>"privileged", "fields_nokey"=>["path=/usr/bin/chage", "perm=x", "auid>=1000", "auid!=-1"]}
    ]
  end

  it 'check auditd file watch with syscall syntax filter on syscall all' do
    resource = MockLoader.new(:centos7).load_resource('auditd')
    _(resource.send('syscall', 'all').send('params')).must_equal [
      {"syscall"=>"all", "list"=>"exit", "action"=>"always", "fields"=>["path=/usr/bin/chage", "perm=x", "auid>=1000", "auid!=-1", "key=privileged"], "key"=>"privileged", "arch"=>nil, "path"=>"/usr/bin/chage", "permissions"=>["x"], "exit"=>nil, "fields_nokey"=>["path=/usr/bin/chage", "perm=x", "auid>=1000", "auid!=-1"]},
      {"syscall"=>"all", "list"=>"exit", "action"=>"always", "fields"=>["path=/usr/bin/mount", "perm=x", "auid>=1000", "auid!=-1", "key=privileged"], "key"=>"privileged", "arch"=>nil, "path"=>"/usr/bin/mount", "permissions"=>["x"], "exit"=>nil, "fields_nokey"=>["path=/usr/bin/mount", "perm=x", "auid>=1000", "auid!=-1"]}
    ]
  end

  it 'check auditd file watch with syscall syntax filter on syscall all and particular path' do
    resource = MockLoader.new(:centos7).load_resource('auditd')
    _(resource.send('syscall', 'all').send('path', '/usr/bin/chage').send('params')).must_equal [
      {"syscall"=>"all", "list"=>"exit", "action"=>"always", "fields"=>["path=/usr/bin/chage", "perm=x", "auid>=1000", "auid!=-1", "key=privileged"], "key"=>"privileged", "arch"=>nil, "path"=>"/usr/bin/chage", "permissions"=>["x"], "exit"=>nil, "fields_nokey"=>["path=/usr/bin/chage", "perm=x", "auid>=1000", "auid!=-1"]}
    ]
  end

  it 'check auditd file interface' do
    resource = MockLoader.new(:centos7).load_resource('auditd')
    _(resource.send('file', '/etc/ssh/sshd_config').send('params')).must_equal [
      { "file"=>"/etc/ssh/sshd_config", "key"=>"CFG_sshd_config", "permissions"=>["r", "w", "x", "a"]},
    ]
  end

  it 'check auditd key interface' do
    resource = MockLoader.new(:centos7).load_resource('auditd')
    _(resource.send('key', 'CFG_sshd_config').send('params')).must_equal [
      { "file"=>"/etc/ssh/sshd_config", "key"=>"CFG_sshd_config", "permissions"=>["r", "w", "x", "a"]},
    ]
  end

  it 'check auditd file interface with no keys' do
    resource = MockLoader.new(:centos7).load_resource('auditd')
    _(resource.send('file', '/etc/private-keys').send('params')).must_equal [
      { "file"=>"/etc/private-keys", "key"=>nil, "permissions"=>["x"]},
    ]
  end

  it 'check auditd status interface' do
    resource = MockLoader.new(:centos7).load_resource('auditd')
    _(resource.send('status')).must_equal({
      'enabled' => '1',
      'flag' => '2',
      'pid' => '547',
      'rate_limit' => '0',
      'backlog_limit' => '8192',
      'lost' => '0',
      'backlog' => '0',
      'loginuid_immutable' => '0 unlocked',
    })
  end

  it 'check auditd status interface querying a key' do
    resource = MockLoader.new(:centos7).load_resource('auditd')
    _(resource.send('status', 'enabled')).must_equal('1')
  end
end
