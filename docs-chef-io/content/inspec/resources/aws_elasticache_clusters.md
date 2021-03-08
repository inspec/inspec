+++
title = "aws_elasticache_clusters resource"
draft = false
gh_repo = "inspec"
platform = "aws"

[menu]
  [menu.inspec]
    title = "aws_elasticache_clusters"
    identifier = "inspec/resources/aws/aws_elasticache_clusters.md aws_elasticache_clusters"
    parent = "inspec/resources/aws"
+++

Use the `aws_elasticache_clusters` InSpec audit resource to test the properties
of all AWS ElastiCache clusters. To audit a single ElastiCache cluster, use `aws_elasticache_cluster` (singular).

## Syntax

An `aws_elasticache_clusters` resource block collects a group of ElastiCache cluster descriptions and then tests that group.

    describe aws_elasticache_clusters
      it { should exist }
    end

## Parameters

This resource does not expect any parameters.

## Properties

| Property             | Description                                                                                                                                     |
| -------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| ids                  | The user-supplied identifier of the cluster. This identifier is a unique key that identifies a cluster.                                         |
| node_types           | The name of the compute and memory capacity node type for the cluster, e.g. `cache.m5.large`.                                                   |
| engines              | The name of the cache engine, e.g. `redis`.                                                                                                     |
| status               | The current state of the cluster, e.g. `creating`, `available`.                                                                                 |
| zones                | The name of the availability zone in which the cluster is located or "Multiple" if the cache nodes are located in different availability zones. |
| subnet_group_names   | The name of the cache subnet group.                                                                                                             |
| encrypted_at_rest    | Indicates whether the content is encrypted at rest or not.                                                                                      |
| encrypted_at_transit | Indicates whether the content is encrypted at transit or not.                                                                                   |

## Examples

### Ensure that exactly 3 ElastiCache clusters exist

    describe aws_elasticache_clusters do
      its("entries.count") { should cmp 3 }
    end

### Use this InSpec resource to request the IDs of all ElastiCache clusters, then test in-depth using `aws_elasticache_cluster` and `aws_elasticache_cluster_node`.

    aws_elasticache_clusters.ids.each do |id|
      aws_elasticache_cluster(id).node_ids.each do |node_id|
        describe aws_elasticache_cluster_node(cache_cluster_id: id, node_id: node_id) do
          it { should exist }
        end
      end
    end

## Matchers

For a full list of available matchers, please visit our [Universal Matchers page](/inspec/matchers/).

### exist

The control will pass if the describe returns at least one result.

Use `should_not` to test the entity should not exist.

    describe aws_elasticache_clusters.where( <property>: <value>) do
      it { should exist }
    end

    describe aws_elasticache_clusters.where( <property>: <value>) do
      it { should_not exist }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `elasticache:DescribeCacheClusters` action set to allow.

You can find detailed documentation at [Actions, Resources, and Condition Keys for Amazon ElastiCache](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazonelasticache.html),
and [Actions, Resources, and Condition Keys for Identity And Access Management](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_identityandaccessmanagement.html).
