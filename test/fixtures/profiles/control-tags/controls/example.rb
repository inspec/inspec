control "basic" do
  tag "tag1"
  tag :symbol_key1, :symbol_key2
  tag severity: nil
  tag data: "tag2"
  tag data_arr: ["tag3", "tag4"]
  tag error1: "Line with a line-feed
  error"
  tag error2: "Line with a comma,error"
  tag cci: ['CCI-000366']
  tag legacy: []
  tag nist: ["AU-9", "AU-9 (3)", "AC-3 (4)", "AC-6 (10)"]
  tag ref: "http:example.html:CIS CSC v6.0 #5.1;"
  describe(true) { it { should eq true } }
end

control "tag keyword used in control name and tag value" do
  tag "tag5"
  describe(true) { it { should eq true } }
end

control "multiple tags in one line" do
  tag "tag6", "tag7", "tagname with space"
  tag data1: "tag8", data2: "tag9"
  tag data_arr1: ["tag10", "tag11"], data_arr2: ["tag12", "tag13"]
  describe(true) { it { should eq true } }
end

control "all different formats of tags in one line" do
  tag "tag14", data: "tag15", data_arr: ["tag16", "tag17"]
  describe(true) { it { should eq true } }
end

control "failure control" do
  tag "tag18"
  describe(true) { it { should eq false } }
end