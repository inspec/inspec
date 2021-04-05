# copyright: 218, The Authors
title "Verifying loading of hashmap inputs using metadata and external file"

control "hashmap-metadata" do
  title "Verifying loading of hashmap inputs using metadata file"

  describe input("metadata_basic_key") do
    it { should cmp "metadata_basic_value" }
  end

  describe input("metadata_nested_key") do
    its(["metadata_nested_key_str"]) { should eq "metadata_nested_value_str" }
    its([:metadata_nested_key_sym]) { should eq "metadata_nested_value_sym" }
  end
end

control "hashmap-external-file" do
  title "Verifying loading of hashmap inputs using external file"

  describe input("external_attribute_basic_key") do
    it { should cmp "external_attribute_basic_value" }
  end

  describe input("external_attribute_nested_key") do
    its(["external_attribute_nested_key_str"]) { should eq "external_attribute_nested_value_str" }
    its([:external_attribute_nested_key_sym]) { should eq "external_attribute_nested_value_sym" }
  end
end

control "hashmap-profile-DSL" do
  title "Verifying loading of hashmap inputs using profile DSL"

  describe input("dsl_basic_key", value: "dsl_basic_value") do
    it { should cmp "dsl_basic_value" }
  end

  describe input("dsl_hash_string", value: { "dsl_nested_key_str": "dsl_nested_value_str" } ) do
    its(["dsl_nested_key_str"]) { should eq "dsl_nested_value_str" }
  end

  describe input("dsl_hash_symbol", value: { dsl_nested_key_sym: :dsl_nested_value_sym } ) do
    its([:dsl_nested_key_sym]) { should eq :dsl_nested_value_sym }
  end
end