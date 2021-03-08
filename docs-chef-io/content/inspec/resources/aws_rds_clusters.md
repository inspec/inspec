+++
title = "aws_rds_clusters resource"
draft = false
gh_repo = "inspec"
platform = "aws"

[menu]
  [menu.inspec]
    title = "aws_rds_clusters"
    identifier = "inspec/resources/aws/aws_rds_clusters.md aws_rds_clusters resource"
    parent = "inspec/resources/aws"
+++

Use the `aws_rds_clusters` InSpec audit resource to test properties of a collection of AWS RDS clusters.

RDS gives you access to the capabilities of a MySQL, MariaDB, PostgreSQL,
Microsoft SQL Server, Oracle, or Amazon Aurora database server.

## Syntax

Ensure you have exactly 3 clusters

    describe aws_rds_clusters do
      its('db_cluster_identifiers.count') { should cmp 3 }
    end

## Parameters

This resource does not expect any parameters.

See also the [AWS documentation on RDS](https://docs.aws.amazon.com/rds/?id=docs_gateway).

## Properties

| Property           | Description                                                                           |
| ------------------ | ------------------------------------------------------------------------------------- |
| cluster_identifier | The unique IDs of the RDS clusters returned.                                          |
| database_name      | The name of the database associated with each RDS cluster.                            |
| cluster\_\members  | The RDS instances attached to each RDS cluster.                                       |
| engine             | The name of the database engine used by each cluster.                                 |
| engine_version     | The version of the database engine used by each cluster.                              |
| status             | The current status of each cluster.                                                   |
| allocated_storage  | The storage allocated to each cluster.                                                |
| storage_encrypted  | Returns T/F whether the cluster is encrypted or not.                                  |
| availability_zones | A list of availability zones of the RDS clusters returned.                            |
| multi_az           | Returns T/F depending on whether multiple availability zones are used in the cluster. |
| arn                | The unique Amazon resource name of the RDS clusters.                                  |

## Examples

### Ensure a specific cluster exists

    describe aws_rds_clusters do
      its('db_cluster_identifier') { should include 'cluster-12345678' }
    end

### Test That All RDS Clusters Are Encrypted by ID

Use the InSpec resource to request the IDs of all RDS clusters, then test
in-depth using `aws_rds_cluster` to ensure all clusters are encrypted and have a
sensible size.

    aws_rds_clusters.cluster_identifier.each do |cluster_identifier|
        describe aws_rds_cluster(cluster_identifier) do
          it { should have_encrypted_storage }
      end
    end

## Matchers

For a full list of available matchers, please visit our [Universal Matchers page](/inspec/matchers/).

### exist

The control will pass if the describe returns at least one result.

Use `should_not` to test the entity should not exist.

    describe aws_rds_clusters do
      it { should exist }
    end

    describe aws_rds_clusters do
      it { should_not exist }
    end

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `ec2:Describeclusters`, and `iam:GetInstanceProfile` actions set to allow.
You can find detailed documentation at [Actions, Resources, and Condition Keys for Amazon EC2](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazonec2.html), and [Actions, Resources, and Condition Keys for Identity And Access Management](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_identityandaccessmanagement.html).
