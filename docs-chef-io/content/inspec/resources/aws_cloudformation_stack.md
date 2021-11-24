+++
title = "aws_cloudformation_stack resource"
draft = false
gh_repo = "inspec"
platform = "aws"

[menu]
  [menu.inspec]
    title = "aws_cloudformation_stack"
    identifier = "inspec/resources/aws/aws_cloudformation_stack.md aws_cloudformation_stack resource"
    parent = "inspec/resources/aws"
+++

Use the `aws_cloudformation_stack` InSpec audit resource to test properties of a single AWS Cloud Formation Stack.

## Syntax

Ensure that an `aws_cloudformation_stack` exists

    describe aws_cloudformation_stack('stack-name') do
      it { should exist }
    end

    describe aws_cloudformation_stack(stack_name: 'stack-name') do
      it { should exist }
    end

## Parameters

### stack_name _(required)_

This resource accepts a single parameter, the CloudFormation Stack name which uniquely identifies the stack.
This can be passed either as a string or as a `stack_name: 'value'` key-value entry in a hash.

See also the [AWS documentation on Cloud Formation](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/Welcome.html).

## Properties

|Property                        | Description|
| ---                            | --- |
|stack_id                       | Unique identifier of the stack. |
|stack_name                     | The name associated with the stack. |
|change_set_id                 | The unique ID of the change set. |
|description                     | A user-defined description associated with the stack. |
|parameters                      | A list of Parameter structures. |
|creation_time                  | The time at which the stack was created. |
|deletion_time                  | The time the stack was deleted. |
|last_updated_time             | The time the stack was last updated. |
|rollback_configuration         | The rollback triggers for AWS CloudFormation to monitor during stack creation and updating operations, and for the specified monitoring period afterwards. |
|stack_status                   | Current status of the stack. |
|stack_status_reason           | Success/failure message associated with the stack status. |
|drift_information              | Information on whether a stack's actual configuration differs, or has drifted, from it's expected configuration, as defined in the stack template and any values specified as template parameters. |
|disable_rollback               | Boolean to enable or disable rollback on stack creation failures: |
|notification_arns              | SNS topic ARNs to which stack related events are published. |
|timeout_in_minutes            | The amount of time within which stack creation should complete. |
|capabilities                    | The capabilities allowed in the stack. |
|outputs                         | A list of output structures. |
|role_arn                       | The Amazon Resource Name (ARN) of an AWS Identity and Access Management (IAM) role that is associated with the stack.  |
|tags                            | A list of Tags that specify information about the stack. |
|enable_termination_protection | Whether termination protection is enabled for the stack. |
|parent_id                      | For nested stacks--stacks created as resources for another stack--the stack ID of the direct parent of this stack. |
|root_id                        | For nested stacks--stacks created as resources for another stack--the stack ID of the the top-level stack to which the nested stack ultimately belongs. |


## Examples

### Test that a CloudFormation Stack has its stack_status configured correctly

    describe aws_cloudformation_stack('stack_name') do
    its ('stack_status')  { should eq 'CREATE_COMPLETE' }
    end

## Matchers

This InSpec audit resource has no special matchers. For a full list of available matchers, please visit our [Universal Matchers page](/inspec/matchers/).

### exist

The control will pass if the describe returns at least one result.

Use `should_not` to test the entity should not exist.

    describe aws_cloudformation_stack('AnExistingStack') do
      it { should exist }
    end

    describe aws_cloudformation_stack('ANonExistentStack') do
      it { should_not exist }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `cloudformation:DescribeStacks` action set to Allow.

You can find detailed documentation at [Authentication and Access Control for CloudFormation](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/Welcome.html)
