# encoding: utf-8
if ENV['DOCKER']
  STDERR.puts "\033[1;33mTODO: Not running #{__FILE__.split("/").last} because we are running in docker\033[0m"
  return
end

if !os.linux?
  STDERR.puts "\033[1;33mTODO: Not running #{__FILE__} because we are not on linux.\033[0m"
  return
end

# Test kernel modules on all linux systems
describe kernel_module('video') do
  it { should be_loaded }
end

describe kernel_module('bridge') do
  it { should_not be_loaded }
end

describe kernel_module('dhcp') do
  it { should_not be_loaded }
end
