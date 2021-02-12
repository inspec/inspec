+++
title = "aws_elasticache_cluster_node resource"
draft = false
gh_repo = "inspec"
platform = "aws"

[menu]
  [menu.inspec]
    title = "aws_elasticache_cluster_node"
    identifier = "inspec/resources/aws/aws_elasticache_cluster_node.md aws_elasticache_cluster_node"
    parent = "inspec/resources/aws"
+++

Use the `aws_elasticache_cluster_node` InSpec audit resource to test the properties of a single AWS ElastiCache cluster node.

## Syntax

An `aws_elasticache_cluster_node` resource block declares the tests for a single AWS ElastiCache cluster node by `cache_cluster_id` and `node_id`.

    describe aws_elasticache_cluster_node(cache_cluster_id: 'my-cluster-123', node_id: '0001') do
      it { should exist }
    end

## Parameters

The ElastiCache cluster ID and node ID must be provided.

### cache_cluster_id _(required)_

The ID of the ElastiCache cluster:

- contains between 1 and 50 alphanumeric characters or hyphens,
- should start with a letter,
- cannot end with a hyphen or contain two consecutive hyphens.

It can be passed either as a string or as a `cache_cluster_id: 'value'` key-value entry in a hash.

### node_id _(required)_

The ID of the node must be a string containing 4 digits. It can be passed as a `node_id: 'value'` key-value entry in a hash.

## Properties

| Property    | Description                                                                                                            |
| ----------- | ---------------------------------------------------------------------------------------------------------------------- |
| id          | The cache node identifier, e.g. `0001`.                                                                                |
| port        | The port number that the cache engine is listening on.                                                                 |
| address     | The DNS hostname of the cache node.                                                                                    |
| status      | The current state of the cache node. One of the following values: `available`, `creating`, `rebooting`, or `deleting`. |
| create_time | The date and time when the cache node was created.                                                                     |

There are also additional properties available. For a comprehensive list, see [the API reference documentation](https://docs.aws.amazon.com/AmazonElastiCache/latest/APIReference/API_CacheNode.html).

## Examples

### Test that an ElastiCache cluster node is available

    describe aws_elasticache_cluster_node(cache_cluster_id: "my-cluster-123", node_id: "0001") do
        its("status") { should eq 'available' }
    end

### Test that an Elasticache cluster engine is listening on port `11211`

    describe aws_elasticache_cluster_node(cache_cluster_id: "my-cluster-123", node_id: "0001") do
        its("port") { should cmp 11211 }
    end

### Test that an Elasticache cluster node's customer availability zone is `us-east-2b`

    describe aws_elasticache_cluster_node(cache_cluster_id: "my-cluster-123", node_id: "0001") do
        its("customer_availability_zone") { should cmp "us-east-2b" }
    end

## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### exist

    describe aws_elasticache_cluster_node(cache_cluster_id: "my-cluster-123", node_id: "0001") do
        it { should exist }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `elasticache:DescribeCacheClusters` action set to allow.

You can find detailed documentation at [Actions, Resources, and Condition Keys for Amazon ElastiCache](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazonelasticache.html),
and [Actions, Resources, and Condition Keys for Identity And Access Management](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_identityandaccessmanagement.html).
