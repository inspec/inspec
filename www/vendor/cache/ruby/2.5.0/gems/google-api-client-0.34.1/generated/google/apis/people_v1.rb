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

require 'google/apis/people_v1/service.rb'
require 'google/apis/people_v1/classes.rb'
require 'google/apis/people_v1/representations.rb'

module Google
  module Apis
    # People API
    #
    # Provides access to information about profiles and contacts.
    #
    # @see https://developers.google.com/people/
    module PeopleV1
      VERSION = 'V1'
      REVISION = '20191030'

      # See, edit, download, and permanently delete your contacts
      AUTH_CONTACTS = 'https://www.googleapis.com/auth/contacts'

      # See and download your contacts
      AUTH_CONTACTS_READONLY = 'https://www.googleapis.com/auth/contacts.readonly'

      # View your street addresses
      AUTH_USER_ADDRESSES_READ = 'https://www.googleapis.com/auth/user.addresses.read'

      # View your complete date of birth
      AUTH_USER_BIRTHDAY_READ = 'https://www.googleapis.com/auth/user.birthday.read'

      # View your email addresses
      AUTH_USER_EMAILS_READ = 'https://www.googleapis.com/auth/user.emails.read'

      # View your phone numbers
      AUTH_USER_PHONENUMBERS_READ = 'https://www.googleapis.com/auth/user.phonenumbers.read'

      # View your email address
      AUTH_USERINFO_EMAIL = 'https://www.googleapis.com/auth/userinfo.email'

      # See your personal info, including any personal info you've made publicly available
      AUTH_USERINFO_PROFILE = 'https://www.googleapis.com/auth/userinfo.profile'
    end
  end
end
