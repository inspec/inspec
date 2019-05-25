require 'resource_support/aws/aws_singular_resource_mixin'
require 'resource_support/aws/aws_backend_base'
require 'aws-sdk-cloudwatch'

class AwsCloudwatchAlarm < Inspec.resource(1)
  name 'aws_cloudwatch_alarm'
  desc <<~EXAMPLE
    # Look for a specific alarm
    aws_cloudwatch_alarm(
      metric_name: 'my-metric-name',
      metric_namespace: 'my-metric-namespace',
    ) do
      it { should exist }
    end
  EXAMPLE
  supports platform: 'aws'

  include AwsSingularResourceMixin
  attr_reader :alarm_actions, :alarm_name, :metric_name, :metric_namespace

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

  def fetch_from_api
    aws_alarms = BackendFactory.create(inspec_runner).describe_alarms_for_metric(
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
    class AwsClientApi < AwsBackendBase
      AwsCloudwatchAlarm::BackendFactory.set_default_backend(self)
      self.aws_client_class = Aws::CloudWatch::Client

      def describe_alarms_for_metric(query)
        aws_service_client.describe_alarms_for_metric(query)
      end
    end
  end
end
