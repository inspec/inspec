# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

describe file('/tmp') do
  it { should exist }
end

describe file('/tmpest') do
  it { should_not exist }
end

describe file('/tmp') do
  its(:type) { should eq :directory }
  it { should be_directory }
end

describe file('/proc/version') do
  its(:type) { should eq :file }
  it { should be_file }
  it { should_not be_directory }
end

describe file('/dev/stdout') do
  its(:type) { should eq :symlink }
  it { should be_symlink }
  it { should_not be_file }
  it { should_not be_directory }
end

describe file('/dev/zero') do
  its(:type) { should eq :character_device }
  it { should be_character_device }
  it { should_not be_file }
  it { should_not be_directory }
end

# describe file('...') do
#   its(:type) { should eq :block_device }
#   it { should be_block_device }
# end

# describe file('...') do
#   its(:type) { should eq :socket }
#   it { should be_socket }
# end

# describe file('...') do
#   its(:type) { should eq :pipe }
#   it { should be_pipe }
# end

describe file('/dev') do
  its(:mode) { should eq 00755 }
end

describe file('/dev') do
  it { should be_mode 00755 }
end

describe file('/root') do
  its(:owner) { should eq 'root' }
end

describe file('/dev') do
  it { should be_owned_by 'root' }
end

describe file('/root') do
  its(:group) { should eq 'root' }
end

describe file('/dev') do
  it { should be_grouped_into 'root' }
end

describe file('/dev/kcore') do
  its(:link_path) { should eq '/proc/kcore' }
end

describe file('/dev/kcore') do
  it { should be_linked_to '/proc/kcore' }
end

describe file('/proc/cpuinfo') do
  its(:content) { should match /^processor/ }
end

describe file('/').mtime.to_i do
  it { should <= Time.now.to_i }
  it { should >= Time.now.to_i - 1000}
end

describe file('/') do
  its(:size) { should be > 64 }
  its(:size) { should be < 10240 }
end

describe file('/proc/cpuinfo') do
  its(:size) { should be 0 }
end

# @TODO selinux_label

# @TODO skip as the mount command is not reliably present on all test containers
# describe file('/proc') do
#   it { should be_mounted }
# end

describe file('/proc/cpuinfo') do
  it { should_not be_mounted }
end

# @TODO immutable?
# @TODO product_version
# @TODO file_version
# @TODO version?

require 'digest'
cpuinfo = file('/proc/cpuinfo').content

md5sum = Digest::MD5.hexdigest(cpuinfo)
describe file('/proc/cpuinfo') do
  its(:md5sum) { should eq md5sum }
end

sha256sum = Digest::SHA256.hexdigest(cpuinfo)
describe file('/proc/cpuinfo') do
  its(:sha256sum) { should eq sha256sum }
end
