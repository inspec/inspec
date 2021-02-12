+++
title = "aws_ecr_repositories resource"
draft = false
gh_repo = "inspec"
platform = "aws"

[menu]
  [menu.inspec]
    title = "aws_ecr_repositories"
    identifier = "inspec/resources/aws/aws_ecr_repositories.md aws_ecr_repositories"
    parent = "inspec/resources/aws"
+++

Use the `aws_ecr_repositories` InSpec audit resource to test the properties of all repositories in an AWS Elastic Container Registry (ECR).
This resource is available in InSpec AWS resource pack version **[1.11.0](https://github.com/inspec/inspec-aws/releases/tag/v1.11.0)** onwards.

## Syntax

An `aws_ecr_repositories` resource block declares the tests for all AWS ECR repositories in the default registry unless the registry ID is provided.

    describe aws_ecr_repositories do
      it { should exist }
    end

Repositories in a non-default registry can be tested by supplying the registry ID if the AWS user has necessary permissions on it.

    describe aws_ecr_repositories(registry_id: '123456789012') do
      it { should exist }
    end

## Parameters

The registry id is optional.

### registry_id _(optional)_

The 12-digit ID of the AWS Elastic Container Registry. If not provided, the [default](https://docs.aws.amazon.com/AmazonECR/latest/APIReference/API_DescribeRepositories.html) registry is assumed.

## Properties

| Property                      | Description                                                                                |
| ----------------------------- | ------------------------------------------------------------------------------------------ |
| arns                          | The Amazon Resource Name (ARN) that identifies the repository.                             |
| names                         | The name of the repository.                                                                |
| uris                          | The URI for the repository.                                                                |
| created_at_dates              | The date and time, in JavaScript date format, when the repository was created.             |
| image_tag_mutability_status   | The tag mutability setting for the repository.                                             |
| image_scanning_on_push_status | The setting that determines whether images are scanned after being pushed to a repository. |

## Examples

### Ensure that there are exactly 3 repositories in the default registry

    describe aws_ecr_repositories do
      its("count") { should cmp 3 }
    end

### Use this InSpec resource to request the names of all repositories, then test in-depth using `aws_ecr_repository`.

    aws_ecr_repositories.names.each do |repository_name|
      describe aws_ecr_repository(repository_name) do
        its('image_tag_mutability') { should eq 'MUTABLE' }
      end
    end

## Matchers

For a full list of available matchers, please visit our [Universal Matchers page](/inspec/matchers/).

### exist

The control will pass if the describe returns at least one result.

Use `should_not` to test the entity should not exist.

    describe aws_ecr_repositories.where( <property>: <value>) do
      it { should exist }
    end

    describe aws_ecr_repositories.where( <property>: <value>) do
      it { should_not exist }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `ecr:DescribeRepositories` action set to allow.

You can find detailed documentation at [Actions, Resources, and Condition Keys for Amazon ECR](https://docs.aws.amazon.com/AmazonECR/latest/APIReference/API_Operations.html), and [Actions, Resources, and Condition Keys for Identity And Access Management](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_identityandaccessmanagement.html).
