# encoding: utf-8

if os.unix?
  describe etc_group do
    its('gids') { should_not contain_duplicates }
    its('groups') { should include 'root' }
    its('users') { should include 'root' }
  end

  describe etc_group.where(name: 'root') do
    its('users') { should include 'root' }
  end
end
