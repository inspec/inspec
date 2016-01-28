# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::AuditDaemonRules' do
  it 'auditd_rules interface' do
    resource = MockLoader.new(:undefined).load_resource('auditd_rules')
    _(resource.send('lines')).must_equal [
       '-a always,exit -F arch=b32 -S open -S openat -F exit=-EACCES -k access',
       '-w /etc/ssh/sshd_config -p rwxa -k CFG_sshd_config',
    ]
  end

  it 'auditd_rules syscall interface' do
    resource = MockLoader.new(:undefined).load_resource('auditd_rules')
    _(resource.send('syscall', 'open').send('rules')).must_equal [
      { syscall: 'open', list: 'exit', action: 'always', key: 'access', opts: { 'arch' => 'b32', 'exit' => '-EACCES' } },
    ]
  end

  it 'auditd_rules syscall query chaining' do
    resource = MockLoader.new(:undefined).load_resource('auditd_rules')
    _(resource.send('syscall', 'open').field('key', 'access').send('rules')).must_equal [
      { syscall: 'open', list: 'exit', action: 'always', key: 'access', opts: { 'arch' => 'b32', 'exit' => '-EACCES' } },
    ]
  end

  it 'auditd_rules syscall query chaining with short syntax' do
    resource = MockLoader.new(:undefined).load_resource('auditd_rules')
    _(resource.send('syscall', 'open').key('access').list('exit').send('rules')).must_equal [
      { syscall: 'open', list: 'exit', action: 'always', key: 'access', opts: { 'arch' => 'b32', 'exit' => '-EACCES' } },
    ]
  end

  it 'check auditd_rules syscall query chaining empty results' do
    resource = MockLoader.new(:undefined).load_resource('auditd_rules')
    _(resource.send('syscall', 'open').field('key', 'access').field('foo', 'bar').send('rules')).must_equal []
  end


  it 'check auditd_rules file interface' do
    resource = MockLoader.new(:undefined).load_resource('auditd_rules')
    _(resource.send('file', '/etc/ssh/sshd_config').send('rules')).must_equal [
      { file: '/etc/ssh/sshd_config', key: 'CFG_sshd_config', permissions: 'rwxa'},
    ]
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
