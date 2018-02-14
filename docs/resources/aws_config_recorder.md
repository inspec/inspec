---
title: About the aws_config_recorder Resource
---

# aws_config_recorder

Use the `aws_config_recorder` InSpec audit resource to test properties of your aws config service.

<br>

## Syntax

An `aws_config_recorder` resource block declares the tests for a single AWS configuration recorder.

    describe aws_config_recorder('my_recorder') do
      it { should exist }
    end

    describe aws_config_recorder(recorder_name: 'my-recorder') do
      it { should exist }
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test if the recorder is active and recording.

    describe aws_config_recorder(recorder_name: 'my-recorder') do
      it { should be_recording }
    end
    
## Properties

### role_arn

Provides the IAM role arn associated with the configuration recorder.

    describe aws_config_recorder(username: 'bob')
      its('role_arn') { should eq 'arn:aws:iam::721741954427:role/My_Recorder' }
    end
    
### resource_types

Provides a list of AWS resource types for which the AWS Config records configuration will change.

    describe aws_config_recorder(username: 'bob')
      its('resource_types') { should eq ['AWS::EC2::CustomerGateway', 'AWS::EC2::EIP'] }
    end
    
<br>

## Matchers

### be_all_supported

Provides whether AWS Config records configuration is changed for each type of regional resource.

      it { should be_all_supported }
      
### have_include_global_resource_types

Provides whether or not the AWS Config includes support for all global resource types.

      it { should have_include_global_resource_types }

