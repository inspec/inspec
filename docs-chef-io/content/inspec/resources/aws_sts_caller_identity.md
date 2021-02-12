+++
title = "aws_sts_caller_identity resource"
draft = false
gh_repo = "inspec"
platform = "aws"

[menu]
  [menu.inspec]
    title = "aws_sts_caller_identity"
    identifier = "inspec/resources/aws/aws_sts_caller_identity.md aws_sts_caller_identity resource"
    parent = "inspec/resources/aws"
+++

Use the `aws_sts_caller_identity` InSpec audit resource to test properties of AWS IAM identity whose credentials are used in the current InSpec scan.

## Syntax

An `aws_sts_caller_identity` resource block may be used to perform tests on details of the AWS credentials being used in the current Inspec scan. You can also test if the credentials belong to a GovCloud account or not.

    describe aws_sts_caller_identity do
      it { should exist }
    end

## Parameters

### name _(required)_

This resource does not expect any parameters.

## Properties

| Property | Description                 |
| -------- | --------------------------- |
| arn      | The ARN of the IAM Identity |

## Examples

### Check that the credentials used to run the scan is correct

    describe aws_sts_caller_identity do
      its("arn") { should match "arn:aws:iam::.*:user/service-account-inspec" }
    end

### Test if the account belongs to GovCloud

    describe aws_sts_caller_identity do
      it { should be_govcloud }
    end

### Skip a test if we are using GovCloud

    if aws_sts_caller_identity.govcloud?
      describe 'Skipping Root User MFA check as we are on GovCloud' do
        skip
      end
    else
      describe aws_iam_root_user do
        it { should have_mfa_enabled }
      end
    end

## Matchers

This InSpec audit resource has the following special matchers. For a full list
of available matchers, please visit our [matchers page](/inspec/matchers/).

### be_govcloud

The `be_govcloud` matcher tests if the account is a 'GovCloud' AWS Account.

    describe aws_sts_caller_identity do
        it { should_not be_govcloud }
    end
