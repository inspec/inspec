---
title: About the aws_iam_users Resource
---

# aws_iam_users

Use the `aws_iam_users` InSpec audit resource to test properties of a all or multiple users.

To test properties of a single user, use the `aws_iam_user` resource.

To test properties of the special AWS root user (which owns the account), use the `aws_iam_root_user` resource.

<br>

## Syntax

An `aws_iam_users` resource block users a filter to select a group of users and then tests that group

    describe aws_iam_users.where(has_mfa_enabled?: false) do
      it { should_not exist }
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that all users have Multi-Factor Authentication enabled

    describe aws_iam_users.where(has_mfa_enabled?: false) do
      it { should_not exist }
    end

### Test that at least one user has a console password to log into the AWS web console

    describe aws_iam_users.where(has_console_password?: true) do
      it { should exist }
    end

### Test that all users that have a console password have Multi-Factor Authentication enabled

    console_users_without_mfa = aws_iam_users
                                .where(has_console_password?: true)
                                .where(has_mfa_enabled?: false)

    describe console_users_without_mfa do
      it { should_not exist }
    end

<br>

## Matchers

This InSpec audit resource has no specific matchers.  