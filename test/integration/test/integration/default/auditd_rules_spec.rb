# encoding: utf-8

# based on operating system we select the available service
return unless os[:family] == 'centos'

describe auditd_rules do
  its('rules') { should contain_match(/^-a always,exit -F arch=b[\d]+ -S open -S openat -F exit=-EACCES -k access/) }
end

describe auditd_rules.status do
  its('backlog') { should cmp 0 }
end
