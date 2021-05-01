---
title: About the aws_rds_instances Resource
platform: aws
---

# aws\_rds\_instances

Use the `aws_rds_instances` InSpec audit resource to test properties of a collection of AWS RDS instances.

RDS gives you access to the capabilities of a MySQL, MariaDB, PostgreSQL, Microsoft SQL Server, Oracle, or Amazon Aurora database server.

RDS instances are compute instances used by the RDS service.

## Syntax

 Ensure you have exactly 3 instances

    describe aws_rds_instances do
      its('db_instance_identifiers.count') { should cmp 3 }
    end
    
#### Parameters

This resource does not expect any parameters.

See also the [AWS documentation on RDS](https://docs.aws.amazon.com/rds/?id=docs_gateway).

## Properties

|Property                     | Description|
| ---                         | --- |
|db\_instance\_identifiers    | The unique IDs of the RDS Instances returned. |
|entries                      | Provides access to the raw results of the query, which can be treated as an array of hashes. |
   
## Examples

#####Ensure a specific instance exists
    describe aws_rds_instances do
      its('db_instance_identifiers') { should include 'rds-12345678' }
    end

##### Use the InSpec resource to request the IDs of all RDS instances, then test in-depth using `aws_rds_instance` to ensure all instances are encrypted and have a sensible size.
    aws_rds_instances.db_instance_identifiers.each do |db_instance_identifier|
      describe aws_rds_instance(db_instance_identifier) do
        it { should be_encrypted }
      end
    end

## Matchers

For a full list of available matchers, please visit our [Universal Matchers page](https://www.inspec.io/docs/reference/matchers/). 

#### exist

The control will pass if the describe returns at least one result.

Use `should_not` to test the entity should not exist.

    describe aws_rds_instances do
      it { should exist }
    end
      
    describe aws_rds_instances do
      it { should_not exist }
    end

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `ec2:DescribeInstances`, and `iam:GetInstanceProfile` actions set to allow.
You can find detailed documentation at [Actions, Resources, and Condition Keys for Amazon EC2](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazonec2.html), and [Actions, Resources, and Condition Keys for Identity And Access Management](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_identityandaccessmanagement.html).
