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
    module FirebaserulesV1
      
      # Arg matchers for the mock function.
      class Arg
        include Google::Apis::Core::Hashable
      
        # A generic empty message that you can re-use to avoid defining duplicated
        # empty messages in your APIs. A typical example is to use it as the request
        # or the response type of an API method. For instance:
        # service Foo `
        # rpc Bar(google.protobuf.Empty) returns (google.protobuf.Empty);
        # `
        # The JSON representation for `Empty` is empty JSON object ````.
        # Corresponds to the JSON property `anyValue`
        # @return [Google::Apis::FirebaserulesV1::Empty]
        attr_accessor :any_value
      
        # Argument exactly matches value provided.
        # Corresponds to the JSON property `exactValue`
        # @return [Object]
        attr_accessor :exact_value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @any_value = args[:any_value] if args.key?(:any_value)
          @exact_value = args[:exact_value] if args.key?(:exact_value)
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
      
      # `File` containing source content.
      class File
        include Google::Apis::Core::Hashable
      
        # Textual Content.
        # Corresponds to the JSON property `content`
        # @return [String]
        attr_accessor :content
      
        # Fingerprint (e.g. github sha) associated with the `File`.
        # Corresponds to the JSON property `fingerprint`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :fingerprint
      
        # File name.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content = args[:content] if args.key?(:content)
          @fingerprint = args[:fingerprint] if args.key?(:fingerprint)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Represents a service-defined function call that was invoked during test
      # execution.
      class FunctionCall
        include Google::Apis::Core::Hashable
      
        # The arguments that were provided to the function.
        # Corresponds to the JSON property `args`
        # @return [Array<Object>]
        attr_accessor :args
      
        # Name of the function invoked.
        # Corresponds to the JSON property `function`
        # @return [String]
        attr_accessor :function
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @args = args[:args] if args.key?(:args)
          @function = args[:function] if args.key?(:function)
        end
      end
      
      # Mock function definition.
      # Mocks must refer to a function declared by the target service. The type of
      # the function args and result will be inferred at test time. If either the
      # arg or result values are not compatible with function type declaration, the
      # request will be considered invalid.
      # More than one `FunctionMock` may be provided for a given function name so
      # long as the `Arg` matchers are distinct. There may be only one function
      # for a given overload where all `Arg` values are `Arg.any_value`.
      class FunctionMock
        include Google::Apis::Core::Hashable
      
        # The list of `Arg` values to match. The order in which the arguments are
        # provided is the order in which they must appear in the function
        # invocation.
        # Corresponds to the JSON property `args`
        # @return [Array<Google::Apis::FirebaserulesV1::Arg>]
        attr_accessor :args
      
        # The name of the function.
        # The function name must match one provided by a service declaration.
        # Corresponds to the JSON property `function`
        # @return [String]
        attr_accessor :function
      
        # Possible result values from the function mock invocation.
        # Corresponds to the JSON property `result`
        # @return [Google::Apis::FirebaserulesV1::Result]
        attr_accessor :result
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @args = args[:args] if args.key?(:args)
          @function = args[:function] if args.key?(:function)
          @result = args[:result] if args.key?(:result)
        end
      end
      
      # The response for FirebaseRulesService.GetReleaseExecutable
      class GetReleaseExecutableResponse
        include Google::Apis::Core::Hashable
      
        # Executable view of the `Ruleset` referenced by the `Release`.
        # Corresponds to the JSON property `executable`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :executable
      
        # The Rules runtime version of the executable.
        # Corresponds to the JSON property `executableVersion`
        # @return [String]
        attr_accessor :executable_version
      
        # `Language` used to generate the executable bytes.
        # Corresponds to the JSON property `language`
        # @return [String]
        attr_accessor :language
      
        # `Ruleset` name associated with the `Release` executable.
        # Corresponds to the JSON property `rulesetName`
        # @return [String]
        attr_accessor :ruleset_name
      
        # Optional, indicates the freshness of the result. The response is
        # guaranteed to be the latest within an interval up to the
        # sync_time (inclusive).
        # Corresponds to the JSON property `syncTime`
        # @return [String]
        attr_accessor :sync_time
      
        # Timestamp for the most recent `Release.update_time`.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @executable = args[:executable] if args.key?(:executable)
          @executable_version = args[:executable_version] if args.key?(:executable_version)
          @language = args[:language] if args.key?(:language)
          @ruleset_name = args[:ruleset_name] if args.key?(:ruleset_name)
          @sync_time = args[:sync_time] if args.key?(:sync_time)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Issues include warnings, errors, and deprecation notices.
      class Issue
        include Google::Apis::Core::Hashable
      
        # Short error description.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The severity of the issue.
        # Corresponds to the JSON property `severity`
        # @return [String]
        attr_accessor :severity
      
        # Position in the `Source` content including its line, column number, and an
        # index of the `File` in the `Source` message. Used for debug purposes.
        # Corresponds to the JSON property `sourcePosition`
        # @return [Google::Apis::FirebaserulesV1::SourcePosition]
        attr_accessor :source_position
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @severity = args[:severity] if args.key?(:severity)
          @source_position = args[:source_position] if args.key?(:source_position)
        end
      end
      
      # The response for FirebaseRulesService.ListReleases.
      class ListReleasesResponse
        include Google::Apis::Core::Hashable
      
        # The pagination token to retrieve the next page of results. If the value is
        # empty, no further results remain.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # List of `Release` instances.
        # Corresponds to the JSON property `releases`
        # @return [Array<Google::Apis::FirebaserulesV1::Release>]
        attr_accessor :releases
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @releases = args[:releases] if args.key?(:releases)
        end
      end
      
      # The response for FirebaseRulesService.ListRulesets.
      class ListRulesetsResponse
        include Google::Apis::Core::Hashable
      
        # The pagination token to retrieve the next page of results. If the value is
        # empty, no further results remain.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # List of `Ruleset` instances.
        # Corresponds to the JSON property `rulesets`
        # @return [Array<Google::Apis::FirebaserulesV1::Ruleset>]
        attr_accessor :rulesets
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @rulesets = args[:rulesets] if args.key?(:rulesets)
        end
      end
      
      # `Release` is a named reference to a `Ruleset`. Once a `Release` refers to a
      # `Ruleset`, rules-enabled services will be able to enforce the `Ruleset`.
      class Release
        include Google::Apis::Core::Hashable
      
        # Time the release was created.
        # Output only.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Resource name for the `Release`.
        # `Release` names may be structured `app1/prod/v2` or flat `app1_prod_v2`
        # which affords developers a great deal of flexibility in mapping the name
        # to the style that best fits their existing development practices. For
        # example, a name could refer to an environment, an app, a version, or some
        # combination of three.
        # In the table below, for the project name `projects/foo`, the following
        # relative release paths show how flat and structured names might be chosen
        # to match a desired development / deployment strategy.
        # Use Case     | Flat Name           | Structured Name
        # -------------|---------------------|----------------
        # Environments | releases/qa         | releases/qa
        # Apps         | releases/app1_qa    | releases/app1/qa
        # Versions     | releases/app1_v2_qa | releases/app1/v2/qa
        # The delimiter between the release name path elements can be almost anything
        # and it should work equally well with the release name list filter, but in
        # many ways the structured paths provide a clearer picture of the
        # relationship between `Release` instances.
        # Format: `projects/`project_id`/releases/`release_id``
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Name of the `Ruleset` referred to by this `Release`. The `Ruleset` must
        # exist the `Release` to be created.
        # Corresponds to the JSON property `rulesetName`
        # @return [String]
        attr_accessor :ruleset_name
      
        # Time the release was updated.
        # Output only.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @name = args[:name] if args.key?(:name)
          @ruleset_name = args[:ruleset_name] if args.key?(:ruleset_name)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Possible result values from the function mock invocation.
      class Result
        include Google::Apis::Core::Hashable
      
        # A generic empty message that you can re-use to avoid defining duplicated
        # empty messages in your APIs. A typical example is to use it as the request
        # or the response type of an API method. For instance:
        # service Foo `
        # rpc Bar(google.protobuf.Empty) returns (google.protobuf.Empty);
        # `
        # The JSON representation for `Empty` is empty JSON object ````.
        # Corresponds to the JSON property `undefined`
        # @return [Google::Apis::FirebaserulesV1::Empty]
        attr_accessor :undefined
      
        # The result is an actual value. The type of the value must match that
        # of the type declared by the service.
        # Corresponds to the JSON property `value`
        # @return [Object]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @undefined = args[:undefined] if args.key?(:undefined)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # `Ruleset` is an immutable copy of `Source` with a globally unique identifier
      # and a creation time.
      class Ruleset
        include Google::Apis::Core::Hashable
      
        # Time the `Ruleset` was created.
        # Output only.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Name of the `Ruleset`. The ruleset_id is auto generated by the service.
        # Format: `projects/`project_id`/rulesets/`ruleset_id``
        # Output only.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # `Source` is one or more `File` messages comprising a logical set of rules.
        # Corresponds to the JSON property `source`
        # @return [Google::Apis::FirebaserulesV1::Source]
        attr_accessor :source
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @name = args[:name] if args.key?(:name)
          @source = args[:source] if args.key?(:source)
        end
      end
      
      # `Source` is one or more `File` messages comprising a logical set of rules.
      class Source
        include Google::Apis::Core::Hashable
      
        # `File` set constituting the `Source` bundle.
        # Corresponds to the JSON property `files`
        # @return [Array<Google::Apis::FirebaserulesV1::File>]
        attr_accessor :files
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @files = args[:files] if args.key?(:files)
        end
      end
      
      # Position in the `Source` content including its line, column number, and an
      # index of the `File` in the `Source` message. Used for debug purposes.
      class SourcePosition
        include Google::Apis::Core::Hashable
      
        # First column on the source line associated with the source fragment.
        # Corresponds to the JSON property `column`
        # @return [Fixnum]
        attr_accessor :column
      
        # Name of the `File`.
        # Corresponds to the JSON property `fileName`
        # @return [String]
        attr_accessor :file_name
      
        # Line number of the source fragment. 1-based.
        # Corresponds to the JSON property `line`
        # @return [Fixnum]
        attr_accessor :line
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @column = args[:column] if args.key?(:column)
          @file_name = args[:file_name] if args.key?(:file_name)
          @line = args[:line] if args.key?(:line)
        end
      end
      
      # `TestCase` messages provide the request context and an expectation as to
      # whether the given context will be allowed or denied. Test cases may specify
      # the `request`, `resource`, and `function_mocks` to mock a function call to
      # a service-provided function.
      # The `request` object represents context present at request-time.
      # The `resource` is the value of the target resource as it appears in
      # persistent storage before the request is executed.
      class TestCase
        include Google::Apis::Core::Hashable
      
        # Test expectation.
        # Corresponds to the JSON property `expectation`
        # @return [String]
        attr_accessor :expectation
      
        # Optional function mocks for service-defined functions. If not set, any
        # service defined function is expected to return an error, which may or may
        # not influence the test outcome.
        # Corresponds to the JSON property `functionMocks`
        # @return [Array<Google::Apis::FirebaserulesV1::FunctionMock>]
        attr_accessor :function_mocks
      
        # Specifies whether paths (such as request.path) are encoded and how.
        # Corresponds to the JSON property `pathEncoding`
        # @return [String]
        attr_accessor :path_encoding
      
        # Request context.
        # The exact format of the request context is service-dependent. See the
        # appropriate service documentation for information about the supported
        # fields and types on the request. Minimally, all services support the
        # following fields and types:
        # Request field  | Type
        # ---------------|-----------------
        # auth.uid       | `string`
        # auth.token     | `map<string, string>`
        # headers        | `map<string, string>`
        # method         | `string`
        # params         | `map<string, string>`
        # path           | `string`
        # time           | `google.protobuf.Timestamp`
        # If the request value is not well-formed for the service, the request will
        # be rejected as an invalid argument.
        # Corresponds to the JSON property `request`
        # @return [Object]
        attr_accessor :request
      
        # Optional resource value as it appears in persistent storage before the
        # request is fulfilled.
        # The resource type depends on the `request.path` value.
        # Corresponds to the JSON property `resource`
        # @return [Object]
        attr_accessor :resource
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @expectation = args[:expectation] if args.key?(:expectation)
          @function_mocks = args[:function_mocks] if args.key?(:function_mocks)
          @path_encoding = args[:path_encoding] if args.key?(:path_encoding)
          @request = args[:request] if args.key?(:request)
          @resource = args[:resource] if args.key?(:resource)
        end
      end
      
      # Test result message containing the state of the test as well as a
      # description and source position for test failures.
      class TestResult
        include Google::Apis::Core::Hashable
      
        # Debug messages related to test execution issues encountered during
        # evaluation.
        # Debug messages may be related to too many or too few invocations of
        # function mocks or to runtime errors that occur during evaluation.
        # For example: ```Unable to read variable [name: "resource"]```
        # Corresponds to the JSON property `debugMessages`
        # @return [Array<String>]
        attr_accessor :debug_messages
      
        # Position in the `Source` content including its line, column number, and an
        # index of the `File` in the `Source` message. Used for debug purposes.
        # Corresponds to the JSON property `errorPosition`
        # @return [Google::Apis::FirebaserulesV1::SourcePosition]
        attr_accessor :error_position
      
        # The set of function calls made to service-defined methods.
        # Function calls are included in the order in which they are encountered
        # during evaluation, are provided for both mocked and unmocked functions,
        # and included on the response regardless of the test `state`.
        # Corresponds to the JSON property `functionCalls`
        # @return [Array<Google::Apis::FirebaserulesV1::FunctionCall>]
        attr_accessor :function_calls
      
        # State of the test.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # The set of visited permission expressions for a given test. This returns
        # the positions and evaluation results of all visited permission
        # expressions which were relevant to the test case, e.g.
        # ```
        # match /path `
        # allow read if: <expr>
        # `
        # ```
        # For a detailed report of the intermediate evaluation states, see the
        # `expression_reports` field
        # Corresponds to the JSON property `visitedExpressions`
        # @return [Array<Google::Apis::FirebaserulesV1::VisitedExpression>]
        attr_accessor :visited_expressions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @debug_messages = args[:debug_messages] if args.key?(:debug_messages)
          @error_position = args[:error_position] if args.key?(:error_position)
          @function_calls = args[:function_calls] if args.key?(:function_calls)
          @state = args[:state] if args.key?(:state)
          @visited_expressions = args[:visited_expressions] if args.key?(:visited_expressions)
        end
      end
      
      # The request for FirebaseRulesService.TestRuleset.
      class TestRulesetRequest
        include Google::Apis::Core::Hashable
      
        # `Source` is one or more `File` messages comprising a logical set of rules.
        # Corresponds to the JSON property `source`
        # @return [Google::Apis::FirebaserulesV1::Source]
        attr_accessor :source
      
        # `TestSuite` is a collection of `TestCase` instances that validate the logical
        # correctness of a `Ruleset`. The `TestSuite` may be referenced in-line within
        # a `TestRuleset` invocation or as part of a `Release` object as a pre-release
        # check.
        # Corresponds to the JSON property `testSuite`
        # @return [Google::Apis::FirebaserulesV1::TestSuite]
        attr_accessor :test_suite
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @source = args[:source] if args.key?(:source)
          @test_suite = args[:test_suite] if args.key?(:test_suite)
        end
      end
      
      # The response for FirebaseRulesService.TestRuleset.
      class TestRulesetResponse
        include Google::Apis::Core::Hashable
      
        # Syntactic and semantic `Source` issues of varying severity. Issues of
        # `ERROR` severity will prevent tests from executing.
        # Corresponds to the JSON property `issues`
        # @return [Array<Google::Apis::FirebaserulesV1::Issue>]
        attr_accessor :issues
      
        # The set of test results given the test cases in the `TestSuite`.
        # The results will appear in the same order as the test cases appear in the
        # `TestSuite`.
        # Corresponds to the JSON property `testResults`
        # @return [Array<Google::Apis::FirebaserulesV1::TestResult>]
        attr_accessor :test_results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @issues = args[:issues] if args.key?(:issues)
          @test_results = args[:test_results] if args.key?(:test_results)
        end
      end
      
      # `TestSuite` is a collection of `TestCase` instances that validate the logical
      # correctness of a `Ruleset`. The `TestSuite` may be referenced in-line within
      # a `TestRuleset` invocation or as part of a `Release` object as a pre-release
      # check.
      class TestSuite
        include Google::Apis::Core::Hashable
      
        # Collection of test cases associated with the `TestSuite`.
        # Corresponds to the JSON property `testCases`
        # @return [Array<Google::Apis::FirebaserulesV1::TestCase>]
        attr_accessor :test_cases
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @test_cases = args[:test_cases] if args.key?(:test_cases)
        end
      end
      
      # The request for FirebaseRulesService.UpdateReleasePatch.
      class UpdateReleaseRequest
        include Google::Apis::Core::Hashable
      
        # `Release` is a named reference to a `Ruleset`. Once a `Release` refers to a
        # `Ruleset`, rules-enabled services will be able to enforce the `Ruleset`.
        # Corresponds to the JSON property `release`
        # @return [Google::Apis::FirebaserulesV1::Release]
        attr_accessor :release
      
        # Specifies which fields to update.
        # Corresponds to the JSON property `updateMask`
        # @return [String]
        attr_accessor :update_mask
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @release = args[:release] if args.key?(:release)
          @update_mask = args[:update_mask] if args.key?(:update_mask)
        end
      end
      
      # Store the position and access outcome for an expression visited in rules.
      class VisitedExpression
        include Google::Apis::Core::Hashable
      
        # Position in the `Source` content including its line, column number, and an
        # index of the `File` in the `Source` message. Used for debug purposes.
        # Corresponds to the JSON property `sourcePosition`
        # @return [Google::Apis::FirebaserulesV1::SourcePosition]
        attr_accessor :source_position
      
        # The evaluated value for the visited expression, e.g. true/false
        # Corresponds to the JSON property `value`
        # @return [Object]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @source_position = args[:source_position] if args.key?(:source_position)
          @value = args[:value] if args.key?(:value)
        end
      end
    end
  end
end
