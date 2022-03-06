control "basic custom resource" do
  describe basic do
    its("resource_id") { should cmp "42" }
  end
end
