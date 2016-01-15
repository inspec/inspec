# encoding: utf-8

case os[:family]
when 'centos', 'redhat', 'fedora', 'opensuse', 'debian', 'ubuntu'
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

when 'freebsd'
  userinfo = {
    name: 'root',
    group: 'wheel',
    uid: 0,
    gid: 0,
    groups: ["wheel", "operator"],
    home: '/root',
    shell: '/bin/csh',
  }

when 'windows'
  userinfo = {
    name: 'Administrator',
    group: nil,
    uid: nil,
    gid: nil,
    groups: nil,
    home: nil,
    shell: nil,
  }

when 'aix'
  userinfo = {
    name:     'bin',
    group:    'bin',
    uid:      2,
    gid:      2,
    groups:   %w{bin sys adm},
    home:     '/bin',
    shell:    nil,
    #mindays:  0,
    #maxdays:  0,
    warndays: 0,
  }

else
  userinfo = {}
end

case os[:family]
when 'windows'
  describe user(userinfo[:name]) do
    it { should exist }
  end
else
  describe user(userinfo[:name]) do
    it { should exist }
    userinfo.each do |k, v|
      next if k.to_sym == :name
      its(k) { should eq v }
    end
  end
end
