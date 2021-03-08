+++
title = "aws_cloudwatch_alarm resource"
draft = false
gh_repo = "inspec"
platform = "aws"

[menu]
  [menu.inspec]
    title = "aws_cloudwatch_alarm"
    identifier = "inspec/resources/aws/aws_cloudwatch_alarm.md aws_cloudwatch_alarm resource"
    parent = "inspec/resources/aws"
+++

Use the `aws_cloudwatch_alarm` InSpec audit resource to test properties of a single CloudWatch Alarm.

**If more than one Alarm matches, an error will be raised.**

## Syntax

### Ensure an Alarm exists.

      aws_cloudwatch_alarm(metric_name: 'my-metric-name', metric_namespace: 'my-metric-namespace') do
        it { should exist }
      end

## Parameters

### metric_name _(required)_

The metric name used by this alarm. This must be passed as a `metric_name: 'value'` key-value entry in a hash.

### metric_namespace _(required)_

The metric namespace used by this alarm. This must be passed as a `metric_namespace: 'value'` key-value entry in a hash.

### dimensions _(optional)_

The dimensions associated with this alarm. This must be passed as an array of hashes `dimensions: [{key:'value'}]` .

## Properties

| Property         | Description                                                                                                                                            |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------ |
| alarm_actions    | The actions to execute when this alarm transitions to the ALARM state from any other state. Each action is specified as an Amazon Resource Name (ARN). |
| alarm_name       | The name of the alarm.                                                                                                                                 |
| metric_name      | The name of the metric.                                                                                                                                |
| metric_namespace | The namespace of the metric.                                                                                                                           |

## Examples

### Ensure an Alarm has at least one alarm action

    describe aws_cloudwatch_alarm(metric_name: 'my-metric-name', metric_namespace: 'my-metric-namespace') do
      its('alarm_actions') { should_not be_empty }
    end

### Ensure an Alarm with Dimensions exists

    describe aws_cloudwatch_alarm(metric_name: 'my-metric-name', metric_namespace: 'my-metric-namespace', dimensions: [{key: 'value'}]) do
      it { should exist }
    end

## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### exist

The control will pass if the describe returns at least one result.

Use `should_not` to test the entity should not exist.

    describe aws_cloudwatch_alarm(metric_name: 'good-metric', metric_namespace: 'my-metric-namespace') do
      it { should exist }
    end

    describe aws_cloudwatch_alarm(metric_name: 'bed-metric', metric_namespace: 'my-metric-namespace') do
      it { should_not exist }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `cloudwatch:DescribeAlarmsForMetric` action with Effect set to Allow.

You can find detailed documentation at [Actions, Resources, and Condition Keys for Amazon CloudWatch](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazoncloudwatch.html).
