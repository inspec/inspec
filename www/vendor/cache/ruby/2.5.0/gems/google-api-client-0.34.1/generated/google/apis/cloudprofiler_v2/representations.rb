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

require 'date'
require 'google/apis/core/base_service'
require 'google/apis/core/json_representation'
require 'google/apis/core/hashable'
require 'google/apis/errors'

module Google
  module Apis
    module CloudprofilerV2
      
      class CreateProfileRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Deployment
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Profile
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateProfileRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :deployment, as: 'deployment', class: Google::Apis::CloudprofilerV2::Deployment, decorator: Google::Apis::CloudprofilerV2::Deployment::Representation
      
          collection :profile_type, as: 'profileType'
        end
      end
      
      class Deployment
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :labels, as: 'labels'
          property :project_id, as: 'projectId'
          property :target, as: 'target'
        end
      end
      
      class Profile
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :deployment, as: 'deployment', class: Google::Apis::CloudprofilerV2::Deployment, decorator: Google::Apis::CloudprofilerV2::Deployment::Representation
      
          property :duration, as: 'duration'
          hash :labels, as: 'labels'
          property :name, as: 'name'
          property :profile_bytes, :base64 => true, as: 'profileBytes'
          property :profile_type, as: 'profileType'
        end
      end
    end
  end
end
