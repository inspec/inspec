# InSpec Azure Resource Pack

This resource pack provides resources for Azure Resources. It will ship with the required resources to write your own compliance rules:

```
├── README.md - this readme
└── libraries - contains Azure resources
└── test - contains integration tests
```

## Get Started

This profile uses the Azure Ruby SDK and as such requires a Service Principal Name (SPN) to be created in the Azure subscription that is being tested.

This can be done on the command line or from the Azure Portal

- Azure CLI: https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-authenticate-service-principal-cli
- PowerShell: https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-authenticate-service-principal
- Azure Portal: https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal

The information from the SPN can be specified either in a file `~/.azure/credentials`, a different file or as environment variables.

### Credentials File

The simplest way is to create the file `~/.azure/credentials` with the following format. The profile is configured to look for this file by default do no settings are required.

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

Note that this file format supports multiple subscription_ids. By default `inspec-azure` will pick the first subscription in the file. However if another subscription should be used then specify it in the environment variable `AZURE_SUBSCRIPTION_ID`.

```bash
AZURE_SUBSCRIPTION_ID="2fbdbb02-df2e-11e6-bf01-fe55135034f3" inspec exec inspec-azure
```

Alternatively, if you know that the subscription you want to use is the second one in you credentials file then you can use the following:

```bash
AZURE_SUBSCRIPTION_NUMBER=2 inspec exec inspec-azure
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

Since this is an InSpec resource pack, it only defines InSpec resources. It includes example tests only. To easily use the Azure InSpec resources in your tests do the following:

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

  describe azure_virtual_machine(name: 'example-01', resource_group: 'MyResourceGroup') do
    its('sku') { should eq '16.04.0-LTS' }
    its('publisher') { should ieq 'Canonical' }
    its('offer') { should ieq 'UbuntuServer' }
  end
end
```

### Available Resources

- `azure_resource_group` - This resource reads information about the resources in the specified resource group

| Resource Name | Resources | Description |
|---------------|-----------|-------------|
| azure_rg | location | Where the item has been deployed |
| | total | The total number of resources in the resource group |
| | nic_count | Helper method to return the number of Network Interface Cards (NIC) that exist |
| | vm_count | Helper method to return the number of Virtual Machines(VM) that exist | 
| | vnet_count | Helper method to return the number of Virtual Networks (VNET) that exist |
| | nsg_count | Helper method to return the number of Network Security Groups (NSG) that exist |
| | sa_count | Helper method to return the number of Storage Accounts (SA) that exist |
| | public_ip_count | Helper method to return the number of Public IP Addresses that exist |
| | managed_disk_image_count | Helper method to return the number of Managed Disk Images that exist |
| | managed_disk_count | Helper method to return the number of Managed Disks that exist |
| | contains | Used to determine if a specific item exists |

This resource also has a FilterTable which means that it is possible to check for items that do not yet have a helper method.

#### Test for the number of storage accounts

```ruby
control 'azure-1' do
  impact 1.0
  title 'Checks that there is only one storage account in the resource group'

  describe azure_resource_group(name: 'MyResourceGroup').where { type == 'Microsoft.Storage/storageAccounts' }.entries do
    its('count') { should eq 1 }
  end
end
```

#### Ensure that a specific item exists

```ruby
control 'azure-1' do
  impact 1.0
  title 'Checks a resource with the name "example-VM" exists'

  describe azure_resource_group(name: 'MyResourceGroup').contains(parameter: 'name', value: 'example-VM') do
    it { should be true }
  end
end
```

- `azure_vm` - This resource reads information about a virtual machine in the specified resource group

| Resource Name | Resources | Description |
|---------------|-----------|-------------|
| azure_vm | publisher | Publisher that provided the image in the marketplace |
| | offer | The offer of the image |
| | sku | The SKU being used |
| | size | The size of the machine |
| | location | Where the machine has been deployed |
| | has_boot_diagnostics? | Whether boot diagnostics have been enabled or not |
| | nic_count | How many network cards are attached to the machine |
| | admin_username | The admin username that has been assigned to the machine |
| | computername | Computer name of the machine in the operating system. This maybe different to the VM name as seen in Azure |
| | hostname | Alias for computername |
| | password_authentication? | If password authentication is enabled. For Windows machines this is always true |
| | ssh_key_count | How many SSH public keys have been added to the machine. For Windows this is always 0 |
| | os_type | The type of operating system. Linux or Windows |
| | private_ipaddresses | Returns an array of all the IP addresses for all the NICs on the machine |
| | has_public_ipaddress? | Whether the machine has been allocated an IP address or not |
| | domain_name_label | If the machine has a public IP address then return the domain name label it has been assigned |

For the resources that start with `has_` the following construct can be used

```ruby
it { should have_boot_diagnostics }
```

- `azure_vm_datadisks` - Resource to read the data disks for a machine and check that they are of the correct size etc

| Resource Name | Resources | Description |
|---------------|-----------|-------------|
| azure_vm_datadisks | has_data_disks? | Boolean test to see if a machine has datadisks |
| | count | Returns the number of data disks attached to the machine |
| | where | Filter that allows for different tests to be performed, see examples below |

When data disks are retrieved from a machine they are given as an array. The `where` filter will interogate the array according the criteria it is given. The followin attributes are available in the filter:

 - `disk` - Disk number (0 index based)
 - `caching` - What sort of caching is enabled on the data disk
 - `create_option` - How the disk was created
 - `size` - The size of the disk in GB
 - `lun` - The LUN number
 - `name` - Name of the disk
 - `uri` - Full URI to the disk in Blob storage
 - `storage_account` - The name of the storage account in which the Blob storage exists

**Note:  This does not yet work with Managed Disks**

#### Test for 1 disk with a size greater than 10gb

```ruby
control 'azure-1' do
  impact 1.0
  title 'Checks that the machine has exactly one data disk and it is over 10gb in size'

  describe azure_virtual_machine(name: 'example-01', resource_group: 'MyResourceGroup') do
    its('has_disks?') { should be true }
    its('count') { should eq 1 }
  end

  describe azure_virtual_machine_datadisks(name: 'example-01', resource_group: 'MyResourceGroup').where { disk == 0 and size > 10 } do
    its('entries') { should_not be_empty }
  end
end
```

## Testing

The `test/integration/verify/controls` directory contains all of the tests that are run during integration tests. These can be used as examples of how to use this resource pack.

Rake tasks have been configured to enable the running of the integration tests:

```bash
rake changelog         # Generate a Change log from GitHub
rake lint              # Run robocop linter
rake rubocop           # Run Rubocop lint checks
rake test:integration  # Perform Integration Tests
```

As with using the resources themselves the integration tests rely on a Service Principal Name being defined. Please see the information at the start of this page on how to generate this.

## License

|  |  |
| ------ | --- |
| **Author:** | Russell Seymour (<russell@chef.io>) |
| **Copyright:** | Copyright (c) 2017 Chef Software Inc. |
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