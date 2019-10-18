if ENV['DOCKER']
  $stderr.puts "\033[1;33mTODO: Not running #{__FILE__.split("/").last} because we are running in docker\033[0m"
  return
end

# prepare values
if ['ubuntu', 'centos', 'fedora', 'opensuse', 'debian', 'suse'].include?(os[:name])
  test_values = {
    kernel_panic: 0,
    ip_local_port_range: "32768\t61000",
    forwarding: 0,
    sched_autogroup_enabled: 1,
    nf_log: 'NONE',
  }

  # configue parameter derivations for different OS
  test_values[:sched_autogroup_enabled] = 0 if ['centos', 'debian'].include?(os[:name])

  if (os[:name] == 'ubuntu' && os[:release].to_f == 10.04) ||
     (os[:name] == 'debian' && os[:release].to_i == 6) ||
     (os[:name] == 'centos' && os[:release].to_i == 5) ||
     (os[:name] == 'opensuse') ||
     (os[:name] == 'suse')
    test_values[:sched_autogroup_enabled] = nil
  end

  test_values[:nf_log] = nil if os[:name] == 'centos' && os[:release].to_i == 5
  test_values[:kernel_panic] = 90 if os[:name] == 'opensuse'

else
  test_values = {}
end

# test on all linux systems
if os.linux?
  describe kernel_parameter('kernel.panic') do
    its('value') { should eq test_values[:kernel_panic] }
  end

  describe kernel_parameter('net.netfilter.nf_log.0') do
    its('value') { should eq test_values[:nf_log] }
  end

  describe kernel_parameter('kernel.sched_autogroup_enabled') do
    its('value') { should eq test_values[:sched_autogroup_enabled] }
  end

  describe kernel_parameter('net.ipv4.ip_local_port_range') do
    its('value') { should eq test_values[:ip_local_port_range] }
  end

  describe kernel_parameter('net.ipv4.conf.all.forwarding') do
    its('value') { should eq test_values[:forwarding] }
  end
end
