# encoding: utf-8
if ENV['DOCKER']
  STDERR.puts "\033[1;33mTODO: Not running #{__FILE__.split("/").last} because we are running in docker\033[0m"
  return
end

if !os.linux?
  STDERR.puts "\033[1;33mTODO: Not running #{__FILE__} because we are not on linux.\033[0m"
  return
end

# instead of `.with` or `.only_with` we recommend to use the `mount` resource
describe mount '/mnt/iso-disk' do
  it { should be_mounted }
  its('count') { should eq  1 }
  its('device') { should eq '/tmp/empty.iso' }
  its('type') { should eq  'iso9660' }
  its('options') { should eq  ['ro'] }
end
