+++
title = "aws_security_groups resource"
draft = false
gh_repo = "inspec"
platform = "aws"

[menu]
  [menu.inspec]
    title = "aws_security_groups"
    identifier = "inspec/resources/aws/aws_security_groups.md aws_security_groups resource"
    parent = "inspec/resources/aws"
+++

Use the `aws_security_groups` InSpec audit resource to test properties of some or all security groups.

Security groups are a networking construct that contain ingress and egress rules for network communications. Security groups may be attached to EC2 instances, as well as certain other AWS resources. Along with Network Access Control Lists, Security Groups are one of the two main mechanisms of enforcing network-level security.

## Syntax

An `aws_security_groups` resource block uses an optional filter to select a group of security groups and then tests that group.

    describe aws_security_groups do
      its('entries.count') { should be > 1 }
    end

## Parameters

This resource does not expect any parameters.

See also the [AWS documentation on Security Groups](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-network-security.html).

## Properties

| Property    | Description                                                                                  |
| ----------- | -------------------------------------------------------------------------------------------- |
| group_ids   | The name of the auto scaling launch configuration associated with the auto scaling group     |
| group_names | An integer indicating the maximum number of instances in the auto scaling group              |
| vpc_ids     | An integer indicating the desired number of instances in the auto scaling group              |
| tags        | An integer indicating the minimum number of instances in the auto scaling group              |
| entries     | Provides access to the raw results of the query, which can be treated as an array of hashes. |

## Examples

The following examples show how to use this InSpec audit resource.

### Look for a particular security group in just one VPC

    describe aws_security_groups.where( vpc_id: 'vpc-12345678') do
      its('group_ids') { should include('sg-abcdef12')}
    end

### Examine the default security group in all VPCs

    describe aws_security_groups.where( group_name: 'default') do
      it { should exist }
    end

### Allow at most 100 security groups on the account

    describe aws_security_groups do
      its('entries.count') { should be <= 100}
    end

## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### exist

The control will pass if the filter returns at least one result.

Use `should_not` if you expect zero matches.

    # You will always have at least one SG, the VPC default SG
    describe aws_security_groups
      it { should exist }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `ec2:DescribeSecurityGroups` action with Effect set to Allow.

You can find detailed documentation at [Actions, Resources, and Condition Keys for Amazon EC2](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazonec2.html).
