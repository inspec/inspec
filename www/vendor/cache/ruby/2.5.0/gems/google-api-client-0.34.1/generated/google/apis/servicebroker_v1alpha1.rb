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

require 'google/apis/servicebroker_v1alpha1/service.rb'
require 'google/apis/servicebroker_v1alpha1/classes.rb'
require 'google/apis/servicebroker_v1alpha1/representations.rb'

module Google
  module Apis
    # Service Broker API
    #
    # The Google Cloud Platform Service Broker API provides Google hosted
    # implementation of the Open Service Broker API
    # (https://www.openservicebrokerapi.org/).
    #
    # @see https://cloud.google.com/kubernetes-engine/docs/concepts/add-on/service-broker
    module ServicebrokerV1alpha1
      VERSION = 'V1alpha1'
      REVISION = '20190930'

      # View and manage your data across Google Cloud Platform services
      AUTH_CLOUD_PLATFORM = 'https://www.googleapis.com/auth/cloud-platform'
    end
  end
end
