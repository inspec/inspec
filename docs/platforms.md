# Using InSpec 2.0 with Platforms

New in InSpec 2.0, you may now use certain InSpec resources to audit properties of things that aren't individual machines - for example, an Amazon Web Services S3 bucket.

In the initial release of InSpec 2.0, support for selected AWS and Azure resources is included.

## AWS Platform Support

### Setting up AWS credentials for InSpec

InSpec uses the standard AWS authentication mechanisms.  Typically, you will create an IAM user which will be used for auditing activities.

1. Create an IAM user in the AWS console, with your choice of username.  Check the box marked "Programmatic Access."
2. On the Permissions screen, choose Direct Attach.  Select the AWS-managed IAM Profile named "ReadOnlyAccess."  If you wish to restrict the user further, you may do so; see individual InSpec resources to identify which permissions are required.
3. After the key is generated, record the Access Key ID and Secret Key.

#### Using Environment Variables to provide credentials

You may provide the credentials to InSpec by setting the following environment variables: `AWS_REGION`, `AWS_ACCESS_KEY_ID`, and `AWS_SECRET_KEY_ID`.  You may also use `AWS_PROFILE`, or if you are using MFA, `AWS_SESSION_TOKEN`.  See the [AWS Command Line Interface Docs](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html) for details.

Once you have your environment variables set, you can verify your credentials by running:

```bash
you$ inspec detect -t aws:// 

== Platform Details
Name:         aws
Families:     cloud, api
```

#### Using the InSpec target option to provide credentials

Look for a file in your home directory named `~/.aws/credentials`.  If it does not exist, create it.  Choose a name for your profile; here, we're using the name 'auditing'.  Add your credentials as a new profile, in INI format:

```
[auditing]
aws_access_key_id = AKIA....
aws_secret_access_key = 1234....abcd
```

You may now run InSpec using the `--target` / `-t` option, using the format `-t aws://region/profile`.  For example, to connect to the Ohio region using a profile named 'auditing', use `-t aws://us-east-2/auditing`.

To verify your credentials, 
```bash
you$ inspec detect -t aws:// 

== Platform Details
Name:         aws
Families:     cloud, api
```

#### Verifying your credentials

To verify your credentials

## Azure Platform Support in InSpec 2.0

### Setting up Azure credentials for InSpec

To use InSpec Azure resources, you will need a Service Principal Name (SPN) to be created in the Azure subscription that is being audited.

This can be done on the command line or from the Azure Portal:

- Azure CLI: https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-authenticate-service-principal-cli
- PowerShell: https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-authenticate-service-principal
- Azure Portal: https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal


The information from the SPN can be specified either in a file `~/.azure/credentials`, as environment variables, or using InSpec target URIs.

#### Using the Azure Credentials File

By default InSpec is configured to look at ~/.azure/credentials, and it should contain:

```
[<SUBSCRIPTION_ID>]
client_id = "<CLIENT_ID>"
client_secret = "<CLIENT_SECRET>"
tenant_id = "<TENANT_ID>"
```

    NOTE: In the Azure web portal, these values are labelled differently:
    * The client_id is referred to as the 'Application ID'
    * The client_secret is referred to as the 'Key (Password Type)'
    * The tenant_id is referred to as the 'Directory ID'
    
With the credentials are in place you may now execute InSpec:

```bash
inspec exec my-inspec-profile -t azure://
```

#### Using Environment variables

You may also set the Azure credentials via environment variables:

- `AZURE_SUBSCRIPTION_ID`
- `AZURE_CLIENT_ID`
- `AZURE_CLIENT_SECRET`
- `AZURE_TENANT_ID`

For example:

```bash
AZURE_SUBSCRIPTION_ID="2fbdbb02-df2e-11e6-bf01-fe55135034f3" \
AZURE_CLIENT_ID="58dc4f6c-df2e-11e6-bf01-fe55135034f3" \
AZURE_CLIENT_SECRET="Jibr4iwwaaZwBb6W" \
AZURE_TENANT_ID="6ad89b58-df2e-11e6-bf01-fe55135034f3" inspec exec my-profile -t azure://
```

#### Using InSpec Target Syntax

If you have created a `~/.azure/credentials` file as above, you may also use the InSpec command line `--target` / `-t` option to select a subscription ID.  For example:

```bash
inspec exec my-profile -t azure://2fbdbb02-df2e-11e6-bf01-fe55135034f3
```
