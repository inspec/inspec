+++
title = "Chef InSpec and AWS"
draft = false
gh_repo = "inspec"

[menu]
  [menu.inspec]
    title = "AWS"
    identifier = "inspec/cloud/aws"
    parent = "inspec/cloud"
+++

Chef InSpec has resources for auditing AWS.

## Initialize an InSpec profile for auditing AWS

With Chef InSpec 4 or greater, you can create a profile for testing AWS resources with `inspec init profile`:

```bash
$ inspec init profile --platform aws <PROFILE_NAME>
Create new profile at /Users/me/<PROFILE_NAME>
 * Creating directory libraries
 * Creating file README.md
 * Creating directory controls
 * Creating file controls/example.rb
 * Creating file inspec.yml
 * Creating file inputs.yml
 * Creating file libraries/.gitkeep
```

Assuming the `inputs.yml` file contains your AWS project ID, you can execute this sample profile using the following command:

```bash
inspec exec <PROFILE_NAME> --input-file=<PROFILE_NAME>/inputs.yml -t gcp://
```

## Set AWS credentials

Chef InSpec uses the standard AWS authentication mechanisms. Typically, you will create an IAM user specifically for auditing activities.

1. Create an IAM user in the AWS console, with your choice of username. Check the box marked "Programmatic Access."

1. On the Permissions screen, choose Direct Attach. Select the AWS-managed IAM profile named "ReadOnlyAccess." If you wish to restrict the user further, you may do so; see individual Chef InSpec resources to identify which permissions are required.

1. After generating the key, record the access key ID and secret key.

### Provide credentials with environment variables

You may provide the credentials to Chef InSpec by setting the following environment variables: `AWS_REGION`, `AWS_ACCESS_KEY_ID`, and `AWS_SECRET_ACCESS_KEY`. You may also use `AWS_PROFILE`, or if you are using MFA, `AWS_SESSION_TOKEN`. See the [AWS Command Line Interface Docs](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html) for details.

Once you have your environment variables set, you can verify your credentials by running:

```bash
$ inspec detect -t aws://

== Platform Details
Name:      aws
Families:  cloud, api
Release:   aws-sdk-v2.10.125
```

### Provide credentials using Chef InSpec target option

Look for a file in your home directory named `~/.aws/credentials`. If it does not exist, create it. Choose a name for your profile; here, we're using the name 'auditing'. Add your credentials as a new profile, in INI format:

```bash
[auditing]
aws_access_key_id = AKIA....
aws_secret_access_key = 1234....abcd
```

You may now run Chef InSpec using the `--target` / `-t` option, using the format `-t aws://region/profile`.  For example, to connect to the Ohio region using a profile named 'auditing', use `-t aws://us-east-2/auditing`.

To verify your credentials, run:

```bash
$ inspec detect -t aws://

== Platform Details
Name:      aws
Families:  cloud, api
Release:   aws-sdk-v2.10.125
```

## AWS resources

{{< inspec/inspec_resources platform="aws" >}}
