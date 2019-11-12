control "test_control_01" do
  describe input("test_input_01", value: "value_from_dsl") do
    it { should cmp "value_from_api" }
  end
end
