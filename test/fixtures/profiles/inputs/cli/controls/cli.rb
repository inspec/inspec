control "test_control_01" do
  describe input("test_input_01", value: "value_from_dsl") do
    it { should cmp "value_from_cli_01"}
  end
end
control "test_control_02" do
  describe input("test_input_02", value: "value_from_dsl") do
    it { should cmp "value_from_cli_02"}
  end
end
