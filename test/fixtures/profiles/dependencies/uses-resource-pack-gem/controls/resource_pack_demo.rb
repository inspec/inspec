control "demo-control" do
  describe demo_resource do
    its("awesomeness") { should cmp "extreme" }
  end
end
