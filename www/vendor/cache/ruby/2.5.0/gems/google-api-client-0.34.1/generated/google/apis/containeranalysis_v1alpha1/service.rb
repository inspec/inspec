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
    module ContaineranalysisV1alpha1
      # Container Analysis API
      #
      # An implementation of the Grafeas API, which stores, and enables querying and
      #  retrieval of critical metadata about all of your software artifacts.
      #
      # @example
      #    require 'google/apis/containeranalysis_v1alpha1'
      #
      #    Containeranalysis = Google::Apis::ContaineranalysisV1alpha1 # Alias the module
      #    service = Containeranalysis::ContainerAnalysisService.new
      #
      # @see https://cloud.google.com/container-analysis/api/reference/rest/
      class ContainerAnalysisService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://containeranalysis.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Creates a new `Note`.
        # @param [String] parent
        #   This field contains the project Id for example:
        #   "projects/`project_id`
        # @param [Google::Apis::ContaineranalysisV1alpha1::Note] note_object
        # @param [String] name
        #   The name of the project.
        #   Should be of the form "providers/`provider_id`".
        #   @Deprecated
        # @param [String] note_id
        #   The ID to use for this note.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContaineranalysisV1alpha1::Note] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1alpha1::Note]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_note(parent, note_object = nil, name: nil, note_id: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1alpha1/{+parent}/notes', options)
          command.request_representation = Google::Apis::ContaineranalysisV1alpha1::Note::Representation
          command.request_object = note_object
          command.response_representation = Google::Apis::ContaineranalysisV1alpha1::Note::Representation
          command.response_class = Google::Apis::ContaineranalysisV1alpha1::Note
          command.params['parent'] = parent unless parent.nil?
          command.query['name'] = name unless name.nil?
          command.query['noteId'] = note_id unless note_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes the given `Note` from the system.
        # @param [String] name
        #   The name of the note in the form of
        #   "providers/`provider_id`/notes/`NOTE_ID`"
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContaineranalysisV1alpha1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1alpha1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_note(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1alpha1/{+name}', options)
          command.response_representation = Google::Apis::ContaineranalysisV1alpha1::Empty::Representation
          command.response_class = Google::Apis::ContaineranalysisV1alpha1::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns the requested `Note`.
        # @param [String] name
        #   The name of the note in the form of
        #   "providers/`provider_id`/notes/`NOTE_ID`"
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContaineranalysisV1alpha1::Note] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1alpha1::Note]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_note(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha1/{+name}', options)
          command.response_representation = Google::Apis::ContaineranalysisV1alpha1::Note::Representation
          command.response_class = Google::Apis::ContaineranalysisV1alpha1::Note
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the access control policy for a note or an `Occurrence` resource.
        # Requires `containeranalysis.notes.setIamPolicy` or
        # `containeranalysis.occurrences.setIamPolicy` permission if the resource is
        # a note or occurrence, respectively.
        # Attempting to call this method on a resource without the required
        # permission will result in a `PERMISSION_DENIED` error. Attempting to call
        # this method on a non-existent resource will result in a `NOT_FOUND` error
        # if the user has list permission on the project, or a `PERMISSION_DENIED`
        # error otherwise. The resource takes the following formats:
        # `projects/`PROJECT_ID`/occurrences/`OCCURRENCE_ID`` for occurrences and
        # projects/`PROJECT_ID`/notes/`NOTE_ID` for notes
        # @param [String] resource
        #   REQUIRED: The resource for which the policy is being requested.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Google::Apis::ContaineranalysisV1alpha1::GetIamPolicyRequest] get_iam_policy_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContaineranalysisV1alpha1::Policy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1alpha1::Policy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_note_iam_policy(resource, get_iam_policy_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1alpha1/{+resource}:getIamPolicy', options)
          command.request_representation = Google::Apis::ContaineranalysisV1alpha1::GetIamPolicyRequest::Representation
          command.request_object = get_iam_policy_request_object
          command.response_representation = Google::Apis::ContaineranalysisV1alpha1::Policy::Representation
          command.response_class = Google::Apis::ContaineranalysisV1alpha1::Policy
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all `Notes` for a given project.
        # @param [String] parent
        #   This field contains the project Id for example: "projects/`PROJECT_ID`".
        # @param [String] filter
        #   The filter expression.
        # @param [String] name
        #   The name field will contain the project Id for example:
        #   "providers/`provider_id`
        #   @Deprecated
        # @param [Fixnum] page_size
        #   Number of notes to return in the list.
        # @param [String] page_token
        #   Token to provide to skip to a particular spot in the list.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContaineranalysisV1alpha1::ListNotesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1alpha1::ListNotesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_notes(parent, filter: nil, name: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha1/{+parent}/notes', options)
          command.response_representation = Google::Apis::ContaineranalysisV1alpha1::ListNotesResponse::Representation
          command.response_class = Google::Apis::ContaineranalysisV1alpha1::ListNotesResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['name'] = name unless name.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing `Note`.
        # @param [String] name
        #   The name of the note.
        #   Should be of the form "projects/`provider_id`/notes/`note_id`".
        # @param [Google::Apis::ContaineranalysisV1alpha1::Note] note_object
        # @param [String] update_mask
        #   The fields to update.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContaineranalysisV1alpha1::Note] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1alpha1::Note]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_project_note(name, note_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1alpha1/{+name}', options)
          command.request_representation = Google::Apis::ContaineranalysisV1alpha1::Note::Representation
          command.request_object = note_object
          command.response_representation = Google::Apis::ContaineranalysisV1alpha1::Note::Representation
          command.response_class = Google::Apis::ContaineranalysisV1alpha1::Note
          command.params['name'] = name unless name.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Sets the access control policy on the specified `Note` or `Occurrence`.
        # Requires `containeranalysis.notes.setIamPolicy` or
        # `containeranalysis.occurrences.setIamPolicy` permission if the resource is
        # a `Note` or an `Occurrence`, respectively.
        # Attempting to call this method without these permissions will result in a `
        # `PERMISSION_DENIED` error.
        # Attempting to call this method on a non-existent resource will result in a
        # `NOT_FOUND` error if the user has `containeranalysis.notes.list` permission
        # on a `Note` or `containeranalysis.occurrences.list` on an `Occurrence`, or
        # a `PERMISSION_DENIED` error otherwise. The resource takes the following
        # formats: `projects/`projectid`/occurrences/`occurrenceid`` for occurrences
        # and projects/`projectid`/notes/`noteid` for notes
        # @param [String] resource
        #   REQUIRED: The resource for which the policy is being specified.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Google::Apis::ContaineranalysisV1alpha1::SetIamPolicyRequest] set_iam_policy_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContaineranalysisV1alpha1::Policy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1alpha1::Policy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def set_project_note_iam_policy(resource, set_iam_policy_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1alpha1/{+resource}:setIamPolicy', options)
          command.request_representation = Google::Apis::ContaineranalysisV1alpha1::SetIamPolicyRequest::Representation
          command.request_object = set_iam_policy_request_object
          command.response_representation = Google::Apis::ContaineranalysisV1alpha1::Policy::Representation
          command.response_class = Google::Apis::ContaineranalysisV1alpha1::Policy
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns the permissions that a caller has on the specified note or
        # occurrence resource. Requires list permission on the project (for example,
        # "storage.objects.list" on the containing bucket for testing permission of
        # an object). Attempting to call this method on a non-existent resource will
        # result in a `NOT_FOUND` error if the user has list permission on the
        # project, or a `PERMISSION_DENIED` error otherwise. The resource takes the
        # following formats: `projects/`PROJECT_ID`/occurrences/`OCCURRENCE_ID`` for
        # `Occurrences` and `projects/`PROJECT_ID`/notes/`NOTE_ID`` for `Notes`
        # @param [String] resource
        #   REQUIRED: The resource for which the policy detail is being requested.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Google::Apis::ContaineranalysisV1alpha1::TestIamPermissionsRequest] test_iam_permissions_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContaineranalysisV1alpha1::TestIamPermissionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1alpha1::TestIamPermissionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def test_project_note_iam_permissions(resource, test_iam_permissions_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1alpha1/{+resource}:testIamPermissions', options)
          command.request_representation = Google::Apis::ContaineranalysisV1alpha1::TestIamPermissionsRequest::Representation
          command.request_object = test_iam_permissions_request_object
          command.response_representation = Google::Apis::ContaineranalysisV1alpha1::TestIamPermissionsResponse::Representation
          command.response_class = Google::Apis::ContaineranalysisV1alpha1::TestIamPermissionsResponse
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists `Occurrences` referencing the specified `Note`. Use this method to
        # get all occurrences referencing your `Note` across all your customer
        # projects.
        # @param [String] name
        #   The name field will contain the note name for example:
        #   "provider/`provider_id`/notes/`note_id`"
        # @param [String] filter
        #   The filter expression.
        # @param [Fixnum] page_size
        #   Number of notes to return in the list.
        # @param [String] page_token
        #   Token to provide to skip to a particular spot in the list.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContaineranalysisV1alpha1::ListNoteOccurrencesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1alpha1::ListNoteOccurrencesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_note_occurrences(name, filter: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha1/{+name}/occurrences', options)
          command.response_representation = Google::Apis::ContaineranalysisV1alpha1::ListNoteOccurrencesResponse::Representation
          command.response_class = Google::Apis::ContaineranalysisV1alpha1::ListNoteOccurrencesResponse
          command.params['name'] = name unless name.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new `Occurrence`. Use this method to create `Occurrences`
        # for a resource.
        # @param [String] parent
        #   This field contains the project Id for example: "projects/`project_id`"
        # @param [Google::Apis::ContaineranalysisV1alpha1::Occurrence] occurrence_object
        # @param [String] name
        #   The name of the project.  Should be of the form "projects/`project_id`".
        #   @Deprecated
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContaineranalysisV1alpha1::Occurrence] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1alpha1::Occurrence]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_occurrence(parent, occurrence_object = nil, name: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1alpha1/{+parent}/occurrences', options)
          command.request_representation = Google::Apis::ContaineranalysisV1alpha1::Occurrence::Representation
          command.request_object = occurrence_object
          command.response_representation = Google::Apis::ContaineranalysisV1alpha1::Occurrence::Representation
          command.response_class = Google::Apis::ContaineranalysisV1alpha1::Occurrence
          command.params['parent'] = parent unless parent.nil?
          command.query['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes the given `Occurrence` from the system. Use this when
        # an `Occurrence` is no longer applicable for the given resource.
        # @param [String] name
        #   The name of the occurrence in the form of
        #   "projects/`project_id`/occurrences/`OCCURRENCE_ID`"
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContaineranalysisV1alpha1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1alpha1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_occurrence(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1alpha1/{+name}', options)
          command.response_representation = Google::Apis::ContaineranalysisV1alpha1::Empty::Representation
          command.response_class = Google::Apis::ContaineranalysisV1alpha1::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns the requested `Occurrence`.
        # @param [String] name
        #   The name of the occurrence of the form
        #   "projects/`project_id`/occurrences/`OCCURRENCE_ID`"
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContaineranalysisV1alpha1::Occurrence] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1alpha1::Occurrence]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_occurrence(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha1/{+name}', options)
          command.response_representation = Google::Apis::ContaineranalysisV1alpha1::Occurrence::Representation
          command.response_class = Google::Apis::ContaineranalysisV1alpha1::Occurrence
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the access control policy for a note or an `Occurrence` resource.
        # Requires `containeranalysis.notes.setIamPolicy` or
        # `containeranalysis.occurrences.setIamPolicy` permission if the resource is
        # a note or occurrence, respectively.
        # Attempting to call this method on a resource without the required
        # permission will result in a `PERMISSION_DENIED` error. Attempting to call
        # this method on a non-existent resource will result in a `NOT_FOUND` error
        # if the user has list permission on the project, or a `PERMISSION_DENIED`
        # error otherwise. The resource takes the following formats:
        # `projects/`PROJECT_ID`/occurrences/`OCCURRENCE_ID`` for occurrences and
        # projects/`PROJECT_ID`/notes/`NOTE_ID` for notes
        # @param [String] resource
        #   REQUIRED: The resource for which the policy is being requested.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Google::Apis::ContaineranalysisV1alpha1::GetIamPolicyRequest] get_iam_policy_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContaineranalysisV1alpha1::Policy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1alpha1::Policy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_occurrence_iam_policy(resource, get_iam_policy_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1alpha1/{+resource}:getIamPolicy', options)
          command.request_representation = Google::Apis::ContaineranalysisV1alpha1::GetIamPolicyRequest::Representation
          command.request_object = get_iam_policy_request_object
          command.response_representation = Google::Apis::ContaineranalysisV1alpha1::Policy::Representation
          command.response_class = Google::Apis::ContaineranalysisV1alpha1::Policy
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the `Note` attached to the given `Occurrence`.
        # @param [String] name
        #   The name of the occurrence in the form
        #   "projects/`project_id`/occurrences/`OCCURRENCE_ID`"
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContaineranalysisV1alpha1::Note] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1alpha1::Note]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_occurrence_notes(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha1/{+name}/notes', options)
          command.response_representation = Google::Apis::ContaineranalysisV1alpha1::Note::Representation
          command.response_class = Google::Apis::ContaineranalysisV1alpha1::Note
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a summary of the number and severity of occurrences.
        # @param [String] parent
        #   This contains the project Id for example: projects/`project_id`
        # @param [String] filter
        #   The filter expression.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContaineranalysisV1alpha1::GetVulnzOccurrencesSummaryResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1alpha1::GetVulnzOccurrencesSummaryResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_occurrence_vulnerability_summary(parent, filter: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha1/{+parent}/occurrences:vulnerabilitySummary', options)
          command.response_representation = Google::Apis::ContaineranalysisV1alpha1::GetVulnzOccurrencesSummaryResponse::Representation
          command.response_class = Google::Apis::ContaineranalysisV1alpha1::GetVulnzOccurrencesSummaryResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists active `Occurrences` for a given project matching the filters.
        # @param [String] parent
        #   This contains the project Id for example: projects/`project_id`.
        # @param [String] filter
        #   The filter expression.
        # @param [String] kind
        #   The kind of occurrences to filter on.
        # @param [String] name
        #   The name field contains the project Id. For example:
        #   "projects/`project_id`
        #   @Deprecated
        # @param [Fixnum] page_size
        #   Number of occurrences to return in the list.
        # @param [String] page_token
        #   Token to provide to skip to a particular spot in the list.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContaineranalysisV1alpha1::ListOccurrencesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1alpha1::ListOccurrencesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_occurrences(parent, filter: nil, kind: nil, name: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha1/{+parent}/occurrences', options)
          command.response_representation = Google::Apis::ContaineranalysisV1alpha1::ListOccurrencesResponse::Representation
          command.response_class = Google::Apis::ContaineranalysisV1alpha1::ListOccurrencesResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['kind'] = kind unless kind.nil?
          command.query['name'] = name unless name.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing occurrence.
        # @param [String] name
        #   The name of the occurrence.
        #   Should be of the form "projects/`project_id`/occurrences/`OCCURRENCE_ID`".
        # @param [Google::Apis::ContaineranalysisV1alpha1::Occurrence] occurrence_object
        # @param [String] update_mask
        #   The fields to update.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContaineranalysisV1alpha1::Occurrence] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1alpha1::Occurrence]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_project_occurrence(name, occurrence_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1alpha1/{+name}', options)
          command.request_representation = Google::Apis::ContaineranalysisV1alpha1::Occurrence::Representation
          command.request_object = occurrence_object
          command.response_representation = Google::Apis::ContaineranalysisV1alpha1::Occurrence::Representation
          command.response_class = Google::Apis::ContaineranalysisV1alpha1::Occurrence
          command.params['name'] = name unless name.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Sets the access control policy on the specified `Note` or `Occurrence`.
        # Requires `containeranalysis.notes.setIamPolicy` or
        # `containeranalysis.occurrences.setIamPolicy` permission if the resource is
        # a `Note` or an `Occurrence`, respectively.
        # Attempting to call this method without these permissions will result in a `
        # `PERMISSION_DENIED` error.
        # Attempting to call this method on a non-existent resource will result in a
        # `NOT_FOUND` error if the user has `containeranalysis.notes.list` permission
        # on a `Note` or `containeranalysis.occurrences.list` on an `Occurrence`, or
        # a `PERMISSION_DENIED` error otherwise. The resource takes the following
        # formats: `projects/`projectid`/occurrences/`occurrenceid`` for occurrences
        # and projects/`projectid`/notes/`noteid` for notes
        # @param [String] resource
        #   REQUIRED: The resource for which the policy is being specified.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Google::Apis::ContaineranalysisV1alpha1::SetIamPolicyRequest] set_iam_policy_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContaineranalysisV1alpha1::Policy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1alpha1::Policy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def set_occurrence_iam_policy(resource, set_iam_policy_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1alpha1/{+resource}:setIamPolicy', options)
          command.request_representation = Google::Apis::ContaineranalysisV1alpha1::SetIamPolicyRequest::Representation
          command.request_object = set_iam_policy_request_object
          command.response_representation = Google::Apis::ContaineranalysisV1alpha1::Policy::Representation
          command.response_class = Google::Apis::ContaineranalysisV1alpha1::Policy
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns the permissions that a caller has on the specified note or
        # occurrence resource. Requires list permission on the project (for example,
        # "storage.objects.list" on the containing bucket for testing permission of
        # an object). Attempting to call this method on a non-existent resource will
        # result in a `NOT_FOUND` error if the user has list permission on the
        # project, or a `PERMISSION_DENIED` error otherwise. The resource takes the
        # following formats: `projects/`PROJECT_ID`/occurrences/`OCCURRENCE_ID`` for
        # `Occurrences` and `projects/`PROJECT_ID`/notes/`NOTE_ID`` for `Notes`
        # @param [String] resource
        #   REQUIRED: The resource for which the policy detail is being requested.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Google::Apis::ContaineranalysisV1alpha1::TestIamPermissionsRequest] test_iam_permissions_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContaineranalysisV1alpha1::TestIamPermissionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1alpha1::TestIamPermissionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def test_occurrence_iam_permissions(resource, test_iam_permissions_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1alpha1/{+resource}:testIamPermissions', options)
          command.request_representation = Google::Apis::ContaineranalysisV1alpha1::TestIamPermissionsRequest::Representation
          command.request_object = test_iam_permissions_request_object
          command.response_representation = Google::Apis::ContaineranalysisV1alpha1::TestIamPermissionsResponse::Representation
          command.response_class = Google::Apis::ContaineranalysisV1alpha1::TestIamPermissionsResponse
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new `Operation`.
        # @param [String] parent
        #   The project Id that this operation should be created under.
        # @param [Google::Apis::ContaineranalysisV1alpha1::CreateOperationRequest] create_operation_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContaineranalysisV1alpha1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1alpha1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_operation(parent, create_operation_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1alpha1/{+parent}/operations', options)
          command.request_representation = Google::Apis::ContaineranalysisV1alpha1::CreateOperationRequest::Representation
          command.request_object = create_operation_request_object
          command.response_representation = Google::Apis::ContaineranalysisV1alpha1::Operation::Representation
          command.response_class = Google::Apis::ContaineranalysisV1alpha1::Operation
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing operation returns an error if operation
        # does not exist. The only valid operations are to update mark the done bit
        # change the result.
        # @param [String] name
        #   The name of the Operation.
        #   Should be of the form "projects/`provider_id`/operations/`operation_id`".
        # @param [Google::Apis::ContaineranalysisV1alpha1::UpdateOperationRequest] update_operation_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContaineranalysisV1alpha1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1alpha1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_project_operation(name, update_operation_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1alpha1/{+name}', options)
          command.request_representation = Google::Apis::ContaineranalysisV1alpha1::UpdateOperationRequest::Representation
          command.request_object = update_operation_request_object
          command.response_representation = Google::Apis::ContaineranalysisV1alpha1::Operation::Representation
          command.response_class = Google::Apis::ContaineranalysisV1alpha1::Operation
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a specific scan configuration for a project.
        # @param [String] name
        #   The name of the ScanConfig in the form
        #   projects/`project_id`/scanConfigs/`scan_config_id`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContaineranalysisV1alpha1::ScanConfig] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1alpha1::ScanConfig]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_scan_config(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha1/{+name}', options)
          command.response_representation = Google::Apis::ContaineranalysisV1alpha1::ScanConfig::Representation
          command.response_class = Google::Apis::ContaineranalysisV1alpha1::ScanConfig
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists scan configurations for a project.
        # @param [String] parent
        #   This containers the project Id i.e.: projects/`project_id`
        # @param [String] filter
        #   The filter expression.
        # @param [Fixnum] page_size
        #   The number of items to return.
        # @param [String] page_token
        #   The page token to use for the next request.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContaineranalysisV1alpha1::ListScanConfigsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1alpha1::ListScanConfigsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_scan_configs(parent, filter: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha1/{+parent}/scanConfigs', options)
          command.response_representation = Google::Apis::ContaineranalysisV1alpha1::ListScanConfigsResponse::Representation
          command.response_class = Google::Apis::ContaineranalysisV1alpha1::ListScanConfigsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the scan configuration to a new value.
        # @param [String] name
        #   The scan config to update of the form
        #   projects/`project_id`/scanConfigs/`scan_config_id`.
        # @param [Google::Apis::ContaineranalysisV1alpha1::ScanConfig] scan_config_object
        # @param [String] update_mask
        #   The fields to update.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContaineranalysisV1alpha1::ScanConfig] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1alpha1::ScanConfig]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_project_scan_config(name, scan_config_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1alpha1/{+name}', options)
          command.request_representation = Google::Apis::ContaineranalysisV1alpha1::ScanConfig::Representation
          command.request_object = scan_config_object
          command.response_representation = Google::Apis::ContaineranalysisV1alpha1::ScanConfig::Representation
          command.response_class = Google::Apis::ContaineranalysisV1alpha1::ScanConfig
          command.params['name'] = name unless name.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new `Note`.
        # @param [String] name
        #   The name of the project.
        #   Should be of the form "providers/`provider_id`".
        #   @Deprecated
        # @param [Google::Apis::ContaineranalysisV1alpha1::Note] note_object
        # @param [String] note_id
        #   The ID to use for this note.
        # @param [String] parent
        #   This field contains the project Id for example:
        #   "projects/`project_id`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContaineranalysisV1alpha1::Note] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1alpha1::Note]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_provider_note(name, note_object = nil, note_id: nil, parent: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1alpha1/{+name}/notes', options)
          command.request_representation = Google::Apis::ContaineranalysisV1alpha1::Note::Representation
          command.request_object = note_object
          command.response_representation = Google::Apis::ContaineranalysisV1alpha1::Note::Representation
          command.response_class = Google::Apis::ContaineranalysisV1alpha1::Note
          command.params['name'] = name unless name.nil?
          command.query['noteId'] = note_id unless note_id.nil?
          command.query['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes the given `Note` from the system.
        # @param [String] name
        #   The name of the note in the form of
        #   "providers/`provider_id`/notes/`NOTE_ID`"
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContaineranalysisV1alpha1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1alpha1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_provider_note(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1alpha1/{+name}', options)
          command.response_representation = Google::Apis::ContaineranalysisV1alpha1::Empty::Representation
          command.response_class = Google::Apis::ContaineranalysisV1alpha1::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns the requested `Note`.
        # @param [String] name
        #   The name of the note in the form of
        #   "providers/`provider_id`/notes/`NOTE_ID`"
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContaineranalysisV1alpha1::Note] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1alpha1::Note]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_provider_note(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha1/{+name}', options)
          command.response_representation = Google::Apis::ContaineranalysisV1alpha1::Note::Representation
          command.response_class = Google::Apis::ContaineranalysisV1alpha1::Note
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the access control policy for a note or an `Occurrence` resource.
        # Requires `containeranalysis.notes.setIamPolicy` or
        # `containeranalysis.occurrences.setIamPolicy` permission if the resource is
        # a note or occurrence, respectively.
        # Attempting to call this method on a resource without the required
        # permission will result in a `PERMISSION_DENIED` error. Attempting to call
        # this method on a non-existent resource will result in a `NOT_FOUND` error
        # if the user has list permission on the project, or a `PERMISSION_DENIED`
        # error otherwise. The resource takes the following formats:
        # `projects/`PROJECT_ID`/occurrences/`OCCURRENCE_ID`` for occurrences and
        # projects/`PROJECT_ID`/notes/`NOTE_ID` for notes
        # @param [String] resource
        #   REQUIRED: The resource for which the policy is being requested.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Google::Apis::ContaineranalysisV1alpha1::GetIamPolicyRequest] get_iam_policy_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContaineranalysisV1alpha1::Policy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1alpha1::Policy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_provider_note_iam_policy(resource, get_iam_policy_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1alpha1/{+resource}:getIamPolicy', options)
          command.request_representation = Google::Apis::ContaineranalysisV1alpha1::GetIamPolicyRequest::Representation
          command.request_object = get_iam_policy_request_object
          command.response_representation = Google::Apis::ContaineranalysisV1alpha1::Policy::Representation
          command.response_class = Google::Apis::ContaineranalysisV1alpha1::Policy
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all `Notes` for a given project.
        # @param [String] name
        #   The name field will contain the project Id for example:
        #   "providers/`provider_id`
        #   @Deprecated
        # @param [String] filter
        #   The filter expression.
        # @param [Fixnum] page_size
        #   Number of notes to return in the list.
        # @param [String] page_token
        #   Token to provide to skip to a particular spot in the list.
        # @param [String] parent
        #   This field contains the project Id for example: "projects/`PROJECT_ID`".
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContaineranalysisV1alpha1::ListNotesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1alpha1::ListNotesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_provider_notes(name, filter: nil, page_size: nil, page_token: nil, parent: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha1/{+name}/notes', options)
          command.response_representation = Google::Apis::ContaineranalysisV1alpha1::ListNotesResponse::Representation
          command.response_class = Google::Apis::ContaineranalysisV1alpha1::ListNotesResponse
          command.params['name'] = name unless name.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing `Note`.
        # @param [String] name
        #   The name of the note.
        #   Should be of the form "projects/`provider_id`/notes/`note_id`".
        # @param [Google::Apis::ContaineranalysisV1alpha1::Note] note_object
        # @param [String] update_mask
        #   The fields to update.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContaineranalysisV1alpha1::Note] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1alpha1::Note]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_provider_note(name, note_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1alpha1/{+name}', options)
          command.request_representation = Google::Apis::ContaineranalysisV1alpha1::Note::Representation
          command.request_object = note_object
          command.response_representation = Google::Apis::ContaineranalysisV1alpha1::Note::Representation
          command.response_class = Google::Apis::ContaineranalysisV1alpha1::Note
          command.params['name'] = name unless name.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Sets the access control policy on the specified `Note` or `Occurrence`.
        # Requires `containeranalysis.notes.setIamPolicy` or
        # `containeranalysis.occurrences.setIamPolicy` permission if the resource is
        # a `Note` or an `Occurrence`, respectively.
        # Attempting to call this method without these permissions will result in a `
        # `PERMISSION_DENIED` error.
        # Attempting to call this method on a non-existent resource will result in a
        # `NOT_FOUND` error if the user has `containeranalysis.notes.list` permission
        # on a `Note` or `containeranalysis.occurrences.list` on an `Occurrence`, or
        # a `PERMISSION_DENIED` error otherwise. The resource takes the following
        # formats: `projects/`projectid`/occurrences/`occurrenceid`` for occurrences
        # and projects/`projectid`/notes/`noteid` for notes
        # @param [String] resource
        #   REQUIRED: The resource for which the policy is being specified.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Google::Apis::ContaineranalysisV1alpha1::SetIamPolicyRequest] set_iam_policy_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContaineranalysisV1alpha1::Policy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1alpha1::Policy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def set_provider_note_iam_policy(resource, set_iam_policy_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1alpha1/{+resource}:setIamPolicy', options)
          command.request_representation = Google::Apis::ContaineranalysisV1alpha1::SetIamPolicyRequest::Representation
          command.request_object = set_iam_policy_request_object
          command.response_representation = Google::Apis::ContaineranalysisV1alpha1::Policy::Representation
          command.response_class = Google::Apis::ContaineranalysisV1alpha1::Policy
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns the permissions that a caller has on the specified note or
        # occurrence resource. Requires list permission on the project (for example,
        # "storage.objects.list" on the containing bucket for testing permission of
        # an object). Attempting to call this method on a non-existent resource will
        # result in a `NOT_FOUND` error if the user has list permission on the
        # project, or a `PERMISSION_DENIED` error otherwise. The resource takes the
        # following formats: `projects/`PROJECT_ID`/occurrences/`OCCURRENCE_ID`` for
        # `Occurrences` and `projects/`PROJECT_ID`/notes/`NOTE_ID`` for `Notes`
        # @param [String] resource
        #   REQUIRED: The resource for which the policy detail is being requested.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Google::Apis::ContaineranalysisV1alpha1::TestIamPermissionsRequest] test_iam_permissions_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContaineranalysisV1alpha1::TestIamPermissionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1alpha1::TestIamPermissionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def test_provider_note_iam_permissions(resource, test_iam_permissions_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1alpha1/{+resource}:testIamPermissions', options)
          command.request_representation = Google::Apis::ContaineranalysisV1alpha1::TestIamPermissionsRequest::Representation
          command.request_object = test_iam_permissions_request_object
          command.response_representation = Google::Apis::ContaineranalysisV1alpha1::TestIamPermissionsResponse::Representation
          command.response_class = Google::Apis::ContaineranalysisV1alpha1::TestIamPermissionsResponse
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists `Occurrences` referencing the specified `Note`. Use this method to
        # get all occurrences referencing your `Note` across all your customer
        # projects.
        # @param [String] name
        #   The name field will contain the note name for example:
        #   "provider/`provider_id`/notes/`note_id`"
        # @param [String] filter
        #   The filter expression.
        # @param [Fixnum] page_size
        #   Number of notes to return in the list.
        # @param [String] page_token
        #   Token to provide to skip to a particular spot in the list.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContaineranalysisV1alpha1::ListNoteOccurrencesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1alpha1::ListNoteOccurrencesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_provider_note_occurrences(name, filter: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha1/{+name}/occurrences', options)
          command.response_representation = Google::Apis::ContaineranalysisV1alpha1::ListNoteOccurrencesResponse::Representation
          command.response_class = Google::Apis::ContaineranalysisV1alpha1::ListNoteOccurrencesResponse
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
