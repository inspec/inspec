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
    module BloggerV2
      
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
          property :description, as: 'description'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :locale, as: 'locale', class: Google::Apis::BloggerV2::Blog::Locale, decorator: Google::Apis::BloggerV2::Blog::Locale::Representation
      
          property :name, as: 'name'
          property :pages, as: 'pages', class: Google::Apis::BloggerV2::Blog::Pages, decorator: Google::Apis::BloggerV2::Blog::Pages::Representation
      
          property :posts, as: 'posts', class: Google::Apis::BloggerV2::Blog::Posts, decorator: Google::Apis::BloggerV2::Blog::Posts::Representation
      
          property :published, as: 'published', type: DateTime
      
          property :self_link, as: 'selfLink'
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
            property :self_link, as: 'selfLink'
            property :total_items, as: 'totalItems'
          end
        end
      end
      
      class BlogList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::BloggerV2::Blog, decorator: Google::Apis::BloggerV2::Blog::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class Comment
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :author, as: 'author', class: Google::Apis::BloggerV2::Comment::Author, decorator: Google::Apis::BloggerV2::Comment::Author::Representation
      
          property :blog, as: 'blog', class: Google::Apis::BloggerV2::Comment::Blog, decorator: Google::Apis::BloggerV2::Comment::Blog::Representation
      
          property :content, as: 'content'
          property :id, :numeric_string => true, as: 'id'
          property :in_reply_to, as: 'inReplyTo', class: Google::Apis::BloggerV2::Comment::InReplyTo, decorator: Google::Apis::BloggerV2::Comment::InReplyTo::Representation
      
          property :kind, as: 'kind'
          property :post, as: 'post', class: Google::Apis::BloggerV2::Comment::Post, decorator: Google::Apis::BloggerV2::Comment::Post::Representation
      
          property :published, as: 'published', type: DateTime
      
          property :self_link, as: 'selfLink'
          property :updated, as: 'updated', type: DateTime
      
        end
        
        class Author
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :display_name, as: 'displayName'
            property :id, as: 'id'
            property :image, as: 'image', class: Google::Apis::BloggerV2::Comment::Author::Image, decorator: Google::Apis::BloggerV2::Comment::Author::Image::Representation
        
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
            property :id, :numeric_string => true, as: 'id'
          end
        end
        
        class InReplyTo
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :id, :numeric_string => true, as: 'id'
          end
        end
        
        class Post
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :id, :numeric_string => true, as: 'id'
          end
        end
      end
      
      class CommentList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::BloggerV2::Comment, decorator: Google::Apis::BloggerV2::Comment::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :prev_page_token, as: 'prevPageToken'
        end
      end
      
      class Page
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :author, as: 'author', class: Google::Apis::BloggerV2::Page::Author, decorator: Google::Apis::BloggerV2::Page::Author::Representation
      
          property :blog, as: 'blog', class: Google::Apis::BloggerV2::Page::Blog, decorator: Google::Apis::BloggerV2::Page::Blog::Representation
      
          property :content, as: 'content'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :published, as: 'published', type: DateTime
      
          property :self_link, as: 'selfLink'
          property :title, as: 'title'
          property :updated, as: 'updated', type: DateTime
      
          property :url, as: 'url'
        end
        
        class Author
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :display_name, as: 'displayName'
            property :id, as: 'id'
            property :image, as: 'image', class: Google::Apis::BloggerV2::Page::Author::Image, decorator: Google::Apis::BloggerV2::Page::Author::Image::Representation
        
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
            property :id, :numeric_string => true, as: 'id'
          end
        end
      end
      
      class PageList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::BloggerV2::Page, decorator: Google::Apis::BloggerV2::Page::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class Post
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :author, as: 'author', class: Google::Apis::BloggerV2::Post::Author, decorator: Google::Apis::BloggerV2::Post::Author::Representation
      
          property :blog, as: 'blog', class: Google::Apis::BloggerV2::Post::Blog, decorator: Google::Apis::BloggerV2::Post::Blog::Representation
      
          property :content, as: 'content'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          collection :labels, as: 'labels'
          property :published, as: 'published', type: DateTime
      
          property :replies, as: 'replies', class: Google::Apis::BloggerV2::Post::Replies, decorator: Google::Apis::BloggerV2::Post::Replies::Representation
      
          property :self_link, as: 'selfLink'
          property :title, as: 'title'
          property :updated, as: 'updated', type: DateTime
      
          property :url, as: 'url'
        end
        
        class Author
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :display_name, as: 'displayName'
            property :id, as: 'id'
            property :image, as: 'image', class: Google::Apis::BloggerV2::Post::Author::Image, decorator: Google::Apis::BloggerV2::Post::Author::Image::Representation
        
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
            property :id, :numeric_string => true, as: 'id'
          end
        end
        
        class Replies
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :self_link, as: 'selfLink'
            property :total_items, :numeric_string => true, as: 'totalItems'
          end
        end
      end
      
      class PostList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::BloggerV2::Post, decorator: Google::Apis::BloggerV2::Post::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :prev_page_token, as: 'prevPageToken'
        end
      end
      
      class User
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :about, as: 'about'
          property :blogs, as: 'blogs', class: Google::Apis::BloggerV2::User::Blogs, decorator: Google::Apis::BloggerV2::User::Blogs::Representation
      
          property :created, as: 'created', type: DateTime
      
          property :display_name, as: 'displayName'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :locale, as: 'locale', class: Google::Apis::BloggerV2::User::Locale, decorator: Google::Apis::BloggerV2::User::Locale::Representation
      
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
