+++
title = "aws_config_recorder resource"
draft = false
gh_repo = "inspec"
platform = "aws"

[menu]
  [menu.inspec]
    title = "aws_config_recorder"
    identifier = "inspec/resources/aws/aws_config_recorder.md aws_config_recorder resource"
    parent = "inspec/resources/aws"
+++

Use the `aws_config_recorder` InSpec audit resource to test properties of your AWS Config Service.

The AWS Config service can monitor and record changes to your AWS resource configurations. The Aws Config Recorder is used to detect changes in resource configurations and capture these changes as configuration items.

As of April 2018, you are only permitted one configuration recorder per region.

## Syntax

Ensure that an auto scaling group exists and has the correct scale sizes

    describe aws_config_recorder('my-recorder') do
      it { should exist }
    end

You may also use hash syntax to pass the recorder name

    describe aws_config_recorder(recorder_name: 'my-recorder') do
      it { should exist }
    end

Since you may only have one recorder per region, and InSpec connections are per-region, you may also omit the recorder name to obtain the one recorder (if any) that exists:

    describe aws_config_recorder do
      it { should exist }
    end

## Parameters

### recorder_name _(optional)_

This resource accepts a single parameter, the Configuration Recorder Name.
This can be passed either as a string or as a `recorder_name: 'value'` key-value entry in a hash.

See also the [AWS documentation on Configuration](https://docs.aws.amazon.com/config/latest/developerguide/aws-config-landing-page.html).

## Properties

| Property       | Description                                                                                                                                                              |
| -------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| recorder_name  | The name of the recorder. By default, AWS Config automatically assigns the name "default" when creating the configuration recorder. You cannot change the assigned name. |
| role_arn       | Amazon Resource Name (ARN) of the IAM role used to describe the AWS resources associated with the account.                                                               |
| resource_types | A comma-separated list that specifies the types of AWS resources for which AWS Config records configuration changes (i.e. AWS::EC2::Instance)                            |

## Examples

### Test if the recorder is active and recording

    describe aws_config_recorder do
      it { should be_recording }
    end

### Ensure the role_arn is correct for the recorder

The role is used to grant permissions to S3 Buckets, SNS topics and to get configuration details for supported AWS resources.
describe aws_config_recorder do
its('role_arn') { should eq 'arn:aws:iam::721741954427:role/My_Recorder' }
end

### Test the recorder is monitoring changes to the correct resources.

    describe aws_config_recorder do
      its('resource_types') { should include 'AWS::EC2::CustomerGateway' }
      its('resource_types') { should include 'AWS::EC2::EIP' }
    end

## Matchers

### be_recording

Ensure the recorder is active

      it { should be_recording }

### be_recording_all_resource_types

Indicates if the ConfigurationRecorder will record changes for all resources, regardless of type. If this is true, resource_types is ignored.

      it { should be_recording_all_resource_types }

### be_recording_all_global_types

Indicates whether the ConfigurationRecorder will record changes for global resource types (such as [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal)s).

      it { should be_recording_all_global_types }

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `config:DescribeConfigurationRecorders` action with Effect set to Allow.

You can find detailed documentation at [Actions, Resources, and Condition Keys for AWS Config](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_awsconfig.html).
