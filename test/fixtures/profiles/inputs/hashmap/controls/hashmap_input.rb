# copyright: 2021, Chef Software, Inc.
title "Verifying loading of hashmap inputs using metadata and external file"

control "hashmap-metadata" do
  title "Verifying loading of hashmap inputs using metadata file"

  describe input("metadata_hash") do
    its(["metadata_hash_key_str"]) { should eq "metadata_hash_value_str" }
    its([:metadata_hash_key_sym]) { should eq "metadata_hash_value_sym" }
  end
end

control "hashmap-external-file" do
  title "Verifying loading of hashmap inputs using external file"

  describe input("external_input_hash") do
    its(["external_input_hash_key_str"]) { should eq "external_input_hash_value_str" }
    its([:external_input_hash_key_sym]) { should eq "external_input_hash_value_sym" }
  end
end

control "hashmap-profile-DSL" do
  title "Verifying loading of hashmap inputs using profile DSL"

  describe input("dsl_hash_string", value: { "dsl_hash_string_key": "dsl_hash_string_value" } ) do
    its(["dsl_hash_string_key"]) { should eq "dsl_hash_string_value" }
  end

  describe input("dsl_hash_symbol", value: { dsl_hash_symbol_key: :dsl_hash_symbol_value } ) do
    its([:dsl_hash_symbol_key]) { should eq :dsl_hash_symbol_value }
  end
end