require 'helper'

require 'resource_support/aws'
require 'resources/aws/aws_cloudwatch_alarm'

# MCWAB = MockCloudwatchAlarmBackend
# Abbreviation not used outside this file

#=============================================================================#
#                            Constructor Tests
#=============================================================================#
class AwsCWAConstructor < Minitest::Test
  def setup
    AwsCloudwatchAlarm::BackendFactory.select(AwsMCWAB::Empty)
  end

  def test_constructor_some_args_required
    assert_raises(ArgumentError) { AwsCloudwatchAlarm.new }
  end

  def test_constructor_accepts_known_resource_params_combos
    [
      { metric_name: 'some-val', metric_namespace: 'some-val' },
    ].each do |combo|
      AwsCloudwatchAlarm.new(combo)
    end
  end

  def test_constructor_rejects_bad_resource_params_combos
    [
      { metric_name: 'some-val' },
      { metric_namespace: 'some-val' },
    ].each do |combo|
      assert_raises(ArgumentError) { AwsCloudwatchAlarm.new(combo) }
    end
  end

  def test_constructor_reject_unknown_resource_params
    assert_raises(ArgumentError) { AwsCloudwatchAlarm.new(beep: 'boop') }
  end
end

#=============================================================================#
#                               Search / Recall
#=============================================================================#

class AwsCWARecall < Minitest::Test
  def setup
    AwsCloudwatchAlarm::BackendFactory.select(AwsMCWAB::Basic)
  end

  def test_recall_no_match_is_no_exception
    alarm = AwsCloudwatchAlarm.new(metric_name: 'nope', metric_namespace: 'nope')
    refute alarm.exists?
  end

  def test_recall_match_single_result_works
    alarm = AwsCloudwatchAlarm.new(
      metric_name: 'metric-01',
      metric_namespace: 'metric-namespace-01',
    )
    assert alarm.exists?
  end

  def test_recall_multiple_result_raises
    assert_raises(RuntimeError) do
      AwsCloudwatchAlarm.new(
        metric_name: 'metric-02',
        metric_namespace: 'metric-namespace-01',
      )
    end
  end
end

#=============================================================================#
#                                Properties
#=============================================================================#

class AwsCWAProperties < Minitest::Test
  def setup
    AwsCloudwatchAlarm::BackendFactory.select(AwsMCWAB::Basic)
  end

  #---------------------------------------
  #       alarm_actions
  #---------------------------------------
  def test_prop_actions_empty
    alarm = AwsCloudwatchAlarm.new(
      metric_name: 'metric-02',
      metric_namespace: 'metric-namespace-02',
    )
    assert_kind_of Array, alarm.alarm_actions
    assert_empty alarm.alarm_actions
  end

  def test_prop_actions_hit
    alarm = AwsCloudwatchAlarm.new(
      metric_name: 'metric-01',
      metric_namespace: 'metric-namespace-01',
    )
    assert_kind_of Array, alarm.alarm_actions
    refute_empty alarm.alarm_actions
    assert_kind_of String, alarm.alarm_actions.first
  end
end

#=============================================================================#
#                               Test Fixtures
#=============================================================================#

module AwsMCWAB
  class Empty < AwsBackendBase
    def describe_alarms_for_metric(_criteria)
      OpenStruct.new({
        metric_alarms: [],
      })
    end
  end

  class Basic < AwsBackendBase
    def describe_alarms_for_metric(criteria)
      OpenStruct.new({
        metric_alarms: [ # rubocop:disable Metrics/BlockLength
          # Each one here is an alarm that is subscribed to the given metric
          # Each has an enormous number of properties, most omitted here
          # http://docs.aws.amazon.com/sdkforruby/api/Aws/CloudWatch/Client.html#describe_alarms_for_metric-instance_method
          OpenStruct.new({
            alarm_name: 'alarm-01',
            metric_name: 'metric-01',
            namespace: 'metric-namespace-01',
            statistic: 'SampleCount',
            alarm_actions: [
              'arn::::' # TODO: get SNS ARN format
            ],
          }),
          OpenStruct.new({
            # Alarm 02 and 03 both watch metric-01, metric-namespace-01
            alarm_name: 'alarm-02',
            metric_name: 'metric-02',
            namespace: 'metric-namespace-01',
            statistic: 'SampleCount',
            alarm_actions: [],
          }),
          OpenStruct.new({
            # Alarm 02 and 03 both watch metric-02, metric-namespace-01
            alarm_name: 'alarm-03',
            metric_name: 'metric-02',
            namespace: 'metric-namespace-01',
            statistic: 'SampleCount',
            alarm_actions: [],
          }),
          OpenStruct.new({
            alarm_name: 'alarm-04',
            metric_name: 'metric-02',
            namespace: 'metric-namespace-02',
            statistic: 'SampleCount',
            alarm_actions: [],
          }),
        ].select do |alarm|
          criteria.keys.all? do |criterion|
            criterion = 'namespace' if criterion == 'metric_namespace'
            alarm[criterion] == criteria[criterion]
          end
        end,
      })
    end
  end
end
