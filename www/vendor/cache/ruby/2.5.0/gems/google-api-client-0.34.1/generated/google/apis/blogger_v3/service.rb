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
    module BloggerV3
      # Blogger API
      #
      # API for access to the data within Blogger.
      #
      # @example
      #    require 'google/apis/blogger_v3'
      #
      #    Blogger = Google::Apis::BloggerV3 # Alias the module
      #    service = Blogger::BloggerService.new
      #
      # @see https://developers.google.com/blogger/docs/3.0/getting_started
      class BloggerService < Google::Apis::Core::BaseService
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
          super('https://www.googleapis.com/', 'blogger/v3/')
          @batch_path = 'batch/blogger/v3'
        end
        
        # Gets one blog and user info pair by blogId and userId.
        # @param [String] user_id
        #   ID of the user whose blogs are to be fetched. Either the word 'self' or the
        #   user's profile identifier.
        # @param [String] blog_id
        #   The ID of the blog to get.
        # @param [Fixnum] max_posts
        #   Maximum number of posts to pull back with the blog.
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
        # @yieldparam result [Google::Apis::BloggerV3::BlogUserInfo] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BloggerV3::BlogUserInfo]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_blog_user_info(user_id, blog_id, max_posts: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'users/{userId}/blogs/{blogId}', options)
          command.response_representation = Google::Apis::BloggerV3::BlogUserInfo::Representation
          command.response_class = Google::Apis::BloggerV3::BlogUserInfo
          command.params['userId'] = user_id unless user_id.nil?
          command.params['blogId'] = blog_id unless blog_id.nil?
          command.query['maxPosts'] = max_posts unless max_posts.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one blog by ID.
        # @param [String] blog_id
        #   The ID of the blog to get.
        # @param [Fixnum] max_posts
        #   Maximum number of posts to pull back with the blog.
        # @param [String] view
        #   Access level with which to view the blog. Note that some fields require
        #   elevated access.
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
        # @yieldparam result [Google::Apis::BloggerV3::Blog] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BloggerV3::Blog]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_blog(blog_id, max_posts: nil, view: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'blogs/{blogId}', options)
          command.response_representation = Google::Apis::BloggerV3::Blog::Representation
          command.response_class = Google::Apis::BloggerV3::Blog
          command.params['blogId'] = blog_id unless blog_id.nil?
          command.query['maxPosts'] = max_posts unless max_posts.nil?
          command.query['view'] = view unless view.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieve a Blog by URL.
        # @param [String] url
        #   The URL of the blog to retrieve.
        # @param [String] view
        #   Access level with which to view the blog. Note that some fields require
        #   elevated access.
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
        # @yieldparam result [Google::Apis::BloggerV3::Blog] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BloggerV3::Blog]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_blog_by_url(url, view: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'blogs/byurl', options)
          command.response_representation = Google::Apis::BloggerV3::Blog::Representation
          command.response_class = Google::Apis::BloggerV3::Blog
          command.query['url'] = url unless url.nil?
          command.query['view'] = view unless view.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of blogs, possibly filtered.
        # @param [String] user_id
        #   ID of the user whose blogs are to be fetched. Either the word 'self' or the
        #   user's profile identifier.
        # @param [Boolean] fetch_user_info
        #   Whether the response is a list of blogs with per-user information instead of
        #   just blogs.
        # @param [Array<String>, String] role
        #   User access types for blogs to include in the results, e.g. AUTHOR will return
        #   blogs where the user has author level access. If no roles are specified,
        #   defaults to ADMIN and AUTHOR roles.
        # @param [Array<String>, String] status
        #   Blog statuses to include in the result (default: Live blogs only). Note that
        #   ADMIN access is required to view deleted blogs.
        # @param [String] view
        #   Access level with which to view the blogs. Note that some fields require
        #   elevated access.
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
        # @yieldparam result [Google::Apis::BloggerV3::BlogList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BloggerV3::BlogList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_blogs_by_user(user_id, fetch_user_info: nil, role: nil, status: nil, view: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'users/{userId}/blogs', options)
          command.response_representation = Google::Apis::BloggerV3::BlogList::Representation
          command.response_class = Google::Apis::BloggerV3::BlogList
          command.params['userId'] = user_id unless user_id.nil?
          command.query['fetchUserInfo'] = fetch_user_info unless fetch_user_info.nil?
          command.query['role'] = role unless role.nil?
          command.query['status'] = status unless status.nil?
          command.query['view'] = view unless view.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Marks a comment as not spam.
        # @param [String] blog_id
        #   The ID of the Blog.
        # @param [String] post_id
        #   The ID of the Post.
        # @param [String] comment_id
        #   The ID of the comment to mark as not spam.
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
        # @yieldparam result [Google::Apis::BloggerV3::Comment] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BloggerV3::Comment]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def approve_comment(blog_id, post_id, comment_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'blogs/{blogId}/posts/{postId}/comments/{commentId}/approve', options)
          command.response_representation = Google::Apis::BloggerV3::Comment::Representation
          command.response_class = Google::Apis::BloggerV3::Comment
          command.params['blogId'] = blog_id unless blog_id.nil?
          command.params['postId'] = post_id unless post_id.nil?
          command.params['commentId'] = comment_id unless comment_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Delete a comment by ID.
        # @param [String] blog_id
        #   The ID of the Blog.
        # @param [String] post_id
        #   The ID of the Post.
        # @param [String] comment_id
        #   The ID of the comment to delete.
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
        def delete_comment(blog_id, post_id, comment_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'blogs/{blogId}/posts/{postId}/comments/{commentId}', options)
          command.params['blogId'] = blog_id unless blog_id.nil?
          command.params['postId'] = post_id unless post_id.nil?
          command.params['commentId'] = comment_id unless comment_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one comment by ID.
        # @param [String] blog_id
        #   ID of the blog to containing the comment.
        # @param [String] post_id
        #   ID of the post to fetch posts from.
        # @param [String] comment_id
        #   The ID of the comment to get.
        # @param [String] view
        #   Access level for the requested comment (default: READER). Note that some
        #   comments will require elevated permissions, for example comments where the
        #   parent posts which is in a draft state, or comments that are pending
        #   moderation.
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
        # @yieldparam result [Google::Apis::BloggerV3::Comment] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BloggerV3::Comment]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_comment(blog_id, post_id, comment_id, view: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'blogs/{blogId}/posts/{postId}/comments/{commentId}', options)
          command.response_representation = Google::Apis::BloggerV3::Comment::Representation
          command.response_class = Google::Apis::BloggerV3::Comment
          command.params['blogId'] = blog_id unless blog_id.nil?
          command.params['postId'] = post_id unless post_id.nil?
          command.params['commentId'] = comment_id unless comment_id.nil?
          command.query['view'] = view unless view.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves the comments for a post, possibly filtered.
        # @param [String] blog_id
        #   ID of the blog to fetch comments from.
        # @param [String] post_id
        #   ID of the post to fetch posts from.
        # @param [DateTime] end_date
        #   Latest date of comment to fetch, a date-time with RFC 3339 formatting.
        # @param [Boolean] fetch_bodies
        #   Whether the body content of the comments is included.
        # @param [Fixnum] max_results
        #   Maximum number of comments to include in the result.
        # @param [String] page_token
        #   Continuation token if request is paged.
        # @param [DateTime] start_date
        #   Earliest date of comment to fetch, a date-time with RFC 3339 formatting.
        # @param [Array<String>, String] status
        # @param [String] view
        #   Access level with which to view the returned result. Note that some fields
        #   require elevated access.
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
        # @yieldparam result [Google::Apis::BloggerV3::CommentList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BloggerV3::CommentList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_comments(blog_id, post_id, end_date: nil, fetch_bodies: nil, max_results: nil, page_token: nil, start_date: nil, status: nil, view: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'blogs/{blogId}/posts/{postId}/comments', options)
          command.response_representation = Google::Apis::BloggerV3::CommentList::Representation
          command.response_class = Google::Apis::BloggerV3::CommentList
          command.params['blogId'] = blog_id unless blog_id.nil?
          command.params['postId'] = post_id unless post_id.nil?
          command.query['endDate'] = end_date unless end_date.nil?
          command.query['fetchBodies'] = fetch_bodies unless fetch_bodies.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['startDate'] = start_date unless start_date.nil?
          command.query['status'] = status unless status.nil?
          command.query['view'] = view unless view.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves the comments for a blog, across all posts, possibly filtered.
        # @param [String] blog_id
        #   ID of the blog to fetch comments from.
        # @param [DateTime] end_date
        #   Latest date of comment to fetch, a date-time with RFC 3339 formatting.
        # @param [Boolean] fetch_bodies
        #   Whether the body content of the comments is included.
        # @param [Fixnum] max_results
        #   Maximum number of comments to include in the result.
        # @param [String] page_token
        #   Continuation token if request is paged.
        # @param [DateTime] start_date
        #   Earliest date of comment to fetch, a date-time with RFC 3339 formatting.
        # @param [Array<String>, String] status
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
        # @yieldparam result [Google::Apis::BloggerV3::CommentList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BloggerV3::CommentList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_comments_by_blog(blog_id, end_date: nil, fetch_bodies: nil, max_results: nil, page_token: nil, start_date: nil, status: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'blogs/{blogId}/comments', options)
          command.response_representation = Google::Apis::BloggerV3::CommentList::Representation
          command.response_class = Google::Apis::BloggerV3::CommentList
          command.params['blogId'] = blog_id unless blog_id.nil?
          command.query['endDate'] = end_date unless end_date.nil?
          command.query['fetchBodies'] = fetch_bodies unless fetch_bodies.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['startDate'] = start_date unless start_date.nil?
          command.query['status'] = status unless status.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Marks a comment as spam.
        # @param [String] blog_id
        #   The ID of the Blog.
        # @param [String] post_id
        #   The ID of the Post.
        # @param [String] comment_id
        #   The ID of the comment to mark as spam.
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
        # @yieldparam result [Google::Apis::BloggerV3::Comment] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BloggerV3::Comment]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def mark_comment_as_spam(blog_id, post_id, comment_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'blogs/{blogId}/posts/{postId}/comments/{commentId}/spam', options)
          command.response_representation = Google::Apis::BloggerV3::Comment::Representation
          command.response_class = Google::Apis::BloggerV3::Comment
          command.params['blogId'] = blog_id unless blog_id.nil?
          command.params['postId'] = post_id unless post_id.nil?
          command.params['commentId'] = comment_id unless comment_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Removes the content of a comment.
        # @param [String] blog_id
        #   The ID of the Blog.
        # @param [String] post_id
        #   The ID of the Post.
        # @param [String] comment_id
        #   The ID of the comment to delete content from.
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
        # @yieldparam result [Google::Apis::BloggerV3::Comment] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BloggerV3::Comment]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def remove_comment_content(blog_id, post_id, comment_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'blogs/{blogId}/posts/{postId}/comments/{commentId}/removecontent', options)
          command.response_representation = Google::Apis::BloggerV3::Comment::Representation
          command.response_class = Google::Apis::BloggerV3::Comment
          command.params['blogId'] = blog_id unless blog_id.nil?
          command.params['postId'] = post_id unless post_id.nil?
          command.params['commentId'] = comment_id unless comment_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieve pageview stats for a Blog.
        # @param [String] blog_id
        #   The ID of the blog to get.
        # @param [Array<String>, String] range
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
        # @yieldparam result [Google::Apis::BloggerV3::Pageviews] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BloggerV3::Pageviews]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_page_view(blog_id, range: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'blogs/{blogId}/pageviews', options)
          command.response_representation = Google::Apis::BloggerV3::Pageviews::Representation
          command.response_class = Google::Apis::BloggerV3::Pageviews
          command.params['blogId'] = blog_id unless blog_id.nil?
          command.query['range'] = range unless range.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Delete a page by ID.
        # @param [String] blog_id
        #   The ID of the Blog.
        # @param [String] page_id
        #   The ID of the Page.
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
        def delete_page(blog_id, page_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'blogs/{blogId}/pages/{pageId}', options)
          command.params['blogId'] = blog_id unless blog_id.nil?
          command.params['pageId'] = page_id unless page_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one blog page by ID.
        # @param [String] blog_id
        #   ID of the blog containing the page.
        # @param [String] page_id
        #   The ID of the page to get.
        # @param [String] view
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
        # @yieldparam result [Google::Apis::BloggerV3::Page] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BloggerV3::Page]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_page(blog_id, page_id, view: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'blogs/{blogId}/pages/{pageId}', options)
          command.response_representation = Google::Apis::BloggerV3::Page::Representation
          command.response_class = Google::Apis::BloggerV3::Page
          command.params['blogId'] = blog_id unless blog_id.nil?
          command.params['pageId'] = page_id unless page_id.nil?
          command.query['view'] = view unless view.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Add a page.
        # @param [String] blog_id
        #   ID of the blog to add the page to.
        # @param [Google::Apis::BloggerV3::Page] page_object
        # @param [Boolean] is_draft
        #   Whether to create the page as a draft (default: false).
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
        # @yieldparam result [Google::Apis::BloggerV3::Page] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BloggerV3::Page]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_page(blog_id, page_object = nil, is_draft: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'blogs/{blogId}/pages', options)
          command.request_representation = Google::Apis::BloggerV3::Page::Representation
          command.request_object = page_object
          command.response_representation = Google::Apis::BloggerV3::Page::Representation
          command.response_class = Google::Apis::BloggerV3::Page
          command.params['blogId'] = blog_id unless blog_id.nil?
          command.query['isDraft'] = is_draft unless is_draft.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves the pages for a blog, optionally including non-LIVE statuses.
        # @param [String] blog_id
        #   ID of the blog to fetch Pages from.
        # @param [Boolean] fetch_bodies
        #   Whether to retrieve the Page bodies.
        # @param [Fixnum] max_results
        #   Maximum number of Pages to fetch.
        # @param [String] page_token
        #   Continuation token if the request is paged.
        # @param [Array<String>, String] status
        # @param [String] view
        #   Access level with which to view the returned result. Note that some fields
        #   require elevated access.
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
        # @yieldparam result [Google::Apis::BloggerV3::PageList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BloggerV3::PageList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_pages(blog_id, fetch_bodies: nil, max_results: nil, page_token: nil, status: nil, view: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'blogs/{blogId}/pages', options)
          command.response_representation = Google::Apis::BloggerV3::PageList::Representation
          command.response_class = Google::Apis::BloggerV3::PageList
          command.params['blogId'] = blog_id unless blog_id.nil?
          command.query['fetchBodies'] = fetch_bodies unless fetch_bodies.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['status'] = status unless status.nil?
          command.query['view'] = view unless view.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Update a page. This method supports patch semantics.
        # @param [String] blog_id
        #   The ID of the Blog.
        # @param [String] page_id
        #   The ID of the Page.
        # @param [Google::Apis::BloggerV3::Page] page_object
        # @param [Boolean] publish
        #   Whether a publish action should be performed when the page is updated (default:
        #   false).
        # @param [Boolean] revert
        #   Whether a revert action should be performed when the page is updated (default:
        #   false).
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
        # @yieldparam result [Google::Apis::BloggerV3::Page] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BloggerV3::Page]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_page(blog_id, page_id, page_object = nil, publish: nil, revert: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'blogs/{blogId}/pages/{pageId}', options)
          command.request_representation = Google::Apis::BloggerV3::Page::Representation
          command.request_object = page_object
          command.response_representation = Google::Apis::BloggerV3::Page::Representation
          command.response_class = Google::Apis::BloggerV3::Page
          command.params['blogId'] = blog_id unless blog_id.nil?
          command.params['pageId'] = page_id unless page_id.nil?
          command.query['publish'] = publish unless publish.nil?
          command.query['revert'] = revert unless revert.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Publishes a draft page.
        # @param [String] blog_id
        #   The ID of the blog.
        # @param [String] page_id
        #   The ID of the page.
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
        # @yieldparam result [Google::Apis::BloggerV3::Page] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BloggerV3::Page]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def publish_page(blog_id, page_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'blogs/{blogId}/pages/{pageId}/publish', options)
          command.response_representation = Google::Apis::BloggerV3::Page::Representation
          command.response_class = Google::Apis::BloggerV3::Page
          command.params['blogId'] = blog_id unless blog_id.nil?
          command.params['pageId'] = page_id unless page_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Revert a published or scheduled page to draft state.
        # @param [String] blog_id
        #   The ID of the blog.
        # @param [String] page_id
        #   The ID of the page.
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
        # @yieldparam result [Google::Apis::BloggerV3::Page] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BloggerV3::Page]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def revert_page(blog_id, page_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'blogs/{blogId}/pages/{pageId}/revert', options)
          command.response_representation = Google::Apis::BloggerV3::Page::Representation
          command.response_class = Google::Apis::BloggerV3::Page
          command.params['blogId'] = blog_id unless blog_id.nil?
          command.params['pageId'] = page_id unless page_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Update a page.
        # @param [String] blog_id
        #   The ID of the Blog.
        # @param [String] page_id
        #   The ID of the Page.
        # @param [Google::Apis::BloggerV3::Page] page_object
        # @param [Boolean] publish
        #   Whether a publish action should be performed when the page is updated (default:
        #   false).
        # @param [Boolean] revert
        #   Whether a revert action should be performed when the page is updated (default:
        #   false).
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
        # @yieldparam result [Google::Apis::BloggerV3::Page] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BloggerV3::Page]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_page(blog_id, page_id, page_object = nil, publish: nil, revert: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'blogs/{blogId}/pages/{pageId}', options)
          command.request_representation = Google::Apis::BloggerV3::Page::Representation
          command.request_object = page_object
          command.response_representation = Google::Apis::BloggerV3::Page::Representation
          command.response_class = Google::Apis::BloggerV3::Page
          command.params['blogId'] = blog_id unless blog_id.nil?
          command.params['pageId'] = page_id unless page_id.nil?
          command.query['publish'] = publish unless publish.nil?
          command.query['revert'] = revert unless revert.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one post and user info pair, by post ID and user ID. The post user info
        # contains per-user information about the post, such as access rights, specific
        # to the user.
        # @param [String] user_id
        #   ID of the user for the per-user information to be fetched. Either the word '
        #   self' or the user's profile identifier.
        # @param [String] blog_id
        #   The ID of the blog.
        # @param [String] post_id
        #   The ID of the post to get.
        # @param [Fixnum] max_comments
        #   Maximum number of comments to pull back on a post.
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
        # @yieldparam result [Google::Apis::BloggerV3::PostUserInfo] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BloggerV3::PostUserInfo]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_post_user_info(user_id, blog_id, post_id, max_comments: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'users/{userId}/blogs/{blogId}/posts/{postId}', options)
          command.response_representation = Google::Apis::BloggerV3::PostUserInfo::Representation
          command.response_class = Google::Apis::BloggerV3::PostUserInfo
          command.params['userId'] = user_id unless user_id.nil?
          command.params['blogId'] = blog_id unless blog_id.nil?
          command.params['postId'] = post_id unless post_id.nil?
          command.query['maxComments'] = max_comments unless max_comments.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of post and post user info pairs, possibly filtered. The post
        # user info contains per-user information about the post, such as access rights,
        # specific to the user.
        # @param [String] user_id
        #   ID of the user for the per-user information to be fetched. Either the word '
        #   self' or the user's profile identifier.
        # @param [String] blog_id
        #   ID of the blog to fetch posts from.
        # @param [DateTime] end_date
        #   Latest post date to fetch, a date-time with RFC 3339 formatting.
        # @param [Boolean] fetch_bodies
        #   Whether the body content of posts is included. Default is false.
        # @param [String] labels
        #   Comma-separated list of labels to search for.
        # @param [Fixnum] max_results
        #   Maximum number of posts to fetch.
        # @param [String] order_by
        #   Sort order applied to search results. Default is published.
        # @param [String] page_token
        #   Continuation token if the request is paged.
        # @param [DateTime] start_date
        #   Earliest post date to fetch, a date-time with RFC 3339 formatting.
        # @param [Array<String>, String] status
        # @param [String] view
        #   Access level with which to view the returned result. Note that some fields
        #   require elevated access.
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
        # @yieldparam result [Google::Apis::BloggerV3::PostUserInfosList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BloggerV3::PostUserInfosList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_post_user_info(user_id, blog_id, end_date: nil, fetch_bodies: nil, labels: nil, max_results: nil, order_by: nil, page_token: nil, start_date: nil, status: nil, view: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'users/{userId}/blogs/{blogId}/posts', options)
          command.response_representation = Google::Apis::BloggerV3::PostUserInfosList::Representation
          command.response_class = Google::Apis::BloggerV3::PostUserInfosList
          command.params['userId'] = user_id unless user_id.nil?
          command.params['blogId'] = blog_id unless blog_id.nil?
          command.query['endDate'] = end_date unless end_date.nil?
          command.query['fetchBodies'] = fetch_bodies unless fetch_bodies.nil?
          command.query['labels'] = labels unless labels.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['orderBy'] = order_by unless order_by.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['startDate'] = start_date unless start_date.nil?
          command.query['status'] = status unless status.nil?
          command.query['view'] = view unless view.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Delete a post by ID.
        # @param [String] blog_id
        #   The ID of the Blog.
        # @param [String] post_id
        #   The ID of the Post.
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
        def delete_post(blog_id, post_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'blogs/{blogId}/posts/{postId}', options)
          command.params['blogId'] = blog_id unless blog_id.nil?
          command.params['postId'] = post_id unless post_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Get a post by ID.
        # @param [String] blog_id
        #   ID of the blog to fetch the post from.
        # @param [String] post_id
        #   The ID of the post
        # @param [Boolean] fetch_body
        #   Whether the body content of the post is included (default: true). This should
        #   be set to false when the post bodies are not required, to help minimize
        #   traffic.
        # @param [Boolean] fetch_images
        #   Whether image URL metadata for each post is included (default: false).
        # @param [Fixnum] max_comments
        #   Maximum number of comments to pull back on a post.
        # @param [String] view
        #   Access level with which to view the returned result. Note that some fields
        #   require elevated access.
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
        # @yieldparam result [Google::Apis::BloggerV3::Post] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BloggerV3::Post]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_post(blog_id, post_id, fetch_body: nil, fetch_images: nil, max_comments: nil, view: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'blogs/{blogId}/posts/{postId}', options)
          command.response_representation = Google::Apis::BloggerV3::Post::Representation
          command.response_class = Google::Apis::BloggerV3::Post
          command.params['blogId'] = blog_id unless blog_id.nil?
          command.params['postId'] = post_id unless post_id.nil?
          command.query['fetchBody'] = fetch_body unless fetch_body.nil?
          command.query['fetchImages'] = fetch_images unless fetch_images.nil?
          command.query['maxComments'] = max_comments unless max_comments.nil?
          command.query['view'] = view unless view.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieve a Post by Path.
        # @param [String] blog_id
        #   ID of the blog to fetch the post from.
        # @param [String] path
        #   Path of the Post to retrieve.
        # @param [Fixnum] max_comments
        #   Maximum number of comments to pull back on a post.
        # @param [String] view
        #   Access level with which to view the returned result. Note that some fields
        #   require elevated access.
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
        # @yieldparam result [Google::Apis::BloggerV3::Post] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BloggerV3::Post]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_post_by_path(blog_id, path, max_comments: nil, view: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'blogs/{blogId}/posts/bypath', options)
          command.response_representation = Google::Apis::BloggerV3::Post::Representation
          command.response_class = Google::Apis::BloggerV3::Post
          command.params['blogId'] = blog_id unless blog_id.nil?
          command.query['maxComments'] = max_comments unless max_comments.nil?
          command.query['path'] = path unless path.nil?
          command.query['view'] = view unless view.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Add a post.
        # @param [String] blog_id
        #   ID of the blog to add the post to.
        # @param [Google::Apis::BloggerV3::Post] post_object
        # @param [Boolean] fetch_body
        #   Whether the body content of the post is included with the result (default:
        #   true).
        # @param [Boolean] fetch_images
        #   Whether image URL metadata for each post is included in the returned result (
        #   default: false).
        # @param [Boolean] is_draft
        #   Whether to create the post as a draft (default: false).
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
        # @yieldparam result [Google::Apis::BloggerV3::Post] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BloggerV3::Post]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_post(blog_id, post_object = nil, fetch_body: nil, fetch_images: nil, is_draft: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'blogs/{blogId}/posts', options)
          command.request_representation = Google::Apis::BloggerV3::Post::Representation
          command.request_object = post_object
          command.response_representation = Google::Apis::BloggerV3::Post::Representation
          command.response_class = Google::Apis::BloggerV3::Post
          command.params['blogId'] = blog_id unless blog_id.nil?
          command.query['fetchBody'] = fetch_body unless fetch_body.nil?
          command.query['fetchImages'] = fetch_images unless fetch_images.nil?
          command.query['isDraft'] = is_draft unless is_draft.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of posts, possibly filtered.
        # @param [String] blog_id
        #   ID of the blog to fetch posts from.
        # @param [DateTime] end_date
        #   Latest post date to fetch, a date-time with RFC 3339 formatting.
        # @param [Boolean] fetch_bodies
        #   Whether the body content of posts is included (default: true). This should be
        #   set to false when the post bodies are not required, to help minimize traffic.
        # @param [Boolean] fetch_images
        #   Whether image URL metadata for each post is included.
        # @param [String] labels
        #   Comma-separated list of labels to search for.
        # @param [Fixnum] max_results
        #   Maximum number of posts to fetch.
        # @param [String] order_by
        #   Sort search results
        # @param [String] page_token
        #   Continuation token if the request is paged.
        # @param [DateTime] start_date
        #   Earliest post date to fetch, a date-time with RFC 3339 formatting.
        # @param [Array<String>, String] status
        #   Statuses to include in the results.
        # @param [String] view
        #   Access level with which to view the returned result. Note that some fields
        #   require escalated access.
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
        # @yieldparam result [Google::Apis::BloggerV3::PostList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BloggerV3::PostList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_posts(blog_id, end_date: nil, fetch_bodies: nil, fetch_images: nil, labels: nil, max_results: nil, order_by: nil, page_token: nil, start_date: nil, status: nil, view: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'blogs/{blogId}/posts', options)
          command.response_representation = Google::Apis::BloggerV3::PostList::Representation
          command.response_class = Google::Apis::BloggerV3::PostList
          command.params['blogId'] = blog_id unless blog_id.nil?
          command.query['endDate'] = end_date unless end_date.nil?
          command.query['fetchBodies'] = fetch_bodies unless fetch_bodies.nil?
          command.query['fetchImages'] = fetch_images unless fetch_images.nil?
          command.query['labels'] = labels unless labels.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['orderBy'] = order_by unless order_by.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['startDate'] = start_date unless start_date.nil?
          command.query['status'] = status unless status.nil?
          command.query['view'] = view unless view.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Update a post. This method supports patch semantics.
        # @param [String] blog_id
        #   The ID of the Blog.
        # @param [String] post_id
        #   The ID of the Post.
        # @param [Google::Apis::BloggerV3::Post] post_object
        # @param [Boolean] fetch_body
        #   Whether the body content of the post is included with the result (default:
        #   true).
        # @param [Boolean] fetch_images
        #   Whether image URL metadata for each post is included in the returned result (
        #   default: false).
        # @param [Fixnum] max_comments
        #   Maximum number of comments to retrieve with the returned post.
        # @param [Boolean] publish
        #   Whether a publish action should be performed when the post is updated (default:
        #   false).
        # @param [Boolean] revert
        #   Whether a revert action should be performed when the post is updated (default:
        #   false).
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
        # @yieldparam result [Google::Apis::BloggerV3::Post] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BloggerV3::Post]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_post(blog_id, post_id, post_object = nil, fetch_body: nil, fetch_images: nil, max_comments: nil, publish: nil, revert: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'blogs/{blogId}/posts/{postId}', options)
          command.request_representation = Google::Apis::BloggerV3::Post::Representation
          command.request_object = post_object
          command.response_representation = Google::Apis::BloggerV3::Post::Representation
          command.response_class = Google::Apis::BloggerV3::Post
          command.params['blogId'] = blog_id unless blog_id.nil?
          command.params['postId'] = post_id unless post_id.nil?
          command.query['fetchBody'] = fetch_body unless fetch_body.nil?
          command.query['fetchImages'] = fetch_images unless fetch_images.nil?
          command.query['maxComments'] = max_comments unless max_comments.nil?
          command.query['publish'] = publish unless publish.nil?
          command.query['revert'] = revert unless revert.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Publishes a draft post, optionally at the specific time of the given
        # publishDate parameter.
        # @param [String] blog_id
        #   The ID of the Blog.
        # @param [String] post_id
        #   The ID of the Post.
        # @param [DateTime] publish_date
        #   Optional date and time to schedule the publishing of the Blog. If no
        #   publishDate parameter is given, the post is either published at the a
        #   previously saved schedule date (if present), or the current time. If a future
        #   date is given, the post will be scheduled to be published.
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
        # @yieldparam result [Google::Apis::BloggerV3::Post] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BloggerV3::Post]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def publish_post(blog_id, post_id, publish_date: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'blogs/{blogId}/posts/{postId}/publish', options)
          command.response_representation = Google::Apis::BloggerV3::Post::Representation
          command.response_class = Google::Apis::BloggerV3::Post
          command.params['blogId'] = blog_id unless blog_id.nil?
          command.params['postId'] = post_id unless post_id.nil?
          command.query['publishDate'] = publish_date unless publish_date.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Revert a published or scheduled post to draft state.
        # @param [String] blog_id
        #   The ID of the Blog.
        # @param [String] post_id
        #   The ID of the Post.
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
        # @yieldparam result [Google::Apis::BloggerV3::Post] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BloggerV3::Post]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def revert_post(blog_id, post_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'blogs/{blogId}/posts/{postId}/revert', options)
          command.response_representation = Google::Apis::BloggerV3::Post::Representation
          command.response_class = Google::Apis::BloggerV3::Post
          command.params['blogId'] = blog_id unless blog_id.nil?
          command.params['postId'] = post_id unless post_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Search for a post.
        # @param [String] blog_id
        #   ID of the blog to fetch the post from.
        # @param [String] q
        #   Query terms to search this blog for matching posts.
        # @param [Boolean] fetch_bodies
        #   Whether the body content of posts is included (default: true). This should be
        #   set to false when the post bodies are not required, to help minimize traffic.
        # @param [String] order_by
        #   Sort search results
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
        # @yieldparam result [Google::Apis::BloggerV3::PostList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BloggerV3::PostList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def search_posts(blog_id, q, fetch_bodies: nil, order_by: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'blogs/{blogId}/posts/search', options)
          command.response_representation = Google::Apis::BloggerV3::PostList::Representation
          command.response_class = Google::Apis::BloggerV3::PostList
          command.params['blogId'] = blog_id unless blog_id.nil?
          command.query['fetchBodies'] = fetch_bodies unless fetch_bodies.nil?
          command.query['orderBy'] = order_by unless order_by.nil?
          command.query['q'] = q unless q.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Update a post.
        # @param [String] blog_id
        #   The ID of the Blog.
        # @param [String] post_id
        #   The ID of the Post.
        # @param [Google::Apis::BloggerV3::Post] post_object
        # @param [Boolean] fetch_body
        #   Whether the body content of the post is included with the result (default:
        #   true).
        # @param [Boolean] fetch_images
        #   Whether image URL metadata for each post is included in the returned result (
        #   default: false).
        # @param [Fixnum] max_comments
        #   Maximum number of comments to retrieve with the returned post.
        # @param [Boolean] publish
        #   Whether a publish action should be performed when the post is updated (default:
        #   false).
        # @param [Boolean] revert
        #   Whether a revert action should be performed when the post is updated (default:
        #   false).
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
        # @yieldparam result [Google::Apis::BloggerV3::Post] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BloggerV3::Post]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_post(blog_id, post_id, post_object = nil, fetch_body: nil, fetch_images: nil, max_comments: nil, publish: nil, revert: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'blogs/{blogId}/posts/{postId}', options)
          command.request_representation = Google::Apis::BloggerV3::Post::Representation
          command.request_object = post_object
          command.response_representation = Google::Apis::BloggerV3::Post::Representation
          command.response_class = Google::Apis::BloggerV3::Post
          command.params['blogId'] = blog_id unless blog_id.nil?
          command.params['postId'] = post_id unless post_id.nil?
          command.query['fetchBody'] = fetch_body unless fetch_body.nil?
          command.query['fetchImages'] = fetch_images unless fetch_images.nil?
          command.query['maxComments'] = max_comments unless max_comments.nil?
          command.query['publish'] = publish unless publish.nil?
          command.query['revert'] = revert unless revert.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets one user by ID.
        # @param [String] user_id
        #   The ID of the user to get.
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
        # @yieldparam result [Google::Apis::BloggerV3::User] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BloggerV3::User]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_user(user_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'users/{userId}', options)
          command.response_representation = Google::Apis::BloggerV3::User::Representation
          command.response_class = Google::Apis::BloggerV3::User
          command.params['userId'] = user_id unless user_id.nil?
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
