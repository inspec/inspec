+++
title = "aws_route_tables resource"
draft = false
gh_repo = "inspec"
platform = "aws"

[menu]
  [menu.inspec]
    title = "aws_route_tables"
    identifier = "inspec/resources/aws/aws_route_tables.md aws_route_tables"
    parent = "inspec/resources/aws"
+++

Use the `aws_route_tables` InSpec audit resource to test properties of all or a group of Route Tables. A Route Table contains a set of rules, called routes, that are used to determine where network traffic is directed.

## Syntax

Ensure that there is at least one route table

    describe aws_route_tables do
      it { should exist }
    end

## Parameters

This resource does not expect any parameters.

See also the [AWS documentation on Route Tables](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Route_Tables.html).

## Properties

| Property        | Description                                                                                  |
| --------------- | -------------------------------------------------------------------------------------------- |
| route_table_ids | The route table IDs                                                                          |
| vpc_ids         | The VPC IDs                                                                                  |
| entries         | Provides access to the raw results of the query, which can be treated as an array of hashes. |

## Examples

### Confirm that a route table exists

    describe aws_route_tables do
      its('vpc_ids') { should include 'vpc-01625e36123456789' }
    end

### Confirm a Route Table exists.

    describe aws_route_tables do
      its('route_table_ids') { should include 'rtb-12345678' }
    end

## Matchers

### exist

The control will pass if the describe returns at least one result.

Use `should_not` to test the entity should not exist.

      it { should exist }

      it { should_not exist }

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `ec2:DescribeRouteTables` action with Effect set to Allow.

You can find detailed documentation at [Actions, Resources, and Condition Keys for Amazon EC2](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazonec2.html).
