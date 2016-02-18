# encoding: utf-8

if os.linux?
  # instead of `.with` or `.only_with` we recommend to use the `mount` resource
  describe mount '/mnt/iso-disk' do
    it { should be_mounted }
    its('count') { should eq  1 }
    its('device') { should eq '/tmp/empty.iso' }
    its('type') { should eq  'iso9660' }
    its('options') { should eq  ['ro'] }
  end
end
