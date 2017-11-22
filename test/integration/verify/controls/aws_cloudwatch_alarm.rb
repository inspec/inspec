alarm_01 = attribute(
  'cloudwatch_alarm_01',
  default: 'default.cloudwatch_alarm',
  description: 'Name of Cloudwatch Alarm')

metric_01_name = attribute(
  'lmf_1_metric_1_name',
  default: 'default.lmf_1_metric_1_name',
  description: 'A test metric name')

metric_01_namespace = attribute(
    'lmf_1_metric_1_namespace',
    default: 'default.lmf_1_metric_1_namespace',
    description: 'A test metric namespace')

control 'AWS Cloudwatch Alarm' do
  describe aws_cloudwatch_alarm(
    metric_name: metric_01_name,
    metric_namespace: metric_01_namespace,
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