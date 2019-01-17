control "control-01" do

  # A normal, if dull, example group
  describe "describe-01" do
    it { should include "01" }
  end

  # Try to use a control_dsl extension
  favorite_fruit "Banana"

  # A normal, if dull, example group
  describe "describe-02" do
    it { should include "02" }
  end
end
