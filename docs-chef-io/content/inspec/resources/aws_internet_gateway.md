+++
title = "aws_internet_gateway resource"
draft = false
gh_repo = "inspec"
platform = "aws"

[menu]
  [menu.inspec]
    title = "aws_internet_gateway"
    identifier = "inspec/resources/aws/aws_internet_gateway"
    parent = "inspec/resources/aws"
+++

Use the `aws_internet_gateway` InSpec audit resource to test the properties of a single AWS internet gateway.

## Syntax

An `aws_internet_gateway` resource block declares the tests for a single AWS internet gateway by id or name.

    describe aws_internet_gateway(id: 'igw-abc0123456789deff') do
      it { should exist }
    end

    describe aws_internet_gateway(name: 'my-igw') do
      it { should exist }
    end

## Parameters

Either the id or the name must be provided.

### id _(required if `name` not provided)_

The value of the `internet_gateway_id` assigned by the AWS after the resource has been created.
This should be in the format of `igw-` followed by 8 or 17 hexadecimal characters and passed as an `id: 'value'` key-value entry in a hash.

### name _(required if `id` not provided)_

If a `Name` tag is applied to the internet gateway, this can be used to lookup the resource.
This must be passed as a `name: 'value'` key-value entry in a hash.
If there are multiple internet gateways with the same name, this resource will raise an error.

## Properties

| Property  | Description                                                                                   |
| --------- | --------------------------------------------------------------------------------------------- |
| id        | The ID of the internet gateway.                                                               |
| name      | The value of the `Name` tag. It is `nil` if not defined.                                      |
| vpc_id    | The ID of the attached VPC. It is `nil` if the resource is in a `detached` state.             |
| tags      | A hash, with each key-value pair corresponding to an internet gateway tag.                    |
| attached? | Indicates whether the internet gateway is **attached** to a VPC or not (`true` or `false`).   |
| detached? | Indicates whether the internet gateway is in a **detached** state or not (`true` or `false`). |
| owner_id  | The ID of the AWS account that owns the internet gateway.                                     |

There are also additional properties available. For a comprehensive list, see [the API reference documentation](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_InternetGateway.html)

## Examples

### Test that the internet gateway is attached

    describe aws_internet_gateway(name: 'my-igw') do
      it { should be_attached }
    end

### Test that the ID of the attached VPC is `vpc-1234567890abcdef1`

    describe aws_internet_gateway(id: 'igw-abc0123456789deff') do
      its('vpc_id') { should eq `vpc-1234567890abcdef1` }
    end

### Test that the internet gateway has a certain tag

    describe aws_internet_gateway(name: 'my-igw') do
      its('tags') { should include('environment' => 'dev') }
      its('tags') { should include('shutdown-at-10-pm') }    # Regardless of the value
    end

## Matchers

This InSpec audit resource has the following special matcher. For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### exist

    describe aws_internet_gateway(name: 'my-igw') do
        it { should exist }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `ec2:DescribeInternetGateways` action set to allow.

You can find detailed documentation at [Actions, Resources, and Condition Keys for Amazon EC2](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazonec2.html), and [Actions, Resources, and Condition Keys for Identity And Access Management](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_identityandaccessmanagement.html).
