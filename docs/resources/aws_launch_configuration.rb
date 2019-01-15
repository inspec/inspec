---
   title: About the aws_launch_configuration Resource
---

# aws\_launch\_configuration

Use the `aws_launch_configuration` InSpec audit resource to test properties of a single AWS auto scaling launch configuration.

<br>

## Availability

### Installation

This resource is distributed along with InSpec itself. You can use it automatically.

### Version

This resource first became available in v3.2.7 of InSpec.

## Syntax

    # Ensure that a launch configuration exists and test some properties
    describe aws_launch_configuration('MyLaunchConfiguration') do
        it { should exist }
        its('image_id') { should eq 'ami-012121aa' }
        its('instance_type') { should eq't3.micro' }
        its('iam_instance_profile') { should eq 'MyIAMProfile' }
        its('key_name') { should eq 'MyKeyName'}
        its('security_groups') { should include 'sg-121211'}
        its('associate_public_ip_address') { should be true }
        its('user_data') { should include '#!/bin/bash'}
        its('ebs_optimized') { should be true }
        its('instance_monitoring') { should eq 'detailed' }
        its('spot_price') { should eq 0.121 }
    end

    # You may also use hash syntax to pass the launch configuration name
    describe aws_launch_configuration(name: 'MyLaunchConfiguration') do
      it { should exist }
    end

## Resource Parameters

### Name

This resource expects a single parameter, the name that uniquely identifies a launch configuration.

See also the [AWS documentation on Launch Configurations](https://docs.aws.amazon.com/autoscaling/ec2/userguide/LaunchConfiguration.html).

<br>

## Properties

### image\_id

An string indicating the AMI to be used for the launch configuration
    
    describe aws_launch_configuration('MyLaunchConfiguration') do
      its('image_id') { should eq 'ami-12345'}
    end

### instance\_type

A string indicating the instance type to be used
    
    describe aws_launch_configuration('MyLaunchConfiguration') do
      its('instance_type') { should eq 't3.micro'}
    end

### iam\_instance\_profile

A string indicating the IAM profile for the launch configuration

    describe aws_launch_configuration('MyLaunchConfiguration') do
      its('iam_instance_profile') { should eq 'MyIAMProfile' }
    end

### key\_name

A string indicating the AWS key pair for the launch configuration

    describe aws_launch_configuration('MyLaunchConfiguration') do
      its('key_name') { should eq 'MyKeyName' }
    end

### security\_groups

An array of strings of the security group IDs associated with the launch configuration

    describe aws_launch_configuration('MyLaunchConfiguration') do
      its('security_groups') { should include 'sg-121211'}
    end

### associate\_public\_ip\_address

A boolean indicating if the launch configuration is configured to set a public IP address

    describe aws_launch_configuration('MyLaunchConfiguration') do
      its('associate_public_ip_address') { should be true }
    end

### user\_data

A string containing the user data configured for the launch configuration

    describe aws_launch_configuration('MyLaunchConfiguration') do
      its('user_data') { should include '#!/bin/bash' }
    end

### ebs\_optimized

A boolean value indicating if the launch configuration is set to launch EBS optimized EC2 instances

    describe aws_launch_configuration('MyLaunchConfiguration') do
      its('ebs_optimized') { should be true }
    end

### instance\_monitoring

A string indicating if the monitoring is set to `detailed` or `basic`

    describe aws_launch_configuration('MyLaunchConfiguration1') do
      its('instance_monitoring') { should eq 'detailed' }
    end

    describe aws_launch_configuration('MyLaunchConfiguration2') do
        its('instance_monitoring') { should eq 'basic' }
    end

### spot\_price

A floating point number indicating the spot price configured

    describe aws_launch_configuration('MyLaunchConfiguration') do
      its('spot_price') { should be 0.8 }
    end

<br>

## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers, please visit our [matchers page](https://www.inspec.io/docs/reference/matchers/).

### exist

Indicates that the auto scaling group name provided was found.  Use `should_not` to test for auto scaling group names that should not exist.

    # Expect good news
    describe aws_launch_configuration('AnExistingLC') do
      it { should exist }
    end

    # No bad news allowed
    describe aws_launch_configuration('ANonExistentLC') do
      it { should_not exist }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `autoscaling:Describe*` actions with Effect set to Allow.
You can find detailed documentation at [Actions, Resources, and Condition Keys for Amazon Auto Scaling Groups and launch configurations](https://docs.aws.amazon.com/autoscaling/ec2/userguide/control-access-using-iam.html).