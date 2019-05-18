if ENV['DOCKER']
  $stderr.puts "\033[1;33mTODO: Not running #{__FILE__.split("/").last} because we are running in docker\033[0m"
  return
end

case os[:family]
when 'ubuntu', 'fedora'
  describe iptables do
    it { should have_rule('-A INPUT -i eth0 -p tcp -m tcp --dport 80 -m state --state NEW -m comment --comment "http on 80" -j ACCEPT') }
    it { should_not have_rule('-A INPUT -i eth1 -p tcp -m tcp --dport 80 -j ACCEPT') }

    # single-word comments have their quotes dropped
    it { should have_rule('-A derby-cognos-web -p tcp -m tcp --dport 80 -m comment --comment derby-cognos-web -j ACCEPT') }
  end
when  'rhel', 'centos'
  describe iptables do
    it { should have_rule('-A INPUT -i eth0 -p tcp -m tcp --dport 80 -m state --state NEW -m comment --comment "http on 80" -j ACCEPT') }
    it { should_not have_rule('-A INPUT -i eth1 -p tcp -m tcp --dport 80 -j ACCEPT') }
  end

  describe iptables do
    it { should have_rule('-A derby-cognos-web -p tcp -m tcp --dport 80 -m comment --comment "derby-cognos-web" -j ACCEPT') }
  end if os[:release] == 6

  describe iptables do
    it { should have_rule('-A derby-cognos-web -p tcp -m tcp --dport 80 -m comment --comment derby-cognos-web -j ACCEPT') }
  end if os[:release] == 7
end
