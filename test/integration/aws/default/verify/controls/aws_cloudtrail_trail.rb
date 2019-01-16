fixtures = {}
%w{
  cloudtrail_trail_1_cloud_watch_logs_group_arn
  cloudtrail_trail_1_cloud_watch_logs_role_arn
  cloudtrail_trail_1_key_arn
  cloudtrail_trail_1_name
  cloudtrail_trail_1_arn
  cloudtrail_trail_1_s3_bucket_name
  cloudtrail_trail_2_name
  cloudtrail_trail_2_arn
  cloudtrail_trail_2_s3_bucket_name
}.each do |fixture_name|
  fixtures[fixture_name] = attribute(
    fixture_name,
    default: "default.#{fixture_name}",
    description: "See ../build/cloudtrail.tf"
  )
end

control "aws_cloudtrail_trail recall" do
  describe aws_cloudtrail_trail(fixtures["cloudtrail_trail_1_name"]) do
    it { should exist }
  end

  describe aws_cloudtrail_trail(trail_name: fixtures["cloudtrail_trail_2_name"]) do
    it { should exist }
  end

  describe aws_cloudtrail_trail("non-existant-trail") do
    it { should_not exist }
  end
end

control "aws_cloudtrail_trail properties" do
  describe aws_cloudtrail_trail(fixtures["cloudtrail_trail_1_name"]) do
    its("s3_bucket_name") { should eq fixtures["cloudtrail_trail_1_s3_bucket_name"] }
    its("trail_arn") { should eq fixtures["cloudtrail_trail_1_arn"] }
    its("cloud_watch_logs_role_arn") { should eq fixtures["cloudtrail_trail_1_cloud_watch_logs_role_arn"] }
    its("cloud_watch_logs_log_group_arn") { should eq fixtures["cloudtrail_trail_1_cloud_watch_logs_group_arn"] }
    its("kms_key_id") { should eq fixtures["cloudtrail_trail_1_key_arn"] }
    its("delivered_logs_days_ago") { should eq 0 }
  end
  describe aws_cloudtrail_trail(fixtures["cloudtrail_trail_2_name"]) do
    its("s3_bucket_name") { should eq fixtures["cloudtrail_trail_2_s3_bucket_name"] }
    its("trail_arn") { should eq fixtures["cloudtrail_trail_2_arn"] }
    its("cloud_watch_logs_role_arn") { should be_nil }
    its("cloud_watch_logs_log_group_arn") { should be_nil }
    its("kms_key_id") { should be_nil }
  end
end

control "aws_cloudtrail_trail matchers" do
  describe aws_cloudtrail_trail(fixtures["cloudtrail_trail_1_name"]) do
    it { should be_encrypted }
  end
  describe aws_cloudtrail_trail(fixtures["cloudtrail_trail_2_name"]) do
    it { should_not be_encrypted }
  end
  describe aws_cloudtrail_trail(fixtures["cloudtrail_trail_1_name"]) do
    it { should be_multi_region_trail }
  end
  describe aws_cloudtrail_trail(fixtures["cloudtrail_trail_2_name"]) do
    it { should_not be_multi_region_trail }
  end
  describe aws_cloudtrail_trail(fixtures["cloudtrail_trail_1_name"]) do
    it { should be_log_file_validation_enabled }
  end
  describe aws_cloudtrail_trail(fixtures["cloudtrail_trail_2_name"]) do
    it { should_not be_log_file_validation_enabled }
  end
end
