+++
title = "aws_elasticache_cluster resource"
draft = false
gh_repo = "inspec"
platform = "aws"

[menu]
  [menu.inspec]
    title = "aws_elasticache_cluster"
    identifier = "inspec/resources/aws/aws_elasticache_cluster.md aws_elasticache_cluster"
    parent = "inspec/resources/aws"
+++

[\[edit on GitHub\]](https://github.com/inspec/inspec/blob/master/docs-chef-io/content/aws_elasticache_cluster.md)

Use the `aws_elasticache_cluster` InSpec audit resource to test the properties of a single AWS ElastiCache cluster.

## Syntax

An `aws_elasticache_cluster` resource block declares the tests for a single AWS ElastiCache cluster by `cache_cluster_id`.

    describe aws_elasticache_cluster(cache_cluster_id: 'my-cluster-123') do
      it { should exist }
    end

The value of the `cache_cluster_id` can be provided as a string.

    describe aws_elasticache_cluster('my-cluster-123') do
      its('engine') { should cmp 'redis' }
    end

## Parameters

The ElastiCache cluster ID must be provided.

### cache_cluster_id _(required)_

The ID of the ElastiCache cluster:

- contains between 1 and 50 alphanumeric characters or hyphens,
- should start with a letter,
- cannot end with a hyphen or contain two consecutive hyphens.

It can be passed either as a string or as a `cache_cluster_id: 'value'` key-value entry in a hash.

## Properties

| Property             | Description                                                                                             |
| -------------------- | ------------------------------------------------------------------------------------------------------- |
| cache_cluster_id     | The user-supplied identifier of the cluster. This identifier is a unique key that identifies a cluster. |
| engine               | The name of the cache engine, e.g. `redis`.                                                             |
| node_ids             | The id list of all cluster nodes.                                                                       |
| ports                | A hash of the node ID and port number pairs.                                                            |
| status               | The current state of the cluster, e.g. `creating`, `available`.                                         |
| encrypted_at_rest    | Indicates whether the content is encrypted at rest or not.                                              |
| encrypted_at_transit | Indicates whether the content is encrypted at transit or not.                                           |

There are also additional properties available. For a comprehensive list, see [the API reference documentation](https://docs.aws.amazon.com/AmazonElastiCache/latest/APIReference/API_CacheCluster.html).

## Examples

### Test that an ElastiCache cluster is available

    describe aws_elasticache_cluster("my-cluster-123") do
        its("status") { should eq 'available' }
    end

### Test that an Elasticache cluster engine is listening on port `11211`

    describe aws_elasticache_cluster(cache_cluster_id: "my-cluster-123") do
        its("port") { should cmp 11211 }
    end

### Test that an Elasticache cluster's engine version is `1.5.16`

    describe aws_elasticache_cluster(cache_cluster_id: "my-cluster-123") do
        its("engine_version") { should cmp 1.5.16 }
    end

## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### exist

    describe aws_elasticache_cluster(cache_cluster_id: "my-cluster-123") do
        it { should exist }
    end

### be_encrypted_at_rest

    describe aws_elasticache_cluster(cache_cluster_id: "my-cluster-123") do
        it { should be_encrypted_at_rest }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal)
will need the `elasticache:DescribeCacheClusters` action set to allow.

You can find detailed documentation at [Actions, Resources, and Condition Keys for Amazon ElastiCache](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazonelasticache.html),
and [Actions, Resources, and Condition Keys for Identity And Access Management](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_identityandaccessmanagement.html).
