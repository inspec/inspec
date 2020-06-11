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
    module PlusDomainsV1
      
      class Acl
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Activity
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Actor
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class ClientSpecificActorInfo
            class Representation < Google::Apis::Core::JsonRepresentation; end
            
            class YoutubeActorInfo
              class Representation < Google::Apis::Core::JsonRepresentation; end
            
              include Google::Apis::Core::JsonObjectSupport
            end
          
            include Google::Apis::Core::JsonObjectSupport
          end
          
          class Image
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
          
          class Name
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
          
          class Verification
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Object
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Actor
            class Representation < Google::Apis::Core::JsonRepresentation; end
            
            class ClientSpecificActorInfo
              class Representation < Google::Apis::Core::JsonRepresentation; end
              
              class YoutubeActorInfo
                class Representation < Google::Apis::Core::JsonRepresentation; end
              
                include Google::Apis::Core::JsonObjectSupport
              end
            
              include Google::Apis::Core::JsonObjectSupport
            end
            
            class Image
              class Representation < Google::Apis::Core::JsonRepresentation; end
            
              include Google::Apis::Core::JsonObjectSupport
            end
            
            class Verification
              class Representation < Google::Apis::Core::JsonRepresentation; end
            
              include Google::Apis::Core::JsonObjectSupport
            end
          
            include Google::Apis::Core::JsonObjectSupport
          end
          
          class Attachment
            class Representation < Google::Apis::Core::JsonRepresentation; end
            
            class Embed
              class Representation < Google::Apis::Core::JsonRepresentation; end
            
              include Google::Apis::Core::JsonObjectSupport
            end
            
            class FullImage
              class Representation < Google::Apis::Core::JsonRepresentation; end
            
              include Google::Apis::Core::JsonObjectSupport
            end
            
            class Image
              class Representation < Google::Apis::Core::JsonRepresentation; end
            
              include Google::Apis::Core::JsonObjectSupport
            end
            
            class PreviewThumbnail
              class Representation < Google::Apis::Core::JsonRepresentation; end
            
              include Google::Apis::Core::JsonObjectSupport
            end
            
            class Thumbnail
              class Representation < Google::Apis::Core::JsonRepresentation; end
              
              class Image
                class Representation < Google::Apis::Core::JsonRepresentation; end
              
                include Google::Apis::Core::JsonObjectSupport
              end
            
              include Google::Apis::Core::JsonObjectSupport
            end
          
            include Google::Apis::Core::JsonObjectSupport
          end
          
          class Plusoners
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
          
          class Replies
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
          
          class Resharers
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
          
          class StatusForViewer
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Provider
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ActivityFeed
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Audience
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AudiencesFeed
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Circle
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class People
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CircleFeed
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Comment
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Actor
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class ClientSpecificActorInfo
            class Representation < Google::Apis::Core::JsonRepresentation; end
            
            class YoutubeActorInfo
              class Representation < Google::Apis::Core::JsonRepresentation; end
            
              include Google::Apis::Core::JsonObjectSupport
            end
          
            include Google::Apis::Core::JsonObjectSupport
          end
          
          class Image
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
          
          class Verification
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class InReplyTo
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Object
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Plusoners
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CommentFeed
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Media
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Author
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Image
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Exif
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PeopleFeed
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Person
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Cover
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class CoverInfo
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
          
          class CoverPhoto
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Email
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Image
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Name
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Organization
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class PlacesLived
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Url
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Place
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Address
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Position
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PlusDomainsAclentryResource
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Videostream
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Acl
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :domain_restricted, as: 'domainRestricted'
          collection :items, as: 'items', class: Google::Apis::PlusDomainsV1::PlusDomainsAclentryResource, decorator: Google::Apis::PlusDomainsV1::PlusDomainsAclentryResource::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class Activity
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :access, as: 'access', class: Google::Apis::PlusDomainsV1::Acl, decorator: Google::Apis::PlusDomainsV1::Acl::Representation
      
          property :actor, as: 'actor', class: Google::Apis::PlusDomainsV1::Activity::Actor, decorator: Google::Apis::PlusDomainsV1::Activity::Actor::Representation
      
          property :address, as: 'address'
          property :annotation, as: 'annotation'
          property :crosspost_source, as: 'crosspostSource'
          property :etag, as: 'etag'
          property :geocode, as: 'geocode'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :location, as: 'location', class: Google::Apis::PlusDomainsV1::Place, decorator: Google::Apis::PlusDomainsV1::Place::Representation
      
          property :object, as: 'object', class: Google::Apis::PlusDomainsV1::Activity::Object, decorator: Google::Apis::PlusDomainsV1::Activity::Object::Representation
      
          property :place_id, as: 'placeId'
          property :place_name, as: 'placeName'
          property :provider, as: 'provider', class: Google::Apis::PlusDomainsV1::Activity::Provider, decorator: Google::Apis::PlusDomainsV1::Activity::Provider::Representation
      
          property :published, as: 'published', type: DateTime
      
          property :radius, as: 'radius'
          property :title, as: 'title'
          property :updated, as: 'updated', type: DateTime
      
          property :url, as: 'url'
          property :verb, as: 'verb'
        end
        
        class Actor
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :client_specific_actor_info, as: 'clientSpecificActorInfo', class: Google::Apis::PlusDomainsV1::Activity::Actor::ClientSpecificActorInfo, decorator: Google::Apis::PlusDomainsV1::Activity::Actor::ClientSpecificActorInfo::Representation
        
            property :display_name, as: 'displayName'
            property :id, as: 'id'
            property :image, as: 'image', class: Google::Apis::PlusDomainsV1::Activity::Actor::Image, decorator: Google::Apis::PlusDomainsV1::Activity::Actor::Image::Representation
        
            property :name, as: 'name', class: Google::Apis::PlusDomainsV1::Activity::Actor::Name, decorator: Google::Apis::PlusDomainsV1::Activity::Actor::Name::Representation
        
            property :url, as: 'url'
            property :verification, as: 'verification', class: Google::Apis::PlusDomainsV1::Activity::Actor::Verification, decorator: Google::Apis::PlusDomainsV1::Activity::Actor::Verification::Representation
        
          end
          
          class ClientSpecificActorInfo
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :youtube_actor_info, as: 'youtubeActorInfo', class: Google::Apis::PlusDomainsV1::Activity::Actor::ClientSpecificActorInfo::YoutubeActorInfo, decorator: Google::Apis::PlusDomainsV1::Activity::Actor::ClientSpecificActorInfo::YoutubeActorInfo::Representation
          
            end
            
            class YoutubeActorInfo
              # @private
              class Representation < Google::Apis::Core::JsonRepresentation
                property :channel_id, as: 'channelId'
              end
            end
          end
          
          class Image
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :url, as: 'url'
            end
          end
          
          class Name
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :family_name, as: 'familyName'
              property :given_name, as: 'givenName'
            end
          end
          
          class Verification
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :ad_hoc_verified, as: 'adHocVerified'
            end
          end
        end
        
        class Object
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :actor, as: 'actor', class: Google::Apis::PlusDomainsV1::Activity::Object::Actor, decorator: Google::Apis::PlusDomainsV1::Activity::Object::Actor::Representation
        
            collection :attachments, as: 'attachments', class: Google::Apis::PlusDomainsV1::Activity::Object::Attachment, decorator: Google::Apis::PlusDomainsV1::Activity::Object::Attachment::Representation
        
            property :content, as: 'content'
            property :id, as: 'id'
            property :object_type, as: 'objectType'
            property :original_content, as: 'originalContent'
            property :plusoners, as: 'plusoners', class: Google::Apis::PlusDomainsV1::Activity::Object::Plusoners, decorator: Google::Apis::PlusDomainsV1::Activity::Object::Plusoners::Representation
        
            property :replies, as: 'replies', class: Google::Apis::PlusDomainsV1::Activity::Object::Replies, decorator: Google::Apis::PlusDomainsV1::Activity::Object::Replies::Representation
        
            property :resharers, as: 'resharers', class: Google::Apis::PlusDomainsV1::Activity::Object::Resharers, decorator: Google::Apis::PlusDomainsV1::Activity::Object::Resharers::Representation
        
            property :status_for_viewer, as: 'statusForViewer', class: Google::Apis::PlusDomainsV1::Activity::Object::StatusForViewer, decorator: Google::Apis::PlusDomainsV1::Activity::Object::StatusForViewer::Representation
        
            property :url, as: 'url'
          end
          
          class Actor
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :client_specific_actor_info, as: 'clientSpecificActorInfo', class: Google::Apis::PlusDomainsV1::Activity::Object::Actor::ClientSpecificActorInfo, decorator: Google::Apis::PlusDomainsV1::Activity::Object::Actor::ClientSpecificActorInfo::Representation
          
              property :display_name, as: 'displayName'
              property :id, as: 'id'
              property :image, as: 'image', class: Google::Apis::PlusDomainsV1::Activity::Object::Actor::Image, decorator: Google::Apis::PlusDomainsV1::Activity::Object::Actor::Image::Representation
          
              property :url, as: 'url'
              property :verification, as: 'verification', class: Google::Apis::PlusDomainsV1::Activity::Object::Actor::Verification, decorator: Google::Apis::PlusDomainsV1::Activity::Object::Actor::Verification::Representation
          
            end
            
            class ClientSpecificActorInfo
              # @private
              class Representation < Google::Apis::Core::JsonRepresentation
                property :youtube_actor_info, as: 'youtubeActorInfo', class: Google::Apis::PlusDomainsV1::Activity::Object::Actor::ClientSpecificActorInfo::YoutubeActorInfo, decorator: Google::Apis::PlusDomainsV1::Activity::Object::Actor::ClientSpecificActorInfo::YoutubeActorInfo::Representation
            
              end
              
              class YoutubeActorInfo
                # @private
                class Representation < Google::Apis::Core::JsonRepresentation
                  property :channel_id, as: 'channelId'
                end
              end
            end
            
            class Image
              # @private
              class Representation < Google::Apis::Core::JsonRepresentation
                property :url, as: 'url'
              end
            end
            
            class Verification
              # @private
              class Representation < Google::Apis::Core::JsonRepresentation
                property :ad_hoc_verified, as: 'adHocVerified'
              end
            end
          end
          
          class Attachment
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :content, as: 'content'
              property :display_name, as: 'displayName'
              property :embed, as: 'embed', class: Google::Apis::PlusDomainsV1::Activity::Object::Attachment::Embed, decorator: Google::Apis::PlusDomainsV1::Activity::Object::Attachment::Embed::Representation
          
              property :full_image, as: 'fullImage', class: Google::Apis::PlusDomainsV1::Activity::Object::Attachment::FullImage, decorator: Google::Apis::PlusDomainsV1::Activity::Object::Attachment::FullImage::Representation
          
              property :id, as: 'id'
              property :image, as: 'image', class: Google::Apis::PlusDomainsV1::Activity::Object::Attachment::Image, decorator: Google::Apis::PlusDomainsV1::Activity::Object::Attachment::Image::Representation
          
              property :object_type, as: 'objectType'
              collection :preview_thumbnails, as: 'previewThumbnails', class: Google::Apis::PlusDomainsV1::Activity::Object::Attachment::PreviewThumbnail, decorator: Google::Apis::PlusDomainsV1::Activity::Object::Attachment::PreviewThumbnail::Representation
          
              collection :thumbnails, as: 'thumbnails', class: Google::Apis::PlusDomainsV1::Activity::Object::Attachment::Thumbnail, decorator: Google::Apis::PlusDomainsV1::Activity::Object::Attachment::Thumbnail::Representation
          
              property :url, as: 'url'
            end
            
            class Embed
              # @private
              class Representation < Google::Apis::Core::JsonRepresentation
                property :type, as: 'type'
                property :url, as: 'url'
              end
            end
            
            class FullImage
              # @private
              class Representation < Google::Apis::Core::JsonRepresentation
                property :height, as: 'height'
                property :type, as: 'type'
                property :url, as: 'url'
                property :width, as: 'width'
              end
            end
            
            class Image
              # @private
              class Representation < Google::Apis::Core::JsonRepresentation
                property :height, as: 'height'
                property :type, as: 'type'
                property :url, as: 'url'
                property :width, as: 'width'
              end
            end
            
            class PreviewThumbnail
              # @private
              class Representation < Google::Apis::Core::JsonRepresentation
                property :url, as: 'url'
              end
            end
            
            class Thumbnail
              # @private
              class Representation < Google::Apis::Core::JsonRepresentation
                property :description, as: 'description'
                property :image, as: 'image', class: Google::Apis::PlusDomainsV1::Activity::Object::Attachment::Thumbnail::Image, decorator: Google::Apis::PlusDomainsV1::Activity::Object::Attachment::Thumbnail::Image::Representation
            
                property :url, as: 'url'
              end
              
              class Image
                # @private
                class Representation < Google::Apis::Core::JsonRepresentation
                  property :height, as: 'height'
                  property :type, as: 'type'
                  property :url, as: 'url'
                  property :width, as: 'width'
                end
              end
            end
          end
          
          class Plusoners
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :self_link, as: 'selfLink'
              property :total_items, as: 'totalItems'
            end
          end
          
          class Replies
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :self_link, as: 'selfLink'
              property :total_items, as: 'totalItems'
            end
          end
          
          class Resharers
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :self_link, as: 'selfLink'
              property :total_items, as: 'totalItems'
            end
          end
          
          class StatusForViewer
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :can_comment, as: 'canComment'
              property :can_plusone, as: 'canPlusone'
              property :can_update, as: 'canUpdate'
              property :is_plus_oned, as: 'isPlusOned'
              property :resharing_disabled, as: 'resharingDisabled'
            end
          end
        end
        
        class Provider
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :title, as: 'title'
          end
        end
      end
      
      class ActivityFeed
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::PlusDomainsV1::Activity, decorator: Google::Apis::PlusDomainsV1::Activity::Representation
      
          property :kind, as: 'kind'
          property :next_link, as: 'nextLink'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :title, as: 'title'
          property :updated, as: 'updated', type: DateTime
      
        end
      end
      
      class Audience
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :item, as: 'item', class: Google::Apis::PlusDomainsV1::PlusDomainsAclentryResource, decorator: Google::Apis::PlusDomainsV1::PlusDomainsAclentryResource::Representation
      
          property :kind, as: 'kind'
          property :member_count, as: 'memberCount'
          property :visibility, as: 'visibility'
        end
      end
      
      class AudiencesFeed
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          collection :items, as: 'items', class: Google::Apis::PlusDomainsV1::Audience, decorator: Google::Apis::PlusDomainsV1::Audience::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :total_items, as: 'totalItems'
        end
      end
      
      class Circle
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :display_name, as: 'displayName'
          property :etag, as: 'etag'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :people, as: 'people', class: Google::Apis::PlusDomainsV1::Circle::People, decorator: Google::Apis::PlusDomainsV1::Circle::People::Representation
      
          property :self_link, as: 'selfLink'
        end
        
        class People
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :total_items, as: 'totalItems'
          end
        end
      end
      
      class CircleFeed
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          collection :items, as: 'items', class: Google::Apis::PlusDomainsV1::Circle, decorator: Google::Apis::PlusDomainsV1::Circle::Representation
      
          property :kind, as: 'kind'
          property :next_link, as: 'nextLink'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :title, as: 'title'
          property :total_items, as: 'totalItems'
        end
      end
      
      class Comment
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :actor, as: 'actor', class: Google::Apis::PlusDomainsV1::Comment::Actor, decorator: Google::Apis::PlusDomainsV1::Comment::Actor::Representation
      
          property :etag, as: 'etag'
          property :id, as: 'id'
          collection :in_reply_to, as: 'inReplyTo', class: Google::Apis::PlusDomainsV1::Comment::InReplyTo, decorator: Google::Apis::PlusDomainsV1::Comment::InReplyTo::Representation
      
          property :kind, as: 'kind'
          property :object, as: 'object', class: Google::Apis::PlusDomainsV1::Comment::Object, decorator: Google::Apis::PlusDomainsV1::Comment::Object::Representation
      
          property :plusoners, as: 'plusoners', class: Google::Apis::PlusDomainsV1::Comment::Plusoners, decorator: Google::Apis::PlusDomainsV1::Comment::Plusoners::Representation
      
          property :published, as: 'published', type: DateTime
      
          property :self_link, as: 'selfLink'
          property :updated, as: 'updated', type: DateTime
      
          property :verb, as: 'verb'
        end
        
        class Actor
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :client_specific_actor_info, as: 'clientSpecificActorInfo', class: Google::Apis::PlusDomainsV1::Comment::Actor::ClientSpecificActorInfo, decorator: Google::Apis::PlusDomainsV1::Comment::Actor::ClientSpecificActorInfo::Representation
        
            property :display_name, as: 'displayName'
            property :id, as: 'id'
            property :image, as: 'image', class: Google::Apis::PlusDomainsV1::Comment::Actor::Image, decorator: Google::Apis::PlusDomainsV1::Comment::Actor::Image::Representation
        
            property :url, as: 'url'
            property :verification, as: 'verification', class: Google::Apis::PlusDomainsV1::Comment::Actor::Verification, decorator: Google::Apis::PlusDomainsV1::Comment::Actor::Verification::Representation
        
          end
          
          class ClientSpecificActorInfo
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :youtube_actor_info, as: 'youtubeActorInfo', class: Google::Apis::PlusDomainsV1::Comment::Actor::ClientSpecificActorInfo::YoutubeActorInfo, decorator: Google::Apis::PlusDomainsV1::Comment::Actor::ClientSpecificActorInfo::YoutubeActorInfo::Representation
          
            end
            
            class YoutubeActorInfo
              # @private
              class Representation < Google::Apis::Core::JsonRepresentation
                property :channel_id, as: 'channelId'
              end
            end
          end
          
          class Image
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :url, as: 'url'
            end
          end
          
          class Verification
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :ad_hoc_verified, as: 'adHocVerified'
            end
          end
        end
        
        class InReplyTo
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :id, as: 'id'
            property :url, as: 'url'
          end
        end
        
        class Object
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :content, as: 'content'
            property :object_type, as: 'objectType'
            property :original_content, as: 'originalContent'
          end
        end
        
        class Plusoners
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :total_items, as: 'totalItems'
          end
        end
      end
      
      class CommentFeed
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::PlusDomainsV1::Comment, decorator: Google::Apis::PlusDomainsV1::Comment::Representation
      
          property :kind, as: 'kind'
          property :next_link, as: 'nextLink'
          property :next_page_token, as: 'nextPageToken'
          property :title, as: 'title'
          property :updated, as: 'updated', type: DateTime
      
        end
      end
      
      class Media
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :author, as: 'author', class: Google::Apis::PlusDomainsV1::Media::Author, decorator: Google::Apis::PlusDomainsV1::Media::Author::Representation
      
          property :display_name, as: 'displayName'
          property :etag, as: 'etag'
          property :exif, as: 'exif', class: Google::Apis::PlusDomainsV1::Media::Exif, decorator: Google::Apis::PlusDomainsV1::Media::Exif::Representation
      
          property :height, as: 'height'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :media_created_time, as: 'mediaCreatedTime', type: DateTime
      
          property :media_url, as: 'mediaUrl'
          property :published, as: 'published', type: DateTime
      
          property :size_bytes, :numeric_string => true, as: 'sizeBytes'
          collection :streams, as: 'streams', class: Google::Apis::PlusDomainsV1::Videostream, decorator: Google::Apis::PlusDomainsV1::Videostream::Representation
      
          property :summary, as: 'summary'
          property :updated, as: 'updated', type: DateTime
      
          property :url, as: 'url'
          property :video_duration, :numeric_string => true, as: 'videoDuration'
          property :video_status, as: 'videoStatus'
          property :width, as: 'width'
        end
        
        class Author
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :display_name, as: 'displayName'
            property :id, as: 'id'
            property :image, as: 'image', class: Google::Apis::PlusDomainsV1::Media::Author::Image, decorator: Google::Apis::PlusDomainsV1::Media::Author::Image::Representation
        
            property :url, as: 'url'
          end
          
          class Image
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :url, as: 'url'
            end
          end
        end
        
        class Exif
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :time, as: 'time', type: DateTime
        
          end
        end
      end
      
      class PeopleFeed
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          collection :items, as: 'items', class: Google::Apis::PlusDomainsV1::Person, decorator: Google::Apis::PlusDomainsV1::Person::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :title, as: 'title'
          property :total_items, as: 'totalItems'
        end
      end
      
      class Person
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :about_me, as: 'aboutMe'
          property :birthday, as: 'birthday'
          property :bragging_rights, as: 'braggingRights'
          property :circled_by_count, as: 'circledByCount'
          property :cover, as: 'cover', class: Google::Apis::PlusDomainsV1::Person::Cover, decorator: Google::Apis::PlusDomainsV1::Person::Cover::Representation
      
          property :current_location, as: 'currentLocation'
          property :display_name, as: 'displayName'
          property :domain, as: 'domain'
          collection :emails, as: 'emails', class: Google::Apis::PlusDomainsV1::Person::Email, decorator: Google::Apis::PlusDomainsV1::Person::Email::Representation
      
          property :etag, as: 'etag'
          property :gender, as: 'gender'
          property :id, as: 'id'
          property :image, as: 'image', class: Google::Apis::PlusDomainsV1::Person::Image, decorator: Google::Apis::PlusDomainsV1::Person::Image::Representation
      
          property :is_plus_user, as: 'isPlusUser'
          property :kind, as: 'kind'
          property :name, as: 'name', class: Google::Apis::PlusDomainsV1::Person::Name, decorator: Google::Apis::PlusDomainsV1::Person::Name::Representation
      
          property :nickname, as: 'nickname'
          property :object_type, as: 'objectType'
          property :occupation, as: 'occupation'
          collection :organizations, as: 'organizations', class: Google::Apis::PlusDomainsV1::Person::Organization, decorator: Google::Apis::PlusDomainsV1::Person::Organization::Representation
      
          collection :places_lived, as: 'placesLived', class: Google::Apis::PlusDomainsV1::Person::PlacesLived, decorator: Google::Apis::PlusDomainsV1::Person::PlacesLived::Representation
      
          property :plus_one_count, as: 'plusOneCount'
          property :relationship_status, as: 'relationshipStatus'
          property :skills, as: 'skills'
          property :tagline, as: 'tagline'
          property :url, as: 'url'
          collection :urls, as: 'urls', class: Google::Apis::PlusDomainsV1::Person::Url, decorator: Google::Apis::PlusDomainsV1::Person::Url::Representation
      
          property :verified, as: 'verified'
        end
        
        class Cover
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :cover_info, as: 'coverInfo', class: Google::Apis::PlusDomainsV1::Person::Cover::CoverInfo, decorator: Google::Apis::PlusDomainsV1::Person::Cover::CoverInfo::Representation
        
            property :cover_photo, as: 'coverPhoto', class: Google::Apis::PlusDomainsV1::Person::Cover::CoverPhoto, decorator: Google::Apis::PlusDomainsV1::Person::Cover::CoverPhoto::Representation
        
            property :layout, as: 'layout'
          end
          
          class CoverInfo
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :left_image_offset, as: 'leftImageOffset'
              property :top_image_offset, as: 'topImageOffset'
            end
          end
          
          class CoverPhoto
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :height, as: 'height'
              property :url, as: 'url'
              property :width, as: 'width'
            end
          end
        end
        
        class Email
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :type, as: 'type'
            property :value, as: 'value'
          end
        end
        
        class Image
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :is_default, as: 'isDefault'
            property :url, as: 'url'
          end
        end
        
        class Name
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :family_name, as: 'familyName'
            property :formatted, as: 'formatted'
            property :given_name, as: 'givenName'
            property :honorific_prefix, as: 'honorificPrefix'
            property :honorific_suffix, as: 'honorificSuffix'
            property :middle_name, as: 'middleName'
          end
        end
        
        class Organization
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :department, as: 'department'
            property :description, as: 'description'
            property :end_date, as: 'endDate'
            property :location, as: 'location'
            property :name, as: 'name'
            property :primary, as: 'primary'
            property :start_date, as: 'startDate'
            property :title, as: 'title'
            property :type, as: 'type'
          end
        end
        
        class PlacesLived
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :primary, as: 'primary'
            property :value, as: 'value'
          end
        end
        
        class Url
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :label, as: 'label'
            property :type, as: 'type'
            property :value, as: 'value'
          end
        end
      end
      
      class Place
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :address, as: 'address', class: Google::Apis::PlusDomainsV1::Place::Address, decorator: Google::Apis::PlusDomainsV1::Place::Address::Representation
      
          property :display_name, as: 'displayName'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :position, as: 'position', class: Google::Apis::PlusDomainsV1::Place::Position, decorator: Google::Apis::PlusDomainsV1::Place::Position::Representation
      
        end
        
        class Address
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :formatted, as: 'formatted'
          end
        end
        
        class Position
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :latitude, as: 'latitude'
            property :longitude, as: 'longitude'
          end
        end
      end
      
      class PlusDomainsAclentryResource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :display_name, as: 'displayName'
          property :id, as: 'id'
          property :type, as: 'type'
        end
      end
      
      class Videostream
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :height, as: 'height'
          property :type, as: 'type'
          property :url, as: 'url'
          property :width, as: 'width'
        end
      end
    end
  end
end
