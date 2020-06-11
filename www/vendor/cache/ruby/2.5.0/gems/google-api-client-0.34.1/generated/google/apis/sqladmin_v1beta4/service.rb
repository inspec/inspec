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
    module SqladminV1beta4
      # Cloud SQL Admin API
      #
      # Creates and manages Cloud SQL instances, which provide fully managed MySQL or
      #  PostgreSQL databases.
      #
      # @example
      #    require 'google/apis/sqladmin_v1beta4'
      #
      #    Sqladmin = Google::Apis::SqladminV1beta4 # Alias the module
      #    service = Sqladmin::SQLAdminService.new
      #
      # @see https://cloud.google.com/sql/docs/reference/latest
      class SQLAdminService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  An opaque string that represents a user for quota purposes. Must not exceed 40
        #  characters.
        attr_accessor :quota_user

        # @return [String]
        #  Deprecated. Please use quotaUser instead.
        attr_accessor :user_ip

        def initialize
          super('https://www.googleapis.com/', 'sql/v1beta4/')
          @batch_path = 'batch/sqladmin/v1beta4'
        end
        
        # Deletes the backup taken by a backup run.
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] instance
        #   Cloud SQL instance ID. This does not include the project ID.
        # @param [Fixnum] id
        #   The ID of the Backup Run to delete. To find a Backup Run ID, use the list
        #   method.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqladminV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqladminV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_backup_run(project, instance, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'projects/{project}/instances/{instance}/backupRuns/{id}', options)
          command.response_representation = Google::Apis::SqladminV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqladminV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a resource containing information about a backup run.
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] instance
        #   Cloud SQL instance ID. This does not include the project ID.
        # @param [Fixnum] id
        #   The ID of this Backup Run.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqladminV1beta4::BackupRun] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqladminV1beta4::BackupRun]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_backup_run(project, instance, id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'projects/{project}/instances/{instance}/backupRuns/{id}', options)
          command.response_representation = Google::Apis::SqladminV1beta4::BackupRun::Representation
          command.response_class = Google::Apis::SqladminV1beta4::BackupRun
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new backup run on demand. This method is applicable only to Second
        # Generation instances.
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] instance
        #   Cloud SQL instance ID. This does not include the project ID.
        # @param [Google::Apis::SqladminV1beta4::BackupRun] backup_run_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqladminV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqladminV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_backup_run(project, instance, backup_run_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'projects/{project}/instances/{instance}/backupRuns', options)
          command.request_representation = Google::Apis::SqladminV1beta4::BackupRun::Representation
          command.request_object = backup_run_object
          command.response_representation = Google::Apis::SqladminV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqladminV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all backup runs associated with a given instance and configuration in
        # the reverse chronological order of the backup initiation time.
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] instance
        #   Cloud SQL instance ID. This does not include the project ID.
        # @param [Fixnum] max_results
        #   Maximum number of backup runs per response.
        # @param [String] page_token
        #   A previously-returned page token representing part of the larger set of
        #   results to view.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqladminV1beta4::ListBackupRunsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqladminV1beta4::ListBackupRunsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_backup_runs(project, instance, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'projects/{project}/instances/{instance}/backupRuns', options)
          command.response_representation = Google::Apis::SqladminV1beta4::ListBackupRunsResponse::Representation
          command.response_class = Google::Apis::SqladminV1beta4::ListBackupRunsResponse
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a database from a Cloud SQL instance.
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] instance
        #   Database instance ID. This does not include the project ID.
        # @param [String] database
        #   Name of the database to be deleted in the instance.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqladminV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqladminV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_database(project, instance, database, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'projects/{project}/instances/{instance}/databases/{database}', options)
          command.response_representation = Google::Apis::SqladminV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqladminV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.params['database'] = database unless database.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a resource containing information about a database inside a Cloud
        # SQL instance.
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] instance
        #   Database instance ID. This does not include the project ID.
        # @param [String] database
        #   Name of the database in the instance.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqladminV1beta4::Database] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqladminV1beta4::Database]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_database(project, instance, database, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'projects/{project}/instances/{instance}/databases/{database}', options)
          command.response_representation = Google::Apis::SqladminV1beta4::Database::Representation
          command.response_class = Google::Apis::SqladminV1beta4::Database
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.params['database'] = database unless database.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Inserts a resource containing information about a database inside a Cloud SQL
        # instance.
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] instance
        #   Database instance ID. This does not include the project ID.
        # @param [Google::Apis::SqladminV1beta4::Database] database_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqladminV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqladminV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_database(project, instance, database_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'projects/{project}/instances/{instance}/databases', options)
          command.request_representation = Google::Apis::SqladminV1beta4::Database::Representation
          command.request_object = database_object
          command.response_representation = Google::Apis::SqladminV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqladminV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists databases in the specified Cloud SQL instance.
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] instance
        #   Cloud SQL instance ID. This does not include the project ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqladminV1beta4::ListDatabasesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqladminV1beta4::ListDatabasesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_databases(project, instance, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'projects/{project}/instances/{instance}/databases', options)
          command.response_representation = Google::Apis::SqladminV1beta4::ListDatabasesResponse::Representation
          command.response_class = Google::Apis::SqladminV1beta4::ListDatabasesResponse
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a resource containing information about a database inside a Cloud SQL
        # instance. This method supports patch semantics.
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] instance
        #   Database instance ID. This does not include the project ID.
        # @param [String] database
        #   Name of the database to be updated in the instance.
        # @param [Google::Apis::SqladminV1beta4::Database] database_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqladminV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqladminV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_database(project, instance, database, database_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'projects/{project}/instances/{instance}/databases/{database}', options)
          command.request_representation = Google::Apis::SqladminV1beta4::Database::Representation
          command.request_object = database_object
          command.response_representation = Google::Apis::SqladminV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqladminV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.params['database'] = database unless database.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a resource containing information about a database inside a Cloud SQL
        # instance.
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] instance
        #   Database instance ID. This does not include the project ID.
        # @param [String] database
        #   Name of the database to be updated in the instance.
        # @param [Google::Apis::SqladminV1beta4::Database] database_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqladminV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqladminV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_database(project, instance, database, database_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'projects/{project}/instances/{instance}/databases/{database}', options)
          command.request_representation = Google::Apis::SqladminV1beta4::Database::Representation
          command.request_object = database_object
          command.response_representation = Google::Apis::SqladminV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqladminV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.params['database'] = database unless database.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List all available database flags for Cloud SQL instances.
        # @param [String] database_version
        #   Database type and version you want to retrieve flags for. By default, this
        #   method returns flags for all database types and versions.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqladminV1beta4::ListFlagsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqladminV1beta4::ListFlagsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_flags(database_version: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'flags', options)
          command.response_representation = Google::Apis::SqladminV1beta4::ListFlagsResponse::Representation
          command.response_class = Google::Apis::SqladminV1beta4::ListFlagsResponse
          command.query['databaseVersion'] = database_version unless database_version.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Add a new trusted Certificate Authority (CA) version for the specified
        # instance. Required to prepare for a certificate rotation. If a CA version was
        # previously added but never used in a certificate rotation, this operation
        # replaces that version. There cannot be more than one CA version waiting to be
        # rotated in.
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] instance
        #   Cloud SQL instance ID. This does not include the project ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqladminV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqladminV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def add_instance_server_ca(project, instance, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'projects/{project}/instances/{instance}/addServerCa', options)
          command.response_representation = Google::Apis::SqladminV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqladminV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a Cloud SQL instance as a clone of the source instance.
        # @param [String] project
        #   Project ID of the source as well as the clone Cloud SQL instance.
        # @param [String] instance
        #   The ID of the Cloud SQL instance to be cloned (source). This does not include
        #   the project ID.
        # @param [Google::Apis::SqladminV1beta4::CloneInstancesRequest] clone_instances_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqladminV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqladminV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def clone_instance(project, instance, clone_instances_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'projects/{project}/instances/{instance}/clone', options)
          command.request_representation = Google::Apis::SqladminV1beta4::CloneInstancesRequest::Representation
          command.request_object = clone_instances_request_object
          command.response_representation = Google::Apis::SqladminV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqladminV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a Cloud SQL instance.
        # @param [String] project
        #   Project ID of the project that contains the instance to be deleted.
        # @param [String] instance
        #   Cloud SQL instance ID. This does not include the project ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqladminV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqladminV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_instance(project, instance, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'projects/{project}/instances/{instance}', options)
          command.response_representation = Google::Apis::SqladminV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqladminV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Demotes the stand-alone instance to be a Cloud SQL read replica for an
        # external database server.
        # @param [String] project
        #   ID of the project that contains the instance.
        # @param [String] instance
        #   Cloud SQL instance name.
        # @param [Google::Apis::SqladminV1beta4::InstancesDemoteMasterRequest] instances_demote_master_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqladminV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqladminV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def demote_instance_master(project, instance, instances_demote_master_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'projects/{project}/instances/{instance}/demoteMaster', options)
          command.request_representation = Google::Apis::SqladminV1beta4::InstancesDemoteMasterRequest::Representation
          command.request_object = instances_demote_master_request_object
          command.response_representation = Google::Apis::SqladminV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqladminV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Exports data from a Cloud SQL instance to a Cloud Storage bucket as a SQL dump
        # or CSV file.
        # @param [String] project
        #   Project ID of the project that contains the instance to be exported.
        # @param [String] instance
        #   Cloud SQL instance ID. This does not include the project ID.
        # @param [Google::Apis::SqladminV1beta4::ExportInstancesRequest] export_instances_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqladminV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqladminV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def export_instance(project, instance, export_instances_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'projects/{project}/instances/{instance}/export', options)
          command.request_representation = Google::Apis::SqladminV1beta4::ExportInstancesRequest::Representation
          command.request_object = export_instances_request_object
          command.response_representation = Google::Apis::SqladminV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqladminV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Failover the instance to its failover replica instance.
        # @param [String] project
        #   ID of the project that contains the read replica.
        # @param [String] instance
        #   Cloud SQL instance ID. This does not include the project ID.
        # @param [Google::Apis::SqladminV1beta4::InstancesFailoverRequest] instances_failover_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqladminV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqladminV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def failover_instance(project, instance, instances_failover_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'projects/{project}/instances/{instance}/failover', options)
          command.request_representation = Google::Apis::SqladminV1beta4::InstancesFailoverRequest::Representation
          command.request_object = instances_failover_request_object
          command.response_representation = Google::Apis::SqladminV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqladminV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a resource containing information about a Cloud SQL instance.
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] instance
        #   Database instance ID. This does not include the project ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqladminV1beta4::DatabaseInstance] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqladminV1beta4::DatabaseInstance]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_instance(project, instance, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'projects/{project}/instances/{instance}', options)
          command.response_representation = Google::Apis::SqladminV1beta4::DatabaseInstance::Representation
          command.response_class = Google::Apis::SqladminV1beta4::DatabaseInstance
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Imports data into a Cloud SQL instance from a SQL dump or CSV file in Cloud
        # Storage.
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] instance
        #   Cloud SQL instance ID. This does not include the project ID.
        # @param [Google::Apis::SqladminV1beta4::ImportInstancesRequest] import_instances_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqladminV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqladminV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def import_instance(project, instance, import_instances_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'projects/{project}/instances/{instance}/import', options)
          command.request_representation = Google::Apis::SqladminV1beta4::ImportInstancesRequest::Representation
          command.request_object = import_instances_request_object
          command.response_representation = Google::Apis::SqladminV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqladminV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new Cloud SQL instance.
        # @param [String] project
        #   Project ID of the project to which the newly created Cloud SQL instances
        #   should belong.
        # @param [Google::Apis::SqladminV1beta4::DatabaseInstance] database_instance_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqladminV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqladminV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_instance(project, database_instance_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'projects/{project}/instances', options)
          command.request_representation = Google::Apis::SqladminV1beta4::DatabaseInstance::Representation
          command.request_object = database_instance_object
          command.response_representation = Google::Apis::SqladminV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqladminV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists instances under a given project in the alphabetical order of the
        # instance name.
        # @param [String] project
        #   Project ID of the project for which to list Cloud SQL instances.
        # @param [String] filter
        #   An expression for filtering the results of the request, such as by name or
        #   label.
        # @param [Fixnum] max_results
        #   The maximum number of results to return per response.
        # @param [String] page_token
        #   A previously-returned page token representing part of the larger set of
        #   results to view.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqladminV1beta4::ListInstancesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqladminV1beta4::ListInstancesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_instances(project, filter: nil, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'projects/{project}/instances', options)
          command.response_representation = Google::Apis::SqladminV1beta4::ListInstancesResponse::Representation
          command.response_class = Google::Apis::SqladminV1beta4::ListInstancesResponse
          command.params['project'] = project unless project.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all of the trusted Certificate Authorities (CAs) for the specified
        # instance. There can be up to three CAs listed: the CA that was used to sign
        # the certificate that is currently in use, a CA that has been added but not yet
        # used to sign a certificate, and a CA used to sign a certificate that has
        # previously rotated out.
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] instance
        #   Cloud SQL instance ID. This does not include the project ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqladminV1beta4::InstancesListServerCasResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqladminV1beta4::InstancesListServerCasResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_instance_server_cas(project, instance, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'projects/{project}/instances/{instance}/listServerCas', options)
          command.response_representation = Google::Apis::SqladminV1beta4::InstancesListServerCasResponse::Representation
          command.response_class = Google::Apis::SqladminV1beta4::InstancesListServerCasResponse
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates settings of a Cloud SQL instance. Caution: This is not a partial
        # update, so you must include values for all the settings that you want to
        # retain. For partial updates, use patch.. This method supports patch semantics.
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] instance
        #   Cloud SQL instance ID. This does not include the project ID.
        # @param [Google::Apis::SqladminV1beta4::DatabaseInstance] database_instance_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqladminV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqladminV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_instance(project, instance, database_instance_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'projects/{project}/instances/{instance}', options)
          command.request_representation = Google::Apis::SqladminV1beta4::DatabaseInstance::Representation
          command.request_object = database_instance_object
          command.response_representation = Google::Apis::SqladminV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqladminV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Promotes the read replica instance to be a stand-alone Cloud SQL instance.
        # @param [String] project
        #   ID of the project that contains the read replica.
        # @param [String] instance
        #   Cloud SQL read replica instance name.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqladminV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqladminV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def promote_instance_replica(project, instance, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'projects/{project}/instances/{instance}/promoteReplica', options)
          command.response_representation = Google::Apis::SqladminV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqladminV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes all client certificates and generates a new server SSL certificate for
        # the instance.
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] instance
        #   Cloud SQL instance ID. This does not include the project ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqladminV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqladminV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def reset_instance_ssl_config(project, instance, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'projects/{project}/instances/{instance}/resetSslConfig', options)
          command.response_representation = Google::Apis::SqladminV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqladminV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Restarts a Cloud SQL instance.
        # @param [String] project
        #   Project ID of the project that contains the instance to be restarted.
        # @param [String] instance
        #   Cloud SQL instance ID. This does not include the project ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqladminV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqladminV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def restart_instance(project, instance, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'projects/{project}/instances/{instance}/restart', options)
          command.response_representation = Google::Apis::SqladminV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqladminV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Restores a backup of a Cloud SQL instance.
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] instance
        #   Cloud SQL instance ID. This does not include the project ID.
        # @param [Google::Apis::SqladminV1beta4::RestoreInstancesBackupRequest] restore_instances_backup_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqladminV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqladminV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def restore_instance_backup(project, instance, restore_instances_backup_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'projects/{project}/instances/{instance}/restoreBackup', options)
          command.request_representation = Google::Apis::SqladminV1beta4::RestoreInstancesBackupRequest::Representation
          command.request_object = restore_instances_backup_request_object
          command.response_representation = Google::Apis::SqladminV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqladminV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Rotates the server certificate to one signed by the Certificate Authority (CA)
        # version previously added with the addServerCA method.
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] instance
        #   Cloud SQL instance ID. This does not include the project ID.
        # @param [Google::Apis::SqladminV1beta4::InstancesRotateServerCaRequest] instances_rotate_server_ca_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqladminV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqladminV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def rotate_instance_server_ca(project, instance, instances_rotate_server_ca_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'projects/{project}/instances/{instance}/rotateServerCa', options)
          command.request_representation = Google::Apis::SqladminV1beta4::InstancesRotateServerCaRequest::Representation
          command.request_object = instances_rotate_server_ca_request_object
          command.response_representation = Google::Apis::SqladminV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqladminV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Starts the replication in the read replica instance.
        # @param [String] project
        #   ID of the project that contains the read replica.
        # @param [String] instance
        #   Cloud SQL read replica instance name.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqladminV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqladminV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def start_instance_replica(project, instance, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'projects/{project}/instances/{instance}/startReplica', options)
          command.response_representation = Google::Apis::SqladminV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqladminV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Stops the replication in the read replica instance.
        # @param [String] project
        #   ID of the project that contains the read replica.
        # @param [String] instance
        #   Cloud SQL read replica instance name.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqladminV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqladminV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def stop_instance_replica(project, instance, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'projects/{project}/instances/{instance}/stopReplica', options)
          command.response_representation = Google::Apis::SqladminV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqladminV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Truncate MySQL general and slow query log tables
        # @param [String] project
        #   Project ID of the Cloud SQL project.
        # @param [String] instance
        #   Cloud SQL instance ID. This does not include the project ID.
        # @param [Google::Apis::SqladminV1beta4::InstancesTruncateLogRequest] instances_truncate_log_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqladminV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqladminV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def truncate_instance_log(project, instance, instances_truncate_log_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'projects/{project}/instances/{instance}/truncateLog', options)
          command.request_representation = Google::Apis::SqladminV1beta4::InstancesTruncateLogRequest::Representation
          command.request_object = instances_truncate_log_request_object
          command.response_representation = Google::Apis::SqladminV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqladminV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates settings of a Cloud SQL instance. Caution: This is not a partial
        # update, so you must include values for all the settings that you want to
        # retain. For partial updates, use patch.
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] instance
        #   Cloud SQL instance ID. This does not include the project ID.
        # @param [Google::Apis::SqladminV1beta4::DatabaseInstance] database_instance_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqladminV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqladminV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_instance(project, instance, database_instance_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'projects/{project}/instances/{instance}', options)
          command.request_representation = Google::Apis::SqladminV1beta4::DatabaseInstance::Representation
          command.request_object = database_instance_object
          command.response_representation = Google::Apis::SqladminV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqladminV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves an instance operation that has been performed on an instance.
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] operation
        #   Instance operation ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqladminV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqladminV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_operation(project, operation, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'projects/{project}/operations/{operation}', options)
          command.response_representation = Google::Apis::SqladminV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqladminV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['operation'] = operation unless operation.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all instance operations that have been performed on the given Cloud SQL
        # instance in the reverse chronological order of the start time.
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] instance
        #   Cloud SQL instance ID. This does not include the project ID.
        # @param [Fixnum] max_results
        #   Maximum number of operations per response.
        # @param [String] page_token
        #   A previously-returned page token representing part of the larger set of
        #   results to view.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqladminV1beta4::ListOperationsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqladminV1beta4::ListOperationsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_operations(project, instance, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'projects/{project}/operations', options)
          command.response_representation = Google::Apis::SqladminV1beta4::ListOperationsResponse::Representation
          command.response_class = Google::Apis::SqladminV1beta4::ListOperationsResponse
          command.params['project'] = project unless project.nil?
          command.query['instance'] = instance unless instance.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Generates a short-lived X509 certificate containing the provided public key
        # and signed by a private key specific to the target instance. Users may use the
        # certificate to authenticate as themselves when connecting to the database.
        # @param [String] project
        #   Project ID of the Cloud SQL project.
        # @param [String] instance
        #   Cloud SQL instance ID. This does not include the project ID.
        # @param [Google::Apis::SqladminV1beta4::SslCertsCreateEphemeralRequest] ssl_certs_create_ephemeral_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqladminV1beta4::SslCert] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqladminV1beta4::SslCert]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_ssl_cert_ephemeral(project, instance, ssl_certs_create_ephemeral_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'projects/{project}/instances/{instance}/createEphemeral', options)
          command.request_representation = Google::Apis::SqladminV1beta4::SslCertsCreateEphemeralRequest::Representation
          command.request_object = ssl_certs_create_ephemeral_request_object
          command.response_representation = Google::Apis::SqladminV1beta4::SslCert::Representation
          command.response_class = Google::Apis::SqladminV1beta4::SslCert
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes the SSL certificate. For First Generation instances, the certificate
        # remains valid until the instance is restarted.
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] instance
        #   Cloud SQL instance ID. This does not include the project ID.
        # @param [String] sha1_fingerprint
        #   Sha1 FingerPrint.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqladminV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqladminV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_ssl_cert(project, instance, sha1_fingerprint, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'projects/{project}/instances/{instance}/sslCerts/{sha1Fingerprint}', options)
          command.response_representation = Google::Apis::SqladminV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqladminV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.params['sha1Fingerprint'] = sha1_fingerprint unless sha1_fingerprint.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a particular SSL certificate. Does not include the private key (
        # required for usage). The private key must be saved from the response to
        # initial creation.
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] instance
        #   Cloud SQL instance ID. This does not include the project ID.
        # @param [String] sha1_fingerprint
        #   Sha1 FingerPrint.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqladminV1beta4::SslCert] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqladminV1beta4::SslCert]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_ssl_cert(project, instance, sha1_fingerprint, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'projects/{project}/instances/{instance}/sslCerts/{sha1Fingerprint}', options)
          command.response_representation = Google::Apis::SqladminV1beta4::SslCert::Representation
          command.response_class = Google::Apis::SqladminV1beta4::SslCert
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.params['sha1Fingerprint'] = sha1_fingerprint unless sha1_fingerprint.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates an SSL certificate and returns it along with the private key and
        # server certificate authority. The new certificate will not be usable until the
        # instance is restarted.
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] instance
        #   Cloud SQL instance ID. This does not include the project ID.
        # @param [Google::Apis::SqladminV1beta4::InsertSslCertsRequest] insert_ssl_certs_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqladminV1beta4::InsertSslCertsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqladminV1beta4::InsertSslCertsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_ssl_cert(project, instance, insert_ssl_certs_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'projects/{project}/instances/{instance}/sslCerts', options)
          command.request_representation = Google::Apis::SqladminV1beta4::InsertSslCertsRequest::Representation
          command.request_object = insert_ssl_certs_request_object
          command.response_representation = Google::Apis::SqladminV1beta4::InsertSslCertsResponse::Representation
          command.response_class = Google::Apis::SqladminV1beta4::InsertSslCertsResponse
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all of the current SSL certificates for the instance.
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] instance
        #   Cloud SQL instance ID. This does not include the project ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqladminV1beta4::ListSslCertsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqladminV1beta4::ListSslCertsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_ssl_certs(project, instance, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'projects/{project}/instances/{instance}/sslCerts', options)
          command.response_representation = Google::Apis::SqladminV1beta4::ListSslCertsResponse::Representation
          command.response_class = Google::Apis::SqladminV1beta4::ListSslCertsResponse
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all available machine types (tiers) for Cloud SQL, for example, db-n1-
        # standard-1. For related information, see Pricing.
        # @param [String] project
        #   Project ID of the project for which to list tiers.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqladminV1beta4::ListTiersResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqladminV1beta4::ListTiersResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_tiers(project, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'projects/{project}/tiers', options)
          command.response_representation = Google::Apis::SqladminV1beta4::ListTiersResponse::Representation
          command.response_class = Google::Apis::SqladminV1beta4::ListTiersResponse
          command.params['project'] = project unless project.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a user from a Cloud SQL instance.
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] instance
        #   Database instance ID. This does not include the project ID.
        # @param [String] host
        #   Host of the user in the instance.
        # @param [String] name
        #   Name of the user in the instance.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqladminV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqladminV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_user(project, instance, host, name, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'projects/{project}/instances/{instance}/users', options)
          command.response_representation = Google::Apis::SqladminV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqladminV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['host'] = host unless host.nil?
          command.query['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new user in a Cloud SQL instance.
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] instance
        #   Database instance ID. This does not include the project ID.
        # @param [Google::Apis::SqladminV1beta4::User] user_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqladminV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqladminV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_user(project, instance, user_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'projects/{project}/instances/{instance}/users', options)
          command.request_representation = Google::Apis::SqladminV1beta4::User::Representation
          command.request_object = user_object
          command.response_representation = Google::Apis::SqladminV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqladminV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists users in the specified Cloud SQL instance.
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] instance
        #   Database instance ID. This does not include the project ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqladminV1beta4::ListUsersResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqladminV1beta4::ListUsersResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_users(project, instance, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'projects/{project}/instances/{instance}/users', options)
          command.response_representation = Google::Apis::SqladminV1beta4::ListUsersResponse::Representation
          command.response_class = Google::Apis::SqladminV1beta4::ListUsersResponse
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing user in a Cloud SQL instance.
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] instance
        #   Database instance ID. This does not include the project ID.
        # @param [String] name
        #   Name of the user in the instance.
        # @param [Google::Apis::SqladminV1beta4::User] user_object
        # @param [String] host
        #   Host of the user in the instance. For a MySQL instance, it's required; For a
        #   PostgreSQL instance, it's optional.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqladminV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqladminV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_user(project, instance, name, user_object = nil, host: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'projects/{project}/instances/{instance}/users', options)
          command.request_representation = Google::Apis::SqladminV1beta4::User::Representation
          command.request_object = user_object
          command.response_representation = Google::Apis::SqladminV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqladminV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['host'] = host unless host.nil?
          command.query['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end

        protected

        def apply_command_defaults(command)
          command.query['key'] = key unless key.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
        end
      end
    end
  end
end
