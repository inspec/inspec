---
title: About the aws_iam_roles Resource
platform: aws
---

# aws\_iam\_roles

Use the `aws_iam_roles` InSpec audit resource to test properties of a collection of AWS IAM Roles.

## Syntax

An `aws_iam_roles` resource block returns all IAM Roles and allows the testing of that group of Roles.

    describe aws_iam_roles do
      it { should exist }
    end

#### Parameters

This resource does not expect any parameters.

See also the [AWS documentation on IAM Roles](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html).

## Properties 
    
|Property                       | Description|
| ---                           | --- |
|paths                          | The path to the role. |
|role\_names                    | The name of the role. |
|role\_ids                      | The id of the role. |
|arns                           | The Amazon Resource Name (ARN) specifying the role. |
|create\_date                   | The date and time, in ISO 8601 date-time format , when the role was created. |
|assume\_role\_policy\_document | The policy that grants an entity permission to assume the role. |
|description                    | The description of the role. |
|max\_session\_duration         | The maximum session duration (in seconds) for the specified role. Anyone who uses the AWS CLI, or API to assume the role can specify the duration using the optional DurationSeconds API parameter or duration-seconds CLI parameter. |
|permissions\_boundary\_type    | The permissions boundary usage type that indicates what type of IAM resource is used as the permissions boundary for an entity. This data type can only have a value of Policy . |
|permissions\_boundary\_arn     | The ARN of the policy used to set the permissions boundary for the user or role. |
|entries                        | Provides access to the raw results of the query, which can be treated as an array of hashes. |


## Examples

##### Ensure the Role 'RDS-RW' exists.
      describe aws_iam_roles do
        its('role_names') { should include 'RDS-RW' }
      end
      
##### Ensure no Roles have `max_session_duration` greater or equal to 2hrs.
      describe aws_iam_roles.where{ max_session_duration >= (60*120) } do
        it { should_not exist }
      end
      
## Matchers

For a full list of available matchers, please visit our [matchers page](https://www.inspec.io/docs/reference/matchers/).

#### exist

The `exists` matcher tests if the filtered IAM User(s) exists.

      describe aws_iam_roles.where( <property>: <param>) do
        it { should exist }
      end
You may also use `it { should_not exist }`.
    
## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the following permissions set to Allow: 
`iam:ListRoles` 
