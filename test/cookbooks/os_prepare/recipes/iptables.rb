if platform_family?('rhel', 'debian', 'fedora')
  execute 'iptables -A INPUT -i eth0 -p tcp -m tcp '\
          '--dport 80 -m state --state NEW -m comment '\
          '--comment "http on 80" -j ACCEPT'
  execute 'iptables -N derby-cognos-web'
  execute 'iptables -A INPUT -j derby-cognos-web'
  execute 'iptables -A derby-cognos-web -p tcp -m tcp --dport 80 '\
          '-m comment --comment "derby-cognos-web" -j ACCEPT'
end
