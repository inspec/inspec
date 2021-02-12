+++
title = "aws_sqs_queues"
draft = false
gh_repo = "inspec"
platform = "aws"

[menu]
  [menu.inspec]
    title = "aws_sqs_queues"
    identifier = "inspec/resources/aws/aws_sqs_queues.md aws_sqs_queues"
    parent = "inspec/resources/aws"
+++

Use the `aws_sqs_queues` InSpec audit resource to test properties of some or all AWS Simple Queue Service queues.

## Syntax

    describe aws_sqs_queues() do
      it { should exist }
    end

## Parameters

This resource does not expect any parameters.

See also the [AWS documentation on SQS](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/welcome.html).

## Properties

| Property                             | Description                                                                                            |
| ------------------------------------ | ------------------------------------------------------------------------------------------------------ |
| arns                                 | The ARNs of the SQS Queues.                                                                            |
| is_fifo_queues                       | A boolean value indicate if queues are a FIFO queues                                                   |
| visibility_timeouts                  | An integer indicating the visibility timeout of the message in seconds                                 |
| maximum_message_sizes                | An integer indicating the maximum message size in bytes                                                |
| message_retention_periods            | An integer indicating the maximum retention period for a message in seconds                            |
| delay_seconds                        | An integer indicating the delay in seconds for the queues                                              |
| receive_message_wait_timeout_seconds | An integer indicating the number of seconds an attempt to recieve a message will wait before returning |
| content_based_deduplications         | A boolean value indicate if content based dedcuplication is enabled or not                             |

## Examples

### Ensure that a queue exists and has a visibility timeout of 300 seconds

    describe aws_sqs_queues.where(queue_url: 'https://sqs.ap-southeast-2.amazonaws.com/1212121/MyQueue') do
      it { should exist }
      its('visibility_timeout') { should be 300 }
    end

## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### exist

The control will pass if the describe returns at least one result.

Use `should_not` to test the entity should not exist.

    describe aws_sqs_queues() do
      it { should exist }
    end

    describe aws_sqs_queues() do
      it { should_not exist }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `sqs:GetQueueAttributes` action with Effect set to Allow.
You can find detailed documentation at [Actions, Resources, and Condition Keys for Amazon SQS](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-using-identity-based-policies.html).
