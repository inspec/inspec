# InSpec Azure Resource Pack

This resource pack provides resources for Azure Resources.  It will ship with the required resources to write your own compliance rules:

```
├── README.md - this readme
├── controls - contains example controls
└── libraries - contains Azure resources
```

## Get Started

This profile uses the Azure Ruby SDK and as such requires a Service Principal Name (SPN) to be created in the Azure subscription that is being tested.

This can be done on the command line or from the Azure Portal

- Azure CLI: https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-authenticate-service-principal-cli
- PowerShell: https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-authenticate-service-principal
- Azure Portal: https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal

The information from the SPN can be specified either in a file `~/.azure/credentials`, a different file or as environment variables.

### Credentials File

The simplest way is to create the file `~/.azure/credentials` with the following format.  The profile is configured to look for this file by default do no settings are required.

```
[<SUBSCRIPTION_ID>]
client_id = "<CLIENT_ID>"
client_secret = "<CLIENT_SECRET>"
tenant_id = "<TENANT_ID>"
```

So to run the profile now it is as simple as running:

```bash
inspec exec inspec-azure
```

A different credentials file, with the same format, can be specified as an environment variable `AZURE_CREDS_FILE`:

```bash
AZURE_CREDS_FILE="/path/to/another/file" inspec exec inspec-azure
```

Note that this file format supports multiple subscription_ids.  By default `inspec-azure` will pick the first subscription in the file.  However if another subscription should be used then specify it in the environment variable `AZURE_SUBSCRIPTION_ID`.

```bash
AZURE_SUBSCRIPTION_ID="2fbdbb02-df2e-11e6-bf01-fe55135034f3" inspec exec inspec-azure
```

### Environment variables

It is possible to not have a credentials file at all and specify all of the required information as the following environment variables:

- `AZURE_SUBSCRIPTION_ID`
- `AZURE_CLIENT_ID`
- `AZURE_CLIENT_SECRET`
- `AZURE_TENANT_ID`

For example:

```bash
AZURE_SUBSCRIPTION_ID="2fbdbb02-df2e-11e6-bf01-fe55135034f3" \
AZURE_CLIENT_ID="58dc4f6c-df2e-11e6-bf01-fe55135034f3" \
AZURE_CLIENT_SECRET="Jibr4iwwaaZwBb6W" \
AZURE_TENANT_ID="6ad89b58-df2e-11e6-bf01-fe55135034f3" inspec exec inspec-azure
```

## Use the resources

Since this is an InSpec resource pack, it only defines InSpec resources.  It includes example tests only.  To easily use the Azure InSpec resources in your tests do the following:

### Create a new profile

```bash
inspec init profile my-profile
``` 

### Adapt the `inspec.yml`

```yaml
name: my-profile
title: My own Azure profile
version: 0.1.0
depends:
  - name: azure
    url: https://github.com/chef/inspec-azure/archive/master.tar.gz
```

### Add controls

Since your profile depends on the resource pack, you can use those resources in your own profile:

```ruby
control 'azure-1' do
  impact 1.0
  title 'Checks that the machine was built from the correct image'

  describe azurevm_image(host: 'example-01', resource_group: 'MyResourceGroup') do
    its('sku') { should eq '16.04.0-LTS' }
    its('publisher') { should ieq 'Canonical' }
    its('offer') { should ieq 'UbuntuServer' }
  end
end
```

### Available Resources

- `azurevm_image` - This resource reads information about a virtual machine in the specified resource group

## License

|  |  |
| ------ | --- |
| **Author:** | Russell Seymour (<russell@chef.io>) |
| **Copyright:** | Copyright (c) 2016 Chef Software Inc. |
| **License:** | Apache License, Version 2.0 |

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.