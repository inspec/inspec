---
title: About the aws_sqs_queue Resource
---

# aws\_sqs\_queue

Use the `aws_sqs_queue` InSpec audit resource to test properties of a single AWS Simple Queue Service queue. 

## Syntax

    describe aws_sqs_queue(queue_url: 'https://sqs.ap-southeast-2.amazonaws.com/1212121/MyQueue') do
      it { should exist }
    end


#### Parameters

##### queue\_url _(required)_

This resource accepts a single parameter, the SQS Queue URL. 
This can be passed either as a string or as a `queue_url: 'value'` key-value entry in a hash.

See also the [AWS documentation on SQS](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/welcome.html).

## Properties

|Property                                 | Description|
| ---                                     | --- |
|arn                                      | The ARN of the SQS Queue. |
|is\_fifo\_queue                          | A boolean value indicate if this queue is a FIFO queue |
|visibility\_timeout                      | An integer indicating the visibility timeout of the message in seconds |
|maximum\_message\_size                   | An integer indicating the maximum message size in bytes |
|message\_retention\_period               | An integer indicating the maximum retention period for a message in seconds |
|delay\_seconds                           | An integer indicating the delay in seconds for the queue |
|receive\_message\_wait\_timeout\_seconds | An integer indicating the number of seconds an attempt to recieve a message will wait before returning |
|content\_based\_deduplication            | A boolean value indicate if content based dedcuplication is enabled or not |
|redrive\_policy                          | A string indicating the redrive policy |

## Examples

##### Ensure that a queue exists and has a visibility timeout of 300 seconds
    describe aws_sqs_queue('https://sqs.ap-southeast-2.amazonaws.com/1212121/MyQueue') do
      it { should exist }
      its('visibility_timeout') { should be 300 }
    end

#### Ensure maximum message size is set
    describe aws_sqs_queue('https://sqs.ap-southeast-2.amazonaws.com/1212121/MyQueue') do
        its('maximum_message_size') { should be 262144 } # 256 KB      
    end

##### Test the delay time 
    describe aws_sqs_queue('https://sqs.ap-southeast-2.amazonaws.com/1212121/MyQueue') do
        its('delay_seconds') { should be 0 }
    end

##### Ensure messages are retained for 4 days
    describe aws_sqs_queue('https://sqs.ap-southeast-2.amazonaws.com/1212121/MyQueue') do
        its('message_retention_period') { should be 345600 } # 4 days
    end

##### Check if queue is fifo
    describe aws_sqs_queue('https://sqs.ap-southeast-2.amazonaws.com/1212121/MyQueue') do
        its('is_fifo_queue') { should be false }
    end

## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers, please visit our [matchers page](https://www.inspec.io/docs/reference/matchers/).

### exist

The control will pass if the describe returns at least one result.

Use `should_not` to test the entity should not exist.

    describe aws_sqs_queue('https://sqs.ap-southeast-2.amazonaws.com/1212121/MyQueue') do
      it { should exist }
    end

    describe aws_sqs_queue('https://sqs.ap-southeast-2.amazonaws.com/1212121/MyQueueWhichDoesntExist') do
      it { should_not exist }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `sqs:GetQueueAttributes` action with Effect set to Allow.
You can find detailed documentation at [Actions, Resources, and Condition Keys for Amazon SQS](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-using-identity-based-policies.html).
