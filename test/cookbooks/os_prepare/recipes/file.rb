#
# prepares a sample file for verification

if node["platform_family"] != "windows"
  file "/tmp/file" do
    mode "0765"
    content "hello world"
  end

  file "/tmp/sfile" do
    mode "7765"
    content "hello suid/sgid/sticky"
  end

  directory "/tmp/folder" do
    mode "0567"
  end

else

  user "TestUser" do
    password "p@ssw0rd"
  end

  directory 'C:\Test Directory' do
    rights :read, "Administrators"
    rights :read_execute, "Administrators"
    rights :write, "Administrators"
    rights :modify, "Administrators"
    rights :full_control, "Administrators", applies_to_children: true
    deny_rights :read, "TestUser"
    deny_rights :write, "TestUser"
    deny_rights :read_execute, "TestUser"
  end

  file 'C:\Test Directory\test file.txt' do
    rights :read, "Administrators"
    rights :read_execute, "Administrators"
    rights :write, "Administrators"
    rights :modify, "Administrators"
    rights :full_control, "Administrators"
    deny_rights :read, "TestUser"
    deny_rights :write, "TestUser"
    deny_rights :read_execute, "TestUser"
  end

end
