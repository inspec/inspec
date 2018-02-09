---
title: About the aws_subnet Resource
---

# aws_subnet

Use the `aws_subnet` InSpec audit resource to test properties of a vpc subnet.

To test properties of a single VPC subnet, use the `aws_subnet` resource.

To test properties of all or a group of VPC subnets, use the `aws_subnets` resource.

<br>

## Syntax

An `aws_subnet` resource block uses the parameter to select a VPC and a subnet in the VPC.

    describe aws_subnet(subnet_id: 'subnet-1234567') do
      it { should exist }
      its('cidr_block') { should eq '10.0.1.0/24' }
    end

<br>

## Resource Parameters

This InSpec resource accepts the following parameters, which are used to search for the VPCs subnet.

### subnet_id

A string identifying the subnet that the VPC contains.

    # This will error if there is more than the default SG
    describe aws_subnet(subnet_id: 'subnet-12345678') do
      it { should exist }    
    end

<br>

## Matchers

### assigning_ipv_6_address_on_creation

Detects whether the network interface on the subnet accepts IPv6 addresses.

    describe aws_subnet(subnet_id: 'subnet-12345678') do
      it { should be_assigning_ipv_6_address_on_creation }    
    end
    
### available

Provides the current state of the subnet.

    describe aws_subnet(subnet_id: 'subnet-12345678') do
      it { should be_available }    
    end

### default_for_az

Detects if this is the default subnet for the Availability Zone.

    describe aws_subnet(subnet_id: 'subnet-12345678') do
      it { should be_default_for_az }    
    end

### exist

The `exist` matcher indicates that a subnet exists for the specified vpc.

    describe aws_subnet(subnet_id: 'subnet-12345678') do
      it { should exist }
    end
    
### mapping_public_ip_on_launch

Provides the ID of the VPC the subnet is in.

    describe aws_subnet(subnet_id: 'subnet-12345678') do
      it { should be_mapping_public_ip_on_launch }    
    end

## Properties

### availability_zone

Provides the Availability Zone of the subnet.

    describe aws_subnet(subnet_id: 'subnet-12345678') do
      its('availability_zone') { should eq 'us-east-1c' }    
    end

### available_ip_address_count

Provides the number of available IPv4 addresses on the subnet.

    describe aws_subnet(subnet_id: 'subnet-12345678') do
      its('available_ip_address_count') { should eq 251 }    
    end

### cidr_block

Provides the block of ip addresses specified to the subnet.

    describe aws_subnet(subnet_id: 'subnet-12345678') do
      its('cidr_block') { should eq '10.0.1.0/24' }    
    end

### subnet_id

Provides the ID of the Subnet.

    describe aws_subnet(subnet_id: 'subnet-12345678') do
      its('subnet_id') { should eq 'subnet-12345678' }    
    end

### vpc_id

Provides the ID of the VPC the subnet is in.

    describe aws_subnet(subnet_id: 'subnet-12345678') do
      its('vpc_id') { should eq 'vpc-12345678' }    
    end
