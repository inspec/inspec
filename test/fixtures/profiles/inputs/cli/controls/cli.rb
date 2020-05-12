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
    it { should be_a Integer }
  end
end

control "test_control_numeric_type" do
  describe input("test_input_04", value: "value_from_dsl") do
    it { should be_a Integer }
  end
end

control "test_control_numeric_float" do
  describe input("test_input_05", value: "value_from_dsl") do
    it { should be_a Float }
  end
end

control "test_control_yaml_array" do
  describe input("test_input_06", value: "value_from_dsl") do
    it { should eq [ "a", "b", "c" ] }
  end
end

control "test_control_yaml_hash" do
  describe input("test_input_07", value: "value_from_dsl") do
    # Parser keeps tripping up on this when inlined
    expected = { "a" => "apples", "b" => "bananas", "c" => "cantelopes" }
    it { should eq expected }
  end
end

control "test_control_yaml_deep" do
  describe input("test_input_09", value: "value_from_dsl") do
    # Parser keeps tripping up on this when inlined
    expected = { "a" => "apples", "g" => ["grape01", "grape02"] }
    it { should eq expected }
  end
end

control "test_control_json_array" do
  describe input("test_input_10", value: "value_from_dsl") do
    it { should eq [ "a", "b", "c" ] }
  end
end

control "test_control_json_hash" do
  describe input("test_input_11", value: "value_from_dsl") do
    # Parser keeps tripping up on this when inlined
    expected = { "a" => "apples", "b" => "bananas", "c" => "cantelopes" }
    it { should eq expected }
  end
end

control "test_control_json_deep" do
  describe input("test_input_12", value: "value_from_dsl") do
    # Parser keeps tripping up on this when inlined
    expected = { "a" => "apples", "g" => ["grape01", "grape02"] }
    it { should eq expected }
  end
end

control "test_control_bool_true" do
  describe input("test_input_13", value: "value_from_dsl") do
    it { should be_a TrueClass }
  end
end

control "test_control_bool_false" do
  describe input("test_input_14", value: "value_from_dsl") do
    it { should be_a FalseClass }
  end
end

control "test_control_bool_true_caps" do
  describe input("test_input_15", value: "value_from_dsl") do
    it { should be_a TrueClass }
  end
end
