unless ENV['NFTABLES']
  $stderr.puts "\033[1;33mTODO: Not running #{__FILE__.split("/").last} because we are running with iptables\033[0m"
  return
end

case os[:family]
when 'ubuntu', 'fedora', 'debian', 'suse', 'redhat', 'centos'
  describe nftables(family: 'inet', table: 'filter', chain: 'INPUT') do
    its('type') { should eq 'filter' }
    its('hook') { should eq 'input' }
    its('prio') { should eq 0 }
    its('policy') { should eq 'accept' }
    it { should have_rule('iifname "eth0" tcp dport 80 accept comment "http on 80"') }
    it { should_not have_rule('iifname "eth1" tcp dport 80 accept') }
  end

  describe nftables(family: 'inet', table: 'filter', set: 'OPEN_PORTS') do
    its('type') { should eq 'ipv4_addr' }
    its('flags') { should include 'interval' }
    it { should have_element('1.1.1.1') }
    it { should_not have_element('2.2.2.2') }
  end
end
