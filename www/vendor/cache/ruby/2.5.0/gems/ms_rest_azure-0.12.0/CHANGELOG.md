##2020.05.21 ms_rest_azure version 0.12.0
* Unpin unf_ext dependency version.
* Update active_directory_endpoint_url in US Cloud.

##2020.03.05 ms_rest_azure version 0.11.2
* Added Azure CLI Token provider.
* Update faraday version to allow 1.0.0.
* Expose token expires properties to users.

##2019.05.14 ms_rest_azure version 0.11.1
* Set unf_ext dependency version to 0.0.7.2. This change has been done to accommodate the changes made to unf_ext. Refer [Issue #604](https://github.com/meew0/discordrb/issues/604) for further details.
* Added correlation_request_id & client_request_id to AzureOperationResponse.

##2018.07.31 ms_rest_azure version 0.11.0
* Added USER_DEFINED_IMDS_MAX_RETRY_TIME to msi_token_provider. Refer [PR #1539](https://github.com/Azure/azure-sdk-for-ruby/pull/1539) and [Issue #1344](https://github.com/Azure/azure-sdk-for-ruby/issues/1344) for further details.
* Modified Long Running Operation Logic to make final calls based on Final State Via value. Refer [PR #1537](https://github.com/Azure/azure-sdk-for-ruby/pull/1537) for further details.

##2018.06.08 ms_rest_azure version 0.10.8
* Added case insensitive comparison to Operation status.

##2018.05.16 ms_rest_azure version 0.10.7
* Added new error code 410 for IMDS Support for MSI Token Provider class.

##2018.04.16 ms_rest_azure version 0.10.6
* Added encoding of client id, object id and msi_id in the MSI Token provider class. Refer[PR #1288](https://github.com/Azure/azure-sdk-for-ruby/pull/1288) for further details.

##2018.04.16 ms_rest_azure version 0.10.5
* Added new error codes for IMDS Support for MSI Token Provider class. Refer [PR #1286](https://github.com/Azure/azure-sdk-for-ruby/pull/1286) and [Issue #1285](https://github.com/Azure/azure-sdk-for-ruby/issues/1285) for further details.

##2018.04.04 ms_rest_azure version 0.10.4
* Added IMDS Support for MSI Token Provider class. Refer [PR #1282](https://github.com/Azure/azure-sdk-for-ruby/pull/1282) for further details. 

##2018.02.06 ms_rest_azure version 0.10.3
* Removed subscription_id check from configurable. Refer [PR# 1261](https://github.com/Azure/azure-sdk-for-ruby/pull/1261) for further details.

##2018.01.30 ms_rest_azure version 0.10.2
* Added CognitiveServicesCredentials class for the cognitive services data plane SDK. Refer [PR #1257](https://github.com/Azure/azure-sdk-for-ruby/pull/1257) for further details.
* Added TopicCredentials class for the event grid data plane SDK. Refer [PR #1257](https://github.com/Azure/azure-sdk-for-ruby/pull/1257) for further details.

##2017.12.19 ms_rest_azure version 0.10.1
* Added support for user assigned identity to MSITokenProvider Modified portal URLs for Azure cloud environments. Refer [Issue #1175](https://github.com/Azure/azure-sdk-for-ruby/issues/1175) for further details.

##2017.11.10 ms_rest_azure version 0.10.0
* Modified portal URLs for Azure cloud environments. Refer [PR #1106](https://github.com/Azure/azure-sdk-for-ruby/pull/1106) for further details.
* [Breaking Change] Removed Resource and SubResource classes. Refer [PR #1106](https://github.com/Azure/azure-sdk-for-ruby/pull/1106) for further details.
* Added Configurable and Default classes to be used by the profile gems. Refer [PR #1111](https://github.com/Azure/azure-sdk-for-ruby/pull/1111) for further details.

##2017.09.11 ms_rest_azure version 0.9.0
* [Breaking Change] Managed Service Identity authentication to acquire token does not require `tenant_id`.[Issue #930](https://github.com/Azure/azure-sdk-for-ruby/issues/930) [PR #931](https://github.com/Azure/azure-sdk-for-ruby/pull/931)

##2017.08.28 ms_rest_azure version 0.8.2
* Enable Managed Service Identity authentication features into ms_rest_azure runtime for azure_mgmt_* sdks.[Issue #884](https://github.com/Azure/azure-sdk-for-ruby/issues/884) [PR #889](https://github.com/Azure/azure-sdk-for-ruby/pull/889)

##2017.07.10 ms_rest_azure version 0.8.1
* [Bug Fix] Fixed the issue with the polling status object to handle the response code and provisioning status correctly.[Issue #817](https://github.com/Azure/azure-sdk-for-ruby/issues/817) [PR #828](https://github.com/Azure/azure-sdk-for-ruby/pull/828)

##2017.06.30 ms_rest_azure version 0.8.0
* [Breaking Change] Changed the name of the azure environments from 'Azure' to 'AzureCloud' and 'AzureChina' to 'AzureChinaCloud'.[Issue #600](https://github.com/Azure/azure-sdk-for-ruby/issues/600) [PR #711](https://github.com/Azure/azure-sdk-for-ruby/pull/711)
* Added 'Accept' header with the value 'application/json'.[Issue #701](https://github.com/Azure/azure-sdk-for-ruby/issues/701) [PR #710](https://github.com/Azure/azure-sdk-for-ruby/pull/710)

##2017.02.06 ms_rest_azure version 0.7.0
* [Breaking Change] Correcting typo in `storage_endpoint_suffix` key for azure environments [Issue #603](https://github.com/Azure/azure-sdk-for-ruby/issues/603) [PR #604](https://github.com/Azure/azure-sdk-for-ruby/pull/604)
* [Breaking Change] Handling custom deserialization block in `MsRestAzure::AzureServiceClient.update_state_from_azure_async_operation_header` [PR #656](https://github.com/Azure/azure-sdk-for-ruby/pull/656)
* Adding `resource_group` property on MsRestAzure::Resource to be populated with Azure resource group name when available from `id` [Issue 340](https://github.com/Azure/azure-sdk-for-ruby/issues/340) [PR #620](https://github.com/Azure/azure-sdk-for-ruby/pull/620)
* Deriving `MsREstAzure::Resource` from `MsRestAzure::SubResource` to share `id` property [PR #663](https://github.com/Azure/azure-sdk-for-ruby/pull/663)

##2016.11.14 ms_rest_azure version 0.6.2
* Update to ms_rest v0.6.2 due to fix for missing default ca-cert for providing ssl options [#580](https://github.com/Azure/azure-sdk-for-ruby/issues/580)

##2016.11.11 ms_rest_azure version 0.6.1
* Adding telemetry extension point into AzureServiceClient [#543](https://github.com/Azure/azure-sdk-for-ruby/pull/543)
* Removing explicit json dependency [#523](https://github.com/Azure/azure-sdk-for-ruby/pull/523)

##2016.10.05 ms_rest_azure version 0.6.0
* Minimum supported Ruby version is 2.0.0 [#1463](https://github.com/Azure/autorest/pull/1463)
* Implemented generic request method for AzureServiceClient [#1447](https://github.com/Azure/autorest/pull/1447)
* Improved AzureOperationError class to expose error_message and error_code properties [#1450](https://github.com/Azure/autorest/pull/1450)

##2016.09.15 ms_rest_azure version 0.5.0
* Updating ms_rest dependency to version 0.5.0
* Adding known Azure Environments in ruby runtime for easy discovery
* Default Azure active directory url is updated from `https://login.windows.net/` to `https://login.microsoftonline.com/` (Breaking Change)
* Using bundled default ca-cert from ms_rest

##2016.08.10 ms_rest_azure version 0.4.0
* Adding & inheriting serialization class from ms_rest generic serializer

##2016.07.21 ms_rest_azure version 0.3.1
* [Bug fixes](https://github.com/Azure/autorest/commit/ede944a1fa30a7453aa30e6fa79154dc43393cdf)

##2016.07.14 ms_rest_azure version 0.3.0
* Embracing latest ms_rest version [0.3.0](https://rubygems.org/gems/ms_rest)

##2016.05.19 ms_rest_azure version 0.2.3
* Support patch for long running operations. See [#1011](https://github.com/Azure/autorest/pull/1011), [#1056](https://github.com/Azure/autorest/pull/1056)
