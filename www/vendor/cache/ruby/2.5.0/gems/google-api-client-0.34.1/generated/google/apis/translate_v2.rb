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

require 'google/apis/translate_v2/service.rb'
require 'google/apis/translate_v2/classes.rb'
require 'google/apis/translate_v2/representations.rb'

module Google
  module Apis
    # Google Cloud Translation API
    #
    # The Google Cloud Translation API lets websites and programs integrate with
    # Google Translate programmatically.
    #
    # @see https://code.google.com/apis/language/translate/v2/getting_started.html
    module TranslateV2
      VERSION = 'V2'
      REVISION = '20170525'

      # View and manage your data across Google Cloud Platform services
      AUTH_CLOUD_PLATFORM = 'https://www.googleapis.com/auth/cloud-platform'

      # Translate text from one language to another using Google Translate
      AUTH_CLOUD_TRANSLATION = 'https://www.googleapis.com/auth/cloud-translation'
    end
  end
end
