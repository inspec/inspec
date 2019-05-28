if os[:family] == 'windows'
  filedata = {
    user: os_env('COMPUTERNAME').content + '\TestUser'
  }
elsif os[:name] == 'freebsd'
  filedata = {
    user: 'root',
    group: 'wheel',
    dir_content: "\u0003\u0000",
    dir_md5sum: '598f4fe64aefab8f00bcbea4c9239abf',
    dir_sha256sum: '9b4fb24edd6d1d8830e272398263cdbf026b97392cc35387b991dc0248a628f9',
  }
elsif os[:name] == 'aix'
  filedata = {
    user: 'root',
    group: 'system',
    dir_content: nil,
    dir_md5sum: nil,
    dir_sha256sum: nil,
  }
elsif os.solaris?
  filedata = {
    user: 'root',
    group: 'sys',
    dir_content: nil,
    dir_md5sum: nil,
    dir_sha256sum: nil,
  }
else
  filedata = {
    user: 'root',
    group: 'root',
    dir_content: nil,
    dir_md5sum: nil,
    dir_sha256sum: nil,
  }
end

if os.unix?

  # test regular file
  describe file('/tmp/file') do
    it { should exist }
    it { should be_file }

    it { should_not be_directory }
    it { should_not be_block_device }
    it { should_not be_character_device }
    it { should_not be_pipe }
    it { should_not be_socket }
    it { should_not be_symlink }
    it { should_not be_mounted }

    # check owner
    it { should be_owned_by filedata[:user] }
    it { should be_grouped_into filedata[:group] }

    # it { should have_mode }
    its('mode') { should eq 00765 }
    it { should be_mode 00765 }
    its('mode') { should cmp '0765' }
    its('mode') { should_not cmp '0777' }
    its('suid') { should eq false }
    its('sgid') { should eq false }
    its('sticky') { should eq false }

    it { should be_readable }
    it { should be_allowed('read') }
    it { should be_readable.by('owner') }
    it { should be_allowed('read', by: 'owner') }
    it { should be_readable.by('group') }
    it { should be_allowed('read', by: 'group') }
    it { should be_readable.by('other') }
    it { should be_allowed('read', by: 'other') }
    it { should be_readable.by_user(filedata[:user]) }
    it { should be_allowed('read', by_user: filedata[:user]) }
    it { should_not be_readable.by_user('noroot') }
    it { should_not be_allowed('read', by_user: 'noroot') }
    # for server spec compatibility
    it { should be_readable.by('others') }
    it { should be_allowed('read', by: 'others') }

    it { should be_writable }
    it { should be_allowed('write') }
    it { should be_writable.by('owner') }
    it { should be_allowed('write', by: 'owner') }
    it { should be_writable.by('group') }
    it { should be_allowed('write', by: 'group') }
    it { should_not be_writable.by('other') }
    it { should_not be_allowed('write', by: 'other') }
    it { should be_writable.by_user(filedata[:user]) }
    it { should be_allowed('write', by_user: filedata[:user]) }
    # it { should_not be_writable.by_user('noroot') }
    # for server spec compatibility
    it { should_not be_writable.by('others') }
    it { should_not be_allowed('write', by: 'others') }

    it { should be_executable }
    it { should be_allowed('execute') }
    it { should be_executable.by('owner') }
    it { should be_allowed('execute', by: 'owner') }
    it { should_not be_executable.by('group') }
    it { should_not be_allowed('execute', by: 'group') }
    it { should be_executable.by('other') }
    it { should be_allowed('execute', by: 'other') }
    it { should be_executable.by_user(filedata[:user]) }
    it { should be_allowed('execute', by_user: filedata[:user]) }
    # it { should_not be_executable.by_user('noroot') }
    # for server spec compatibility
    it { should be_executable.by('others') }
    it { should be_allowed('execute', by: 'others') }

    # test extended linux attributes
    # it { should be_immutable }

    its('content') { should eq 'hello world' }
    its('content') { should match('world') }
    its('content') { should include('hello') }
    its('size') { should eq 11 }
    its('md5sum') { should eq '5eb63bbbe01eeed093cb22bb8f5acdc3' }
    its('sha256sum') { should eq 'b94d27b9934d3e08a52e52d7da7dabfac484efe37a5380ee9088f7ace2efcde9' }
    its('product_version') { should eq nil }
    its('file_version') { should eq nil }
    its('basename') { should cmp 'file' }
    its('path') { should cmp '/tmp/file' }

    its('owner') { should eq filedata[:user] }
    its('group') { should eq filedata[:group] }
    its('type') { should eq :file }
  end

  # see mount_spec.rb for file mount tests
  # describe file('/mnt/iso-disk') do
  #   it { should be_mounted }
  #   ...
  # end

  describe file('/tmp/sfile') do
    it { should be_setgid }
    it { should be_setuid }
    it { should be_sticky }

    # These may eventually be deprecated
    its('suid') { should eq true }
    its('sgid') { should eq true }
    its('sticky') { should eq true }
  end

  describe file('/tmp/folder') do
    it { should exist }
    it { should be_directory }

    it { should_not be_file }
    it { should_not be_block_device }
    it { should_not be_character_device }
    it { should_not be_pipe }
    it { should_not be_socket }
    it { should_not be_symlink }

    its('content') { should eq filedata[:dir_content] }
    its('md5sum') { should eq filedata[:dir_md5sum] }
    its('sha256sum') { should eq filedata[:dir_sha256sum] }
    its('product_version') { should eq nil }
    its('file_version') { should eq nil }
    its('basename') { should cmp 'folder' }
    its('path') { should cmp '/tmp/folder' }

    its('owner') { should eq filedata[:user] }
    its('group') { should eq filedata[:group] }
    its('type') { should eq :directory }
  end
