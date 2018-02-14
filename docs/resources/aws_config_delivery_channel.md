---
title: About the aws_config_delivery_channel Resource
---

# aws_config_delivery_channel

Use the `aws_config_delivery_channel` InSpec audit resource to test properties of your aws config service.

<br>

## Syntax

An `aws_config_delivery_channel` resource block declares the tests for a single AWS configuration delivery channel.

    describe aws_config_delivery_channel('my_channel') do
      it { should exist }
    end

    describe aws_config_delivery_channel(recorder_name: 'my-channel') do
      it { should exist }
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test if the recorder is active and recording.

    describe aws_config_delivery_channel(recorder_name: 'my-recorder') do
      it { should be_recording }
    end
    
## Properties
    
### s3_bucket_name

Provides the name of the s3 bucket that the channel takes snaphots of and logs configuration history.

    describe aws_config_delivery_channel(channel_name: 'my_channel')
      its('s3_bucket_name') { should eq 'my_bucket' }
    end
    
### s3_key_prefix

Provides the prefix of the s3 bucket.

    describe aws_config_delivery_channel(channel_name: 'my_channel')
      its('s3_key_prefix') { should eq '' }
    end
    
### sns_topic_arn

Provides the ARN of the SNS topic for which the channel sends notifications about configuration changes.

    describe aws_config_delivery_channel(channel_name: 'my_channel')
      its('sns_topic_arn') { should eq '' }
    end
    
### delivery_frequency

Provides how often the AWS Config sends snapshots to the s3 bucket in the delivery channel.

Its values can be One_Hour, Three_Hours, Six_Hours, Twelve_Hours, TwentyFour_Hours

    describe aws_config_delivery_channel(channel_name: 'my_channel')
      its('delivery_frequency') { should eq '' }
    end
    
    
<br>

## Matchers

This resource contains no matchers.

