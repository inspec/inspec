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
      
      # 
      class Blog
        include Google::Apis::Core::Hashable
      
        # The JSON custom meta-data for the Blog
        # Corresponds to the JSON property `customMetaData`
        # @return [String]
        attr_accessor :custom_meta_data
      
        # The description of this blog. This is displayed underneath the title.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The identifier for this resource.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # The kind of this entry. Always blogger#blog
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The locale this Blog is set to.
        # Corresponds to the JSON property `locale`
        # @return [Google::Apis::BloggerV3::Blog::Locale]
        attr_accessor :locale
      
        # The name of this blog. This is displayed as the title.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The container of pages in this blog.
        # Corresponds to the JSON property `pages`
        # @return [Google::Apis::BloggerV3::Blog::Pages]
        attr_accessor :pages
      
        # The container of posts in this blog.
        # Corresponds to the JSON property `posts`
        # @return [Google::Apis::BloggerV3::Blog::Posts]
        attr_accessor :posts
      
        # RFC 3339 date-time when this blog was published.
        # Corresponds to the JSON property `published`
        # @return [DateTime]
        attr_accessor :published
      
        # The API REST URL to fetch this resource from.
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        # The status of the blog.
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        # RFC 3339 date-time when this blog was last updated.
        # Corresponds to the JSON property `updated`
        # @return [DateTime]
        attr_accessor :updated
      
        # The URL where this blog is published.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @custom_meta_data = args[:custom_meta_data] if args.key?(:custom_meta_data)
          @description = args[:description] if args.key?(:description)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @locale = args[:locale] if args.key?(:locale)
          @name = args[:name] if args.key?(:name)
          @pages = args[:pages] if args.key?(:pages)
          @posts = args[:posts] if args.key?(:posts)
          @published = args[:published] if args.key?(:published)
          @self_link = args[:self_link] if args.key?(:self_link)
          @status = args[:status] if args.key?(:status)
          @updated = args[:updated] if args.key?(:updated)
          @url = args[:url] if args.key?(:url)
        end
        
        # The locale this Blog is set to.
        class Locale
          include Google::Apis::Core::Hashable
        
          # The country this blog's locale is set to.
          # Corresponds to the JSON property `country`
          # @return [String]
          attr_accessor :country
        
          # The language this blog is authored in.
          # Corresponds to the JSON property `language`
          # @return [String]
          attr_accessor :language
        
          # The language variant this blog is authored in.
          # Corresponds to the JSON property `variant`
          # @return [String]
          attr_accessor :variant
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @country = args[:country] if args.key?(:country)
            @language = args[:language] if args.key?(:language)
            @variant = args[:variant] if args.key?(:variant)
          end
        end
        
        # The container of pages in this blog.
        class Pages
          include Google::Apis::Core::Hashable
        
          # The URL of the container for pages in this blog.
          # Corresponds to the JSON property `selfLink`
          # @return [String]
          attr_accessor :self_link
        
          # The count of pages in this blog.
          # Corresponds to the JSON property `totalItems`
          # @return [Fixnum]
          attr_accessor :total_items
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @self_link = args[:self_link] if args.key?(:self_link)
            @total_items = args[:total_items] if args.key?(:total_items)
          end
        end
        
        # The container of posts in this blog.
        class Posts
          include Google::Apis::Core::Hashable
        
          # The List of Posts for this Blog.
          # Corresponds to the JSON property `items`
          # @return [Array<Google::Apis::BloggerV3::Post>]
          attr_accessor :items
        
          # The URL of the container for posts in this blog.
          # Corresponds to the JSON property `selfLink`
          # @return [String]
          attr_accessor :self_link
        
          # The count of posts in this blog.
          # Corresponds to the JSON property `totalItems`
          # @return [Fixnum]
          attr_accessor :total_items
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @items = args[:items] if args.key?(:items)
            @self_link = args[:self_link] if args.key?(:self_link)
            @total_items = args[:total_items] if args.key?(:total_items)
          end
        end
      end
      
      # 
      class BlogList
        include Google::Apis::Core::Hashable
      
        # Admin level list of blog per-user information
        # Corresponds to the JSON property `blogUserInfos`
        # @return [Array<Google::Apis::BloggerV3::BlogUserInfo>]
        attr_accessor :blog_user_infos
      
        # The list of Blogs this user has Authorship or Admin rights over.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::BloggerV3::Blog>]
        attr_accessor :items
      
        # The kind of this entity. Always blogger#blogList
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @blog_user_infos = args[:blog_user_infos] if args.key?(:blog_user_infos)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # 
      class BlogPerUserInfo
        include Google::Apis::Core::Hashable
      
        # ID of the Blog resource
        # Corresponds to the JSON property `blogId`
        # @return [String]
        attr_accessor :blog_id
      
        # True if the user has Admin level access to the blog.
        # Corresponds to the JSON property `hasAdminAccess`
        # @return [Boolean]
        attr_accessor :has_admin_access
        alias_method :has_admin_access?, :has_admin_access
      
        # The kind of this entity. Always blogger#blogPerUserInfo
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The Photo Album Key for the user when adding photos to the blog
        # Corresponds to the JSON property `photosAlbumKey`
        # @return [String]
        attr_accessor :photos_album_key
      
        # Access permissions that the user has for the blog (ADMIN, AUTHOR, or READER).
        # Corresponds to the JSON property `role`
        # @return [String]
        attr_accessor :role
      
        # ID of the User
        # Corresponds to the JSON property `userId`
        # @return [String]
        attr_accessor :user_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @blog_id = args[:blog_id] if args.key?(:blog_id)
          @has_admin_access = args[:has_admin_access] if args.key?(:has_admin_access)
          @kind = args[:kind] if args.key?(:kind)
          @photos_album_key = args[:photos_album_key] if args.key?(:photos_album_key)
          @role = args[:role] if args.key?(:role)
          @user_id = args[:user_id] if args.key?(:user_id)
        end
      end
      
      # 
      class BlogUserInfo
        include Google::Apis::Core::Hashable
      
        # The Blog resource.
        # Corresponds to the JSON property `blog`
        # @return [Google::Apis::BloggerV3::Blog]
        attr_accessor :blog
      
        # Information about a User for the Blog.
        # Corresponds to the JSON property `blog_user_info`
        # @return [Google::Apis::BloggerV3::BlogPerUserInfo]
        attr_accessor :blog_user_info
      
        # The kind of this entity. Always blogger#blogUserInfo
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @blog = args[:blog] if args.key?(:blog)
          @blog_user_info = args[:blog_user_info] if args.key?(:blog_user_info)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # 
      class Comment
        include Google::Apis::Core::Hashable
      
        # The author of this Comment.
        # Corresponds to the JSON property `author`
        # @return [Google::Apis::BloggerV3::Comment::Author]
        attr_accessor :author
      
        # Data about the blog containing this comment.
        # Corresponds to the JSON property `blog`
        # @return [Google::Apis::BloggerV3::Comment::Blog]
        attr_accessor :blog
      
        # The actual content of the comment. May include HTML markup.
        # Corresponds to the JSON property `content`
        # @return [String]
        attr_accessor :content
      
        # The identifier for this resource.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Data about the comment this is in reply to.
        # Corresponds to the JSON property `inReplyTo`
        # @return [Google::Apis::BloggerV3::Comment::InReplyTo]
        attr_accessor :in_reply_to
      
        # The kind of this entry. Always blogger#comment
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Data about the post containing this comment.
        # Corresponds to the JSON property `post`
        # @return [Google::Apis::BloggerV3::Comment::Post]
        attr_accessor :post
      
        # RFC 3339 date-time when this comment was published.
        # Corresponds to the JSON property `published`
        # @return [DateTime]
        attr_accessor :published
      
        # The API REST URL to fetch this resource from.
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        # The status of the comment (only populated for admin users)
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        # RFC 3339 date-time when this comment was last updated.
        # Corresponds to the JSON property `updated`
        # @return [DateTime]
        attr_accessor :updated
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @author = args[:author] if args.key?(:author)
          @blog = args[:blog] if args.key?(:blog)
          @content = args[:content] if args.key?(:content)
          @id = args[:id] if args.key?(:id)
          @in_reply_to = args[:in_reply_to] if args.key?(:in_reply_to)
          @kind = args[:kind] if args.key?(:kind)
          @post = args[:post] if args.key?(:post)
          @published = args[:published] if args.key?(:published)
          @self_link = args[:self_link] if args.key?(:self_link)
          @status = args[:status] if args.key?(:status)
          @updated = args[:updated] if args.key?(:updated)
        end
        
        # The author of this Comment.
        class Author
          include Google::Apis::Core::Hashable
        
          # The display name.
          # Corresponds to the JSON property `displayName`
          # @return [String]
          attr_accessor :display_name
        
          # The identifier of the Comment creator.
          # Corresponds to the JSON property `id`
          # @return [String]
          attr_accessor :id
        
          # The comment creator's avatar.
          # Corresponds to the JSON property `image`
          # @return [Google::Apis::BloggerV3::Comment::Author::Image]
          attr_accessor :image
        
          # The URL of the Comment creator's Profile page.
          # Corresponds to the JSON property `url`
          # @return [String]
          attr_accessor :url
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @display_name = args[:display_name] if args.key?(:display_name)
            @id = args[:id] if args.key?(:id)
            @image = args[:image] if args.key?(:image)
            @url = args[:url] if args.key?(:url)
          end
          
          # The comment creator's avatar.
          class Image
            include Google::Apis::Core::Hashable
          
            # The comment creator's avatar URL.
            # Corresponds to the JSON property `url`
            # @return [String]
            attr_accessor :url
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @url = args[:url] if args.key?(:url)
            end
          end
        end
        
        # Data about the blog containing this comment.
        class Blog
          include Google::Apis::Core::Hashable
        
          # The identifier of the blog containing this comment.
          # Corresponds to the JSON property `id`
          # @return [String]
          attr_accessor :id
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @id = args[:id] if args.key?(:id)
          end
        end
        
        # Data about the comment this is in reply to.
        class InReplyTo
          include Google::Apis::Core::Hashable
        
          # The identified of the parent of this comment.
          # Corresponds to the JSON property `id`
          # @return [String]
          attr_accessor :id
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @id = args[:id] if args.key?(:id)
          end
        end
        
        # Data about the post containing this comment.
        class Post
          include Google::Apis::Core::Hashable
        
          # The identifier of the post containing this comment.
          # Corresponds to the JSON property `id`
          # @return [String]
          attr_accessor :id
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @id = args[:id] if args.key?(:id)
          end
        end
      end
      
      # 
      class CommentList
        include Google::Apis::Core::Hashable
      
        # Etag of the response.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The List of Comments for a Post.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::BloggerV3::Comment>]
        attr_accessor :items
      
        # The kind of this entry. Always blogger#commentList
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Pagination token to fetch the next page, if one exists.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Pagination token to fetch the previous page, if one exists.
        # Corresponds to the JSON property `prevPageToken`
        # @return [String]
        attr_accessor :prev_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @prev_page_token = args[:prev_page_token] if args.key?(:prev_page_token)
        end
      end
      
      # 
      class Page
        include Google::Apis::Core::Hashable
      
        # The author of this Page.
        # Corresponds to the JSON property `author`
        # @return [Google::Apis::BloggerV3::Page::Author]
        attr_accessor :author
      
        # Data about the blog containing this Page.
        # Corresponds to the JSON property `blog`
        # @return [Google::Apis::BloggerV3::Page::Blog]
        attr_accessor :blog
      
        # The body content of this Page, in HTML.
        # Corresponds to the JSON property `content`
        # @return [String]
        attr_accessor :content
      
        # Etag of the resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The identifier for this resource.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # The kind of this entity. Always blogger#page
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # RFC 3339 date-time when this Page was published.
        # Corresponds to the JSON property `published`
        # @return [DateTime]
        attr_accessor :published
      
        # The API REST URL to fetch this resource from.
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        # The status of the page for admin resources (either LIVE or DRAFT).
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        # The title of this entity. This is the name displayed in the Admin user
        # interface.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        # RFC 3339 date-time when this Page was last updated.
        # Corresponds to the JSON property `updated`
        # @return [DateTime]
        attr_accessor :updated
      
        # The URL that this Page is displayed at.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @author = args[:author] if args.key?(:author)
          @blog = args[:blog] if args.key?(:blog)
          @content = args[:content] if args.key?(:content)
          @etag = args[:etag] if args.key?(:etag)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @published = args[:published] if args.key?(:published)
          @self_link = args[:self_link] if args.key?(:self_link)
          @status = args[:status] if args.key?(:status)
          @title = args[:title] if args.key?(:title)
          @updated = args[:updated] if args.key?(:updated)
          @url = args[:url] if args.key?(:url)
        end
        
        # The author of this Page.
        class Author
          include Google::Apis::Core::Hashable
        
          # The display name.
          # Corresponds to the JSON property `displayName`
          # @return [String]
          attr_accessor :display_name
        
          # The identifier of the Page creator.
          # Corresponds to the JSON property `id`
          # @return [String]
          attr_accessor :id
        
          # The page author's avatar.
          # Corresponds to the JSON property `image`
          # @return [Google::Apis::BloggerV3::Page::Author::Image]
          attr_accessor :image
        
          # The URL of the Page creator's Profile page.
          # Corresponds to the JSON property `url`
          # @return [String]
          attr_accessor :url
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @display_name = args[:display_name] if args.key?(:display_name)
            @id = args[:id] if args.key?(:id)
            @image = args[:image] if args.key?(:image)
            @url = args[:url] if args.key?(:url)
          end
          
          # The page author's avatar.
          class Image
            include Google::Apis::Core::Hashable
          
            # The page author's avatar URL.
            # Corresponds to the JSON property `url`
            # @return [String]
            attr_accessor :url
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @url = args[:url] if args.key?(:url)
            end
          end
        end
        
        # Data about the blog containing this Page.
        class Blog
          include Google::Apis::Core::Hashable
        
          # The identifier of the blog containing this page.
          # Corresponds to the JSON property `id`
          # @return [String]
          attr_accessor :id
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @id = args[:id] if args.key?(:id)
          end
        end
      end
      
      # 
      class PageList
        include Google::Apis::Core::Hashable
      
        # Etag of the response.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The list of Pages for a Blog.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::BloggerV3::Page>]
        attr_accessor :items
      
        # The kind of this entity. Always blogger#pageList
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Pagination token to fetch the next page, if one exists.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # 
      class Pageviews
        include Google::Apis::Core::Hashable
      
        # Blog Id
        # Corresponds to the JSON property `blogId`
        # @return [String]
        attr_accessor :blog_id
      
        # The container of posts in this blog.
        # Corresponds to the JSON property `counts`
        # @return [Array<Google::Apis::BloggerV3::Pageviews::Count>]
        attr_accessor :counts
      
        # The kind of this entry. Always blogger#page_views
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @blog_id = args[:blog_id] if args.key?(:blog_id)
          @counts = args[:counts] if args.key?(:counts)
          @kind = args[:kind] if args.key?(:kind)
        end
        
        # 
        class Count
          include Google::Apis::Core::Hashable
        
          # Count of page views for the given time range
          # Corresponds to the JSON property `count`
          # @return [Fixnum]
          attr_accessor :count
        
          # Time range the given count applies to
          # Corresponds to the JSON property `timeRange`
          # @return [String]
          attr_accessor :time_range
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @count = args[:count] if args.key?(:count)
            @time_range = args[:time_range] if args.key?(:time_range)
          end
        end
      end
      
      # 
      class Post
        include Google::Apis::Core::Hashable
      
        # The author of this Post.
        # Corresponds to the JSON property `author`
        # @return [Google::Apis::BloggerV3::Post::Author]
        attr_accessor :author
      
        # Data about the blog containing this Post.
        # Corresponds to the JSON property `blog`
        # @return [Google::Apis::BloggerV3::Post::Blog]
        attr_accessor :blog
      
        # The content of the Post. May contain HTML markup.
        # Corresponds to the JSON property `content`
        # @return [String]
        attr_accessor :content
      
        # The JSON meta-data for the Post.
        # Corresponds to the JSON property `customMetaData`
        # @return [String]
        attr_accessor :custom_meta_data
      
        # Etag of the resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The identifier of this Post.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Display image for the Post.
        # Corresponds to the JSON property `images`
        # @return [Array<Google::Apis::BloggerV3::Post::Image>]
        attr_accessor :images
      
        # The kind of this entity. Always blogger#post
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The list of labels this Post was tagged with.
        # Corresponds to the JSON property `labels`
        # @return [Array<String>]
        attr_accessor :labels
      
        # The location for geotagged posts.
        # Corresponds to the JSON property `location`
        # @return [Google::Apis::BloggerV3::Post::Location]
        attr_accessor :location
      
        # RFC 3339 date-time when this Post was published.
        # Corresponds to the JSON property `published`
        # @return [DateTime]
        attr_accessor :published
      
        # Comment control and display setting for readers of this post.
        # Corresponds to the JSON property `readerComments`
        # @return [String]
        attr_accessor :reader_comments
      
        # The container of comments on this Post.
        # Corresponds to the JSON property `replies`
        # @return [Google::Apis::BloggerV3::Post::Replies]
        attr_accessor :replies
      
        # The API REST URL to fetch this resource from.
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        # Status of the post. Only set for admin-level requests
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        # The title of the Post.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        # The title link URL, similar to atom's related link.
        # Corresponds to the JSON property `titleLink`
        # @return [String]
        attr_accessor :title_link
      
        # RFC 3339 date-time when this Post was last updated.
        # Corresponds to the JSON property `updated`
        # @return [DateTime]
        attr_accessor :updated
      
        # The URL where this Post is displayed.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @author = args[:author] if args.key?(:author)
          @blog = args[:blog] if args.key?(:blog)
          @content = args[:content] if args.key?(:content)
          @custom_meta_data = args[:custom_meta_data] if args.key?(:custom_meta_data)
          @etag = args[:etag] if args.key?(:etag)
          @id = args[:id] if args.key?(:id)
          @images = args[:images] if args.key?(:images)
          @kind = args[:kind] if args.key?(:kind)
          @labels = args[:labels] if args.key?(:labels)
          @location = args[:location] if args.key?(:location)
          @published = args[:published] if args.key?(:published)
          @reader_comments = args[:reader_comments] if args.key?(:reader_comments)
          @replies = args[:replies] if args.key?(:replies)
          @self_link = args[:self_link] if args.key?(:self_link)
          @status = args[:status] if args.key?(:status)
          @title = args[:title] if args.key?(:title)
          @title_link = args[:title_link] if args.key?(:title_link)
          @updated = args[:updated] if args.key?(:updated)
          @url = args[:url] if args.key?(:url)
        end
        
        # The author of this Post.
        class Author
          include Google::Apis::Core::Hashable
        
          # The display name.
          # Corresponds to the JSON property `displayName`
          # @return [String]
          attr_accessor :display_name
        
          # The identifier of the Post creator.
          # Corresponds to the JSON property `id`
          # @return [String]
          attr_accessor :id
        
          # The Post author's avatar.
          # Corresponds to the JSON property `image`
          # @return [Google::Apis::BloggerV3::Post::Author::Image]
          attr_accessor :image
        
          # The URL of the Post creator's Profile page.
          # Corresponds to the JSON property `url`
          # @return [String]
          attr_accessor :url
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @display_name = args[:display_name] if args.key?(:display_name)
            @id = args[:id] if args.key?(:id)
            @image = args[:image] if args.key?(:image)
            @url = args[:url] if args.key?(:url)
          end
          
          # The Post author's avatar.
          class Image
            include Google::Apis::Core::Hashable
          
            # The Post author's avatar URL.
            # Corresponds to the JSON property `url`
            # @return [String]
            attr_accessor :url
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @url = args[:url] if args.key?(:url)
            end
          end
        end
        
        # Data about the blog containing this Post.
        class Blog
          include Google::Apis::Core::Hashable
        
          # The identifier of the Blog that contains this Post.
          # Corresponds to the JSON property `id`
          # @return [String]
          attr_accessor :id
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @id = args[:id] if args.key?(:id)
          end
        end
        
        # 
        class Image
          include Google::Apis::Core::Hashable
        
          # 
          # Corresponds to the JSON property `url`
          # @return [String]
          attr_accessor :url
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @url = args[:url] if args.key?(:url)
          end
        end
        
        # The location for geotagged posts.
        class Location
          include Google::Apis::Core::Hashable
        
          # Location's latitude.
          # Corresponds to the JSON property `lat`
          # @return [Float]
          attr_accessor :lat
        
          # Location's longitude.
          # Corresponds to the JSON property `lng`
          # @return [Float]
          attr_accessor :lng
        
          # Location name.
          # Corresponds to the JSON property `name`
          # @return [String]
          attr_accessor :name
        
          # Location's viewport span. Can be used when rendering a map preview.
          # Corresponds to the JSON property `span`
          # @return [String]
          attr_accessor :span
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @lat = args[:lat] if args.key?(:lat)
            @lng = args[:lng] if args.key?(:lng)
            @name = args[:name] if args.key?(:name)
            @span = args[:span] if args.key?(:span)
          end
        end
        
        # The container of comments on this Post.
        class Replies
          include Google::Apis::Core::Hashable
        
          # The List of Comments for this Post.
          # Corresponds to the JSON property `items`
          # @return [Array<Google::Apis::BloggerV3::Comment>]
          attr_accessor :items
        
          # The URL of the comments on this post.
          # Corresponds to the JSON property `selfLink`
          # @return [String]
          attr_accessor :self_link
        
          # The count of comments on this post.
          # Corresponds to the JSON property `totalItems`
          # @return [Fixnum]
          attr_accessor :total_items
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @items = args[:items] if args.key?(:items)
            @self_link = args[:self_link] if args.key?(:self_link)
            @total_items = args[:total_items] if args.key?(:total_items)
          end
        end
      end
      
      # 
      class PostList
        include Google::Apis::Core::Hashable
      
        # Etag of the response.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The list of Posts for this Blog.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::BloggerV3::Post>]
        attr_accessor :items
      
        # The kind of this entity. Always blogger#postList
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Pagination token to fetch the next page, if one exists.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # 
      class PostPerUserInfo
        include Google::Apis::Core::Hashable
      
        # ID of the Blog that the post resource belongs to.
        # Corresponds to the JSON property `blogId`
        # @return [String]
        attr_accessor :blog_id
      
        # True if the user has Author level access to the post.
        # Corresponds to the JSON property `hasEditAccess`
        # @return [Boolean]
        attr_accessor :has_edit_access
        alias_method :has_edit_access?, :has_edit_access
      
        # The kind of this entity. Always blogger#postPerUserInfo
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # ID of the Post resource.
        # Corresponds to the JSON property `postId`
        # @return [String]
        attr_accessor :post_id
      
        # ID of the User.
        # Corresponds to the JSON property `userId`
        # @return [String]
        attr_accessor :user_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @blog_id = args[:blog_id] if args.key?(:blog_id)
          @has_edit_access = args[:has_edit_access] if args.key?(:has_edit_access)
          @kind = args[:kind] if args.key?(:kind)
          @post_id = args[:post_id] if args.key?(:post_id)
          @user_id = args[:user_id] if args.key?(:user_id)
        end
      end
      
      # 
      class PostUserInfo
        include Google::Apis::Core::Hashable
      
        # The kind of this entity. Always blogger#postUserInfo
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The Post resource.
        # Corresponds to the JSON property `post`
        # @return [Google::Apis::BloggerV3::Post]
        attr_accessor :post
      
        # Information about a User for the Post.
        # Corresponds to the JSON property `post_user_info`
        # @return [Google::Apis::BloggerV3::PostPerUserInfo]
        attr_accessor :post_user_info
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @post = args[:post] if args.key?(:post)
          @post_user_info = args[:post_user_info] if args.key?(:post_user_info)
        end
      end
      
      # 
      class PostUserInfosList
        include Google::Apis::Core::Hashable
      
        # The list of Posts with User information for the post, for this Blog.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::BloggerV3::PostUserInfo>]
        attr_accessor :items
      
        # The kind of this entity. Always blogger#postList
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Pagination token to fetch the next page, if one exists.
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
      
      # 
      class User
        include Google::Apis::Core::Hashable
      
        # Profile summary information.
        # Corresponds to the JSON property `about`
        # @return [String]
        attr_accessor :about
      
        # The container of blogs for this user.
        # Corresponds to the JSON property `blogs`
        # @return [Google::Apis::BloggerV3::User::Blogs]
        attr_accessor :blogs
      
        # The timestamp of when this profile was created, in seconds since epoch.
        # Corresponds to the JSON property `created`
        # @return [DateTime]
        attr_accessor :created
      
        # The display name.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # The identifier for this User.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # The kind of this entity. Always blogger#user
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # This user's locale
        # Corresponds to the JSON property `locale`
        # @return [Google::Apis::BloggerV3::User::Locale]
        attr_accessor :locale
      
        # The API REST URL to fetch this resource from.
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        # The user's profile page.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @about = args[:about] if args.key?(:about)
          @blogs = args[:blogs] if args.key?(:blogs)
          @created = args[:created] if args.key?(:created)
          @display_name = args[:display_name] if args.key?(:display_name)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @locale = args[:locale] if args.key?(:locale)
          @self_link = args[:self_link] if args.key?(:self_link)
          @url = args[:url] if args.key?(:url)
        end
        
        # The container of blogs for this user.
        class Blogs
          include Google::Apis::Core::Hashable
        
          # The URL of the Blogs for this user.
          # Corresponds to the JSON property `selfLink`
          # @return [String]
          attr_accessor :self_link
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @self_link = args[:self_link] if args.key?(:self_link)
          end
        end
        
        # This user's locale
        class Locale
          include Google::Apis::Core::Hashable
        
          # The user's country setting.
          # Corresponds to the JSON property `country`
          # @return [String]
          attr_accessor :country
        
          # The user's language setting.
          # Corresponds to the JSON property `language`
          # @return [String]
          attr_accessor :language
        
          # The user's language variant setting.
          # Corresponds to the JSON property `variant`
          # @return [String]
          attr_accessor :variant
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @country = args[:country] if args.key?(:country)
            @language = args[:language] if args.key?(:language)
            @variant = args[:variant] if args.key?(:variant)
          end
        end
      end
    end
  end
end
