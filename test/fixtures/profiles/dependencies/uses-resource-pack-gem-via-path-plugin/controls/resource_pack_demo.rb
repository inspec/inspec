control "demo-control-path-plugin" do
  describe demo_resource do
    its("awesomeness") { should cmp "extreme" }
  end
end
