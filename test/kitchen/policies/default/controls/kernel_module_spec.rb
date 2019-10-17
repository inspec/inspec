if ENV['DOCKER']
  $stderr.puts "\033[1;33mTODO: Not running #{__FILE__.split("/").last} because we are running in docker\033[0m"
  return
end

if !os.linux?
  $stderr.puts "\033[1;33mTODO: Not running #{__FILE__} because we are not on linux.\033[0m"
  return
end

# @todo add a disabled kernel module with /bin/true and /bin/false
# Test kernel modules on all linux systems

describe kernel_module('video') do
  it { should be_loaded }
  it { should_not be_disabled }
  it { should_not be_blacklisted }
end

describe kernel_module('video') do
  it { should_not be_blacklisted }
  it { should be_enabled }
end

describe kernel_module('sstfb') do
  it { should_not be_loaded }
  it { should be_disabled }
  it { should be_disabled_via_bin_false }
end

describe kernel_module('nvidiafb') do
  it { should_not be_loaded }
  it { should be_disabled }
  it { should be_disabled_via_bin_true }
end

describe kernel_module('floppy') do
  it { should be_blacklisted }
  it { should_not be_enabled }
end

describe kernel_module('bridge') do
  it { should_not be_loaded }
  it { should_not be_enabled }
end

describe kernel_module('dhcp') do
  it { should_not be_loaded }
end
