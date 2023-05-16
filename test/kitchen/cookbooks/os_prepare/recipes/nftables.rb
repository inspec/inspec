if platform_family?("rhel", "debian", "fedora", "suse")
  package "nftables"
  execute "nft flush ruleset"
  execute "nft add table inet filter"
  execute 'nft add chain inet filter INPUT \{ type filter hook input priority 0\; policy accept\; \}'
  execute "nft add chain inet filter derby-cognos-web"
  execute 'nft add set inet filter OPEN_PORTS \{ type ipv4_addr\; size 65536\; flags interval\; \}'
  execute 'nft add rule inet filter INPUT iifname eth0 tcp dport 80 accept comment \"http on 80\"'
  execute "nft add rule inet filter INPUT jump derby-cognos-web"
  execute 'nft add rule inet filter derby-cognos-web tcp dport 80 accept comment "derby-cognos-web"'
  execute 'nft add element inet filter OPEN_PORTS \{ 1.1.1.1/32 \}'
end
