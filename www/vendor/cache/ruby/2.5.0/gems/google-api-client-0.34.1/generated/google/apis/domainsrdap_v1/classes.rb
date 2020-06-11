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
      
      # Message that represents an arbitrary HTTP body. It should only be used for
      # payload formats that can't be represented as JSON, such as raw binary or
      # an HTML page.
      # This message can be used both in streaming and non-streaming API methods in
      # the request as well as the response.
      # It can be used as a top-level request field, which is convenient if one
      # wants to extract parameters from either the URL or HTTP template into the
      # request fields and also want access to the raw HTTP body.
      # Example:
      # message GetResourceRequest `
      # // A unique request id.
      # string request_id = 1;
      # // The raw HTTP body is bound to this field.
      # google.api.HttpBody http_body = 2;
      # `
      # service ResourceService `
      # rpc GetResource(GetResourceRequest) returns (google.api.HttpBody);
      # rpc UpdateResource(google.api.HttpBody) returns
      # (google.protobuf.Empty);
      # `
      # Example with streaming methods:
      # service CaldavService `
      # rpc GetCalendar(stream google.api.HttpBody)
      # returns (stream google.api.HttpBody);
      # rpc UpdateCalendar(stream google.api.HttpBody)
      # returns (stream google.api.HttpBody);
      # `
      # Use of this type only changes how the request and response bodies are
      # handled, all other features will continue to work unchanged.
      class HttpBody
        include Google::Apis::Core::Hashable
      
        # The HTTP Content-Type header value specifying the content type of the body.
        # Corresponds to the JSON property `contentType`
        # @return [String]
        attr_accessor :content_type
      
        # The HTTP request/response body as raw binary.
        # Corresponds to the JSON property `data`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :data
      
        # Application specific response metadata. Must be set in the first response
        # for streaming APIs.
        # Corresponds to the JSON property `extensions`
        # @return [Array<Hash<String,Object>>]
        attr_accessor :extensions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content_type = args[:content_type] if args.key?(:content_type)
          @data = args[:data] if args.key?(:data)
          @extensions = args[:extensions] if args.key?(:extensions)
        end
      end
      
      # Links object defined in [section 4.2 of RFC
      # 7483](https://tools.ietf.org/html/rfc7483#section-4.2).
      class Link
        include Google::Apis::Core::Hashable
      
        # Target URL of a link. Example: "http://example.com/previous".
        # Corresponds to the JSON property `href`
        # @return [String]
        attr_accessor :href
      
        # Language code of a link. Example: "en".
        # Corresponds to the JSON property `hreflang`
        # @return [String]
        attr_accessor :hreflang
      
        # Media type of the link destination. Example: "screen".
        # Corresponds to the JSON property `media`
        # @return [String]
        attr_accessor :media
      
        # Relation type of a link. Example: "previous".
        # Corresponds to the JSON property `rel`
        # @return [String]
        attr_accessor :rel
      
        # Title of this link. Example: "title".
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        # Content type of the link. Example: "application/json".
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # URL giving context for the link. Example: "http://example.com/current".
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @href = args[:href] if args.key?(:href)
          @hreflang = args[:hreflang] if args.key?(:hreflang)
          @media = args[:media] if args.key?(:media)
          @rel = args[:rel] if args.key?(:rel)
          @title = args[:title] if args.key?(:title)
          @type = args[:type] if args.key?(:type)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # Notices object defined in [section 4.3 of RFC
      # 7483](https://tools.ietf.org/html/rfc7483#section-4.3).
      class Notice
        include Google::Apis::Core::Hashable
      
        # Description of the notice.
        # Corresponds to the JSON property `description`
        # @return [Array<String>]
        attr_accessor :description
      
        # Link to a document containing more information.
        # Corresponds to the JSON property `links`
        # @return [Array<Google::Apis::DomainsrdapV1::Link>]
        attr_accessor :links
      
        # Title of a notice. Example: "Terms of Service".
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        # Type values defined in [section 10.2.1 of RFC
        # 7483](https://tools.ietf.org/html/rfc7483#section-10.2.1) specific to a
        # whole response: "result set truncated due to authorization", "result set
        # truncated due to excessive load", "result set truncated due to
        # unexplainable reasons".
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @links = args[:links] if args.key?(:links)
          @title = args[:title] if args.key?(:title)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Response to a general RDAP query.
      class RdapResponse
        include Google::Apis::Core::Hashable
      
        # Error description.
        # Corresponds to the JSON property `description`
        # @return [Array<String>]
        attr_accessor :description
      
        # Error HTTP code. Example: "501".
        # Corresponds to the JSON property `errorCode`
        # @return [Fixnum]
        attr_accessor :error_code
      
        # Message that represents an arbitrary HTTP body. It should only be used for
        # payload formats that can't be represented as JSON, such as raw binary or
        # an HTML page.
        # This message can be used both in streaming and non-streaming API methods in
        # the request as well as the response.
        # It can be used as a top-level request field, which is convenient if one
        # wants to extract parameters from either the URL or HTTP template into the
        # request fields and also want access to the raw HTTP body.
        # Example:
        # message GetResourceRequest `
        # // A unique request id.
        # string request_id = 1;
        # // The raw HTTP body is bound to this field.
        # google.api.HttpBody http_body = 2;
        # `
        # service ResourceService `
        # rpc GetResource(GetResourceRequest) returns (google.api.HttpBody);
        # rpc UpdateResource(google.api.HttpBody) returns
        # (google.protobuf.Empty);
        # `
        # Example with streaming methods:
        # service CaldavService `
        # rpc GetCalendar(stream google.api.HttpBody)
        # returns (stream google.api.HttpBody);
        # rpc UpdateCalendar(stream google.api.HttpBody)
        # returns (stream google.api.HttpBody);
        # `
        # Use of this type only changes how the request and response bodies are
        # handled, all other features will continue to work unchanged.
        # Corresponds to the JSON property `jsonResponse`
        # @return [Google::Apis::DomainsrdapV1::HttpBody]
        attr_accessor :json_response
      
        # Error language code. Error response info fields are defined in [section 6
        # of RFC 7483](https://tools.ietf.org/html/rfc7483#section-6).
        # Corresponds to the JSON property `lang`
        # @return [String]
        attr_accessor :lang
      
        # Notices applying to this response.
        # Corresponds to the JSON property `notices`
        # @return [Array<Google::Apis::DomainsrdapV1::Notice>]
        attr_accessor :notices
      
        # RDAP conformance level.
        # Corresponds to the JSON property `rdapConformance`
        # @return [Array<String>]
        attr_accessor :rdap_conformance
      
        # Error title.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @error_code = args[:error_code] if args.key?(:error_code)
          @json_response = args[:json_response] if args.key?(:json_response)
          @lang = args[:lang] if args.key?(:lang)
          @notices = args[:notices] if args.key?(:notices)
          @rdap_conformance = args[:rdap_conformance] if args.key?(:rdap_conformance)
          @title = args[:title] if args.key?(:title)
        end
      end
    end
  end
end
