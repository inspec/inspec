+++
title = "aws_subnets resource"
draft = false
gh_repo = "inspec"
platform = "aws"

[menu]
  [menu.inspec]
    title = "aws_subnets"
    identifier = "inspec/resources/aws/aws_subnets.md aws_subnets resource"
    parent = "inspec/resources/aws"
+++

Use the `aws_subnets` InSpec audit resource to test properties of some or all subnets.

Subnets are networks within a VPC that can have their own block of IP address's and ACL's.
VPCs span across all availability zones in AWS, while a subnet in a VPC can only span a single availability zone.
Separating IP addresses allows for protection if there is a failure in one availability zone.

## Syntax

An `aws_subnets` resource block uses an optional filter to select a group of subnets and then tests that group.

    # Test all subnets within a single vpc
    describe aws_subnets.where(vpc_id: 'vpc-12345678') do
      its('subnet_ids') { should include 'subnet-12345678' }
      its('subnet_ids') { should include 'subnet-98765432' }
    end

## Parameters

This resource does not expect any parameters.

See also the [AWS documentation on Subnets](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html).

## Properties

| Property                | Description                                                                                       |
| ----------------------- | ------------------------------------------------------------------------------------------------- |
| subnet_ids              | The name of the auto scaling launch configuration associated with the auto scaling group          |
| vpc_ids                 | An integer indicating the maximum number of instances in the auto scaling group                   |
| cidr_blocks             | An integer indicating the minimum number of instances in the auto scaling group                   |
| availability_zone       | The availability zone this subnet is part of.                                                     |
| map_public_ip_on_launch | A boolean indicating if a public IP is automatically mapped to instances launched in this subnet. |
| states                  | An array of strings corresponding to the subnet IDs associated with the auto scaling group        |
| entries                 | Provides access to the raw results of the query, which can be treated as an array of hashes.      |

## Examples

### Look for all subnets within a vpc

    describe aws_subnets.where( vpc_id: 'vpc-12345678') do
      its('subnet_ids') { should include 'subnet-12345678' }
      its('subnet_ids') { should include 'subnet-98765432' }
    end

### Examine a specific subnet

    describe aws_subnets.where(subnet_id: 'subnet-12345678') do
      its('cidr_blocks') { should eq ['10.0.1.0/24'] }
    end

### Examine a specific vpcs Subnet IDs

    describe aws_subnets.where( vpc_id: 'vpc-12345678') do
      its('states') { should_not include 'pending' }
    end

### Examine a specific subnets VPC IDS

    describe aws_subnets.where( subnet_id: 'subnet-12345678') do
      its('vpc_ids') { should include 'vpc-12345678' }
    end

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

## exist

The control will pass if the describe returns at least one result.

Use `should_not` to test the entity should not exist.

    describe aws_subnets.where( <property>: <value>) do
      it { should exist }
    end

    describe aws_subnets.where( <property>: <value>) do
      it { should_not exist }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `ec2:DescribeSubnets` action with Effect set to Allow.

You can find detailed documentation at [Actions, Resources, and Condition Keys for Amazon EC2](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazonec2.html).
