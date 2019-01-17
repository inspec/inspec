title "spelt"

control "control-01" do
  # A normal, if dull, example group
  describe "describe-01" do
    it { should include "01" }
  end
end

# Try to use a outer_profile_dsl extension
# This will generate a new control
favorite_grain "sorghum"

control "control-03" do
  # A normal, if dull, example group
  describe "describe-03" do
    it { should include "03" }
  end
end
