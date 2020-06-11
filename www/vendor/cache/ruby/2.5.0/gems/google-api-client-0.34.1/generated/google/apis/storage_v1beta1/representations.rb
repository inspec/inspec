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
      
      class Bucket
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Owner
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Website
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BucketAccessControl
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BucketAccessControls
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Buckets
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Object
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Media
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Owner
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ObjectAccessControl
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ObjectAccessControls
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Objects
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Bucket
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :acl, as: 'acl', class: Google::Apis::StorageV1beta1::BucketAccessControl, decorator: Google::Apis::StorageV1beta1::BucketAccessControl::Representation
      
          collection :default_object_acl, as: 'defaultObjectAcl', class: Google::Apis::StorageV1beta1::ObjectAccessControl, decorator: Google::Apis::StorageV1beta1::ObjectAccessControl::Representation
      
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :location, as: 'location'
          property :owner, as: 'owner', class: Google::Apis::StorageV1beta1::Bucket::Owner, decorator: Google::Apis::StorageV1beta1::Bucket::Owner::Representation
      
          property :project_id, :numeric_string => true, as: 'projectId'
          property :self_link, as: 'selfLink'
          property :time_created, as: 'timeCreated', type: DateTime
      
          property :website, as: 'website', class: Google::Apis::StorageV1beta1::Bucket::Website, decorator: Google::Apis::StorageV1beta1::Bucket::Website::Representation
      
        end
        
        class Owner
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :entity, as: 'entity'
            property :entity_id, as: 'entityId'
          end
        end
        
        class Website
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :main_page_suffix, as: 'mainPageSuffix'
            property :not_found_page, as: 'notFoundPage'
          end
        end
      end
      
      class BucketAccessControl
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bucket, as: 'bucket'
          property :domain, as: 'domain'
          property :email, as: 'email'
          property :entity, as: 'entity'
          property :entity_id, as: 'entityId'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :role, as: 'role'
          property :self_link, as: 'selfLink'
        end
      end
      
      class BucketAccessControls
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::StorageV1beta1::BucketAccessControl, decorator: Google::Apis::StorageV1beta1::BucketAccessControl::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class Buckets
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::StorageV1beta1::Bucket, decorator: Google::Apis::StorageV1beta1::Bucket::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class Object
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :acl, as: 'acl', class: Google::Apis::StorageV1beta1::ObjectAccessControl, decorator: Google::Apis::StorageV1beta1::ObjectAccessControl::Representation
      
          property :bucket, as: 'bucket'
          property :cache_control, as: 'cacheControl'
          property :content_disposition, as: 'contentDisposition'
          property :content_encoding, as: 'contentEncoding'
          property :content_language, as: 'contentLanguage'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :media, as: 'media', class: Google::Apis::StorageV1beta1::Object::Media, decorator: Google::Apis::StorageV1beta1::Object::Media::Representation
      
          hash :metadata, as: 'metadata'
          property :name, as: 'name'
          property :owner, as: 'owner', class: Google::Apis::StorageV1beta1::Object::Owner, decorator: Google::Apis::StorageV1beta1::Object::Owner::Representation
      
          property :self_link, as: 'selfLink'
        end
        
        class Media
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :algorithm, as: 'algorithm'
            property :content_type, as: 'contentType'
            property :data, :base64 => true, as: 'data'
            property :hash_prop, as: 'hash'
            property :length, :numeric_string => true, as: 'length'
            property :link, as: 'link'
            property :time_created, as: 'timeCreated', type: DateTime
        
          end
        end
        
        class Owner
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :entity, as: 'entity'
            property :entity_id, as: 'entityId'
          end
        end
      end
      
      class ObjectAccessControl
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bucket, as: 'bucket'
          property :domain, as: 'domain'
          property :email, as: 'email'
          property :entity, as: 'entity'
          property :entity_id, as: 'entityId'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :object, as: 'object'
          property :role, as: 'role'
          property :self_link, as: 'selfLink'
        end
      end
      
      class ObjectAccessControls
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::StorageV1beta1::ObjectAccessControl, decorator: Google::Apis::StorageV1beta1::ObjectAccessControl::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class Objects
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::StorageV1beta1::Object, decorator: Google::Apis::StorageV1beta1::Object::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          collection :prefixes, as: 'prefixes'
        end
      end
    end
  end
end
