# copyright: 218, The Authors
title "Verifying loading of hashmap inputs using metadata and external file"

# controls to test metadata file hash traversing

control "hashmap-metadata" do
  title "Verifying loading of hashmap inputs using metadata file"

  describe input('metadata_basic_key') do
    it { should cmp 'metadata_basic_value' }
  end

  describe input('metadata_nested_key') do
    its(['metadata_nested_key_str']) { should eq 'metadata_nested_value_str' }
    its([:metadata_nested_key_sym]) { should eq 'metadata_nested_value_sym' }
  end
end

# controls to test external attribute file hash traversing

control "hashmap-external-file" do
  title "Verifying loading of hashmap inputs using external file"

  describe input('external_attribute_basic_key') do
    it { should cmp 'external_attribute_basic_value' }
  end

  describe input('external_attribute_nested_key') do
    its(['external_attribute_nested_key_str']) { should eq 'external_attribute_nested_value_str' }
    its([:external_attribute_nested_key_sym]) { should eq 'external_attribute_nested_value_sym' }
  end
end