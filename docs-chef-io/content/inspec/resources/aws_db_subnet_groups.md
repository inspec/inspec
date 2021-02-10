+++
title = "aws_db_subnet_groups resource"
draft = false
gh_repo = "inspec"
platform = "aws"

[menu]
  [menu.inspec]
    title = "aws_db_subnet_groups"
    identifier = "inspec/resources/aws/aws_db_subnet_groups.md aws_db_subnet_groups resource"
    parent = "inspec/resources/aws"
+++

Use the `aws_db_subnet_groups` InSpec audit resource to test properties of a collection of AWS RDS subnet groups.

RDS gives you access to the capabilities of a MySQL, MariaDB, PostgreSQL, Microsoft SQL Server, Oracle, or Amazon Aurora database server.

## Syntax

Ensure you have exactly 3 subnet groups

    describe aws_db_subnet_groups do
      its('db_subnet_group_names.count') { should cmp 3 }
    end

## Parameters

This resource does not expect any parameters.

See also the [AWS documentation on RDS](https://docs.aws.amazon.com/rds/?id=docs_gateway).

## Properties

| Property                     | Description                                       |
| ---------------------------- | ------------------------------------------------- |
| db_subnet_group_names        | The name of the DB subnet group.                  |
| db_subnet_group_descriptions | Provides the description of the DB subnet group.  |
| vpc_ids                      | Provides the VPC ID of the DB subnet group.       |
| subnet_group_status          | Provides the status of the DB subnet group.       |
| subnets                      | Contains a list of Subnet elements.               |
| db_subnet_group_arns         | The Amazon Resource Name for the DB subnet group. |

For a comprehensive list of properties available, see [the API reference documentation](https://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_DBSubnetGroup.html)

## Examples

### Ensure DB Subnet Group Name of a subnet group exists

    describe aws_db_subnet_groups do
      its('db_subnet_group_names') { should include 'subnet-group-name' }
    end

## Matchers

For a full list of available matchers, please visit our [Universal Matchers page](/inspec/matchers/).

### exist

The control will pass if the describe returns at least one result.

Use `should_not` to test the entity should not exist.

    describe aws_db_subnet_groups.where( <property>: <value> ) do
      it { should exist }
    end

    describe aws_db_subnet_groups.where( <property>: <value> ) do
      it { should_not exist }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal)
will need the `rds:DescribeDBSubnetGroups` action with Effect set to Allow.

You can find detailed documentation at
[Actions, Resources, and Condition Keys for Amazon RDS](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazonrds.html).
