---
title: About the aws_iam_password_policy Resource
platform: aws
---

# aws_iam_password_policy

Use the `aws_iam_password_policy` InSpec audit resource to test properties of the AWS IAM Password Policy.

<br>

## Syntax

An `aws_iam_password_policy` resource block takes no parameters, but uses several matchers.

    describe aws_iam_password_policy do
      its('requires_lowercase_characters?') { should be true }
    end

<br>

## Properties

* `allows_users_to_change_password?`, `expires_passwords`, `max_password_age`,  `minimum_password_length`, `number_of_passwords_to_remember`, `prevents_password_reuse?`, `requires_lowercase_characters` , `requires_uppercase_characters?`, `requires_numbers?`, `requires_symbols?`

## Examples

The following examples show how to use this InSpec audit resource.

### Test that the IAM Password Policy requires lowercase characters, uppercase characters, numbers, symbols, and a minimum length greater than eight

    describe aws_iam_password_policy do
      its('requires_lowercase_characters?') { should be true }
      its('requires_uppercase_characters?') { should be true }
      its('requires_numbers?') { should be true }
      its('requires_symbols?') { should be true }
      its('minimum_password_length') { should be > 8 }
    end

### Test that the IAM Password Policy allows users to change their password

    describe aws_iam_password_policy do
      its('allows_user_to_change_password?') { should be true }
    end

### Test that the IAM Password Policy expires passwords

    describe aws_iam_password_policy do
      its('expires_passwords?') { should be true }
    end

### Test that the IAM Password Policy has a max password age

    describe aws_iam_password_policy do
      its('max_password_age') { should be > 90 * 86400 }
    end

### Test that the IAM Password Policy prevents password reuse

    describe aws_iam_password_policy do
      its('prevents_password_reuse?') { should be true }
    end

### Test that the IAM Password Policy requires users to remember 3 previous passwords

    describe aws_iam_password_policy do
      its('number_of_passwords_to_remember') { should eq 3 }
    end

<br>

## Matchers

For a full list of available matchers please visit our [matchers page](https://www.inspec.io/docs/reference/matchers/).
