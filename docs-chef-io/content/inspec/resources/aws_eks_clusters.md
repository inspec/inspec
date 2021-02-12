+++
title = "aws_eks_clusters resource"
draft = false
gh_repo = "inspec"
platform = "aws"

[menu]
  [menu.inspec]
    title = "aws_eks_clusters"
    identifier = "inspec/resources/aws/aws_eks_clusters.md aws_eks_clusters resource"
    parent = "inspec/resources/aws"
+++

Use the `aws_eks_clusters` resource to test the configuration of a collection of AWS Elastic Container Service for Kubernetes.

## Syntax

    describe aws_eks_clusters do
      its('names.count') { should cmp 10 }
    end

## Parameters

This resource does not expect any parameters.

See also the [AWS documentation on EKS Clusters](https://docs.aws.amazon.com/eks/latest/userguide/getting-started.html).

## Properties

| Property              | Description                                                                                                                                                                       |
| --------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| arn                   | The Amazon Resource Name (ARN) of the cluster.                                                                                                                                    |
| name                  | The name of the cluster.                                                                                                                                                          |
| endpoint              | The endpoint for your Kubernetes API server.                                                                                                                                      |
| status                | The current status of the cluster.                                                                                                                                                |
| version               | The Kubernetes server version for the cluster.                                                                                                                                    |
| certificate_authority | The certificate-authority-data for your cluster.                                                                                                                                  |
| subnets_count         | The number of subnets associated with your cluster.                                                                                                                               |
| subnet_ids            | The subnets associated with your cluster.                                                                                                                                         |
| security_groups_count | The count of security groups associated with your cluster.                                                                                                                        |
| security_group_ids    | The security groups associated with the cross-account elastic network interfaces that are used to allow communication between your worker nodes and the Kubernetes control plane. |
| role_arn              | The Amazon Resource Name (ARN) of the IAM role that provides permissions for the Kubernetes control plane to make calls to AWS API operations on your behalf.                     |
| vpc_id                | The VPC associated with your cluster.                                                                                                                                             |
| created_at            | The Unix epoch timestamp in seconds for when the cluster was created.                                                                                                             |
| creating              | Boolean indicating whether or not the state of the cluster is CREATING.                                                                                                           |
| active                | Boolean indicating whether or not the state of the cluster is ACTIVE.                                                                                                             |
| failed                | Boolean indicating whether or not the state of the cluster is FAILED.                                                                                                             |
| deleting              | Boolean indicating whether or not the state of the cluster is DELETING.                                                                                                           |
| entries               | Provides access to the raw results of the query, which can be treated as an array of hashes.                                                                                      |

## Examples

### Allow at most 100 EKS Clusters on the account

    describe aws_eks_clusters do
      its('entries.count') { should be <= 100}
    end

### Ensure a specific Cluster exists, by name

    describe aws_eks_clusters do
      its('names') { should include('cluster-1') }
    end

### Ensure no Clusters are in a failed state

    describe aws_eks_clusters.where( failed: true ) do
        it { should_not exist )
    end

## Matchers

This InSpec audit resource has the following special matchers. For a full list
of available matchers, please visit our [matchers page](/inspec/matchers/).

### exist

The control will pass if the describe returns at least one result.

Use `should_not` to test the entity should not exist.

    describe aws_eks_clusters.where( <property>: <value>) do
      it { should exist }
    end

    describe aws_eks_clusters.where( <property>: <value>) do
      it { should_not exist }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `eks:DescribeCluster` action with Effect set to Allow.

You can find detailed documentation at [Amazon EKS IAM Policies, Roles, and Permissions](https://docs.aws.amazon.com/eks/latest/userguide/IAM_policies.html)
The documentation for EKS actions is at [Policy Structure](https://docs.aws.amazon.com/eks/latest/userguide/iam-policy-structure.html#UsingWithEKS_Actions)
