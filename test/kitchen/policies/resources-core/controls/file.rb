describe file('/etc/passwd') do
  its('mode')    { should be 0644 }
  its('owner')   { should eq 'root' }
  its('group')   { should eq 'root' }
  its('content') { should include 'root:' }
  its('uid')     { should eq 0 }
  its('gid')     { should eq 0 }
  its('type')    {should eq :file }
end
