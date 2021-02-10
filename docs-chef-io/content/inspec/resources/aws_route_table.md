+++
title = "aws_route_table resource"
draft = false
gh_repo = "inspec"
platform = "aws"

[menu]
  [menu.inspec]
    title = "aws_route_table"
    identifier = "inspec/resources/aws/aws_route_table.md aws_route_table resource"
    parent = "inspec/resources/aws"
+++

Use the `aws_route_table` InSpec audit resource to test properties of a single Route Table. A route table contains a set of rules, called routes, that are used to determine where network traffic is directed.

## Syntax

This resource expects a single parameter that uniquely identifies the Route Table. You may pass it as a string, or as the value in a hash:

    describe aws_route_table('rtb-123abcde') do
      it { should exist }
    end

    describe aws_route_table(route_table_id: 'rtb-123abcde') do
      it { should exist }
    end

## Parameters

### route_table_id _(required)_

This resource accepts a single parameter, the route_table_id.
This can be passed either as a string or as a `route_table_id: 'value'` key-value entry in a hash.

See also the [AWS documentation on Route Tables](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Route_Tables.html).

## Properties

| Property         | Description                                                       |
| ---------------- | ----------------------------------------------------------------- |
| route_table_id   | The ID of the route table.                                        |
| owner_id         | The ID of the AWS account that owns the route table.              |
| vpc_id           | The ID of the VPC.                                                |
| routes           | The routes in the route table.                                    |
| associations     | The associations between the route table and one or more subnets. |
| propagating_vgws | Any virtual private gateway (VGW) propagating routes.             |
| tags             | Any tags assigned to the route table.                             |

## Examples

### Confirm that the route table has expected VPC identifier

    describe aws_route_table(route_table_id: 'rtb-123abcde') do
      its('vpc_id') { should eq 'vpc-01625e36123456789' }
    end

### Confirm that the route table has expected owner identifier

    describe aws_route_table(route_table_id: 'rtb-123abcde') do
      its('owner_id') { should eq '123456789012' }
    end

### Ensure the expected number of routes is present

    describe aws_route_table(route_table_id: 'rtb-123abcde') do
      its('routes.count') { should eq 2 }
    end

### Ensure the expected number of associations is present

    describe aws_route_table(route_table_id: 'rtb-123abcde') do
      its('associations.count') { should eq 1 }
    end

### Ensure there are no virtual private gateway (VGW) propagating routes

    describe aws_route_table(route_table_id: 'rtb-123abcde') do
      its('propagating_vgws') { should be_empty }
    end

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### exist

The control will pass if the describe returns at least one result.

Use `should_not` to test the entity should not exist.

    describe aws_route_table('should-be-there') do
      it { should exist }
    end

    describe aws_route_table('should-not-be-there') do
      it { should_not exist }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `ec2:DescribeRouteTables` action with Effect set to Allow.

You can find detailed documentation at [Actions, Resources, and Condition Keys for Amazon EC2](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazonec2.html).
