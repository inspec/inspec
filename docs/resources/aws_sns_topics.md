---
title: About the aws_sns_topics Resource
---

# aws_sns_topics
Use the `aws_sns_topics` InSpec audit resource to test the SNS Topic arns in an account.

<br>

## Syntax

An `aws_sns_topics` resource block takes no filter conditions.

    # Get all SNS Topic arns
    describe aws_sns_topics do
      its('topic_arns') { should include '' }
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

As this is the initial release of `aws_sns_topics`, its limited functionality precludes examples.

<br>

## Matchers

### exists

The control will pass if the filter returns at least one result. Use should_not if you expect zero matches.

    # Test if there is any SNS Topics
    describe aws_sns_topics
      it { should exist }
    end


## Properties

### topic_arns

Provides an array of all SNS Topic arns.

    # Test that a specific SNS Topic exists
    describe aws_sns_topics do
      its('topic_arns') { should include '' }
    end
