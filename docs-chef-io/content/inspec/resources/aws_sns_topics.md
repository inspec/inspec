+++
title = "aws_sns_topics resource"
draft = false
gh_repo = "inspec"
platform = "aws"

[menu]
  [menu.inspec]
    title = "aws_sns_topics"
    identifier = "inspec/resources/aws/aws_sns_topics.md aws_sns_topics"
    parent = "inspec/resources/aws"
+++

Use the `aws_sns_topics` InSpec audit resource to test all or a group of the SNS Topic ARNs in an account.

User the 'aws_sns_topic' InSpec audit resource to test a single SNS Topic in an account.

## Syntax

    # Get all SNS Topic arns
    describe aws_sns_topics do
      its('topic_arns') { should include 'arn:aws:sns:us-east-1:333344445555:MyTopic' }
    end

## Parameters

This resource does not expect any parameters.

See also the [AWS documentation on SNS](https://docs.aws.amazon.com/sns/latest/dg/sns-getting-started.html).

## Properties

| Property   | Description                                                                                  |
| ---------- | -------------------------------------------------------------------------------------------- |
| topic_arns | The ARNs of the SNS Topics.                                                                  |
| entries    | Provides access to the raw results of the query, which can be treated as an array of hashes. |

## Examples

The following examples show how to use this InSpec audit resource.

### Ensure a Topic exists

    describe aws_sns_topics do
      its('topic_arns') { should include 'arn:aws:sns:us-east-1:333344445555:MyTopic' }
    end

## Matchers

### exist

The control will pass if the describe returns at least one result.

Use `should_not` to test the entity should not exist.

    describe aws_sns_topics do
      it { should exist }
    end

    describe aws_sns_topics do
      it { should_not exist }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `sns:ListTopics` action with Effect set to Allow.

You can find detailed documentation at [Actions, Resources, and Condition Keys for Amazon SNS](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazonsns.html).
