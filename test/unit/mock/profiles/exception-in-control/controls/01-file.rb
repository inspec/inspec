title "Test case 1 for exceptions in the file resource"

control "c01 using file resource on nonexistant file with no property access" do
  f = file("/i/do/not/exist")
  describe "Test block" do
    it { should include "Test" }
  end
end

control "c02 using file resource on nonexistant file with contents access in test block" do
  f = file("/i/do/not/exist")
  describe "Test block" do
    subject { f.content }
    it { should be_nil }
  end
end

control "c03 using file resource on nonexistant file with contents access control block" do
  f = file("/i/do/not/exist")
  c = f.content
  describe "Test block" do
    subject { c }
    it { should be_nil }
  end
end
