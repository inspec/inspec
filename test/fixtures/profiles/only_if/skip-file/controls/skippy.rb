control "control-start-02" do
  desc "This control should get skipped"
  describe "a string" do
    it { should cmp "a string" }
  end
end

only_if("I wonder what this will do") { false }

control "control-start-03" do
  desc "This control should get skipped"
  describe "a string" do
    it { should cmp "a string" }
  end
end

control "control-start-04" do
  desc "This control should get skipped"
  describe "a string" do
    it { should cmp "a string" }
  end
end
