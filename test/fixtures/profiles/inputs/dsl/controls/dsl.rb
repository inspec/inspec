# copyright: 2021, Chef Software, Inc.
title "Testing all option flags on input through DSL"

control "pattern_flag_success_check" do
  describe input("input_value_01", value: 5, pattern: "^\d*[13579]$") do
    it { should eq 5 }
  end
end

control "pattern_flag_failure_check" do
  describe input("input_value_02", value: 2, pattern: "^\d*[13579]$") do
    it { should eq 2 }
  end
end

control "required_flag_success_check" do
  describe input("input_value_03", value: 5, required: true) do
    it { should eq 5 }
  end
end

control "required_flag_failure_check" do
  describe input("input_value_04", required: true) do
    it { should eq 5 }
  end
end

control "type_flag_success_check" do
  describe input("input_value_05", value: 5, type: "Numeric") do
    it { should eq 5 }
  end
end

control "type_flag_failure_check" do
  describe input("input_value_06", value: 5, type: "String") do
    it { should eq 5 }
  end
end