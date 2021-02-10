+++
title = "aws_eks_cluster resource"
draft = false
gh_repo = "inspec"
platform = "aws"

[menu]
  [menu.inspec]
    title = "aws_eks_cluster"
    identifier = "inspec/resources/aws/aws_eks_cluster.md aws_eks_cluster resource"
    parent = "inspec/resources/aws"
+++

Use the `aws_eks_cluster` InSpec audit resource to test properties of a single AWS Elastic Container Service for Kubernetes.

## Syntax

An `aws_eks_cluster` resource block declares the tests for a single EKS Cluster by Cluster name.

    describe aws_eks_cluster('my-eks') do
      it { should exist }
    end

    describe aws_eks_cluster(cluster_name: 'my-eks') do
      it { should exist }
    end

## Parameters

### cluster_name _(required)_

This resource requires a single parameter, the EKS Cluster Name.
This can be passed either as a string or as a `cluster_name: 'value'` key-value entry in a hash.

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
| tags                  | Cluster tags                                                                                                                                                                      |

## Examples

### Test that an EKS Cluster has at least 2 subnets

    describe aws_eks_cluster('my-cluster') do
      its('subnets_count') { should be > 1 }
    end

### Ensure a Cluster has the correct status.

    describe aws_eks_cluster(cluster_name: 'my-eks') do
      its('status') { should eq 'ACTIVE' }
    end

### Ensure that the EKS Cluster is on the correct VPC

    describe aws_eks_cluster('my-cluster') do
      its('vpc_id') { should eq 'vpc-12345678' }
    end

### Ensure the EKS Cluster is using the correct IAM Role.

    describe aws_eks_cluster('my-cluster') do
      its('role_arn') { should cmp 'rn:aws:iam::012345678910:role/eks-service-role-AWSServiceRoleForAmazonEKS-J7ONKE3BQ4PI' }
    end

### Integrate with other resources

Use a combination of InSpec AWS resources to ensure your EKS Cluster does not use the Default VPC.

    # Find the default Security Group for our VPC
    cluster_vpc = aws_eks_cluster(cluster_name: 'my-cluster').vpc_id
    default_sg  = aws_security_group(group_name: 'default', vpc_id: cluster_vpc)

    # Ensure we are not using the default Security Group
    describe aws_eks_cluster(cluster_name: 'my-cluster') do
      its('security_group_ids') { should_not include default_security_group.group_id }
    end

## Matchers

This InSpec audit resource has no special matchers. For a full list of available matchers, please visit our [Universal Matchers page](/inspec/matchers/).

### exist

The control will pass if the describe returns at least one result.

Use `should_not` to test the entity should not exist.

    describe aws_eks_cluster('AnExistingCluster') do
      it { should exist }
    end

    describe aws_eks_cluster('ANonExistentCluster') do
      it { should_not exist }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `eks:DescribeCluster` action set to Allow.

You can find detailed documentation at [Amazon EKS IAM Policies, Roles, and Permissions](https://docs.aws.amazon.com/eks/latest/userguide/IAM_policies.html)
The documentation for EKS actions is at [Policy Structure](https://docs.aws.amazon.com/eks/latest/userguide/iam-policy-structure.html#UsingWithEKS_Actions)
