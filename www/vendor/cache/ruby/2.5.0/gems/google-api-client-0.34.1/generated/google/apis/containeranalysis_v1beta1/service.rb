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
    module ContaineranalysisV1beta1
      # Container Analysis API
      #
      # An implementation of the Grafeas API, which stores, and enables querying and
      #  retrieval of critical metadata about all of your software artifacts.
      #
      # @example
      #    require 'google/apis/containeranalysis_v1beta1'
      #
      #    Containeranalysis = Google::Apis::ContaineranalysisV1beta1 # Alias the module
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
        
        # Creates new notes in batch.
        # @param [String] parent
        #   The name of the project in the form of `projects/[PROJECT_ID]`, under which
        #   the notes are to be created.
        # @param [Google::Apis::ContaineranalysisV1beta1::BatchCreateNotesRequest] batch_create_notes_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContaineranalysisV1beta1::BatchCreateNotesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1beta1::BatchCreateNotesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def batch_create_notes(parent, batch_create_notes_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+parent}/notes:batchCreate', options)
          command.request_representation = Google::Apis::ContaineranalysisV1beta1::BatchCreateNotesRequest::Representation
          command.request_object = batch_create_notes_request_object
          command.response_representation = Google::Apis::ContaineranalysisV1beta1::BatchCreateNotesResponse::Representation
          command.response_class = Google::Apis::ContaineranalysisV1beta1::BatchCreateNotesResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new note.
        # @param [String] parent
        #   The name of the project in the form of `projects/[PROJECT_ID]`, under which
        #   the note is to be created.
        # @param [Google::Apis::ContaineranalysisV1beta1::Note] note_object
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
        # @yieldparam result [Google::Apis::ContaineranalysisV1beta1::Note] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1beta1::Note]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_note(parent, note_object = nil, note_id: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+parent}/notes', options)
          command.request_representation = Google::Apis::ContaineranalysisV1beta1::Note::Representation
          command.request_object = note_object
          command.response_representation = Google::Apis::ContaineranalysisV1beta1::Note::Representation
          command.response_class = Google::Apis::ContaineranalysisV1beta1::Note
          command.params['parent'] = parent unless parent.nil?
          command.query['noteId'] = note_id unless note_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes the specified note.
        # @param [String] name
        #   The name of the note in the form of
        #   `projects/[PROVIDER_ID]/notes/[NOTE_ID]`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContaineranalysisV1beta1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1beta1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_note(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1beta1/{+name}', options)
          command.response_representation = Google::Apis::ContaineranalysisV1beta1::Empty::Representation
          command.response_class = Google::Apis::ContaineranalysisV1beta1::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the specified note.
        # @param [String] name
        #   The name of the note in the form of
        #   `projects/[PROVIDER_ID]/notes/[NOTE_ID]`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContaineranalysisV1beta1::Note] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1beta1::Note]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_note(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+name}', options)
          command.response_representation = Google::Apis::ContaineranalysisV1beta1::Note::Representation
          command.response_class = Google::Apis::ContaineranalysisV1beta1::Note
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the access control policy for a note or an occurrence resource.
        # Requires `containeranalysis.notes.setIamPolicy` or
        # `containeranalysis.occurrences.setIamPolicy` permission if the resource is
        # a note or occurrence, respectively.
        # The resource takes the format `projects/[PROJECT_ID]/notes/[NOTE_ID]` for
        # notes and `projects/[PROJECT_ID]/occurrences/[OCCURRENCE_ID]` for
        # occurrences.
        # @param [String] resource
        #   REQUIRED: The resource for which the policy is being requested.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Google::Apis::ContaineranalysisV1beta1::GetIamPolicyRequest] get_iam_policy_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContaineranalysisV1beta1::Policy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1beta1::Policy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_note_iam_policy(resource, get_iam_policy_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+resource}:getIamPolicy', options)
          command.request_representation = Google::Apis::ContaineranalysisV1beta1::GetIamPolicyRequest::Representation
          command.request_object = get_iam_policy_request_object
          command.response_representation = Google::Apis::ContaineranalysisV1beta1::Policy::Representation
          command.response_class = Google::Apis::ContaineranalysisV1beta1::Policy
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists notes for the specified project.
        # @param [String] parent
        #   The name of the project to list notes for in the form of
        #   `projects/[PROJECT_ID]`.
        # @param [String] filter
        #   The filter expression.
        # @param [Fixnum] page_size
        #   Number of notes to return in the list. Must be positive. Max allowed page
        #   size is 1000. If not specified, page size defaults to 20.
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
        # @yieldparam result [Google::Apis::ContaineranalysisV1beta1::ListNotesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1beta1::ListNotesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_notes(parent, filter: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+parent}/notes', options)
          command.response_representation = Google::Apis::ContaineranalysisV1beta1::ListNotesResponse::Representation
          command.response_class = Google::Apis::ContaineranalysisV1beta1::ListNotesResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the specified note.
        # @param [String] name
        #   The name of the note in the form of
        #   `projects/[PROVIDER_ID]/notes/[NOTE_ID]`.
        # @param [Google::Apis::ContaineranalysisV1beta1::Note] note_object
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
        # @yieldparam result [Google::Apis::ContaineranalysisV1beta1::Note] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1beta1::Note]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_project_note(name, note_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1beta1/{+name}', options)
          command.request_representation = Google::Apis::ContaineranalysisV1beta1::Note::Representation
          command.request_object = note_object
          command.response_representation = Google::Apis::ContaineranalysisV1beta1::Note::Representation
          command.response_class = Google::Apis::ContaineranalysisV1beta1::Note
          command.params['name'] = name unless name.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Sets the access control policy on the specified note or occurrence.
        # Requires `containeranalysis.notes.setIamPolicy` or
        # `containeranalysis.occurrences.setIamPolicy` permission if the resource is
        # a note or an occurrence, respectively.
        # The resource takes the format `projects/[PROJECT_ID]/notes/[NOTE_ID]` for
        # notes and `projects/[PROJECT_ID]/occurrences/[OCCURRENCE_ID]` for
        # occurrences.
        # @param [String] resource
        #   REQUIRED: The resource for which the policy is being specified.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Google::Apis::ContaineranalysisV1beta1::SetIamPolicyRequest] set_iam_policy_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContaineranalysisV1beta1::Policy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1beta1::Policy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def set_note_iam_policy(resource, set_iam_policy_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+resource}:setIamPolicy', options)
          command.request_representation = Google::Apis::ContaineranalysisV1beta1::SetIamPolicyRequest::Representation
          command.request_object = set_iam_policy_request_object
          command.response_representation = Google::Apis::ContaineranalysisV1beta1::Policy::Representation
          command.response_class = Google::Apis::ContaineranalysisV1beta1::Policy
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns the permissions that a caller has on the specified note or
        # occurrence. Requires list permission on the project (for example,
        # `containeranalysis.notes.list`).
        # The resource takes the format `projects/[PROJECT_ID]/notes/[NOTE_ID]` for
        # notes and `projects/[PROJECT_ID]/occurrences/[OCCURRENCE_ID]` for
        # occurrences.
        # @param [String] resource
        #   REQUIRED: The resource for which the policy detail is being requested.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Google::Apis::ContaineranalysisV1beta1::TestIamPermissionsRequest] test_iam_permissions_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContaineranalysisV1beta1::TestIamPermissionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1beta1::TestIamPermissionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def test_note_iam_permissions(resource, test_iam_permissions_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+resource}:testIamPermissions', options)
          command.request_representation = Google::Apis::ContaineranalysisV1beta1::TestIamPermissionsRequest::Representation
          command.request_object = test_iam_permissions_request_object
          command.response_representation = Google::Apis::ContaineranalysisV1beta1::TestIamPermissionsResponse::Representation
          command.response_class = Google::Apis::ContaineranalysisV1beta1::TestIamPermissionsResponse
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists occurrences referencing the specified note. Provider projects can use
        # this method to get all occurrences across consumer projects referencing the
        # specified note.
        # @param [String] name
        #   The name of the note to list occurrences for in the form of
        #   `projects/[PROVIDER_ID]/notes/[NOTE_ID]`.
        # @param [String] filter
        #   The filter expression.
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
        # @yieldparam result [Google::Apis::ContaineranalysisV1beta1::ListNoteOccurrencesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1beta1::ListNoteOccurrencesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_note_occurrences(name, filter: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+name}/occurrences', options)
          command.response_representation = Google::Apis::ContaineranalysisV1beta1::ListNoteOccurrencesResponse::Representation
          command.response_class = Google::Apis::ContaineranalysisV1beta1::ListNoteOccurrencesResponse
          command.params['name'] = name unless name.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates new occurrences in batch.
        # @param [String] parent
        #   The name of the project in the form of `projects/[PROJECT_ID]`, under which
        #   the occurrences are to be created.
        # @param [Google::Apis::ContaineranalysisV1beta1::BatchCreateOccurrencesRequest] batch_create_occurrences_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContaineranalysisV1beta1::BatchCreateOccurrencesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1beta1::BatchCreateOccurrencesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def batch_create_occurrences(parent, batch_create_occurrences_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+parent}/occurrences:batchCreate', options)
          command.request_representation = Google::Apis::ContaineranalysisV1beta1::BatchCreateOccurrencesRequest::Representation
          command.request_object = batch_create_occurrences_request_object
          command.response_representation = Google::Apis::ContaineranalysisV1beta1::BatchCreateOccurrencesResponse::Representation
          command.response_class = Google::Apis::ContaineranalysisV1beta1::BatchCreateOccurrencesResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new occurrence.
        # @param [String] parent
        #   The name of the project in the form of `projects/[PROJECT_ID]`, under which
        #   the occurrence is to be created.
        # @param [Google::Apis::ContaineranalysisV1beta1::Occurrence] occurrence_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContaineranalysisV1beta1::Occurrence] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1beta1::Occurrence]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_occurrence(parent, occurrence_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+parent}/occurrences', options)
          command.request_representation = Google::Apis::ContaineranalysisV1beta1::Occurrence::Representation
          command.request_object = occurrence_object
          command.response_representation = Google::Apis::ContaineranalysisV1beta1::Occurrence::Representation
          command.response_class = Google::Apis::ContaineranalysisV1beta1::Occurrence
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes the specified occurrence. For example, use this method to delete an
        # occurrence when the occurrence is no longer applicable for the given
        # resource.
        # @param [String] name
        #   The name of the occurrence in the form of
        #   `projects/[PROJECT_ID]/occurrences/[OCCURRENCE_ID]`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContaineranalysisV1beta1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1beta1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_occurrence(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1beta1/{+name}', options)
          command.response_representation = Google::Apis::ContaineranalysisV1beta1::Empty::Representation
          command.response_class = Google::Apis::ContaineranalysisV1beta1::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the specified occurrence.
        # @param [String] name
        #   The name of the occurrence in the form of
        #   `projects/[PROJECT_ID]/occurrences/[OCCURRENCE_ID]`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContaineranalysisV1beta1::Occurrence] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1beta1::Occurrence]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_occurrence(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+name}', options)
          command.response_representation = Google::Apis::ContaineranalysisV1beta1::Occurrence::Representation
          command.response_class = Google::Apis::ContaineranalysisV1beta1::Occurrence
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the access control policy for a note or an occurrence resource.
        # Requires `containeranalysis.notes.setIamPolicy` or
        # `containeranalysis.occurrences.setIamPolicy` permission if the resource is
        # a note or occurrence, respectively.
        # The resource takes the format `projects/[PROJECT_ID]/notes/[NOTE_ID]` for
        # notes and `projects/[PROJECT_ID]/occurrences/[OCCURRENCE_ID]` for
        # occurrences.
        # @param [String] resource
        #   REQUIRED: The resource for which the policy is being requested.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Google::Apis::ContaineranalysisV1beta1::GetIamPolicyRequest] get_iam_policy_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContaineranalysisV1beta1::Policy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1beta1::Policy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_occurrence_iam_policy(resource, get_iam_policy_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+resource}:getIamPolicy', options)
          command.request_representation = Google::Apis::ContaineranalysisV1beta1::GetIamPolicyRequest::Representation
          command.request_object = get_iam_policy_request_object
          command.response_representation = Google::Apis::ContaineranalysisV1beta1::Policy::Representation
          command.response_class = Google::Apis::ContaineranalysisV1beta1::Policy
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the note attached to the specified occurrence. Consumer projects can
        # use this method to get a note that belongs to a provider project.
        # @param [String] name
        #   The name of the occurrence in the form of
        #   `projects/[PROJECT_ID]/occurrences/[OCCURRENCE_ID]`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContaineranalysisV1beta1::Note] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1beta1::Note]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_occurrence_notes(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+name}/notes', options)
          command.response_representation = Google::Apis::ContaineranalysisV1beta1::Note::Representation
          command.response_class = Google::Apis::ContaineranalysisV1beta1::Note
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a summary of the number and severity of occurrences.
        # @param [String] parent
        #   The name of the project to get a vulnerability summary for in the form of
        #   `projects/[PROJECT_ID]`.
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
        # @yieldparam result [Google::Apis::ContaineranalysisV1beta1::VulnerabilityOccurrencesSummary] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1beta1::VulnerabilityOccurrencesSummary]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_occurrence_vulnerability_summary(parent, filter: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+parent}/occurrences:vulnerabilitySummary', options)
          command.response_representation = Google::Apis::ContaineranalysisV1beta1::VulnerabilityOccurrencesSummary::Representation
          command.response_class = Google::Apis::ContaineranalysisV1beta1::VulnerabilityOccurrencesSummary
          command.params['parent'] = parent unless parent.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists occurrences for the specified project.
        # @param [String] parent
        #   The name of the project to list occurrences for in the form of
        #   `projects/[PROJECT_ID]`.
        # @param [String] filter
        #   The filter expression.
        # @param [Fixnum] page_size
        #   Number of occurrences to return in the list. Must be positive. Max allowed
        #   page size is 1000. If not specified, page size defaults to 20.
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
        # @yieldparam result [Google::Apis::ContaineranalysisV1beta1::ListOccurrencesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1beta1::ListOccurrencesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_occurrences(parent, filter: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+parent}/occurrences', options)
          command.response_representation = Google::Apis::ContaineranalysisV1beta1::ListOccurrencesResponse::Representation
          command.response_class = Google::Apis::ContaineranalysisV1beta1::ListOccurrencesResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the specified occurrence.
        # @param [String] name
        #   The name of the occurrence in the form of
        #   `projects/[PROJECT_ID]/occurrences/[OCCURRENCE_ID]`.
        # @param [Google::Apis::ContaineranalysisV1beta1::Occurrence] occurrence_object
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
        # @yieldparam result [Google::Apis::ContaineranalysisV1beta1::Occurrence] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1beta1::Occurrence]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_project_occurrence(name, occurrence_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1beta1/{+name}', options)
          command.request_representation = Google::Apis::ContaineranalysisV1beta1::Occurrence::Representation
          command.request_object = occurrence_object
          command.response_representation = Google::Apis::ContaineranalysisV1beta1::Occurrence::Representation
          command.response_class = Google::Apis::ContaineranalysisV1beta1::Occurrence
          command.params['name'] = name unless name.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Sets the access control policy on the specified note or occurrence.
        # Requires `containeranalysis.notes.setIamPolicy` or
        # `containeranalysis.occurrences.setIamPolicy` permission if the resource is
        # a note or an occurrence, respectively.
        # The resource takes the format `projects/[PROJECT_ID]/notes/[NOTE_ID]` for
        # notes and `projects/[PROJECT_ID]/occurrences/[OCCURRENCE_ID]` for
        # occurrences.
        # @param [String] resource
        #   REQUIRED: The resource for which the policy is being specified.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Google::Apis::ContaineranalysisV1beta1::SetIamPolicyRequest] set_iam_policy_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContaineranalysisV1beta1::Policy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1beta1::Policy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def set_occurrence_iam_policy(resource, set_iam_policy_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+resource}:setIamPolicy', options)
          command.request_representation = Google::Apis::ContaineranalysisV1beta1::SetIamPolicyRequest::Representation
          command.request_object = set_iam_policy_request_object
          command.response_representation = Google::Apis::ContaineranalysisV1beta1::Policy::Representation
          command.response_class = Google::Apis::ContaineranalysisV1beta1::Policy
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns the permissions that a caller has on the specified note or
        # occurrence. Requires list permission on the project (for example,
        # `containeranalysis.notes.list`).
        # The resource takes the format `projects/[PROJECT_ID]/notes/[NOTE_ID]` for
        # notes and `projects/[PROJECT_ID]/occurrences/[OCCURRENCE_ID]` for
        # occurrences.
        # @param [String] resource
        #   REQUIRED: The resource for which the policy detail is being requested.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Google::Apis::ContaineranalysisV1beta1::TestIamPermissionsRequest] test_iam_permissions_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContaineranalysisV1beta1::TestIamPermissionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1beta1::TestIamPermissionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def test_occurrence_iam_permissions(resource, test_iam_permissions_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+resource}:testIamPermissions', options)
          command.request_representation = Google::Apis::ContaineranalysisV1beta1::TestIamPermissionsRequest::Representation
          command.request_object = test_iam_permissions_request_object
          command.response_representation = Google::Apis::ContaineranalysisV1beta1::TestIamPermissionsResponse::Representation
          command.response_class = Google::Apis::ContaineranalysisV1beta1::TestIamPermissionsResponse
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the specified scan configuration.
        # @param [String] name
        #   The name of the scan configuration in the form of
        #   `projects/[PROJECT_ID]/scanConfigs/[SCAN_CONFIG_ID]`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContaineranalysisV1beta1::ScanConfig] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1beta1::ScanConfig]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_scan_config(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+name}', options)
          command.response_representation = Google::Apis::ContaineranalysisV1beta1::ScanConfig::Representation
          command.response_class = Google::Apis::ContaineranalysisV1beta1::ScanConfig
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists scan configurations for the specified project.
        # @param [String] parent
        #   The name of the project to list scan configurations for in the form of
        #   `projects/[PROJECT_ID]`.
        # @param [String] filter
        #   The filter expression.
        # @param [Fixnum] page_size
        #   The number of scan configs to return in the list.
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
        # @yieldparam result [Google::Apis::ContaineranalysisV1beta1::ListScanConfigsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1beta1::ListScanConfigsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_scan_configs(parent, filter: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+parent}/scanConfigs', options)
          command.response_representation = Google::Apis::ContaineranalysisV1beta1::ListScanConfigsResponse::Representation
          command.response_class = Google::Apis::ContaineranalysisV1beta1::ListScanConfigsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the specified scan configuration.
        # @param [String] name
        #   The name of the scan configuration in the form of
        #   `projects/[PROJECT_ID]/scanConfigs/[SCAN_CONFIG_ID]`.
        # @param [Google::Apis::ContaineranalysisV1beta1::ScanConfig] scan_config_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ContaineranalysisV1beta1::ScanConfig] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ContaineranalysisV1beta1::ScanConfig]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_project_scan_config(name, scan_config_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:put, 'v1beta1/{+name}', options)
          command.request_representation = Google::Apis::ContaineranalysisV1beta1::ScanConfig::Representation
          command.request_object = scan_config_object
          command.response_representation = Google::Apis::ContaineranalysisV1beta1::ScanConfig::Representation
          command.response_class = Google::Apis::ContaineranalysisV1beta1::ScanConfig
          command.params['name'] = name unless name.nil?
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
