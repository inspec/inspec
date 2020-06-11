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
    module DomainsrdapV1
      
      class HttpBody
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Link
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Notice
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RdapResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HttpBody
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :content_type, as: 'contentType'
          property :data, :base64 => true, as: 'data'
          collection :extensions, as: 'extensions'
        end
      end
      
      class Link
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :href, as: 'href'
          property :hreflang, as: 'hreflang'
          property :media, as: 'media'
          property :rel, as: 'rel'
          property :title, as: 'title'
          property :type, as: 'type'
          property :value, as: 'value'
        end
      end
      
      class Notice
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :description, as: 'description'
          collection :links, as: 'links', class: Google::Apis::DomainsrdapV1::Link, decorator: Google::Apis::DomainsrdapV1::Link::Representation
      
          property :title, as: 'title'
          property :type, as: 'type'
        end
      end
      
      class RdapResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :description, as: 'description'
          property :error_code, as: 'errorCode'
          property :json_response, as: 'jsonResponse', class: Google::Apis::DomainsrdapV1::HttpBody, decorator: Google::Apis::DomainsrdapV1::HttpBody::Representation
      
          property :lang, as: 'lang'
          collection :notices, as: 'notices', class: Google::Apis::DomainsrdapV1::Notice, decorator: Google::Apis::DomainsrdapV1::Notice::Representation
      
          collection :rdap_conformance, as: 'rdapConformance'
          property :title, as: 'title'
        end
      end
    end
  end
end
