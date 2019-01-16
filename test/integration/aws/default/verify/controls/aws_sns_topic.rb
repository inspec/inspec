fixtures = {}
%w{
  sns_topic_recall_hit_arn
  sns_topic_with_subscription_arn
  sns_topic_no_subscription_arn
}.each do |fixture_name|
  fixtures[fixture_name] = attribute(
  fixture_name,
  default: "default.#{fixture_name}",
  description: "See ../build/sns.tf"
  )
end

control "aws_sns_topic recall" do

  # Split the ARNs so we can test various ways of missing
  scheme, partition, service, region, account, topic = fixtures["sns_topic_recall_hit_arn"].split(":")
  arn_prefix = [scheme, partition, service].join(":")

  # Search miss
  no_such_topic_arn = [arn_prefix, region, account, "no-such-topic-for-realz"].join(":")
  describe aws_sns_topic(no_such_topic_arn) do
    it { should_not exist }
  end

  # Search hit
  describe aws_sns_topic(fixtures["sns_topic_recall_hit_arn"]) do
    it { should exist }
  end
end

control "aws_sns_topic confirmed_subscription_count property" do
  describe aws_sns_topic(fixtures["sns_topic_with_subscription_arn"]) do
    its("confirmed_subscription_count") { should_not be_zero }
  end
  describe aws_sns_topic(fixtures["sns_topic_no_subscription_arn"]) do
    its("confirmed_subscription_count") { should be_zero }
  end
end
