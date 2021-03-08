+++
title = "aws_subnet resource"
draft = false
gh_repo = "inspec"
platform = "aws"

[menu]
  [menu.inspec]
    title = "aws_subnet"
    identifier = "inspec/resources/aws/aws_subnet.md aws_subnet resource"
    parent = "inspec/resources/aws"
+++

Use the `aws_subnet` InSpec audit resource to test properties of a vpc subnet.

## Syntax

An `aws_subnet` resource block uses the parameter to select a VPC and a subnet in the VPC.

    describe aws_subnet(subnet_id: 'subnet-1234567') do
      it { should exist }
    end

## Parameters

### subnet_id _(required)_

This resource accepts a single parameter, the Subnet ID.
This can be passed either as a string or as a `subnet_id: 'value'` key-value entry in a hash.

See also the [AWS documentation on Subnets](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html).

## Properties

| Property                   | Description                                                    |
| -------------------------- | -------------------------------------------------------------- |
| subnet_id                  | Provides the ID of the Subnet.                                 |
| vpc_id                     | Provides the ID of the VPC the subnet is in.                   |
| availability_zone          | Provides the Availability Zone of the subnet.                  |
| cidr_block                 | Provides the block of ip addresses specified to the subnet.    |
| available_ip_address_count | Provides the number of available IPv4 addresses on the subnet. |

## Examples

### Check availability zone of a subnet

    describe aws_subnet(subnet_id: 'subnet-12345678') do
      its('availability_zone') { should eq 'us-east-1c' }
    end

### Check the number of available IP addresses

    describe aws_subnet(subnet_id: 'subnet-12345678') do
      its('available_ip_address_count') { should eq 251 }
    end

### Test the block of ip addresses specified to the subnet

    describe aws_subnet(subnet_id: 'subnet-12345678') do
      its('cidr_block') { should eq '10.0.1.0/24' }
    end

### Ensure the subnet is in the right VPC

    describe aws_subnet(subnet_id: 'subnet-12345678') do
      its('vpc_id') { should eq 'vpc-12345678' }
    end

## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### assigning_ipv_6_address_on_creation

Detects if the network interface on the subnet accepts IPv6 addresses.

    describe aws_subnet(subnet_id: 'subnet-12345678') do
      it { should be_assigning_ipv_6_address_on_creation }
    end

### available

Provides the current state of the subnet.

    describe aws_subnet(subnet_id: 'subnet-12345678') do
      it { should be_available }
    end

### default_for_az

Detects if the subnet is the default subnet for the Availability Zone.

    describe aws_subnet(subnet_id: 'subnet-12345678') do
      it { should be_default_for_az }
    end

### mapping_public_ip_on_launch

Provides the VPC ID for the subnet.

    describe aws_subnet(subnet_id: 'subnet-12345678') do
      it { should be_mapping_public_ip_on_launch }
    end

### exist

The `exist` matcher indicates that a subnet exists for the specified vpc.

    describe aws_subnet(subnet_id: 'subnet-12345678') do
      it { should exist }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `ec2:DescribeSubnets` action with Effect set to Allow.

You can find detailed documentation at [Actions, Resources, and Condition Keys for Amazon EC2](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazonec2.html).
