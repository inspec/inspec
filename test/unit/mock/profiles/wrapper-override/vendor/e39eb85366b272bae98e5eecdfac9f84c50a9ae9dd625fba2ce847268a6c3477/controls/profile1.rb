control "pro1-con1" do
  impact 0.8
  title "Profile 1 - Control 1"
  desc "Profile 1 - Control 1 description"
  tag "hosts", "file"
  tag cce: "CCE-27072-8"
  describe file("/etc/hosts") do
    its("mode") { should eq 0644 }
  end
end

control "pro1-con2" do
  impact 0.9
  title "Profile 1 - Control 2"
  desc "Profile 1 - Control 2 description"
  desc "overwrite me", "overwrite this"
  tag "password"
  describe file("/etc/passwdddddddddd") do
    it { should exist }
  end
end

control "pro1-con3" do
  impact 1
  title "Profile 1 - Control 3 - useless"
  desc "Profile 1 - Control 3 description"
  describe file("/tmp5") do
    it { should exist }
  end
end
