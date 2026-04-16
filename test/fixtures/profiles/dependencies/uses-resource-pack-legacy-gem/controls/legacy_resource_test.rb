control "legacy-resource-control" do
  describe legacy_demo_resource do
    its("legacy_awesomeness") { should cmp "legacy_extreme" }
  end
end
