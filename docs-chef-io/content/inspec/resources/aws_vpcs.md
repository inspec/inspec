+++
title = "aws_vpcs resource"
draft = false
gh_repo = "inspec"
platform = "aws"

[menu]
  [menu.inspec]
    title = "aws_vpcs"
    identifier = "inspec/resources/aws/aws_vpcs.md aws_vpcs resource"
    parent = "inspec/resources/aws"
+++

Use the `aws_vpcs` InSpec audit resource to test properties of some or all AWS Virtual Private Clouds (VPCs).

Each VPC is uniquely identified by its VPC ID. In addition, each VPC has a non-unique CIDR IP Address range (such as 10.0.0.0/16) which it manages.

Every AWS account has at least one VPC, the "default" VPC, in every region.

## Syntax

An `aws_vpcs` resource block uses an optional filter to select a group of VPCs and then tests that group.

    # Since you always have at least one VPC, this will always pass.
    describe aws_vpcs do
      it { should exist }
    end

## Parameters

This resource does not expect any parameters.

See also the [AWS documentation on VPCs](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html).

## Properties

| Property         | Description                                                                                                                                          |
| ---------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- |
| cidr_blocks      | The cidr_blocks property provides a list of the CIDR blocks that the matched VPCs serve as strings.                                                  |
| dhcp_options_ids | The dhcp_option_set_ids property provides a de-duplicated list of the DHCP Option Set IDs that the matched VPCs use when assigning IPs to resources. |
| vpc_ids          | The vpc_ids property provides a list of the IDs of the matched VPCs.                                                                                 |
| tags             | A hash of key-value pairs corresponding to the tags associated with the entity.                                                                      |
| entries          | Provides access to the raw results of the query, which can be treated as an array of hashes.                                                         |

## Examples

### Ensure all VPCs use the same DHCP option set

    describe aws_vpcs.where { dhcp_options_id != 'dopt-12345678' } do
      it { should_not exist }
    end

### Check for a Particular VPC ID

    describe aws_vpcs do
      its('vpc_ids') { should include 'vpc-12345678' }
    end

### Use the VPC IDs to Get a List of Default Security Groups

    aws_vpcs.vpc_ids.each do |vpc_id|
      describe aws_security_group(vpc_id: vpc_id, group_name: 'default') do
        it { should_not allow_in(port: 22) }
      end
    end

### We shun the 10.0.0.0/8 space

    describe aws_vpcs.where { cidr_block.start_with?('10') } do
      it { should_not exist }
    end

### Check tags

    describe aws_vpc do
      its('tags') { should include(:Environment => 'env-name',
                                   :Name => 'vpc-name')}
    end

## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers, please visit our [Universal Matchers page](/inspec/matchers/).

### exist

The control will pass if the describe returns at least one result.

Use `should_not` to test the entity should not exist.

    describe aws_vpcs do
      it { should exist }
    end

    describe aws_vpcs.where( <property>: <value>) do
      it { should_not exist }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `ec2:DescribeVpcs` action with Effect set to Allow.

You can find detailed documentation at [Actions, Resources, and Condition Keys for Amazon EC2](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazonec2.html).
