sns_topic_with_subscription_arn = attribute(
  'sns_test_topic_01_arn',
  default: 'default.sns_test_topic_01_arn',
  description: 'ARN of an SNS topic with at least one subscription')

sns_topic_with_no_subscriptions_arn = attribute(
  'sns_test_topic_02_arn',
  default: 'default.sns_test_topic_02_arn',
  description: 'ARN of an SNS topic with no subscriptions')

control 'SNS Topics' do
  # Split the ARNs so we can test things
  scheme, partition, service, region, account, topic = sns_topic_with_subscription_arn.split(':')
  arn_prefix = [scheme, partition, service].join(':')

  # Search miss
  no_such_topic_arn = [arn_prefix, region, account, 'no-such-topic-for-realz'].join(':')
  describe aws_sns_topic(no_such_topic_arn) do
    it { should_not exist }
  end

  # Search hit, fully specified, has subscriptions
  describe aws_sns_topic(sns_topic_with_subscription_arn) do
    it { should exist }
    its('confirmed_subscription_count') { should_not be_zero }
  end

  # Search hit, fully specified, has no subscriptions
  describe aws_sns_topic(sns_topic_with_no_subscriptions_arn) do
    it { should exist }
    its('confirmed_subscription_count') { should be_zero }
  end

end