# encoding: utf-8
# author: Joseph Benden

return unless os.bsd?
return unless command('/sbin/zfs').exist?
return unless command('/sbin/zpool').exist?

describe zfs_pool('tank') do
  it { should exist }
  its('failmode') { should eq('continue') }
end

describe zfs_dataset('tank/tmp') do
  it { should exist }
  its('exec') { should eq('off') }
end
