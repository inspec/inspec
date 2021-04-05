control "timeout-test-01" do
  # Do something that will timeout, with inline timeout option
  describe command("sleep 10; echo oops", timeout: 2) do
    its("stdout") { should be_empty }
  end

  # Validate that the connection still works after a timeout
  describe command("echo hello") do
    its("exit_status") { should cmp 0 }
  end
end
