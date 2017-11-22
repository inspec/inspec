require 'aws_conn'

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

  attr_reader :alarm_name, :metric_name, :metric_namespace, :alarm_actions
  def initialize(opts)
    validate_resource_params(opts).each do |param, value|
      instance_variable_set("@#{param}", value)
    end
    search
  end

  def exists?
    @exists
  end

  private

  def validate_resource_params(raw_params)
    unless raw_params.is_a? Hash
      raise ArgumentError, "Resource params should be passed using \"key: 'value'\" format."
    end

    validated_params = {}
    # Currently you must specify exactly metric_name and metric_namespace
    [:metric_name, :metric_namespace].each do |param|
      raise ArgumentError, "Missing resource param #{param}" unless raw_params.key?(param)
      validated_params[param] = raw_params.delete(param)
    end

    # Any leftovers are unwelcome
    unless raw_params.empty?
      raise ArgumentError, "Unrecognized resource param '#{raw_params.keys.first}'"
    end

    validated_params
  end

  def search
    aws_alarms = Backend.create.describe_alarms_for_metric(
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
    #=====================================================#
    #                    API Definition
    #=====================================================#
    [
      :describe_alarms_for_metric,
    ].each do |method|
      define_method(:method) do |*_args|
        raise "Unimplemented abstract method #{method} - internal error"
      end
    end

    #=====================================================#
    #                 Concrete Implementation
    #=====================================================#
    # Uses the cloudwatch API to really talk to AWS
    class AwsClientApi < Backend
      def describe_alarms_for_metric(criteria)
        AWSConnection.new.cloudwatch_client.describe_alarms_for_metric(criteria)
      end
    end

    #=====================================================#
    #                   Factory Interface
    #=====================================================#
    # TODO: move this to a mix-in
    DEFAULT_BACKEND = AwsClientApi
    @selected_backend = DEFAULT_BACKEND

    def self.create
      @selected_backend.new
    end

    def self.select(klass)
      @selected_backend = klass
    end

    def self.reset
      select(DEFAULT_BACKEND)
    end
  end
end
