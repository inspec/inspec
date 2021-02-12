+++
title = "aws_internet_gateways resource"
draft = false
gh_repo = "inspec"
platform = "aws"

[menu]
  [menu.inspec]
    title = "aws_internet_gateways"
    identifier = "inspec/resources/aws/aws_internet_gateways.md aws_internet_gateways"
    parent = "inspec/resources/aws"
+++

Use the `aws_internet_gateways` InSpec audit resource to test the properties of all AWS internet gateways owned by the AWS account.

## Syntax

An `aws_internet_gateways` resource block collects all of the internet gateways and then tests that group.

    describe aws_internet_gateways do
      it { should exist }
    end

## Parameters

This resource does not expect any parameters.

## Properties

| Property          | Description                                                                                                                   |
| ----------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| ids               | The ID of the internet gateway. The field name is `id`.                                                                       |
| names             | The value of the `Name` tag. It is `nil` if not defined. The field name is `name`.                                            |
| vpc_ids           | The ID of the attached VPC. It is `nil` if the resource is in a `detached` state. The field name is `vpc_id`.                 |
| tags              | A hash, with each key-value pair corresponding to an internet gateway tag. The field name is `tags`.                          |
| attachment_states | Indicates whether the internet gateway is attached to a VPC (`attached` or `detached`). The field name is `attachment_state`. |
| owner_ids         | The ID of the AWS account that owns the internet gateway. The field name is `owner_id`.                                       |

## Examples

### Test that there are exactly 3 internet gateways

    describe aws_internet_gateway do
      its('count') { should cmp 3 }
    end

### Use this InSpec resource to request the ids of all internet gateways, then test in-depth using `aws_internet_gateway`.

    aws_internet_gateways.ids.each do |id|
      describe aws_internet_gateway(id: id) do
        it { should be_attached }
      end
    end

## Matchers

For a full list of available matchers, please visit our [Universal Matchers page](/inspec/matchers/).

### exist

The control will pass if the describe returns at least one result.
The field names described in the [properties table](#properties) should be used for the `<property>` in the `where` clause.

Use `should_not` to test the entity should not exist.

    describe aws_internet_gateways.where( <property>: <value>) do
      it { should exist }
    end

    describe aws_internet_gateways.where( <property>: <value>) do
      it { should_not exist }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `ec2:DescribeInternetGateways` action set to allow.

You can find detailed documentation at [Actions, Resources, and Condition Keys for Amazon EC2](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazonec2.html), and [Actions, Resources, and Condition Keys for Identity And Access Management](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_identityandaccessmanagement.html).
