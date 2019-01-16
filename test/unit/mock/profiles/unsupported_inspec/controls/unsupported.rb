control "unsupported control" do
  describe "this should be skipped" do
    it { should eq "false" }
  end
end

control "unsupported control 2" do
  describe "this should also be skipped" do
    it { should eq "false" }
  end
end
