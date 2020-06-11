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
      
      class Arg
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Empty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class File
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FunctionCall
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FunctionMock
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GetReleaseExecutableResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Issue
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListReleasesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListRulesetsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Release
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Result
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Ruleset
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Source
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SourcePosition
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TestCase
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TestResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TestRulesetRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TestRulesetResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TestSuite
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UpdateReleaseRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VisitedExpression
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Arg
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :any_value, as: 'anyValue', class: Google::Apis::FirebaserulesV1::Empty, decorator: Google::Apis::FirebaserulesV1::Empty::Representation
      
          property :exact_value, as: 'exactValue'
        end
      end
      
      class Empty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class File
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :content, as: 'content'
          property :fingerprint, :base64 => true, as: 'fingerprint'
          property :name, as: 'name'
        end
      end
      
      class FunctionCall
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :args, as: 'args'
          property :function, as: 'function'
        end
      end
      
      class FunctionMock
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :args, as: 'args', class: Google::Apis::FirebaserulesV1::Arg, decorator: Google::Apis::FirebaserulesV1::Arg::Representation
      
          property :function, as: 'function'
          property :result, as: 'result', class: Google::Apis::FirebaserulesV1::Result, decorator: Google::Apis::FirebaserulesV1::Result::Representation
      
        end
      end
      
      class GetReleaseExecutableResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :executable, :base64 => true, as: 'executable'
          property :executable_version, as: 'executableVersion'
          property :language, as: 'language'
          property :ruleset_name, as: 'rulesetName'
          property :sync_time, as: 'syncTime'
          property :update_time, as: 'updateTime'
        end
      end
      
      class Issue
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :severity, as: 'severity'
          property :source_position, as: 'sourcePosition', class: Google::Apis::FirebaserulesV1::SourcePosition, decorator: Google::Apis::FirebaserulesV1::SourcePosition::Representation
      
        end
      end
      
      class ListReleasesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :releases, as: 'releases', class: Google::Apis::FirebaserulesV1::Release, decorator: Google::Apis::FirebaserulesV1::Release::Representation
      
        end
      end
      
      class ListRulesetsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :rulesets, as: 'rulesets', class: Google::Apis::FirebaserulesV1::Ruleset, decorator: Google::Apis::FirebaserulesV1::Ruleset::Representation
      
        end
      end
      
      class Release
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_time, as: 'createTime'
          property :name, as: 'name'
          property :ruleset_name, as: 'rulesetName'
          property :update_time, as: 'updateTime'
        end
      end
      
      class Result
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :undefined, as: 'undefined', class: Google::Apis::FirebaserulesV1::Empty, decorator: Google::Apis::FirebaserulesV1::Empty::Representation
      
          property :value, as: 'value'
        end
      end
      
      class Ruleset
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_time, as: 'createTime'
          property :name, as: 'name'
          property :source, as: 'source', class: Google::Apis::FirebaserulesV1::Source, decorator: Google::Apis::FirebaserulesV1::Source::Representation
      
        end
      end
      
      class Source
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :files, as: 'files', class: Google::Apis::FirebaserulesV1::File, decorator: Google::Apis::FirebaserulesV1::File::Representation
      
        end
      end
      
      class SourcePosition
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :column, as: 'column'
          property :file_name, as: 'fileName'
          property :line, as: 'line'
        end
      end
      
      class TestCase
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :expectation, as: 'expectation'
          collection :function_mocks, as: 'functionMocks', class: Google::Apis::FirebaserulesV1::FunctionMock, decorator: Google::Apis::FirebaserulesV1::FunctionMock::Representation
      
          property :path_encoding, as: 'pathEncoding'
          property :request, as: 'request'
          property :resource, as: 'resource'
        end
      end
      
      class TestResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :debug_messages, as: 'debugMessages'
          property :error_position, as: 'errorPosition', class: Google::Apis::FirebaserulesV1::SourcePosition, decorator: Google::Apis::FirebaserulesV1::SourcePosition::Representation
      
          collection :function_calls, as: 'functionCalls', class: Google::Apis::FirebaserulesV1::FunctionCall, decorator: Google::Apis::FirebaserulesV1::FunctionCall::Representation
      
          property :state, as: 'state'
          collection :visited_expressions, as: 'visitedExpressions', class: Google::Apis::FirebaserulesV1::VisitedExpression, decorator: Google::Apis::FirebaserulesV1::VisitedExpression::Representation
      
        end
      end
      
      class TestRulesetRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :source, as: 'source', class: Google::Apis::FirebaserulesV1::Source, decorator: Google::Apis::FirebaserulesV1::Source::Representation
      
          property :test_suite, as: 'testSuite', class: Google::Apis::FirebaserulesV1::TestSuite, decorator: Google::Apis::FirebaserulesV1::TestSuite::Representation
      
        end
      end
      
      class TestRulesetResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :issues, as: 'issues', class: Google::Apis::FirebaserulesV1::Issue, decorator: Google::Apis::FirebaserulesV1::Issue::Representation
      
          collection :test_results, as: 'testResults', class: Google::Apis::FirebaserulesV1::TestResult, decorator: Google::Apis::FirebaserulesV1::TestResult::Representation
      
        end
      end
      
      class TestSuite
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :test_cases, as: 'testCases', class: Google::Apis::FirebaserulesV1::TestCase, decorator: Google::Apis::FirebaserulesV1::TestCase::Representation
      
        end
      end
      
      class UpdateReleaseRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :release, as: 'release', class: Google::Apis::FirebaserulesV1::Release, decorator: Google::Apis::FirebaserulesV1::Release::Representation
      
          property :update_mask, as: 'updateMask'
        end
      end
      
      class VisitedExpression
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :source_position, as: 'sourcePosition', class: Google::Apis::FirebaserulesV1::SourcePosition, decorator: Google::Apis::FirebaserulesV1::SourcePosition::Representation
      
          property :value, as: 'value'
        end
      end
    end
  end
end
