---
title: About the aws_security_groups Resource
---

# aws_security_groups

Use the `aws_security_groups` InSpec audit resource to test properties of some or all security groups.

Security groups are a networking construct which contain ingress and egress rules for network communications.  Security groups may be attached to EC2 instances, as well as certain other AWS resources.  Along with Network Access Control Lists, Security Groups are one of the two main mechanisms of enforcing network-level security.

<br>

## Syntax

An `aws_security_groups` resource block uses an optional filter to select a group of security groups and then tests that group.

    # Verify you have more than the default security group
    describe aws_security_groups do
      its('entries.count') { should be > 1 }
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

As this is the initial release of `aws_security_groups`, its limited functionality precludes examples.

<br>

## Matchers

### exists

The control will pass if the filter returns at least one result. Use should_not if you expect zero matches.

    # You will always have at least one SG, the VPC default SG
    describe aws_security_groups
      it { should exist }
    end   

## Filter Criteria

### vpc_id

A string identifying the VPC which contains the security group.

    # Look for a particular security group in just one VPC
    describe aws_security_groups.where( vpc_id: 'vpc-12345678') do
      its('group_ids') { should include('sg-abcdef12')}
    end

### group_name

A string identifying a group.  Since groups are contained in VPCs, group names are unique within the AWS account, but not across VPCs.

    # Examine the default security group in all VPCs
    describe aws_security_groups.where( group_name: 'default') do
      it { should exist }
    end


## Properties

### group_ids

Provides a list of all security group IDs matched.

    describe aws_security_groups do
      its('group_ids') { should include('sg-12345678') }
    end

### entries

Provides access to the raw results of the query.  This can be useful for checking counts and other advanced operations.

    # Allow at most 100 security groups on the account
    describe aws_security_groups do
      its('entries.count') { should be <= 100}
    end
