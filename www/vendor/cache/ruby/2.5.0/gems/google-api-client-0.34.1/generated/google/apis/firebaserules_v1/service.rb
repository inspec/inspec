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

require 'google/apis/core/base_service'
require 'google/apis/core/json_representation'
require 'google/apis/core/hashable'
require 'google/apis/errors'

module Google
  module Apis
    module FirebaserulesV1
      # Firebase Rules API
      #
      # Creates and manages rules that determine when a Firebase Rules-enabled service
      #  should permit a request.
      #
      # @example
      #    require 'google/apis/firebaserules_v1'
      #
      #    Firebaserules = Google::Apis::FirebaserulesV1 # Alias the module
      #    service = Firebaserules::FirebaseRulesService.new
      #
      # @see https://firebase.google.com/docs/storage/security
      class FirebaseRulesService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://firebaserules.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Test `Source` for syntactic and semantic correctness. Issues present, if
        # any, will be returned to the caller with a description, severity, and
        # source location.
        # The test method may be executed with `Source` or a `Ruleset` name.
        # Passing `Source` is useful for unit testing new rules. Passing a `Ruleset`
        # name is useful for regression testing an existing rule.
        # The following is an example of `Source` that permits users to upload images
        # to a bucket bearing their user id and matching the correct metadata:
        # _*Example*_
        # // Users are allowed to subscribe and unsubscribe to the blog.
        # service firebase.storage `
        # match /users/`userId`/images/`imageName` `
        # allow write: if userId == request.auth.uid
        # && (imageName.matches('*.png$')
        # || imageName.matches('*.jpg$'))
        # && resource.mimeType.matches('^image/')
        # `
        # `
        # @param [String] name
        #   Tests may either provide `source` or a `Ruleset` resource name.
        #   For tests against `source`, the resource name must refer to the project:
        #   Format: `projects/`project_id``
        #   For tests against a `Ruleset`, this must be the `Ruleset` resource name:
        #   Format: `projects/`project_id`/rulesets/`ruleset_id``
        # @param [Google::Apis::FirebaserulesV1::TestRulesetRequest] test_ruleset_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirebaserulesV1::TestRulesetResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirebaserulesV1::TestRulesetResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def test_project_ruleset(name, test_ruleset_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+name}:test', options)
          command.request_representation = Google::Apis::FirebaserulesV1::TestRulesetRequest::Representation
          command.request_object = test_ruleset_request_object
          command.response_representation = Google::Apis::FirebaserulesV1::TestRulesetResponse::Representation
          command.response_class = Google::Apis::FirebaserulesV1::TestRulesetResponse
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Create a `Release`.
        # Release names should reflect the developer's deployment practices. For
        # example, the release name may include the environment name, application
        # name, application version, or any other name meaningful to the developer.
        # Once a `Release` refers to a `Ruleset`, the rules can be enforced by
        # Firebase Rules-enabled services.
        # More than one `Release` may be 'live' concurrently. Consider the following
        # three `Release` names for `projects/foo` and the `Ruleset` to which they
        # refer.
        # Release Name                    | Ruleset Name
        # --------------------------------|-------------
        # projects/foo/releases/prod      | projects/foo/rulesets/uuid123
        # projects/foo/releases/prod/beta | projects/foo/rulesets/uuid123
        # projects/foo/releases/prod/v23  | projects/foo/rulesets/uuid456
        # The table reflects the `Ruleset` rollout in progress. The `prod` and
        # `prod/beta` releases refer to the same `Ruleset`. However, `prod/v23`
        # refers to a new `Ruleset`. The `Ruleset` reference for a `Release` may be
        # updated using the UpdateRelease method.
        # @param [String] name
        #   Resource name for the project which owns this `Release`.
        #   Format: `projects/`project_id``
        # @param [Google::Apis::FirebaserulesV1::Release] release_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirebaserulesV1::Release] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirebaserulesV1::Release]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_release(name, release_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+name}/releases', options)
          command.request_representation = Google::Apis::FirebaserulesV1::Release::Representation
          command.request_object = release_object
          command.response_representation = Google::Apis::FirebaserulesV1::Release::Representation
          command.response_class = Google::Apis::FirebaserulesV1::Release
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Delete a `Release` by resource name.
        # @param [String] name
        #   Resource name for the `Release` to delete.
        #   Format: `projects/`project_id`/releases/`release_id``
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirebaserulesV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirebaserulesV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_release(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/{+name}', options)
          command.response_representation = Google::Apis::FirebaserulesV1::Empty::Representation
          command.response_class = Google::Apis::FirebaserulesV1::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Get a `Release` by name.
        # @param [String] name
        #   Resource name of the `Release`.
        #   Format: `projects/`project_id`/releases/`release_id``
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirebaserulesV1::Release] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirebaserulesV1::Release]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_release(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}', options)
          command.response_representation = Google::Apis::FirebaserulesV1::Release::Representation
          command.response_class = Google::Apis::FirebaserulesV1::Release
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Get the `Release` executable to use when enforcing rules.
        # @param [String] name
        #   Resource name of the `Release`.
        #   Format: `projects/`project_id`/releases/`release_id``
        # @param [String] executable_version
        #   The requested runtime executable version.
        #   Defaults to FIREBASE_RULES_EXECUTABLE_V1.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirebaserulesV1::GetReleaseExecutableResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirebaserulesV1::GetReleaseExecutableResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_release_executable(name, executable_version: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}:getExecutable', options)
          command.response_representation = Google::Apis::FirebaserulesV1::GetReleaseExecutableResponse::Representation
          command.response_class = Google::Apis::FirebaserulesV1::GetReleaseExecutableResponse
          command.params['name'] = name unless name.nil?
          command.query['executableVersion'] = executable_version unless executable_version.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List the `Release` values for a project. This list may optionally be
        # filtered by `Release` name, `Ruleset` name, `TestSuite` name, or any
        # combination thereof.
        # @param [String] name
        #   Resource name for the project.
        #   Format: `projects/`project_id``
        # @param [String] filter
        #   `Release` filter. The list method supports filters with restrictions on the
        #   `Release.name`, `Release.ruleset_name`, and `Release.test_suite_name`.
        #   Example 1: A filter of 'name=prod*' might return `Release`s with names
        #   within 'projects/foo' prefixed with 'prod':
        #   Name                          | Ruleset Name
        #   ------------------------------|-------------
        #   projects/foo/releases/prod    | projects/foo/rulesets/uuid1234
        #   projects/foo/releases/prod/v1 | projects/foo/rulesets/uuid1234
        #   projects/foo/releases/prod/v2 | projects/foo/rulesets/uuid8888
        #   Example 2: A filter of `name=prod* ruleset_name=uuid1234` would return only
        #   `Release` instances for 'projects/foo' with names prefixed with 'prod'
        #   referring to the same `Ruleset` name of 'uuid1234':
        #   Name                          | Ruleset Name
        #   ------------------------------|-------------
        #   projects/foo/releases/prod    | projects/foo/rulesets/1234
        #   projects/foo/releases/prod/v1 | projects/foo/rulesets/1234
        #   In the examples, the filter parameters refer to the search filters are
        #   relative to the project. Fully qualified prefixed may also be used. e.g.
        #   `test_suite_name=projects/foo/testsuites/uuid1`
        # @param [Fixnum] page_size
        #   Page size to load. Maximum of 100. Defaults to 10.
        #   Note: `page_size` is just a hint and the service may choose to load fewer
        #   than `page_size` results due to the size of the output. To traverse all of
        #   the releases, the caller should iterate until the `page_token` on the
        #   response is empty.
        # @param [String] page_token
        #   Next page token for the next batch of `Release` instances.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirebaserulesV1::ListReleasesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirebaserulesV1::ListReleasesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_releases(name, filter: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}/releases', options)
          command.response_representation = Google::Apis::FirebaserulesV1::ListReleasesResponse::Representation
          command.response_class = Google::Apis::FirebaserulesV1::ListReleasesResponse
          command.params['name'] = name unless name.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Update a `Release` via PATCH.
        # Only updates to the `ruleset_name` and `test_suite_name` fields will be
        # honored. `Release` rename is not supported. To create a `Release` use the
        # CreateRelease method.
        # @param [String] name
        #   Resource name for the project which owns this `Release`.
        #   Format: `projects/`project_id``
        # @param [Google::Apis::FirebaserulesV1::UpdateReleaseRequest] update_release_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirebaserulesV1::Release] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirebaserulesV1::Release]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_project_release(name, update_release_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1/{+name}', options)
          command.request_representation = Google::Apis::FirebaserulesV1::UpdateReleaseRequest::Representation
          command.request_object = update_release_request_object
          command.response_representation = Google::Apis::FirebaserulesV1::Release::Representation
          command.response_class = Google::Apis::FirebaserulesV1::Release
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Create a `Ruleset` from `Source`.
        # The `Ruleset` is given a unique generated name which is returned to the
        # caller. `Source` containing syntactic or semantics errors will result in an
        # error response indicating the first error encountered. For a detailed view
        # of `Source` issues, use TestRuleset.
        # @param [String] name
        #   Resource name for Project which owns this `Ruleset`.
        #   Format: `projects/`project_id``
        # @param [Google::Apis::FirebaserulesV1::Ruleset] ruleset_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirebaserulesV1::Ruleset] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirebaserulesV1::Ruleset]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_ruleset(name, ruleset_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+name}/rulesets', options)
          command.request_representation = Google::Apis::FirebaserulesV1::Ruleset::Representation
          command.request_object = ruleset_object
          command.response_representation = Google::Apis::FirebaserulesV1::Ruleset::Representation
          command.response_class = Google::Apis::FirebaserulesV1::Ruleset
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Delete a `Ruleset` by resource name.
        # If the `Ruleset` is referenced by a `Release` the operation will fail.
        # @param [String] name
        #   Resource name for the ruleset to delete.
        #   Format: `projects/`project_id`/rulesets/`ruleset_id``
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirebaserulesV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirebaserulesV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_ruleset(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/{+name}', options)
          command.response_representation = Google::Apis::FirebaserulesV1::Empty::Representation
          command.response_class = Google::Apis::FirebaserulesV1::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Get a `Ruleset` by name including the full `Source` contents.
        # @param [String] name
        #   Resource name for the ruleset to get.
        #   Format: `projects/`project_id`/rulesets/`ruleset_id``
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirebaserulesV1::Ruleset] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirebaserulesV1::Ruleset]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_ruleset(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}', options)
          command.response_representation = Google::Apis::FirebaserulesV1::Ruleset::Representation
          command.response_class = Google::Apis::FirebaserulesV1::Ruleset
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List `Ruleset` metadata only and optionally filter the results by `Ruleset`
        # name.
        # The full `Source` contents of a `Ruleset` may be retrieved with
        # GetRuleset.
        # @param [String] name
        #   Resource name for the project.
        #   Format: `projects/`project_id``
        # @param [String] filter
        #   `Ruleset` filter. The list method supports filters with restrictions on
        #   `Ruleset.name`.
        #   Filters on `Ruleset.create_time` should use the `date` function which
        #   parses strings that conform to the RFC 3339 date/time specifications.
        #   Example: `create_time > date("2017-01-01T00:00:00Z") AND name=UUID-*`
        # @param [Fixnum] page_size
        #   Page size to load. Maximum of 100. Defaults to 10.
        #   Note: `page_size` is just a hint and the service may choose to load less
        #   than `page_size` due to the size of the output. To traverse all of the
        #   releases, caller should iterate until the `page_token` is empty.
        # @param [String] page_token
        #   Next page token for loading the next batch of `Ruleset` instances.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirebaserulesV1::ListRulesetsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirebaserulesV1::ListRulesetsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_rulesets(name, filter: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}/rulesets', options)
          command.response_representation = Google::Apis::FirebaserulesV1::ListRulesetsResponse::Representation
          command.response_class = Google::Apis::FirebaserulesV1::ListRulesetsResponse
          command.params['name'] = name unless name.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end

        protected

        def apply_command_defaults(command)
          command.query['key'] = key unless key.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
        end
      end
    end
  end
end
