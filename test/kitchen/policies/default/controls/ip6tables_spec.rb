unless ENV['IPV6']
  $stderr.puts "\033[1;33mTODO: Not running #{__FILE__.split("/").last} because we are running without IPv6\033[0m"
  return
end
if ENV['NFTABLES']
  $stderr.puts "\033[1;33mTODO: Not running #{__FILE__.split("/").last} because we are running with nftables\033[0m"
  return
end

case os[:family]
when 'ubuntu', 'fedora', 'debian', 'suse'
  describe ip6tables do
    it { should have_rule('-A INPUT -i eth0 -p tcp -m tcp --dport 80 -m state --state NEW -m comment --comment "http v6 on 80" -j ACCEPT') }
    it { should_not have_rule('-A INPUT -i eth1 -p tcp -m tcp --dport 80 -j ACCEPT') }

    # single-word comments have their quotes dropped
    it { should have_rule('-A derby-cognos-web-v6 -p tcp -m tcp --dport 80 -m comment --comment derby-cognos-web-v6 -j ACCEPT') }
  end
when  'redhat', 'centos'
  describe ip6tables do
    it { should have_rule('-A INPUT -i eth0 -p tcp -m tcp --dport 80 -m state --state NEW -m comment --comment "http v6 on 80" -j ACCEPT') }
    it { should_not have_rule('-A INPUT -i eth1 -p tcp -m tcp --dport 80 -j ACCEPT') }
  end

  describe ip6tables do
    it { should have_rule('-A derby-cognos-web-v6 -p tcp -m tcp --dport 80 -m comment --comment "derby-cognos-web-v6" -j ACCEPT') }
  end if os[:release] == 6

  describe ip6tables do
    it { should have_rule('-A derby-cognos-web-v6 -p tcp -m tcp --dport 80 -m comment --comment derby-cognos-web-v6 -j ACCEPT') }
  end if os[:release] == 7
end
