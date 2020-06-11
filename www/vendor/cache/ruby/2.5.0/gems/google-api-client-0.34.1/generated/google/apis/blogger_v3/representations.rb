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
    module BloggerV3
      
      class Blog
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Locale
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Pages
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Posts
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BlogList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BlogPerUserInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BlogUserInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Comment
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Author
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Image
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Blog
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class InReplyTo
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Post
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CommentList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Page
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Author
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Image
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Blog
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PageList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Pageviews
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Count
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Post
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Author
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Image
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Blog
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Image
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Location
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Replies
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PostList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PostPerUserInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PostUserInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PostUserInfosList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class User
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Blogs
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Locale
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Blog
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :custom_meta_data, as: 'customMetaData'
          property :description, as: 'description'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :locale, as: 'locale', class: Google::Apis::BloggerV3::Blog::Locale, decorator: Google::Apis::BloggerV3::Blog::Locale::Representation
      
          property :name, as: 'name'
          property :pages, as: 'pages', class: Google::Apis::BloggerV3::Blog::Pages, decorator: Google::Apis::BloggerV3::Blog::Pages::Representation
      
          property :posts, as: 'posts', class: Google::Apis::BloggerV3::Blog::Posts, decorator: Google::Apis::BloggerV3::Blog::Posts::Representation
      
          property :published, as: 'published', type: DateTime
      
          property :self_link, as: 'selfLink'
          property :status, as: 'status'
          property :updated, as: 'updated', type: DateTime
      
          property :url, as: 'url'
        end
        
        class Locale
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :country, as: 'country'
            property :language, as: 'language'
            property :variant, as: 'variant'
          end
        end
        
        class Pages
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :self_link, as: 'selfLink'
            property :total_items, as: 'totalItems'
          end
        end
        
        class Posts
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            collection :items, as: 'items', class: Google::Apis::BloggerV3::Post, decorator: Google::Apis::BloggerV3::Post::Representation
        
            property :self_link, as: 'selfLink'
            property :total_items, as: 'totalItems'
          end
        end
      end
      
      class BlogList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :blog_user_infos, as: 'blogUserInfos', class: Google::Apis::BloggerV3::BlogUserInfo, decorator: Google::Apis::BloggerV3::BlogUserInfo::Representation
      
          collection :items, as: 'items', class: Google::Apis::BloggerV3::Blog, decorator: Google::Apis::BloggerV3::Blog::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class BlogPerUserInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :blog_id, as: 'blogId'
          property :has_admin_access, as: 'hasAdminAccess'
          property :kind, as: 'kind'
          property :photos_album_key, as: 'photosAlbumKey'
          property :role, as: 'role'
          property :user_id, as: 'userId'
        end
      end
      
      class BlogUserInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :blog, as: 'blog', class: Google::Apis::BloggerV3::Blog, decorator: Google::Apis::BloggerV3::Blog::Representation
      
          property :blog_user_info, as: 'blog_user_info', class: Google::Apis::BloggerV3::BlogPerUserInfo, decorator: Google::Apis::BloggerV3::BlogPerUserInfo::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class Comment
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :author, as: 'author', class: Google::Apis::BloggerV3::Comment::Author, decorator: Google::Apis::BloggerV3::Comment::Author::Representation
      
          property :blog, as: 'blog', class: Google::Apis::BloggerV3::Comment::Blog, decorator: Google::Apis::BloggerV3::Comment::Blog::Representation
      
          property :content, as: 'content'
          property :id, as: 'id'
          property :in_reply_to, as: 'inReplyTo', class: Google::Apis::BloggerV3::Comment::InReplyTo, decorator: Google::Apis::BloggerV3::Comment::InReplyTo::Representation
      
          property :kind, as: 'kind'
          property :post, as: 'post', class: Google::Apis::BloggerV3::Comment::Post, decorator: Google::Apis::BloggerV3::Comment::Post::Representation
      
          property :published, as: 'published', type: DateTime
      
          property :self_link, as: 'selfLink'
          property :status, as: 'status'
          property :updated, as: 'updated', type: DateTime
      
        end
        
        class Author
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :display_name, as: 'displayName'
            property :id, as: 'id'
            property :image, as: 'image', class: Google::Apis::BloggerV3::Comment::Author::Image, decorator: Google::Apis::BloggerV3::Comment::Author::Image::Representation
        
            property :url, as: 'url'
          end
          
          class Image
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :url, as: 'url'
            end
          end
        end
        
        class Blog
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :id, as: 'id'
          end
        end
        
        class InReplyTo
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :id, as: 'id'
          end
        end
        
        class Post
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :id, as: 'id'
          end
        end
      end
      
      class CommentList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          collection :items, as: 'items', class: Google::Apis::BloggerV3::Comment, decorator: Google::Apis::BloggerV3::Comment::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :prev_page_token, as: 'prevPageToken'
        end
      end
      
      class Page
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :author, as: 'author', class: Google::Apis::BloggerV3::Page::Author, decorator: Google::Apis::BloggerV3::Page::Author::Representation
      
          property :blog, as: 'blog', class: Google::Apis::BloggerV3::Page::Blog, decorator: Google::Apis::BloggerV3::Page::Blog::Representation
      
          property :content, as: 'content'
          property :etag, as: 'etag'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :published, as: 'published', type: DateTime
      
          property :self_link, as: 'selfLink'
          property :status, as: 'status'
          property :title, as: 'title'
          property :updated, as: 'updated', type: DateTime
      
          property :url, as: 'url'
        end
        
        class Author
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :display_name, as: 'displayName'
            property :id, as: 'id'
            property :image, as: 'image', class: Google::Apis::BloggerV3::Page::Author::Image, decorator: Google::Apis::BloggerV3::Page::Author::Image::Representation
        
            property :url, as: 'url'
          end
          
          class Image
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :url, as: 'url'
            end
          end
        end
        
        class Blog
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :id, as: 'id'
          end
        end
      end
      
      class PageList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          collection :items, as: 'items', class: Google::Apis::BloggerV3::Page, decorator: Google::Apis::BloggerV3::Page::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class Pageviews
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :blog_id, as: 'blogId'
          collection :counts, as: 'counts', class: Google::Apis::BloggerV3::Pageviews::Count, decorator: Google::Apis::BloggerV3::Pageviews::Count::Representation
      
          property :kind, as: 'kind'
        end
        
        class Count
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :count, :numeric_string => true, as: 'count'
            property :time_range, as: 'timeRange'
          end
        end
      end
      
      class Post
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :author, as: 'author', class: Google::Apis::BloggerV3::Post::Author, decorator: Google::Apis::BloggerV3::Post::Author::Representation
      
          property :blog, as: 'blog', class: Google::Apis::BloggerV3::Post::Blog, decorator: Google::Apis::BloggerV3::Post::Blog::Representation
      
          property :content, as: 'content'
          property :custom_meta_data, as: 'customMetaData'
          property :etag, as: 'etag'
          property :id, as: 'id'
          collection :images, as: 'images', class: Google::Apis::BloggerV3::Post::Image, decorator: Google::Apis::BloggerV3::Post::Image::Representation
      
          property :kind, as: 'kind'
          collection :labels, as: 'labels'
          property :location, as: 'location', class: Google::Apis::BloggerV3::Post::Location, decorator: Google::Apis::BloggerV3::Post::Location::Representation
      
          property :published, as: 'published', type: DateTime
      
          property :reader_comments, as: 'readerComments'
          property :replies, as: 'replies', class: Google::Apis::BloggerV3::Post::Replies, decorator: Google::Apis::BloggerV3::Post::Replies::Representation
      
          property :self_link, as: 'selfLink'
          property :status, as: 'status'
          property :title, as: 'title'
          property :title_link, as: 'titleLink'
          property :updated, as: 'updated', type: DateTime
      
          property :url, as: 'url'
        end
        
        class Author
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :display_name, as: 'displayName'
            property :id, as: 'id'
            property :image, as: 'image', class: Google::Apis::BloggerV3::Post::Author::Image, decorator: Google::Apis::BloggerV3::Post::Author::Image::Representation
        
            property :url, as: 'url'
          end
          
          class Image
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :url, as: 'url'
            end
          end
        end
        
        class Blog
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :id, as: 'id'
          end
        end
        
        class Image
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :url, as: 'url'
          end
        end
        
        class Location
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :lat, as: 'lat'
            property :lng, as: 'lng'
            property :name, as: 'name'
            property :span, as: 'span'
          end
        end
        
        class Replies
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            collection :items, as: 'items', class: Google::Apis::BloggerV3::Comment, decorator: Google::Apis::BloggerV3::Comment::Representation
        
            property :self_link, as: 'selfLink'
            property :total_items, :numeric_string => true, as: 'totalItems'
          end
        end
      end
      
      class PostList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          collection :items, as: 'items', class: Google::Apis::BloggerV3::Post, decorator: Google::Apis::BloggerV3::Post::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class PostPerUserInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :blog_id, as: 'blogId'
          property :has_edit_access, as: 'hasEditAccess'
          property :kind, as: 'kind'
          property :post_id, as: 'postId'
          property :user_id, as: 'userId'
        end
      end
      
      class PostUserInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :post, as: 'post', class: Google::Apis::BloggerV3::Post, decorator: Google::Apis::BloggerV3::Post::Representation
      
          property :post_user_info, as: 'post_user_info', class: Google::Apis::BloggerV3::PostPerUserInfo, decorator: Google::Apis::BloggerV3::PostPerUserInfo::Representation
      
        end
      end
      
      class PostUserInfosList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::BloggerV3::PostUserInfo, decorator: Google::Apis::BloggerV3::PostUserInfo::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class User
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :about, as: 'about'
          property :blogs, as: 'blogs', class: Google::Apis::BloggerV3::User::Blogs, decorator: Google::Apis::BloggerV3::User::Blogs::Representation
      
          property :created, as: 'created', type: DateTime
      
          property :display_name, as: 'displayName'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :locale, as: 'locale', class: Google::Apis::BloggerV3::User::Locale, decorator: Google::Apis::BloggerV3::User::Locale::Representation
      
          property :self_link, as: 'selfLink'
          property :url, as: 'url'
        end
        
        class Blogs
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :self_link, as: 'selfLink'
          end
        end
        
        class Locale
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :country, as: 'country'
            property :language, as: 'language'
            property :variant, as: 'variant'
          end
        end
      end
    end
  end
end
