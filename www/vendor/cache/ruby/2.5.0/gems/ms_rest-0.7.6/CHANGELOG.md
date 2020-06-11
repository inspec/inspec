##2019.05.15 ms_rest version 0.7.4
* [Bug Fix] Fix timeliness version to 0.3.10 to fix the issue with parse method.

##2018.09.25 ms_rest version 0.7.3
* [Enhancement] Added code to check for service response and retry if the code is 429 and retry header is provided. Refer [PR #1694](https://github.com/Azure/azure-sdk-for-ruby/pull/1694) for more details.

##2017.11.10 ms_rest version 0.7.2
* [Enhancement] Added code to check & validate the constraints on the model. Refer [PR #1119](https://github.com/Azure/azure-sdk-for-ruby/pull/1119/files) for more details.

##2017.07.27 ms_rest version 0.7.1
* [Bug Fix] Modified to_json logic in JSONable module to handle 'mapper' & 'object' options.[PR #860](https://github.com/Azure/azure-sdk-for-ruby/pull/860)

##2017.06.30 ms_rest version 0.7.0
* [Breaking Change] Refactored serialization & deserialization logic to remove client from the process.[Issue #610](https://github.com/Azure/azure-sdk-for-ruby/issues/610) [PR #799](https://github.com/Azure/azure-sdk-for-ruby/pull/799)

##2017.04.04 ms_rest version 0.6.4
* Bug fix to handle new faraday version. [Issue #182](https://github.com/Azure/vagrant-azure/issues/182)

##2017.02.06 ms_rest version 0.6.3
* Adding JSONable mixin module to provide simple serialization / deserialization [PR #599](https://github.com/Azure/azure-sdk-for-ruby/pull/599)
* Making credentials optional parameter for MsRest::ServiceClient [PR #626](https://github.com/Azure/azure-sdk-for-ruby/pull/626)
* Bug fix while building path to handle double // [Issue #693](https://github.com/Azure/azure-sdk-for-ruby/issues/639) [PR #640](https://github.com/Azure/azure-sdk-for-ruby/pull/640)

##2016.11.14 ms_rest version 0.6.2
* Missing default ca-cert for providing ssl options [#580](https://github.com/Azure/azure-sdk-for-ruby/issues/580)

##2016.11.11 ms_rest version 0.6.1
* Adding telemetry extension point into ServiceClient [#543](https://github.com/Azure/azure-sdk-for-ruby/pull/543)
* Removing explicit json dependency [#523](https://github.com/Azure/azure-sdk-for-ruby/pull/523)

##2016.10.05 ms_rest version 0.6.0
* Minimum supported Ruby version is 2.0.0 [#1463](https://github.com/Azure/autorest/pull/1463)
* Implemented generic request method for ServiceClient [#1447](https://github.com/Azure/autorest/pull/1447)
* Bug fix for merging query parameters [#1443](https://github.com/Azure/autorest/pull/1443)

##2016.09.15 ms_rest version 0.5.0
* Bundling default ca-cert and exposing method for providing ssl options

##2016.08.10 ms_rest version 0.4.0
* Modulerizing serialization class from ms_rest to be inherited by azure serializer module

##2016.07.21 ms_rest version 0.3.1
* [Bug fixes](https://github.com/Azure/autorest/commit/ede944a1fa30a7453aa30e6fa79154dc43393cdf)

##2016.07.14 ms_rest version 0.3.0
* Moving serialization/deserializaiton code from sdk models to client runtime. [#1106](https://github.com/Azure/autorest/pull/1106)
