title "Test case 2 for exceptions in the sshd_config resource"

control "sshd01 using sshd_config resource nonexistant path with no property access" do
  s = sshd_config("/i/do/not/exist")
  describe "Test block" do
    it { should include "Test" }
  end
end

# sshd02 throws exception but is caught and fails the resource
control "sshd02 sshd_config resource nonexistant path with contents access in test block" do
  s = sshd_config("/i/do/not/exist")
  describe "Test block" do
    subject { s }
    # Next line triggers exception
    its("Protocol") { should be_nil }
  end
end

control "sshd03 sshd_config resource nil path with contents access in test block" do
  s = sshd_config(nil)
  describe "Test block" do
    subject { s }
    its("Protocol") { should be_nil }
  end
end

control "sshd04 sshd_config resource default path with contents access in test block" do
  s = sshd_config
  describe "Test block" do
    subject { s }
    its("Protocol") { should be_nil }
  end
end

# sshd05 throws exception which is not caught, and aborts inspec with stacktrace
# Defective on 2.1.54
control "sshd05 sshd_config resource nonexistant path with contents access control block" do
  s = sshd_config("/i/do/not/exist")
  # Next line triggers compile-time exception
  c = s.Protocol
  describe "Test block" do
    subject { c }
    it { should be_nil }
  end
end
