# These controls are dummy controls to be required in the wrapper

control "require-01" do
  describe "123456" do
    it { should cmp "123456" }
  end
end

control "require-02" do
  impact 1.1
  describe "1234" do
    it { should cmp "1234" }
  end
end
