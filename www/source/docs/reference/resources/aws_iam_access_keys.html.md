---
title: About the aws_iam_access_keys Resource
platform: aws
---

# aws\_iam\_access\_keys

Use the `aws_iam_access_keys` InSpec audit resource to test properties of some or all AWS IAM Access Keys.

## Syntax

An `aws_iam_access_keys` resource block returns all IAM Access Keys and allows the testing of that group of Access Keys.

      describe aws_iam_access_keys do
        it                    { should exist }
        its('access_key_ids') { should include 'AKIA1111111111111111' }
      end

#### Parameters

This resources accepts a single optional parameter, a Username for which to retrieve all Access Keys.
If not provided, all Access Keys for all Users will be retrieved.

##### username _(optional)_

The IAM Username for which to retrieve the Access Keys.
This can be passed either as a string or as a `username: 'value'` key-value entry in a hash.

See also the [AWS documentation on IAM Access Keys](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html).

## Properties

| Property               | Description|
| ---                    | --- |
| access\_key\_id        | The ID of the Access Key. |
| username               | The IAM Username which is associated with the Access Key. |
| active                 | Indicates if the status of the Key is Active.
| inactive               | Indicates if the status of the Key is Inactive.
| ever\_used             | Indicates if the Key has ever been used.
| never\_used            | Indicates if the Key has never been used.
| create\_date           | The creation date of the Access Key. |
| created\_days\_ago     | How many days ago the Access Key was created.
| created\_hours\_ago    | How many hours ago the Access Key was created.
| created\_with\_user    | Boolean indicating if the Access Key was created with a User.
| last\_used\_date       | The date the Access Key was last used.
| last\_used\_hours\_ago | How many hours ago the Key was last used.
| last\_used\_days\_ago  | How many days ago the Key was last used.
| user\_created\_date    | The date on which the associated User was created.
| entries                | Provides access to the raw results of the query, which can be treated as an array of hashes. |


## Examples

##### Test all Active keys
    describe aws_iam_access_keys.where(active: true) do
      its('access_key_ids') { should include 'AKIA1111111111111111' }
    end

##### Ensure a User has no Access Keys
    describe aws_iam_access_keys.where(username: 'untrusted-account') do
      it { should_not exist }
    end

## Matchers

For a full list of available matchers, please visit our [matchers page](https://www.inspec.io/docs/reference/matchers/).

#### exist

The control will pass if the describe returns at least one result.

Use `should_not` to test the entity should not exist.

    it { should exist }
 
    it { should_not exist }
    
## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the following permissions set to Allow: 
`iam:GetUser` 
`iam:GetAccessKeyLastUsed` 
`iam:ListUsers` 
`iam:ListAccessKeys` 
