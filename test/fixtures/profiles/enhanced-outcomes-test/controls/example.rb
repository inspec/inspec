# Error
control "tmp-1.0.1" do
  impact 0.7
  describe file("/tmp") do
    it { should_bot be_directory }
  end
end

control "tmp-1.0.2" do
  impact 0.0
  describe file("/tmp") do
    it { should_bot be_directory }
  end
end

# Not Applicable
control "tmp-2.0.1" do
  impact 0.0
  describe file("/tmp") do
    it { should be_directory }
  end
end

control "tmp-2.0.2" do
  impact 0.0
  only_if { false }
  describe file("/tmp") do
    it { should be_directory }
  end
end

# Not Reviewed
control "tmp-3.0.1" do
  only_if { false }
  describe file("/tmp") do
    it { should be_directory }
  end
end

control "tmp-3.0.2" do
  only_if { false }
  describe file("/tmp") do
    it { should_bot be_directory }
  end
end

# Failed
control "tmp-4.0" do
  impact 0.7
  title "Create /tmp directory"
  desc "An optional description..."
  describe file("/tmp") do
    it { should_not be_directory }
    it { should be_directory }
  end
end

# Passed
control "tmp-5.0" do
  impact 0.7
  title "Create /tmp directory"
  desc "An optional description..."
  describe file("/tmp") do
    it { should be_directory }
    it { should exist }
  end
end
