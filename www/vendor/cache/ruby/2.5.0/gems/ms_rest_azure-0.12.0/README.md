# Intro

MsRestAzure is a library which supports the Azure clients (SDKs) generated with Autorest tool. It contains core logic and helper classes for error handling and authentication. Also it includes azure specific logic like long polling functionality and Azure application authentication. Usually it is not supposed to be used as a standalone gem but only as a dependency for generated client gems.

# Supported Ruby Versions

* Ruby 2.0
* Ruby 2.1
* Ruby 2.2

Note: x64 Ruby for Windows is known to have some compatibility issues.

# Installation

install the appropriate gem:

```
gem install ms_rest_azure
```

and reference it in your code:

```Ruby
require 'ms_rest_azure'
```

# Running tests

MsRestAzure has only unit tests which doesn't require any preparation, just run 'rspec' command from the gem directory.

# Contribution

To start working on the gem the only additional dev dependecy is required - rspec. After you've added a new feature and all specs pass - you're good to go with PR. But before starting any bug/feature - please make sure you've thoroughly discussed it with repository maintainers. This gem already powers a few SDKs and backward compatibility should taken in account.

# Adding gem to you generated SDK

Reference it in the gemfile and also add this line to your client's gemspec file:

```ruby
spec.add_runtime_dependency 'ms_rest_azure', '~> 0.11.1'
```
Don't forget to correct the version.

# Utilizing MSI(Managed Service Identity) Token Provider 

MSI support has been enabled in `ms_rest_azure` version `0.9.0`. Below code snippet demonstrates how to use MSITokenProvider with default port `50342`:  

```ruby
provider = MsRestAzure::MSITokenProvider.new()
credentials = MsRest::TokenCredentials.new(provider)
```

**Note**:  As of 04/04/2018, there are 2 supported ways to get MSI Token. 
 1. Using the extension installed locally and accessing http://localhost:50342/oauth2/token to get the MSI Token
 2. Accessing the http://169.254.169.254/metadata/identity/oauth2/token to get the MSI Token (default)

Usually, you do not have to worry about the way you get the MSI token. If you would like to access the token specifically using the first approach, then set the environment variable 'MSI_VM' to true.

# Utilizing Telemetry Extension in your SDK

We encourage the customer of ms_rest_azure library to provide information about their product sent via telemetry extension point as below:

```ruby
additional_user_agent_information = 'fog-azure-rm/0.2.0' # Refer https://github.com/Azure/azure-sdk-for-ruby/issues/517 for more info.
azure_service_client.add_user_agent_information(additional_user_agent_information)
```


# Provide feedback

Send email to the azsdkteam@microsoft.com or file new issue in this repository.
