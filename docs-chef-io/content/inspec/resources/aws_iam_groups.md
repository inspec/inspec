+++
title = "aws_iam_groups resource"
draft = false
gh_repo = "inspec"
platform = "aws"

[menu]
  [menu.inspec]
    title = "aws_iam_groups"
    identifier = "inspec/resources/aws/aws_iam_groups.md aws_iam_groups resource"
    parent = "inspec/resources/aws"
+++

Use the `aws_iam_groups` InSpec audit resource to test properties of a collection of IAM groups.

## Syntax

An `aws_iam_groups` resource block identifies a group by group name.

    describe aws_iam_groups('mygroup') do
      it { should exist }
    end

    # Hash syntax for group name
    describe aws_iam_groups(group_name: 'mygroup') do
      it { should exist }
    end

## Parameters

This resource does not expect any parameters.

See also the [AWS documentation on IAM Groups](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_groups.html).

## Properties

| Property    | Description                                                                                  |
| ----------- | -------------------------------------------------------------------------------------------- |
| group_names | The group name.                                                                              |
| group_ids   | The group ID.                                                                                |
| arns        | The Amazon Resource Name of the group.                                                       |
| users       | Array of users associated with the group.                                                    |
| entries     | Provides access to the raw results of the query, which can be treated as an array of hashes. |

## Examples

### Ensure group contains a certain user

    describe aws_iam_groups do
      it                 { should exist }
      its('group_names') { should include 'prod-access-group' }
    end

## Matchers

### exist

The control will pass if a group with the given group name exists.

    describe aws_iam_groups do
      it { should exist }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `iam:ListGroup` action with Effect set to Allow.

You can find detailed documentation at [Actions, Resources, and Condition Keys for Identity And Access Management](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_identityandaccessmanagement.html).
