# encoding: utf-8

if os[:family] == 'freebsd'
  filedata = {
    user: 'root',
    group: 'wheel',
    dir_content: "\u0003\u0000",
    dir_md5sum: '598f4fe64aefab8f00bcbea4c9239abf',
    dir_sha256sum: '9b4fb24edd6d1d8830e272398263cdbf026b97392cc35387b991dc0248a628f9',
  }
elsif os[:family] == 'aix'
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

    it { should be_readable }
    it { should be_readable.by('owner') }
    it { should be_readable.by('group') }
    it { should be_readable.by('other') }
    it { should be_readable.by_user(filedata[:user]) }
    it { should_not be_readable.by_user('noroot') }
    # for server spec compatibility
    it { should be_readable.by('others') }

    it { should be_writable }
    it { should be_writable.by('owner') }
    it { should be_writable.by('group') }
    it { should_not be_writable.by('other') }
    it { should be_writable.by_user(filedata[:user]) }
    # it { should_not be_writable.by_user('noroot') }
    # for server spec compatibility
    it { should_not be_writable.by('others') }

    it { should be_executable }
    it { should be_executable.by('owner') }
    it { should_not be_executable.by('group') }
    it { should be_executable.by('other') }
    it { should be_executable.by_user(filedata[:user]) }
    # it { should_not be_executable.by_user('noroot') }
    # for server spec compatibility
    it { should be_executable.by('others') }

    # test extended linux attributes
    # it { should be_immutable }

    its('content') { should eq 'hello world' }
    its('content') { should match('world') }
    its('size') { should eq 11 }
    its('md5sum') { should eq '5eb63bbbe01eeed093cb22bb8f5acdc3' }
    its('sha256sum') { should eq 'b94d27b9934d3e08a52e52d7da7dabfac484efe37a5380ee9088f7ace2efcde9' }
    its('product_version') { should eq nil }
    its('file_version') { should eq nil }

    its('owner') { should eq filedata[:user] }
    its('group') { should eq filedata[:group] }
    its('type') { should eq :file }
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

    its('owner') { should eq filedata[:user] }
    its('group') { should eq filedata[:group] }
    its('type') { should eq :directory }
  end
end

# check file mount on linux
if os.linux?
  # for server spec compatibility
  # Do not use `.with` or `.only_with`, this syntax is deprecated and will be removed
  # in InSpec version 1
  describe file('/mnt/iso-disk') do
    it { should be_mounted }
    it { should be_mounted.with( :type => 'iso9660' ) }
    it { should be_mounted.with( :type => 'iso9660', :options => { :ro => true } ) }
    it { should be_mounted.with( :type => 'iso9660', :device => '/tmp/empty.iso' ) }
    it { should_not be_mounted.with( :type => 'ext4' ) }
    it { should_not be_mounted.with( :type => 'xfs' ) }
  end

  # compare with exact match
  # also see mount_spec.rb
  describe file('/mnt/iso-disk') do
    it { should be_mounted.only_with( {
      :device=>"/tmp/empty.iso",
      :type=>"iso9660",
      :options=>{
        :ro=>true}
      })
    }
  end
end

if os.windows?
  describe file('C:\\Windows') do
    it { should exist }
    it { should be_directory }
  end
end
