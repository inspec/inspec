# Copyright 2015 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'date'
require 'google/apis/core/base_service'
require 'google/apis/core/json_representation'
require 'google/apis/core/hashable'
require 'google/apis/errors'

module Google
  module Apis
    module ScriptV1
      
      class Content
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateProjectRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Deployment
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeploymentConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Empty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EntryPoint
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ExecuteStreamResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ExecutionError
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ExecutionRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ExecutionResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class File
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleAppsScriptTypeAddOnEntryPoint
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleAppsScriptTypeExecutionApiConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleAppsScriptTypeExecutionApiEntryPoint
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleAppsScriptTypeFunction
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleAppsScriptTypeFunctionSet
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleAppsScriptTypeProcess
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleAppsScriptTypeUser
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleAppsScriptTypeWebAppConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleAppsScriptTypeWebAppEntryPoint
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListDeploymentsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListScriptProcessesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListUserProcessesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListValue
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListVersionsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Metrics
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MetricsValue
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Operation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Project
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ScriptExecutionResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ScriptStackTraceElement
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Status
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Struct
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UpdateDeploymentRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Value
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Version
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Content
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :files, as: 'files', class: Google::Apis::ScriptV1::File, decorator: Google::Apis::ScriptV1::File::Representation
      
          property :script_id, as: 'scriptId'
        end
      end
      
      class CreateProjectRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :parent_id, as: 'parentId'
          property :title, as: 'title'
        end
      end
      
      class Deployment
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :deployment_config, as: 'deploymentConfig', class: Google::Apis::ScriptV1::DeploymentConfig, decorator: Google::Apis::ScriptV1::DeploymentConfig::Representation
      
          property :deployment_id, as: 'deploymentId'
          collection :entry_points, as: 'entryPoints', class: Google::Apis::ScriptV1::EntryPoint, decorator: Google::Apis::ScriptV1::EntryPoint::Representation
      
          property :update_time, as: 'updateTime'
        end
      end
      
      class DeploymentConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :manifest_file_name, as: 'manifestFileName'
          property :script_id, as: 'scriptId'
          property :version_number, as: 'versionNumber'
        end
      end
      
      class Empty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class EntryPoint
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :add_on, as: 'addOn', class: Google::Apis::ScriptV1::GoogleAppsScriptTypeAddOnEntryPoint, decorator: Google::Apis::ScriptV1::GoogleAppsScriptTypeAddOnEntryPoint::Representation
      
          property :entry_point_type, as: 'entryPointType'
          property :execution_api, as: 'executionApi', class: Google::Apis::ScriptV1::GoogleAppsScriptTypeExecutionApiEntryPoint, decorator: Google::Apis::ScriptV1::GoogleAppsScriptTypeExecutionApiEntryPoint::Representation
      
          property :web_app, as: 'webApp', class: Google::Apis::ScriptV1::GoogleAppsScriptTypeWebAppEntryPoint, decorator: Google::Apis::ScriptV1::GoogleAppsScriptTypeWebAppEntryPoint::Representation
      
        end
      end
      
      class ExecuteStreamResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :result, as: 'result', class: Google::Apis::ScriptV1::ScriptExecutionResult, decorator: Google::Apis::ScriptV1::ScriptExecutionResult::Representation
      
        end
      end
      
      class ExecutionError
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :error_message, as: 'errorMessage'
          property :error_type, as: 'errorType'
          collection :script_stack_trace_elements, as: 'scriptStackTraceElements', class: Google::Apis::ScriptV1::ScriptStackTraceElement, decorator: Google::Apis::ScriptV1::ScriptStackTraceElement::Representation
      
        end
      end
      
      class ExecutionRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :dev_mode, as: 'devMode'
          property :function, as: 'function'
          collection :parameters, as: 'parameters'
          property :session_state, as: 'sessionState'
        end
      end
      
      class ExecutionResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :result, as: 'result'
        end
      end
      
      class File
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_time, as: 'createTime'
          property :function_set, as: 'functionSet', class: Google::Apis::ScriptV1::GoogleAppsScriptTypeFunctionSet, decorator: Google::Apis::ScriptV1::GoogleAppsScriptTypeFunctionSet::Representation
      
          property :last_modify_user, as: 'lastModifyUser', class: Google::Apis::ScriptV1::GoogleAppsScriptTypeUser, decorator: Google::Apis::ScriptV1::GoogleAppsScriptTypeUser::Representation
      
          property :name, as: 'name'
          property :source, as: 'source'
          property :type, as: 'type'
          property :update_time, as: 'updateTime'
        end
      end
      
      class GoogleAppsScriptTypeAddOnEntryPoint
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :add_on_type, as: 'addOnType'
          property :description, as: 'description'
          property :help_url, as: 'helpUrl'
          property :post_install_tip_url, as: 'postInstallTipUrl'
          property :report_issue_url, as: 'reportIssueUrl'
          property :title, as: 'title'
        end
      end
      
      class GoogleAppsScriptTypeExecutionApiConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :access, as: 'access'
        end
      end
      
      class GoogleAppsScriptTypeExecutionApiEntryPoint
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :entry_point_config, as: 'entryPointConfig', class: Google::Apis::ScriptV1::GoogleAppsScriptTypeExecutionApiConfig, decorator: Google::Apis::ScriptV1::GoogleAppsScriptTypeExecutionApiConfig::Representation
      
        end
      end
      
      class GoogleAppsScriptTypeFunction
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
        end
      end
      
      class GoogleAppsScriptTypeFunctionSet
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :values, as: 'values', class: Google::Apis::ScriptV1::GoogleAppsScriptTypeFunction, decorator: Google::Apis::ScriptV1::GoogleAppsScriptTypeFunction::Representation
      
        end
      end
      
      class GoogleAppsScriptTypeProcess
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :duration, as: 'duration'
          property :function_name, as: 'functionName'
          property :process_status, as: 'processStatus'
          property :process_type, as: 'processType'
          property :project_name, as: 'projectName'
          property :start_time, as: 'startTime'
          property :user_access_level, as: 'userAccessLevel'
        end
      end
      
      class GoogleAppsScriptTypeUser
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :domain, as: 'domain'
          property :email, as: 'email'
          property :name, as: 'name'
          property :photo_url, as: 'photoUrl'
        end
      end
      
      class GoogleAppsScriptTypeWebAppConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :access, as: 'access'
          property :execute_as, as: 'executeAs'
        end
      end
      
      class GoogleAppsScriptTypeWebAppEntryPoint
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :entry_point_config, as: 'entryPointConfig', class: Google::Apis::ScriptV1::GoogleAppsScriptTypeWebAppConfig, decorator: Google::Apis::ScriptV1::GoogleAppsScriptTypeWebAppConfig::Representation
      
          property :url, as: 'url'
        end
      end
      
      class ListDeploymentsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :deployments, as: 'deployments', class: Google::Apis::ScriptV1::Deployment, decorator: Google::Apis::ScriptV1::Deployment::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListScriptProcessesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :processes, as: 'processes', class: Google::Apis::ScriptV1::GoogleAppsScriptTypeProcess, decorator: Google::Apis::ScriptV1::GoogleAppsScriptTypeProcess::Representation
      
        end
      end
      
      class ListUserProcessesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :processes, as: 'processes', class: Google::Apis::ScriptV1::GoogleAppsScriptTypeProcess, decorator: Google::Apis::ScriptV1::GoogleAppsScriptTypeProcess::Representation
      
        end
      end
      
      class ListValue
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :values, as: 'values', class: Google::Apis::ScriptV1::Value, decorator: Google::Apis::ScriptV1::Value::Representation
      
        end
      end
      
      class ListVersionsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :versions, as: 'versions', class: Google::Apis::ScriptV1::Version, decorator: Google::Apis::ScriptV1::Version::Representation
      
        end
      end
      
      class Metrics
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :active_users, as: 'activeUsers', class: Google::Apis::ScriptV1::MetricsValue, decorator: Google::Apis::ScriptV1::MetricsValue::Representation
      
          collection :failed_executions, as: 'failedExecutions', class: Google::Apis::ScriptV1::MetricsValue, decorator: Google::Apis::ScriptV1::MetricsValue::Representation
      
          collection :total_executions, as: 'totalExecutions', class: Google::Apis::ScriptV1::MetricsValue, decorator: Google::Apis::ScriptV1::MetricsValue::Representation
      
        end
      end
      
      class MetricsValue
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :end_time, as: 'endTime'
          property :start_time, as: 'startTime'
          property :value, :numeric_string => true, as: 'value'
        end
      end
      
      class Operation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :done, as: 'done'
          property :error, as: 'error', class: Google::Apis::ScriptV1::Status, decorator: Google::Apis::ScriptV1::Status::Representation
      
          hash :response, as: 'response'
        end
      end
      
      class Project
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_time, as: 'createTime'
          property :creator, as: 'creator', class: Google::Apis::ScriptV1::GoogleAppsScriptTypeUser, decorator: Google::Apis::ScriptV1::GoogleAppsScriptTypeUser::Representation
      
          property :last_modify_user, as: 'lastModifyUser', class: Google::Apis::ScriptV1::GoogleAppsScriptTypeUser, decorator: Google::Apis::ScriptV1::GoogleAppsScriptTypeUser::Representation
      
          property :parent_id, as: 'parentId'
          property :script_id, as: 'scriptId'
          property :title, as: 'title'
          property :update_time, as: 'updateTime'
        end
      end
      
      class ScriptExecutionResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :return_value, as: 'returnValue', class: Google::Apis::ScriptV1::Value, decorator: Google::Apis::ScriptV1::Value::Representation
      
        end
      end
      
      class ScriptStackTraceElement
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :function, as: 'function'
          property :line_number, as: 'lineNumber'
        end
      end
      
      class Status
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :code, as: 'code'
          collection :details, as: 'details'
          property :message, as: 'message'
        end
      end
      
      class Struct
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :fields, as: 'fields', class: Google::Apis::ScriptV1::Value, decorator: Google::Apis::ScriptV1::Value::Representation
      
        end
      end
      
      class UpdateDeploymentRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :deployment_config, as: 'deploymentConfig', class: Google::Apis::ScriptV1::DeploymentConfig, decorator: Google::Apis::ScriptV1::DeploymentConfig::Representation
      
        end
      end
      
      class Value
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bool_value, as: 'boolValue'
          property :bytes_value, :base64 => true, as: 'bytesValue'
          property :date_value, :numeric_string => true, as: 'dateValue'
          property :list_value, as: 'listValue', class: Google::Apis::ScriptV1::ListValue, decorator: Google::Apis::ScriptV1::ListValue::Representation
      
          property :null_value, as: 'nullValue'
          property :number_value, as: 'numberValue'
          hash :proto_value, as: 'protoValue'
          property :string_value, as: 'stringValue'
          property :struct_value, as: 'structValue', class: Google::Apis::ScriptV1::Struct, decorator: Google::Apis::ScriptV1::Struct::Representation
      
        end
      end
      
      class Version
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_time, as: 'createTime'
          property :description, as: 'description'
          property :script_id, as: 'scriptId'
          property :version_number, as: 'versionNumber'
        end
      end
    end
  end
end
