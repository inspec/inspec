# encoding: utf-8

root_group = 'root'

if os[:family] == 'aix'
  root_group = 'system'
elsif os[:family] == 'freebsd'
  root_group = 'wheel'
elsif os.solaris?
  root_group = 'sys'
end

if os.unix?
  describe etc_group do
    its('gids') { should_not contain_duplicates }
    its('groups') { should include root_group }
    its('users') { should include 'root' }
  end

  describe etc_group.where(name: root_group) do
    its('users') { should include 'root' }
  end
end
