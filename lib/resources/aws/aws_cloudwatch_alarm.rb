class AwsCloudwatchAlarm < Inspec.resource(1)
  name 'aws_cloudwatch_alarm'
  desc <<-EOD
  # Look for a specific alarm
  aws_cloudwatch_alarm(
    metric: 'my-metric-name',
    metric_namespace: 'my-metric-namespace',
  ) do
    it { should exist }
  end
  EOD

  include AwsResourceMixin
  attr_reader :alarm_name, :metric_name, :metric_namespace, :alarm_actions

  private

  def validate_params(raw_params)
    recognized_params = check_resource_param_names(
      raw_params: raw_params,
      allowed_params: [:metric_name, :metric_namespace],
    )
    validated_params = {}
    # Currently you must specify exactly metric_name and metric_namespace
    [:metric_name, :metric_namespace].each do |param|
      raise ArgumentError, "Missing resource param #{param}" unless recognized_params.key?(param)
      validated_params[param] = recognized_params.delete(param)
    end

    validated_params
  end

  def fetch_from_aws
    aws_alarms = BackendFactory.create.describe_alarms_for_metric(
      metric_name: @metric_name,
      namespace: @metric_namespace,
    )
    if aws_alarms.metric_alarms.empty?
      @exists = false
    elsif aws_alarms.metric_alarms.count > 1
      alarms = aws_alarms.metric_alarms.map(&:alarm_name)
      raise 'More than one Cloudwatch Alarm was matched. Try using ' \
        "more specific resource parameters. Alarms matched: #{alarms.join(', ')}"
    else
      @alarm_actions = aws_alarms.metric_alarms.first.alarm_actions
      @alarm_name = aws_alarms.metric_alarms.first.alarm_name
      @exists = true
    end
  end

  class Backend
    class AwsClientApi < Backend
      BackendFactory.set_default_backend(self)
      def describe_alarms_for_metric(criteria)
        AWSConnection.new.cloudwatch_client.describe_alarms_for_metric(criteria)
      end
    end
  end
end
