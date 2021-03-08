+++
title = "aws_ec2_instance resource"
draft = false
gh_repo = "inspec"
platform = "aws"

[menu]
  [menu.inspec]
    title = "aws_ec2_instance"
    identifier = "inspec/resources/aws/aws_ec2_instance.md aws_ec2_instance resource"
    parent = "inspec/resources/aws"
+++

Use the `aws_ec2_instance` InSpec audit resource to test properties of a single AWS EC2 instance.

## Syntax

An `aws_ec2_instance` resource block declares the tests for a single AWS EC2 instance by either name or instance id.

    describe aws_ec2_instance('i-01a2349e94458a507') do
      it { should exist }
    end

    describe aws_ec2_instance(name: 'my-instance') do
      it { should exist }
    end

## Parameters

One of either the EC2 instance's ID or name must be be provided.

### instance_id _(required if `name` not provided)_

The ID of the EC2 instance. This is in the format of `i-` followed by 8 or 17 hexadecimal characters.
This can be passed either as a string or as an `instance_id: 'value'` key-value entry in a hash.

### name _(required if `instance_id` not provided)_

If you have a `Name` tag applied to the EC2 instance, this can be used to lookup the instance.
This must be passed as a `name: 'value'` key-value entry in a hash.

## Properties

| Property           | Description                                                                                                                                                                                                                                                                  |
| ------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| state              | The current state of the EC2 Instance, for example 'running'.                                                                                                                                                                                                                |
| image_id           | The id of the AMI used to launch the instance.                                                                                                                                                                                                                               |
| role               | The IAM role attached to the instance.                                                                                                                                                                                                                                       |
| launch_time        | The time the instance was launched.                                                                                                                                                                                                                                          |
| availability_zone  | The availability zone of the instance.                                                                                                                                                                                                                                       |
| security_groups    | A hash containing the security group ids and names associated with the instance.                                                                                                                                                                                             |
| security_group_ids | The security group ids associated with the instance.                                                                                                                                                                                                                         |
| ebs_volumes        | A hash containing the names and ids of any EBS volumes associated with the instance.                                                                                                                                                                                         |
| tags               | A list of hashes with each key-value pair corresponding to an EC2 instance tag, e.g, `[{:key=>"Name", :value=>"Testing Box"}, {:key=>"Environment", :value=>"Dev"}]`                                                                                                         |
| tags_hash          | A hash, with each key-value pair corresponding to an EC2 instance tag, e.g, `{"Name"=>"Testing Box", "Environment"=>"Dev"}`. This property is available in InSpec AWS resource pack version **[1.12.0](https://github.com/inspec/inspec-aws/releases/tag/v1.12.0)** onwards. |

There are also additional properties available. For a comprehensive list, see [the API reference documentation](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_Instance.html)

## Examples

### Test that an EC2 instance is running

    describe aws_ec2_instance(name: 'prod-database') do
      it { should be_running }
    end

### Test that an EC2 instance is using the correct AMI

    describe aws_ec2_instance(name: 'my-instance') do
      its('image_id') { should eq 'ami-27a58d5c' }
    end

### Test that an EC2 instance has the correct tag

    describe aws_ec2_instance('i-090c29e4f4c165b74') do
      its('tags') { should include(key: 'Contact', value: 'Gilfoyle') }
    end

### Test that an EC2 instance has the correct tag (using the `tags_hash` property)

    describe aws_ec2_instance('i-090c29e4f4c165b74') do
      its('tags_hash') { should include('Contact' => 'Gilfoyle') }
      its('tags_hash') { should include('Contact') }                  # Regardless of the value
    end

### Test that an EC2 instance has no roles

    describe aws_ec2_instance('i-090c29e4f4c165b74') do
      it { should_not have_roles }
    end

## Matchers

This InSpec audit resource has the following special matchers. For a full list of
available matchers, please visit our [matchers page](/inspec/matchers/).

### exist

The control will pass if the describe returns at least one result.

Use `should_not` to test the entity should not exist.

      it { should exist }

      it { should_not exist }

### has_roles

Test if the EC2 instance has any roles associated with it.

Use `should_not` to test the entity does not have roles.

    it { should have_roles }

    it { should_not have_roles }

### be_pending

The `be_pending` matcher tests if the described EC2 instance state is `pending`. This indicates that an instance is provisioning. This state should be temporary.

    it { should be_pending }

### be_running

The `be_running` matcher tests if the described EC2 instance state is `running`. This indicates the instance is fully operational from AWS's perspective.

    it { should be_running }

### be_shutting_down

The `be_shutting_down` matcher tests if the described EC2 instance state is `shutting-down`. This indicates the instance has received a termination command and is in the process of being permanently halted and de-provisioned. This state should be temporary.

    it { should be_shutting_down }

### be_stopped

The `be_stopped` matcher tests if the described EC2 instance state is `stopped`. This indicates that the instance is suspended and may be started again.

    it { should be_stopped }

### be_stopping

The `be_stopping` matcher tests if the described EC2 instance state is `stopping`. This indicates that an AWS stop command has been issued, which will suspend the instance in an OS-unaware manner. This state should be temporary.

    it { should be_stopping }

### be_terminated

The `be_terminated` matcher tests if the described EC2 instance state is `terminated`. This indicates the instance is permanently halted and will be removed from the instance listing in a short period. This state should be temporary.

    it { should be_terminated }

### be_unknown

The `be_unknown` matcher tests if the described EC2 instance state is `unknown`. This indicates an error condition in the AWS management system. This state should be temporary.

    it { should be_unknown }

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `ec2:DescribeInstances`, and `iam:GetInstanceProfile` actions set to allow.

You can find detailed documentation at [Actions, Resources, and Condition Keys for Amazon EC2](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazonec2.html), and [Actions, Resources, and Condition Keys for Identity And Access Management](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_identityandaccessmanagement.html).
