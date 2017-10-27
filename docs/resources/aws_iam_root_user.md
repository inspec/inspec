---
title: About the aws_iam_root_user Resource
---

# aws_iam_root_user

Use the `aws_iam_root_user` InSpec audit resource to test properties of the root user (owner of the account).

To test properties of all or multiple users, use the `aws_iam_users` resource.

To test properties of a specific AWS user use the `aws_iam_user` resource.

<br>

## Syntax

An `aws_iam_root_user` resource block requires no parameters but has several matchers

    describe aws_iam_root_user do
      its { should have_mfa_enabled }
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that the AWS root account has only one access key

    describe aws_iam_root_user do
      its('access_key_count') { should eq 1 }
    end

### Test that the AWS root account has Multi-Factor Authentication enabled

    describe aws_iam_root_user do
      it { should have_mfa_enabled }
    end

<br>

## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers (such as `exist`) please visit our [matchers page](https://www.inspec.io/docs/reference/matchers/).

### have_mfa_enabled

The `have_mfa_enabled` matcher tests if the AWS root user has Multi-Factor Authentication enabled, requiring them to enter a secondary code when they login to the web console.

    it { should have_mfa_enabled }
