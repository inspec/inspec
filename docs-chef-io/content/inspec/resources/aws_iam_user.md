+++
title = "aws_iam_user resource"
draft = false
gh_repo = "inspec"
platform = "aws"

[menu]
  [menu.inspec]
    title = "aws_iam_user"
    identifier = "inspec/resources/aws/aws_iam_user.md aws_iam_user resource"
    parent = "inspec/resources/aws"
+++

Use the `aws_iam_user` InSpec audit resource to test properties of a single AWS IAM User.

## Syntax

An `aws_iam_user` resource block declares the tests for a single AWS IAM User by user name.

    describe aws_iam_user(user_name: 'psmith') do
      it { should exist }
    end

## Parameters

### user_name _(required)_

This resource accepts a single parameter, the User's username which uniquely identifies the User.
This can be passed either as a string or as a `user_name: 'value'` key-value entry in a hash.

See also the [AWS documentation on IAM Users](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users.html).

## Properties

| Property              | Description                                                               |
| --------------------- | ------------------------------------------------------------------------- |
| username              | The user's username.                                                      |
| user_id               | The user's ID.                                                            |
| user_arn              | The Amazon Resource Name of the user.                                     |
| access_keys           | An array of hashes each containing metadata about the user's Access Keys. |
| inline_policy_names   | The names of policies directly attached to the user.                      |
| attached_policy_names | The name of standalone IAM policies which are attached to the user.       |
| attached_policy_arns  | The arns of the standalone IAM policies which are attached to the user.   |

- has_mfa_enabled
- has_console_password

## Examples

The following examples show how to use this InSpec audit resource.

### Test that an IAM user does not exist

    describe aws_iam_user(user_name: 'invalid-user') do
      it { should_not exist }
    end

### Test that an IAM user has MFA enabled

    describe aws_iam_user('psmith') do
      it { should exist }
      it { should have_mfa_enabled }
    end

### Ensure a User has no Access Keys or Inline Policies

    describe aws_iam_user('psmith') do
      it                         { should exist }
      its('access_keys')         { should be_empty }
      its('inline_policy_names') { should be_empty }
    end

## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### exist

The control will pass if the describe returns at least one result.

Use `should_not` to test the entity should not exist.

    it { should exist }

### has_mfa_enabled

This will check if the requested User has Multi Factor Authentication enabled.

    it { should have_mfa_enabled }

#### has_console_password

This will ensure the User has a console password set.

    it { should have_console_password }

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the following permissions action set to allow:
`iam:GetUser`
`iam:GetLoginProfile`
`iam:ListMFADevices`
`iam:ListAccessKeys`
`iam:ListUserPolicies`
`iam:ListAttachedUserPolicies`
