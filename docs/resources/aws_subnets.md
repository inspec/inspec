---
title: About the aws_subnets Resource
---

# aws_subnets

Use the `aws_subnets` InSpec audit resource to test properties of some or all subnets.

Subnets are networks within a VPC that can have their own block of IP address's and ACL's.
VPCs span across all availability zones in AWS, while a subnet in a VPC can only span a single availability zone.
Separating IP addresses allows for protection if there is a failure in one availability zone.

<br>

## Syntax

An `aws_subnets` resource block uses an optional filter to select a group of subnets and then tests that group.

    # Test all subnets within a single vpc
    describe aws_subnets.where(vpc_id: 'vpc-12345678') do
      its('subnet_ids') { should include 'subnet-12345678' }
      its('subnet_ids') { should include 'subnet-98765432' }
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

As this is the initial release of `aws_subnets`, its limited functionality precludes examples.

<br>

## Matchers

### exists

The control will pass if the filter returns at least one result. Use should_not if you expect zero matches.

    # You dont always have subnets, so you can test if there are any.
    describe aws_subnets
      it { should exist }
    end

    # Test that there are subnets in a vpc
    describe aws_subnets.where(vpc_id: 'vpc-12345678')
      it { should exist }
    end

## Filter Criteria

### vpc_id

A string identifying the VPC which may or may not contain subnets.

    # Look for all subnts within a vpc.
    describe aws_subnets.where( vpc_id: 'vpc-12345678') do
      its('subnet_ids') { should include 'subnet-12345678' }
      its('subnet_ids') { should include 'subnet-98765432' }
    end

### subnet_id

A string identifying a specific subnet.

    # Examine a specific subnet
    describe aws_subnets.where(subnet_id: 'subnet-12345678') do
      its('cidr_blocks') { should eq ['10.0.1.0/24'] }
    end


## Properties

### cidr_blocks

Provides a string that contains the cidr block of ip addresses that can be given in the subnet.

    # Examine a specific subnets cidr_blocks
    describe aws_subnets.where( subnet_id: 'subnet-12345678') do
      its('cidr_blocks') { should eq ['10.0.1.0/24'] }
    end

### vpc_ids

Provides an array containing a string of the vpc_id associated with a subnet.

    # Examine a specific subnets VPC IDS
    describe aws_subnets.where( subnet_id: 'subnet-12345678') do
      its('vpc_ids') { should include 'vpc-12345678' }
    end

### subnet_ids

Provides an array of strings containing the subnet IDs associated with a vpc.

    # Examine a specific vpcs Subnet IDs
    describe aws_subnets.where( vpc_id: 'vpc-12345678') do
      its('subnet_ids') { should include 'subnet-12345678' }
      its('subnet_ids') { should include 'subnet-98765432' }
    end
    
### states

Provides an array of strings including whether the subnets are available or not.

    # Examine a specific vpcs Subnet IDs
    describe aws_subnets.where( vpc_id: 'vpc-12345678') do
      its('states') { should_not include 'pending' }
    end
