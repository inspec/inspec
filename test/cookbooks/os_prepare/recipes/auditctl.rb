case node['platform']
when 'centos'
  execute 'auditctl -a always,exit -F arch=b32 -S open -S openat -F exit=-EACCES -k access'
  execute 'auditctl -w /etc/ssh/sshd_config -p rwxa -k sshd_config'
end
