+++
title = "aws_auto_scaling_groups resource"
draft = false
gh_repo = "inspec"
platform = "aws"

[menu]
  [menu.inspec]
    title = "aws_auto_scaling_groups"
    identifier = "inspec/resources/aws/aws_auto_scaling_groups.md aws_auto_scaling_groups resource"
    parent = "inspec/resources/aws"
+++

Use the `aws_auto_scaling_groups` InSpec audit resource to test the properties of a collection of AWS Auto Scaling Groups.

## Syntax

An `aws_auto_scaling_groups` resource block returns all Auto Scaling Groups and allows the testing of those ASGs.

    describe aws_auto_scaling_groups do
      its('names') { should include 'group-name' }
    end

## Parameters

This resource does not expect any parameters.

See also the [AWS documentation on Auto Scaling Group](https://docs.aws.amazon.com/autoscaling/ec2/userguide/AutoScalingGroup.html).

## Properties

| Property                   | Description                                                                                  |
| -------------------------- | -------------------------------------------------------------------------------------------- |
| min_sizes                  | An integer indicating the minimum number of instances in the auto scaling group              |
| max_sizes                  | An integer indicating the maximum number of instances in the auto scaling group              |
| desired_capacities         | An integer indicating the desired number of instances in the auto scaling group              |
| launch_configuration_names | The name of the auto scaling launch configuration associated with the auto scaling group     |
| vpc_zone_identifiers       | An array of strings corresponding to the subnet IDs associated with the auto scaling group   |
| health_check_types         | The service to use for the health checks. The valid values are EC2 and ELB.                  |
| tags                       | A hash of key-value pairs corresponding to the tags associated with the entity.              |
| entries                    | Provides access to the raw results of the query, which can be treated as an array of hashes. |

## Examples

### Ensure there are no groups with incorrect vpc_zone_identifiers.

      describe aws_auto_scaling_groups do
        it                          { should exist }
        its('vpc_zone_identifiers') { should_not include 'UNDESIRED-ZONE'}
      end

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### exist

The control will pass if the describe returns at least one result.

Use `should_not` to test the entity should not exist.

    describe aws_auto_scaling_groups.where( <property>: <value>) do
      it { should exist }
    end

    describe aws_auto_scaling_groups.where( <property>: <value>) do
      it { should_not exist }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `autoscaling:Describe*` actions with Effect set to Allow.
You can find detailed documentation at [Actions, Resources, and Condition Keys for Amazon Auto Scaling Groups](https://docs.aws.amazon.com/autoscaling/ec2/userguide/control-access-using-iam.html).
