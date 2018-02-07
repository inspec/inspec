---
title: About the aws_vpc_subnet Resource
---

# aws_vpc_subnet

Use the `aws_vpc_subnet` InSpec audit resource to test properties of a vpc subnet.

To test properties of a single VPC subnet, use the `aws_vpc_subnet` resource.

To test properties of all or a group of VPC subnets, use the `aws_vpc_subnets` resource.

<br>

## Syntax

An `aws_vpc_subnet` resource block uses the parameter to select a VPC and a subnet in the VPC.

    describe aws_vpc_subnet(vpc_id: 'vpc-01234567', subnet_id: 'subnet-1234567') do
      it { should exist }
      its('cidr_block') { should eq ['10.0.1.0/24'] }
    end

<br>

## Resource Parameters

This InSpec resource accepts the following parameters, which are used to search for the VPCs subnet.

### vpc_id

A string identifying the VPC which contains zero or more subnets.

    # This will error if there is more than the default SG
    describe aws_vpc_subnet(vpc_id: 'vpc-12345678', 'subnet-1234567') do
      it { should exist }    
    end

### subnet_id

A string identifying the subnet that the VPC contains.

    # This will error if there is more than the default SG
    describe aws_vpc_subnet(vpc_id: 'vpc-12345678', subnet_id: 'subnet-12345678') do
      it { should exist }    
    end

<br>

## Properties

### assign_ipv_6_address_on_creation

Detects whether the network interface on the subnet accepts IPv6 addresses.

    describe aws_vpc_subnet(vpc_id: 'vpc-12345678' , subnet_id: 'subnet-12345678') do
      its('assign_ipv_6_address_on_creation') { should eq false }    
    end

### availability_zone

Provides the Availability Zone of the subnet.

    describe aws_vpc_subnet(vpc_id: 'vpc-12345678' , subnet_id: 'subnet-12345678') do
      its('availability_zone') { should eq 'us-east-1c' }    
    end

### available_ip_address_count

Provides the number of available IPv4 addresses on the subnet.

    describe aws_vpc_subnet(vpc_id: 'vpc-12345678' , subnet_id: 'subnet-12345678') do
      its('available_ip_address_count') { should eq 251 }    
    end

### cidr_block

Provides the block of ip addresses specified to the subnet.

    describe aws_vpc_subnet(vpc_id: 'vpc-12345678' , subnet_id: 'subnet-12345678') do
      its('cidr_block') { should eq '10.0.1.0/24' }    
    end

### default_for_az

Detects if this is the default subnet for the Availability Zone.

    describe aws_vpc_subnet(vpc_id: 'vpc-12345678' , subnet_id: 'subnet-12345678') do
      its('default_for_az') { should eq false }    
    end

### ipv_6_cidr_block_association_set

Provides information about the IPv6 cidr_block associatied with the subnet.

    describe aws_vpc_subnet(vpc_id: 'vpc-12345678' , subnet_id: 'subnet-12345678') do
      its('ipv_6_cidr_block_association_set') { should eq [
              {
                  "Ipv6CidrBlock": "2001:db8:1234:a101::/64",
                  "AssociationId": "subnet-cidr-assoc-30e7e348",
                  "Ipv6CidrBlockState": {
                      "State": "ASSOCIATED"
                  }
              }
          ] }    
    end

### map_public_ip_on_launch

Provides the ID of the VPC the subnet is in.

    describe aws_vpc_subnet(vpc_id: 'vpc-12345678' , subnet_id: 'subnet-12345678') do
      its('map_public_ip_on_launch') { should eq false }    
    end

### state

Provides the ID of the VPC the subnet is in.

    describe aws_vpc_subnet(vpc_id: 'vpc-12345678' , subnet_id: 'subnet-12345678') do
      its('state') { should eq 'available' }    
    end

### subnet_id

Provides the ID of the VPC the subnet is in.

    describe aws_vpc_subnet(vpc_id: 'vpc-12345678' , subnet_id: 'subnet-12345678') do
      its('subnet_id') { should eq 'subnet-12345678' }    
    end

### vpc_id

Provides the ID of the VPC the subnet is in.

    describe aws_vpc_subnet(vpc_id: 'vpc-12345678' , subnet_id: 'subnet-12345678') do
      its('vpc_id') { should eq 'vpc-12345678' }    
    end

## Matchers

### exist

The `exist` matcher indicates that a subnet exists for the specified vpc.

    describe aws_vpc_subnet(vpc_id: 'vpc-1234567', subnet_id: 'subnet-12345678') do
      it { should exist }
    end
