# These controls are dummy controls to be included in the wrapper

control "include-01" do
  impact 2.2
  describe "9999" do
    it { should cmp 9999 }
  end
end

control "include-02" do
  describe "654321" do
    it { should cmp 654321 }
  end
end
