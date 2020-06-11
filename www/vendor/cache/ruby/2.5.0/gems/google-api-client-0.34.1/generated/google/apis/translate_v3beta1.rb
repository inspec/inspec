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

require 'google/apis/translate_v3beta1/service.rb'
require 'google/apis/translate_v3beta1/classes.rb'
require 'google/apis/translate_v3beta1/representations.rb'

module Google
  module Apis
    # Cloud Translation API
    #
    # Integrates text translation into your website or application.
    #
    # @see https://cloud.google.com/translate/docs/quickstarts
    module TranslateV3beta1
      VERSION = 'V3beta1'
      REVISION = '20190924'

      # View and manage your data across Google Cloud Platform services
      AUTH_CLOUD_PLATFORM = 'https://www.googleapis.com/auth/cloud-platform'

      # Translate text from one language to another using Google Translate
      AUTH_CLOUD_TRANSLATION = 'https://www.googleapis.com/auth/cloud-translation'
    end
  end
end
