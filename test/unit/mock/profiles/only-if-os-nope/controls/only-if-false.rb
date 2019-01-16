title "only-if-os-nope"

only_if { os.name.include("nope") }

control "only-if-os-nope-1.0" do
  impact 1.0
  title "Test `only_if` in a control raising an error"
  desc "Not a real test, check with `inspec check`"
  only_if { os.name.include("nope") }
  describe "foo" do
    it { should eq "foo" }
  end
end
