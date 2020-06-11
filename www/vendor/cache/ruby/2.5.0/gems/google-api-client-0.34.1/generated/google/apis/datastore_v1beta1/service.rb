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
    module DatastoreV1beta1
      # Cloud Datastore API
      #
      # Accesses the schemaless NoSQL database to provide fully managed, robust,
      #  scalable storage for your application.
      #
      # @example
      #    require 'google/apis/datastore_v1beta1'
      #
      #    Datastore = Google::Apis::DatastoreV1beta1 # Alias the module
      #    service = Datastore::DatastoreService.new
      #
      # @see https://cloud.google.com/datastore/
      class DatastoreService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://datastore.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Exports a copy of all or a subset of entities from Google Cloud Datastore
        # to another storage system, such as Google Cloud Storage. Recent updates to
        # entities may not be reflected in the export. The export occurs in the
        # background and its progress can be monitored and managed via the
        # Operation resource that is created. The output of an export may only be
        # used once the associated operation is done. If an export operation is
        # cancelled before completion it may leave partial data behind in Google
        # Cloud Storage.
        # @param [String] project_id
        #   Project ID against which to make the request.
        # @param [Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1beta1ExportEntitiesRequest] google_datastore_admin_v1beta1_export_entities_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DatastoreV1beta1::GoogleLongrunningOperation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DatastoreV1beta1::GoogleLongrunningOperation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def export_project(project_id, google_datastore_admin_v1beta1_export_entities_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/projects/{projectId}:export', options)
          command.request_representation = Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1beta1ExportEntitiesRequest::Representation
          command.request_object = google_datastore_admin_v1beta1_export_entities_request_object
          command.response_representation = Google::Apis::DatastoreV1beta1::GoogleLongrunningOperation::Representation
          command.response_class = Google::Apis::DatastoreV1beta1::GoogleLongrunningOperation
          command.params['projectId'] = project_id unless project_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Imports entities into Google Cloud Datastore. Existing entities with the
        # same key are overwritten. The import occurs in the background and its
        # progress can be monitored and managed via the Operation resource that is
        # created. If an ImportEntities operation is cancelled, it is possible
        # that a subset of the data has already been imported to Cloud Datastore.
        # @param [String] project_id
        #   Project ID against which to make the request.
        # @param [Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1beta1ImportEntitiesRequest] google_datastore_admin_v1beta1_import_entities_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DatastoreV1beta1::GoogleLongrunningOperation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DatastoreV1beta1::GoogleLongrunningOperation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def import_project(project_id, google_datastore_admin_v1beta1_import_entities_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/projects/{projectId}:import', options)
          command.request_representation = Google::Apis::DatastoreV1beta1::GoogleDatastoreAdminV1beta1ImportEntitiesRequest::Representation
          command.request_object = google_datastore_admin_v1beta1_import_entities_request_object
          command.response_representation = Google::Apis::DatastoreV1beta1::GoogleLongrunningOperation::Representation
          command.response_class = Google::Apis::DatastoreV1beta1::GoogleLongrunningOperation
          command.params['projectId'] = project_id unless project_id.nil?
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
