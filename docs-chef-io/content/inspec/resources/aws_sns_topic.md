+++
title = "aws_sns_topic resource"
draft = false
gh_repo = "inspec"
platform = "aws"

[menu]
  [menu.inspec]
    title = "aws_sns_topic"
    identifier = "inspec/resources/aws/aws_sns_topic.md aws_sns_topic"
    parent = "inspec/resources/aws"
+++

Use the `aws_sns_topic` InSpec audit resource to test properties of a single AWS Simple Notification Service Topic. SNS topics are channels for related events. AWS resources place events in the SNS topic, while other AWS resources subscribe to receive notifications when new events occur.

## Syntax

    describe aws_sns_topic('arn:aws:sns:*::my-topic-name') do
      it { should exist }
    end

    # You may also use has syntax to pass the ARN
    describe aws_sns_topic(arn: 'arn:aws:sns:*::my-topic-name') do
      it { should exist }
    end

## Parameters

### arn _(required)_

This resource accepts a single parameter, the ARN of the SNS Topic.
This can be passed either as a string or as a `arn: 'value'` key-value entry in a hash.

See also the [AWS documentation on SNS](https://docs.aws.amazon.com/sns/latest/dg/sns-getting-started.html).

## Properties

| Property                     | Description                                                         |
| ---------------------------- | ------------------------------------------------------------------- |
| confirmed_subscription_count | An integer indicating the number of currently active subscriptions. |

## Examples

### Make sure something is subscribed to the topic

    describe aws_sns_topic('arn:aws:sns:*::my-topic-name') do
      its('confirmed_subscription_count') { should_not be_zero}
    end

## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### exist

The control will pass if the describe returns at least one result.

Use `should_not` to test the entity should not exist.

    describe aws_sns_topic('arn:aws:sns:*::good-news') do
      it { should exist }
    end

    describe aws_sns_topic('arn:aws:sns:*::bad-news') do
      it { should_not exist }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `sns:GetTopicAttributes` action with Effect set to Allow.

You can find detailed documentation at [Actions, Resources, and Condition Keys for Amazon SNS](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazonsns.html).
