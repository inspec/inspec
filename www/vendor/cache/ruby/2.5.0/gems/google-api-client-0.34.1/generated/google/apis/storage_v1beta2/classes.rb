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
    module StorageV1beta2
      
      # A bucket.
      class Bucket
        include Google::Apis::Core::Hashable
      
        # Access controls on the bucket.
        # Corresponds to the JSON property `acl`
        # @return [Array<Google::Apis::StorageV1beta2::BucketAccessControl>]
        attr_accessor :acl
      
        # The bucket's Cross-Origin Resource Sharing (CORS) configuration.
        # Corresponds to the JSON property `cors`
        # @return [Array<Google::Apis::StorageV1beta2::Bucket::Cor>]
        attr_accessor :cors
      
        # Default access controls to apply to new objects when no ACL is provided.
        # Corresponds to the JSON property `defaultObjectAcl`
        # @return [Array<Google::Apis::StorageV1beta2::ObjectAccessControl>]
        attr_accessor :default_object_acl
      
        # HTTP 1.1 Entity tag for the bucket.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The ID of the bucket.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # The kind of item this is. For buckets, this is always storage#bucket.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The bucket's lifecycle configuration. See object lifecycle management for more
        # information.
        # Corresponds to the JSON property `lifecycle`
        # @return [Google::Apis::StorageV1beta2::Bucket::Lifecycle]
        attr_accessor :lifecycle
      
        # The location of the bucket. Object data for objects in the bucket resides in
        # physical storage within this region. Typical values are US and EU. Defaults to
        # US. See the developer's guide for the authoritative list.
        # Corresponds to the JSON property `location`
        # @return [String]
        attr_accessor :location
      
        # The bucket's logging configuration, which defines the destination bucket and
        # optional name prefix for the current bucket's logs.
        # Corresponds to the JSON property `logging`
        # @return [Google::Apis::StorageV1beta2::Bucket::Logging]
        attr_accessor :logging
      
        # The metadata generation of this bucket.
        # Corresponds to the JSON property `metageneration`
        # @return [Fixnum]
        attr_accessor :metageneration
      
        # The name of the bucket.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The owner of the bucket. This is always the project team's owner group.
        # Corresponds to the JSON property `owner`
        # @return [Google::Apis::StorageV1beta2::Bucket::Owner]
        attr_accessor :owner
      
        # The URI of this bucket.
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        # The bucket's storage class. This defines how objects in the bucket are stored
        # and determines the SLA and the cost of storage. Typical values are STANDARD
        # and DURABLE_REDUCED_AVAILABILITY. Defaults to STANDARD. See the developer's
        # guide for the authoritative list.
        # Corresponds to the JSON property `storageClass`
        # @return [String]
        attr_accessor :storage_class
      
        # Creation time of the bucket in RFC 3339 format.
        # Corresponds to the JSON property `timeCreated`
        # @return [DateTime]
        attr_accessor :time_created
      
        # The bucket's versioning configuration.
        # Corresponds to the JSON property `versioning`
        # @return [Google::Apis::StorageV1beta2::Bucket::Versioning]
        attr_accessor :versioning
      
        # The bucket's website configuration.
        # Corresponds to the JSON property `website`
        # @return [Google::Apis::StorageV1beta2::Bucket::Website]
        attr_accessor :website
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @acl = args[:acl] if args.key?(:acl)
          @cors = args[:cors] if args.key?(:cors)
          @default_object_acl = args[:default_object_acl] if args.key?(:default_object_acl)
          @etag = args[:etag] if args.key?(:etag)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @lifecycle = args[:lifecycle] if args.key?(:lifecycle)
          @location = args[:location] if args.key?(:location)
          @logging = args[:logging] if args.key?(:logging)
          @metageneration = args[:metageneration] if args.key?(:metageneration)
          @name = args[:name] if args.key?(:name)
          @owner = args[:owner] if args.key?(:owner)
          @self_link = args[:self_link] if args.key?(:self_link)
          @storage_class = args[:storage_class] if args.key?(:storage_class)
          @time_created = args[:time_created] if args.key?(:time_created)
          @versioning = args[:versioning] if args.key?(:versioning)
          @website = args[:website] if args.key?(:website)
        end
        
        # 
        class Cor
          include Google::Apis::Core::Hashable
        
          # The value, in seconds, to return in the  Access-Control-Max-Age header used in
          # preflight responses.
          # Corresponds to the JSON property `maxAgeSeconds`
          # @return [Fixnum]
          attr_accessor :max_age_seconds
        
          # The list of HTTP methods on which to include CORS response headers: GET,
          # OPTIONS, POST, etc. Note, "*" is permitted in the list of methods, and means "
          # any method".
          # Corresponds to the JSON property `method`
          # @return [Array<String>]
          attr_accessor :method_prop
        
          # The list of Origins eligible to receive CORS response headers. Note: "*" is
          # permitted in the list of origins, and means "any Origin".
          # Corresponds to the JSON property `origin`
          # @return [Array<String>]
          attr_accessor :origin
        
          # The list of HTTP headers other than the simple response headers to give
          # permission for the user-agent to share across domains.
          # Corresponds to the JSON property `responseHeader`
          # @return [Array<String>]
          attr_accessor :response_header
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @max_age_seconds = args[:max_age_seconds] if args.key?(:max_age_seconds)
            @method_prop = args[:method_prop] if args.key?(:method_prop)
            @origin = args[:origin] if args.key?(:origin)
            @response_header = args[:response_header] if args.key?(:response_header)
          end
        end
        
        # The bucket's lifecycle configuration. See object lifecycle management for more
        # information.
        class Lifecycle
          include Google::Apis::Core::Hashable
        
          # A lifecycle management rule, which is made of an action to take and the
          # condition(s) under which the action will be taken.
          # Corresponds to the JSON property `rule`
          # @return [Array<Google::Apis::StorageV1beta2::Bucket::Lifecycle::Rule>]
          attr_accessor :rule
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @rule = args[:rule] if args.key?(:rule)
          end
          
          # 
          class Rule
            include Google::Apis::Core::Hashable
          
            # The action to take.
            # Corresponds to the JSON property `action`
            # @return [Google::Apis::StorageV1beta2::Bucket::Lifecycle::Rule::Action]
            attr_accessor :action
          
            # The condition(s) under which the action will be taken.
            # Corresponds to the JSON property `condition`
            # @return [Google::Apis::StorageV1beta2::Bucket::Lifecycle::Rule::Condition]
            attr_accessor :condition
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @action = args[:action] if args.key?(:action)
              @condition = args[:condition] if args.key?(:condition)
            end
            
            # The action to take.
            class Action
              include Google::Apis::Core::Hashable
            
              # Type of the action. Currently only Delete is supported.
              # Corresponds to the JSON property `type`
              # @return [String]
              attr_accessor :type
            
              def initialize(**args)
                 update!(**args)
              end
            
              # Update properties of this object
              def update!(**args)
                @type = args[:type] if args.key?(:type)
              end
            end
            
            # The condition(s) under which the action will be taken.
            class Condition
              include Google::Apis::Core::Hashable
            
              # Age of an object (in days). This condition is satisfied when an object reaches
              # the specified age.
              # Corresponds to the JSON property `age`
              # @return [Fixnum]
              attr_accessor :age
            
              # A date in RFC 3339 format with only the date part, e.g. "2013-01-15". This
              # condition is satisfied when an object is created before midnight of the
              # specified date in UTC.
              # Corresponds to the JSON property `createdBefore`
              # @return [Date]
              attr_accessor :created_before
            
              # Relevant only for versioned objects. If the value is true, this condition
              # matches live objects; if the value is false, it matches archived objects.
              # Corresponds to the JSON property `isLive`
              # @return [Boolean]
              attr_accessor :is_live
              alias_method :is_live?, :is_live
            
              # Relevant only for versioned objects. If the value is N, this condition is
              # satisfied when there are at least N versions (including the live version)
              # newer than this version of the object.
              # Corresponds to the JSON property `numNewerVersions`
              # @return [Fixnum]
              attr_accessor :num_newer_versions
            
              def initialize(**args)
                 update!(**args)
              end
            
              # Update properties of this object
              def update!(**args)
                @age = args[:age] if args.key?(:age)
                @created_before = args[:created_before] if args.key?(:created_before)
                @is_live = args[:is_live] if args.key?(:is_live)
                @num_newer_versions = args[:num_newer_versions] if args.key?(:num_newer_versions)
              end
            end
          end
        end
        
        # The bucket's logging configuration, which defines the destination bucket and
        # optional name prefix for the current bucket's logs.
        class Logging
          include Google::Apis::Core::Hashable
        
          # The destination bucket where the current bucket's logs should be placed.
          # Corresponds to the JSON property `logBucket`
          # @return [String]
          attr_accessor :log_bucket
        
          # A prefix for log object names.
          # Corresponds to the JSON property `logObjectPrefix`
          # @return [String]
          attr_accessor :log_object_prefix
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @log_bucket = args[:log_bucket] if args.key?(:log_bucket)
            @log_object_prefix = args[:log_object_prefix] if args.key?(:log_object_prefix)
          end
        end
        
        # The owner of the bucket. This is always the project team's owner group.
        class Owner
          include Google::Apis::Core::Hashable
        
          # The entity, in the form group-groupId.
          # Corresponds to the JSON property `entity`
          # @return [String]
          attr_accessor :entity
        
          # The ID for the entity.
          # Corresponds to the JSON property `entityId`
          # @return [String]
          attr_accessor :entity_id
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @entity = args[:entity] if args.key?(:entity)
            @entity_id = args[:entity_id] if args.key?(:entity_id)
          end
        end
        
        # The bucket's versioning configuration.
        class Versioning
          include Google::Apis::Core::Hashable
        
          # While set to true, versioning is fully enabled for this bucket.
          # Corresponds to the JSON property `enabled`
          # @return [Boolean]
          attr_accessor :enabled
          alias_method :enabled?, :enabled
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @enabled = args[:enabled] if args.key?(:enabled)
          end
        end
        
        # The bucket's website configuration.
        class Website
          include Google::Apis::Core::Hashable
        
          # Behaves as the bucket's directory index where missing objects are treated as
          # potential directories.
          # Corresponds to the JSON property `mainPageSuffix`
          # @return [String]
          attr_accessor :main_page_suffix
        
          # The custom object to return when a requested resource is not found.
          # Corresponds to the JSON property `notFoundPage`
          # @return [String]
          attr_accessor :not_found_page
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @main_page_suffix = args[:main_page_suffix] if args.key?(:main_page_suffix)
            @not_found_page = args[:not_found_page] if args.key?(:not_found_page)
          end
        end
      end
      
      # An access-control entry.
      class BucketAccessControl
        include Google::Apis::Core::Hashable
      
        # The name of the bucket.
        # Corresponds to the JSON property `bucket`
        # @return [String]
        attr_accessor :bucket
      
        # The domain associated with the entity, if any.
        # Corresponds to the JSON property `domain`
        # @return [String]
        attr_accessor :domain
      
        # The email address associated with the entity, if any.
        # Corresponds to the JSON property `email`
        # @return [String]
        attr_accessor :email
      
        # The entity holding the permission, in one of the following forms:
        # - user-userId
        # - user-email
        # - group-groupId
        # - group-email
        # - domain-domain
        # - allUsers
        # - allAuthenticatedUsers Examples:
        # - The user liz@example.com would be user-liz@example.com.
        # - The group example@googlegroups.com would be group-example@googlegroups.com.
        # - To refer to all members of the Google Apps for Business domain example.com,
        # the entity would be domain-example.com.
        # Corresponds to the JSON property `entity`
        # @return [String]
        attr_accessor :entity
      
        # The ID for the entity, if any.
        # Corresponds to the JSON property `entityId`
        # @return [String]
        attr_accessor :entity_id
      
        # HTTP 1.1 Entity tag for the access-control entry.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The ID of the access-control entry.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # The kind of item this is. For bucket access control entries, this is always
        # storage#bucketAccessControl.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The access permission for the entity. Can be READER, WRITER, or OWNER.
        # Corresponds to the JSON property `role`
        # @return [String]
        attr_accessor :role
      
        # The link to this access-control entry.
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bucket = args[:bucket] if args.key?(:bucket)
          @domain = args[:domain] if args.key?(:domain)
          @email = args[:email] if args.key?(:email)
          @entity = args[:entity] if args.key?(:entity)
          @entity_id = args[:entity_id] if args.key?(:entity_id)
          @etag = args[:etag] if args.key?(:etag)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @role = args[:role] if args.key?(:role)
          @self_link = args[:self_link] if args.key?(:self_link)
        end
      end
      
      # An access-control list.
      class BucketAccessControls
        include Google::Apis::Core::Hashable
      
        # The list of items.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::StorageV1beta2::BucketAccessControl>]
        attr_accessor :items
      
        # The kind of item this is. For lists of bucket access control entries, this is
        # always storage#bucketAccessControls.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # A list of buckets.
      class Buckets
        include Google::Apis::Core::Hashable
      
        # The list of items.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::StorageV1beta2::Bucket>]
        attr_accessor :items
      
        # The kind of item this is. For lists of buckets, this is always storage#buckets.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The continuation token, used to page through large result sets. Provide this
        # value in a subsequent request to return the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # An notification channel used to watch for resource changes.
      class Channel
        include Google::Apis::Core::Hashable
      
        # The address where notifications are delivered for this channel.
        # Corresponds to the JSON property `address`
        # @return [String]
        attr_accessor :address
      
        # Date and time of notification channel expiration, expressed as a Unix
        # timestamp, in milliseconds. Optional.
        # Corresponds to the JSON property `expiration`
        # @return [Fixnum]
        attr_accessor :expiration
      
        # A UUID or similar unique string that identifies this channel.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Identifies this as a notification channel used to watch for changes to a
        # resource, which is "api#channel".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Additional parameters controlling delivery channel behavior. Optional.
        # Corresponds to the JSON property `params`
        # @return [Hash<String,String>]
        attr_accessor :params
      
        # A Boolean value to indicate whether payload is wanted. Optional.
        # Corresponds to the JSON property `payload`
        # @return [Boolean]
        attr_accessor :payload
        alias_method :payload?, :payload
      
        # An opaque ID that identifies the resource being watched on this channel.
        # Stable across different API versions.
        # Corresponds to the JSON property `resourceId`
        # @return [String]
        attr_accessor :resource_id
      
        # A version-specific identifier for the watched resource.
        # Corresponds to the JSON property `resourceUri`
        # @return [String]
        attr_accessor :resource_uri
      
        # An arbitrary string delivered to the target address with each notification
        # delivered over this channel. Optional.
        # Corresponds to the JSON property `token`
        # @return [String]
        attr_accessor :token
      
        # The type of delivery mechanism used for this channel.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @address = args[:address] if args.key?(:address)
          @expiration = args[:expiration] if args.key?(:expiration)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @params = args[:params] if args.key?(:params)
          @payload = args[:payload] if args.key?(:payload)
          @resource_id = args[:resource_id] if args.key?(:resource_id)
          @resource_uri = args[:resource_uri] if args.key?(:resource_uri)
          @token = args[:token] if args.key?(:token)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # A Compose request.
      class ComposeRequest
        include Google::Apis::Core::Hashable
      
        # An object.
        # Corresponds to the JSON property `destination`
        # @return [Google::Apis::StorageV1beta2::Object]
        attr_accessor :destination
      
        # The kind of item this is.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The list of source objects that will be concatenated into a single object.
        # Corresponds to the JSON property `sourceObjects`
        # @return [Array<Google::Apis::StorageV1beta2::ComposeRequest::SourceObject>]
        attr_accessor :source_objects
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @destination = args[:destination] if args.key?(:destination)
          @kind = args[:kind] if args.key?(:kind)
          @source_objects = args[:source_objects] if args.key?(:source_objects)
        end
        
        # 
        class SourceObject
          include Google::Apis::Core::Hashable
        
          # The generation of this object to use as the source.
          # Corresponds to the JSON property `generation`
          # @return [Fixnum]
          attr_accessor :generation
        
          # The source object's name. All source objects must reside in the same bucket.
          # Corresponds to the JSON property `name`
          # @return [String]
          attr_accessor :name
        
          # Conditions that must be met for this operation to execute.
          # Corresponds to the JSON property `objectPreconditions`
          # @return [Google::Apis::StorageV1beta2::ComposeRequest::SourceObject::ObjectPreconditions]
          attr_accessor :object_preconditions
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @generation = args[:generation] if args.key?(:generation)
            @name = args[:name] if args.key?(:name)
            @object_preconditions = args[:object_preconditions] if args.key?(:object_preconditions)
          end
          
          # Conditions that must be met for this operation to execute.
          class ObjectPreconditions
            include Google::Apis::Core::Hashable
          
            # Only perform the composition if the generation of the source object that would
            # be used matches this value. If this value and a generation are both specified,
            # they must be the same value or the call will fail.
            # Corresponds to the JSON property `ifGenerationMatch`
            # @return [Fixnum]
            attr_accessor :if_generation_match
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @if_generation_match = args[:if_generation_match] if args.key?(:if_generation_match)
            end
          end
        end
      end
      
      # An object.
      class Object
        include Google::Apis::Core::Hashable
      
        # Access controls on the object.
        # Corresponds to the JSON property `acl`
        # @return [Array<Google::Apis::StorageV1beta2::ObjectAccessControl>]
        attr_accessor :acl
      
        # The bucket containing this object.
        # Corresponds to the JSON property `bucket`
        # @return [String]
        attr_accessor :bucket
      
        # Cache-Control directive for the object data.
        # Corresponds to the JSON property `cacheControl`
        # @return [String]
        attr_accessor :cache_control
      
        # Number of underlying components that make up this object. Components are
        # accumulated by compose operations and are limited to a count of 32.
        # Corresponds to the JSON property `componentCount`
        # @return [Fixnum]
        attr_accessor :component_count
      
        # Content-Disposition of the object data.
        # Corresponds to the JSON property `contentDisposition`
        # @return [String]
        attr_accessor :content_disposition
      
        # Content-Encoding of the object data.
        # Corresponds to the JSON property `contentEncoding`
        # @return [String]
        attr_accessor :content_encoding
      
        # Content-Language of the object data.
        # Corresponds to the JSON property `contentLanguage`
        # @return [String]
        attr_accessor :content_language
      
        # Content-Type of the object data.
        # Corresponds to the JSON property `contentType`
        # @return [String]
        attr_accessor :content_type
      
        # CRC32c checksum, as described in RFC 4960, Appendix B; encoded using base64.
        # Corresponds to the JSON property `crc32c`
        # @return [String]
        attr_accessor :crc32c
      
        # HTTP 1.1 Entity tag for the object.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The content generation of this object. Used for object versioning.
        # Corresponds to the JSON property `generation`
        # @return [Fixnum]
        attr_accessor :generation
      
        # The ID of the object.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # The kind of item this is. For objects, this is always storage#object.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # MD5 hash of the data; encoded using base64.
        # Corresponds to the JSON property `md5Hash`
        # @return [String]
        attr_accessor :md5_hash
      
        # Media download link.
        # Corresponds to the JSON property `mediaLink`
        # @return [String]
        attr_accessor :media_link
      
        # User-provided metadata, in key/value pairs.
        # Corresponds to the JSON property `metadata`
        # @return [Hash<String,String>]
        attr_accessor :metadata
      
        # The generation of the metadata for this object at this generation. Used for
        # metadata versioning. Has no meaning outside of the context of this generation.
        # Corresponds to the JSON property `metageneration`
        # @return [Fixnum]
        attr_accessor :metageneration
      
        # The name of this object. Required if not specified by URL parameter.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The owner of the object. This will always be the uploader of the object.
        # Corresponds to the JSON property `owner`
        # @return [Google::Apis::StorageV1beta2::Object::Owner]
        attr_accessor :owner
      
        # The link to this object.
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        # Content-Length of the data in bytes.
        # Corresponds to the JSON property `size`
        # @return [Fixnum]
        attr_accessor :size
      
        # Storage class of the object.
        # Corresponds to the JSON property `storageClass`
        # @return [String]
        attr_accessor :storage_class
      
        # Deletion time of the object in RFC 3339 format. Will be returned if and only
        # if this version of the object has been deleted.
        # Corresponds to the JSON property `timeDeleted`
        # @return [DateTime]
        attr_accessor :time_deleted
      
        # Modification time of the object metadata in RFC 3339 format.
        # Corresponds to the JSON property `updated`
        # @return [DateTime]
        attr_accessor :updated
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @acl = args[:acl] if args.key?(:acl)
          @bucket = args[:bucket] if args.key?(:bucket)
          @cache_control = args[:cache_control] if args.key?(:cache_control)
          @component_count = args[:component_count] if args.key?(:component_count)
          @content_disposition = args[:content_disposition] if args.key?(:content_disposition)
          @content_encoding = args[:content_encoding] if args.key?(:content_encoding)
          @content_language = args[:content_language] if args.key?(:content_language)
          @content_type = args[:content_type] if args.key?(:content_type)
          @crc32c = args[:crc32c] if args.key?(:crc32c)
          @etag = args[:etag] if args.key?(:etag)
          @generation = args[:generation] if args.key?(:generation)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @md5_hash = args[:md5_hash] if args.key?(:md5_hash)
          @media_link = args[:media_link] if args.key?(:media_link)
          @metadata = args[:metadata] if args.key?(:metadata)
          @metageneration = args[:metageneration] if args.key?(:metageneration)
          @name = args[:name] if args.key?(:name)
          @owner = args[:owner] if args.key?(:owner)
          @self_link = args[:self_link] if args.key?(:self_link)
          @size = args[:size] if args.key?(:size)
          @storage_class = args[:storage_class] if args.key?(:storage_class)
          @time_deleted = args[:time_deleted] if args.key?(:time_deleted)
          @updated = args[:updated] if args.key?(:updated)
        end
        
        # The owner of the object. This will always be the uploader of the object.
        class Owner
          include Google::Apis::Core::Hashable
        
          # The entity, in the form user-userId.
          # Corresponds to the JSON property `entity`
          # @return [String]
          attr_accessor :entity
        
          # The ID for the entity.
          # Corresponds to the JSON property `entityId`
          # @return [String]
          attr_accessor :entity_id
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @entity = args[:entity] if args.key?(:entity)
            @entity_id = args[:entity_id] if args.key?(:entity_id)
          end
        end
      end
      
      # An access-control entry.
      class ObjectAccessControl
        include Google::Apis::Core::Hashable
      
        # The name of the bucket.
        # Corresponds to the JSON property `bucket`
        # @return [String]
        attr_accessor :bucket
      
        # The domain associated with the entity, if any.
        # Corresponds to the JSON property `domain`
        # @return [String]
        attr_accessor :domain
      
        # The email address associated with the entity, if any.
        # Corresponds to the JSON property `email`
        # @return [String]
        attr_accessor :email
      
        # The entity holding the permission, in one of the following forms:
        # - user-userId
        # - user-email
        # - group-groupId
        # - group-email
        # - domain-domain
        # - allUsers
        # - allAuthenticatedUsers Examples:
        # - The user liz@example.com would be user-liz@example.com.
        # - The group example@googlegroups.com would be group-example@googlegroups.com.
        # - To refer to all members of the Google Apps for Business domain example.com,
        # the entity would be domain-example.com.
        # Corresponds to the JSON property `entity`
        # @return [String]
        attr_accessor :entity
      
        # The ID for the entity, if any.
        # Corresponds to the JSON property `entityId`
        # @return [String]
        attr_accessor :entity_id
      
        # HTTP 1.1 Entity tag for the access-control entry.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The content generation of the object.
        # Corresponds to the JSON property `generation`
        # @return [Fixnum]
        attr_accessor :generation
      
        # The ID of the access-control entry.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # The kind of item this is. For object access control entries, this is always
        # storage#objectAccessControl.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The name of the object.
        # Corresponds to the JSON property `object`
        # @return [String]
        attr_accessor :object
      
        # The access permission for the entity. Can be READER or OWNER.
        # Corresponds to the JSON property `role`
        # @return [String]
        attr_accessor :role
      
        # The link to this access-control entry.
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bucket = args[:bucket] if args.key?(:bucket)
          @domain = args[:domain] if args.key?(:domain)
          @email = args[:email] if args.key?(:email)
          @entity = args[:entity] if args.key?(:entity)
          @entity_id = args[:entity_id] if args.key?(:entity_id)
          @etag = args[:etag] if args.key?(:etag)
          @generation = args[:generation] if args.key?(:generation)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @object = args[:object] if args.key?(:object)
          @role = args[:role] if args.key?(:role)
          @self_link = args[:self_link] if args.key?(:self_link)
        end
      end
      
      # An access-control list.
      class ObjectAccessControls
        include Google::Apis::Core::Hashable
      
        # The list of items.
        # Corresponds to the JSON property `items`
        # @return [Array<Object>]
        attr_accessor :items
      
        # The kind of item this is. For lists of object access control entries, this is
        # always storage#objectAccessControls.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # A list of objects.
      class Objects
        include Google::Apis::Core::Hashable
      
        # The list of items.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::StorageV1beta2::Object>]
        attr_accessor :items
      
        # The kind of item this is. For lists of objects, this is always storage#objects.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The continuation token, used to page through large result sets. Provide this
        # value in a subsequent request to return the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The list of prefixes of objects matching-but-not-listed up to and including
        # the requested delimiter.
        # Corresponds to the JSON property `prefixes`
        # @return [Array<String>]
        attr_accessor :prefixes
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @prefixes = args[:prefixes] if args.key?(:prefixes)
        end
      end
    end
  end
end
