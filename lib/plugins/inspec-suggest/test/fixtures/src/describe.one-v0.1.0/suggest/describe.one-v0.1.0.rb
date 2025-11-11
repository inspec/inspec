root_path = input("root_path", value: "/")
control "describe.one-v0.1.0" do
  impact 1.0
  tag category: "app"
  describe.one do
    describe file("/tmp") do
      it { should exist }
    end
    describe file("C:\\temp") do
      it { should exist }
    end
  end
end
