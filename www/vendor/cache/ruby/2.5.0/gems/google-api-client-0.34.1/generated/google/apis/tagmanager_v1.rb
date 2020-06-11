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

require 'google/apis/tagmanager_v1/service.rb'
require 'google/apis/tagmanager_v1/classes.rb'
require 'google/apis/tagmanager_v1/representations.rb'

module Google
  module Apis
    # Tag Manager API
    #
    # This API allows clients to access and modify container and tag
    # configuration.
    #
    # @see https://developers.google.com/tag-manager
    module TagmanagerV1
      VERSION = 'V1'
      REVISION = '20190629'

      # Delete your Google Tag Manager containers
      AUTH_TAGMANAGER_DELETE_CONTAINERS = 'https://www.googleapis.com/auth/tagmanager.delete.containers'

      # Manage your Google Tag Manager container and its subcomponents, excluding versioning and publishing
      AUTH_TAGMANAGER_EDIT_CONTAINERS = 'https://www.googleapis.com/auth/tagmanager.edit.containers'

      # Manage your Google Tag Manager container versions
      AUTH_TAGMANAGER_EDIT_CONTAINERVERSIONS = 'https://www.googleapis.com/auth/tagmanager.edit.containerversions'

      # View and manage your Google Tag Manager accounts
      AUTH_TAGMANAGER_MANAGE_ACCOUNTS = 'https://www.googleapis.com/auth/tagmanager.manage.accounts'

      # Manage user permissions of your Google Tag Manager account and container
      AUTH_TAGMANAGER_MANAGE_USERS = 'https://www.googleapis.com/auth/tagmanager.manage.users'

      # Publish your Google Tag Manager container versions
      AUTH_TAGMANAGER_PUBLISH = 'https://www.googleapis.com/auth/tagmanager.publish'

      # View your Google Tag Manager container and its subcomponents
      AUTH_TAGMANAGER_READONLY = 'https://www.googleapis.com/auth/tagmanager.readonly'
    end
  end
end
