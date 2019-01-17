control "control-01" do

  # A normal, if dull, example group
  describe "describe-01" do
    it { should include "01" }
  end

  # A normal, if dull, example group
  describe "describe-02" do
    it do
      # Try to use a test_dsl extension
      favorite_legume "edemame"
      should include "02"
    end
  end

  describe "describe-03" do
    it { should include "03" }
  end
end
