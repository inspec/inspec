# Using Chef InSpec on Cloud Platforms

As of Chef InSpec 2.0, we have expanded our platform support beyond individual machines and now include support for select AWS and Azure resources.

Using InSpec, you can use several Chef InSpec resources to audit properties of your cloud infrastructure - for example, an Amazon Web Services S3 bucket.

<br>

## AWS Platform Support in InSpec

### Setting up AWS credentials for InSpec

Chef InSpec uses the standard AWS authentication mechanisms. Typically, you will create an IAM user specifically for auditing activities.

* 1 Create an IAM user in the AWS console, with your choice of username. Check the box marked "Programmatic Access."
* 2 On the Permissions screen, choose Direct Attach. Select the AWS-managed IAM Profile named "ReadOnlyAccess." If you wish to restrict the user further, you may do so; see individual Chef InSpec resources to identify which permissions are required.
* 3 After generating the key, record the Access Key ID and Secret Key.

#### Using Environment Variables to provide credentials

You may provide the credentials to Chef InSpec by setting the following environment variables: `AWS_REGION`, `AWS_ACCESS_KEY_ID`, and `AWS_SECRET_KEY_ID`. You may also use `AWS_PROFILE`, or if you are using MFA, `AWS_SESSION_TOKEN`. See the [AWS Command Line Interface Docs](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html) for details.

Once you have your environment variables set, you can verify your credentials by running:

```bash
you$ inspec detect -t aws://

== Platform Details
Name:      aws
Families:  cloud, api
Release:   aws-sdk-v2.10.125
```

#### Using the Chef InSpec target option to provide credentials on AWS

Look for a file in your home directory named `~/.aws/credentials`. If it does not exist, create it. Choose a name for your profile; here, we're using the name 'auditing'. Add your credentials as a new profile, in INI format:

```bash
[auditing]
aws_access_key_id = AKIA....
aws_secret_access_key = 1234....abcd
```

You may now run Chef InSpec using the `--target` / `-t` option, using the format `-t aws://region/profile`.  For example, to connect to the Ohio region using a profile named 'auditing', use `-t aws://us-east-2/auditing`.

To verify your credentials,

```bash
you$ inspec detect -t aws://

== Platform Details
Name:      aws
Families:  cloud, api
Release:   aws-sdk-v2.10.125
```

<br>

## Azure Platform Support in InSpec

### Setting up Azure credentials for InSpec

To use Chef InSpec Azure resources, you will need to create a Service Principal Name (SPN) for auditing an Azure subscription.

This can be done on the command line or from the Azure Portal:

* [Azure CLI](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-authenticate-service-principal-cli)
* [PowerShell](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-authenticate-service-principal)
* [Azure Portal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal)

The information from the SPN can be specified either in the file `~/.azure/credentials`, as environment variables, or by using Chef InSpec target URIs.

#### Setting up the Azure Credentials File

By default Chef InSpec is configured to look at ~/.azure/credentials, and it should contain:

```powershell
[<SUBSCRIPTION_ID>]
client_id = "<CLIENT_ID>"
client_secret = "<CLIENT_SECRET>"
tenant_id = "<TENANT_ID>"
```

NOTE: In the Azure web portal, these values are labeled differently:
* The client_id is referred to as the 'Application ID'
* The client_secret is referred to as the 'Key (Password Type)'
* The tenant_id is referred to as the 'Directory ID'

With the credentials are in place you may now execute InSpec:

```bash
inspec exec my-inspec-profile -t azure://
```

#### Using Environment variables to provide credentials

You may also set the Azure credentials via environment variables:

* `AZURE_SUBSCRIPTION_ID`
* `AZURE_CLIENT_ID`
* `AZURE_CLIENT_SECRET`
* `AZURE_TENANT_ID`

For example:

```bash
AZURE_SUBSCRIPTION_ID="2fbdbb02-df2e-11e6-bf01-fe55135034f3" \
AZURE_CLIENT_ID="58dc4f6c-df2e-11e6-bf01-fe55135034f3" \
AZURE_CLIENT_SECRET="Jibr4iwwaaZwBb6W" \
AZURE_TENANT_ID="6ad89b58-df2e-11e6-bf01-fe55135034f3" inspec exec my-profile -t azure://
```

#### Using the Chef InSpec target option to provide credentials on Azure

If you have created a `~/.azure/credentials` file as above, you may also use the Chef InSpec command line `--target` / `-t` option to select a subscription ID.  For example:

```bash
inspec exec my-profile -t azure://2fbdbb02-df2e-11e6-bf01-fe55135034f3
```
