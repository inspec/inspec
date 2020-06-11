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
    module ClouddebuggerV2
      
      # An alias to a repo revision.
      class AliasContext
        include Google::Apis::Core::Hashable
      
        # The alias kind.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The alias name.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Represents the breakpoint specification, status and results.
      class Breakpoint
        include Google::Apis::Core::Hashable
      
        # Action that the agent should perform when the code at the
        # breakpoint location is hit.
        # Corresponds to the JSON property `action`
        # @return [String]
        attr_accessor :action
      
        # Condition that triggers the breakpoint.
        # The condition is a compound boolean expression composed using expressions
        # in a programming language at the source location.
        # Corresponds to the JSON property `condition`
        # @return [String]
        attr_accessor :condition
      
        # Time this breakpoint was created by the server in seconds resolution.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Values of evaluated expressions at breakpoint time.
        # The evaluated expressions appear in exactly the same order they
        # are listed in the `expressions` field.
        # The `name` field holds the original expression text, the `value` or
        # `members` field holds the result of the evaluated expression.
        # If the expression cannot be evaluated, the `status` inside the `Variable`
        # will indicate an error and contain the error text.
        # Corresponds to the JSON property `evaluatedExpressions`
        # @return [Array<Google::Apis::ClouddebuggerV2::Variable>]
        attr_accessor :evaluated_expressions
      
        # List of read-only expressions to evaluate at the breakpoint location.
        # The expressions are composed using expressions in the programming language
        # at the source location. If the breakpoint action is `LOG`, the evaluated
        # expressions are included in log statements.
        # Corresponds to the JSON property `expressions`
        # @return [Array<String>]
        attr_accessor :expressions
      
        # Time this breakpoint was finalized as seen by the server in seconds
        # resolution.
        # Corresponds to the JSON property `finalTime`
        # @return [String]
        attr_accessor :final_time
      
        # Breakpoint identifier, unique in the scope of the debuggee.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # When true, indicates that this is a final result and the
        # breakpoint state will not change from here on.
        # Corresponds to the JSON property `isFinalState`
        # @return [Boolean]
        attr_accessor :is_final_state
        alias_method :is_final_state?, :is_final_state
      
        # A set of custom breakpoint properties, populated by the agent, to be
        # displayed to the user.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # Represents a location in the source code.
        # Corresponds to the JSON property `location`
        # @return [Google::Apis::ClouddebuggerV2::SourceLocation]
        attr_accessor :location
      
        # Indicates the severity of the log. Only relevant when action is `LOG`.
        # Corresponds to the JSON property `logLevel`
        # @return [String]
        attr_accessor :log_level
      
        # Only relevant when action is `LOG`. Defines the message to log when
        # the breakpoint hits. The message may include parameter placeholders `$0`,
        # `$1`, etc. These placeholders are replaced with the evaluated value
        # of the appropriate expression. Expressions not referenced in
        # `log_message_format` are not logged.
        # Example: `Message received, id = $0, count = $1` with
        # `expressions` = `[ message.id, message.count ]`.
        # Corresponds to the JSON property `logMessageFormat`
        # @return [String]
        attr_accessor :log_message_format
      
        # The stack at breakpoint time, where stack_frames[0] represents the most
        # recently entered function.
        # Corresponds to the JSON property `stackFrames`
        # @return [Array<Google::Apis::ClouddebuggerV2::StackFrame>]
        attr_accessor :stack_frames
      
        # Represents a contextual status message.
        # The message can indicate an error or informational status, and refer to
        # specific parts of the containing object.
        # For example, the `Breakpoint.status` field can indicate an error referring
        # to the `BREAKPOINT_SOURCE_LOCATION` with the message `Location not found`.
        # Corresponds to the JSON property `status`
        # @return [Google::Apis::ClouddebuggerV2::StatusMessage]
        attr_accessor :status
      
        # E-mail address of the user that created this breakpoint
        # Corresponds to the JSON property `userEmail`
        # @return [String]
        attr_accessor :user_email
      
        # The `variable_table` exists to aid with computation, memory and network
        # traffic optimization.  It enables storing a variable once and reference
        # it from multiple variables, including variables stored in the
        # `variable_table` itself.
        # For example, the same `this` object, which may appear at many levels of
        # the stack, can have all of its data stored once in this table.  The
        # stack frame variables then would hold only a reference to it.
        # The variable `var_table_index` field is an index into this repeated field.
        # The stored objects are nameless and get their name from the referencing
        # variable. The effective variable is a merge of the referencing variable
        # and the referenced variable.
        # Corresponds to the JSON property `variableTable`
        # @return [Array<Google::Apis::ClouddebuggerV2::Variable>]
        attr_accessor :variable_table
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @action = args[:action] if args.key?(:action)
          @condition = args[:condition] if args.key?(:condition)
          @create_time = args[:create_time] if args.key?(:create_time)
          @evaluated_expressions = args[:evaluated_expressions] if args.key?(:evaluated_expressions)
          @expressions = args[:expressions] if args.key?(:expressions)
          @final_time = args[:final_time] if args.key?(:final_time)
          @id = args[:id] if args.key?(:id)
          @is_final_state = args[:is_final_state] if args.key?(:is_final_state)
          @labels = args[:labels] if args.key?(:labels)
          @location = args[:location] if args.key?(:location)
          @log_level = args[:log_level] if args.key?(:log_level)
          @log_message_format = args[:log_message_format] if args.key?(:log_message_format)
          @stack_frames = args[:stack_frames] if args.key?(:stack_frames)
          @status = args[:status] if args.key?(:status)
          @user_email = args[:user_email] if args.key?(:user_email)
          @variable_table = args[:variable_table] if args.key?(:variable_table)
        end
      end
      
      # A CloudRepoSourceContext denotes a particular revision in a cloud
      # repo (a repo hosted by the Google Cloud Platform).
      class CloudRepoSourceContext
        include Google::Apis::Core::Hashable
      
        # An alias to a repo revision.
        # Corresponds to the JSON property `aliasContext`
        # @return [Google::Apis::ClouddebuggerV2::AliasContext]
        attr_accessor :alias_context
      
        # The name of an alias (branch, tag, etc.).
        # Corresponds to the JSON property `aliasName`
        # @return [String]
        attr_accessor :alias_name
      
        # A unique identifier for a cloud repo.
        # Corresponds to the JSON property `repoId`
        # @return [Google::Apis::ClouddebuggerV2::RepoId]
        attr_accessor :repo_id
      
        # A revision ID.
        # Corresponds to the JSON property `revisionId`
        # @return [String]
        attr_accessor :revision_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @alias_context = args[:alias_context] if args.key?(:alias_context)
          @alias_name = args[:alias_name] if args.key?(:alias_name)
          @repo_id = args[:repo_id] if args.key?(:repo_id)
          @revision_id = args[:revision_id] if args.key?(:revision_id)
        end
      end
      
      # A CloudWorkspaceId is a unique identifier for a cloud workspace.
      # A cloud workspace is a place associated with a repo where modified files
      # can be stored before they are committed.
      class CloudWorkspaceId
        include Google::Apis::Core::Hashable
      
        # The unique name of the workspace within the repo.  This is the name
        # chosen by the client in the Source API's CreateWorkspace method.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # A unique identifier for a cloud repo.
        # Corresponds to the JSON property `repoId`
        # @return [Google::Apis::ClouddebuggerV2::RepoId]
        attr_accessor :repo_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @repo_id = args[:repo_id] if args.key?(:repo_id)
        end
      end
      
      # A CloudWorkspaceSourceContext denotes a workspace at a particular snapshot.
      class CloudWorkspaceSourceContext
        include Google::Apis::Core::Hashable
      
        # The ID of the snapshot.
        # An empty snapshot_id refers to the most recent snapshot.
        # Corresponds to the JSON property `snapshotId`
        # @return [String]
        attr_accessor :snapshot_id
      
        # A CloudWorkspaceId is a unique identifier for a cloud workspace.
        # A cloud workspace is a place associated with a repo where modified files
        # can be stored before they are committed.
        # Corresponds to the JSON property `workspaceId`
        # @return [Google::Apis::ClouddebuggerV2::CloudWorkspaceId]
        attr_accessor :workspace_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @snapshot_id = args[:snapshot_id] if args.key?(:snapshot_id)
          @workspace_id = args[:workspace_id] if args.key?(:workspace_id)
        end
      end
      
      # Represents the debugged application. The application may include one or more
      # replicated processes executing the same code. Each of these processes is
      # attached with a debugger agent, carrying out the debugging commands.
      # Agents attached to the same debuggee identify themselves as such by using
      # exactly the same Debuggee message value when registering.
      class Debuggee
        include Google::Apis::Core::Hashable
      
        # Version ID of the agent.
        # Schema: `domain/language-platform/vmajor.minor` (for example
        # `google.com/java-gcp/v1.1`).
        # Corresponds to the JSON property `agentVersion`
        # @return [String]
        attr_accessor :agent_version
      
        # Human readable description of the debuggee.
        # Including a human-readable project name, environment name and version
        # information is recommended.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # References to the locations and revisions of the source code used in the
        # deployed application.
        # Corresponds to the JSON property `extSourceContexts`
        # @return [Array<Google::Apis::ClouddebuggerV2::ExtendedSourceContext>]
        attr_accessor :ext_source_contexts
      
        # Unique identifier for the debuggee generated by the controller service.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # If set to `true`, indicates that the agent should disable itself and
        # detach from the debuggee.
        # Corresponds to the JSON property `isDisabled`
        # @return [Boolean]
        attr_accessor :is_disabled
        alias_method :is_disabled?, :is_disabled
      
        # If set to `true`, indicates that Controller service does not detect any
        # activity from the debuggee agents and the application is possibly stopped.
        # Corresponds to the JSON property `isInactive`
        # @return [Boolean]
        attr_accessor :is_inactive
        alias_method :is_inactive?, :is_inactive
      
        # A set of custom debuggee properties, populated by the agent, to be
        # displayed to the user.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # Project the debuggee is associated with.
        # Use project number or id when registering a Google Cloud Platform project.
        # Corresponds to the JSON property `project`
        # @return [String]
        attr_accessor :project
      
        # References to the locations and revisions of the source code used in the
        # deployed application.
        # Corresponds to the JSON property `sourceContexts`
        # @return [Array<Google::Apis::ClouddebuggerV2::SourceContext>]
        attr_accessor :source_contexts
      
        # Represents a contextual status message.
        # The message can indicate an error or informational status, and refer to
        # specific parts of the containing object.
        # For example, the `Breakpoint.status` field can indicate an error referring
        # to the `BREAKPOINT_SOURCE_LOCATION` with the message `Location not found`.
        # Corresponds to the JSON property `status`
        # @return [Google::Apis::ClouddebuggerV2::StatusMessage]
        attr_accessor :status
      
        # Uniquifier to further distinguish the application.
        # It is possible that different applications might have identical values in
        # the debuggee message, thus, incorrectly identified as a single application
        # by the Controller service. This field adds salt to further distinguish the
        # application. Agents should consider seeding this field with value that
        # identifies the code, binary, configuration and environment.
        # Corresponds to the JSON property `uniquifier`
        # @return [String]
        attr_accessor :uniquifier
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @agent_version = args[:agent_version] if args.key?(:agent_version)
          @description = args[:description] if args.key?(:description)
          @ext_source_contexts = args[:ext_source_contexts] if args.key?(:ext_source_contexts)
          @id = args[:id] if args.key?(:id)
          @is_disabled = args[:is_disabled] if args.key?(:is_disabled)
          @is_inactive = args[:is_inactive] if args.key?(:is_inactive)
          @labels = args[:labels] if args.key?(:labels)
          @project = args[:project] if args.key?(:project)
          @source_contexts = args[:source_contexts] if args.key?(:source_contexts)
          @status = args[:status] if args.key?(:status)
          @uniquifier = args[:uniquifier] if args.key?(:uniquifier)
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
      
      # An ExtendedSourceContext is a SourceContext combined with additional
      # details describing the context.
      class ExtendedSourceContext
        include Google::Apis::Core::Hashable
      
        # A SourceContext is a reference to a tree of files. A SourceContext together
        # with a path point to a unique revision of a single file or directory.
        # Corresponds to the JSON property `context`
        # @return [Google::Apis::ClouddebuggerV2::SourceContext]
        attr_accessor :context
      
        # Labels with user defined metadata.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @context = args[:context] if args.key?(:context)
          @labels = args[:labels] if args.key?(:labels)
        end
      end
      
      # Represents a message with parameters.
      class FormatMessage
        include Google::Apis::Core::Hashable
      
        # Format template for the message. The `format` uses placeholders `$0`,
        # `$1`, etc. to reference parameters. `$$` can be used to denote the `$`
        # character.
        # Examples:
        # *   `Failed to load '$0' which helps debug $1 the first time it
        # is loaded.  Again, $0 is very important.`
        # *   `Please pay $$10 to use $0 instead of $1.`
        # Corresponds to the JSON property `format`
        # @return [String]
        attr_accessor :format
      
        # Optional parameters to be embedded into the message.
        # Corresponds to the JSON property `parameters`
        # @return [Array<String>]
        attr_accessor :parameters
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @format = args[:format] if args.key?(:format)
          @parameters = args[:parameters] if args.key?(:parameters)
        end
      end
      
      # A SourceContext referring to a Gerrit project.
      class GerritSourceContext
        include Google::Apis::Core::Hashable
      
        # An alias to a repo revision.
        # Corresponds to the JSON property `aliasContext`
        # @return [Google::Apis::ClouddebuggerV2::AliasContext]
        attr_accessor :alias_context
      
        # The name of an alias (branch, tag, etc.).
        # Corresponds to the JSON property `aliasName`
        # @return [String]
        attr_accessor :alias_name
      
        # The full project name within the host. Projects may be nested, so
        # "project/subproject" is a valid project name.
        # The "repo name" is hostURI/project.
        # Corresponds to the JSON property `gerritProject`
        # @return [String]
        attr_accessor :gerrit_project
      
        # The URI of a running Gerrit instance.
        # Corresponds to the JSON property `hostUri`
        # @return [String]
        attr_accessor :host_uri
      
        # A revision (commit) ID.
        # Corresponds to the JSON property `revisionId`
        # @return [String]
        attr_accessor :revision_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @alias_context = args[:alias_context] if args.key?(:alias_context)
          @alias_name = args[:alias_name] if args.key?(:alias_name)
          @gerrit_project = args[:gerrit_project] if args.key?(:gerrit_project)
          @host_uri = args[:host_uri] if args.key?(:host_uri)
          @revision_id = args[:revision_id] if args.key?(:revision_id)
        end
      end
      
      # Response for getting breakpoint information.
      class GetBreakpointResponse
        include Google::Apis::Core::Hashable
      
        # Represents the breakpoint specification, status and results.
        # Corresponds to the JSON property `breakpoint`
        # @return [Google::Apis::ClouddebuggerV2::Breakpoint]
        attr_accessor :breakpoint
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @breakpoint = args[:breakpoint] if args.key?(:breakpoint)
        end
      end
      
      # A GitSourceContext denotes a particular revision in a third party Git
      # repository (e.g. GitHub).
      class GitSourceContext
        include Google::Apis::Core::Hashable
      
        # Git commit hash.
        # required.
        # Corresponds to the JSON property `revisionId`
        # @return [String]
        attr_accessor :revision_id
      
        # Git repository URL.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @revision_id = args[:revision_id] if args.key?(:revision_id)
          @url = args[:url] if args.key?(:url)
        end
      end
      
      # Response for listing active breakpoints.
      class ListActiveBreakpointsResponse
        include Google::Apis::Core::Hashable
      
        # List of all active breakpoints.
        # The fields `id` and `location` are guaranteed to be set on each breakpoint.
        # Corresponds to the JSON property `breakpoints`
        # @return [Array<Google::Apis::ClouddebuggerV2::Breakpoint>]
        attr_accessor :breakpoints
      
        # A token that can be used in the next method call to block until
        # the list of breakpoints changes.
        # Corresponds to the JSON property `nextWaitToken`
        # @return [String]
        attr_accessor :next_wait_token
      
        # If set to `true`, indicates that there is no change to the
        # list of active breakpoints and the server-selected timeout has expired.
        # The `breakpoints` field would be empty and should be ignored.
        # Corresponds to the JSON property `waitExpired`
        # @return [Boolean]
        attr_accessor :wait_expired
        alias_method :wait_expired?, :wait_expired
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @breakpoints = args[:breakpoints] if args.key?(:breakpoints)
          @next_wait_token = args[:next_wait_token] if args.key?(:next_wait_token)
          @wait_expired = args[:wait_expired] if args.key?(:wait_expired)
        end
      end
      
      # Response for listing breakpoints.
      class ListBreakpointsResponse
        include Google::Apis::Core::Hashable
      
        # List of breakpoints matching the request.
        # The fields `id` and `location` are guaranteed to be set on each breakpoint.
        # The fields: `stack_frames`, `evaluated_expressions` and `variable_table`
        # are cleared on each breakpoint regardless of its status.
        # Corresponds to the JSON property `breakpoints`
        # @return [Array<Google::Apis::ClouddebuggerV2::Breakpoint>]
        attr_accessor :breakpoints
      
        # A wait token that can be used in the next call to `list` (REST) or
        # `ListBreakpoints` (RPC) to block until the list of breakpoints has changes.
        # Corresponds to the JSON property `nextWaitToken`
        # @return [String]
        attr_accessor :next_wait_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @breakpoints = args[:breakpoints] if args.key?(:breakpoints)
          @next_wait_token = args[:next_wait_token] if args.key?(:next_wait_token)
        end
      end
      
      # Response for listing debuggees.
      class ListDebuggeesResponse
        include Google::Apis::Core::Hashable
      
        # List of debuggees accessible to the calling user.
        # The fields `debuggee.id` and `description` are guaranteed to be set.
        # The `description` field is a human readable field provided by agents and
        # can be displayed to users.
        # Corresponds to the JSON property `debuggees`
        # @return [Array<Google::Apis::ClouddebuggerV2::Debuggee>]
        attr_accessor :debuggees
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @debuggees = args[:debuggees] if args.key?(:debuggees)
        end
      end
      
      # Selects a repo using a Google Cloud Platform project ID
      # (e.g. winged-cargo-31) and a repo name within that project.
      class ProjectRepoId
        include Google::Apis::Core::Hashable
      
        # The ID of the project.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # The name of the repo. Leave empty for the default repo.
        # Corresponds to the JSON property `repoName`
        # @return [String]
        attr_accessor :repo_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @project_id = args[:project_id] if args.key?(:project_id)
          @repo_name = args[:repo_name] if args.key?(:repo_name)
        end
      end
      
      # Request to register a debuggee.
      class RegisterDebuggeeRequest
        include Google::Apis::Core::Hashable
      
        # Represents the debugged application. The application may include one or more
        # replicated processes executing the same code. Each of these processes is
        # attached with a debugger agent, carrying out the debugging commands.
        # Agents attached to the same debuggee identify themselves as such by using
        # exactly the same Debuggee message value when registering.
        # Corresponds to the JSON property `debuggee`
        # @return [Google::Apis::ClouddebuggerV2::Debuggee]
        attr_accessor :debuggee
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @debuggee = args[:debuggee] if args.key?(:debuggee)
        end
      end
      
      # Response for registering a debuggee.
      class RegisterDebuggeeResponse
        include Google::Apis::Core::Hashable
      
        # Represents the debugged application. The application may include one or more
        # replicated processes executing the same code. Each of these processes is
        # attached with a debugger agent, carrying out the debugging commands.
        # Agents attached to the same debuggee identify themselves as such by using
        # exactly the same Debuggee message value when registering.
        # Corresponds to the JSON property `debuggee`
        # @return [Google::Apis::ClouddebuggerV2::Debuggee]
        attr_accessor :debuggee
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @debuggee = args[:debuggee] if args.key?(:debuggee)
        end
      end
      
      # A unique identifier for a cloud repo.
      class RepoId
        include Google::Apis::Core::Hashable
      
        # Selects a repo using a Google Cloud Platform project ID
        # (e.g. winged-cargo-31) and a repo name within that project.
        # Corresponds to the JSON property `projectRepoId`
        # @return [Google::Apis::ClouddebuggerV2::ProjectRepoId]
        attr_accessor :project_repo_id
      
        # A server-assigned, globally unique identifier.
        # Corresponds to the JSON property `uid`
        # @return [String]
        attr_accessor :uid
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @project_repo_id = args[:project_repo_id] if args.key?(:project_repo_id)
          @uid = args[:uid] if args.key?(:uid)
        end
      end
      
      # Response for setting a breakpoint.
      class SetBreakpointResponse
        include Google::Apis::Core::Hashable
      
        # Represents the breakpoint specification, status and results.
        # Corresponds to the JSON property `breakpoint`
        # @return [Google::Apis::ClouddebuggerV2::Breakpoint]
        attr_accessor :breakpoint
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @breakpoint = args[:breakpoint] if args.key?(:breakpoint)
        end
      end
      
      # A SourceContext is a reference to a tree of files. A SourceContext together
      # with a path point to a unique revision of a single file or directory.
      class SourceContext
        include Google::Apis::Core::Hashable
      
        # A CloudRepoSourceContext denotes a particular revision in a cloud
        # repo (a repo hosted by the Google Cloud Platform).
        # Corresponds to the JSON property `cloudRepo`
        # @return [Google::Apis::ClouddebuggerV2::CloudRepoSourceContext]
        attr_accessor :cloud_repo
      
        # A CloudWorkspaceSourceContext denotes a workspace at a particular snapshot.
        # Corresponds to the JSON property `cloudWorkspace`
        # @return [Google::Apis::ClouddebuggerV2::CloudWorkspaceSourceContext]
        attr_accessor :cloud_workspace
      
        # A SourceContext referring to a Gerrit project.
        # Corresponds to the JSON property `gerrit`
        # @return [Google::Apis::ClouddebuggerV2::GerritSourceContext]
        attr_accessor :gerrit
      
        # A GitSourceContext denotes a particular revision in a third party Git
        # repository (e.g. GitHub).
        # Corresponds to the JSON property `git`
        # @return [Google::Apis::ClouddebuggerV2::GitSourceContext]
        attr_accessor :git
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cloud_repo = args[:cloud_repo] if args.key?(:cloud_repo)
          @cloud_workspace = args[:cloud_workspace] if args.key?(:cloud_workspace)
          @gerrit = args[:gerrit] if args.key?(:gerrit)
          @git = args[:git] if args.key?(:git)
        end
      end
      
      # Represents a location in the source code.
      class SourceLocation
        include Google::Apis::Core::Hashable
      
        # Column within a line. The first column in a line as the value `1`.
        # Agents that do not support setting breakpoints on specific columns ignore
        # this field.
        # Corresponds to the JSON property `column`
        # @return [Fixnum]
        attr_accessor :column
      
        # Line inside the file. The first line in the file has the value `1`.
        # Corresponds to the JSON property `line`
        # @return [Fixnum]
        attr_accessor :line
      
        # Path to the source file within the source context of the target binary.
        # Corresponds to the JSON property `path`
        # @return [String]
        attr_accessor :path
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @column = args[:column] if args.key?(:column)
          @line = args[:line] if args.key?(:line)
          @path = args[:path] if args.key?(:path)
        end
      end
      
      # Represents a stack frame context.
      class StackFrame
        include Google::Apis::Core::Hashable
      
        # Set of arguments passed to this function.
        # Note that this might not be populated for all stack frames.
        # Corresponds to the JSON property `arguments`
        # @return [Array<Google::Apis::ClouddebuggerV2::Variable>]
        attr_accessor :arguments
      
        # Demangled function name at the call site.
        # Corresponds to the JSON property `function`
        # @return [String]
        attr_accessor :function
      
        # Set of local variables at the stack frame location.
        # Note that this might not be populated for all stack frames.
        # Corresponds to the JSON property `locals`
        # @return [Array<Google::Apis::ClouddebuggerV2::Variable>]
        attr_accessor :locals
      
        # Represents a location in the source code.
        # Corresponds to the JSON property `location`
        # @return [Google::Apis::ClouddebuggerV2::SourceLocation]
        attr_accessor :location
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @arguments = args[:arguments] if args.key?(:arguments)
          @function = args[:function] if args.key?(:function)
          @locals = args[:locals] if args.key?(:locals)
          @location = args[:location] if args.key?(:location)
        end
      end
      
      # Represents a contextual status message.
      # The message can indicate an error or informational status, and refer to
      # specific parts of the containing object.
      # For example, the `Breakpoint.status` field can indicate an error referring
      # to the `BREAKPOINT_SOURCE_LOCATION` with the message `Location not found`.
      class StatusMessage
        include Google::Apis::Core::Hashable
      
        # Represents a message with parameters.
        # Corresponds to the JSON property `description`
        # @return [Google::Apis::ClouddebuggerV2::FormatMessage]
        attr_accessor :description
      
        # Distinguishes errors from informational messages.
        # Corresponds to the JSON property `isError`
        # @return [Boolean]
        attr_accessor :is_error
        alias_method :is_error?, :is_error
      
        # Reference to which the message applies.
        # Corresponds to the JSON property `refersTo`
        # @return [String]
        attr_accessor :refers_to
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @is_error = args[:is_error] if args.key?(:is_error)
          @refers_to = args[:refers_to] if args.key?(:refers_to)
        end
      end
      
      # Request to update an active breakpoint.
      class UpdateActiveBreakpointRequest
        include Google::Apis::Core::Hashable
      
        # Represents the breakpoint specification, status and results.
        # Corresponds to the JSON property `breakpoint`
        # @return [Google::Apis::ClouddebuggerV2::Breakpoint]
        attr_accessor :breakpoint
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @breakpoint = args[:breakpoint] if args.key?(:breakpoint)
        end
      end
      
      # Response for updating an active breakpoint.
      # The message is defined to allow future extensions.
      class UpdateActiveBreakpointResponse
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Represents a variable or an argument possibly of a compound object type.
      # Note how the following variables are represented:
      # 1) A simple variable:
      # int x = 5
      # ` name: "x", value: "5", type: "int" `  // Captured variable
      # 2) A compound object:
      # struct T `
      # int m1;
      # int m2;
      # `;
      # T x = ` 3, 7 `;
      # `  // Captured variable
      # name: "x",
      # type: "T",
      # members ` name: "m1", value: "3", type: "int" `,
      # members ` name: "m2", value: "7", type: "int" `
      # `
      # 3) A pointer where the pointee was captured:
      # T x = ` 3, 7 `;
      # T* p = &x;
      # `   // Captured variable
      # name: "p",
      # type: "T*",
      # value: "0x00500500",
      # members ` name: "m1", value: "3", type: "int" `,
      # members ` name: "m2", value: "7", type: "int" `
      # `
      # 4) A pointer where the pointee was not captured:
      # T* p = new T;
      # `   // Captured variable
      # name: "p",
      # type: "T*",
      # value: "0x00400400"
      # status ` is_error: true, description ` format: "unavailable" ` `
      # `
      # The status should describe the reason for the missing value,
      # such as `<optimized out>`, `<inaccessible>`, `<pointers limit reached>`.
      # Note that a null pointer should not have members.
      # 5) An unnamed value:
      # int* p = new int(7);
      # `   // Captured variable
      # name: "p",
      # value: "0x00500500",
      # type: "int*",
      # members ` value: "7", type: "int" ` `
      # 6) An unnamed pointer where the pointee was not captured:
      # int* p = new int(7);
      # int** pp = &p;
      # `  // Captured variable
      # name: "pp",
      # value: "0x00500500",
      # type: "int**",
      # members `
      # value: "0x00400400",
      # type: "int*"
      # status `
      # is_error: true,
      # description: ` format: "unavailable" ` `
      # `
      # `
      # `
      # To optimize computation, memory and network traffic, variables that
      # repeat in the output multiple times can be stored once in a shared
      # variable table and be referenced using the `var_table_index` field.  The
      # variables stored in the shared table are nameless and are essentially
      # a partition of the complete variable. To reconstruct the complete
      # variable, merge the referencing variable with the referenced variable.
      # When using the shared variable table, the following variables:
      # T x = ` 3, 7 `;
      # T* p = &x;
      # T& r = x;
      # ` name: "x", var_table_index: 3, type: "T" `  // Captured variables
      # ` name: "p", value "0x00500500", type="T*", var_table_index: 3 `
      # ` name: "r", type="T&", var_table_index: 3 `
      # `  // Shared variable table entry #3:
      # members ` name: "m1", value: "3", type: "int" `,
      # members ` name: "m2", value: "7", type: "int" `
      # `
      # Note that the pointer address is stored with the referencing variable
      # and not with the referenced variable. This allows the referenced variable
      # to be shared between pointers and references.
      # The type field is optional. The debugger agent may or may not support it.
      class Variable
        include Google::Apis::Core::Hashable
      
        # Members contained or pointed to by the variable.
        # Corresponds to the JSON property `members`
        # @return [Array<Google::Apis::ClouddebuggerV2::Variable>]
        attr_accessor :members
      
        # Name of the variable, if any.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Represents a contextual status message.
        # The message can indicate an error or informational status, and refer to
        # specific parts of the containing object.
        # For example, the `Breakpoint.status` field can indicate an error referring
        # to the `BREAKPOINT_SOURCE_LOCATION` with the message `Location not found`.
        # Corresponds to the JSON property `status`
        # @return [Google::Apis::ClouddebuggerV2::StatusMessage]
        attr_accessor :status
      
        # Variable type (e.g. `MyClass`). If the variable is split with
        # `var_table_index`, `type` goes next to `value`. The interpretation of
        # a type is agent specific. It is recommended to include the dynamic type
        # rather than a static type of an object.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # Simple value of the variable.
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        # Reference to a variable in the shared variable table. More than
        # one variable can reference the same variable in the table. The
        # `var_table_index` field is an index into `variable_table` in Breakpoint.
        # Corresponds to the JSON property `varTableIndex`
        # @return [Fixnum]
        attr_accessor :var_table_index
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @members = args[:members] if args.key?(:members)
          @name = args[:name] if args.key?(:name)
          @status = args[:status] if args.key?(:status)
          @type = args[:type] if args.key?(:type)
          @value = args[:value] if args.key?(:value)
          @var_table_index = args[:var_table_index] if args.key?(:var_table_index)
        end
      end
    end
  end
end
