if ENV['DOCKER']
  $stderr.puts "\033[1;33mTODO: Not running #{__FILE__.split("/").last} because we are running in docker\033[0m"
  return
end

if !os.linux?
  $stderr.puts "\033[1;33mTODO: Not running #{__FILE__} because we are not on linux.\033[0m"
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
