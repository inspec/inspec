# Testing Against AWS - Integration Testing

## Problem Statement

We want to be able to test AWS-related InSpec resources against AWS itself.  This means we need to create constructs ("test fixtures") in AWS to examine using InSpec.  For cost management, we also want to be able to destroy 

## General Approach

We use Terraform to setup test fixtures in AWS, then run a defined set of InSpec controls against these (which should all pass), and finally tear down the test fixtures with Terraform.  For fixtures that cannot be managed by Terraform, we manually setup fixtures using instructions below.

We use the AWS CLI credentials system to manage credentials.


### Installing Terraform

Download [Terraform](https://www.terraform.io/downloads.html).  We require at least v0.10 . To install and choose from multiple Terraform versions, consider using [tfenv](https://github.com/kamatama41/tfenv).

### Installing AWS CLI

Install the [AWS CLI](http://docs.aws.amazon.com/cli/latest/userguide/installing.html). We will store profiles for testing in the `~/.aws/credentials` file.

## Limitations

There are some things that we can't (or very much shouldn't) do via Terraform - like manipulating the root account MFA settings.

Also, there are some singleton resources (such as the default VPC, or Config status) that we should not manipulate without consequences.

## Current Solution

Our solution is to create two AWS accounts, each dedicated to the task of integration testing inspec-aws.

In the "default" account, we setup all fixtures that can be handled by Terraform.  For any remaining fixtures,
such as enabling MFA on the root account, we manually set one value in the "default" account, and manually set the opposing value in the "minimal" account.  This allows use to perform testing on any reachable resource or property, regardless of whether or not Terraform can manage it.

All tests (and test fixtures) that do not require special handling are placed in the "default" set.  That includes both positive and negative checks.

Note that some tests will fail for the first day or two after you set up the accounts, due to the tests checking properties such as the last usage time of an access key, for example.  

Additionally, the first time you run the tests, you will need to accept the user agreement in the AWS marketplace for the linux AMIs we use.  You'll need to do it 4 times, once for each of debian and centos on the two accounts.

### Creating the Default account

Follow these instructions carefully.  Do not perform any action not specified.

1. Create an AWS account.  Make a note of the account email and root password in a secure secret storage system.
2. Create an IAM user named `test-fixture-maker`.
  * Enable programmatic access (to generate an access key)
  * Direct-attach the policy AdministratorAccess
  * Note the access key and secret key ID that are generated.
3. Using the aws command line tool, store the access key and secret key in a profile with a special name:
  `aws configure --profile inspec-aws-test-default`

#### Test Fixtures for the Default Account

1. As the root user, enable a virtual MFA device.
2. Create an IAM user named 'test-user-last-key-use'.
  * Enable programmatic access (to generate an access key)
  * Note the access key and secret key ID that are generated.
  * Direct-attach the policy AmazonEC2ReadOnlyAccess
  * Using the AWS CLI and the credentials, execute the command `aws ec2 describe-instances`.
  * The goal here is to have an access key that was used at one point.

### Creating the Minimal Account

Follow these instructions carefully.  Do not perform any action not specified.

1. Create an AWS account.  Make a note of the account email and root password in a secure secret storage system.
2. Create an IAM user named `test-fixture-maker`.
  * Enable programmatic access (to generate an access key)
  * Direct-attach the policy AdministratorAccess
  * Note the access key and secret key ID that are generated.
3. Using the aws command line tool, store the access key and secret key in a profile with a special name:
  `aws configure --profile inspec-aws-test-minimal`

#### Test Fixtures for the Minimal Account

1. Create an Access Key for the root user.  You do not have to save the access key.

## Running the integration tests

To run all AWS integration tests, run:

 ```
 bundle exec rake test:aws
 ```

To run the tests against one account only:

 ```
 bundle exec rake test:aws:default
 ```

 or

 ```
 bundle exec rake test:aws:minimal
 ```
 
Each account has separate tasks for setup, running the tests, and cleanup.  You may run them separately:

```
bundle exec rake test:aws:setup:default
bundle exec rake test:aws:run:default
bundle exec rake test:aws:cleanup:default
```



