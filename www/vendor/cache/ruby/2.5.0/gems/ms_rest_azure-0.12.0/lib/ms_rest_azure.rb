# encoding: utf-8
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See License.txt in the project root for license information.

require 'ms_rest'
require 'ms_rest_azure/active_directory_service_settings.rb'
require 'ms_rest_azure/async_operation_status.rb'
require 'ms_rest_azure/azure_environment.rb'
require 'ms_rest_azure/azure_operation_error.rb'
require 'ms_rest_azure/azure_operation_response.rb'
require 'ms_rest_azure/azure_service_client.rb'
require 'ms_rest_azure/cloud_error_data.rb'
require 'ms_rest_azure/final_state_via.rb'
require 'ms_rest_azure/credentials/application_token_provider.rb'
require 'ms_rest_azure/credentials/cognitive_services_credentials.rb'
require 'ms_rest_azure/credentials/topic_credentials.rb'
require 'ms_rest_azure/credentials/msi_token_provider.rb'
require 'ms_rest_azure/credentials/azure_cli_token_provider.rb'
require 'ms_rest_azure/azure_cli_error.rb'
require 'ms_rest_azure/polling_state.rb'
require 'ms_rest_azure/serialization.rb'
require 'ms_rest_azure/typed_error_info.rb' 
require 'ms_rest_azure/version'
require 'ms_rest_azure/common/configurable'
require 'ms_rest_azure/common/default'

module MsRestAzure end
module MsRestAzure::Serialization end
module MsRestAzure::AzureEnvironments end
module MsRestAzure::Common end
module MsRestAzure::Common::Configurable end
module MsRestAzure::Common::Default end
