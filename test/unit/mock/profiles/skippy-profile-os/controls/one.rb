describe command("touch /tmp/inspec_test_DONT_CREATE") do
  its("exit_status") { should eq 123 }
end
