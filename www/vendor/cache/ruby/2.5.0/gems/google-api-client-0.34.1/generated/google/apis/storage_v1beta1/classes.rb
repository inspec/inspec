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
    module StorageV1beta1
      
      # A bucket.
      class Bucket
        include Google::Apis::Core::Hashable
      
        # Access controls on the bucket.
        # Corresponds to the JSON property `acl`
        # @return [Array<Google::Apis::StorageV1beta1::BucketAccessControl>]
        attr_accessor :acl
      
        # Default access controls to apply to new objects when no ACL is provided.
        # Corresponds to the JSON property `defaultObjectAcl`
        # @return [Array<Google::Apis::StorageV1beta1::ObjectAccessControl>]
        attr_accessor :default_object_acl
      
        # The name of the bucket.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # The kind of item this is. For buckets, this is always storage#bucket.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The location of the bucket. Object data for objects in the bucket resides in
        # physical storage in this location. Can be US or EU. Defaults to US.
        # Corresponds to the JSON property `location`
        # @return [String]
        attr_accessor :location
      
        # The owner of the bucket. This will always be the project team's owner group.
        # Corresponds to the JSON property `owner`
        # @return [Google::Apis::StorageV1beta1::Bucket::Owner]
        attr_accessor :owner
      
        # The project the bucket belongs to.
        # Corresponds to the JSON property `projectId`
        # @return [Fixnum]
        attr_accessor :project_id
      
        # The URI of this bucket.
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        # Creation time of the bucket in RFC 3339 format.
        # Corresponds to the JSON property `timeCreated`
        # @return [DateTime]
        attr_accessor :time_created
      
        # The bucket's website configuration.
        # Corresponds to the JSON property `website`
        # @return [Google::Apis::StorageV1beta1::Bucket::Website]
        attr_accessor :website
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @acl = args[:acl] if args.key?(:acl)
          @default_object_acl = args[:default_object_acl] if args.key?(:default_object_acl)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @location = args[:location] if args.key?(:location)
          @owner = args[:owner] if args.key?(:owner)
          @project_id = args[:project_id] if args.key?(:project_id)
          @self_link = args[:self_link] if args.key?(:self_link)
          @time_created = args[:time_created] if args.key?(:time_created)
          @website = args[:website] if args.key?(:website)
        end
        
        # The owner of the bucket. This will always be the project team's owner group.
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
        # @return [Array<Google::Apis::StorageV1beta1::BucketAccessControl>]
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
        # @return [Array<Google::Apis::StorageV1beta1::Bucket>]
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
      
      # An object.
      class Object
        include Google::Apis::Core::Hashable
      
        # Access controls on the object.
        # Corresponds to the JSON property `acl`
        # @return [Array<Google::Apis::StorageV1beta1::ObjectAccessControl>]
        attr_accessor :acl
      
        # The bucket containing this object.
        # Corresponds to the JSON property `bucket`
        # @return [String]
        attr_accessor :bucket
      
        # Cache-Control directive for the object data.
        # Corresponds to the JSON property `cacheControl`
        # @return [String]
        attr_accessor :cache_control
      
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
      
        # The ID of the object.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # The kind of item this is. For objects, this is always storage#object.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Object media data. Provided on your behalf when uploading raw media or
        # multipart/related with an auxiliary media part.
        # Corresponds to the JSON property `media`
        # @return [Google::Apis::StorageV1beta1::Object::Media]
        attr_accessor :media
      
        # User-provided metadata, in key/value pairs.
        # Corresponds to the JSON property `metadata`
        # @return [Hash<String,String>]
        attr_accessor :metadata
      
        # The name of this object. Required if not specified by URL parameter.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The owner of the object. This will always be the uploader of the object.
        # Corresponds to the JSON property `owner`
        # @return [Google::Apis::StorageV1beta1::Object::Owner]
        attr_accessor :owner
      
        # The link to this object.
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @acl = args[:acl] if args.key?(:acl)
          @bucket = args[:bucket] if args.key?(:bucket)
          @cache_control = args[:cache_control] if args.key?(:cache_control)
          @content_disposition = args[:content_disposition] if args.key?(:content_disposition)
          @content_encoding = args[:content_encoding] if args.key?(:content_encoding)
          @content_language = args[:content_language] if args.key?(:content_language)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @media = args[:media] if args.key?(:media)
          @metadata = args[:metadata] if args.key?(:metadata)
          @name = args[:name] if args.key?(:name)
          @owner = args[:owner] if args.key?(:owner)
          @self_link = args[:self_link] if args.key?(:self_link)
        end
        
        # Object media data. Provided on your behalf when uploading raw media or
        # multipart/related with an auxiliary media part.
        class Media
          include Google::Apis::Core::Hashable
        
          # Hash algorithm used. Currently only MD5 is supported. Required if a hash is
          # provided.
          # Corresponds to the JSON property `algorithm`
          # @return [String]
          attr_accessor :algorithm
        
          # Content-Type of the object data.
          # Corresponds to the JSON property `contentType`
          # @return [String]
          attr_accessor :content_type
        
          # URL-safe Base64-encoded data. This property can be used to insert objects
          # under 64KB in size, and will only be returned in response to the get method
          # for objects so created. When this resource is returned in response to the list
          # method, this property is omitted.
          # Corresponds to the JSON property `data`
          # NOTE: Values are automatically base64 encoded/decoded in the client library.
          # @return [String]
          attr_accessor :data
        
          # Hash of the data. Required if a hash algorithm is provided.
          # Corresponds to the JSON property `hash`
          # @return [String]
          attr_accessor :hash_prop
        
          # Content-Length of the data in bytes.
          # Corresponds to the JSON property `length`
          # @return [Fixnum]
          attr_accessor :length
        
          # Media download link.
          # Corresponds to the JSON property `link`
          # @return [String]
          attr_accessor :link
        
          # Creation time of the data in RFC 3339 format.
          # Corresponds to the JSON property `timeCreated`
          # @return [DateTime]
          attr_accessor :time_created
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @algorithm = args[:algorithm] if args.key?(:algorithm)
            @content_type = args[:content_type] if args.key?(:content_type)
            @data = args[:data] if args.key?(:data)
            @hash_prop = args[:hash_prop] if args.key?(:hash_prop)
            @length = args[:length] if args.key?(:length)
            @link = args[:link] if args.key?(:link)
            @time_created = args[:time_created] if args.key?(:time_created)
          end
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
        # @return [Array<Google::Apis::StorageV1beta1::ObjectAccessControl>]
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
        # @return [Array<Google::Apis::StorageV1beta1::Object>]
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
