# encoding: utf-8

if ['centos', 'redhat', 'fedora', 'opensuse', 'debian', 'ubuntu'].include?(os[:family])
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
  userinfo[:groups] = ["root", "bin", "daemon", "sys", "adm", "disk", "wheel"] \
    if os[:release].to_i == 5
elsif ['freebsd'].include?(os[:family])
  userinfo = {
    name: 'root',
    group: 'wheel',
    uid: 0,
    gid: 0,
    groups: "wheel", # at least this group should be there
    home: '/root',
    shell: '/bin/csh',
  }
elsif os.windows?
  userinfo = {
    name: 'Administrator',
    group: nil,
    uid: nil,
    gid: nil,
    groups: nil,
    home: nil,
    shell: nil,
  }
elsif os[:family] == 'aix'
  userinfo = {
    name:     'bin',
    group:    'bin',
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
      name: 'root',
      group: 'root',
      uid: 0,
      gid: 0,
      groups: "sys", # at least this group should be there
      home: '/root',
      shell: '/usr/bin/bash',
    }
  else
    userinfo = {
      name: 'root',
      group: 'root',
      uid: 0,
      gid: 0,
      groups: "sys", # at least this group should be there
      home: '/',
      shell: '/sbin/sh',
    }
  end
else
  userinfo = {}
end

if os.windows?
  describe user(userinfo[:name]) do
    it { should exist }
  end
else
  describe user(userinfo[:name]) do
    it { should exist }
    userinfo.each do |k, v|
      next if k.to_sym == :name

      # check that the user is part of the groups
      if k.to_s == 'groups'
        its(k) { should include v }
      # default eq comparison
      else
        its(k) { should eq v }
      end
    end
  end
end
