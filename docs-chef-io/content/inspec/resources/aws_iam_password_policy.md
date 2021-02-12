+++
title = "aws_iam_password_policy resource"
draft = false
gh_repo = "inspec"
platform = "aws"

[menu]
  [menu.inspec]
    title = "aws_iam_password_policy"
    identifier = "inspec/resources/aws/aws_iam_password_policy.md aws_iam_password_policy resource"
    parent = "inspec/resources/aws"
+++

Use the `aws_iam_password_policy` InSpec audit resource to test properties of an AWS IAM Password Policy.

## Syntax

An `aws_iam_password_policy` resource block declares the tests for an AWS IAM Password Policy.

    describe aws_iam_password_policy do
      it { should exist }
    end

## Parameters

This resource does not expect any parameters.

See also the [AWS documentation on Auto Scaling Group](https://docs.aws.amazon.com/autoscaling/ec2/userguide/AutoScalingGroup.html).

## Properties

| Property                        | Description                                                                |
| ------------------------------- | -------------------------------------------------------------------------- |
| minimum_password_length         | The minimum character count of the password policy.                        |
| max_password_age_in_days        | Integer representing in days how long a password may last before expiring. |
| number_of_passwords_to_remember | Number of previous passwords to remember.                                  |

## Examples

### Test that a Password Policy meets your company's requirements.

    describe aws_iam_password_policy do
      it                             { should require_uppercase_characters }
      it                             { should require_lowercase_characters }
      it                             { should require_numbers }
      its('minimum_password_length') { should be > 8 }
    end

### Test that users can change their own passwords

    describe aws_iam_password_policy do
      it { should allow_users_to_change_password }
    end

## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### exist

    it { should exist }

### prevent_password_reuse

    it { should prevent_password_reuse }

### expire_passwords

    it { should expire_passwords }

### require_numbers

    it { should require_numbers }

### require_symbols

    it { should require_symbols }

### require_lowercase_characters

    it { should require_lowercase_characters }

### require_uppercase_characters

    it { should require_uppercase_characters}

### allow_users_to_change_passwords

    it { should allow_users_to_change_password }

All matchers can use the inverse `should_not` predicate.

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the following permissions action set to allow: `iam:GetAccountPasswordPolicy`
