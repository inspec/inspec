# A normal input should work normally
control "read-a-cleartext-input" do
  describe input("cleartext_input") do
    it { should eq "visible-in-clear" }
  end
end

# A sensitive input should be able to be
# read internally by InSpec but have its
# value obscured in reporters input listings
# (this does not affect the test message output)
control "read-a-sensitve-input" do
  describe input("sensitive_input") do
    it { should eq "visible-in-secret" }
  end
end

# An input with sensitive = false should work normally
control "read-an-explicitly-nonsesnitve-input" do
  describe input("explicitly_nonsensitive_input") do
    it { should eq "visible-in-clear" }
  end
end

