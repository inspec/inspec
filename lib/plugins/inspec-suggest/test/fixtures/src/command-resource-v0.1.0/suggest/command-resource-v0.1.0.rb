root_path = input("root_path", value: "/")
control "command-resource-v0.1.0" do
  impact 1.0
  tag category: "app"
  describe command("echo inspec is fun") do
    it { should exist }
  end
end
