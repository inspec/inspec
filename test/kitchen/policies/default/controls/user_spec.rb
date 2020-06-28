if ['centos', 'redhat', 'fedora', 'suse', 'debian', 'ubuntu'].include?(os[:family])
  userinfo = {
    username: 'root',
    groupname: 'root',
    uid: 0,
    gid: 0,
    groups: "root",
    home: '/root',
    shell: '/bin/bash',
  }

  # different groupset for centos 5
  userinfo[:groups] = ["root", "bin", "daemon", "sys", "adm", "disk", "wheel"] \
    if os[:release].to_i == 5
elsif ['freebsd'].include?(os[:name])
  userinfo = {
    username: 'root',
    groupname: 'wheel',
    uid: 0,
    gid: 0,
    groups: "wheel", # at least this group should be there
    home: '/root',
    shell: '/bin/csh',
  }
elsif os.windows?
  hostname = powershell('$env:computername').stdout.chomp
  userinfo = {
    username: hostname + '\Administrator',
    groupname: nil,
    uid: nil,
    gid: nil,
    groups: "Administrators",
    home: nil,
    shell: nil,
  }
  # store uid of user
  userinfo[:uid] = user(userinfo[:username]).uid
elsif os[:family] == 'aix'
  userinfo = {
    username:     'bin',
    groupname:    'bin',
    uid:      2,
    gid:      2,
    groups:   "adm", # at least this group should be there
    home:     '/bin',
    shell:    nil,
    #mindays:  0,
    #maxdays:  0,
    warndays: 0,
  }
elsif os.solaris?
  if os[:release].to_i > 10
    userinfo = {
      username: 'root',
      groupname: 'root',
      uid: 0,
      gid: 0,
      groups: "sys", # at least this group should be there
      home: '/root',
      shell: '/usr/bin/bash',
    }
  else
    userinfo = {
      username: 'root',
      groupname: 'root',
      uid: 0,
      gid: 0,
      groups: "sys", # at least this group should be there
      home: '/',
      shell: '/sbin/sh',
    }
  end
elsif os.darwin?
  userinfo = {
    username:     'root',
    groupname:    'wheel',
    uid:      0,
    gid:      0,
    groups:   "wheel", # at least this group should be there
    home:     '/var/root',
    shell:    '/bin/sh',
  }
else
  userinfo = {}
end

if os.windows?
  # test single `user` resource
  describe user(userinfo[:username]) do
    it { should exist }
    # should return the SID of the user
    its('uid') { should_not eq nil}
    its('groups') { should include userinfo[:groups] }
    its('mindays') { should eq 0 }
    its('maxdays') { should eq 42 }
    its('warndays') { should eq nil }
    its('passwordage') { should_be > 5 }
    its('maxbadpasswords') { should eq 0 }
    its('badpasswordattempts') { should eq 0 }
  end

  # also support simple username for local users without domain
  describe user('Administrator') do
    it { should exist }
    # should return the SID of the user
    its('uid') { should_not eq nil}
    its('groups') { should include userinfo[:groups] }
    its('mindays') { should eq 0 }
    its('maxdays') { should eq 42 }
    its('warndays') { should eq nil }
    its('passwordage') { should_be > 5 }
    its('maxbadpasswords') { should eq 0 }
    its('badpasswordattempts') { should eq 0 }
    end
else
  # test single `user` resource
  describe user(userinfo[:username]) do
    it { should exist }
    userinfo.each do |k, v|
      # check that the user is part of the groups
      if k.to_s == 'groups'
        its(k) { should include v } unless ENV['DOCKER']
      # default eq comparison
      else
        its(k) { should eq v }
      end
    end
  end

  describe users.where(username: userinfo[:username]).groups.entries[0] do
    it { should include userinfo[:groups] }
  end
end

# test `users` resource
describe users.where(username: userinfo[:username]) do
  userinfo.each do |k, v|
    name = k.to_s
    if name == 'groups'
      # its(name) { should include v }
    else
      name += 's' unless %w{ maxdays mindays warndays }.include? name
      expected_value = [v]
      its(name) { should eq expected_value}
    end
  end
end

# catch case where user is not existant
describe user('not_available') do
  it { should_not exist }
  its ('uid') { should eq nil}
  its ('username') { should eq nil}
  its ('gid') { should eq nil}
  its ('home') { should eq nil}
  its ('shell') { should eq nil}
end
