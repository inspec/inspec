control "deep-skip-inner-01" do
  describe file("/") do
    it { should be_directory }
  end
end

control "deep-skip-inner-skipme" do
  describe file("/") do
    it { should be_directory }
  end
end
