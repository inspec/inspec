root_path = input("root_path", value: "/")
control "variable-describe-v0.1.0" do
  impact 1.0
  tag category: "app"
  # Fool the checker into a false positive by setting a variable and then referencing it
  myvar = file("/tmp")
  describe myvar do
    it { should exist }
  end
end
