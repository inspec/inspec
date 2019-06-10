fixtures = {}
[
  'sns_topic_recall_hit_arn',
].each do |fixture_name|
  fixtures[fixture_name] = input(
    fixture_name,
    default: "default.#{fixture_name}",
    description: 'See ../build/sns.tf',
  )
end

control "aws_sns_topics recall" do
  # Check if there is at least one sns topic
  describe aws_sns_topics do
    it { should exist }
  end
end

control "aws_sns_topics properties" do
  # you should be able to get a list of all SNS Topic arns
  describe aws_sns_topics do
    its('topic_arns') { should include fixtures['sns_topic_recall_hit_arn'] }
  end
end
