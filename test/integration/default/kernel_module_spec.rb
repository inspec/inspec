# encoding: utf-8

# TODO: do not run those tests on docker yet
return if ENV['DOCKER']
return unless os.linux?

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
