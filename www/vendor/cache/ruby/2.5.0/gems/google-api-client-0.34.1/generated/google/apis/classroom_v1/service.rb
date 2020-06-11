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
    module ClassroomV1
      # Google Classroom API
      #
      # Manages classes, rosters, and invitations in Google Classroom.
      #
      # @example
      #    require 'google/apis/classroom_v1'
      #
      #    Classroom = Google::Apis::ClassroomV1 # Alias the module
      #    service = Classroom::ClassroomService.new
      #
      # @see https://developers.google.com/classroom/
      class ClassroomService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://classroom.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Creates a course.
        # The user specified in `ownerId` is the owner of the created course
        # and added as a teacher.
        # This method returns the following error codes:
        # * `PERMISSION_DENIED` if the requesting user is not permitted to create
        # courses or for access errors.
        # * `NOT_FOUND` if the primary teacher is not a valid user.
        # * `FAILED_PRECONDITION` if the course owner's account is disabled or for
        # the following request errors:
        # * UserGroupsMembershipLimitReached
        # * `ALREADY_EXISTS` if an alias was specified in the `id` and
        # already exists.
        # @param [Google::Apis::ClassroomV1::Course] course_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::Course] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::Course]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_course(course_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/courses', options)
          command.request_representation = Google::Apis::ClassroomV1::Course::Representation
          command.request_object = course_object
          command.response_representation = Google::Apis::ClassroomV1::Course::Representation
          command.response_class = Google::Apis::ClassroomV1::Course
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a course.
        # This method returns the following error codes:
        # * `PERMISSION_DENIED` if the requesting user is not permitted to delete the
        # requested course or for access errors.
        # * `NOT_FOUND` if no course exists with the requested ID.
        # @param [String] id
        #   Identifier of the course to delete.
        #   This identifier can be either the Classroom-assigned identifier or an
        #   alias.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_course(id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/courses/{id}', options)
          command.response_representation = Google::Apis::ClassroomV1::Empty::Representation
          command.response_class = Google::Apis::ClassroomV1::Empty
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a course.
        # This method returns the following error codes:
        # * `PERMISSION_DENIED` if the requesting user is not permitted to access the
        # requested course or for access errors.
        # * `NOT_FOUND` if no course exists with the requested ID.
        # @param [String] id
        #   Identifier of the course to return.
        #   This identifier can be either the Classroom-assigned identifier or an
        #   alias.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::Course] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::Course]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_course(id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/courses/{id}', options)
          command.response_representation = Google::Apis::ClassroomV1::Course::Representation
          command.response_class = Google::Apis::ClassroomV1::Course
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a list of courses that the requesting user is permitted to view,
        # restricted to those that match the request. Returned courses are ordered by
        # creation time, with the most recently created coming first.
        # This method returns the following error codes:
        # * `PERMISSION_DENIED` for access errors.
        # * `INVALID_ARGUMENT` if the query argument is malformed.
        # * `NOT_FOUND` if any users specified in the query arguments do not exist.
        # @param [Array<String>, String] course_states
        #   Restricts returned courses to those in one of the specified states
        #   The default value is ACTIVE, ARCHIVED, PROVISIONED, DECLINED.
        # @param [Fixnum] page_size
        #   Maximum number of items to return. Zero or unspecified indicates that the
        #   server may assign a maximum.
        #   The server may return fewer than the specified number of results.
        # @param [String] page_token
        #   nextPageToken
        #   value returned from a previous
        #   list call,
        #   indicating that the subsequent page of results should be returned.
        #   The list request must be
        #   otherwise identical to the one that resulted in this token.
        # @param [String] student_id
        #   Restricts returned courses to those having a student with the specified
        #   identifier. The identifier can be one of the following:
        #   * the numeric identifier for the user
        #   * the email address of the user
        #   * the string literal `"me"`, indicating the requesting user
        # @param [String] teacher_id
        #   Restricts returned courses to those having a teacher with the specified
        #   identifier. The identifier can be one of the following:
        #   * the numeric identifier for the user
        #   * the email address of the user
        #   * the string literal `"me"`, indicating the requesting user
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::ListCoursesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::ListCoursesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_courses(course_states: nil, page_size: nil, page_token: nil, student_id: nil, teacher_id: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/courses', options)
          command.response_representation = Google::Apis::ClassroomV1::ListCoursesResponse::Representation
          command.response_class = Google::Apis::ClassroomV1::ListCoursesResponse
          command.query['courseStates'] = course_states unless course_states.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['studentId'] = student_id unless student_id.nil?
          command.query['teacherId'] = teacher_id unless teacher_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates one or more fields in a course.
        # This method returns the following error codes:
        # * `PERMISSION_DENIED` if the requesting user is not permitted to modify the
        # requested course or for access errors.
        # * `NOT_FOUND` if no course exists with the requested ID.
        # * `INVALID_ARGUMENT` if invalid fields are specified in the update mask or
        # if no update mask is supplied.
        # * `FAILED_PRECONDITION` for the following request errors:
        # * CourseNotModifiable
        # @param [String] id
        #   Identifier of the course to update.
        #   This identifier can be either the Classroom-assigned identifier or an
        #   alias.
        # @param [Google::Apis::ClassroomV1::Course] course_object
        # @param [String] update_mask
        #   Mask that identifies which fields on the course to update.
        #   This field is required to do an update. The update will fail if invalid
        #   fields are specified. The following fields are valid:
        #   * `name`
        #   * `section`
        #   * `descriptionHeading`
        #   * `description`
        #   * `room`
        #   * `courseState`
        #   * `ownerId`
        #   Note: patches to ownerId are treated as being effective immediately, but in
        #   practice it may take some time for the ownership transfer of all affected
        #   resources to complete.
        #   When set in a query parameter, this field should be specified as
        #   `updateMask=<field1>,<field2>,...`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::Course] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::Course]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_course(id, course_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1/courses/{id}', options)
          command.request_representation = Google::Apis::ClassroomV1::Course::Representation
          command.request_object = course_object
          command.response_representation = Google::Apis::ClassroomV1::Course::Representation
          command.response_class = Google::Apis::ClassroomV1::Course
          command.params['id'] = id unless id.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a course.
        # This method returns the following error codes:
        # * `PERMISSION_DENIED` if the requesting user is not permitted to modify the
        # requested course or for access errors.
        # * `NOT_FOUND` if no course exists with the requested ID.
        # * `FAILED_PRECONDITION` for the following request errors:
        # * CourseNotModifiable
        # @param [String] id
        #   Identifier of the course to update.
        #   This identifier can be either the Classroom-assigned identifier or an
        #   alias.
        # @param [Google::Apis::ClassroomV1::Course] course_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::Course] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::Course]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_course(id, course_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:put, 'v1/courses/{id}', options)
          command.request_representation = Google::Apis::ClassroomV1::Course::Representation
          command.request_object = course_object
          command.response_representation = Google::Apis::ClassroomV1::Course::Representation
          command.response_class = Google::Apis::ClassroomV1::Course
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates an alias for a course.
        # This method returns the following error codes:
        # * `PERMISSION_DENIED` if the requesting user is not permitted to create the
        # alias or for access errors.
        # * `NOT_FOUND` if the course does not exist.
        # * `ALREADY_EXISTS` if the alias already exists.
        # * `FAILED_PRECONDITION` if the alias requested does not make sense for the
        # requesting user or course (for example, if a user not in a domain
        # attempts to access a domain-scoped alias).
        # @param [String] course_id
        #   Identifier of the course to alias.
        #   This identifier can be either the Classroom-assigned identifier or an
        #   alias.
        # @param [Google::Apis::ClassroomV1::CourseAlias] course_alias_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::CourseAlias] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::CourseAlias]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_course_alias(course_id, course_alias_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/courses/{courseId}/aliases', options)
          command.request_representation = Google::Apis::ClassroomV1::CourseAlias::Representation
          command.request_object = course_alias_object
          command.response_representation = Google::Apis::ClassroomV1::CourseAlias::Representation
          command.response_class = Google::Apis::ClassroomV1::CourseAlias
          command.params['courseId'] = course_id unless course_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes an alias of a course.
        # This method returns the following error codes:
        # * `PERMISSION_DENIED` if the requesting user is not permitted to remove the
        # alias or for access errors.
        # * `NOT_FOUND` if the alias does not exist.
        # * `FAILED_PRECONDITION` if the alias requested does not make sense for the
        # requesting user or course (for example, if a user not in a domain
        # attempts to delete a domain-scoped alias).
        # @param [String] course_id
        #   Identifier of the course whose alias should be deleted.
        #   This identifier can be either the Classroom-assigned identifier or an
        #   alias.
        # @param [String] alias_
        #   Alias to delete.
        #   This may not be the Classroom-assigned identifier.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_course_alias(course_id, alias_, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/courses/{courseId}/aliases/{alias}', options)
          command.response_representation = Google::Apis::ClassroomV1::Empty::Representation
          command.response_class = Google::Apis::ClassroomV1::Empty
          command.params['courseId'] = course_id unless course_id.nil?
          command.params['alias'] = alias_ unless alias_.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a list of aliases for a course.
        # This method returns the following error codes:
        # * `PERMISSION_DENIED` if the requesting user is not permitted to access the
        # course or for access errors.
        # * `NOT_FOUND` if the course does not exist.
        # @param [String] course_id
        #   The identifier of the course.
        #   This identifier can be either the Classroom-assigned identifier or an
        #   alias.
        # @param [Fixnum] page_size
        #   Maximum number of items to return. Zero or unspecified indicates that the
        #   server may assign a maximum.
        #   The server may return fewer than the specified number of results.
        # @param [String] page_token
        #   nextPageToken
        #   value returned from a previous
        #   list call,
        #   indicating that the subsequent page of results should be returned.
        #   The list request
        #   must be otherwise identical to the one that resulted in this token.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::ListCourseAliasesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::ListCourseAliasesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_course_aliases(course_id, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/courses/{courseId}/aliases', options)
          command.response_representation = Google::Apis::ClassroomV1::ListCourseAliasesResponse::Representation
          command.response_class = Google::Apis::ClassroomV1::ListCourseAliasesResponse
          command.params['courseId'] = course_id unless course_id.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates an announcement.
        # This method returns the following error codes:
        # * `PERMISSION_DENIED` if the requesting user is not permitted to access the
        # requested course, create announcements in the requested course, share a
        # Drive attachment, or for access errors.
        # * `INVALID_ARGUMENT` if the request is malformed.
        # * `NOT_FOUND` if the requested course does not exist.
        # * `FAILED_PRECONDITION` for the following request error:
        # * AttachmentNotVisible
        # @param [String] course_id
        #   Identifier of the course.
        #   This identifier can be either the Classroom-assigned identifier or an
        #   alias.
        # @param [Google::Apis::ClassroomV1::Announcement] announcement_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::Announcement] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::Announcement]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_course_announcement(course_id, announcement_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/courses/{courseId}/announcements', options)
          command.request_representation = Google::Apis::ClassroomV1::Announcement::Representation
          command.request_object = announcement_object
          command.response_representation = Google::Apis::ClassroomV1::Announcement::Representation
          command.response_class = Google::Apis::ClassroomV1::Announcement
          command.params['courseId'] = course_id unless course_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes an announcement.
        # This request must be made by the Developer Console project of the
        # [OAuth client ID](https://support.google.com/cloud/answer/6158849) used to
        # create the corresponding announcement item.
        # This method returns the following error codes:
        # * `PERMISSION_DENIED` if the requesting developer project did not create
        # the corresponding announcement, if the requesting user is not permitted
        # to delete the requested course or for access errors.
        # * `FAILED_PRECONDITION` if the requested announcement has already been
        # deleted.
        # * `NOT_FOUND` if no course exists with the requested ID.
        # @param [String] course_id
        #   Identifier of the course.
        #   This identifier can be either the Classroom-assigned identifier or an
        #   alias.
        # @param [String] id
        #   Identifier of the announcement to delete.
        #   This identifier is a Classroom-assigned identifier.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_course_announcement(course_id, id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/courses/{courseId}/announcements/{id}', options)
          command.response_representation = Google::Apis::ClassroomV1::Empty::Representation
          command.response_class = Google::Apis::ClassroomV1::Empty
          command.params['courseId'] = course_id unless course_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns an announcement.
        # This method returns the following error codes:
        # * `PERMISSION_DENIED` if the requesting user is not permitted to access the
        # requested course or announcement, or for access errors.
        # * `INVALID_ARGUMENT` if the request is malformed.
        # * `NOT_FOUND` if the requested course or announcement does not exist.
        # @param [String] course_id
        #   Identifier of the course.
        #   This identifier can be either the Classroom-assigned identifier or an
        #   alias.
        # @param [String] id
        #   Identifier of the announcement.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::Announcement] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::Announcement]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_course_announcement(course_id, id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/courses/{courseId}/announcements/{id}', options)
          command.response_representation = Google::Apis::ClassroomV1::Announcement::Representation
          command.response_class = Google::Apis::ClassroomV1::Announcement
          command.params['courseId'] = course_id unless course_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a list of announcements that the requester is permitted to view.
        # Course students may only view `PUBLISHED` announcements. Course teachers
        # and domain administrators may view all announcements.
        # This method returns the following error codes:
        # * `PERMISSION_DENIED` if the requesting user is not permitted to access
        # the requested course or for access errors.
        # * `INVALID_ARGUMENT` if the request is malformed.
        # * `NOT_FOUND` if the requested course does not exist.
        # @param [String] course_id
        #   Identifier of the course.
        #   This identifier can be either the Classroom-assigned identifier or an
        #   alias.
        # @param [Array<String>, String] announcement_states
        #   Restriction on the `state` of announcements returned.
        #   If this argument is left unspecified, the default value is `PUBLISHED`.
        # @param [String] order_by
        #   Optional sort ordering for results. A comma-separated list of fields with
        #   an optional sort direction keyword. Supported field is `updateTime`.
        #   Supported direction keywords are `asc` and `desc`.
        #   If not specified, `updateTime desc` is the default behavior.
        #   Examples: `updateTime asc`, `updateTime`
        # @param [Fixnum] page_size
        #   Maximum number of items to return. Zero or unspecified indicates that the
        #   server may assign a maximum.
        #   The server may return fewer than the specified number of results.
        # @param [String] page_token
        #   nextPageToken
        #   value returned from a previous
        #   list call,
        #   indicating that the subsequent page of results should be returned.
        #   The list request
        #   must be otherwise identical to the one that resulted in this token.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::ListAnnouncementsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::ListAnnouncementsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_course_announcements(course_id, announcement_states: nil, order_by: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/courses/{courseId}/announcements', options)
          command.response_representation = Google::Apis::ClassroomV1::ListAnnouncementsResponse::Representation
          command.response_class = Google::Apis::ClassroomV1::ListAnnouncementsResponse
          command.params['courseId'] = course_id unless course_id.nil?
          command.query['announcementStates'] = announcement_states unless announcement_states.nil?
          command.query['orderBy'] = order_by unless order_by.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Modifies assignee mode and options of an announcement.
        # Only a teacher of the course that contains the announcement may
        # call this method.
        # This method returns the following error codes:
        # * `PERMISSION_DENIED` if the requesting user is not permitted to access the
        # requested course or course work or for access errors.
        # * `INVALID_ARGUMENT` if the request is malformed.
        # * `NOT_FOUND` if the requested course or course work does not exist.
        # @param [String] course_id
        #   Identifier of the course.
        #   This identifier can be either the Classroom-assigned identifier or an
        #   alias.
        # @param [String] id
        #   Identifier of the announcement.
        # @param [Google::Apis::ClassroomV1::ModifyAnnouncementAssigneesRequest] modify_announcement_assignees_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::Announcement] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::Announcement]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def modify_course_announcement_assignees(course_id, id, modify_announcement_assignees_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/courses/{courseId}/announcements/{id}:modifyAssignees', options)
          command.request_representation = Google::Apis::ClassroomV1::ModifyAnnouncementAssigneesRequest::Representation
          command.request_object = modify_announcement_assignees_request_object
          command.response_representation = Google::Apis::ClassroomV1::Announcement::Representation
          command.response_class = Google::Apis::ClassroomV1::Announcement
          command.params['courseId'] = course_id unless course_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates one or more fields of an announcement.
        # This method returns the following error codes:
        # * `PERMISSION_DENIED` if the requesting developer project did not create
        # the corresponding announcement or for access errors.
        # * `INVALID_ARGUMENT` if the request is malformed.
        # * `FAILED_PRECONDITION` if the requested announcement has already been
        # deleted.
        # * `NOT_FOUND` if the requested course or announcement does not exist
        # @param [String] course_id
        #   Identifier of the course.
        #   This identifier can be either the Classroom-assigned identifier or an
        #   alias.
        # @param [String] id
        #   Identifier of the announcement.
        # @param [Google::Apis::ClassroomV1::Announcement] announcement_object
        # @param [String] update_mask
        #   Mask that identifies which fields on the announcement to update.
        #   This field is required to do an update. The update fails if invalid
        #   fields are specified. If a field supports empty values, it can be cleared
        #   by specifying it in the update mask and not in the Announcement object. If
        #   a field that does not support empty values is included in the update mask
        #   and not set in the Announcement object, an `INVALID_ARGUMENT` error will be
        #   returned.
        #   The following fields may be specified by teachers:
        #   * `text`
        #   * `state`
        #   * `scheduled_time`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::Announcement] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::Announcement]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_course_announcement(course_id, id, announcement_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1/courses/{courseId}/announcements/{id}', options)
          command.request_representation = Google::Apis::ClassroomV1::Announcement::Representation
          command.request_object = announcement_object
          command.response_representation = Google::Apis::ClassroomV1::Announcement::Representation
          command.response_class = Google::Apis::ClassroomV1::Announcement
          command.params['courseId'] = course_id unless course_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates course work.
        # The resulting course work (and corresponding student submissions) are
        # associated with the Developer Console project of the
        # [OAuth client ID](https://support.google.com/cloud/answer/6158849) used to
        # make the request. Classroom API requests to modify course work and student
        # submissions must be made with an OAuth client ID from the associated
        # Developer Console project.
        # This method returns the following error codes:
        # * `PERMISSION_DENIED` if the requesting user is not permitted to access the
        # requested course, create course work in the requested course, share a
        # Drive attachment, or for access errors.
        # * `INVALID_ARGUMENT` if the request is malformed.
        # * `NOT_FOUND` if the requested course does not exist.
        # * `FAILED_PRECONDITION` for the following request error:
        # * AttachmentNotVisible
        # @param [String] course_id
        #   Identifier of the course.
        #   This identifier can be either the Classroom-assigned identifier or an
        #   alias.
        # @param [Google::Apis::ClassroomV1::CourseWork] course_work_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::CourseWork] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::CourseWork]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_course_work(course_id, course_work_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/courses/{courseId}/courseWork', options)
          command.request_representation = Google::Apis::ClassroomV1::CourseWork::Representation
          command.request_object = course_work_object
          command.response_representation = Google::Apis::ClassroomV1::CourseWork::Representation
          command.response_class = Google::Apis::ClassroomV1::CourseWork
          command.params['courseId'] = course_id unless course_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a course work.
        # This request must be made by the Developer Console project of the
        # [OAuth client ID](https://support.google.com/cloud/answer/6158849) used to
        # create the corresponding course work item.
        # This method returns the following error codes:
        # * `PERMISSION_DENIED` if the requesting developer project did not create
        # the corresponding course work, if the requesting user is not permitted
        # to delete the requested course or for access errors.
        # * `FAILED_PRECONDITION` if the requested course work has already been
        # deleted.
        # * `NOT_FOUND` if no course exists with the requested ID.
        # @param [String] course_id
        #   Identifier of the course.
        #   This identifier can be either the Classroom-assigned identifier or an
        #   alias.
        # @param [String] id
        #   Identifier of the course work to delete.
        #   This identifier is a Classroom-assigned identifier.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_course_course_work(course_id, id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/courses/{courseId}/courseWork/{id}', options)
          command.response_representation = Google::Apis::ClassroomV1::Empty::Representation
          command.response_class = Google::Apis::ClassroomV1::Empty
          command.params['courseId'] = course_id unless course_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns course work.
        # This method returns the following error codes:
        # * `PERMISSION_DENIED` if the requesting user is not permitted to access the
        # requested course or course work, or for access errors.
        # * `INVALID_ARGUMENT` if the request is malformed.
        # * `NOT_FOUND` if the requested course or course work does not exist.
        # @param [String] course_id
        #   Identifier of the course.
        #   This identifier can be either the Classroom-assigned identifier or an
        #   alias.
        # @param [String] id
        #   Identifier of the course work.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::CourseWork] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::CourseWork]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_course_work(course_id, id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/courses/{courseId}/courseWork/{id}', options)
          command.response_representation = Google::Apis::ClassroomV1::CourseWork::Representation
          command.response_class = Google::Apis::ClassroomV1::CourseWork
          command.params['courseId'] = course_id unless course_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a list of course work that the requester is permitted to view.
        # Course students may only view `PUBLISHED` course work. Course teachers
        # and domain administrators may view all course work.
        # This method returns the following error codes:
        # * `PERMISSION_DENIED` if the requesting user is not permitted to access
        # the requested course or for access errors.
        # * `INVALID_ARGUMENT` if the request is malformed.
        # * `NOT_FOUND` if the requested course does not exist.
        # @param [String] course_id
        #   Identifier of the course.
        #   This identifier can be either the Classroom-assigned identifier or an
        #   alias.
        # @param [Array<String>, String] course_work_states
        #   Restriction on the work status to return. Only courseWork that matches
        #   is returned. If unspecified, items with a work status of `PUBLISHED`
        #   is returned.
        # @param [String] order_by
        #   Optional sort ordering for results. A comma-separated list of fields with
        #   an optional sort direction keyword. Supported fields are `updateTime`
        #   and `dueDate`. Supported direction keywords are `asc` and `desc`.
        #   If not specified, `updateTime desc` is the default behavior.
        #   Examples: `dueDate asc,updateTime desc`, `updateTime,dueDate desc`
        # @param [Fixnum] page_size
        #   Maximum number of items to return. Zero or unspecified indicates that the
        #   server may assign a maximum.
        #   The server may return fewer than the specified number of results.
        # @param [String] page_token
        #   nextPageToken
        #   value returned from a previous
        #   list call,
        #   indicating that the subsequent page of results should be returned.
        #   The list request
        #   must be otherwise identical to the one that resulted in this token.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::ListCourseWorkResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::ListCourseWorkResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_course_works(course_id, course_work_states: nil, order_by: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/courses/{courseId}/courseWork', options)
          command.response_representation = Google::Apis::ClassroomV1::ListCourseWorkResponse::Representation
          command.response_class = Google::Apis::ClassroomV1::ListCourseWorkResponse
          command.params['courseId'] = course_id unless course_id.nil?
          command.query['courseWorkStates'] = course_work_states unless course_work_states.nil?
          command.query['orderBy'] = order_by unless order_by.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Modifies assignee mode and options of a coursework.
        # Only a teacher of the course that contains the coursework may
        # call this method.
        # This method returns the following error codes:
        # * `PERMISSION_DENIED` if the requesting user is not permitted to access the
        # requested course or course work or for access errors.
        # * `INVALID_ARGUMENT` if the request is malformed.
        # * `NOT_FOUND` if the requested course or course work does not exist.
        # @param [String] course_id
        #   Identifier of the course.
        #   This identifier can be either the Classroom-assigned identifier or an
        #   alias.
        # @param [String] id
        #   Identifier of the coursework.
        # @param [Google::Apis::ClassroomV1::ModifyCourseWorkAssigneesRequest] modify_course_work_assignees_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::CourseWork] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::CourseWork]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def modify_course_course_work_assignees(course_id, id, modify_course_work_assignees_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/courses/{courseId}/courseWork/{id}:modifyAssignees', options)
          command.request_representation = Google::Apis::ClassroomV1::ModifyCourseWorkAssigneesRequest::Representation
          command.request_object = modify_course_work_assignees_request_object
          command.response_representation = Google::Apis::ClassroomV1::CourseWork::Representation
          command.response_class = Google::Apis::ClassroomV1::CourseWork
          command.params['courseId'] = course_id unless course_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates one or more fields of a course work.
        # See google.classroom.v1.CourseWork for details
        # of which fields may be updated and who may change them.
        # This request must be made by the Developer Console project of the
        # [OAuth client ID](https://support.google.com/cloud/answer/6158849) used to
        # create the corresponding course work item.
        # This method returns the following error codes:
        # * `PERMISSION_DENIED` if the requesting developer project did not create
        # the corresponding course work, if the user is not permitted to make the
        # requested modification to the student submission, or for
        # access errors.
        # * `INVALID_ARGUMENT` if the request is malformed.
        # * `FAILED_PRECONDITION` if the requested course work has already been
        # deleted.
        # * `NOT_FOUND` if the requested course, course work, or student submission
        # does not exist.
        # @param [String] course_id
        #   Identifier of the course.
        #   This identifier can be either the Classroom-assigned identifier or an
        #   alias.
        # @param [String] id
        #   Identifier of the course work.
        # @param [Google::Apis::ClassroomV1::CourseWork] course_work_object
        # @param [String] update_mask
        #   Mask that identifies which fields on the course work to update.
        #   This field is required to do an update. The update fails if invalid
        #   fields are specified. If a field supports empty values, it can be cleared
        #   by specifying it in the update mask and not in the CourseWork object. If a
        #   field that does not support empty values is included in the update mask and
        #   not set in the CourseWork object, an `INVALID_ARGUMENT` error will be
        #   returned.
        #   The following fields may be specified by teachers:
        #   * `title`
        #   * `description`
        #   * `state`
        #   * `due_date`
        #   * `due_time`
        #   * `max_points`
        #   * `scheduled_time`
        #   * `submission_modification_mode`
        #   * `topic_id`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::CourseWork] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::CourseWork]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_course_course_work(course_id, id, course_work_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1/courses/{courseId}/courseWork/{id}', options)
          command.request_representation = Google::Apis::ClassroomV1::CourseWork::Representation
          command.request_object = course_work_object
          command.response_representation = Google::Apis::ClassroomV1::CourseWork::Representation
          command.response_class = Google::Apis::ClassroomV1::CourseWork
          command.params['courseId'] = course_id unless course_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a student submission.
        # * `PERMISSION_DENIED` if the requesting user is not permitted to access the
        # requested course, course work, or student submission or for
        # access errors.
        # * `INVALID_ARGUMENT` if the request is malformed.
        # * `NOT_FOUND` if the requested course, course work, or student submission
        # does not exist.
        # @param [String] course_id
        #   Identifier of the course.
        #   This identifier can be either the Classroom-assigned identifier or an
        #   alias.
        # @param [String] course_work_id
        #   Identifier of the course work.
        # @param [String] id
        #   Identifier of the student submission.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::StudentSubmission] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::StudentSubmission]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_student_submission(course_id, course_work_id, id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/courses/{courseId}/courseWork/{courseWorkId}/studentSubmissions/{id}', options)
          command.response_representation = Google::Apis::ClassroomV1::StudentSubmission::Representation
          command.response_class = Google::Apis::ClassroomV1::StudentSubmission
          command.params['courseId'] = course_id unless course_id.nil?
          command.params['courseWorkId'] = course_work_id unless course_work_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a list of student submissions that the requester is permitted to
        # view, factoring in the OAuth scopes of the request.
        # `-` may be specified as the `course_work_id` to include student
        # submissions for multiple course work items.
        # Course students may only view their own work. Course teachers
        # and domain administrators may view all student submissions.
        # This method returns the following error codes:
        # * `PERMISSION_DENIED` if the requesting user is not permitted to access the
        # requested course or course work, or for access errors.
        # * `INVALID_ARGUMENT` if the request is malformed.
        # * `NOT_FOUND` if the requested course does not exist.
        # @param [String] course_id
        #   Identifier of the course.
        #   This identifier can be either the Classroom-assigned identifier or an
        #   alias.
        # @param [String] course_work_id
        #   Identifier of the student work to request.
        #   This may be set to the string literal `"-"` to request student work for
        #   all course work in the specified course.
        # @param [String] late
        #   Requested lateness value. If specified, returned student submissions are
        #   restricted by the requested value.
        #   If unspecified, submissions are returned regardless of `late` value.
        # @param [Fixnum] page_size
        #   Maximum number of items to return. Zero or unspecified indicates that the
        #   server may assign a maximum.
        #   The server may return fewer than the specified number of results.
        # @param [String] page_token
        #   nextPageToken
        #   value returned from a previous
        #   list call,
        #   indicating that the subsequent page of results should be returned.
        #   The list request
        #   must be otherwise identical to the one that resulted in this token.
        # @param [Array<String>, String] states
        #   Requested submission states. If specified, returned student submissions
        #   match one of the specified submission states.
        # @param [String] user_id
        #   Optional argument to restrict returned student work to those owned by the
        #   student with the specified identifier. The identifier can be one of the
        #   following:
        #   * the numeric identifier for the user
        #   * the email address of the user
        #   * the string literal `"me"`, indicating the requesting user
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::ListStudentSubmissionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::ListStudentSubmissionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_student_submissions(course_id, course_work_id, late: nil, page_size: nil, page_token: nil, states: nil, user_id: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/courses/{courseId}/courseWork/{courseWorkId}/studentSubmissions', options)
          command.response_representation = Google::Apis::ClassroomV1::ListStudentSubmissionsResponse::Representation
          command.response_class = Google::Apis::ClassroomV1::ListStudentSubmissionsResponse
          command.params['courseId'] = course_id unless course_id.nil?
          command.params['courseWorkId'] = course_work_id unless course_work_id.nil?
          command.query['late'] = late unless late.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['states'] = states unless states.nil?
          command.query['userId'] = user_id unless user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Modifies attachments of student submission.
        # Attachments may only be added to student submissions belonging to course
        # work objects with a `workType` of `ASSIGNMENT`.
        # This request must be made by the Developer Console project of the
        # [OAuth client ID](https://support.google.com/cloud/answer/6158849) used to
        # create the corresponding course work item.
        # This method returns the following error codes:
        # * `PERMISSION_DENIED` if the requesting user is not permitted to access the
        # requested course or course work, if the user is not permitted to modify
        # attachments on the requested student submission, or for
        # access errors.
        # * `INVALID_ARGUMENT` if the request is malformed.
        # * `NOT_FOUND` if the requested course, course work, or student submission
        # does not exist.
        # @param [String] course_id
        #   Identifier of the course.
        #   This identifier can be either the Classroom-assigned identifier or an
        #   alias.
        # @param [String] course_work_id
        #   Identifier of the course work.
        # @param [String] id
        #   Identifier of the student submission.
        # @param [Google::Apis::ClassroomV1::ModifyAttachmentsRequest] modify_attachments_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::StudentSubmission] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::StudentSubmission]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def modify_student_submission_attachments(course_id, course_work_id, id, modify_attachments_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/courses/{courseId}/courseWork/{courseWorkId}/studentSubmissions/{id}:modifyAttachments', options)
          command.request_representation = Google::Apis::ClassroomV1::ModifyAttachmentsRequest::Representation
          command.request_object = modify_attachments_request_object
          command.response_representation = Google::Apis::ClassroomV1::StudentSubmission::Representation
          command.response_class = Google::Apis::ClassroomV1::StudentSubmission
          command.params['courseId'] = course_id unless course_id.nil?
          command.params['courseWorkId'] = course_work_id unless course_work_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates one or more fields of a student submission.
        # See google.classroom.v1.StudentSubmission for details
        # of which fields may be updated and who may change them.
        # This request must be made by the Developer Console project of the
        # [OAuth client ID](https://support.google.com/cloud/answer/6158849) used to
        # create the corresponding course work item.
        # This method returns the following error codes:
        # * `PERMISSION_DENIED` if the requesting developer project did not create
        # the corresponding course work, if the user is not permitted to make the
        # requested modification to the student submission, or for
        # access errors.
        # * `INVALID_ARGUMENT` if the request is malformed.
        # * `NOT_FOUND` if the requested course, course work, or student submission
        # does not exist.
        # @param [String] course_id
        #   Identifier of the course.
        #   This identifier can be either the Classroom-assigned identifier or an
        #   alias.
        # @param [String] course_work_id
        #   Identifier of the course work.
        # @param [String] id
        #   Identifier of the student submission.
        # @param [Google::Apis::ClassroomV1::StudentSubmission] student_submission_object
        # @param [String] update_mask
        #   Mask that identifies which fields on the student submission to update.
        #   This field is required to do an update. The update fails if invalid
        #   fields are specified.
        #   The following fields may be specified by teachers:
        #   * `draft_grade`
        #   * `assigned_grade`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::StudentSubmission] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::StudentSubmission]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_student_submission(course_id, course_work_id, id, student_submission_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1/courses/{courseId}/courseWork/{courseWorkId}/studentSubmissions/{id}', options)
          command.request_representation = Google::Apis::ClassroomV1::StudentSubmission::Representation
          command.request_object = student_submission_object
          command.response_representation = Google::Apis::ClassroomV1::StudentSubmission::Representation
          command.response_class = Google::Apis::ClassroomV1::StudentSubmission
          command.params['courseId'] = course_id unless course_id.nil?
          command.params['courseWorkId'] = course_work_id unless course_work_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Reclaims a student submission on behalf of the student that owns it.
        # Reclaiming a student submission transfers ownership of attached Drive
        # files to the student and updates the submission state.
        # Only the student that owns the requested student submission may call this
        # method, and only for a student submission that has been turned in.
        # This request must be made by the Developer Console project of the
        # [OAuth client ID](https://support.google.com/cloud/answer/6158849) used to
        # create the corresponding course work item.
        # This method returns the following error codes:
        # * `PERMISSION_DENIED` if the requesting user is not permitted to access the
        # requested course or course work, unsubmit the requested student submission,
        # or for access errors.
        # * `FAILED_PRECONDITION` if the student submission has not been turned in.
        # * `INVALID_ARGUMENT` if the request is malformed.
        # * `NOT_FOUND` if the requested course, course work, or student submission
        # does not exist.
        # @param [String] course_id
        #   Identifier of the course.
        #   This identifier can be either the Classroom-assigned identifier or an
        #   alias.
        # @param [String] course_work_id
        #   Identifier of the course work.
        # @param [String] id
        #   Identifier of the student submission.
        # @param [Google::Apis::ClassroomV1::ReclaimStudentSubmissionRequest] reclaim_student_submission_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def reclaim_student_submission(course_id, course_work_id, id, reclaim_student_submission_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/courses/{courseId}/courseWork/{courseWorkId}/studentSubmissions/{id}:reclaim', options)
          command.request_representation = Google::Apis::ClassroomV1::ReclaimStudentSubmissionRequest::Representation
          command.request_object = reclaim_student_submission_request_object
          command.response_representation = Google::Apis::ClassroomV1::Empty::Representation
          command.response_class = Google::Apis::ClassroomV1::Empty
          command.params['courseId'] = course_id unless course_id.nil?
          command.params['courseWorkId'] = course_work_id unless course_work_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a student submission.
        # Returning a student submission transfers ownership of attached Drive
        # files to the student and may also update the submission state.
        # Unlike the Classroom application, returning a student submission does not
        # set assignedGrade to the draftGrade value.
        # Only a teacher of the course that contains the requested student submission
        # may call this method.
        # This request must be made by the Developer Console project of the
        # [OAuth client ID](https://support.google.com/cloud/answer/6158849) used to
        # create the corresponding course work item.
        # This method returns the following error codes:
        # * `PERMISSION_DENIED` if the requesting user is not permitted to access the
        # requested course or course work, return the requested student submission,
        # or for access errors.
        # * `INVALID_ARGUMENT` if the request is malformed.
        # * `NOT_FOUND` if the requested course, course work, or student submission
        # does not exist.
        # @param [String] course_id
        #   Identifier of the course.
        #   This identifier can be either the Classroom-assigned identifier or an
        #   alias.
        # @param [String] course_work_id
        #   Identifier of the course work.
        # @param [String] id
        #   Identifier of the student submission.
        # @param [Google::Apis::ClassroomV1::ReturnStudentSubmissionRequest] return_student_submission_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def return_student_submission(course_id, course_work_id, id, return_student_submission_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/courses/{courseId}/courseWork/{courseWorkId}/studentSubmissions/{id}:return', options)
          command.request_representation = Google::Apis::ClassroomV1::ReturnStudentSubmissionRequest::Representation
          command.request_object = return_student_submission_request_object
          command.response_representation = Google::Apis::ClassroomV1::Empty::Representation
          command.response_class = Google::Apis::ClassroomV1::Empty
          command.params['courseId'] = course_id unless course_id.nil?
          command.params['courseWorkId'] = course_work_id unless course_work_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Turns in a student submission.
        # Turning in a student submission transfers ownership of attached Drive
        # files to the teacher and may also update the submission state.
        # This may only be called by the student that owns the specified student
        # submission.
        # This request must be made by the Developer Console project of the
        # [OAuth client ID](https://support.google.com/cloud/answer/6158849) used to
        # create the corresponding course work item.
        # This method returns the following error codes:
        # * `PERMISSION_DENIED` if the requesting user is not permitted to access the
        # requested course or course work, turn in the requested student submission,
        # or for access errors.
        # * `INVALID_ARGUMENT` if the request is malformed.
        # * `NOT_FOUND` if the requested course, course work, or student submission
        # does not exist.
        # @param [String] course_id
        #   Identifier of the course.
        #   This identifier can be either the Classroom-assigned identifier or an
        #   alias.
        # @param [String] course_work_id
        #   Identifier of the course work.
        # @param [String] id
        #   Identifier of the student submission.
        # @param [Google::Apis::ClassroomV1::TurnInStudentSubmissionRequest] turn_in_student_submission_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def turn_in_student_submission(course_id, course_work_id, id, turn_in_student_submission_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/courses/{courseId}/courseWork/{courseWorkId}/studentSubmissions/{id}:turnIn', options)
          command.request_representation = Google::Apis::ClassroomV1::TurnInStudentSubmissionRequest::Representation
          command.request_object = turn_in_student_submission_request_object
          command.response_representation = Google::Apis::ClassroomV1::Empty::Representation
          command.response_class = Google::Apis::ClassroomV1::Empty
          command.params['courseId'] = course_id unless course_id.nil?
          command.params['courseWorkId'] = course_work_id unless course_work_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Adds a user as a student of a course.
        # This method returns the following error codes:
        # * `PERMISSION_DENIED` if the requesting user is not permitted to create
        # students in this course or for access errors.
        # * `NOT_FOUND` if the requested course ID does not exist.
        # * `FAILED_PRECONDITION` if the requested user's account is disabled,
        # for the following request errors:
        # * CourseMemberLimitReached
        # * CourseNotModifiable
        # * UserGroupsMembershipLimitReached
        # * `ALREADY_EXISTS` if the user is already a student or teacher in the
        # course.
        # @param [String] course_id
        #   Identifier of the course to create the student in.
        #   This identifier can be either the Classroom-assigned identifier or an
        #   alias.
        # @param [Google::Apis::ClassroomV1::Student] student_object
        # @param [String] enrollment_code
        #   Enrollment code of the course to create the student in.
        #   This code is required if userId
        #   corresponds to the requesting user; it may be omitted if the requesting
        #   user has administrative permissions to create students for any user.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::Student] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::Student]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_course_student(course_id, student_object = nil, enrollment_code: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/courses/{courseId}/students', options)
          command.request_representation = Google::Apis::ClassroomV1::Student::Representation
          command.request_object = student_object
          command.response_representation = Google::Apis::ClassroomV1::Student::Representation
          command.response_class = Google::Apis::ClassroomV1::Student
          command.params['courseId'] = course_id unless course_id.nil?
          command.query['enrollmentCode'] = enrollment_code unless enrollment_code.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a student of a course.
        # This method returns the following error codes:
        # * `PERMISSION_DENIED` if the requesting user is not permitted to delete
        # students of this course or for access errors.
        # * `NOT_FOUND` if no student of this course has the requested ID or if the
        # course does not exist.
        # @param [String] course_id
        #   Identifier of the course.
        #   This identifier can be either the Classroom-assigned identifier or an
        #   alias.
        # @param [String] user_id
        #   Identifier of the student to delete. The identifier can be one of the
        #   following:
        #   * the numeric identifier for the user
        #   * the email address of the user
        #   * the string literal `"me"`, indicating the requesting user
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_course_student(course_id, user_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/courses/{courseId}/students/{userId}', options)
          command.response_representation = Google::Apis::ClassroomV1::Empty::Representation
          command.response_class = Google::Apis::ClassroomV1::Empty
          command.params['courseId'] = course_id unless course_id.nil?
          command.params['userId'] = user_id unless user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a student of a course.
        # This method returns the following error codes:
        # * `PERMISSION_DENIED` if the requesting user is not permitted to view
        # students of this course or for access errors.
        # * `NOT_FOUND` if no student of this course has the requested ID or if the
        # course does not exist.
        # @param [String] course_id
        #   Identifier of the course.
        #   This identifier can be either the Classroom-assigned identifier or an
        #   alias.
        # @param [String] user_id
        #   Identifier of the student to return. The identifier can be one of the
        #   following:
        #   * the numeric identifier for the user
        #   * the email address of the user
        #   * the string literal `"me"`, indicating the requesting user
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::Student] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::Student]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_course_student(course_id, user_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/courses/{courseId}/students/{userId}', options)
          command.response_representation = Google::Apis::ClassroomV1::Student::Representation
          command.response_class = Google::Apis::ClassroomV1::Student
          command.params['courseId'] = course_id unless course_id.nil?
          command.params['userId'] = user_id unless user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a list of students of this course that the requester
        # is permitted to view.
        # This method returns the following error codes:
        # * `NOT_FOUND` if the course does not exist.
        # * `PERMISSION_DENIED` for access errors.
        # @param [String] course_id
        #   Identifier of the course.
        #   This identifier can be either the Classroom-assigned identifier or an
        #   alias.
        # @param [Fixnum] page_size
        #   Maximum number of items to return. Zero means no maximum.
        #   The server may return fewer than the specified number of results.
        # @param [String] page_token
        #   nextPageToken
        #   value returned from a previous
        #   list call, indicating that
        #   the subsequent page of results should be returned.
        #   The list request must be
        #   otherwise identical to the one that resulted in this token.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::ListStudentsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::ListStudentsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_course_students(course_id, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/courses/{courseId}/students', options)
          command.response_representation = Google::Apis::ClassroomV1::ListStudentsResponse::Representation
          command.response_class = Google::Apis::ClassroomV1::ListStudentsResponse
          command.params['courseId'] = course_id unless course_id.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a teacher of a course.
        # This method returns the following error codes:
        # * `PERMISSION_DENIED` if the requesting user is not  permitted to create
        # teachers in this course or for access errors.
        # * `NOT_FOUND` if the requested course ID does not exist.
        # * `FAILED_PRECONDITION` if the requested user's account is disabled,
        # for the following request errors:
        # * CourseMemberLimitReached
        # * CourseNotModifiable
        # * CourseTeacherLimitReached
        # * UserGroupsMembershipLimitReached
        # * `ALREADY_EXISTS` if the user is already a teacher or student in the
        # course.
        # @param [String] course_id
        #   Identifier of the course.
        #   This identifier can be either the Classroom-assigned identifier or an
        #   alias.
        # @param [Google::Apis::ClassroomV1::Teacher] teacher_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::Teacher] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::Teacher]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_course_teacher(course_id, teacher_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/courses/{courseId}/teachers', options)
          command.request_representation = Google::Apis::ClassroomV1::Teacher::Representation
          command.request_object = teacher_object
          command.response_representation = Google::Apis::ClassroomV1::Teacher::Representation
          command.response_class = Google::Apis::ClassroomV1::Teacher
          command.params['courseId'] = course_id unless course_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a teacher of a course.
        # This method returns the following error codes:
        # * `PERMISSION_DENIED` if the requesting user is not permitted to delete
        # teachers of this course or for access errors.
        # * `NOT_FOUND` if no teacher of this course has the requested ID or if the
        # course does not exist.
        # * `FAILED_PRECONDITION` if the requested ID belongs to the primary teacher
        # of this course.
        # @param [String] course_id
        #   Identifier of the course.
        #   This identifier can be either the Classroom-assigned identifier or an
        #   alias.
        # @param [String] user_id
        #   Identifier of the teacher to delete. The identifier can be one of the
        #   following:
        #   * the numeric identifier for the user
        #   * the email address of the user
        #   * the string literal `"me"`, indicating the requesting user
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_course_teacher(course_id, user_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/courses/{courseId}/teachers/{userId}', options)
          command.response_representation = Google::Apis::ClassroomV1::Empty::Representation
          command.response_class = Google::Apis::ClassroomV1::Empty
          command.params['courseId'] = course_id unless course_id.nil?
          command.params['userId'] = user_id unless user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a teacher of a course.
        # This method returns the following error codes:
        # * `PERMISSION_DENIED` if the requesting user is not permitted to view
        # teachers of this course or for access errors.
        # * `NOT_FOUND` if no teacher of this course has the requested ID or if the
        # course does not exist.
        # @param [String] course_id
        #   Identifier of the course.
        #   This identifier can be either the Classroom-assigned identifier or an
        #   alias.
        # @param [String] user_id
        #   Identifier of the teacher to return. The identifier can be one of the
        #   following:
        #   * the numeric identifier for the user
        #   * the email address of the user
        #   * the string literal `"me"`, indicating the requesting user
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::Teacher] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::Teacher]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_course_teacher(course_id, user_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/courses/{courseId}/teachers/{userId}', options)
          command.response_representation = Google::Apis::ClassroomV1::Teacher::Representation
          command.response_class = Google::Apis::ClassroomV1::Teacher
          command.params['courseId'] = course_id unless course_id.nil?
          command.params['userId'] = user_id unless user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a list of teachers of this course that the requester
        # is permitted to view.
        # This method returns the following error codes:
        # * `NOT_FOUND` if the course does not exist.
        # * `PERMISSION_DENIED` for access errors.
        # @param [String] course_id
        #   Identifier of the course.
        #   This identifier can be either the Classroom-assigned identifier or an
        #   alias.
        # @param [Fixnum] page_size
        #   Maximum number of items to return. Zero means no maximum.
        #   The server may return fewer than the specified number of results.
        # @param [String] page_token
        #   nextPageToken
        #   value returned from a previous
        #   list call, indicating that
        #   the subsequent page of results should be returned.
        #   The list request must be
        #   otherwise identical to the one that resulted in this token.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::ListTeachersResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::ListTeachersResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_course_teachers(course_id, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/courses/{courseId}/teachers', options)
          command.response_representation = Google::Apis::ClassroomV1::ListTeachersResponse::Representation
          command.response_class = Google::Apis::ClassroomV1::ListTeachersResponse
          command.params['courseId'] = course_id unless course_id.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a topic.
        # This method returns the following error codes:
        # * `PERMISSION_DENIED` if the requesting user is not permitted to access the
        # requested course, create a topic in the requested course,
        # or for access errors.
        # * `INVALID_ARGUMENT` if the request is malformed.
        # * `NOT_FOUND` if the requested course does not exist.
        # @param [String] course_id
        #   Identifier of the course.
        #   This identifier can be either the Classroom-assigned identifier or an
        #   alias.
        # @param [Google::Apis::ClassroomV1::Topic] topic_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::Topic] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::Topic]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_course_topic(course_id, topic_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/courses/{courseId}/topics', options)
          command.request_representation = Google::Apis::ClassroomV1::Topic::Representation
          command.request_object = topic_object
          command.response_representation = Google::Apis::ClassroomV1::Topic::Representation
          command.response_class = Google::Apis::ClassroomV1::Topic
          command.params['courseId'] = course_id unless course_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a topic.
        # This method returns the following error codes:
        # * `PERMISSION_DENIED` if the requesting user is not allowed to delete the
        # requested topic or for access errors.
        # * `FAILED_PRECONDITION` if the requested topic has already been
        # deleted.
        # * `NOT_FOUND` if no course or topic exists with the requested ID.
        # @param [String] course_id
        #   Identifier of the course.
        #   This identifier can be either the Classroom-assigned identifier or an
        #   alias.
        # @param [String] id
        #   Identifier of the topic to delete.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_course_topic(course_id, id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/courses/{courseId}/topics/{id}', options)
          command.response_representation = Google::Apis::ClassroomV1::Empty::Representation
          command.response_class = Google::Apis::ClassroomV1::Empty
          command.params['courseId'] = course_id unless course_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a topic.
        # This method returns the following error codes:
        # * `PERMISSION_DENIED` if the requesting user is not permitted to access the
        # requested course or topic, or for access errors.
        # * `INVALID_ARGUMENT` if the request is malformed.
        # * `NOT_FOUND` if the requested course or topic does not exist.
        # @param [String] course_id
        #   Identifier of the course.
        # @param [String] id
        #   Identifier of the topic.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::Topic] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::Topic]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_course_topic(course_id, id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/courses/{courseId}/topics/{id}', options)
          command.response_representation = Google::Apis::ClassroomV1::Topic::Representation
          command.response_class = Google::Apis::ClassroomV1::Topic
          command.params['courseId'] = course_id unless course_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns the list of topics that the requester is permitted to view.
        # This method returns the following error codes:
        # * `PERMISSION_DENIED` if the requesting user is not permitted to access
        # the requested course or for access errors.
        # * `INVALID_ARGUMENT` if the request is malformed.
        # * `NOT_FOUND` if the requested course does not exist.
        # @param [String] course_id
        #   Identifier of the course.
        #   This identifier can be either the Classroom-assigned identifier or an
        #   alias.
        # @param [Fixnum] page_size
        #   Maximum number of items to return. Zero or unspecified indicates that the
        #   server may assign a maximum.
        #   The server may return fewer than the specified number of results.
        # @param [String] page_token
        #   nextPageToken
        #   value returned from a previous
        #   list call,
        #   indicating that the subsequent page of results should be returned.
        #   The list request
        #   must be otherwise identical to the one that resulted in this token.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::ListTopicResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::ListTopicResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_course_topics(course_id, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/courses/{courseId}/topics', options)
          command.response_representation = Google::Apis::ClassroomV1::ListTopicResponse::Representation
          command.response_class = Google::Apis::ClassroomV1::ListTopicResponse
          command.params['courseId'] = course_id unless course_id.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates one or more fields of a topic.
        # This method returns the following error codes:
        # * `PERMISSION_DENIED` if the requesting developer project did not create
        # the corresponding topic or for access errors.
        # * `INVALID_ARGUMENT` if the request is malformed.
        # * `NOT_FOUND` if the requested course or topic does not exist
        # @param [String] course_id
        #   Identifier of the course.
        #   This identifier can be either the Classroom-assigned identifier or an
        #   alias.
        # @param [String] id
        #   Identifier of the topic.
        # @param [Google::Apis::ClassroomV1::Topic] topic_object
        # @param [String] update_mask
        #   Mask that identifies which fields on the topic to update.
        #   This field is required to do an update. The update fails if invalid
        #   fields are specified. If a field supports empty values, it can be cleared
        #   by specifying it in the update mask and not in the Topic object. If a
        #   field that does not support empty values is included in the update mask and
        #   not set in the Topic object, an `INVALID_ARGUMENT` error will be
        #   returned.
        #   The following fields may be specified:
        #   * `name`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::Topic] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::Topic]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_course_topic(course_id, id, topic_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1/courses/{courseId}/topics/{id}', options)
          command.request_representation = Google::Apis::ClassroomV1::Topic::Representation
          command.request_object = topic_object
          command.response_representation = Google::Apis::ClassroomV1::Topic::Representation
          command.response_class = Google::Apis::ClassroomV1::Topic
          command.params['courseId'] = course_id unless course_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Accepts an invitation, removing it and adding the invited user to the
        # teachers or students (as appropriate) of the specified course. Only the
        # invited user may accept an invitation.
        # This method returns the following error codes:
        # * `PERMISSION_DENIED` if the requesting user is not permitted to accept the
        # requested invitation or for access errors.
        # * `FAILED_PRECONDITION` for the following request errors:
        # * CourseMemberLimitReached
        # * CourseNotModifiable
        # * CourseTeacherLimitReached
        # * UserGroupsMembershipLimitReached
        # * `NOT_FOUND` if no invitation exists with the requested ID.
        # @param [String] id
        #   Identifier of the invitation to accept.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def accept_invitation(id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/invitations/{id}:accept', options)
          command.response_representation = Google::Apis::ClassroomV1::Empty::Representation
          command.response_class = Google::Apis::ClassroomV1::Empty
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates an invitation. Only one invitation for a user and course may exist
        # at a time. Delete and re-create an invitation to make changes.
        # This method returns the following error codes:
        # * `PERMISSION_DENIED` if the requesting user is not permitted to create
        # invitations for this course or for access errors.
        # * `NOT_FOUND` if the course or the user does not exist.
        # * `FAILED_PRECONDITION` if the requested user's account is disabled or if
        # the user already has this role or a role with greater permissions.
        # * `ALREADY_EXISTS` if an invitation for the specified user and course
        # already exists.
        # @param [Google::Apis::ClassroomV1::Invitation] invitation_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::Invitation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::Invitation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_invitation(invitation_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/invitations', options)
          command.request_representation = Google::Apis::ClassroomV1::Invitation::Representation
          command.request_object = invitation_object
          command.response_representation = Google::Apis::ClassroomV1::Invitation::Representation
          command.response_class = Google::Apis::ClassroomV1::Invitation
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes an invitation.
        # This method returns the following error codes:
        # * `PERMISSION_DENIED` if the requesting user is not permitted to delete the
        # requested invitation or for access errors.
        # * `NOT_FOUND` if no invitation exists with the requested ID.
        # @param [String] id
        #   Identifier of the invitation to delete.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_invitation(id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/invitations/{id}', options)
          command.response_representation = Google::Apis::ClassroomV1::Empty::Representation
          command.response_class = Google::Apis::ClassroomV1::Empty
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns an invitation.
        # This method returns the following error codes:
        # * `PERMISSION_DENIED` if the requesting user is not permitted to view the
        # requested invitation or for access errors.
        # * `NOT_FOUND` if no invitation exists with the requested ID.
        # @param [String] id
        #   Identifier of the invitation to return.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::Invitation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::Invitation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_invitation(id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/invitations/{id}', options)
          command.response_representation = Google::Apis::ClassroomV1::Invitation::Representation
          command.response_class = Google::Apis::ClassroomV1::Invitation
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a list of invitations that the requesting user is permitted to
        # view, restricted to those that match the list request.
        # *Note:* At least one of `user_id` or `course_id` must be supplied. Both
        # fields can be supplied.
        # This method returns the following error codes:
        # * `PERMISSION_DENIED` for access errors.
        # @param [String] course_id
        #   Restricts returned invitations to those for a course with the specified
        #   identifier.
        # @param [Fixnum] page_size
        #   Maximum number of items to return. Zero means no maximum.
        #   The server may return fewer than the specified number of results.
        # @param [String] page_token
        #   nextPageToken
        #   value returned from a previous
        #   list call, indicating
        #   that the subsequent page of results should be returned.
        #   The list request must be
        #   otherwise identical to the one that resulted in this token.
        # @param [String] user_id
        #   Restricts returned invitations to those for a specific user. The identifier
        #   can be one of the following:
        #   * the numeric identifier for the user
        #   * the email address of the user
        #   * the string literal `"me"`, indicating the requesting user
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::ListInvitationsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::ListInvitationsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_invitations(course_id: nil, page_size: nil, page_token: nil, user_id: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/invitations', options)
          command.response_representation = Google::Apis::ClassroomV1::ListInvitationsResponse::Representation
          command.response_class = Google::Apis::ClassroomV1::ListInvitationsResponse
          command.query['courseId'] = course_id unless course_id.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['userId'] = user_id unless user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a `Registration`, causing Classroom to start sending notifications
        # from the provided `feed` to the destination provided in `cloudPubSubTopic`.
        # Returns the created `Registration`. Currently, this will be the same as
        # the argument, but with server-assigned fields such as `expiry_time` and
        # `id` filled in.
        # Note that any value specified for the `expiry_time` or `id` fields will be
        # ignored.
        # While Classroom may validate the `cloudPubSubTopic` and return errors on a
        # best effort basis, it is the caller's responsibility to ensure that it
        # exists and that Classroom has permission to publish to it.
        # This method may return the following error codes:
        # * `PERMISSION_DENIED` if:
        # * the authenticated user does not have permission to receive
        # notifications from the requested field; or
        # * the credential provided does not include the appropriate scope for
        # the requested feed.
        # * another access error is encountered.
        # * `INVALID_ARGUMENT` if:
        # * no `cloudPubsubTopic` is specified, or the specified
        # `cloudPubsubTopic` is not valid; or
        # * no `feed` is specified, or the specified `feed` is not valid.
        # * `NOT_FOUND` if:
        # * the specified `feed` cannot be located, or the requesting user does
        # not have permission to determine whether or not it exists; or
        # * the specified `cloudPubsubTopic` cannot be located, or Classroom has
        # not been granted permission to publish to it.
        # @param [Google::Apis::ClassroomV1::Registration] registration_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::Registration] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::Registration]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_registration(registration_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/registrations', options)
          command.request_representation = Google::Apis::ClassroomV1::Registration::Representation
          command.request_object = registration_object
          command.response_representation = Google::Apis::ClassroomV1::Registration::Representation
          command.response_class = Google::Apis::ClassroomV1::Registration
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a `Registration`, causing Classroom to stop sending notifications
        # for that `Registration`.
        # @param [String] registration_id
        #   The `registration_id` of the `Registration` to be deleted.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_registration(registration_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/registrations/{registrationId}', options)
          command.response_representation = Google::Apis::ClassroomV1::Empty::Representation
          command.response_class = Google::Apis::ClassroomV1::Empty
          command.params['registrationId'] = registration_id unless registration_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a user profile.
        # This method returns the following error codes:
        # * `PERMISSION_DENIED` if the requesting user is not permitted to access
        # this user profile, if no profile exists with the requested ID, or for
        # access errors.
        # @param [String] user_id
        #   Identifier of the profile to return. The identifier can be one of the
        #   following:
        #   * the numeric identifier for the user
        #   * the email address of the user
        #   * the string literal `"me"`, indicating the requesting user
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::UserProfile] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::UserProfile]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_user_profile(user_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/userProfiles/{userId}', options)
          command.response_representation = Google::Apis::ClassroomV1::UserProfile::Representation
          command.response_class = Google::Apis::ClassroomV1::UserProfile
          command.params['userId'] = user_id unless user_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a guardian invitation, and sends an email to the guardian asking
        # them to confirm that they are the student's guardian.
        # Once the guardian accepts the invitation, their `state` will change to
        # `COMPLETED` and they will start receiving guardian notifications. A
        # `Guardian` resource will also be created to represent the active guardian.
        # The request object must have the `student_id` and
        # `invited_email_address` fields set. Failing to set these fields, or
        # setting any other fields in the request, will result in an error.
        # This method returns the following error codes:
        # * `PERMISSION_DENIED` if the current user does not have permission to
        # manage guardians, if the guardian in question has already rejected
        # too many requests for that student, if guardians are not enabled for the
        # domain in question, or for other access errors.
        # * `RESOURCE_EXHAUSTED` if the student or guardian has exceeded the guardian
        # link limit.
        # * `INVALID_ARGUMENT` if the guardian email address is not valid (for
        # example, if it is too long), or if the format of the student ID provided
        # cannot be recognized (it is not an email address, nor a `user_id` from
        # this API). This error will also be returned if read-only fields are set,
        # or if the `state` field is set to to a value other than `PENDING`.
        # * `NOT_FOUND` if the student ID provided is a valid student ID, but
        # Classroom has no record of that student.
        # * `ALREADY_EXISTS` if there is already a pending guardian invitation for
        # the student and `invited_email_address` provided, or if the provided
        # `invited_email_address` matches the Google account of an existing
        # `Guardian` for this user.
        # @param [String] student_id
        #   ID of the student (in standard format)
        # @param [Google::Apis::ClassroomV1::GuardianInvitation] guardian_invitation_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::GuardianInvitation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::GuardianInvitation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_user_profile_guardian_invitation(student_id, guardian_invitation_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/userProfiles/{studentId}/guardianInvitations', options)
          command.request_representation = Google::Apis::ClassroomV1::GuardianInvitation::Representation
          command.request_object = guardian_invitation_object
          command.response_representation = Google::Apis::ClassroomV1::GuardianInvitation::Representation
          command.response_class = Google::Apis::ClassroomV1::GuardianInvitation
          command.params['studentId'] = student_id unless student_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a specific guardian invitation.
        # This method returns the following error codes:
        # * `PERMISSION_DENIED` if the requesting user is not permitted to view
        # guardian invitations for the student identified by the `student_id`, if
        # guardians are not enabled for the domain in question, or for other
        # access errors.
        # * `INVALID_ARGUMENT` if a `student_id` is specified, but its format cannot
        # be recognized (it is not an email address, nor a `student_id` from the
        # API, nor the literal string `me`).
        # * `NOT_FOUND` if Classroom cannot find any record of the given student or
        # `invitation_id`. May also be returned if the student exists, but the
        # requesting user does not have access to see that student.
        # @param [String] student_id
        #   The ID of the student whose guardian invitation is being requested.
        # @param [String] invitation_id
        #   The `id` field of the `GuardianInvitation` being requested.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::GuardianInvitation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::GuardianInvitation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_user_profile_guardian_invitation(student_id, invitation_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/userProfiles/{studentId}/guardianInvitations/{invitationId}', options)
          command.response_representation = Google::Apis::ClassroomV1::GuardianInvitation::Representation
          command.response_class = Google::Apis::ClassroomV1::GuardianInvitation
          command.params['studentId'] = student_id unless student_id.nil?
          command.params['invitationId'] = invitation_id unless invitation_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a list of guardian invitations that the requesting user is
        # permitted to view, filtered by the parameters provided.
        # This method returns the following error codes:
        # * `PERMISSION_DENIED` if a `student_id` is specified, and the requesting
        # user is not permitted to view guardian invitations for that student, if
        # `"-"` is specified as the `student_id` and the user is not a domain
        # administrator, if guardians are not enabled for the domain in question,
        # or for other access errors.
        # * `INVALID_ARGUMENT` if a `student_id` is specified, but its format cannot
        # be recognized (it is not an email address, nor a `student_id` from the
        # API, nor the literal string `me`). May also be returned if an invalid
        # `page_token` or `state` is provided.
        # * `NOT_FOUND` if a `student_id` is specified, and its format can be
        # recognized, but Classroom has no record of that student.
        # @param [String] student_id
        #   The ID of the student whose guardian invitations are to be returned.
        #   The identifier can be one of the following:
        #   * the numeric identifier for the user
        #   * the email address of the user
        #   * the string literal `"me"`, indicating the requesting user
        #   * the string literal `"-"`, indicating that results should be returned for
        #   all students that the requesting user is permitted to view guardian
        #   invitations.
        # @param [String] invited_email_address
        #   If specified, only results with the specified `invited_email_address`
        #   will be returned.
        # @param [Fixnum] page_size
        #   Maximum number of items to return. Zero or unspecified indicates that the
        #   server may assign a maximum.
        #   The server may return fewer than the specified number of results.
        # @param [String] page_token
        #   nextPageToken
        #   value returned from a previous
        #   list call,
        #   indicating that the subsequent page of results should be returned.
        #   The list request
        #   must be otherwise identical to the one that resulted in this token.
        # @param [Array<String>, String] states
        #   If specified, only results with the specified `state` values will be
        #   returned. Otherwise, results with a `state` of `PENDING` will be returned.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::ListGuardianInvitationsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::ListGuardianInvitationsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_user_profile_guardian_invitations(student_id, invited_email_address: nil, page_size: nil, page_token: nil, states: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/userProfiles/{studentId}/guardianInvitations', options)
          command.response_representation = Google::Apis::ClassroomV1::ListGuardianInvitationsResponse::Representation
          command.response_class = Google::Apis::ClassroomV1::ListGuardianInvitationsResponse
          command.params['studentId'] = student_id unless student_id.nil?
          command.query['invitedEmailAddress'] = invited_email_address unless invited_email_address.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['states'] = states unless states.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Modifies a guardian invitation.
        # Currently, the only valid modification is to change the `state` from
        # `PENDING` to `COMPLETE`. This has the effect of withdrawing the invitation.
        # This method returns the following error codes:
        # * `PERMISSION_DENIED` if the current user does not have permission to
        # manage guardians, if guardians are not enabled for the domain in question
        # or for other access errors.
        # * `FAILED_PRECONDITION` if the guardian link is not in the `PENDING` state.
        # * `INVALID_ARGUMENT` if the format of the student ID provided
        # cannot be recognized (it is not an email address, nor a `user_id` from
        # this API), or if the passed `GuardianInvitation` has a `state` other than
        # `COMPLETE`, or if it modifies fields other than `state`.
        # * `NOT_FOUND` if the student ID provided is a valid student ID, but
        # Classroom has no record of that student, or if the `id` field does not
        # refer to a guardian invitation known to Classroom.
        # @param [String] student_id
        #   The ID of the student whose guardian invitation is to be modified.
        # @param [String] invitation_id
        #   The `id` field of the `GuardianInvitation` to be modified.
        # @param [Google::Apis::ClassroomV1::GuardianInvitation] guardian_invitation_object
        # @param [String] update_mask
        #   Mask that identifies which fields on the course to update.
        #   This field is required to do an update. The update will fail if invalid
        #   fields are specified. The following fields are valid:
        #   * `state`
        #   When set in a query parameter, this field should be specified as
        #   `updateMask=<field1>,<field2>,...`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::GuardianInvitation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::GuardianInvitation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_user_profile_guardian_invitation(student_id, invitation_id, guardian_invitation_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1/userProfiles/{studentId}/guardianInvitations/{invitationId}', options)
          command.request_representation = Google::Apis::ClassroomV1::GuardianInvitation::Representation
          command.request_object = guardian_invitation_object
          command.response_representation = Google::Apis::ClassroomV1::GuardianInvitation::Representation
          command.response_class = Google::Apis::ClassroomV1::GuardianInvitation
          command.params['studentId'] = student_id unless student_id.nil?
          command.params['invitationId'] = invitation_id unless invitation_id.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a guardian.
        # The guardian will no longer receive guardian notifications and the guardian
        # will no longer be accessible via the API.
        # This method returns the following error codes:
        # * `PERMISSION_DENIED` if no user that matches the provided `student_id`
        # is visible to the requesting user, if the requesting user is not
        # permitted to manage guardians for the student identified by the
        # `student_id`, if guardians are not enabled for the domain in question,
        # or for other access errors.
        # * `INVALID_ARGUMENT` if a `student_id` is specified, but its format cannot
        # be recognized (it is not an email address, nor a `student_id` from the
        # API).
        # * `NOT_FOUND` if the requesting user is permitted to modify guardians for
        # the requested `student_id`, but no `Guardian` record exists for that
        # student with the provided `guardian_id`.
        # @param [String] student_id
        #   The student whose guardian is to be deleted. One of the following:
        #   * the numeric identifier for the user
        #   * the email address of the user
        #   * the string literal `"me"`, indicating the requesting user
        # @param [String] guardian_id
        #   The `id` field from a `Guardian`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_user_profile_guardian(student_id, guardian_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/userProfiles/{studentId}/guardians/{guardianId}', options)
          command.response_representation = Google::Apis::ClassroomV1::Empty::Representation
          command.response_class = Google::Apis::ClassroomV1::Empty
          command.params['studentId'] = student_id unless student_id.nil?
          command.params['guardianId'] = guardian_id unless guardian_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a specific guardian.
        # This method returns the following error codes:
        # * `PERMISSION_DENIED` if no user that matches the provided `student_id`
        # is visible to the requesting user, if the requesting user is not
        # permitted to view guardian information for the student identified by the
        # `student_id`, if guardians are not enabled for the domain in question,
        # or for other access errors.
        # * `INVALID_ARGUMENT` if a `student_id` is specified, but its format cannot
        # be recognized (it is not an email address, nor a `student_id` from the
        # API, nor the literal string `me`).
        # * `NOT_FOUND` if the requesting user is permitted to view guardians for
        # the requested `student_id`, but no `Guardian` record exists for that
        # student that matches the provided `guardian_id`.
        # @param [String] student_id
        #   The student whose guardian is being requested. One of the following:
        #   * the numeric identifier for the user
        #   * the email address of the user
        #   * the string literal `"me"`, indicating the requesting user
        # @param [String] guardian_id
        #   The `id` field from a `Guardian`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::Guardian] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::Guardian]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_user_profile_guardian(student_id, guardian_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/userProfiles/{studentId}/guardians/{guardianId}', options)
          command.response_representation = Google::Apis::ClassroomV1::Guardian::Representation
          command.response_class = Google::Apis::ClassroomV1::Guardian
          command.params['studentId'] = student_id unless student_id.nil?
          command.params['guardianId'] = guardian_id unless guardian_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a list of guardians that the requesting user is permitted to
        # view, restricted to those that match the request.
        # To list guardians for any student that the requesting user may view
        # guardians for, use the literal character `-` for the student ID.
        # This method returns the following error codes:
        # * `PERMISSION_DENIED` if a `student_id` is specified, and the requesting
        # user is not permitted to view guardian information for that student, if
        # `"-"` is specified as the `student_id` and the user is not a domain
        # administrator, if guardians are not enabled for the domain in question,
        # if the `invited_email_address` filter is set by a user who is not a
        # domain administrator, or for other access errors.
        # * `INVALID_ARGUMENT` if a `student_id` is specified, but its format cannot
        # be recognized (it is not an email address, nor a `student_id` from the
        # API, nor the literal string `me`). May also be returned if an invalid
        # `page_token` is provided.
        # * `NOT_FOUND` if a `student_id` is specified, and its format can be
        # recognized, but Classroom has no record of that student.
        # @param [String] student_id
        #   Filter results by the student who the guardian is linked to.
        #   The identifier can be one of the following:
        #   * the numeric identifier for the user
        #   * the email address of the user
        #   * the string literal `"me"`, indicating the requesting user
        #   * the string literal `"-"`, indicating that results should be returned for
        #   all students that the requesting user has access to view.
        # @param [String] invited_email_address
        #   Filter results by the email address that the original invitation was sent
        #   to, resulting in this guardian link.
        #   This filter can only be used by domain administrators.
        # @param [Fixnum] page_size
        #   Maximum number of items to return. Zero or unspecified indicates that the
        #   server may assign a maximum.
        #   The server may return fewer than the specified number of results.
        # @param [String] page_token
        #   nextPageToken
        #   value returned from a previous
        #   list call,
        #   indicating that the subsequent page of results should be returned.
        #   The list request
        #   must be otherwise identical to the one that resulted in this token.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClassroomV1::ListGuardiansResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClassroomV1::ListGuardiansResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_user_profile_guardians(student_id, invited_email_address: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/userProfiles/{studentId}/guardians', options)
          command.response_representation = Google::Apis::ClassroomV1::ListGuardiansResponse::Representation
          command.response_class = Google::Apis::ClassroomV1::ListGuardiansResponse
          command.params['studentId'] = student_id unless student_id.nil?
          command.query['invitedEmailAddress'] = invited_email_address unless invited_email_address.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
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
