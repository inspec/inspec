control "deep-skip-mid-01" do
  describe file("/") do
    it { should be_directory }
  end
end

include_controls("deep-skip-inner") do
  # Issue 5300: this control should be skipped without this line
  # skip_control "deep-skip-inner-skipme"
end
