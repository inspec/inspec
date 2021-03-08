control "deep-skip-outer-01" do
  describe file("/") do
    it { should be_directory }
  end
end

include_controls("deep-skip-mid") do
  skip_control "deep-skip-inner-skipme"
end
