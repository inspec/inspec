---
title: About the aws_security_group Resource
---

# aws_security_group

Use the `aws_security_group` InSpec audit resource to test detailed properties of an individual Security Group (SG).

SGs are a networking construct which contain ingress and egress rules for network communications.  SGs may be attached to EC2 instances, as well as certain other AWS resources.  Along with Network Access Control Lists, SGs are one of the two main mechanisms of enforcing network-level security.

<br>

## Syntax

An `aws_security_group` resource block uses resource parameters to search for a Security Group, and then tests that Security Group.  If no SGs match, no error is raised, but the `exists` matcher will return `false` and all properties will be `nil`.  If more than one SG matches (due to vague search parameters), an error is raised.

    # Ensure you have a security group with a certain ID
    # This is "safe" - SG IDs are unique within an account
    describe aws_security_group('sg-12345678') do
      it { should exist }
    end

    # Ensure you have a security group with a certain ID
    # This uses hash syntax
    describe aws_security_group(id: 'sg-12345678') do
      it { should exist }
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

As this is the initial release of `aws_security_group`, its limited functionality precludes examples.

<br>

## Resource Parameters

This InSpec resource accepts the following parameters, which are used to search for the Security Group.

### id, group_id

The Security Group ID of the Security Group.  This is of the format `sg-` followed by 8 hexadecimal characters.  The ID is unique within your AWS account; using ID ensures that you will never match more than one SG.  The ID is also the default resource parameter, so you may omit the hash syntax.

    # Using Hash syntax 
    describe aws_security_group(id: 'sg-12345678') do
      it { should exist }
    end

    # group_id is an alias for id
    describe aws_security_group(group_id: 'sg-12345678') do
      it { should exist }
    end

    # Or omit hash syntax, rely on it being the default parameter
    describe aws_security_group('sg-12345678') do
      it { should exist }
    end

### group_name

The string Name of the Security Group.  Every VPC has a security group named 'default'.  Names are unique within a VPC, but not within an AWS account.

    # Get default security group for a certain VPC
    describe aws_security_group(group_name: 'default', vpc_id: vpc_id: 'vpc-12345678') do
      it { should exist }
    end

    # This will throw an error if there is a 'backend' SG in more than one VPC.
    describe aws_security_group(group_name: 'backend') do
      it { should exist }
    end

### vpc_id

A string identifying the VPC which contains the security group.  Since VPCs commonly contain many SGs, you should add additional parameters to ensure you find exactly one SG.

    # This will error if there is more than the default SG
    describe aws_security_group(vpc_id: 'vpc-12345678') do
      it { should exist }    
    end

<br>

## Matchers

### exists

The control will pass if the specified SG was found.  Use should_not if you want to verify that the specified SG does not exist.

    # You will always have at least one SG, the VPC default SG
    describe aws_security_group(group_name: 'default')
      it { should exist }
    end   

    # Make sure we don't have any security groups with the name 'nogood'
    describe aws_security_group(group_name: 'nogood')
      it { should_not exist }
    end 

## Properties

### group_id

Provides the Security Group ID.

    # Inspect the group ID of the default group
    describe aws_security_group(group_name: 'default', vpc_id: vpc_id: 'vpc-12345678') do
      its('group_id') { should cmp 'sg-12345678' }
    end

    # Store the group ID in a Ruby variable for use elsewhere
    sg_id = aws_security_group(group_name: 'default', vpc_id: vpc_id: 'vpc-12345678').group_id

### group_name

A String reflecting the name that was given to the SG at creation time.

    # Inspect the group name of a particular group
    describe aws_security_group('sg-12345678') do
      its('group_name') { should cmp 'my_group' }
    end

### description

A String reflecting the human-meaningful description that was given to the SG at creation time.

    # Require a description of a particular group
    describe aws_security_group('sg-12345678') do
      its('description') { should_not be_empty }
    end

### vpc_id

A String in the format 'vpc-' followed by 8 hexadecimal characters reflecting VPC that contains the security group.

    # Inspec the VPC ID of a particular group
    describe aws_security_group('sg-12345678') do
      its('vpc_id') { should cmp 'vpc-12345678' }
    end