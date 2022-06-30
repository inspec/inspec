# Error
control "tmp-1.0.1" do
  impact 0.7
  describe "a.1" do
    it { should_bot "a.1" }
  end
end

control "tmp-1.0.2" do
  impact 0.0
  describe "a.2" do
    it { should_bot "a.2" }
  end
end

# Not Applicable
control "tmp-2.0.1" do
  impact 0.0
  describe "b.1" do
    it { should cmp "b.1" }
  end
end

control "tmp-2.0.2" do
  impact 0.0
  only_if { false }
  describe "b.2" do
    it { should cmp "b.2" }
  end
end

# Not Reviewed
control "tmp-3.0.1" do
  only_if { false }
  describe "c.1" do
    it { should cmp "c.1" }
  end
end

control "tmp-3.0.2" do
  only_if { false }
  describe "c.2" do
    it { should_bot "c.2" }
  end
end

# Failed
control "tmp-4.0" do
  impact 0.7
  describe "d.1" do
    it { should_not cmp "d.1" }
    it { should cmp "d.1" }
  end
end

# Passed
control "tmp-5.0" do
  impact 0.7
  describe "e.1" do
    it { should cmp "e.1" }
  end
end
