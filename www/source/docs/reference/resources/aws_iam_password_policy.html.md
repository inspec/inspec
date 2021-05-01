---
title: About the aws_iam_password_policy Resource
platform: aws
---

# aws\_iam\_password\_policy

Use the `aws_iam_password_policy` InSpec audit resource to test properties of an AWS IAM Password Policy.

## Syntax

An `aws_iam_password_policy` resource block declares the tests for an AWS IAM Password Policy.

    describe aws_iam_password_policy do
      it { should exist }
    end
    
#### Parameters

This resource does not expect any parameters.

See also the [AWS documentation on Auto Scaling Group](https://docs.aws.amazon.com/autoscaling/ec2/userguide/AutoScalingGroup.html).

## Properties

|Property                            | Description|
| ---                                | --- |
|minimum\_password\_length           | The minimum character count of the password policy. |
|max\_password\_age\_in\_days        | Integer representing in days how long a password may last before expiring.|
|number\_of\_passwords\_to\_remember | Number of previous passwords to remember. |

## Examples

##### Test that a Password Policy meets your company's requirements.
    describe aws_iam_password_policy do
      it                             { should require_uppercase_characters }
      it                             { should require_lowercase_characters }
      it                             { should require_numbers }
      its('minimum_password_length') { should be > 8 }
    end

##### Test that users can change their own passwords 

    describe aws_iam_password_policy do
      it { should allow_users_to_change_password }
    end
    
## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers, please visit our [matchers page](https://www.inspec.io/docs/reference/matchers/).

#### exist
    it { should exist }
        
#### prevent\_password\_reuse
    it { should prevent_password_reuse }
    
#### expire\_passwords 
    it { should expire_passwords }

#### require\_numbers   
    it { should require_numbers }

#### require\_symbols
    it { should require_symbols }

#### require\_lowercase\_characters
    it { should require_lowercase_characters }

#### require\_uppercase\_characters
    it { should require_uppercase_characters}

#### allow\_users\_to\_change\_passwords
    it { should allow_users_to_change_password }
    
All matchers can use the inverse `should_not` predicate.

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the following permissions action set to allow: `iam:GetAccountPasswordPolicy`
