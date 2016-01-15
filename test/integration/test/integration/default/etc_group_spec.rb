# encoding: utf-8

root_group = case os[:family]
             when 'aix'
               'system'
             when 'freebsd'
               'wheel'
             else
               'root'
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
