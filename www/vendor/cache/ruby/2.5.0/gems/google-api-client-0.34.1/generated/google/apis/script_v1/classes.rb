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
      
      # The Content resource.
      class Content
        include Google::Apis::Core::Hashable
      
        # The list of script project files.
        # One of the files is a script manifest; it must be named "appsscript",
        # must have type of JSON, and include the manifest configurations for the
        # project.
        # Corresponds to the JSON property `files`
        # @return [Array<Google::Apis::ScriptV1::File>]
        attr_accessor :files
      
        # The script project's Drive ID.
        # Corresponds to the JSON property `scriptId`
        # @return [String]
        attr_accessor :script_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @files = args[:files] if args.key?(:files)
          @script_id = args[:script_id] if args.key?(:script_id)
        end
      end
      
      # Request to create a script project.
      class CreateProjectRequest
        include Google::Apis::Core::Hashable
      
        # The Drive ID of a parent file that the created script project is bound to.
        # This is usually the ID of a Google Doc, Google Sheet, Google Form, or
        # Google Slides file. If not set, a standalone script project is created.
        # Corresponds to the JSON property `parentId`
        # @return [String]
        attr_accessor :parent_id
      
        # The title for the project.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @parent_id = args[:parent_id] if args.key?(:parent_id)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # Representation of a single script deployment.
      class Deployment
        include Google::Apis::Core::Hashable
      
        # Metadata the defines how a deployment is configured.
        # Corresponds to the JSON property `deploymentConfig`
        # @return [Google::Apis::ScriptV1::DeploymentConfig]
        attr_accessor :deployment_config
      
        # The deployment ID for this deployment.
        # Corresponds to the JSON property `deploymentId`
        # @return [String]
        attr_accessor :deployment_id
      
        # The deployment's entry points.
        # Corresponds to the JSON property `entryPoints`
        # @return [Array<Google::Apis::ScriptV1::EntryPoint>]
        attr_accessor :entry_points
      
        # Last modified date time stamp.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @deployment_config = args[:deployment_config] if args.key?(:deployment_config)
          @deployment_id = args[:deployment_id] if args.key?(:deployment_id)
          @entry_points = args[:entry_points] if args.key?(:entry_points)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Metadata the defines how a deployment is configured.
      class DeploymentConfig
        include Google::Apis::Core::Hashable
      
        # The description for this deployment.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The manifest file name for this deployment.
        # Corresponds to the JSON property `manifestFileName`
        # @return [String]
        attr_accessor :manifest_file_name
      
        # The script project's Drive ID.
        # Corresponds to the JSON property `scriptId`
        # @return [String]
        attr_accessor :script_id
      
        # The version number on which this deployment is based.
        # Corresponds to the JSON property `versionNumber`
        # @return [Fixnum]
        attr_accessor :version_number
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @manifest_file_name = args[:manifest_file_name] if args.key?(:manifest_file_name)
          @script_id = args[:script_id] if args.key?(:script_id)
          @version_number = args[:version_number] if args.key?(:version_number)
        end
      end
      
      # A generic empty message that you can re-use to avoid defining duplicated
      # empty messages in your APIs. A typical example is to use it as the request
      # or the response type of an API method. For instance:
      # service Foo `
      # rpc Bar(google.protobuf.Empty) returns (google.protobuf.Empty);
      # `
      # The JSON representation for `Empty` is empty JSON object ````.
      class Empty
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # A configuration that defines how a deployment is accessed externally.
      class EntryPoint
        include Google::Apis::Core::Hashable
      
        # An add-on entry point.
        # Corresponds to the JSON property `addOn`
        # @return [Google::Apis::ScriptV1::GoogleAppsScriptTypeAddOnEntryPoint]
        attr_accessor :add_on
      
        # The type of the entry point.
        # Corresponds to the JSON property `entryPointType`
        # @return [String]
        attr_accessor :entry_point_type
      
        # An API executable entry point.
        # Corresponds to the JSON property `executionApi`
        # @return [Google::Apis::ScriptV1::GoogleAppsScriptTypeExecutionApiEntryPoint]
        attr_accessor :execution_api
      
        # A web application entry point.
        # Corresponds to the JSON property `webApp`
        # @return [Google::Apis::ScriptV1::GoogleAppsScriptTypeWebAppEntryPoint]
        attr_accessor :web_app
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @add_on = args[:add_on] if args.key?(:add_on)
          @entry_point_type = args[:entry_point_type] if args.key?(:entry_point_type)
          @execution_api = args[:execution_api] if args.key?(:execution_api)
          @web_app = args[:web_app] if args.key?(:web_app)
        end
      end
      
      # The response for executing or debugging a function in an Apps Script project.
      class ExecuteStreamResponse
        include Google::Apis::Core::Hashable
      
        # The result of an execution
        # Based on ScriptExecutionResult at:
        # google3/apps/maestro/api/frontend_execution_common.proto?q=message%5c%
        # 20ScriptExecutionResult
        # Corresponds to the JSON property `result`
        # @return [Google::Apis::ScriptV1::ScriptExecutionResult]
        attr_accessor :result
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @result = args[:result] if args.key?(:result)
        end
      end
      
      # An object that provides information about the nature of an error resulting
      # from an attempted execution of a script function using the Apps Script API.
      # If a run call
      # succeeds but the script function (or Apps Script itself) throws an exception,
      # the response body's error field
      # contains a
      # Status object. The `Status` object's `details` field
      # contains an array with a single one of these `ExecutionError` objects.
      class ExecutionError
        include Google::Apis::Core::Hashable
      
        # The error message thrown by Apps Script, usually localized into the user's
        # language.
        # Corresponds to the JSON property `errorMessage`
        # @return [String]
        attr_accessor :error_message
      
        # The error type, for example `TypeError` or `ReferenceError`. If the error
        # type is unavailable, this field is not included.
        # Corresponds to the JSON property `errorType`
        # @return [String]
        attr_accessor :error_type
      
        # An array of objects that provide a stack trace through the script to show
        # where the execution failed, with the deepest call first.
        # Corresponds to the JSON property `scriptStackTraceElements`
        # @return [Array<Google::Apis::ScriptV1::ScriptStackTraceElement>]
        attr_accessor :script_stack_trace_elements
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error_message = args[:error_message] if args.key?(:error_message)
          @error_type = args[:error_type] if args.key?(:error_type)
          @script_stack_trace_elements = args[:script_stack_trace_elements] if args.key?(:script_stack_trace_elements)
        end
      end
      
      # A request to run the function in a script. The script is identified by the
      # specified `script_id`. Executing a function on a script returns results
      # based on the implementation of the script.
      class ExecutionRequest
        include Google::Apis::Core::Hashable
      
        # If `true` and the user is an owner of the script, the script runs at the
        # most recently saved version rather than the version deployed for use with
        # the Apps Script API. Optional; default is `false`.
        # Corresponds to the JSON property `devMode`
        # @return [Boolean]
        attr_accessor :dev_mode
        alias_method :dev_mode?, :dev_mode
      
        # The name of the function to execute in the given script. The name does not
        # include parentheses or parameters. It can reference a function in an
        # included library such as `Library.libFunction1`.
        # Corresponds to the JSON property `function`
        # @return [String]
        attr_accessor :function
      
        # The parameters to be passed to the function being executed. The object type
        # for each parameter should match the expected type in Apps Script.
        # Parameters cannot be Apps Script-specific object types (such as a
        # `Document` or a `Calendar`); they can only be primitive types such as
        # `string`, `number`, `array`, `object`, or `boolean`. Optional.
        # Corresponds to the JSON property `parameters`
        # @return [Array<Object>]
        attr_accessor :parameters
      
        # <b>Deprecated</b>. For use with Android add-ons only. An ID that represents
        # the user's current session in the Android app for Google Docs or Sheets,
        # included as extra data in the
        # [Intent](https://developer.android.com/guide/components/intents-filters.html)
        # that launches the add-on. When an Android add-on is run with a session
        # state, it gains the privileges of a
        # [bound](https://developers.google.com/apps-script/guides/bound)
        # script&mdash;that is, it can access information like the user's current
        # cursor position (in Docs) or selected cell (in Sheets). To retrieve the
        # state, call
        # `Intent.getStringExtra("com.google.android.apps.docs.addons.SessionState")`.
        # Optional.
        # Corresponds to the JSON property `sessionState`
        # @return [String]
        attr_accessor :session_state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dev_mode = args[:dev_mode] if args.key?(:dev_mode)
          @function = args[:function] if args.key?(:function)
          @parameters = args[:parameters] if args.key?(:parameters)
          @session_state = args[:session_state] if args.key?(:session_state)
        end
      end
      
      # An object that provides the return value of a function executed using the
      # Apps Script API. If the script function returns successfully, the response
      # body's response field contains this
      # `ExecutionResponse` object.
      class ExecutionResponse
        include Google::Apis::Core::Hashable
      
        # The return value of the script function. The type matches the object type
        # returned in Apps Script. Functions called using the Apps Script API cannot
        # return Apps Script-specific objects (such as a `Document` or a `Calendar`);
        # they can only return primitive types such as a `string`, `number`, `array`,
        # `object`, or `boolean`.
        # Corresponds to the JSON property `result`
        # @return [Object]
        attr_accessor :result
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @result = args[:result] if args.key?(:result)
        end
      end
      
      # An individual file within a script project.
      # A file is a third-party source code created by one or more
      # developers. It can be a server-side JS code, HTML, or a
      # configuration file. Each script project can contain multiple files.
      class File
        include Google::Apis::Core::Hashable
      
        # Creation date timestamp.
        # This read-only field is only visible to users who have WRITER
        # permission for the script project.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # A set of functions. No duplicates are permitted.
        # Corresponds to the JSON property `functionSet`
        # @return [Google::Apis::ScriptV1::GoogleAppsScriptTypeFunctionSet]
        attr_accessor :function_set
      
        # A simple user profile resource.
        # Corresponds to the JSON property `lastModifyUser`
        # @return [Google::Apis::ScriptV1::GoogleAppsScriptTypeUser]
        attr_accessor :last_modify_user
      
        # The name of the file. The file extension is not part of the file
        # name, which can be identified from the type field.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The file content.
        # Corresponds to the JSON property `source`
        # @return [String]
        attr_accessor :source
      
        # The type of the file.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # Last modified date timestamp.
        # This read-only field is only visible to users who have WRITER
        # permission for the script project.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @function_set = args[:function_set] if args.key?(:function_set)
          @last_modify_user = args[:last_modify_user] if args.key?(:last_modify_user)
          @name = args[:name] if args.key?(:name)
          @source = args[:source] if args.key?(:source)
          @type = args[:type] if args.key?(:type)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # An add-on entry point.
      class GoogleAppsScriptTypeAddOnEntryPoint
        include Google::Apis::Core::Hashable
      
        # The add-on's required list of supported container types.
        # Corresponds to the JSON property `addOnType`
        # @return [String]
        attr_accessor :add_on_type
      
        # The add-on's optional description.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The add-on's optional help URL.
        # Corresponds to the JSON property `helpUrl`
        # @return [String]
        attr_accessor :help_url
      
        # The add-on's required post install tip URL.
        # Corresponds to the JSON property `postInstallTipUrl`
        # @return [String]
        attr_accessor :post_install_tip_url
      
        # The add-on's optional report issue URL.
        # Corresponds to the JSON property `reportIssueUrl`
        # @return [String]
        attr_accessor :report_issue_url
      
        # The add-on's required title.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @add_on_type = args[:add_on_type] if args.key?(:add_on_type)
          @description = args[:description] if args.key?(:description)
          @help_url = args[:help_url] if args.key?(:help_url)
          @post_install_tip_url = args[:post_install_tip_url] if args.key?(:post_install_tip_url)
          @report_issue_url = args[:report_issue_url] if args.key?(:report_issue_url)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # API executable entry point configuration.
      class GoogleAppsScriptTypeExecutionApiConfig
        include Google::Apis::Core::Hashable
      
        # Who has permission to run the API executable.
        # Corresponds to the JSON property `access`
        # @return [String]
        attr_accessor :access
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @access = args[:access] if args.key?(:access)
        end
      end
      
      # An API executable entry point.
      class GoogleAppsScriptTypeExecutionApiEntryPoint
        include Google::Apis::Core::Hashable
      
        # API executable entry point configuration.
        # Corresponds to the JSON property `entryPointConfig`
        # @return [Google::Apis::ScriptV1::GoogleAppsScriptTypeExecutionApiConfig]
        attr_accessor :entry_point_config
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @entry_point_config = args[:entry_point_config] if args.key?(:entry_point_config)
        end
      end
      
      # Represents a function in a script project.
      class GoogleAppsScriptTypeFunction
        include Google::Apis::Core::Hashable
      
        # The function name in the script project.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # A set of functions. No duplicates are permitted.
      class GoogleAppsScriptTypeFunctionSet
        include Google::Apis::Core::Hashable
      
        # A list of functions composing the set.
        # Corresponds to the JSON property `values`
        # @return [Array<Google::Apis::ScriptV1::GoogleAppsScriptTypeFunction>]
        attr_accessor :values
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @values = args[:values] if args.key?(:values)
        end
      end
      
      # Representation of a single script process execution that was started from
      # the script editor, a trigger, an application, or using the Apps Script API.
      # This is distinct from the `Operation`
      # resource, which only represents executions started via the Apps Script API.
      class GoogleAppsScriptTypeProcess
        include Google::Apis::Core::Hashable
      
        # Duration the execution spent executing.
        # Corresponds to the JSON property `duration`
        # @return [String]
        attr_accessor :duration
      
        # Name of the function the started the execution.
        # Corresponds to the JSON property `functionName`
        # @return [String]
        attr_accessor :function_name
      
        # The executions status.
        # Corresponds to the JSON property `processStatus`
        # @return [String]
        attr_accessor :process_status
      
        # The executions type.
        # Corresponds to the JSON property `processType`
        # @return [String]
        attr_accessor :process_type
      
        # Name of the script being executed.
        # Corresponds to the JSON property `projectName`
        # @return [String]
        attr_accessor :project_name
      
        # Time the execution started.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        # The executing users access level to the script.
        # Corresponds to the JSON property `userAccessLevel`
        # @return [String]
        attr_accessor :user_access_level
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @duration = args[:duration] if args.key?(:duration)
          @function_name = args[:function_name] if args.key?(:function_name)
          @process_status = args[:process_status] if args.key?(:process_status)
          @process_type = args[:process_type] if args.key?(:process_type)
          @project_name = args[:project_name] if args.key?(:project_name)
          @start_time = args[:start_time] if args.key?(:start_time)
          @user_access_level = args[:user_access_level] if args.key?(:user_access_level)
        end
      end
      
      # A simple user profile resource.
      class GoogleAppsScriptTypeUser
        include Google::Apis::Core::Hashable
      
        # The user's domain.
        # Corresponds to the JSON property `domain`
        # @return [String]
        attr_accessor :domain
      
        # The user's identifying email address.
        # Corresponds to the JSON property `email`
        # @return [String]
        attr_accessor :email
      
        # The user's display name.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The user's photo.
        # Corresponds to the JSON property `photoUrl`
        # @return [String]
        attr_accessor :photo_url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @domain = args[:domain] if args.key?(:domain)
          @email = args[:email] if args.key?(:email)
          @name = args[:name] if args.key?(:name)
          @photo_url = args[:photo_url] if args.key?(:photo_url)
        end
      end
      
      # Web app entry point configuration.
      class GoogleAppsScriptTypeWebAppConfig
        include Google::Apis::Core::Hashable
      
        # Who has permission to run the web app.
        # Corresponds to the JSON property `access`
        # @return [String]
        attr_accessor :access
      
        # Who to execute the web app as.
        # Corresponds to the JSON property `executeAs`
        # @return [String]
        attr_accessor :execute_as
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @access = args[:access] if args.key?(:access)
          @execute_as = args[:execute_as] if args.key?(:execute_as)
        end
      end
      
      # A web application entry point.
      class GoogleAppsScriptTypeWebAppEntryPoint
        include Google::Apis::Core::Hashable
      
        # Web app entry point configuration.
        # Corresponds to the JSON property `entryPointConfig`
        # @return [Google::Apis::ScriptV1::GoogleAppsScriptTypeWebAppConfig]
        attr_accessor :entry_point_config
      
        # The URL for the web application.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @entry_point_config = args[:entry_point_config] if args.key?(:entry_point_config)
          @url = args[:url] if args.key?(:url)
        end
      end
      
      # Response with the list of deployments for the specified Apps Script project.
      class ListDeploymentsResponse
        include Google::Apis::Core::Hashable
      
        # The list of deployments.
        # Corresponds to the JSON property `deployments`
        # @return [Array<Google::Apis::ScriptV1::Deployment>]
        attr_accessor :deployments
      
        # The token that can be used in the next call to get the next page of
        # results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @deployments = args[:deployments] if args.key?(:deployments)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Response with the list of
      # Process resources.
      class ListScriptProcessesResponse
        include Google::Apis::Core::Hashable
      
        # Token for the next page of results. If empty, there are no more pages
        # remaining.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # List of processes matching request parameters.
        # Corresponds to the JSON property `processes`
        # @return [Array<Google::Apis::ScriptV1::GoogleAppsScriptTypeProcess>]
        attr_accessor :processes
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @processes = args[:processes] if args.key?(:processes)
        end
      end
      
      # Response with the list of
      # Process resources.
      class ListUserProcessesResponse
        include Google::Apis::Core::Hashable
      
        # Token for the next page of results. If empty, there are no more pages
        # remaining.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # List of processes matching request parameters.
        # Corresponds to the JSON property `processes`
        # @return [Array<Google::Apis::ScriptV1::GoogleAppsScriptTypeProcess>]
        attr_accessor :processes
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @processes = args[:processes] if args.key?(:processes)
        end
      end
      
      # `ListValue` is a wrapper around a repeated field of values.
      # Based on LustValue at:
      # google3/apps/maestro/api/struct.proto?q=message%5c%20ListValue
      class ListValue
        include Google::Apis::Core::Hashable
      
        # Repeated field of dynamically typed values.
        # Corresponds to the JSON property `values`
        # @return [Array<Google::Apis::ScriptV1::Value>]
        attr_accessor :values
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @values = args[:values] if args.key?(:values)
        end
      end
      
      # Response with the list of the versions for the specified script project.
      class ListVersionsResponse
        include Google::Apis::Core::Hashable
      
        # The token use to fetch the next page of records. if not exist in the
        # response, that means no more versions to list.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The list of versions.
        # Corresponds to the JSON property `versions`
        # @return [Array<Google::Apis::ScriptV1::Version>]
        attr_accessor :versions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @versions = args[:versions] if args.key?(:versions)
        end
      end
      
      # Resource containing usage stats for a given script, based on the supplied
      # filter and mask present in the request.
      class Metrics
        include Google::Apis::Core::Hashable
      
        # Number of active users.
        # Corresponds to the JSON property `activeUsers`
        # @return [Array<Google::Apis::ScriptV1::MetricsValue>]
        attr_accessor :active_users
      
        # Number of failed executions.
        # Corresponds to the JSON property `failedExecutions`
        # @return [Array<Google::Apis::ScriptV1::MetricsValue>]
        attr_accessor :failed_executions
      
        # Number of total executions.
        # Corresponds to the JSON property `totalExecutions`
        # @return [Array<Google::Apis::ScriptV1::MetricsValue>]
        attr_accessor :total_executions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @active_users = args[:active_users] if args.key?(:active_users)
          @failed_executions = args[:failed_executions] if args.key?(:failed_executions)
          @total_executions = args[:total_executions] if args.key?(:total_executions)
        end
      end
      
      # Metrics value that holds number of executions counted.
      class MetricsValue
        include Google::Apis::Core::Hashable
      
        # Required field indicating the end time of the interval.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # Required field indicating the start time of the interval.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        # Indicates the number of executions counted.
        # Corresponds to the JSON property `value`
        # @return [Fixnum]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_time = args[:end_time] if args.key?(:end_time)
          @start_time = args[:start_time] if args.key?(:start_time)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # A representation of an execution of an Apps Script function started with run.
      # The execution response does not arrive until the function finishes executing.
      # The maximum execution runtime is listed in the [Apps Script quotas guide](/
      # apps-script/guides/services/quotas#current_limitations). <p>After execution
      # has started, it can have one of four outcomes:</p> <ul> <li> If the script
      # function returns successfully, the
      # response field contains an
      # ExecutionResponse object
      # with the function's return value in the object's `result` field.</li>
      # <li> If the script function (or Apps Script itself) throws an exception, the
      # error field contains a
      # Status object. The `Status` object's `details`
      # field contains an array with a single
      # ExecutionError object that
      # provides information about the nature of the error.</li>
      # <li> If the execution has not yet completed,
      # the done field is `false` and
      # the neither the `response` nor `error` fields are present.</li>
      # <li> If the `run` call itself fails (for example, because of a
      # malformed request or an authorization error), the method returns an HTTP
      # response code in the 4XX range with a different format for the response
      # body. Client libraries automatically convert a 4XX response into an
      # exception class.</li>
      # </ul>
      class Operation
        include Google::Apis::Core::Hashable
      
        # This field indicates whether the script execution has completed. A completed
        # execution has a populated `response` field containing the ExecutionResponse
        # from function that was executed.
        # Corresponds to the JSON property `done`
        # @return [Boolean]
        attr_accessor :done
        alias_method :done?, :done
      
        # If a `run` call succeeds but the script function (or Apps Script itself)
        # throws an exception, the response body's error field contains this `Status`
        # object.
        # Corresponds to the JSON property `error`
        # @return [Google::Apis::ScriptV1::Status]
        attr_accessor :error
      
        # If the script function returns successfully, this field contains an
        # ExecutionResponse object with the function's return value.
        # Corresponds to the JSON property `response`
        # @return [Hash<String,Object>]
        attr_accessor :response
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @done = args[:done] if args.key?(:done)
          @error = args[:error] if args.key?(:error)
          @response = args[:response] if args.key?(:response)
        end
      end
      
      # The script project resource.
      class Project
        include Google::Apis::Core::Hashable
      
        # When the script was created.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # A simple user profile resource.
        # Corresponds to the JSON property `creator`
        # @return [Google::Apis::ScriptV1::GoogleAppsScriptTypeUser]
        attr_accessor :creator
      
        # A simple user profile resource.
        # Corresponds to the JSON property `lastModifyUser`
        # @return [Google::Apis::ScriptV1::GoogleAppsScriptTypeUser]
        attr_accessor :last_modify_user
      
        # The parent's Drive ID that the script will be attached to. This is usually
        # the ID of a Google Document or Google Sheet. This filed is optional, and
        # if not set, a stand-alone script will be created.
        # Corresponds to the JSON property `parentId`
        # @return [String]
        attr_accessor :parent_id
      
        # The script project's Drive ID.
        # Corresponds to the JSON property `scriptId`
        # @return [String]
        attr_accessor :script_id
      
        # The title for the project.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        # When the script was last updated.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @creator = args[:creator] if args.key?(:creator)
          @last_modify_user = args[:last_modify_user] if args.key?(:last_modify_user)
          @parent_id = args[:parent_id] if args.key?(:parent_id)
          @script_id = args[:script_id] if args.key?(:script_id)
          @title = args[:title] if args.key?(:title)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # The result of an execution
      # Based on ScriptExecutionResult at:
      # google3/apps/maestro/api/frontend_execution_common.proto?q=message%5c%
      # 20ScriptExecutionResult
      class ScriptExecutionResult
        include Google::Apis::Core::Hashable
      
        # `Value` represents a dynamically typed value which is the outcome of an
        # executed script
        # Based on Value at:
        # google3/apps/maestro/api/struct.proto?q=message%5c%20Value
        # Corresponds to the JSON property `returnValue`
        # @return [Google::Apis::ScriptV1::Value]
        attr_accessor :return_value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @return_value = args[:return_value] if args.key?(:return_value)
        end
      end
      
      # A stack trace through the script that shows where the execution failed.
      class ScriptStackTraceElement
        include Google::Apis::Core::Hashable
      
        # The name of the function that failed.
        # Corresponds to the JSON property `function`
        # @return [String]
        attr_accessor :function
      
        # The line number where the script failed.
        # Corresponds to the JSON property `lineNumber`
        # @return [Fixnum]
        attr_accessor :line_number
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @function = args[:function] if args.key?(:function)
          @line_number = args[:line_number] if args.key?(:line_number)
        end
      end
      
      # If a `run` call succeeds but the script function (or Apps Script itself)
      # throws an exception, the response body's error field contains this `Status`
      # object.
      class Status
        include Google::Apis::Core::Hashable
      
        # The status code. For this API, this value either: <ul> <li> 10, indicating a `
        # SCRIPT_TIMEOUT` error,</li> <li> 3, indicating an `INVALID_ARGUMENT` error, or<
        # /li> <li> 1, indicating a `CANCELLED` execution.</li> </ul>
        # Corresponds to the JSON property `code`
        # @return [Fixnum]
        attr_accessor :code
      
        # An array that contains a single ExecutionError object that provides
        # information about the nature of the error.
        # Corresponds to the JSON property `details`
        # @return [Array<Hash<String,Object>>]
        attr_accessor :details
      
        # A developer-facing error message, which is in English. Any user-facing error
        # message is localized and sent in the details field, or localized by the client.
        # Corresponds to the JSON property `message`
        # @return [String]
        attr_accessor :message
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @code = args[:code] if args.key?(:code)
          @details = args[:details] if args.key?(:details)
          @message = args[:message] if args.key?(:message)
        end
      end
      
      # `Struct` represents a structured data value, consisting of fields which map
      # to dynamically typed values.
      # Based on Struct at:
      # google3/apps/maestro/api/struct.proto?q=message%5c%20Struct
      class Struct
        include Google::Apis::Core::Hashable
      
        # Unordered map of dynamically typed values.
        # Corresponds to the JSON property `fields`
        # @return [Hash<String,Google::Apis::ScriptV1::Value>]
        attr_accessor :fields
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @fields = args[:fields] if args.key?(:fields)
        end
      end
      
      # Request with deployment information to update an existing deployment.
      class UpdateDeploymentRequest
        include Google::Apis::Core::Hashable
      
        # Metadata the defines how a deployment is configured.
        # Corresponds to the JSON property `deploymentConfig`
        # @return [Google::Apis::ScriptV1::DeploymentConfig]
        attr_accessor :deployment_config
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @deployment_config = args[:deployment_config] if args.key?(:deployment_config)
        end
      end
      
      # `Value` represents a dynamically typed value which is the outcome of an
      # executed script
      # Based on Value at:
      # google3/apps/maestro/api/struct.proto?q=message%5c%20Value
      class Value
        include Google::Apis::Core::Hashable
      
        # Represents a boolean value.
        # Corresponds to the JSON property `boolValue`
        # @return [Boolean]
        attr_accessor :bool_value
        alias_method :bool_value?, :bool_value
      
        # Represents raw byte values.
        # Corresponds to the JSON property `bytesValue`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :bytes_value
      
        # Represents a date in ms since the epoch.
        # Corresponds to the JSON property `dateValue`
        # @return [Fixnum]
        attr_accessor :date_value
      
        # `ListValue` is a wrapper around a repeated field of values.
        # Based on LustValue at:
        # google3/apps/maestro/api/struct.proto?q=message%5c%20ListValue
        # Corresponds to the JSON property `listValue`
        # @return [Google::Apis::ScriptV1::ListValue]
        attr_accessor :list_value
      
        # Represents a null value.
        # Corresponds to the JSON property `nullValue`
        # @return [String]
        attr_accessor :null_value
      
        # Represents a double value.
        # Corresponds to the JSON property `numberValue`
        # @return [Float]
        attr_accessor :number_value
      
        # Represents a structured proto value.
        # Corresponds to the JSON property `protoValue`
        # @return [Hash<String,Object>]
        attr_accessor :proto_value
      
        # Represents a string value.
        # Corresponds to the JSON property `stringValue`
        # @return [String]
        attr_accessor :string_value
      
        # `Struct` represents a structured data value, consisting of fields which map
        # to dynamically typed values.
        # Based on Struct at:
        # google3/apps/maestro/api/struct.proto?q=message%5c%20Struct
        # Corresponds to the JSON property `structValue`
        # @return [Google::Apis::ScriptV1::Struct]
        attr_accessor :struct_value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bool_value = args[:bool_value] if args.key?(:bool_value)
          @bytes_value = args[:bytes_value] if args.key?(:bytes_value)
          @date_value = args[:date_value] if args.key?(:date_value)
          @list_value = args[:list_value] if args.key?(:list_value)
          @null_value = args[:null_value] if args.key?(:null_value)
          @number_value = args[:number_value] if args.key?(:number_value)
          @proto_value = args[:proto_value] if args.key?(:proto_value)
          @string_value = args[:string_value] if args.key?(:string_value)
          @struct_value = args[:struct_value] if args.key?(:struct_value)
        end
      end
      
      # A resource representing a script project version. A version is a "snapshot"
      # of a script project and is similar to a read-only branched release. When
      # creating deployments, the version to use must be specified.
      class Version
        include Google::Apis::Core::Hashable
      
        # When the version was created.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # The description for this version.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The script project's Drive ID.
        # Corresponds to the JSON property `scriptId`
        # @return [String]
        attr_accessor :script_id
      
        # The incremental ID that is created by Apps Script when a version is
        # created. This is system assigned number and is immutable once created.
        # Corresponds to the JSON property `versionNumber`
        # @return [Fixnum]
        attr_accessor :version_number
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @description = args[:description] if args.key?(:description)
          @script_id = args[:script_id] if args.key?(:script_id)
          @version_number = args[:version_number] if args.key?(:version_number)
        end
      end
    end
  end
end
