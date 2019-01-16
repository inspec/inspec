control "rdsl-control-01" do
  # A normal, if dull, example group
  describe "describe-01" do
    it { should include "01" }
  end
end

control "rdsl-control-02" do
  # Try to use a resource that uses a Resource DSL extension
  describe favorite_berry("gooseberry") do
    it { should be_blendable }
  end

  # This directly relies on the effects of the plugin
  describe favorite_berry("hackberry") do
    it { should have_drupals }
  end
end

control "rdsl-control-03" do
  # A normal, if dull, example group
  describe "describe-03" do
    it { should include "03" }
  end
end
