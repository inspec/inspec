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
    module StorageV1beta2
      # Cloud Storage JSON API
      #
      # Lets you store and retrieve potentially-large, immutable data objects.
      #
      # @example
      #    require 'google/apis/storage_v1beta2'
      #
      #    Storage = Google::Apis::StorageV1beta2 # Alias the module
      #    service = Storage::StorageService.new
      #
      # @see https://developers.google.com/storage/docs/json_api/
      class StorageService < Google::Apis::Core::BaseService
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
          super('https://www.googleapis.com/', 'storage/v1beta2/')
          @batch_path = 'batch/storage/v1beta2'
        end
        
        # Permanently deletes the ACL entry for the specified entity on the specified
        # bucket.
        # @param [String] bucket
        #   Name of a bucket.
        # @param [String] entity
        #   The entity holding the permission. Can be user-userId, user-emailAddress,
        #   group-groupId, group-emailAddress, allUsers, or allAuthenticatedUsers.
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
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_bucket_access_control(bucket, entity, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'b/{bucket}/acl/{entity}', options)
          command.params['bucket'] = bucket unless bucket.nil?
          command.params['entity'] = entity unless entity.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns the ACL entry for the specified entity on the specified bucket.
        # @param [String] bucket
        #   Name of a bucket.
        # @param [String] entity
        #   The entity holding the permission. Can be user-userId, user-emailAddress,
        #   group-groupId, group-emailAddress, allUsers, or allAuthenticatedUsers.
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
        # @yieldparam result [Google::Apis::StorageV1beta2::BucketAccessControl] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::StorageV1beta2::BucketAccessControl]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_bucket_access_control(bucket, entity, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'b/{bucket}/acl/{entity}', options)
          command.response_representation = Google::Apis::StorageV1beta2::BucketAccessControl::Representation
          command.response_class = Google::Apis::StorageV1beta2::BucketAccessControl
          command.params['bucket'] = bucket unless bucket.nil?
          command.params['entity'] = entity unless entity.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new ACL entry on the specified bucket.
        # @param [String] bucket
        #   Name of a bucket.
        # @param [Google::Apis::StorageV1beta2::BucketAccessControl] bucket_access_control_object
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
        # @yieldparam result [Google::Apis::StorageV1beta2::BucketAccessControl] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::StorageV1beta2::BucketAccessControl]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_bucket_access_control(bucket, bucket_access_control_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'b/{bucket}/acl', options)
          command.request_representation = Google::Apis::StorageV1beta2::BucketAccessControl::Representation
          command.request_object = bucket_access_control_object
          command.response_representation = Google::Apis::StorageV1beta2::BucketAccessControl::Representation
          command.response_class = Google::Apis::StorageV1beta2::BucketAccessControl
          command.params['bucket'] = bucket unless bucket.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves ACL entries on the specified bucket.
        # @param [String] bucket
        #   Name of a bucket.
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
        # @yieldparam result [Google::Apis::StorageV1beta2::BucketAccessControls] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::StorageV1beta2::BucketAccessControls]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_bucket_access_controls(bucket, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'b/{bucket}/acl', options)
          command.response_representation = Google::Apis::StorageV1beta2::BucketAccessControls::Representation
          command.response_class = Google::Apis::StorageV1beta2::BucketAccessControls
          command.params['bucket'] = bucket unless bucket.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an ACL entry on the specified bucket. This method supports patch
        # semantics.
        # @param [String] bucket
        #   Name of a bucket.
        # @param [String] entity
        #   The entity holding the permission. Can be user-userId, user-emailAddress,
        #   group-groupId, group-emailAddress, allUsers, or allAuthenticatedUsers.
        # @param [Google::Apis::StorageV1beta2::BucketAccessControl] bucket_access_control_object
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
        # @yieldparam result [Google::Apis::StorageV1beta2::BucketAccessControl] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::StorageV1beta2::BucketAccessControl]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_bucket_access_control(bucket, entity, bucket_access_control_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'b/{bucket}/acl/{entity}', options)
          command.request_representation = Google::Apis::StorageV1beta2::BucketAccessControl::Representation
          command.request_object = bucket_access_control_object
          command.response_representation = Google::Apis::StorageV1beta2::BucketAccessControl::Representation
          command.response_class = Google::Apis::StorageV1beta2::BucketAccessControl
          command.params['bucket'] = bucket unless bucket.nil?
          command.params['entity'] = entity unless entity.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an ACL entry on the specified bucket.
        # @param [String] bucket
        #   Name of a bucket.
        # @param [String] entity
        #   The entity holding the permission. Can be user-userId, user-emailAddress,
        #   group-groupId, group-emailAddress, allUsers, or allAuthenticatedUsers.
        # @param [Google::Apis::StorageV1beta2::BucketAccessControl] bucket_access_control_object
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
        # @yieldparam result [Google::Apis::StorageV1beta2::BucketAccessControl] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::StorageV1beta2::BucketAccessControl]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_bucket_access_control(bucket, entity, bucket_access_control_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'b/{bucket}/acl/{entity}', options)
          command.request_representation = Google::Apis::StorageV1beta2::BucketAccessControl::Representation
          command.request_object = bucket_access_control_object
          command.response_representation = Google::Apis::StorageV1beta2::BucketAccessControl::Representation
          command.response_class = Google::Apis::StorageV1beta2::BucketAccessControl
          command.params['bucket'] = bucket unless bucket.nil?
          command.params['entity'] = entity unless entity.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Permanently deletes an empty bucket.
        # @param [String] bucket
        #   Name of a bucket.
        # @param [Fixnum] if_metageneration_match
        #   Makes the return of the bucket metadata conditional on whether the bucket's
        #   current metageneration matches the given value.
        # @param [Fixnum] if_metageneration_not_match
        #   Makes the return of the bucket metadata conditional on whether the bucket's
        #   current metageneration does not match the given value.
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
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_bucket(bucket, if_metageneration_match: nil, if_metageneration_not_match: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'b/{bucket}', options)
          command.params['bucket'] = bucket unless bucket.nil?
          command.query['ifMetagenerationMatch'] = if_metageneration_match unless if_metageneration_match.nil?
          command.query['ifMetagenerationNotMatch'] = if_metageneration_not_match unless if_metageneration_not_match.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns metadata for the specified bucket.
        # @param [String] bucket
        #   Name of a bucket.
        # @param [Fixnum] if_metageneration_match
        #   Makes the return of the bucket metadata conditional on whether the bucket's
        #   current metageneration matches the given value.
        # @param [Fixnum] if_metageneration_not_match
        #   Makes the return of the bucket metadata conditional on whether the bucket's
        #   current metageneration does not match the given value.
        # @param [String] projection
        #   Set of properties to return. Defaults to noAcl.
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
        # @yieldparam result [Google::Apis::StorageV1beta2::Bucket] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::StorageV1beta2::Bucket]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_bucket(bucket, if_metageneration_match: nil, if_metageneration_not_match: nil, projection: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'b/{bucket}', options)
          command.response_representation = Google::Apis::StorageV1beta2::Bucket::Representation
          command.response_class = Google::Apis::StorageV1beta2::Bucket
          command.params['bucket'] = bucket unless bucket.nil?
          command.query['ifMetagenerationMatch'] = if_metageneration_match unless if_metageneration_match.nil?
          command.query['ifMetagenerationNotMatch'] = if_metageneration_not_match unless if_metageneration_not_match.nil?
          command.query['projection'] = projection unless projection.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new bucket.
        # @param [String] project
        #   A valid API project identifier.
        # @param [Google::Apis::StorageV1beta2::Bucket] bucket_object
        # @param [String] projection
        #   Set of properties to return. Defaults to noAcl, unless the bucket resource
        #   specifies acl or defaultObjectAcl properties, when it defaults to full.
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
        # @yieldparam result [Google::Apis::StorageV1beta2::Bucket] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::StorageV1beta2::Bucket]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_bucket(project, bucket_object = nil, projection: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'b', options)
          command.request_representation = Google::Apis::StorageV1beta2::Bucket::Representation
          command.request_object = bucket_object
          command.response_representation = Google::Apis::StorageV1beta2::Bucket::Representation
          command.response_class = Google::Apis::StorageV1beta2::Bucket
          command.query['project'] = project unless project.nil?
          command.query['projection'] = projection unless projection.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of buckets for a given project.
        # @param [String] project
        #   A valid API project identifier.
        # @param [Fixnum] max_results
        #   Maximum number of buckets to return.
        # @param [String] page_token
        #   A previously-returned page token representing part of the larger set of
        #   results to view.
        # @param [String] projection
        #   Set of properties to return. Defaults to noAcl.
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
        # @yieldparam result [Google::Apis::StorageV1beta2::Buckets] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::StorageV1beta2::Buckets]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_buckets(project, max_results: nil, page_token: nil, projection: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'b', options)
          command.response_representation = Google::Apis::StorageV1beta2::Buckets::Representation
          command.response_class = Google::Apis::StorageV1beta2::Buckets
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['project'] = project unless project.nil?
          command.query['projection'] = projection unless projection.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a bucket. This method supports patch semantics.
        # @param [String] bucket
        #   Name of a bucket.
        # @param [Google::Apis::StorageV1beta2::Bucket] bucket_object
        # @param [Fixnum] if_metageneration_match
        #   Makes the return of the bucket metadata conditional on whether the bucket's
        #   current metageneration matches the given value.
        # @param [Fixnum] if_metageneration_not_match
        #   Makes the return of the bucket metadata conditional on whether the bucket's
        #   current metageneration does not match the given value.
        # @param [String] projection
        #   Set of properties to return. Defaults to full.
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
        # @yieldparam result [Google::Apis::StorageV1beta2::Bucket] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::StorageV1beta2::Bucket]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_bucket(bucket, bucket_object = nil, if_metageneration_match: nil, if_metageneration_not_match: nil, projection: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'b/{bucket}', options)
          command.request_representation = Google::Apis::StorageV1beta2::Bucket::Representation
          command.request_object = bucket_object
          command.response_representation = Google::Apis::StorageV1beta2::Bucket::Representation
          command.response_class = Google::Apis::StorageV1beta2::Bucket
          command.params['bucket'] = bucket unless bucket.nil?
          command.query['ifMetagenerationMatch'] = if_metageneration_match unless if_metageneration_match.nil?
          command.query['ifMetagenerationNotMatch'] = if_metageneration_not_match unless if_metageneration_not_match.nil?
          command.query['projection'] = projection unless projection.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a bucket.
        # @param [String] bucket
        #   Name of a bucket.
        # @param [Google::Apis::StorageV1beta2::Bucket] bucket_object
        # @param [Fixnum] if_metageneration_match
        #   Makes the return of the bucket metadata conditional on whether the bucket's
        #   current metageneration matches the given value.
        # @param [Fixnum] if_metageneration_not_match
        #   Makes the return of the bucket metadata conditional on whether the bucket's
        #   current metageneration does not match the given value.
        # @param [String] projection
        #   Set of properties to return. Defaults to full.
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
        # @yieldparam result [Google::Apis::StorageV1beta2::Bucket] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::StorageV1beta2::Bucket]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_bucket(bucket, bucket_object = nil, if_metageneration_match: nil, if_metageneration_not_match: nil, projection: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'b/{bucket}', options)
          command.request_representation = Google::Apis::StorageV1beta2::Bucket::Representation
          command.request_object = bucket_object
          command.response_representation = Google::Apis::StorageV1beta2::Bucket::Representation
          command.response_class = Google::Apis::StorageV1beta2::Bucket
          command.params['bucket'] = bucket unless bucket.nil?
          command.query['ifMetagenerationMatch'] = if_metageneration_match unless if_metageneration_match.nil?
          command.query['ifMetagenerationNotMatch'] = if_metageneration_not_match unless if_metageneration_not_match.nil?
          command.query['projection'] = projection unless projection.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Stop watching resources through this channel
        # @param [Google::Apis::StorageV1beta2::Channel] channel_object
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
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def stop_channel(channel_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'channels/stop', options)
          command.request_representation = Google::Apis::StorageV1beta2::Channel::Representation
          command.request_object = channel_object
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Permanently deletes the default object ACL entry for the specified entity on
        # the specified bucket.
        # @param [String] bucket
        #   Name of a bucket.
        # @param [String] entity
        #   The entity holding the permission. Can be user-userId, user-emailAddress,
        #   group-groupId, group-emailAddress, allUsers, or allAuthenticatedUsers.
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
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_default_object_access_control(bucket, entity, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'b/{bucket}/defaultObjectAcl/{entity}', options)
          command.params['bucket'] = bucket unless bucket.nil?
          command.params['entity'] = entity unless entity.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns the default object ACL entry for the specified entity on the specified
        # bucket.
        # @param [String] bucket
        #   Name of a bucket.
        # @param [String] entity
        #   The entity holding the permission. Can be user-userId, user-emailAddress,
        #   group-groupId, group-emailAddress, allUsers, or allAuthenticatedUsers.
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
        # @yieldparam result [Google::Apis::StorageV1beta2::ObjectAccessControl] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::StorageV1beta2::ObjectAccessControl]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_default_object_access_control(bucket, entity, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'b/{bucket}/defaultObjectAcl/{entity}', options)
          command.response_representation = Google::Apis::StorageV1beta2::ObjectAccessControl::Representation
          command.response_class = Google::Apis::StorageV1beta2::ObjectAccessControl
          command.params['bucket'] = bucket unless bucket.nil?
          command.params['entity'] = entity unless entity.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new default object ACL entry on the specified bucket.
        # @param [String] bucket
        #   Name of a bucket.
        # @param [Google::Apis::StorageV1beta2::ObjectAccessControl] object_access_control_object
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
        # @yieldparam result [Google::Apis::StorageV1beta2::ObjectAccessControl] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::StorageV1beta2::ObjectAccessControl]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_default_object_access_control(bucket, object_access_control_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'b/{bucket}/defaultObjectAcl', options)
          command.request_representation = Google::Apis::StorageV1beta2::ObjectAccessControl::Representation
          command.request_object = object_access_control_object
          command.response_representation = Google::Apis::StorageV1beta2::ObjectAccessControl::Representation
          command.response_class = Google::Apis::StorageV1beta2::ObjectAccessControl
          command.params['bucket'] = bucket unless bucket.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves default object ACL entries on the specified bucket.
        # @param [String] bucket
        #   Name of a bucket.
        # @param [Fixnum] if_metageneration_match
        #   If present, only return default ACL listing if the bucket's current
        #   metageneration matches this value.
        # @param [Fixnum] if_metageneration_not_match
        #   If present, only return default ACL listing if the bucket's current
        #   metageneration does not match the given value.
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
        # @yieldparam result [Google::Apis::StorageV1beta2::ObjectAccessControls] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::StorageV1beta2::ObjectAccessControls]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_default_object_access_controls(bucket, if_metageneration_match: nil, if_metageneration_not_match: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'b/{bucket}/defaultObjectAcl', options)
          command.response_representation = Google::Apis::StorageV1beta2::ObjectAccessControls::Representation
          command.response_class = Google::Apis::StorageV1beta2::ObjectAccessControls
          command.params['bucket'] = bucket unless bucket.nil?
          command.query['ifMetagenerationMatch'] = if_metageneration_match unless if_metageneration_match.nil?
          command.query['ifMetagenerationNotMatch'] = if_metageneration_not_match unless if_metageneration_not_match.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a default object ACL entry on the specified bucket. This method
        # supports patch semantics.
        # @param [String] bucket
        #   Name of a bucket.
        # @param [String] entity
        #   The entity holding the permission. Can be user-userId, user-emailAddress,
        #   group-groupId, group-emailAddress, allUsers, or allAuthenticatedUsers.
        # @param [Google::Apis::StorageV1beta2::ObjectAccessControl] object_access_control_object
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
        # @yieldparam result [Google::Apis::StorageV1beta2::ObjectAccessControl] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::StorageV1beta2::ObjectAccessControl]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_default_object_access_control(bucket, entity, object_access_control_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'b/{bucket}/defaultObjectAcl/{entity}', options)
          command.request_representation = Google::Apis::StorageV1beta2::ObjectAccessControl::Representation
          command.request_object = object_access_control_object
          command.response_representation = Google::Apis::StorageV1beta2::ObjectAccessControl::Representation
          command.response_class = Google::Apis::StorageV1beta2::ObjectAccessControl
          command.params['bucket'] = bucket unless bucket.nil?
          command.params['entity'] = entity unless entity.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a default object ACL entry on the specified bucket.
        # @param [String] bucket
        #   Name of a bucket.
        # @param [String] entity
        #   The entity holding the permission. Can be user-userId, user-emailAddress,
        #   group-groupId, group-emailAddress, allUsers, or allAuthenticatedUsers.
        # @param [Google::Apis::StorageV1beta2::ObjectAccessControl] object_access_control_object
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
        # @yieldparam result [Google::Apis::StorageV1beta2::ObjectAccessControl] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::StorageV1beta2::ObjectAccessControl]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_default_object_access_control(bucket, entity, object_access_control_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'b/{bucket}/defaultObjectAcl/{entity}', options)
          command.request_representation = Google::Apis::StorageV1beta2::ObjectAccessControl::Representation
          command.request_object = object_access_control_object
          command.response_representation = Google::Apis::StorageV1beta2::ObjectAccessControl::Representation
          command.response_class = Google::Apis::StorageV1beta2::ObjectAccessControl
          command.params['bucket'] = bucket unless bucket.nil?
          command.params['entity'] = entity unless entity.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Permanently deletes the ACL entry for the specified entity on the specified
        # object.
        # @param [String] bucket
        #   Name of a bucket.
        # @param [String] object
        #   Name of the object.
        # @param [String] entity
        #   The entity holding the permission. Can be user-userId, user-emailAddress,
        #   group-groupId, group-emailAddress, allUsers, or allAuthenticatedUsers.
        # @param [Fixnum] generation
        #   If present, selects a specific revision of this object (as opposed to the
        #   latest version, the default).
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
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_object_access_control(bucket, object, entity, generation: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'b/{bucket}/o/{object}/acl/{entity}', options)
          command.params['bucket'] = bucket unless bucket.nil?
          command.params['object'] = object unless object.nil?
          command.params['entity'] = entity unless entity.nil?
          command.query['generation'] = generation unless generation.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns the ACL entry for the specified entity on the specified object.
        # @param [String] bucket
        #   Name of a bucket.
        # @param [String] object
        #   Name of the object.
        # @param [String] entity
        #   The entity holding the permission. Can be user-userId, user-emailAddress,
        #   group-groupId, group-emailAddress, allUsers, or allAuthenticatedUsers.
        # @param [Fixnum] generation
        #   If present, selects a specific revision of this object (as opposed to the
        #   latest version, the default).
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
        # @yieldparam result [Google::Apis::StorageV1beta2::ObjectAccessControl] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::StorageV1beta2::ObjectAccessControl]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_object_access_control(bucket, object, entity, generation: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'b/{bucket}/o/{object}/acl/{entity}', options)
          command.response_representation = Google::Apis::StorageV1beta2::ObjectAccessControl::Representation
          command.response_class = Google::Apis::StorageV1beta2::ObjectAccessControl
          command.params['bucket'] = bucket unless bucket.nil?
          command.params['object'] = object unless object.nil?
          command.params['entity'] = entity unless entity.nil?
          command.query['generation'] = generation unless generation.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new ACL entry on the specified object.
        # @param [String] bucket
        #   Name of a bucket.
        # @param [String] object
        #   Name of the object.
        # @param [Google::Apis::StorageV1beta2::ObjectAccessControl] object_access_control_object
        # @param [Fixnum] generation
        #   If present, selects a specific revision of this object (as opposed to the
        #   latest version, the default).
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
        # @yieldparam result [Google::Apis::StorageV1beta2::ObjectAccessControl] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::StorageV1beta2::ObjectAccessControl]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_object_access_control(bucket, object, object_access_control_object = nil, generation: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'b/{bucket}/o/{object}/acl', options)
          command.request_representation = Google::Apis::StorageV1beta2::ObjectAccessControl::Representation
          command.request_object = object_access_control_object
          command.response_representation = Google::Apis::StorageV1beta2::ObjectAccessControl::Representation
          command.response_class = Google::Apis::StorageV1beta2::ObjectAccessControl
          command.params['bucket'] = bucket unless bucket.nil?
          command.params['object'] = object unless object.nil?
          command.query['generation'] = generation unless generation.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves ACL entries on the specified object.
        # @param [String] bucket
        #   Name of a bucket.
        # @param [String] object
        #   Name of the object.
        # @param [Fixnum] generation
        #   If present, selects a specific revision of this object (as opposed to the
        #   latest version, the default).
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
        # @yieldparam result [Google::Apis::StorageV1beta2::ObjectAccessControls] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::StorageV1beta2::ObjectAccessControls]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_object_access_controls(bucket, object, generation: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'b/{bucket}/o/{object}/acl', options)
          command.response_representation = Google::Apis::StorageV1beta2::ObjectAccessControls::Representation
          command.response_class = Google::Apis::StorageV1beta2::ObjectAccessControls
          command.params['bucket'] = bucket unless bucket.nil?
          command.params['object'] = object unless object.nil?
          command.query['generation'] = generation unless generation.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an ACL entry on the specified object. This method supports patch
        # semantics.
        # @param [String] bucket
        #   Name of a bucket.
        # @param [String] object
        #   Name of the object.
        # @param [String] entity
        #   The entity holding the permission. Can be user-userId, user-emailAddress,
        #   group-groupId, group-emailAddress, allUsers, or allAuthenticatedUsers.
        # @param [Google::Apis::StorageV1beta2::ObjectAccessControl] object_access_control_object
        # @param [Fixnum] generation
        #   If present, selects a specific revision of this object (as opposed to the
        #   latest version, the default).
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
        # @yieldparam result [Google::Apis::StorageV1beta2::ObjectAccessControl] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::StorageV1beta2::ObjectAccessControl]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_object_access_control(bucket, object, entity, object_access_control_object = nil, generation: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'b/{bucket}/o/{object}/acl/{entity}', options)
          command.request_representation = Google::Apis::StorageV1beta2::ObjectAccessControl::Representation
          command.request_object = object_access_control_object
          command.response_representation = Google::Apis::StorageV1beta2::ObjectAccessControl::Representation
          command.response_class = Google::Apis::StorageV1beta2::ObjectAccessControl
          command.params['bucket'] = bucket unless bucket.nil?
          command.params['object'] = object unless object.nil?
          command.params['entity'] = entity unless entity.nil?
          command.query['generation'] = generation unless generation.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an ACL entry on the specified object.
        # @param [String] bucket
        #   Name of a bucket.
        # @param [String] object
        #   Name of the object.
        # @param [String] entity
        #   The entity holding the permission. Can be user-userId, user-emailAddress,
        #   group-groupId, group-emailAddress, allUsers, or allAuthenticatedUsers.
        # @param [Google::Apis::StorageV1beta2::ObjectAccessControl] object_access_control_object
        # @param [Fixnum] generation
        #   If present, selects a specific revision of this object (as opposed to the
        #   latest version, the default).
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
        # @yieldparam result [Google::Apis::StorageV1beta2::ObjectAccessControl] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::StorageV1beta2::ObjectAccessControl]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_object_access_control(bucket, object, entity, object_access_control_object = nil, generation: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'b/{bucket}/o/{object}/acl/{entity}', options)
          command.request_representation = Google::Apis::StorageV1beta2::ObjectAccessControl::Representation
          command.request_object = object_access_control_object
          command.response_representation = Google::Apis::StorageV1beta2::ObjectAccessControl::Representation
          command.response_class = Google::Apis::StorageV1beta2::ObjectAccessControl
          command.params['bucket'] = bucket unless bucket.nil?
          command.params['object'] = object unless object.nil?
          command.params['entity'] = entity unless entity.nil?
          command.query['generation'] = generation unless generation.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Concatenates a list of existing objects into a new object in the same bucket.
        # @param [String] destination_bucket
        #   Name of the bucket containing the source objects. The destination object is
        #   stored in this bucket.
        # @param [String] destination_object
        #   Name of the new object.
        # @param [Google::Apis::StorageV1beta2::ComposeRequest] compose_request_object
        # @param [Fixnum] if_generation_match
        #   Makes the operation conditional on whether the object's current generation
        #   matches the given value.
        # @param [Fixnum] if_metageneration_match
        #   Makes the operation conditional on whether the object's current metageneration
        #   matches the given value.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [IO, String] download_dest
        #   IO stream or filename to receive content download
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::StorageV1beta2::Object] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::StorageV1beta2::Object]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def compose_object(destination_bucket, destination_object, compose_request_object = nil, if_generation_match: nil, if_metageneration_match: nil, fields: nil, quota_user: nil, user_ip: nil, download_dest: nil, options: nil, &block)
          if download_dest.nil?
            command = make_simple_command(:post, 'b/{destinationBucket}/o/{destinationObject}/compose', options)
          else
            command = make_download_command(:post, 'b/{destinationBucket}/o/{destinationObject}/compose', options)
            command.download_dest = download_dest
          end
          command.request_representation = Google::Apis::StorageV1beta2::ComposeRequest::Representation
          command.request_object = compose_request_object
          command.response_representation = Google::Apis::StorageV1beta2::Object::Representation
          command.response_class = Google::Apis::StorageV1beta2::Object
          command.params['destinationBucket'] = destination_bucket unless destination_bucket.nil?
          command.params['destinationObject'] = destination_object unless destination_object.nil?
          command.query['ifGenerationMatch'] = if_generation_match unless if_generation_match.nil?
          command.query['ifMetagenerationMatch'] = if_metageneration_match unless if_metageneration_match.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Copies an object to a destination in the same location. Optionally overrides
        # metadata.
        # @param [String] source_bucket
        #   Name of the bucket in which to find the source object.
        # @param [String] source_object
        #   Name of the source object.
        # @param [String] destination_bucket
        #   Name of the bucket in which to store the new object. Overrides the provided
        #   object metadata's bucket value, if any.
        # @param [String] destination_object
        #   Name of the new object. Required when the object metadata is not otherwise
        #   provided. Overrides the object metadata's name value, if any.
        # @param [Google::Apis::StorageV1beta2::Object] object_object
        # @param [Fixnum] if_generation_match
        #   Makes the operation conditional on whether the destination object's current
        #   generation matches the given value.
        # @param [Fixnum] if_generation_not_match
        #   Makes the operation conditional on whether the destination object's current
        #   generation does not match the given value.
        # @param [Fixnum] if_metageneration_match
        #   Makes the operation conditional on whether the destination object's current
        #   metageneration matches the given value.
        # @param [Fixnum] if_metageneration_not_match
        #   Makes the operation conditional on whether the destination object's current
        #   metageneration does not match the given value.
        # @param [Fixnum] if_source_generation_match
        #   Makes the operation conditional on whether the source object's generation
        #   matches the given value.
        # @param [Fixnum] if_source_generation_not_match
        #   Makes the operation conditional on whether the source object's generation does
        #   not match the given value.
        # @param [Fixnum] if_source_metageneration_match
        #   Makes the operation conditional on whether the source object's current
        #   metageneration matches the given value.
        # @param [Fixnum] if_source_metageneration_not_match
        #   Makes the operation conditional on whether the source object's current
        #   metageneration does not match the given value.
        # @param [String] projection
        #   Set of properties to return. Defaults to noAcl, unless the object resource
        #   specifies the acl property, when it defaults to full.
        # @param [Fixnum] source_generation
        #   If present, selects a specific revision of the source object (as opposed to
        #   the latest version, the default).
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [IO, String] download_dest
        #   IO stream or filename to receive content download
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::StorageV1beta2::Object] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::StorageV1beta2::Object]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def copy_object(source_bucket, source_object, destination_bucket, destination_object, object_object = nil, if_generation_match: nil, if_generation_not_match: nil, if_metageneration_match: nil, if_metageneration_not_match: nil, if_source_generation_match: nil, if_source_generation_not_match: nil, if_source_metageneration_match: nil, if_source_metageneration_not_match: nil, projection: nil, source_generation: nil, fields: nil, quota_user: nil, user_ip: nil, download_dest: nil, options: nil, &block)
          if download_dest.nil?
            command = make_simple_command(:post, 'b/{sourceBucket}/o/{sourceObject}/copyTo/b/{destinationBucket}/o/{destinationObject}', options)
          else
            command = make_download_command(:post, 'b/{sourceBucket}/o/{sourceObject}/copyTo/b/{destinationBucket}/o/{destinationObject}', options)
            command.download_dest = download_dest
          end
          command.request_representation = Google::Apis::StorageV1beta2::Object::Representation
          command.request_object = object_object
          command.response_representation = Google::Apis::StorageV1beta2::Object::Representation
          command.response_class = Google::Apis::StorageV1beta2::Object
          command.params['sourceBucket'] = source_bucket unless source_bucket.nil?
          command.params['sourceObject'] = source_object unless source_object.nil?
          command.params['destinationBucket'] = destination_bucket unless destination_bucket.nil?
          command.params['destinationObject'] = destination_object unless destination_object.nil?
          command.query['ifGenerationMatch'] = if_generation_match unless if_generation_match.nil?
          command.query['ifGenerationNotMatch'] = if_generation_not_match unless if_generation_not_match.nil?
          command.query['ifMetagenerationMatch'] = if_metageneration_match unless if_metageneration_match.nil?
          command.query['ifMetagenerationNotMatch'] = if_metageneration_not_match unless if_metageneration_not_match.nil?
          command.query['ifSourceGenerationMatch'] = if_source_generation_match unless if_source_generation_match.nil?
          command.query['ifSourceGenerationNotMatch'] = if_source_generation_not_match unless if_source_generation_not_match.nil?
          command.query['ifSourceMetagenerationMatch'] = if_source_metageneration_match unless if_source_metageneration_match.nil?
          command.query['ifSourceMetagenerationNotMatch'] = if_source_metageneration_not_match unless if_source_metageneration_not_match.nil?
          command.query['projection'] = projection unless projection.nil?
          command.query['sourceGeneration'] = source_generation unless source_generation.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes data blobs and associated metadata. Deletions are permanent if
        # versioning is not enabled for the bucket, or if the generation parameter is
        # used.
        # @param [String] bucket
        #   Name of the bucket in which the object resides.
        # @param [String] object
        #   Name of the object.
        # @param [Fixnum] generation
        #   If present, permanently deletes a specific revision of this object (as opposed
        #   to the latest version, the default).
        # @param [Fixnum] if_generation_match
        #   Makes the operation conditional on whether the object's current generation
        #   matches the given value.
        # @param [Fixnum] if_generation_not_match
        #   Makes the operation conditional on whether the object's current generation
        #   does not match the given value.
        # @param [Fixnum] if_metageneration_match
        #   Makes the operation conditional on whether the object's current metageneration
        #   matches the given value.
        # @param [Fixnum] if_metageneration_not_match
        #   Makes the operation conditional on whether the object's current metageneration
        #   does not match the given value.
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
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_object(bucket, object, generation: nil, if_generation_match: nil, if_generation_not_match: nil, if_metageneration_match: nil, if_metageneration_not_match: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'b/{bucket}/o/{object}', options)
          command.params['bucket'] = bucket unless bucket.nil?
          command.params['object'] = object unless object.nil?
          command.query['generation'] = generation unless generation.nil?
          command.query['ifGenerationMatch'] = if_generation_match unless if_generation_match.nil?
          command.query['ifGenerationNotMatch'] = if_generation_not_match unless if_generation_not_match.nil?
          command.query['ifMetagenerationMatch'] = if_metageneration_match unless if_metageneration_match.nil?
          command.query['ifMetagenerationNotMatch'] = if_metageneration_not_match unless if_metageneration_not_match.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves objects or their associated metadata.
        # @param [String] bucket
        #   Name of the bucket in which the object resides.
        # @param [String] object
        #   Name of the object.
        # @param [Fixnum] generation
        #   If present, selects a specific revision of this object (as opposed to the
        #   latest version, the default).
        # @param [Fixnum] if_generation_match
        #   Makes the operation conditional on whether the object's generation matches the
        #   given value.
        # @param [Fixnum] if_generation_not_match
        #   Makes the operation conditional on whether the object's generation does not
        #   match the given value.
        # @param [Fixnum] if_metageneration_match
        #   Makes the operation conditional on whether the object's current metageneration
        #   matches the given value.
        # @param [Fixnum] if_metageneration_not_match
        #   Makes the operation conditional on whether the object's current metageneration
        #   does not match the given value.
        # @param [String] projection
        #   Set of properties to return. Defaults to noAcl.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [IO, String] download_dest
        #   IO stream or filename to receive content download
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::StorageV1beta2::Object] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::StorageV1beta2::Object]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_object(bucket, object, generation: nil, if_generation_match: nil, if_generation_not_match: nil, if_metageneration_match: nil, if_metageneration_not_match: nil, projection: nil, fields: nil, quota_user: nil, user_ip: nil, download_dest: nil, options: nil, &block)
          if download_dest.nil?
            command = make_simple_command(:get, 'b/{bucket}/o/{object}', options)
          else
            command = make_download_command(:get, 'b/{bucket}/o/{object}', options)
            command.download_dest = download_dest
          end
          command.response_representation = Google::Apis::StorageV1beta2::Object::Representation
          command.response_class = Google::Apis::StorageV1beta2::Object
          command.params['bucket'] = bucket unless bucket.nil?
          command.params['object'] = object unless object.nil?
          command.query['generation'] = generation unless generation.nil?
          command.query['ifGenerationMatch'] = if_generation_match unless if_generation_match.nil?
          command.query['ifGenerationNotMatch'] = if_generation_not_match unless if_generation_not_match.nil?
          command.query['ifMetagenerationMatch'] = if_metageneration_match unless if_metageneration_match.nil?
          command.query['ifMetagenerationNotMatch'] = if_metageneration_not_match unless if_metageneration_not_match.nil?
          command.query['projection'] = projection unless projection.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Stores new data blobs and associated metadata.
        # @param [String] bucket
        #   Name of the bucket in which to store the new object. Overrides the provided
        #   object metadata's bucket value, if any.
        # @param [Google::Apis::StorageV1beta2::Object] object_object
        # @param [Fixnum] if_generation_match
        #   Makes the operation conditional on whether the object's current generation
        #   matches the given value.
        # @param [Fixnum] if_generation_not_match
        #   Makes the operation conditional on whether the object's current generation
        #   does not match the given value.
        # @param [Fixnum] if_metageneration_match
        #   Makes the operation conditional on whether the object's current metageneration
        #   matches the given value.
        # @param [Fixnum] if_metageneration_not_match
        #   Makes the operation conditional on whether the object's current metageneration
        #   does not match the given value.
        # @param [String] name
        #   Name of the object. Required when the object metadata is not otherwise
        #   provided. Overrides the object metadata's name value, if any.
        # @param [String] projection
        #   Set of properties to return. Defaults to noAcl, unless the object resource
        #   specifies the acl property, when it defaults to full.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [IO, String] upload_source
        #   IO stream or filename containing content to upload
        # @param [String] content_type
        #   Content type of the uploaded content.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::StorageV1beta2::Object] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::StorageV1beta2::Object]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_object(bucket, object_object = nil, if_generation_match: nil, if_generation_not_match: nil, if_metageneration_match: nil, if_metageneration_not_match: nil, name: nil, projection: nil, fields: nil, quota_user: nil, user_ip: nil, upload_source: nil, content_type: nil, options: nil, &block)
          if upload_source.nil?
            command = make_simple_command(:post, 'b/{bucket}/o', options)
          else
            command = make_upload_command(:post, 'b/{bucket}/o', options)
            command.upload_source = upload_source
            command.upload_content_type = content_type
          end
          command.request_representation = Google::Apis::StorageV1beta2::Object::Representation
          command.request_object = object_object
          command.response_representation = Google::Apis::StorageV1beta2::Object::Representation
          command.response_class = Google::Apis::StorageV1beta2::Object
          command.params['bucket'] = bucket unless bucket.nil?
          command.query['ifGenerationMatch'] = if_generation_match unless if_generation_match.nil?
          command.query['ifGenerationNotMatch'] = if_generation_not_match unless if_generation_not_match.nil?
          command.query['ifMetagenerationMatch'] = if_metageneration_match unless if_metageneration_match.nil?
          command.query['ifMetagenerationNotMatch'] = if_metageneration_not_match unless if_metageneration_not_match.nil?
          command.query['name'] = name unless name.nil?
          command.query['projection'] = projection unless projection.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of objects matching the criteria.
        # @param [String] bucket
        #   Name of the bucket in which to look for objects.
        # @param [String] delimiter
        #   Returns results in a directory-like mode. items will contain only objects
        #   whose names, aside from the prefix, do not contain delimiter. Objects whose
        #   names, aside from the prefix, contain delimiter will have their name,
        #   truncated after the delimiter, returned in prefixes. Duplicate prefixes are
        #   omitted.
        # @param [Fixnum] max_results
        #   Maximum number of items plus prefixes to return. As duplicate prefixes are
        #   omitted, fewer total results may be returned than requested.
        # @param [String] page_token
        #   A previously-returned page token representing part of the larger set of
        #   results to view.
        # @param [String] prefix
        #   Filter results to objects whose names begin with this prefix.
        # @param [String] projection
        #   Set of properties to return. Defaults to noAcl.
        # @param [Boolean] versions
        #   If true, lists all versions of a file as distinct results.
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
        # @yieldparam result [Google::Apis::StorageV1beta2::Objects] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::StorageV1beta2::Objects]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_objects(bucket, delimiter: nil, max_results: nil, page_token: nil, prefix: nil, projection: nil, versions: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'b/{bucket}/o', options)
          command.response_representation = Google::Apis::StorageV1beta2::Objects::Representation
          command.response_class = Google::Apis::StorageV1beta2::Objects
          command.params['bucket'] = bucket unless bucket.nil?
          command.query['delimiter'] = delimiter unless delimiter.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['prefix'] = prefix unless prefix.nil?
          command.query['projection'] = projection unless projection.nil?
          command.query['versions'] = versions unless versions.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a data blob's associated metadata. This method supports patch
        # semantics.
        # @param [String] bucket
        #   Name of the bucket in which the object resides.
        # @param [String] object
        #   Name of the object.
        # @param [Google::Apis::StorageV1beta2::Object] object_object
        # @param [Fixnum] generation
        #   If present, selects a specific revision of this object (as opposed to the
        #   latest version, the default).
        # @param [Fixnum] if_generation_match
        #   Makes the operation conditional on whether the object's current generation
        #   matches the given value.
        # @param [Fixnum] if_generation_not_match
        #   Makes the operation conditional on whether the object's current generation
        #   does not match the given value.
        # @param [Fixnum] if_metageneration_match
        #   Makes the operation conditional on whether the object's current metageneration
        #   matches the given value.
        # @param [Fixnum] if_metageneration_not_match
        #   Makes the operation conditional on whether the object's current metageneration
        #   does not match the given value.
        # @param [String] projection
        #   Set of properties to return. Defaults to full.
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
        # @yieldparam result [Google::Apis::StorageV1beta2::Object] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::StorageV1beta2::Object]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_object(bucket, object, object_object = nil, generation: nil, if_generation_match: nil, if_generation_not_match: nil, if_metageneration_match: nil, if_metageneration_not_match: nil, projection: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'b/{bucket}/o/{object}', options)
          command.request_representation = Google::Apis::StorageV1beta2::Object::Representation
          command.request_object = object_object
          command.response_representation = Google::Apis::StorageV1beta2::Object::Representation
          command.response_class = Google::Apis::StorageV1beta2::Object
          command.params['bucket'] = bucket unless bucket.nil?
          command.params['object'] = object unless object.nil?
          command.query['generation'] = generation unless generation.nil?
          command.query['ifGenerationMatch'] = if_generation_match unless if_generation_match.nil?
          command.query['ifGenerationNotMatch'] = if_generation_not_match unless if_generation_not_match.nil?
          command.query['ifMetagenerationMatch'] = if_metageneration_match unless if_metageneration_match.nil?
          command.query['ifMetagenerationNotMatch'] = if_metageneration_not_match unless if_metageneration_not_match.nil?
          command.query['projection'] = projection unless projection.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a data blob's associated metadata.
        # @param [String] bucket
        #   Name of the bucket in which the object resides.
        # @param [String] object
        #   Name of the object.
        # @param [Google::Apis::StorageV1beta2::Object] object_object
        # @param [Fixnum] generation
        #   If present, selects a specific revision of this object (as opposed to the
        #   latest version, the default).
        # @param [Fixnum] if_generation_match
        #   Makes the operation conditional on whether the object's current generation
        #   matches the given value.
        # @param [Fixnum] if_generation_not_match
        #   Makes the operation conditional on whether the object's current generation
        #   does not match the given value.
        # @param [Fixnum] if_metageneration_match
        #   Makes the operation conditional on whether the object's current metageneration
        #   matches the given value.
        # @param [Fixnum] if_metageneration_not_match
        #   Makes the operation conditional on whether the object's current metageneration
        #   does not match the given value.
        # @param [String] projection
        #   Set of properties to return. Defaults to full.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [IO, String] download_dest
        #   IO stream or filename to receive content download
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::StorageV1beta2::Object] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::StorageV1beta2::Object]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_object(bucket, object, object_object = nil, generation: nil, if_generation_match: nil, if_generation_not_match: nil, if_metageneration_match: nil, if_metageneration_not_match: nil, projection: nil, fields: nil, quota_user: nil, user_ip: nil, download_dest: nil, options: nil, &block)
          if download_dest.nil?
            command = make_simple_command(:put, 'b/{bucket}/o/{object}', options)
          else
            command = make_download_command(:put, 'b/{bucket}/o/{object}', options)
            command.download_dest = download_dest
          end
          command.request_representation = Google::Apis::StorageV1beta2::Object::Representation
          command.request_object = object_object
          command.response_representation = Google::Apis::StorageV1beta2::Object::Representation
          command.response_class = Google::Apis::StorageV1beta2::Object
          command.params['bucket'] = bucket unless bucket.nil?
          command.params['object'] = object unless object.nil?
          command.query['generation'] = generation unless generation.nil?
          command.query['ifGenerationMatch'] = if_generation_match unless if_generation_match.nil?
          command.query['ifGenerationNotMatch'] = if_generation_not_match unless if_generation_not_match.nil?
          command.query['ifMetagenerationMatch'] = if_metageneration_match unless if_metageneration_match.nil?
          command.query['ifMetagenerationNotMatch'] = if_metageneration_not_match unless if_metageneration_not_match.nil?
          command.query['projection'] = projection unless projection.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Watch for changes on all objects in a bucket.
        # @param [String] bucket
        #   Name of the bucket in which to look for objects.
        # @param [Google::Apis::StorageV1beta2::Channel] channel_object
        # @param [String] delimiter
        #   Returns results in a directory-like mode. items will contain only objects
        #   whose names, aside from the prefix, do not contain delimiter. Objects whose
        #   names, aside from the prefix, contain delimiter will have their name,
        #   truncated after the delimiter, returned in prefixes. Duplicate prefixes are
        #   omitted.
        # @param [Fixnum] max_results
        #   Maximum number of items plus prefixes to return. As duplicate prefixes are
        #   omitted, fewer total results may be returned than requested.
        # @param [String] page_token
        #   A previously-returned page token representing part of the larger set of
        #   results to view.
        # @param [String] prefix
        #   Filter results to objects whose names begin with this prefix.
        # @param [String] projection
        #   Set of properties to return. Defaults to noAcl.
        # @param [Boolean] versions
        #   If true, lists all versions of a file as distinct results.
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
        # @yieldparam result [Google::Apis::StorageV1beta2::Channel] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::StorageV1beta2::Channel]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def watch_object_all(bucket, channel_object = nil, delimiter: nil, max_results: nil, page_token: nil, prefix: nil, projection: nil, versions: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'b/{bucket}/o/watch', options)
          command.request_representation = Google::Apis::StorageV1beta2::Channel::Representation
          command.request_object = channel_object
          command.response_representation = Google::Apis::StorageV1beta2::Channel::Representation
          command.response_class = Google::Apis::StorageV1beta2::Channel
          command.params['bucket'] = bucket unless bucket.nil?
          command.query['delimiter'] = delimiter unless delimiter.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['prefix'] = prefix unless prefix.nil?
          command.query['projection'] = projection unless projection.nil?
          command.query['versions'] = versions unless versions.nil?
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
