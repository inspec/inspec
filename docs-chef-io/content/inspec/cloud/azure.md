+++
title = "Chef InSpec and Azure"
draft = false
gh_repo = "inspec"

[menu]
  [menu.inspec]
    title = "Azure"
    identifier = "inspec/cloud/azure"
    parent = "inspec/cloud"
+++

Chef InSpec has resources for auditing Azure.

## Initialize an InSpec profile for auditing Azure

With Chef InSpec 4 or greater, you can create a profile for testing AWS resources with `inspec init profile`:

```bash
$ inspec init profile --platform azure <PROFILE_NAME>
Create new profile at /Users/me/<PROFILE_NAME>
 * Creating directory libraries
 * Creating file README.md
 * Creating directory controls
 * Creating file controls/example.rb
 * Creating file inspec.yml
 * Creating file inputs.yml
 * Creating file libraries/.gitkeep
```

Assuming the `inputs.yml` file contains your Azure project ID, you can execute this sample profile using the following command:

```bash
inspec exec <PROFILE_NAME> --input-file=<PROFILE_NAME>/inputs.yml -t gcp://
```

## Set Azure credentials

To use Chef InSpec Azure resources, you will need to create a Service Principal Name (SPN) for auditing an Azure subscription.

This can be done on the command line or from the Azure Portal:

- [Azure CLI](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-authenticate-service-principal-cli)
- [PowerShell](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-authenticate-service-principal)
- [Azure Portal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal)

The information from the SPN can be specified either in the file `~/.azure/credentials`, as environment variables, or by using Chef InSpec target URIs.

### Set the Azure credentials file

By default, Chef InSpec is configured to look at `~/.azure/credentials`, and it should contain:

```powershell
[<SUBSCRIPTION_ID>]
client_id = "<CLIENT_ID>"
client_secret = "<CLIENT_SECRET>"
tenant_id = "<TENANT_ID>"
```

{{< note >}}

In the Azure web portal, these values are labeled differently:

- The client_id is referred to as the 'Application ID'
- The client_secret is referred to as the 'Key (Password Type)'
- The tenant_id is referred to as the 'Directory ID'

{{< /note >}}

With the credentials in place, you can now execute Chef InSpec.

```bash
inspec exec <PROFILE_NAME> -t azure://
```

### Provide credentials using environment variables

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

### Provide credentials using Chef InSpec target option

If you have created a `~/.azure/credentials` file as above, you may also use the Chef InSpec command line `--target` / `-t` option to select a subscription ID.  For example:

```bash
inspec exec my-profile -t azure://2fbdbb02-df2e-11e6-bf01-fe55135034f3
```

## Azure resources

{{< inspec/inspec_resources platform="azure" >}}
