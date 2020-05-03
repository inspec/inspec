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

control "test_control_numeric_implicit" do
  describe input("test_input_03", value: "value_from_dsl") do
    it { should eq 11 } # Note eq not cmp
  end
end

control "test_control_numeric_type" do
  describe input("test_input_04", value: "value_from_dsl") do
    it { should eq 11 } # Note eq not cmp
  end
end

control "test_control_numeric_float" do
  describe input("test_input_05", value: "value_from_dsl") do
    it { should eq -11.0 } # Note eq not cmp
  end
end
