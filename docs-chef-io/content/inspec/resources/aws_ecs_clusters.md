+++
title = "aws_ecs_clusters resource"
draft = false
gh_repo = "inspec"
platform = "aws"

[menu]
  [menu.inspec]
    title = "aws_ecs_clusters"
    identifier = "inspec/resources/aws/aws_ecs_clusters.md aws_ecs_clusters resource"
    parent = "inspec/resources/aws"
+++

Use the `aws_ecs_clusters` InSpec audit resource to test properties of some or all AWS ECS Clusters.

## Syntax

An `aws_ecs_clusters` resource block returns all ECS Clusters and allows the testing of that group of Clusters.

    describe aws_ecs_clusters do
      its('cluster_names') { should include 'cluster-root' }
    end

## Parameters

This resource does not expect any parameters.

See also the [AWS documentation on ECS Clusters](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ECS_clusters.html).

## Properties

| Property                             | Description                                                                                                                          |
| ------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------ |
| cluster_arn                          | The Amazon Resource Name (ARN) that identifies the cluster.                                                                          |
| cluster_name                         | A user-generated string that you use to identify your cluster.                                                                       |
| status                               | The status of the cluster.                                                                                                           |
| running_tasks_count                  | The number of tasks in the cluster that are in the RUNNING state.                                                                    |
| pending_tasks_count                  | The number of tasks in the cluster that are in the PENDING state.                                                                    |
| active_services_count                | The number of services that are running on the cluster in an ACTIVE state.                                                           |
| registered_container_instances_count | The number of container instances registered into the cluster. This includes container instances in both ACTIVE and DRAINING status. |
| statistics                           | Additional information about your clusters that are separated by launch type.                                                        |
| entries                              | Provides access to the raw results of the query, which can be treated as an array of hashes.                                         |

## Examples

### Ensure there are no Clusters in an undesired state.

      describe aws_ecs_clusters do
        it                   { should exist }
        its('statuses')      { should_not include 'UNDESIRED-STATUS'}
        its('cluster_names') { should include 'SQL-cluster' }
      end

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### exist

The control will pass if the describe returns at least one result.

Use `should_not` to test the entity should not exist.

    describe aws_ecs_clusters.where( <property>: <value>) do
      it { should exist }
    end

    describe aws_ecs_clusters.where( <property>: <value>) do
      it { should_not exist }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `ecs:ListClusters` & `ecs:DescribeClusters` action set to allow.
