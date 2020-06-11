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

require 'google/apis/dns_v2beta1/service.rb'
require 'google/apis/dns_v2beta1/classes.rb'
require 'google/apis/dns_v2beta1/representations.rb'

module Google
  module Apis
    # Google Cloud DNS API
    #
    # Configures and serves authoritative DNS records.
    #
    # @see https://developers.google.com/cloud-dns
    module DnsV2beta1
      VERSION = 'V2beta1'
      REVISION = '20190923'

      # View and manage your data across Google Cloud Platform services
      AUTH_CLOUD_PLATFORM = 'https://www.googleapis.com/auth/cloud-platform'

      # View your data across Google Cloud Platform services
      AUTH_CLOUD_PLATFORM_READ_ONLY = 'https://www.googleapis.com/auth/cloud-platform.read-only'

      # View your DNS records hosted by Google Cloud DNS
      AUTH_NDEV_CLOUDDNS_READONLY = 'https://www.googleapis.com/auth/ndev.clouddns.readonly'

      # View and manage your DNS records hosted by Google Cloud DNS
      AUTH_NDEV_CLOUDDNS_READWRITE = 'https://www.googleapis.com/auth/ndev.clouddns.readwrite'
    end
  end
end
