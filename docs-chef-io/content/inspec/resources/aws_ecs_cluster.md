+++
title = "aws_ecs_cluster resource"
draft = false
gh_repo = "inspec"
platform = "aws"

[menu]
  [menu.inspec]
    title = "aws_ecs_cluster"
    identifier = "inspec/resources/aws/aws_ecs_cluster.md aws_ecs_cluster resource"
    parent = "inspec/resources/aws"
+++

Use the `aws_ecs_cluster` InSpec audit resource to test properties of a single AWS ECS Cluster.

## Syntax

An `aws_ecs_cluster` resource block declares the tests for a single AWS ECS Cluster by cluster name.

    describe aws_ecs_cluser(cluster_name: 'cluster-8') do
      it             { should exist }
    end

## Parameters

If no parameters are passed, the resource will attempt to retrieve the `default` ECS Cluster.

### cluster_name _(optional)_

This resource accepts a single parameter, the Cluster Name.
This can be passed either as a string or as a `cluster_name: 'value'` key-value entry in a hash.

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

## Examples

### Test that an ECS Cluster does not exist

    describe aws_ecs_cluster(cluster_name: 'invalid-cluster') do
      it    { should_not exist }
    end

### Test that an ECS Cluster is active

    describe aws_ecs_cluster('cluster-8') do
      its ('status') { should eq 'ACTIVE' }
    end

## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### exist

The control will pass if the describe returns at least one result.

Use `should_not` to test the entity should not exist.

    describe aws_ecs_cluster('cluster-8') do
      it { should exist }
    end

    describe aws_ecs_cluster('cluster-9') do
      it { should_not exist }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal)
will need the `ec2:DescribeClusters` action set to allow.
