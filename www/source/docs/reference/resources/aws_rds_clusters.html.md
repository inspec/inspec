---
title: About the aws_rds_clusters Resource
platform: aws
---

# aws\_rds\_clusters

Use the `aws_rds_clusters` InSpec audit resource to test properties of a collection of AWS RDS clusters.

RDS gives you access to the capabilities of a MySQL, MariaDB, PostgreSQL, Microsoft SQL Server, Oracle, or Amazon Aurora database server.

## Syntax

 Ensure you have exactly 3 clusters

    describe aws_rds_clusters do
      its('db_cluster_identifiers.count') { should cmp 3 }
    end
    
#### Parameters

This resource does not expect any parameters.

See also the [AWS documentation on RDS](https://docs.aws.amazon.com/rds/?id=docs_gateway).

## Properties

|Property                     | Description|
| ---                         | --- |
|cluster\_identifier    | The unique IDs of the RDS clusters returned. |
|database\_name    | The name of the database associated with each RDS cluster. | 
|cluster_\members    | The RDS instances attached to each RDS cluster. |
|engine    | The name of the database engine used by each cluster. | 
|engine\_version    | The version of the database engine used by each cluster. |
|status   | The current status of each cluster. | 
|allocated\_storage    | The storage allocated to each cluster. |
|storage\_encrypted    | Returns T/F whether the cluster is encrypted or not. | 
|availability\_zones    | A list of availability zones of the RDS clusters returned.  |
|multi\_az   | Returns T/F depending on whether multiple availability zones are used in the cluster. | 
|arn   | The unique Amazon resource name of the RDS clusters. |     
## Examples

#####Ensure a specific cluster exists
    describe aws_rds_clusters do
      its('db_cluster_identifier') { should include 'cluster-12345678' }
    end

##### Use the InSpec resource to request the IDs of all RDS clusters, then test in-depth using `aws_rds_cluster` to ensure all clusters are encrypted and have a sensible size.
    aws_rds_clusters.cluster_identifier.each do |cluster_identifier|
        describe aws_rds_cluster(cluster_identifier) do
          it { should have_encrypted_storage }
      end
    end

## Matchers

For a full list of available matchers, please visit our [Universal Matchers page](https://www.inspec.io/docs/reference/matchers/). 

#### exist

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
