+++
title = "aws_region resource"
draft = false
gh_repo = "inspec"
platform = "aws"

[menu]
  [menu.inspec]
    title = "aws_region"
    identifier = "inspec/resources/aws/aws_region.md aws_region resource"
    parent = "inspec/resources/aws"
+++

Use the `aws_region` InSpec audit resource to test properties of a single AWS region.

## Syntax

An `aws_region` resource block identifies an AWS region by ID. If no region is provided, the current default is used.

    describe aws_region('eu-west-2') do
      it { should exist }
    end

    describe aws_region(region_name: 'us-east-1') do
      it { should exist }
    end

## Parameters

### region_name _(optional)_

This resource accepts a single parameter, the region_name.
This can be passed either as a string or as a `region_name: 'value'` key-value entry in a hash.

See also the [AWS documentation on Regions](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html).

## Properties

| Property    | Description                          |
| ----------- | ------------------------------------ |
| region_name | The Name of the region.              |
| endpoint    | The resolved endpoint of the region. |

## Examples

### Test whether a region exists

    describe aws_region('region-not-real') do
      it { should_not exist }
    end

### Test the Region Endpoint

    describe aws_region(region_name: 'eu-west-2') do
      its('endpoint') { should eq 'ec2.eu-west-2.amazonaws.com' }
    end

## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### exist

The control will pass if the describe returns at least one result.

      it { should exist }

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `ec2:DescribeRegions` action with Effect set to Allow.

You can find detailed documentation at [Actions, Resources, and Condition Keys for Amazon EC2](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazonec2.html).
