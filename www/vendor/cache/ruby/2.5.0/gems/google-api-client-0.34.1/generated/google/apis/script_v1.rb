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

require 'google/apis/script_v1/service.rb'
require 'google/apis/script_v1/classes.rb'
require 'google/apis/script_v1/representations.rb'

module Google
  module Apis
    # Apps Script API
    #
    # Manages and executes Google Apps Script projects.
    #
    # @see https://developers.google.com/apps-script/api/
    module ScriptV1
      VERSION = 'V1'
      REVISION = '20190905'

      # Read, compose, send, and permanently delete all your email from Gmail
      AUTH_SCOPE = 'https://mail.google.com/'

      # See, edit, share, and permanently delete all the calendars you can access using Google Calendar
      CALENDAR_FEEDS = 'https://www.google.com/calendar/feeds'

      # See, edit, download, and permanently delete your contacts
      M8_FEEDS = 'https://www.google.com/m8/feeds'

      # View and manage the provisioning of groups on your domain
      AUTH_ADMIN_DIRECTORY_GROUP = 'https://www.googleapis.com/auth/admin.directory.group'

      # View and manage the provisioning of users on your domain
      AUTH_ADMIN_DIRECTORY_USER = 'https://www.googleapis.com/auth/admin.directory.user'

      # View and manage your Google Docs documents
      AUTH_DOCUMENTS = 'https://www.googleapis.com/auth/documents'

      # See, edit, create, and delete all of your Google Drive files
      AUTH_DRIVE = 'https://www.googleapis.com/auth/drive'

      # View and manage your forms in Google Drive
      AUTH_FORMS = 'https://www.googleapis.com/auth/forms'

      # View and manage forms that this application has been installed in
      AUTH_FORMS_CURRENTONLY = 'https://www.googleapis.com/auth/forms.currentonly'

      # View and manage your Google Groups
      AUTH_GROUPS = 'https://www.googleapis.com/auth/groups'

      # Create and update Google Apps Script deployments
      AUTH_SCRIPT_DEPLOYMENTS = 'https://www.googleapis.com/auth/script.deployments'

      # View Google Apps Script deployments
      AUTH_SCRIPT_DEPLOYMENTS_READONLY = 'https://www.googleapis.com/auth/script.deployments.readonly'

      # View Google Apps Script project's metrics
      AUTH_SCRIPT_METRICS = 'https://www.googleapis.com/auth/script.metrics'

      # View Google Apps Script processes
      AUTH_SCRIPT_PROCESSES = 'https://www.googleapis.com/auth/script.processes'

      # Create and update Google Apps Script projects
      AUTH_SCRIPT_PROJECTS = 'https://www.googleapis.com/auth/script.projects'

      # View Google Apps Script projects
      AUTH_SCRIPT_PROJECTS_READONLY = 'https://www.googleapis.com/auth/script.projects.readonly'

      # See, edit, create, and delete your spreadsheets in Google Drive
      AUTH_SPREADSHEETS = 'https://www.googleapis.com/auth/spreadsheets'

      # View your email address
      AUTH_USERINFO_EMAIL = 'https://www.googleapis.com/auth/userinfo.email'
    end
  end
end
