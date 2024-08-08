root_path = input("root_path", value: "/")
control "all-resource-types-v0.1.0" do
  impact 1.0
  tag category: "app"
  describe file("/tmp") do
    it { should exist }
  end
  describe csv("/tmp/somefile.csv") do
    it { should exist }
  end
  describe ini("/tmp/somefile.ini") do
    it { should exist }
  end
  describe json("/tmp/somefile.json") do
    it { should exist }
  end
  describe xml("/tmp/somefile.xml") do
    it { should exist }
  end
  describe yaml("/tmp/somefile.yaml") do
    it { should exist }
  end
end
