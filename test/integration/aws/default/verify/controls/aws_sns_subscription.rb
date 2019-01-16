fixtures = {}
%w{
  sns_subscription_03_arn
  sns_topic_3_arn
  sqs_for_sub_03_arn
  aws_account_id
}.each do |fixture_name|
  fixtures[fixture_name] = attribute(
    fixture_name,
    default: "default.#{fixture_name}",
    description: "See ../build/sns.tf"
  )
end

control "aws_sns_subscription recall of default VPC" do
  # Test constructor scalar hit
  describe aws_sns_subscription(fixtures["sns_subscription_03_arn"]) do
    it { should exist }
  end
  # Test constructor hash hit
  describe aws_sns_subscription(subscription_arn: fixtures["sns_subscription_03_arn"]) do
    it { should exist }
  end

  describe aws_sns_subscription(subscription_arn: "arn:aws:sns:us-east-1:721741954427:NonExistentSubscrtiption:bf007420-6-45-96-9c2bf144") do
    it { should_not exist }
  end
end

control "aws_sns_subscription properties" do
  describe aws_sns_subscription(fixtures["sns_subscription_03_arn"]) do
    its("topic_arn") { should eq fixtures["sns_topic_3_arn"] }
    its("endpoint")  { should eq fixtures["sqs_for_sub_03_arn"] }
    its("protocol")  { should eq "sqs" }
    its("owner")     { should cmp fixtures["aws_account_id"] }
  end
end

control "aws_sns_subscription matchers" do
  describe aws_sns_subscription(fixtures["sns_subscription_03_arn"]) do
    it { should_not have_raw_message_delivery }
    it { should be_confirmation_authenticated }
  end
end
