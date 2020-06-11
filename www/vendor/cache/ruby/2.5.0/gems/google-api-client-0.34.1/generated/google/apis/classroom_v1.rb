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

require 'google/apis/classroom_v1/service.rb'
require 'google/apis/classroom_v1/classes.rb'
require 'google/apis/classroom_v1/representations.rb'

module Google
  module Apis
    # Google Classroom API
    #
    # Manages classes, rosters, and invitations in Google Classroom.
    #
    # @see https://developers.google.com/classroom/
    module ClassroomV1
      VERSION = 'V1'
      REVISION = '20190503'

      # View and manage announcements in Google Classroom
      AUTH_CLASSROOM_ANNOUNCEMENTS = 'https://www.googleapis.com/auth/classroom.announcements'

      # View announcements in Google Classroom
      AUTH_CLASSROOM_ANNOUNCEMENTS_READONLY = 'https://www.googleapis.com/auth/classroom.announcements.readonly'

      # Manage your Google Classroom classes
      AUTH_CLASSROOM_COURSES = 'https://www.googleapis.com/auth/classroom.courses'

      # View your Google Classroom classes
      AUTH_CLASSROOM_COURSES_READONLY = 'https://www.googleapis.com/auth/classroom.courses.readonly'

      # Manage your course work and view your grades in Google Classroom
      AUTH_CLASSROOM_COURSEWORK_ME = 'https://www.googleapis.com/auth/classroom.coursework.me'

      # View your course work and grades in Google Classroom
      AUTH_CLASSROOM_COURSEWORK_ME_READONLY = 'https://www.googleapis.com/auth/classroom.coursework.me.readonly'

      # Manage course work and grades for students in the Google Classroom classes you teach and view the course work and grades for classes you administer
      AUTH_CLASSROOM_COURSEWORK_STUDENTS = 'https://www.googleapis.com/auth/classroom.coursework.students'

      # View course work and grades for students in the Google Classroom classes you teach or administer
      AUTH_CLASSROOM_COURSEWORK_STUDENTS_READONLY = 'https://www.googleapis.com/auth/classroom.coursework.students.readonly'

      # View your Google Classroom guardians
      AUTH_CLASSROOM_GUARDIANLINKS_ME_READONLY = 'https://www.googleapis.com/auth/classroom.guardianlinks.me.readonly'

      # View and manage guardians for students in your Google Classroom classes
      AUTH_CLASSROOM_GUARDIANLINKS_STUDENTS = 'https://www.googleapis.com/auth/classroom.guardianlinks.students'

      # View guardians for students in your Google Classroom classes
      AUTH_CLASSROOM_GUARDIANLINKS_STUDENTS_READONLY = 'https://www.googleapis.com/auth/classroom.guardianlinks.students.readonly'

      # View the email addresses of people in your classes
      AUTH_CLASSROOM_PROFILE_EMAILS = 'https://www.googleapis.com/auth/classroom.profile.emails'

      # View the profile photos of people in your classes
      AUTH_CLASSROOM_PROFILE_PHOTOS = 'https://www.googleapis.com/auth/classroom.profile.photos'

      # Receive notifications about your Google Classroom data
      AUTH_CLASSROOM_PUSH_NOTIFICATIONS = 'https://www.googleapis.com/auth/classroom.push-notifications'

      # Manage your Google Classroom class rosters
      AUTH_CLASSROOM_ROSTERS = 'https://www.googleapis.com/auth/classroom.rosters'

      # View your Google Classroom class rosters
      AUTH_CLASSROOM_ROSTERS_READONLY = 'https://www.googleapis.com/auth/classroom.rosters.readonly'

      # View your course work and grades in Google Classroom
      AUTH_CLASSROOM_STUDENT_SUBMISSIONS_ME_READONLY = 'https://www.googleapis.com/auth/classroom.student-submissions.me.readonly'

      # View course work and grades for students in the Google Classroom classes you teach or administer
      AUTH_CLASSROOM_STUDENT_SUBMISSIONS_STUDENTS_READONLY = 'https://www.googleapis.com/auth/classroom.student-submissions.students.readonly'

      # See, create, and edit topics in Google Classroom
      AUTH_CLASSROOM_TOPICS = 'https://www.googleapis.com/auth/classroom.topics'

      # View topics in Google Classroom
      AUTH_CLASSROOM_TOPICS_READONLY = 'https://www.googleapis.com/auth/classroom.topics.readonly'
    end
  end
end
