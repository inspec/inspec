fixtures = {}
[
  'delivery_channel_01',
  'config_recorder_for_delivery_channel_role_arn',
  's3_bucket_for_delivery_channel',
  'delivery_channel_01_bucket_prefix',
  'sns_topic_for_delivery_channel_arn'
].each do |fixture_name|
  fixtures[fixture_name] = attribute(
    fixture_name,
    default: "default.#{fixture_name}",
    description: 'See ../build/iam.tf',
  )
end

#======================================================#
#         aws_config_delivery_channel - Singular
#======================================================#

#-------------------  Recall / Miss -------------------#

control "aws_config_delivery_channel recall" do
  # Test scalar param
  describe aws_config_delivery_channel(fixtures['delivery_channel_01']) do
    it { should exist }
  end
  
  # Test hash parameter
  describe aws_config_delivery_channel(channel_name: fixtures['delivery_channel_01']) do
    it { should exist }
  end
  
  # Test recorder that doesnt exist
  describe aws_config_delivery_channel(channel_name: 'NonExistentChannel') do
    it { should_not exist }
  end
end

#-------------------  Properties -------------------#
control "aws_config_delivery_channel properties" do
  describe aws_config_delivery_channel(fixtures['delivery_channel_01']) do
    its('s3_bucket_name') { should eq fixtures['s3_bucket_for_delivery_channel'] }
    its('s3_key_prefix') { should eq nil }
    its('sns_topic_arn') { should eq fixtures['sns_topic_for_delivery_channel_arn'] }
    its('delivery_frequency_in_hours') { should eq 24 }
    its('delivery_frequency_in_hours') { should be > 3 }
  end
end
