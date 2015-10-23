# encoding: utf-8

# prepare values
if ['ubuntu', 'centos', 'fedora', 'opensuse', 'debian'].include?(os[:family])
  test_values = {
    kernel_panic: 0,
    ip_local_port_range: "32768\t61000",
    forwarding: 0,
    sched_autogroup_enabled: 1,
    nf_log: 'NONE',
  }

  # configue parameter derivations for different OS
  test_values[:sched_autogroup_enabled] = 0 if ['centos', 'debian'].include?(os[:family])

  if (os[:family] == 'ubuntu' && os[:release].to_f == 10.04) ||
     (os[:family] == 'debian' && os[:release].to_i == 6) ||
     (os[:family] == 'centos' && os[:release].to_i == 5) ||
     (os[:family] == 'opensuse')
    test_values[:sched_autogroup_enabled] = nil
  end

  test_values[:nf_log] = nil if os[:family] == 'centos' && os[:release].to_i == 5
  test_values[:kernel_panic] = 90 if os[:family] == 'opensuse'

else
  test_values = {}
end

# test on all linux systems
if os.linux?
  describe kernel_parameter('kernel.panic') do
    its(:value) { should eq test_values[:kernel_panic] }
  end

  describe kernel_parameter('net.netfilter.nf_log.0') do
    its(:value) { should eq test_values[:nf_log] }
  end

  describe kernel_parameter('kernel.sched_autogroup_enabled') do
    its(:value) { should eq test_values[:sched_autogroup_enabled] }
  end

  describe kernel_parameter('net.ipv4.ip_local_port_range') do
    its(:value) { should eq test_values[:ip_local_port_range] }
  end

  describe kernel_parameter('net.ipv4.conf.all.forwarding') do
    its(:value) { should eq test_values[:forwarding] }
  end

  # serverspec compatability
  describe linux_kernel_parameter('net.ipv4.conf.all.forwarding') do
    its(:value) { should eq test_values[:forwarding] }
  end
end
