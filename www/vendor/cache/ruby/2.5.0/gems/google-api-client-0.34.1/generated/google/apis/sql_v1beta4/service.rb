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
    module SqlV1beta4
      # Cloud SQL Admin API
      #
      # API for Cloud SQL database instance management
      #
      # @example
      #    require 'google/apis/sql_v1beta4'
      #
      #    Sql = Google::Apis::SqlV1beta4 # Alias the module
      #    service = Sql::SQLAdminService.new
      #
      # @see https://developers.google.com/cloud-sql/
      class SQLAdminService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://sqladmin.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Deletes the backup taken by a backup run.
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] instance
        #   Cloud SQL instance ID. This does not include the project ID.
        # @param [Fixnum] id
        #   The ID of the Backup Run to delete. To find a Backup Run ID, use the <a
        #   href="/sql/docs/db_path/admin-api/rest/v1beta4/backupRuns/list">list</a>
        #   method.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqlV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqlV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_backup_run(project, instance, id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'sql/v1beta4/projects/{project}/instances/{instance}/backupRuns/{id}', options)
          command.response_representation = Google::Apis::SqlV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqlV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a resource containing information about a backup run.
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] instance
        #   Cloud SQL instance ID. This does not include the project ID.
        # @param [Fixnum] id
        #   The ID of this Backup Run.
        # @param [String] resource_name
        #   Name of the resource backupRun.
        #   Format:
        #   projects/`project`/locations/`location`/instances/`instance`/backupRuns/`
        #   backupRun`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqlV1beta4::BackupRun] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqlV1beta4::BackupRun]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_backup_run(project, instance, id, resource_name: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'sql/v1beta4/projects/{project}/instances/{instance}/backupRuns/{id}', options)
          command.response_representation = Google::Apis::SqlV1beta4::BackupRun::Representation
          command.response_class = Google::Apis::SqlV1beta4::BackupRun
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.params['id'] = id unless id.nil?
          command.query['resourceName'] = resource_name unless resource_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new backup run on demand. This method is applicable only to
        # Second Generation instances.
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] instance
        #   Cloud SQL instance ID. This does not include the project ID.
        # @param [Google::Apis::SqlV1beta4::BackupRun] backup_run_object
        # @param [String] parent
        #   The parent resource where Cloud SQL should create this backupRun.
        #   Format: projects/`project`/locations/`location`/instances/`instance`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqlV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqlV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_backup_run(project, instance, backup_run_object = nil, parent: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'sql/v1beta4/projects/{project}/instances/{instance}/backupRuns', options)
          command.request_representation = Google::Apis::SqlV1beta4::BackupRun::Representation
          command.request_object = backup_run_object
          command.response_representation = Google::Apis::SqlV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqlV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
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
        # @param [String] parent
        #   The parent, which owns this collection of backupRuns.
        #   Format: projects/`project`/locations/`location`/instances/`instance`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqlV1beta4::BackupRunsListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqlV1beta4::BackupRunsListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_backup_runs(project, instance, max_results: nil, page_token: nil, parent: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'sql/v1beta4/projects/{project}/instances/{instance}/backupRuns', options)
          command.response_representation = Google::Apis::SqlV1beta4::BackupRunsListResponse::Representation
          command.response_class = Google::Apis::SqlV1beta4::BackupRunsListResponse
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
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
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqlV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqlV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_database(project, instance, database, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'sql/v1beta4/projects/{project}/instances/{instance}/databases/{database}', options)
          command.response_representation = Google::Apis::SqlV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqlV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.params['database'] = database unless database.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
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
        # @param [String] resource_name
        #   Name of the resource database.
        #   Format:
        #   projects/`project`/locations/`location`/instances/`instance`/databases/`
        #   database`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqlV1beta4::Database] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqlV1beta4::Database]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_database(project, instance, database, resource_name: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'sql/v1beta4/projects/{project}/instances/{instance}/databases/{database}', options)
          command.response_representation = Google::Apis::SqlV1beta4::Database::Representation
          command.response_class = Google::Apis::SqlV1beta4::Database
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.params['database'] = database unless database.nil?
          command.query['resourceName'] = resource_name unless resource_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Inserts a resource containing information about a database inside a Cloud
        # SQL instance.
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] instance
        #   Database instance ID. This does not include the project ID.
        # @param [Google::Apis::SqlV1beta4::Database] database_object
        # @param [String] parent
        #   The parent resource where Cloud SQL should add this database.
        #   Format: projects/`project`/locations/`location`/instances/`instance`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqlV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqlV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_database(project, instance, database_object = nil, parent: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'sql/v1beta4/projects/{project}/instances/{instance}/databases', options)
          command.request_representation = Google::Apis::SqlV1beta4::Database::Representation
          command.request_object = database_object
          command.response_representation = Google::Apis::SqlV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqlV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists databases in the specified Cloud SQL instance.
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] instance
        #   Cloud SQL instance ID. This does not include the project ID.
        # @param [String] parent
        #   The parent, which owns this collection of databases.
        #   Format: projects/`project`/locations/`location`/instances/`instance`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqlV1beta4::DatabasesListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqlV1beta4::DatabasesListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_databases(project, instance, parent: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'sql/v1beta4/projects/{project}/instances/{instance}/databases', options)
          command.response_representation = Google::Apis::SqlV1beta4::DatabasesListResponse::Representation
          command.response_class = Google::Apis::SqlV1beta4::DatabasesListResponse
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Partially updates a resource containing information about a database inside
        # a Cloud SQL instance. This method supports patch semantics.
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] instance
        #   Database instance ID. This does not include the project ID.
        # @param [String] database
        #   Name of the database to be updated in the instance.
        # @param [Google::Apis::SqlV1beta4::Database] database_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqlV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqlV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_database(project, instance, database, database_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'sql/v1beta4/projects/{project}/instances/{instance}/databases/{database}', options)
          command.request_representation = Google::Apis::SqlV1beta4::Database::Representation
          command.request_object = database_object
          command.response_representation = Google::Apis::SqlV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqlV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.params['database'] = database unless database.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a resource containing information about a database inside a Cloud
        # SQL instance.
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] instance
        #   Database instance ID. This does not include the project ID.
        # @param [String] database
        #   Name of the database to be updated in the instance.
        # @param [Google::Apis::SqlV1beta4::Database] database_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqlV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqlV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_database(project, instance, database, database_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:put, 'sql/v1beta4/projects/{project}/instances/{instance}/databases/{database}', options)
          command.request_representation = Google::Apis::SqlV1beta4::Database::Representation
          command.request_object = database_object
          command.response_representation = Google::Apis::SqlV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqlV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.params['database'] = database unless database.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List all available database flags for Cloud SQL instances.
        # @param [String] database_version
        #   Database type and version you want to retrieve flags for. By default, this
        #   method returns flags for all database types and versions.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqlV1beta4::FlagsListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqlV1beta4::FlagsListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_flags(database_version: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'sql/v1beta4/flags', options)
          command.response_representation = Google::Apis::SqlV1beta4::FlagsListResponse::Representation
          command.response_class = Google::Apis::SqlV1beta4::FlagsListResponse
          command.query['databaseVersion'] = database_version unless database_version.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Add a new trusted Certificate Authority (CA) version for the specified
        # instance. Required to prepare for a certificate rotation. If a CA version
        # was previously added but never used in a certificate rotation, this
        # operation replaces that version. There cannot be more than one CA version
        # waiting to be rotated in.
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] instance
        #   Cloud SQL instance ID. This does not include the project ID.
        # @param [String] parent
        #   The parent resource where Cloud SQL should add this server CA.
        #   Format: projects/`project`/locations/`location`/instances/`instance`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqlV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqlV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def add_instance_server_ca(project, instance, parent: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'sql/v1beta4/projects/{project}/instances/{instance}/addServerCa', options)
          command.response_representation = Google::Apis::SqlV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqlV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a Cloud SQL instance as a clone of the source instance.
        # @param [String] project
        #   Project ID of the source as well as the clone Cloud SQL instance.
        # @param [String] instance
        #   The ID of the Cloud SQL instance to be cloned (source). This does not
        #   include the project ID.
        # @param [Google::Apis::SqlV1beta4::InstancesCloneRequest] instances_clone_request_object
        # @param [String] parent
        #   The parent resource where Cloud SQL should clone this instance.
        #   Format: projects/`project`/locations/`location`/instances/`instance`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqlV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqlV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def clone_instance(project, instance, instances_clone_request_object = nil, parent: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'sql/v1beta4/projects/{project}/instances/{instance}/clone', options)
          command.request_representation = Google::Apis::SqlV1beta4::InstancesCloneRequest::Representation
          command.request_object = instances_clone_request_object
          command.response_representation = Google::Apis::SqlV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqlV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
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
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqlV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqlV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_instance(project, instance, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'sql/v1beta4/projects/{project}/instances/{instance}', options)
          command.response_representation = Google::Apis::SqlV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqlV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Demotes the stand-alone instance to be a Cloud SQL read replica for an
        # external database server.
        # @param [String] project
        #   ID of the project that contains the instance.
        # @param [String] instance
        #   Cloud SQL instance name.
        # @param [Google::Apis::SqlV1beta4::InstancesDemoteMasterRequest] instances_demote_master_request_object
        # @param [String] parent
        #   The parent resource where Cloud SQL demotes this master database instance.
        #   Format: projects/`project`/locations/`location`/instances/`instance`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqlV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqlV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def demote_instance_master(project, instance, instances_demote_master_request_object = nil, parent: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'sql/v1beta4/projects/{project}/instances/{instance}/demoteMaster', options)
          command.request_representation = Google::Apis::SqlV1beta4::InstancesDemoteMasterRequest::Representation
          command.request_object = instances_demote_master_request_object
          command.response_representation = Google::Apis::SqlV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqlV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Exports data from a Cloud SQL instance to a Cloud Storage bucket as a SQL
        # dump or CSV file.
        # @param [String] project
        #   Project ID of the project that contains the instance to be exported.
        # @param [String] instance
        #   Cloud SQL instance ID. This does not include the project ID.
        # @param [Google::Apis::SqlV1beta4::InstancesExportRequest] instances_export_request_object
        # @param [String] parent
        #   The parent resource where Cloud SQL exports this database instance.
        #   Format: projects/`project`/locations/`location`/instances/`instance`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqlV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqlV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def export_instance(project, instance, instances_export_request_object = nil, parent: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'sql/v1beta4/projects/{project}/instances/{instance}/export', options)
          command.request_representation = Google::Apis::SqlV1beta4::InstancesExportRequest::Representation
          command.request_object = instances_export_request_object
          command.response_representation = Google::Apis::SqlV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqlV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Failover the instance to its failover replica instance.
        # @param [String] project
        #   ID of the project that contains the read replica.
        # @param [String] instance
        #   Cloud SQL instance ID. This does not include the project ID.
        # @param [Google::Apis::SqlV1beta4::InstancesFailoverRequest] instances_failover_request_object
        # @param [String] parent
        #   The parent resource where Cloud SQL sends this database instance during a
        #   failover. Format:
        #   projects/`project`/locations/`location`/instances/`instance`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqlV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqlV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def failover_instance(project, instance, instances_failover_request_object = nil, parent: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'sql/v1beta4/projects/{project}/instances/{instance}/failover', options)
          command.request_representation = Google::Apis::SqlV1beta4::InstancesFailoverRequest::Representation
          command.request_object = instances_failover_request_object
          command.response_representation = Google::Apis::SqlV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqlV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a resource containing information about a Cloud SQL instance.
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] instance
        #   Database instance ID. This does not include the project ID.
        # @param [String] resource_name
        #   Name of the resource database instance.
        #   Format: projects/`project`/locations/`location`/instances/`instance`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqlV1beta4::DatabaseInstance] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqlV1beta4::DatabaseInstance]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_instance(project, instance, resource_name: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'sql/v1beta4/projects/{project}/instances/{instance}', options)
          command.response_representation = Google::Apis::SqlV1beta4::DatabaseInstance::Representation
          command.response_class = Google::Apis::SqlV1beta4::DatabaseInstance
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['resourceName'] = resource_name unless resource_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Imports data into a Cloud SQL instance from a SQL dump  or CSV file in
        # Cloud Storage.
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] instance
        #   Cloud SQL instance ID. This does not include the project ID.
        # @param [Google::Apis::SqlV1beta4::InstancesImportRequest] instances_import_request_object
        # @param [String] parent
        #   The parent resource where Cloud SQL imports this database instance.
        #   Format: projects/`project`/locations/`location`/instances/`instance`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqlV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqlV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def import_instance(project, instance, instances_import_request_object = nil, parent: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'sql/v1beta4/projects/{project}/instances/{instance}/import', options)
          command.request_representation = Google::Apis::SqlV1beta4::InstancesImportRequest::Representation
          command.request_object = instances_import_request_object
          command.response_representation = Google::Apis::SqlV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqlV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new Cloud SQL instance.
        # @param [String] project
        #   Project ID of the project to which the newly created Cloud SQL instances
        #   should belong.
        # @param [Google::Apis::SqlV1beta4::DatabaseInstance] database_instance_object
        # @param [String] parent
        #   The parent resource where Cloud SQL creates this database instance.
        #   Format: projects/`project`/locations/`location`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqlV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqlV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_instance(project, database_instance_object = nil, parent: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'sql/v1beta4/projects/{project}/instances', options)
          command.request_representation = Google::Apis::SqlV1beta4::DatabaseInstance::Representation
          command.request_object = database_instance_object
          command.response_representation = Google::Apis::SqlV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqlV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.query['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
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
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqlV1beta4::InstancesListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqlV1beta4::InstancesListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_instances(project, filter: nil, max_results: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'sql/v1beta4/projects/{project}/instances', options)
          command.response_representation = Google::Apis::SqlV1beta4::InstancesListResponse::Representation
          command.response_class = Google::Apis::SqlV1beta4::InstancesListResponse
          command.params['project'] = project unless project.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all of the trusted Certificate Authorities (CAs) for the specified
        # instance. There can be up to three CAs listed: the CA that was used to sign
        # the certificate that is currently in use, a CA that has been added but not
        # yet used to sign a certificate, and a CA used to sign a certificate that
        # has previously rotated out.
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] instance
        #   Cloud SQL instance ID. This does not include the project ID.
        # @param [String] parent
        #   The parent, which owns this collection of server CAs.
        #   Format: projects/`project`/locations/`location`/instances/`instance`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqlV1beta4::InstancesListServerCasResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqlV1beta4::InstancesListServerCasResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_instance_server_cas(project, instance, parent: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'sql/v1beta4/projects/{project}/instances/{instance}/listServerCas', options)
          command.response_representation = Google::Apis::SqlV1beta4::InstancesListServerCasResponse::Representation
          command.response_class = Google::Apis::SqlV1beta4::InstancesListServerCasResponse
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates settings of a Cloud SQL instance.
        # This method supports patch semantics.
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] instance
        #   Cloud SQL instance ID. This does not include the project ID.
        # @param [Google::Apis::SqlV1beta4::DatabaseInstance] database_instance_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqlV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqlV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_instance(project, instance, database_instance_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'sql/v1beta4/projects/{project}/instances/{instance}', options)
          command.request_representation = Google::Apis::SqlV1beta4::DatabaseInstance::Representation
          command.request_object = database_instance_object
          command.response_representation = Google::Apis::SqlV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqlV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Promotes the read replica instance to be a stand-alone Cloud SQL instance.
        # @param [String] project
        #   ID of the project that contains the read replica.
        # @param [String] instance
        #   Cloud SQL read replica instance name.
        # @param [String] parent
        #   The parent resource where Cloud SQL promotes this replica database
        #   instance. Format: projects/`project`/locations/`location`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqlV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqlV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def promote_instance_replica(project, instance, parent: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'sql/v1beta4/projects/{project}/instances/{instance}/promoteReplica', options)
          command.response_representation = Google::Apis::SqlV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqlV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes all client certificates and generates a new server SSL certificate
        # for the instance.
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] instance
        #   Cloud SQL instance ID. This does not include the project ID.
        # @param [String] parent
        #   The parent resource where Cloud SQL resets this SSL config.
        #   Format: projects/`project`/locations/`location`/instances/`instance`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqlV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqlV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def reset_instance_ssl_config(project, instance, parent: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'sql/v1beta4/projects/{project}/instances/{instance}/resetSslConfig', options)
          command.response_representation = Google::Apis::SqlV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqlV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Restarts a Cloud SQL instance.
        # @param [String] project
        #   Project ID of the project that contains the instance to be restarted.
        # @param [String] instance
        #   Cloud SQL instance ID. This does not include the project ID.
        # @param [String] parent
        #   The parent resource where Cloud SQL restarts this database instance.
        #   Format: projects/`project`/locations/`location`/instances/`instance`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqlV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqlV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def restart_instance(project, instance, parent: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'sql/v1beta4/projects/{project}/instances/{instance}/restart', options)
          command.response_representation = Google::Apis::SqlV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqlV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Restores a backup of a Cloud SQL instance.
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] instance
        #   Cloud SQL instance ID. This does not include the project ID.
        # @param [Google::Apis::SqlV1beta4::InstancesRestoreBackupRequest] instances_restore_backup_request_object
        # @param [String] parent
        #   The parent resource where Cloud SQL restores this database instance from
        #   backup. Format:
        #   projects/`project`/locations/`location`/instances/`instance`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqlV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqlV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def restore_instance_backup(project, instance, instances_restore_backup_request_object = nil, parent: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'sql/v1beta4/projects/{project}/instances/{instance}/restoreBackup', options)
          command.request_representation = Google::Apis::SqlV1beta4::InstancesRestoreBackupRequest::Representation
          command.request_object = instances_restore_backup_request_object
          command.response_representation = Google::Apis::SqlV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqlV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Rotates the server certificate to one signed by the Certificate Authority
        # (CA) version previously added with the addServerCA method.
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] instance
        #   Cloud SQL instance ID. This does not include the project ID.
        # @param [Google::Apis::SqlV1beta4::InstancesRotateServerCaRequest] instances_rotate_server_ca_request_object
        # @param [String] parent
        #   The parent resource where Cloud SQL rotates these server CAs.
        #   Format: projects/`project`/locations/`location`/instances/`instance`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqlV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqlV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def rotate_instance_server_ca(project, instance, instances_rotate_server_ca_request_object = nil, parent: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'sql/v1beta4/projects/{project}/instances/{instance}/rotateServerCa', options)
          command.request_representation = Google::Apis::SqlV1beta4::InstancesRotateServerCaRequest::Representation
          command.request_object = instances_rotate_server_ca_request_object
          command.response_representation = Google::Apis::SqlV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqlV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Starts the replication in the read replica instance.
        # @param [String] project
        #   ID of the project that contains the read replica.
        # @param [String] instance
        #   Cloud SQL read replica instance name.
        # @param [String] parent
        #   The parent resource where Cloud SQL starts this database instance
        #   replication. Format:
        #   projects/`project`/locations/`location`/instances/`instance`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqlV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqlV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def start_instance_replica(project, instance, parent: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'sql/v1beta4/projects/{project}/instances/{instance}/startReplica', options)
          command.response_representation = Google::Apis::SqlV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqlV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Stops the replication in the read replica instance.
        # @param [String] project
        #   ID of the project that contains the read replica.
        # @param [String] instance
        #   Cloud SQL read replica instance name.
        # @param [String] parent
        #   The parent resource where Cloud SQL stops this database instance
        #   replication. Format:
        #   projects/`project`/locations/`location`/instances/`instance`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqlV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqlV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def stop_instance_replica(project, instance, parent: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'sql/v1beta4/projects/{project}/instances/{instance}/stopReplica', options)
          command.response_representation = Google::Apis::SqlV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqlV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Truncate MySQL general and slow query log tables
        # @param [String] project
        #   Project ID of the Cloud SQL project.
        # @param [String] instance
        #   Cloud SQL instance ID. This does not include the project ID.
        # @param [Google::Apis::SqlV1beta4::InstancesTruncateLogRequest] instances_truncate_log_request_object
        # @param [String] parent
        #   The parent resource where Cloud SQL truncates this log.
        #   Format: projects/`project`/locations/`location`/instances/`instance`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqlV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqlV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def truncate_instance_log(project, instance, instances_truncate_log_request_object = nil, parent: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'sql/v1beta4/projects/{project}/instances/{instance}/truncateLog', options)
          command.request_representation = Google::Apis::SqlV1beta4::InstancesTruncateLogRequest::Representation
          command.request_object = instances_truncate_log_request_object
          command.response_representation = Google::Apis::SqlV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqlV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates settings of a Cloud SQL instance. <aside
        # class="caution"><strong>Caution:</strong> This is not a partial update, so
        # you must include values for all the settings that you want to retain. For
        # partial updates, use <a
        # href="/sql/docs/db_path/admin-api/rest/v1beta4/instances/patch">patch</a>.</
        # aside>
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] instance
        #   Cloud SQL instance ID. This does not include the project ID.
        # @param [Google::Apis::SqlV1beta4::DatabaseInstance] database_instance_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqlV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqlV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_instance(project, instance, database_instance_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:put, 'sql/v1beta4/projects/{project}/instances/{instance}', options)
          command.request_representation = Google::Apis::SqlV1beta4::DatabaseInstance::Representation
          command.request_object = database_instance_object
          command.response_representation = Google::Apis::SqlV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqlV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
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
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqlV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqlV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_operation(project, operation, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'sql/v1beta4/projects/{project}/operations/{operation}', options)
          command.response_representation = Google::Apis::SqlV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqlV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['operation'] = operation unless operation.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all instance operations that have been performed on the given Cloud
        # SQL instance in the reverse chronological order of the start time.
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] instance
        #   Cloud SQL instance ID. This does not include the project ID.
        # @param [Fixnum] max_results
        #   Maximum number of operations per response.
        # @param [String] page_token
        #   A previously-returned page token representing part of the larger set of
        #   results to view.
        # @param [String] parent
        #   Indirect parent. The direct parent should combine with the instance name,
        #   which owns this collection of operations.
        #   Format:
        #   projects/`project`/locations/`location`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqlV1beta4::OperationsListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqlV1beta4::OperationsListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_operations(project, instance: nil, max_results: nil, page_token: nil, parent: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'sql/v1beta4/projects/{project}/operations', options)
          command.response_representation = Google::Apis::SqlV1beta4::OperationsListResponse::Representation
          command.response_class = Google::Apis::SqlV1beta4::OperationsListResponse
          command.params['project'] = project unless project.nil?
          command.query['instance'] = instance unless instance.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Generates a short-lived X509 certificate containing the provided public key
        # and signed by a private key specific to the target instance. Users may use
        # the certificate to authenticate as themselves when connecting to the
        # database.
        # @param [String] project
        #   Project ID of the Cloud SQL project.
        # @param [String] instance
        #   Cloud SQL instance ID. This does not include the project ID.
        # @param [Google::Apis::SqlV1beta4::SslCertsCreateEphemeralRequest] ssl_certs_create_ephemeral_request_object
        # @param [String] parent
        #   The parent resource where Cloud SQL creates this ephemeral certificate.
        #   Format: projects/`project`/locations/`location`/instances/`instance`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqlV1beta4::SslCert] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqlV1beta4::SslCert]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_ssl_cert_ephemeral(project, instance, ssl_certs_create_ephemeral_request_object = nil, parent: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'sql/v1beta4/projects/{project}/instances/{instance}/createEphemeral', options)
          command.request_representation = Google::Apis::SqlV1beta4::SslCertsCreateEphemeralRequest::Representation
          command.request_object = ssl_certs_create_ephemeral_request_object
          command.response_representation = Google::Apis::SqlV1beta4::SslCert::Representation
          command.response_class = Google::Apis::SqlV1beta4::SslCert
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes the SSL certificate. For First Generation instances, the
        # certificate remains valid until the instance is restarted.
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] instance
        #   Cloud SQL instance ID. This does not include the project ID.
        # @param [String] sha1_fingerprint
        #   Sha1 FingerPrint.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqlV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqlV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_ssl_cert(project, instance, sha1_fingerprint, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'sql/v1beta4/projects/{project}/instances/{instance}/sslCerts/{sha1Fingerprint}', options)
          command.response_representation = Google::Apis::SqlV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqlV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.params['sha1Fingerprint'] = sha1_fingerprint unless sha1_fingerprint.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a particular SSL certificate.  Does not include the private key
        # (required for usage).  The private key must be saved from the response to
        # initial creation.
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] instance
        #   Cloud SQL instance ID. This does not include the project ID.
        # @param [String] sha1_fingerprint
        #   Sha1 FingerPrint.
        # @param [String] resource_name
        #   Name of the resource ssl certificate.
        #   Format:
        #   projects/`project`/locations/`location`/instances/`instance`/sslCerts/`sslCert`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqlV1beta4::SslCert] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqlV1beta4::SslCert]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_ssl_cert(project, instance, sha1_fingerprint, resource_name: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'sql/v1beta4/projects/{project}/instances/{instance}/sslCerts/{sha1Fingerprint}', options)
          command.response_representation = Google::Apis::SqlV1beta4::SslCert::Representation
          command.response_class = Google::Apis::SqlV1beta4::SslCert
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.params['sha1Fingerprint'] = sha1_fingerprint unless sha1_fingerprint.nil?
          command.query['resourceName'] = resource_name unless resource_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates an SSL certificate and returns it along with the private key and
        # server certificate authority.  The new certificate will not be usable until
        # the instance is restarted.
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] instance
        #   Cloud SQL instance ID. This does not include the project ID.
        # @param [Google::Apis::SqlV1beta4::SslCertsInsertRequest] ssl_certs_insert_request_object
        # @param [String] parent
        #   The parent resource where Cloud SQL creates this SSL certificate.
        #   Format: projects/`project`/locations/`location`/instances/`instance`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqlV1beta4::SslCertsInsertResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqlV1beta4::SslCertsInsertResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_ssl_cert(project, instance, ssl_certs_insert_request_object = nil, parent: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'sql/v1beta4/projects/{project}/instances/{instance}/sslCerts', options)
          command.request_representation = Google::Apis::SqlV1beta4::SslCertsInsertRequest::Representation
          command.request_object = ssl_certs_insert_request_object
          command.response_representation = Google::Apis::SqlV1beta4::SslCertsInsertResponse::Representation
          command.response_class = Google::Apis::SqlV1beta4::SslCertsInsertResponse
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all of the current SSL certificates for the instance.
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] instance
        #   Cloud SQL instance ID. This does not include the project ID.
        # @param [String] parent
        #   The parent, which owns this collection of SSL certificates.
        #   Format: projects/`project`/locations/`location`/instances/`instance`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqlV1beta4::SslCertsListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqlV1beta4::SslCertsListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_ssl_certs(project, instance, parent: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'sql/v1beta4/projects/{project}/instances/{instance}/sslCerts', options)
          command.response_representation = Google::Apis::SqlV1beta4::SslCertsListResponse::Representation
          command.response_class = Google::Apis::SqlV1beta4::SslCertsListResponse
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all available machine types (tiers) for Cloud SQL, for example,
        # db-n1-standard-1. For related information, see <a
        # href="/sql/pricing">Pricing</a>.
        # @param [String] project
        #   Project ID of the project for which to list tiers.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqlV1beta4::TiersListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqlV1beta4::TiersListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_tiers(project, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'sql/v1beta4/projects/{project}/tiers', options)
          command.response_representation = Google::Apis::SqlV1beta4::TiersListResponse::Representation
          command.response_class = Google::Apis::SqlV1beta4::TiersListResponse
          command.params['project'] = project unless project.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
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
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqlV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqlV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_user(project, instance, host: nil, name: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'sql/v1beta4/projects/{project}/instances/{instance}/users', options)
          command.response_representation = Google::Apis::SqlV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqlV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['host'] = host unless host.nil?
          command.query['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new user in a Cloud SQL instance.
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] instance
        #   Database instance ID. This does not include the project ID.
        # @param [Google::Apis::SqlV1beta4::User] user_object
        # @param [String] parent
        #   The parent resource where Cloud SQL creates this user.
        #   Format: projects/`project`/locations/`location`/instances/`instance`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqlV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqlV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_user(project, instance, user_object = nil, parent: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'sql/v1beta4/projects/{project}/instances/{instance}/users', options)
          command.request_representation = Google::Apis::SqlV1beta4::User::Representation
          command.request_object = user_object
          command.response_representation = Google::Apis::SqlV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqlV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists users in the specified Cloud SQL instance.
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] instance
        #   Database instance ID. This does not include the project ID.
        # @param [String] parent
        #   The parent, which owns this collection of users.
        #   Format: projects/`project`/locations/`location`/instances/`instance`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqlV1beta4::UsersListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqlV1beta4::UsersListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_users(project, instance, parent: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'sql/v1beta4/projects/{project}/instances/{instance}/users', options)
          command.response_representation = Google::Apis::SqlV1beta4::UsersListResponse::Representation
          command.response_class = Google::Apis::SqlV1beta4::UsersListResponse
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing user in a Cloud SQL instance.
        # @param [String] project
        #   Project ID of the project that contains the instance.
        # @param [String] instance
        #   Database instance ID. This does not include the project ID.
        # @param [Google::Apis::SqlV1beta4::User] user_object
        # @param [String] host
        #   Host of the user in the instance. For a MySQL instance, it's required; For
        #   a PostgreSQL instance, it's optional.
        # @param [String] name
        #   Name of the user in the instance.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SqlV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SqlV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_user(project, instance, user_object = nil, host: nil, name: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:put, 'sql/v1beta4/projects/{project}/instances/{instance}/users', options)
          command.request_representation = Google::Apis::SqlV1beta4::User::Representation
          command.request_object = user_object
          command.response_representation = Google::Apis::SqlV1beta4::Operation::Representation
          command.response_class = Google::Apis::SqlV1beta4::Operation
          command.params['project'] = project unless project.nil?
          command.params['instance'] = instance unless instance.nil?
          command.query['host'] = host unless host.nil?
          command.query['name'] = name unless name.nil?
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
