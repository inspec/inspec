+++
title = "aws_vpc resource"
draft = false
gh_repo = "inspec"
platform = "aws"

[menu]
  [menu.inspec]
    title = "aws_vpc"
    identifier = "inspec/resources/aws/aws_vpc.md aws_vpc resource"
    parent = "inspec/resources/aws"
+++

Use the `aws_vpc` InSpec audit resource to test properties of a single AWS Virtual Private Cloud (VPC).

Each VPC is uniquely identified by its VPC ID. In addition, each VPC has a non-unique CIDR IP Address range (such as 10.0.0.0/16) which it manages.

Every AWS account has at least one VPC, the "default" VPC, in every region.

## Syntax

An `aws_vpc` resource block identifies a VPC by id. If no VPC ID is provided, the default VPC is used.

    # Find the default VPC
    describe aws_vpc do
      it { should exist }
    end

    # Find a VPC by ID
    describe aws_vpc('vpc-12345678987654321') do
      it { should exist }
    end

    # Hash syntax for ID
    describe aws_vpc(vpc_id: 'vpc-12345678') do
      it { should exist }
    end

## Parameters

If no parameter is provided, the subscription's default VPC will be returned.

### vpc_id _(optional)_

This resource accepts a single parameter, the VPC ID.
This can be passed either as a string or as a `vpc_id: 'value'` key-value entry in a hash.

See also the [AWS documentation on VPCs](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html).

## Properties

| Property         | Description                                                                                                                  |
| ---------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| cidr_block       | The IPv4 address range that is managed by the VPC.                                                                           |
| dhcp_options_id  | The ID of the set of DHCP options associated with the VPC (or `default` if the default options are associated with the VPC). |
| instance_tenancy | The allowed tenancy of instances launched into the VPC.                                                                      |
| state            | The state of the VPC (`pending`                                                                                              | `available`). |
| vpc_id           | The ID of the VPC.                                                                                                           |
| tags             | The tags of the VPC.                                                                                                         |

## Examples

The following examples show how to use this InSpec audit resource.

### Test the CIDR of a named VPC

    describe aws_vpc('vpc-87654321') do
      its('cidr_block') { should cmp '10.0.0.0/16' }
    end

### Test the state of the VPC

    describe aws_vpc do
      its ('state') { should eq 'available' }
      # or equivalently
      it { should be_available }
    end

### Test the allowed tenancy of instances launched into the VPC

    describe aws_vpc do
      its ('instance_tenancy') { should eq 'default' }
    end

### Test tags on the VPC

    describe aws_vpc do
      its('tags') { should include(:Environment => 'env-name',
                                   :Name => 'vpc-name')}
    end

## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### be_default

The test will pass if the identified VPC is the default VPC for the region.

    describe aws_vpc('vpc-87654321') do
      it { should be_default }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `ec2:DescribeVpcs` action with Effect set to Allow.

You can find detailed documentation at [Actions, Resources, and Condition Keys for Amazon EC2](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazonec2.html).
