fixtures = {}
%w{
  delivery_channel_01_name
  config_recorder_for_delivery_channel_role_arn
  s3_bucket_for_delivery_channel_name
  delivery_channel_01_bucket_prefix
  sns_topic_for_delivery_channel_arn
}.each do |fixture_name|
  fixtures[fixture_name] = attribute(
    fixture_name,
    default: "default.#{fixture_name}",
    description: "See ../build/iam.tf"
  )
end

#======================================================#
#         aws_config_delivery_channel - Singular
#======================================================#

#-------------------  Recall / Miss -------------------#

control "aws_config_delivery_channel recall" do

  # Test default singleton return
  describe aws_config_delivery_channel do
    it { should exist }
  end

  # Test scalar param
  describe aws_config_delivery_channel(fixtures["delivery_channel_01_name"]) do
    it { should exist }
  end

  # Test hash parameter
  describe aws_config_delivery_channel(channel_name: fixtures["delivery_channel_01_name"]) do
    it { should exist }
  end

  # Test recorder that doesn't exist
  describe aws_config_delivery_channel(channel_name: "NonExistentChannel") do
    it { should_not exist }
  end
end

#-------------------  Properties -------------------#
control "aws_config_delivery_channel properties" do
  describe aws_config_delivery_channel(fixtures["delivery_channel_01_name"]) do
    its("channel_name") { should eq fixtures["delivery_channel_01_name"] }
    its("s3_bucket_name") { should eq fixtures["s3_bucket_for_delivery_channel_name"] }
    its("s3_key_prefix") { should eq nil }
    its("sns_topic_arn") { should eq fixtures["sns_topic_for_delivery_channel_arn"] }
    its("delivery_frequency_in_hours") { should eq 24 }
    its("delivery_frequency_in_hours") { should be > 3 }
  end

  describe aws_config_delivery_channel do
    its("channel_name") { should eq fixtures["delivery_channel_01_name"] }
  end
end
