# encoding: utf-8
# author: Stephan Renatus

case node['platform']
when 'centos'
  execute 'auditctl -a always,exit -F arch=b32 -S open -S openat -F exit=-EACCES -k access'
end
