+++
title = "aws_iam_account_alias resource"
draft = false
gh_repo = "inspec"
platform = "aws"

[menu]
  [menu.inspec]
    title = "aws_iam_account_alias"
    identifier = "inspec/resources/aws/aws_iam_account_alias.md aws_iam_account_alias resource"
    parent = "inspec/resources/aws"
+++

Use the `aws_iam_account_alias` InSpec audit resource to test properties of the AWS IAM account alias.

## Syntax

An `aws_iam_account_alias` resource block may be used to perform tests on details of the AWS account alias.

    describe aws_iam_account_alias do
      it { should exist }
    end

## Parameters

This resource does not expect any parameters.

See also the [AWS documentation on Account Aliases](https://docs.aws.amazon.com/IAM/latest/UserGuide/console_account-alias.html).

## Properties

| Property | Description                                 |
| -------- | ------------------------------------------- |
| alias    | String containing the Alias of the account. |

## Examples

### Check that the account alias has not be set

      describe aws_iam_account_alias do
        it { should_not exist }
      end

### Test if the account alias starts with expected prefix

      describe aws_iam_account_alias do
        it           { should exist }
        its('alias') { should match /^chef-/ }
      end

## Matchers

### exist

The control will pass if the describe returns at least one result.

Use `should_not` to test the entity should not exist.

    describe aws_iam_account_alias do
      it { should exist }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `iam:ListAccountAliases` action with Effect set to Allow.
