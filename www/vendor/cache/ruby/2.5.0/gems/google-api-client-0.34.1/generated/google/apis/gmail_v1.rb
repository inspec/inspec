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

require 'google/apis/gmail_v1/service.rb'
require 'google/apis/gmail_v1/classes.rb'
require 'google/apis/gmail_v1/representations.rb'

module Google
  module Apis
    # Gmail API
    #
    # Access Gmail mailboxes including sending user email.
    #
    # @see https://developers.google.com/gmail/api/
    module GmailV1
      VERSION = 'V1'
      REVISION = '20190602'

      # Read, compose, send, and permanently delete all your email from Gmail
      AUTH_SCOPE = 'https://mail.google.com/'

      # Manage drafts and send emails
      AUTH_GMAIL_COMPOSE = 'https://www.googleapis.com/auth/gmail.compose'

      # Insert mail into your mailbox
      AUTH_GMAIL_INSERT = 'https://www.googleapis.com/auth/gmail.insert'

      # Manage mailbox labels
      AUTH_GMAIL_LABELS = 'https://www.googleapis.com/auth/gmail.labels'

      # View your email message metadata such as labels and headers, but not the email body
      AUTH_GMAIL_METADATA = 'https://www.googleapis.com/auth/gmail.metadata'

      # View and modify but not delete your email
      AUTH_GMAIL_MODIFY = 'https://www.googleapis.com/auth/gmail.modify'

      # View your email messages and settings
      AUTH_GMAIL_READONLY = 'https://www.googleapis.com/auth/gmail.readonly'

      # Send email on your behalf
      AUTH_GMAIL_SEND = 'https://www.googleapis.com/auth/gmail.send'

      # Manage your basic mail settings
      AUTH_GMAIL_SETTINGS_BASIC = 'https://www.googleapis.com/auth/gmail.settings.basic'

      # Manage your sensitive mail settings, including who can manage your mail
      AUTH_GMAIL_SETTINGS_SHARING = 'https://www.googleapis.com/auth/gmail.settings.sharing'
    end
  end
end
