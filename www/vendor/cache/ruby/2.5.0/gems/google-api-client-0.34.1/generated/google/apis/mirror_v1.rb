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

require 'google/apis/mirror_v1/service.rb'
require 'google/apis/mirror_v1/classes.rb'
require 'google/apis/mirror_v1/representations.rb'

module Google
  module Apis
    # Google Mirror API
    #
    # Interacts with Glass users via the timeline.
    #
    # @see https://developers.google.com/glass
    module MirrorV1
      VERSION = 'V1'
      REVISION = '20180611'

      # View your location
      AUTH_GLASS_LOCATION = 'https://www.googleapis.com/auth/glass.location'

      # View and manage your Glass timeline
      AUTH_GLASS_TIMELINE = 'https://www.googleapis.com/auth/glass.timeline'
    end
  end
end
