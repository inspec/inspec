---
title: About the aws_iam_policy Resource
---

# aws_iam_policy

Use the `aws_iam_policy` InSpec audit resource to test properties of a single managed AWS IAM Policy.

A policy is an entity in AWS that, when attached to an identity or resource, defines their permissions. AWS evaluates these policies when a principal, such as a user, makes a request. Permissions in the policies determine whether the request is allowed or denied. 

Each IAM Policy is uniquely identified by either its policy_name or arn.

<br>

## Syntax

An `aws_iam_policy` resource block identifies a policy by policy name.

    # Find a policy by name
    describe aws_iam_policy('AWSSupportAccess') do
      it { should exist }
    end

    # Find a customer-managed by name
    describe aws_iam_policy('customer-managed-policy') do
      it { should exist }
    end

    # Hash syntax for policy name
    describe aws_iam_policy(policy_name: 'AWSSupportAccess') do
      it { should exist }
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that a policy does exist

    describe aws_iam_policy('AWSSupportAccess') do
      it { should exist }
    end

### Test that a policy is attached to at least one entity

    describe aws_iam_policy('AWSSupportAccess') do
      it { should be_attached }
    end

<br>

## Properties

### arn

"The ARN identifier of the specified policy. An ARN uniquely identifies the policy within AWS."

    describe aws_iam_policy('AWSSupportAccess') do
      its('arn') { should cmp "arn:aws:iam::aws:policy/AWSSupportAccess" }
    end

### default_version_id

The default_version_id value of the specified policy.

    describe aws_iam_policy('AWSSupportAccess') do
      its('default_version_id') { should cmp "v1" }
    end

### attachment_count

The count of attached entities for the specified policy.

    describe aws_iam_policy('AWSSupportAccess') do
      its('attachment_count') { should cmp 1 }
    end

### attached_users

The list of usernames of the users attached to the policy.

    describe aws_iam_policy('AWSSupportAccess') do
      its('attached_users') { should include "test-user" }
    end

### attached_groups

The list of groupnames of the groups attached to the policy.

    describe aws_iam_policy('AWSSupportAccess') do
      its('attached_groups') { should include "test-group" }
    end

### attached_roles

The list of rolenames of the roles attached to the policy.

    describe aws_iam_policy('AWSSupportAccess') do
      its('attached_roles') { should include "test-role" }
    end

## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers (such as `exist`) please visit our [matchers page](https://www.inspec.io/docs/reference/matchers/).

### be_attached

The test will pass if the identified policy is attached to at least one IAM user, group, or role.

    describe aws_iam_policy('AWSSupportAccess') do
      it { should be_attached }
    end

### be_attached_to_user(USERNAME)

The test will pass if the identified policy attached the specified user.

    describe aws_iam_policy('AWSSupportAccess') do
      it { should be_attached_to_user(USERNAME) }
    end

### be_attached_to_role(ROLENAME)

The test will pass if the identified policy attached the specified role.

    describe aws_iam_policy('AWSSupportAccess') do
      it { should be_attached_to_role(ROLENAME) }
    end


### be_attached_to_group(GROUPNAME)

The test will pass if the identified policy attached the specified group.

    describe aws_iam_policy('AWSSupportAccess') do
      it { should be_attached_to_group(GROUPNAME) }
    end
