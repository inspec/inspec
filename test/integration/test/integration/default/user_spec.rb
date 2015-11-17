# encoding: utf-8

# root test
if ['centos', 'fedora', 'opensuse', 'debian', 'ubuntu'].include?(os[:family])

  userinfo = {
    name: 'root',
    group: 'root',
    uid: 0,
    gid: 0,
    groups: ["root"],
    home: '/root',
    shell: '/bin/bash',
  }

  # different groupset for centos 5
  userinfo[:groups] = ["root", "bin", "daemon", "sys", "adm", "disk", "wheel"] if os[:release].to_i == 5

elsif ['freebsd'].include?(os[:family])

  userinfo = {
    name: 'root',
    group: 'wheel',
    uid: 0,
    gid: 0,
    groups: ["wheel", "operator"],
    home: '/root',
    shell: '/bin/csh',
  }

elsif ['windows'].include?(os[:family])

  userinfo = {
    name: 'Administrator',
    group: nil,
    uid: nil,
    gid: nil,
    groups: nil,
    home: nil,
    shell: nil,
  }

else
  userinfo = {}
end

if !os.windows?
  describe user(userinfo[:name]) do
    it { should exist }
    it { should belong_to_group userinfo[:group] }
    its('uid') { should eq userinfo[:uid] }
    its('gid') { should eq userinfo[:gid] }
    its('group') { should eq userinfo[:group] }
    its('groups') { should eq userinfo[:groups] }
    its('home') { should eq userinfo[:home] }
    its('shell') { should eq userinfo[:shell] }
  end
else
  describe user(userinfo[:name]) do
    it { should exist }
  end
end
