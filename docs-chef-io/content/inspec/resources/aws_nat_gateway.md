+++
title = "aws_nat_gateway resource"
draft = false
gh_repo = "inspec"
platform = "aws"

[menu]
  [menu.inspec]
    title = "aws_nat_gateway"
    identifier = "inspec/resources/aws/aws_nat_gateway.md aws_nat_gateway"
    parent = "inspec/resources/aws"
+++

Use the `aws_nat_gateway` InSpec audit resource to test the properties of a single AWS NAT gateway.

## Syntax

An `aws_nat_gateway` resource block declares the tests for a single AWS NAT gateway by id, name, vpc_id or subnet_id.

    describe aws_nat_gateway(id: 'nat-abc0123456789deff') do
      it { should exist }
    end

    describe aws_nat_gateway(name: 'my-nat-gateway') do
      it { should exist }
    end

Multiple parameters can be provided for better granularity.

    describe aws_nat_gateway(vpc_id: 'vpc-abc01234', subnet_id: 'subnet-6789deff') do
      it { should exist }
    end

## Parameters

At least one of the following parameters must be provided.

- id
- name
- subnet_id
- vpc_id

### id

The value of the `nat_gateway_id` assigned by the AWS after the resource has been created.
This should be in the format of `nat-` followed by 8 or 17 hexadecimal characters and passed as an `id: 'value'` key-value entry in a hash.

### name

If a `Name` tag is applied to the NAT gateway, this can be used to lookup the resource.
This must be passed as a `name: 'value'` key-value entry in a hash.
If there are multiple NAT gateways with the same name, this resource will raise an error.

### subnet_id

The ID of the subnet in which the NAT gateway is placed.
This should be in the format of `subnet-` followed by 8 or 17 hexadecimal characters and passed as an `subnet_id: 'value'` key-value entry in a hash.

### vpc_id

The ID of the VPC in which the NAT gateway is located.
This should be in the format of `vpc-` followed by 8 or 17 hexadecimal characters and passed as an `vpc_id: 'value'` key-value entry in a hash.

## Properties

| Property                | Description                                                                                                                                                                                                                  |
| ----------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| id                      | The ID of the NAT gateway.                                                                                                                                                                                                   |
| name                    | The value of the `Name` tag. It is `nil` if not defined.                                                                                                                                                                     |
| vpc_id                  | The ID of the VPC in which the NAT gateway is located.                                                                                                                                                                       |
| subnet_id               | The ID of the subnet in which the NAT gateway is placed.                                                                                                                                                                     |
| tags                    | A hash, with each key-value pair corresponding to a NAT gateway tag.                                                                                                                                                         |
| nat_gateway_address_set | A hash of [NatGatewayAddress object](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_NatGatewayAddress.html) that gives information about the IP addresses and network interface associated with the NAT gateway. |
| state                   | The sate of the NAT gateway. Valid values are: `pending`, `failed`, `available`, `deleting` and `deleted`.                                                                                                                   |

There are also additional properties available. For a comprehensive list, see [the API reference documentation](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_NatGateway.html)

## Examples

### Test that the NAT gateway is in `available` state

    describe aws_nat_gateway(name: 'my-nat-gateway') do
      its('state') { should eq 'available' }
    end

### Test that the ID of the VPC is `vpc-1234567890abcdef1`

    describe aws_nat_gateway(id: 'nat-abc0123456789deff') do
      its('vpc_id') { should eq `vpc-1234567890abcdef1` }
    end

### Test that the NAT gateway has a certain tag

    describe aws_nat_gateway(name: 'my-nat-gateway') do
      its('tags') { should include('environment' => 'dev') }
      its('tags') { should include('delete-at-10-pm') }         # Regardless of the value
    end

### Test that the private IP address is `10.0.1.68`

    describe aws_nat_gateway(vpc_id: 'vpc-abc01234', subnet_id: 'subnet-12345678') do
      its('nat_gateway_address_set') { should include(:private_ip => '10.0.1.68') }
    end

For more examples, please check the [integration tests](https://github.com/inspec/inspec-aws/blob/master/test/integration/verify/controls/aws_nat_gateway.rb).

## Matchers

This InSpec audit resource has the following special matcher. For a full list of
available matchers, please visit our [matchers page](/inspec/matchers/).

### exist

    describe aws_nat_gateway(name: 'my-nat-gateway') do
        it { should exist }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `ec2:DescribeNatGateways` action set to allow.

You can find detailed documentation at [Actions, Resources, and Condition Keys for Amazon EC2](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazonec2.html), and [Actions, Resources, and Condition Keys for Identity And Access Management](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_identityandaccessmanagement.html).
