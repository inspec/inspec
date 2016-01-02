# encoding: utf-8

# instead of `.with` or `.only_with` we recommend to use the `mount` resource
describe mount '/mnt/iso-disk' do
  it { should be_mounted }
  its('device') { should eq '/root/alpine-3.3.0-x86_64.iso' }
  its('type') { should eq  'iso9660' }
  its('options') { should eq  ['ro'] }
end
