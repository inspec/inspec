control "control-start-01" do
  desc "This control should not get skipped"
  describe "a string" do
    it { should cmp "a string" }
  end
end
