+++
title = "aws_launch_configuration resource"
draft = false
gh_repo = "inspec"
platform = "aws"

[menu]
  [menu.inspec]
    title = "aws_launch_configuration"
    identifier = "inspec/resources/aws/aws_launch_configuration.md aws_launch_configuration resource"
    parent = "inspec/resources/aws"
+++

Use the `aws_launch_configuration` InSpec audit resource to test properties of a
single AWS Launch Configuration.

## Syntax

    # Ensure that a launch configuration exists and has the correct key name
    describe aws_launch_configuration('my-config') do
      it              { should exist }
      its('key_name') { should be 'my-key-name' }
    end

    # You may also use hash syntax to pass the launch configuration name
    describe aws_launch_configuration(launch_configuration_name: 'my-config') do
      it              { should exist }
    end

## Parameters

### launch_configuration_name _(required)_

This resource expects a single parameter, the `launch_configuration_name` which
uniquely identifies the of a Launch Configuration.

See also the [AWS documentation on Launch Configurations](https://docs.aws.amazon.com/autoscaling/ec2/userguide/LaunchConfiguration.html).

## Properties

| Property                    | Description                                                                               |
| --------------------------- | ----------------------------------------------------------------------------------------- |
| arn                         | An string indicating the ARN of the launch configuration                                  |
| image_id                    | An string indicating the AMI of the launch configuration                                  |
| instance_type               | A string indicating the instance type of the launch configuration                         |
| iam_instance_profile        | A string indicating the IAM profile for the launch configuration                          |
| key_name                    | A string indicating the AWS key pair for the launch configuration                         |
| security_groups             | An array of strings of the security group IDs associated with the launch configuration    |
| associate_public_ip_address | A boolean indicating if the launch configuration is configured to set a public IP address |
| user_data                   | A string containing the user data configured for the launch configuration                 |
| ebs_optimized               | A boolean indicating if the launch configuration is optimized for Amazon EBS              |
| instance_monitoring         | A string indicating if instance monitoring is set to `detailed` or `basic`                |
| spot_price                  | A floating point number indicating the spot price configured                              |

## Examples

### Ensure a Launch Config is using the correct AMI

    describe aws_launch_configuration('my-config') do
      its('image_id') { should eq 'ami-012345'}
    end

### Test the instance type used in a Launch Config

    describe aws_launch_configuration('my-config') do
      its('instance_type') { should eq 't3.micro'}
    end

### Ensure a Launch Config is associated with the right IAM Profile

    describe aws_launch_configuration('my-config') do
      its('iam_instance_profile') { should eq 'iam-profile' }
    end

### Ensure the Launch Config does not set a public IP

    describe aws_launch_configuration('my-config') do
      its('associate_public_ip_address') { should be false }
    end

### Ensure the correct UserData is set on launched instances

    describe aws_launch_configuration('my-config') do
      its('user_data') { should include 'user-data' }
    end

## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### exist

The control will pass if the describe returns at least one result.

Use `should_not` to test the entity should not exist.

    describe aws_launch_configuration('AnExistingLC') do
      it { should exist }
    end

    describe aws_launch_configuration('ANonExistentLC') do
      it { should_not exist }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `autoscaling:Describe*` action with Effect set to Allow.
You can find detailed documentation at [Actions, Resources, and Condition Keys for Amazon Auto Scaling Groups and launch configurations](https://docs.aws.amazon.com/autoscaling/ec2/userguide/control-access-using-iam.html).
