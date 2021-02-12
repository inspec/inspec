+++
title = "aws_iam_access_key resource"
draft = false
gh_repo = "inspec"
platform = "aws"

[menu]
  [menu.inspec]
    title = "aws_iam_access_key"
    identifier = "inspec/resources/aws/aws_iam_access_key.md aws_iam_access_key resource"
    parent = "inspec/resources/aws"
+++

Use the `aws_iam_access_key` InSpec audit resource to test properties of a single AWS IAM Access Key.

## Syntax

An `aws_iam_access_key` resource allows the testing of a single AWS IAM Access Key.

    describe aws_iam_access_key(access_key_id: 'AKIA1111111111111111') do
      it { should exist }
    end

## Parameters

This resources requires either an `access_key_id` or the IAM `username` associated with the Access Key.

### access_key_id _(required if `username` not provided.)_

The Access Key ID which uniquely identifies the Key. Begins with the characters "AKIA".
This can be passed either as a string or as a `access_key_id: 'value'` key-value entry in a hash.

### username _(required if `access_key\_id` not provided.)_

The IAM Username which is associated with the Access Key.
This can be passed either as a string or as a `username: 'value'` key-value entry in a hash.

See also the [AWS documentation on IAM Access Keys](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html).

## Properties

| Property      | Description                                               |
| ------------- | --------------------------------------------------------- |
| access_key_id | The ID of the Access Key.                                 |
| username      | The IAM Username which is associated with the Access Key. |
| status        | The status of the Access Key, e.g. "Active".              |
| create_date   | The creation date of the Access Key.                      |

## Examples

The following examples show how to use this InSpec audit resource.

### Test that an IAM Access Key has been used in the last 90 days

    describe aws_iam_access_key(access_key_id: 'AKIA1111111111111111') do
      it                    { should exist }
      its('last_used_date') { should be > Time.now - 90 * 86400 }
    end

### Test that an IAM Access Key for a specific user exists

      describe aws_iam_access_key(username: 'psmith', id: 'AKIA1111111111111111') do
        it { should exist }
      end

## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### exist

The control will pass if the describe returns at least one result.

Use `should_not` to test the entity should not exist.

    it { should exist }

    it { should_not exist }

### active

The `active` matcher tests if the described IAM Access Key has a status of Active.

    it { should be_active }

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the following permissions action set to allow:
`iam:ListAccessKeys`
`iam:GetAccessKeyLastUsed`
