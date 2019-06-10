fixtures = {}
[
  'cloudwatch_alarm_1_name',
  'cloudwatch_alarm_1_metric_name',
  'cloudwatch_alarm_1_namespace',
].each do |fixture_name|
  fixtures[fixture_name] = input(
  fixture_name,
  default: "default.#{fixture_name}",
  description: 'See ../build/cloudwatch.tf',
  )
end


control 'aws_cloudwatch_alarm recall' do
  describe aws_cloudwatch_alarm(
    metric_name: fixtures['cloudwatch_alarm_1_metric_name'],
    metric_namespace: fixtures['cloudwatch_alarm_1_namespace'],
  ) do
    it { should exist }
  end

  describe aws_cloudwatch_alarm(
    metric_name: 'NopeNope',
    metric_namespace: 'Nope',
  ) do
    it { should_not exist }
  end
end
