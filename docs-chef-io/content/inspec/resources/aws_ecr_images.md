+++
title = "aws_ecr_images resource"
draft = false
gh_repo = "inspec"
platform = "aws"

[menu]
  [menu.inspec]
    title = "aws_ecr_images"
    identifier = "inspec/resources/aws/aws_ecr_images.md aws_ecr_images"
    parent = "inspec/resources/aws"
+++

Use the `aws_ecr_images` InSpec audit resource to test the properties of all images in an AWS Elastic Container Registry (ECR) repository.
This resource is available in InSpec AWS resource pack version **[1.11.0](https://github.com/inspec/inspec-aws/releases/tag/v1.11.0)** onwards.

## Syntax

An `aws_ecr_images` resource block declares the tests for all images in an AWS ECR repository by the repository name.

    describe aws_ecr_images(repository_name: 'my-repo') do
      it { should exist }
    end

## Parameters

The repository name must be provided. The ID of the registry is optional.

### repository_name _(required)_

The name of the ECR repository must satisfy the following constraints:

- Regex pattern `(?:[a-z0-9]+(?:[._-][a-z0-9]+)*/)*[a-z0-9]+(?:[._-][a-z0-9]+)*`.
- Minimum 2 and maximum of 256 characters long.

### registry_id _(optional)_

The 12-digit ID of the AWS Elastic Container Registry. If not provided, the [default](https://docs.aws.amazon.com/AmazonECR/latest/APIReference/API_DescribeRepositories.html) registry is assumed.

## Properties

| Property                      | Description                                                                                                                                                  |
| ----------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| digests                       | The sha256 digest of the image manifest. The field name is `digest`.                                                                                         |
| size_in_bytes                 | The size, in bytes, of the image in the repository.                                                                                                          |
| tags                          | The list of tags associated with an image. The field name is `tags`.                                                                                         |
| vulnerability_severity_counts | The image vulnerability counts, sorted by severity.                                                                                                          |
| vulnerability_scan_status     | The current state of the scan. It returns an [image scan status object](https://docs.aws.amazon.com/AmazonECR/latest/APIReference/API_ImageScanStatus.html). |
| pushed_at_dates               | The date and time at which an image was pushed to the repository. The field name is `pushed_at_date`.                                                        |

## Examples

### Ensure that there are exactly 3 images

    describe aws_ecr_images(repository_name: 'my-repo') do
      its('count') { should cmp 3 }
    end

### Use this InSpec resource to request the digests of all images, then test in-depth using `aws_ecr_image`.

    aws_ecr_images(repository_name: 'my-repo').digests.each do |image_digest|
      describe aws_ecr_image(repository_name: 'my-repo', image_digest: image_digest) do
        its('tags') { should include('latest') }
      end
    end

## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### exist

The control will pass if the describe returns at least one result.

Use `should_not` to test the entity should not exist.

    describe aws_ecr_images(repository_name: 'my-repo').where( <property>: <value>) do
      it { should exist }
    end

    describe aws_ecr_images(repository_name: 'my-repo').where( <property>: <value>) do
      it { should_not exist }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `ecr:DescribeImages` action set to allow.

You can find detailed documentation at [Actions, Resources, and Condition Keys for Amazon ECR](https://docs.aws.amazon.com/AmazonECR/latest/APIReference/API_Operations.html), and [Actions, Resources, and Condition Keys for Identity And Access Management](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_identityandaccessmanagement.html).
