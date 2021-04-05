control "test_control_01" do
  describe input("test_input_01", value: "value_from_dsl") do
    it { should cmp "value_from_api" }
  end

  describe input("test_input_hash_string", value: { "string_key": "string_value_dsl" }) do
    its(["string_key"]) { should eq "string_value" }
  end

  describe input("test_input_hash_symbol", value: { symbol_key: :symbol_value_dsl }) do
    its([:symbol_key]) { should eq :symbol_value }
  end
end
