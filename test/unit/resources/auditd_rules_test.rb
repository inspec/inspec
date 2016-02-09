# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::AuditDaemonRules' do
  it 'auditd_rules interface' do
    resource = MockLoader.new(:centos7).load_resource('auditd_rules')
    _(resource.send('lines')).must_equal [
       '-a always,exit -F arch=b64 -S open,openat -F exit=-EACCES -F key=access',
       '-a always,exit -F arch=b32 -S chmod,fchmod,fchmodat -F auid>=500 f24!=0 -F key=perm_mod',
       '-w /etc/ssh/sshd_config -p rwxa -k CFG_sshd_config',
    ]
  end

  it 'auditd_rules syscall interface' do
    resource = MockLoader.new(:centos7).load_resource('auditd_rules')
    _(resource.send('syscall', 'open').send('rules')).must_equal [
      {:syscall=>"open", :list=>"exit", :action=>"always", :fields=>["arch=b64", "exit=-EACCES", "key=access"], :arch=>"b64", :exit=>"-EACCES", :key=>"access"}
    ]
  end

  it 'auditd_rules syscall query chaining' do
    resource = MockLoader.new(:centos7).load_resource('auditd_rules')
    _(resource.send('syscall', 'open').field('key', 'access').send('rules')).must_equal [
      {:syscall=>"open", :list=>"exit", :action=>"always", :fields=>["arch=b64", "exit=-EACCES", "key=access"], :arch=>"b64", :exit=>"-EACCES", :key=>"access"}
    ]
  end

  it 'auditd_rules syscall query chaining with short syntax' do
    resource = MockLoader.new(:centos7).load_resource('auditd_rules')
    _(resource.send('syscall', 'open').key('access').list('exit').send('rules')).must_equal [
      {:syscall=>"open", :list=>"exit", :action=>"always", :fields=>["arch=b64", "exit=-EACCES", "key=access"], :arch=>"b64", :exit=>"-EACCES", :key=>"access"}
    ]
  end

  it 'check auditd_rules syscall query chaining empty results' do
    resource = MockLoader.new(:centos7).load_resource('auditd_rules')
    _(resource.send('syscall', 'open').field('key', 'access').field('foo', 'bar').send('rules')).must_equal []
  end


  it 'check auditd_rules file interface' do
    resource = MockLoader.new(:centos7).load_resource('auditd_rules')
    _(resource.send('file', '/etc/ssh/sshd_config').send('rules')).must_equal [
      { file: '/etc/ssh/sshd_config', key: 'CFG_sshd_config', permissions: 'rwxa'},
    ]
  end

  it 'check auditd_rules key interface' do
    resource = MockLoader.new(:centos7).load_resource('auditd_rules')
    _(resource.send('key', 'CFG_sshd_config').send('rules')).must_equal [
      { file: '/etc/ssh/sshd_config', key: 'CFG_sshd_config', permissions: 'rwxa'},
    ]
  end

  it 'check auditd_rules status interface' do
    resource = MockLoader.new(:centos7).load_resource('auditd_rules')
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

  it 'check auditd_rules status interface querying a key' do
    resource = MockLoader.new(:centos7).load_resource('auditd_rules')
    _(resource.send('status', 'enabled')).must_equal('1')
  end

  # TODO(sr) figure out how to feed resource the legacy auditctl mock cmd output
  # it 'check legacy audit policy parsing' do
  #   resource = MockLoader.new(:undefined).load_resource('auditd_rules')
  #   _(resource.send('LIST_RULES')).must_equal [
  #     'exit,always syscall=rmdir,unlink',
  #     'exit,always auid=1001 (0x3e9) syscall=open',
  #     'exit,always watch=/etc/group perm=wa',
  #     'exit,always watch=/etc/passwd perm=wa',
  #     'exit,always watch=/etc/shadow perm=wa',
  #     'exit,always watch=/etc/sudoers perm=wa',
  #     'exit,always watch=/etc/secret_directory perm=r',
  #   ]
  # end
end
