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

require 'google/apis/pubsub_v1beta1a/service.rb'
require 'google/apis/pubsub_v1beta1a/classes.rb'
require 'google/apis/pubsub_v1beta1a/representations.rb'

module Google
  module Apis
    # Cloud Pub/Sub API
    #
    # Provides reliable, many-to-many, asynchronous messaging between applications.
    #
    # @see https://cloud.google.com/pubsub/docs
    module PubsubV1beta1a
      VERSION = 'V1beta1a'
      REVISION = '20180604'

      # View and manage your data across Google Cloud Platform services
      AUTH_CLOUD_PLATFORM = 'https://www.googleapis.com/auth/cloud-platform'

      # View and manage Pub/Sub topics and subscriptions
      AUTH_PUBSUB = 'https://www.googleapis.com/auth/pubsub'
    end
  end
end
