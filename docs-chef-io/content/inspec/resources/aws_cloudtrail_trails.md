+++
title = "aws_cloudtrail_trails resource"
draft = false
gh_repo = "inspec"
platform = "aws"

[menu]
  [menu.inspec]
    title = "aws_cloudtrail_trails"
    identifier = "inspec/resources/aws/aws_cloudtrail_trails.md aws_cloudtrail_trails resource"
    parent = "inspec/resources/aws"
+++

Use the `aws_cloudtrail_trails` InSpec audit resource to test properties of a collection of AWS CloudTrail Trails.

## Syntax

An `aws_cloudtrail_trails` resource block returns all CloudTrail Trails and allows the testing of those trails.

    describe aws_cloudtrail_trails do
      it { should exist }
    end

## Parameters

This resource does not expect any parameters.

See also the [AWS documentation on Auto Scaling Group](https://docs.aws.amazon.com/autoscaling/ec2/userguide/AutoScalingGroup.html).

## Properties

| Property   | Description                                                                                  |
| ---------- | -------------------------------------------------------------------------------------------- |
| trail_arns | Specifies the ARNs of the trails.                                                            |
| names      | The names of the trails.                                                                     |
| entries    | Provides access to the raw results of the query, which can be treated as an array of hashes. |

## Examples

### Ensure a CloudTrail with a specific name exists

    describe aws_cloudtrail_trails do
      its('names') { should include('trail-1') }
    end

### Ensure a CloudTrail with a specific arn exists

    describe aws_cloudtrail_trails do
      its('trail_arns') { should include('arn:aws:cloudtrail:us-east-1::trail/trail-1') }
    end

## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### exist

The control will pass if the describe returns at least one result.

Use `should_not` to test the entity should not exist.

    describe aws_cloudtrail_trails do
      it { should exist }
    end

    describe aws_cloudtrail_trails do
      it { should_not exist }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `cloudtrail:DescribeTrails` action with Effect set to Allow.

You can find detailed documentation at [Actions, Resources, and Condition Keys for AWS CloudTrail](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_awscloudtrail.html).
