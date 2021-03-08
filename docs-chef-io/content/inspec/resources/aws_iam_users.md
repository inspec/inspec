+++
title = "aws_iam_users resource"
draft = false
gh_repo = "inspec"
platform = "aws"

[menu]
  [menu.inspec]
    title = "aws_iam_users"
    identifier = "inspec/resources/aws/aws_iam_users.md aws_iam_users resource"
    parent = "inspec/resources/aws"
+++

Use the `aws_iam_users` InSpec audit resource to test properties of some or all AWS IAM Users.

## Syntax

An `aws_iam_users` resource block returns all IAM Users and allows the testing of that group of Users.

    describe aws_iam_users do
      its('usernames') { should include 'payroll-admin' }
    end

## Parameters

This resource does not expect any parameters.

See also the [AWS documentation on IAM Users](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users.html).

## Properties

| Property                    | Description                                                                                                               |
| --------------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| usernames                   | The usernames of the returned Users.                                                                                      |
| user_arns                   | The Amazon Resource Names of the returned Users.                                                                          |
| user_ids                    | The IDs of the returned Users.                                                                                            |
| access_keys                 | Array of Access Keys belonging to each User.                                                                              |
| has_attached_policies       | Whether or not the User has IAM Policies attached.                                                                        |
| attached_policy_names       | The names (if any) of the IAM Policies attached to the User.                                                              |
| attached_policy_arns        | The Amazon Resource Names (if any) of the IAM Policies attached to the User.                                              |
| has_console_password        | Whether or not the User has a console password set.                                                                       |
| has_inline_policies         | Boolean indicating whether or not the User has policies set directly on them.                                             |
| inline_policy_names         | The names of the policies (if any) which are directly on the User.                                                        |
| has_mfa_enabled             | Boolean indicating whether the User has MFA enabled or not.                                                               |
| password_ever_used?         | Whether the user has even used their console password.                                                                    |
| password_last_used_days_ago | How long ago, in days, since the user last used their console password. Returns `-1` if the password has never been used. |
| entries                     | Provides access to the raw results of the query, which can be treated as an array of hashes.                              |

## Examples

### Ensure there are no Users who do not have MFA enabled.

    describe aws_iam_users.where( has_mfa_enabled: false) do
      it { should_not exist }
    end

### Ensure there are no Users with inline policies

    describe aws_iam_users.where(has_inline_policies: true) do
      its('usernames') { should be_empty }
    end

### Ensure there are no Users with attached policies

    describe aws_iam_users.where(has_attached_policies: true) do
      its('usernames') { should be_empty }
    end

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### exist

The control will pass if the describe returns at least one result.

Use `should_not` to test the entity should not exist.

    describe aws_iam_users.where( <property>: <value>) do
      it { should exist }
    end

    describe aws_iam_users.where( <property>: <value>) do
      it { should_not exist }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the following permissions set to Allow:
`iam:GetLoginProfile`
`iam:ListUsers`
`iam:ListMFADevices`
`iam:ListAccessKeys`
`iam:ListUserPolicies`
`iam:ListAttachedUserPolicies`
