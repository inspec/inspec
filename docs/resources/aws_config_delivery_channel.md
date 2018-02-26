---
title: About the aws_config_delivery_channel Resource
---

# aws_config_delivery_channel

The AWS Config service can monitor and record changes to your AWS resource configurations.  A Delivery Channel can record the changes
to an S3 Bucket, an SNS or both.

Use the `aws_config_delivery_channel` InSpec audit resource to examine how the AWS Config service delivers those change notifications.

<br>

## Syntax

An `aws_config_delivery_channel` resource block declares the tests for a single AWS Config delivery channel.

    describe aws_config_delivery_channel('my_channel') do
      it { should exist }
    end

    describe aws_config_delivery_channel(channel_name: 'my-channel') do
      it { should exist }
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test how frequent the channel writes configuration changes to the s3 bucket.

    describe aws_config_delivery_channel(channel_name: 'my-recorder') do
      its(delivery_frequency_in_hours) { should be > 3 }
    end
    
## Properties
    
### s3_bucket_name

Provides the name of the s3 bucket that the channel sends configuration changes to.  This is an optional value since a Delivery Channel can also talk to an SNS.

    describe aws_config_delivery_channel(channel_name: 'my_channel')
      its('s3_bucket_name') { should eq 'my_bucket' }
    end
    
### s3_key_prefix

Provides the s3 object key prefix (or "path") under which configuration data will be recorded.

    describe aws_config_delivery_channel(channel_name: 'my_channel')
      its('s3_key_prefix') { should eq 'log/' }
    end
    
### sns_topic_arn

Provides the ARN of the SNS topic for which the channel sends notifications about configuration changes.

    describe aws_config_delivery_channel(channel_name: 'my_channel')
      its('sns_topic_arn') { should eq 'arn:aws:sns:us-east-1:721741954427:sns_topic' }
    end
    
### delivery_frequency_in_hours

Provides how often the AWS Config sends configuration changes to the s3 bucket in the delivery channel.

    describe aws_config_delivery_channel(channel_name: 'my_channel')
      its('delivery_frequency_in_hours') { should eq 24 }
      its('delivery_frequency_in_hours') { should be > 24 }
    end
    
    
<br>

## Matchers

This resource provides no matchers, aside from the standard exists matcher.