end

if os.windows?
  describe file('C:\Windows') do
    it { should exist }
    it { should be_directory }
    its('basename') { should cmp 'Windows' }
    its('path') { should cmp "C:\\Windows" }
  end

  describe file('C:/Test Directory/test file.txt') do
    it { should exist }
    it { should be_file }
    it { should be_readable.by_user('NT AUTHORITY\SYSTEM') }
    it { should be_allowed('read', by_user: 'NT AUTHORITY\SYSTEM') }
    it { should be_writable.by_user('NT AUTHORITY\SYSTEM') }
    it { should be_allowed('write', by_user: 'NT AUTHORITY\SYSTEM') }
    it { should be_executable.by_user('NT AUTHORITY\SYSTEM') }
    it { should be_allowed('execute', by_user: 'NT AUTHORITY\SYSTEM') }
    it { should_not be_readable.by_user(filedata[:user]) }
    it { should_not be_allowed('read', by_user: filedata[:user]) }
    it { should_not be_writable.by_user(filedata[:user]) }
    it { should_not be_allowed('write', by_user: filedata[:user]) }
    it { should_not be_executable.by_user(filedata[:user]) }
    it { should_not be_allowed('execute', by_user: filedata[:user]) }
  end

  describe file('C:/Test Directory') do
    it { should exist }
    it { should be_directory }
    it { should be_readable.by_user('NT AUTHORITY\SYSTEM') }
    it { should be_allowed('read', by_user: 'NT AUTHORITY\SYSTEM') }
    it { should be_writable.by_user('NT AUTHORITY\SYSTEM') }
    it { should be_allowed('write', by_user: 'NT AUTHORITY\SYSTEM') }
    it { should be_executable.by_user('NT AUTHORITY\SYSTEM') }
    it { should be_allowed('execute', by_user: 'NT AUTHORITY\SYSTEM') }
    it { should_not be_readable.by_user(filedata[:user]) }
    it { should_not be_allowed('read', by_user: filedata[:user]) }
    it { should_not be_writable.by_user(filedata[:user]) }
    it { should_not be_allowed('write', by_user: filedata[:user]) }
    it { should_not be_executable.by_user(filedata[:user]) }
    it { should_not be_allowed('execute', by_user: filedata[:user]) }
  end

  describe file("C:/Program Files (x86)/Windows NT/Accessories/wordpad.exe") do
    it { should exist }
    # Only works on Windows 2012 R2
    its('file_version') { should eq '6.3.9600.17415' }
  end

  # read the owner of a file
  describe directory('C:/opscode/chef') do
    its('owner') { should cmp 'NT AUTHORITY\SYSTEM' }
    it { should be_owned_by 'NT AUTHORITY\SYSTEM' }
    it { should be_allowed('full-control', by_user: 'NT AUTHORITY\SYSTEM') }
    it { should be_allowed('modify', by_user: 'NT AUTHORITY\SYSTEM') }
  end
end
