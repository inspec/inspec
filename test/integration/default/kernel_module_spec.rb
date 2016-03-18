# encoding: utf-8

# Test kernel modules on all linux systems
if os.linux?

  describe kernel_module('video') do
    it { should be_loaded }
  end

  describe kernel_module('bridge') do
    it { should_not be_loaded }
  end

  describe kernel_module('dhcp') do
    it { should_not be_loaded }
  end
end
