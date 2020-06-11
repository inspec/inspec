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

require 'google/apis/drive_v2/service.rb'
require 'google/apis/drive_v2/classes.rb'
require 'google/apis/drive_v2/representations.rb'

module Google
  module Apis
    # Drive API
    #
    # Manages files in Drive including uploading, downloading, searching, detecting
    # changes, and updating sharing permissions.
    #
    # @see https://developers.google.com/drive/
    module DriveV2
      VERSION = 'V2'
      REVISION = '20191017'

      # See, edit, create, and delete all of your Google Drive files
      AUTH_DRIVE = 'https://www.googleapis.com/auth/drive'

      # View and manage its own configuration data in your Google Drive
      AUTH_DRIVE_APPDATA = 'https://www.googleapis.com/auth/drive.appdata'

      # View your Google Drive apps
      AUTH_DRIVE_APPS_READONLY = 'https://www.googleapis.com/auth/drive.apps.readonly'

      # View and manage Google Drive files and folders that you have opened or created with this app
      AUTH_DRIVE_FILE = 'https://www.googleapis.com/auth/drive.file'

      # View and manage metadata of files in your Google Drive
      AUTH_DRIVE_METADATA = 'https://www.googleapis.com/auth/drive.metadata'

      # View metadata for files in your Google Drive
      AUTH_DRIVE_METADATA_READONLY = 'https://www.googleapis.com/auth/drive.metadata.readonly'

      # View the photos, videos and albums in your Google Photos
      AUTH_DRIVE_PHOTOS_READONLY = 'https://www.googleapis.com/auth/drive.photos.readonly'

      # See and download all your Google Drive files
      AUTH_DRIVE_READONLY = 'https://www.googleapis.com/auth/drive.readonly'

      # Modify your Google Apps Script scripts' behavior
      AUTH_DRIVE_SCRIPTS = 'https://www.googleapis.com/auth/drive.scripts'
    end
  end
end
