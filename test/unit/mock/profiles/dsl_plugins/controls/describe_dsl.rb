control "control-02" do

  # A normal, if dull, example group
  describe "describe-01" do
    it { should include "01" }
  end

  # A normal, if dull, example group
  describe "describe-02" do
    it { should include "02" }
    # Try to use a describe_dsl extension
    favorite_vegetable "aubergine"
  end

  describe "describe-03" do
    it { should include "03" }
  end
end
