fixtures = {}
%w{
  kms_key_enabled_arn
  kms_key_enabled_key_id
  kms_key_disabled_key_id
  kms_key_enabled_key_description
}.each do |fixture_name|
  fixtures[fixture_name] = attribute(
  fixture_name,
  default: "default.#{fixture_name}",
  description: "See ../build/kms.tf"
  )
end

control "aws_kms_key recall" do
  describe aws_kms_key(fixtures["kms_key_enabled_key_id"]) do
    it { should exist }
  end
  describe aws_kms_key(key_id: fixtures["kms_key_enabled_key_id"]) do
    it { should exist }
  end
  describe aws_kms_key("non-existant-key") do
    it { should_not exist }
  end
end

control "aws_kms_key properties" do
  describe aws_kms_key(fixtures["kms_key_enabled_key_id"]) do
    its("key_id") { should eq fixtures["kms_key_enabled_key_id"] }
    its("arn") { should eq fixtures["kms_key_enabled_arn"] }
    its("description") { should eq fixtures["kms_key_enabled_key_description"] }
    its("created_days_ago") { should eq 0 }
    its("key_usage") { should eq "ENCRYPT_DECRYPT" }
    its("key_state") { should eq "Enabled" }
  end
end

control "aws_kms_key matchers" do
  describe aws_kms_key(fixtures["kms_key_enabled_key_id"]) do
    it { should be_enabled }
    it { should_not be_external }
    it { should_not be_managed_by_aws }
    it { should_not have_key_expiration }
  end
  describe aws_kms_key(fixtures["kms_key_enabled_key_id"]) do
    it { should have_rotation_enabled }
  end
  describe aws_kms_key(fixtures["kms_key_disabled_key_id"]) do
    it { should_not have_rotation_enabled }
  end
end
