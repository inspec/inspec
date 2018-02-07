---
title: About the aws_iam_access_key Resource
---

# aws_iam_access_key

Use the `aws_iam_access_key` InSpec audit resource to test properties of a single AWS IAM access key.

<br>

## Syntax

An `aws_iam_access_key` resource block declares the tests for a single AWS IAM access key by username and id.

    describe aws_iam_access_key(username: 'username', id: 'access-key-id') do
      it { should exist }
      it { should_not be_active }
      its('create_date') { should be > Time.now - 365 * 86400 }
      its('last_used_date') { should be > Time.now - 90 * 86400 }
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that an IAM access key is not active

    describe aws_iam_access_key(username: 'username', id: 'access-key-id') do
      it { should_not be_active }
    end

### Test that an IAM access key is older than one year

    describe aws_iam_access_key(username: 'username', id: 'access-key-id') do
      its('create_date') { should be > Time.now - 365 * 86400 }
    end

### Test that an IAM access key has been used in the past 90 days

    describe aws_iam_access_key(username: 'username', id: 'access-key-id') do
      its('last_used_date') { should be > Time.now - 90 * 86400 }
    end

<br>

## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers (such as `exist`) please visit our [matchers page](https://www.inspec.io/docs/reference/matchers/).

### be_active

The `be_active` matcher tests if the described IAM access key is active.

  it { should be_active }
