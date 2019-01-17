control "CONTROL super" do
  describe "skippy" do
    skip "This will be skipped super intentionally."
  end
end

control "CONTROL database" do
  describe mysql_session do
    its("something") { should be 3 }
  end
end
