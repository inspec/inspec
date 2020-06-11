# Intro

This project provides a Ruby gem for easy access to the Azure ARM Resources API. With this gem you can create/update/list/delete resources, resource groups, resource providers and deployments.

# Supported Ruby Versions

* Ruby 2+

Note: x64 Ruby for Windows is known to have some compatibility issues.

# Getting started

## Setting up the service principal

First of all to start interacting with the ARM resources you will need to setup a service principal. Service principal is an Azure application which allows you to authenticate to Azure and access Azure services. The detailed steps of how to setup a service principal can be found in this article: http://aka.ms/cli-service-principal. In the result of setting up service principal you will get tenant id, client id and client secret data.

## Installation

install the appropriate gem:

```
gem install azure_mgmt_resources
```

and reference it in your code:

```Ruby
require 'azure_mgmt_resources'
```

After that you should be ready to start using SDK!

## Creating a Client
### Option 1 - Using the Resources Profiles
You can create a new resources group using the Resources profile.

```ruby
# Include SDK modules to ease access to resources classes.
include Azure::Resources::Profiles::Latest::Mgmt
include Azure::Resources::Profiles::Latest::Mgmt::Models

provider = MsRestAzure::ApplicationTokenProvider.new(
       'YOUR TENANT ID',
       'YOUR CLIENT ID',
       'YOUR CLIENT SECRET')
credentials = MsRest::TokenCredentials.new(provider)

options = {
  tenant_id: 'YOUR TENANT ID',
  client_id: 'YOUR CLIENT ID',
  client_secret: 'YOUR CLIENT SECRET',
  subscription_id: 'YOUR SUBSCRIPTION ID',
  credentials: credentials
}

client = Client.new(options)
```

### Option 2 - Using a specific version of Resources
You can create a new resources group using a specific version of Resources, say 2017-05-10.

```ruby
# Include SDK modules to ease access to resources classes.
include Azure::Resources::Mgmt::V2017_05_10
include Azure::Resources::Mgmt::V2017_05_10::Models

# Note: The tenant_id, client_id, client_secret and subscription_id
# must be set using the env variables.

provider = MsRestAzure::ApplicationTokenProvider.new(
       ENV['AZURE_TENANT_ID'],
       ENV['AZURE_CLIENT_ID'],
       ENV['AZURE_CLIENT_SECRET'])
credentials = MsRest::TokenCredentials.new(provider)

client = ResourceManagementClient.new(credentials)
client.subscription_id = ENV['AZURE_SUBSCRIPTION_ID']
```

## Using the client
Once the client is initialized, we could create the resource group.

```ruby
# Create a model for resource group.
resource_group = ResourceGroup.new()
resource_group.location = 'westus'

promise = client.resource_groups.create_or_update_async('new_test_resource_group', resource_group)
```

The SDK method returns a promise which you can utilize depending on your needs. E.g. if you need to get result immediately via sync blocking call - do the following:

```Ruby
result = promise.value!
```

If you need to follow async flow - provide a block which will be executed in off main thread:

```Ruby
promise = promise.then do |result|
  # Handle the result
end
```

In both cases you're returned an instance of MsRestAzure::AzureOperationResponse which contains HTTP requests/response objects and response body. Response body is a deserialized object representing the received information. In case of code above - newly created resource group. To get data from it:

```Ruby
resource_group = result.body

p resource_group.name # 'new_test_resource_group'
p resource_group.id   # the id of resource group
```

Congrats, you've create an ARM resource group. We encourage you to try more stuff and let us know your feedback!
