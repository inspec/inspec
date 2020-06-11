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
    module DigitalassetlinksV1
      
      class AndroidAppAsset
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Asset
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CertificateInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CheckResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Statement
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WebAsset
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AndroidAppAsset
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :certificate, as: 'certificate', class: Google::Apis::DigitalassetlinksV1::CertificateInfo, decorator: Google::Apis::DigitalassetlinksV1::CertificateInfo::Representation
      
          property :package_name, as: 'packageName'
        end
      end
      
      class Asset
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :android_app, as: 'androidApp', class: Google::Apis::DigitalassetlinksV1::AndroidAppAsset, decorator: Google::Apis::DigitalassetlinksV1::AndroidAppAsset::Representation
      
          property :web, as: 'web', class: Google::Apis::DigitalassetlinksV1::WebAsset, decorator: Google::Apis::DigitalassetlinksV1::WebAsset::Representation
      
        end
      end
      
      class CertificateInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :sha256_fingerprint, as: 'sha256Fingerprint'
        end
      end
      
      class CheckResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :debug_string, as: 'debugString'
          collection :error_code, as: 'errorCode'
          property :linked, as: 'linked'
          property :max_age, as: 'maxAge'
        end
      end
      
      class ListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :debug_string, as: 'debugString'
          collection :error_code, as: 'errorCode'
          property :max_age, as: 'maxAge'
          collection :statements, as: 'statements', class: Google::Apis::DigitalassetlinksV1::Statement, decorator: Google::Apis::DigitalassetlinksV1::Statement::Representation
      
        end
      end
      
      class Statement
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :relation, as: 'relation'
          property :source, as: 'source', class: Google::Apis::DigitalassetlinksV1::Asset, decorator: Google::Apis::DigitalassetlinksV1::Asset::Representation
      
          property :target, as: 'target', class: Google::Apis::DigitalassetlinksV1::Asset, decorator: Google::Apis::DigitalassetlinksV1::Asset::Representation
      
        end
      end
      
      class WebAsset
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :site, as: 'site'
        end
      end
    end
  end
end
