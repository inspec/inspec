title "special-path"

control "normal-profile-1.0" do
  impact 0.7
  title "Test Paths with Special Chars"
  desc "Not a real test, check with `inspec check`"
  describe "foo" do
    it { should eq "foo" }
  end
end
