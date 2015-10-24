# encoding: utf-8

# test regular file
describe file('/tmp/file') do
  it { should exist }
  it { should_not be_block_device }
  it { should_not be_character_device }
  it { should_not be_directory }
  it { should be_file }
  it { should_not be_pipe }
  it { should_not be_socket }
  it { should_not be_symlink }

  # it { should have_mode }
  # it { should be_executable }
  # it { should be_grouped_into 'group' }
  # it { should be_immutable }
  # it { should_not be_mounted }
  # it { should be_owned_by 'root' }
  # it { should be_readable }
  # it { should be_readable.by('root') }
  # it { should be_readable.by_user('root') }
  # it { should be_writable }
  # it { should be_writable.by('root') }
  # it { should be_writable.by_user('root') }

  its('content') { should eq 'hello world' }
  its('content') { should match('world') }
  its('group') { should eq 'root' }
  its('md5sum') { should eq '5eb63bbbe01eeed093cb22bb8f5acdc3' }
  its('sha256sum') { should eq 'b94d27b9934d3e08a52e52d7da7dabfac484efe37a5380ee9088f7ace2efcde9' }
  its('product_version') { should eq nil }
  its('file_version') { should eq nil }
  its('owner') { should eq 'root' }
  its('size') { should eq 11 }
  its('type') { should eq :file }
end

describe file('/tmp') do
  it { should exist }
  it { should_not be_block_device }
  it { should_not be_character_device }
  it { should be_directory }
  it { should_not be_file }
  it { should_not be_pipe }
  it { should_not be_socket }
  it { should_not be_symlink }

  # if os[:family] == 'freebsd'
  #   its('content') { should eq "\u0003\u0000" }
  #   its('md5sum') { should eq '598f4fe64aefab8f00bcbea4c9239abf' }
  #   its('sha256sum') { should eq '9b4fb24edd6d1d8830e272398263cdbf026b97392cc35387b991dc0248a628f9' }
  # else
  its('content') { should eq nil }
  its('md5sum') { should eq nil }
  its('sha256sum') { should eq nil }
  # end

  its('product_version') { should eq nil }
  its('file_version') { should eq nil }
  its('owner') { should eq 'root' }
  its('type') { should eq :directory }
end
