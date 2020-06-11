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
    module SafebrowsingV4
      
      class Checksum
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ClientInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Constraints
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Empty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FetchThreatListUpdatesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FetchThreatListUpdatesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FindFullHashesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FindFullHashesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FindThreatMatchesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FindThreatMatchesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListThreatListsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListUpdateRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListUpdateResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MetadataEntry
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RawHashes
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RawIndices
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RiceDeltaEncoding
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ThreatEntry
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ThreatEntryMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ThreatEntrySet
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ThreatHit
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ThreatInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ThreatListDescriptor
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ThreatMatch
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ThreatSource
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UserInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Checksum
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :sha256, :base64 => true, as: 'sha256'
        end
      end
      
      class ClientInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :client_id, as: 'clientId'
          property :client_version, as: 'clientVersion'
        end
      end
      
      class Constraints
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :device_location, as: 'deviceLocation'
          property :language, as: 'language'
          property :max_database_entries, as: 'maxDatabaseEntries'
          property :max_update_entries, as: 'maxUpdateEntries'
          property :region, as: 'region'
          collection :supported_compressions, as: 'supportedCompressions'
        end
      end
      
      class Empty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class FetchThreatListUpdatesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :client, as: 'client', class: Google::Apis::SafebrowsingV4::ClientInfo, decorator: Google::Apis::SafebrowsingV4::ClientInfo::Representation
      
          collection :list_update_requests, as: 'listUpdateRequests', class: Google::Apis::SafebrowsingV4::ListUpdateRequest, decorator: Google::Apis::SafebrowsingV4::ListUpdateRequest::Representation
      
        end
      end
      
      class FetchThreatListUpdatesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :list_update_responses, as: 'listUpdateResponses', class: Google::Apis::SafebrowsingV4::ListUpdateResponse, decorator: Google::Apis::SafebrowsingV4::ListUpdateResponse::Representation
      
          property :minimum_wait_duration, as: 'minimumWaitDuration'
        end
      end
      
      class FindFullHashesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :api_client, as: 'apiClient', class: Google::Apis::SafebrowsingV4::ClientInfo, decorator: Google::Apis::SafebrowsingV4::ClientInfo::Representation
      
          property :client, as: 'client', class: Google::Apis::SafebrowsingV4::ClientInfo, decorator: Google::Apis::SafebrowsingV4::ClientInfo::Representation
      
          collection :client_states, as: 'clientStates'
          property :threat_info, as: 'threatInfo', class: Google::Apis::SafebrowsingV4::ThreatInfo, decorator: Google::Apis::SafebrowsingV4::ThreatInfo::Representation
      
        end
      end
      
      class FindFullHashesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :matches, as: 'matches', class: Google::Apis::SafebrowsingV4::ThreatMatch, decorator: Google::Apis::SafebrowsingV4::ThreatMatch::Representation
      
          property :minimum_wait_duration, as: 'minimumWaitDuration'
          property :negative_cache_duration, as: 'negativeCacheDuration'
        end
      end
      
      class FindThreatMatchesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :client, as: 'client', class: Google::Apis::SafebrowsingV4::ClientInfo, decorator: Google::Apis::SafebrowsingV4::ClientInfo::Representation
      
          property :threat_info, as: 'threatInfo', class: Google::Apis::SafebrowsingV4::ThreatInfo, decorator: Google::Apis::SafebrowsingV4::ThreatInfo::Representation
      
        end
      end
      
      class FindThreatMatchesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :matches, as: 'matches', class: Google::Apis::SafebrowsingV4::ThreatMatch, decorator: Google::Apis::SafebrowsingV4::ThreatMatch::Representation
      
        end
      end
      
      class ListThreatListsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :threat_lists, as: 'threatLists', class: Google::Apis::SafebrowsingV4::ThreatListDescriptor, decorator: Google::Apis::SafebrowsingV4::ThreatListDescriptor::Representation
      
        end
      end
      
      class ListUpdateRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :constraints, as: 'constraints', class: Google::Apis::SafebrowsingV4::Constraints, decorator: Google::Apis::SafebrowsingV4::Constraints::Representation
      
          property :platform_type, as: 'platformType'
          property :state, :base64 => true, as: 'state'
          property :threat_entry_type, as: 'threatEntryType'
          property :threat_type, as: 'threatType'
        end
      end
      
      class ListUpdateResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :additions, as: 'additions', class: Google::Apis::SafebrowsingV4::ThreatEntrySet, decorator: Google::Apis::SafebrowsingV4::ThreatEntrySet::Representation
      
          property :checksum, as: 'checksum', class: Google::Apis::SafebrowsingV4::Checksum, decorator: Google::Apis::SafebrowsingV4::Checksum::Representation
      
          property :new_client_state, :base64 => true, as: 'newClientState'
          property :platform_type, as: 'platformType'
          collection :removals, as: 'removals', class: Google::Apis::SafebrowsingV4::ThreatEntrySet, decorator: Google::Apis::SafebrowsingV4::ThreatEntrySet::Representation
      
          property :response_type, as: 'responseType'
          property :threat_entry_type, as: 'threatEntryType'
          property :threat_type, as: 'threatType'
        end
      end
      
      class MetadataEntry
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :key, :base64 => true, as: 'key'
          property :value, :base64 => true, as: 'value'
        end
      end
      
      class RawHashes
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :prefix_size, as: 'prefixSize'
          property :raw_hashes, :base64 => true, as: 'rawHashes'
        end
      end
      
      class RawIndices
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :indices, as: 'indices'
        end
      end
      
      class RiceDeltaEncoding
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :encoded_data, :base64 => true, as: 'encodedData'
          property :first_value, :numeric_string => true, as: 'firstValue'
          property :num_entries, as: 'numEntries'
          property :rice_parameter, as: 'riceParameter'
        end
      end
      
      class ThreatEntry
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :digest, :base64 => true, as: 'digest'
          property :hash_prop, :base64 => true, as: 'hash'
          property :url, as: 'url'
        end
      end
      
      class ThreatEntryMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :entries, as: 'entries', class: Google::Apis::SafebrowsingV4::MetadataEntry, decorator: Google::Apis::SafebrowsingV4::MetadataEntry::Representation
      
        end
      end
      
      class ThreatEntrySet
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :compression_type, as: 'compressionType'
          property :raw_hashes, as: 'rawHashes', class: Google::Apis::SafebrowsingV4::RawHashes, decorator: Google::Apis::SafebrowsingV4::RawHashes::Representation
      
          property :raw_indices, as: 'rawIndices', class: Google::Apis::SafebrowsingV4::RawIndices, decorator: Google::Apis::SafebrowsingV4::RawIndices::Representation
      
          property :rice_hashes, as: 'riceHashes', class: Google::Apis::SafebrowsingV4::RiceDeltaEncoding, decorator: Google::Apis::SafebrowsingV4::RiceDeltaEncoding::Representation
      
          property :rice_indices, as: 'riceIndices', class: Google::Apis::SafebrowsingV4::RiceDeltaEncoding, decorator: Google::Apis::SafebrowsingV4::RiceDeltaEncoding::Representation
      
        end
      end
      
      class ThreatHit
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :client_info, as: 'clientInfo', class: Google::Apis::SafebrowsingV4::ClientInfo, decorator: Google::Apis::SafebrowsingV4::ClientInfo::Representation
      
          property :entry, as: 'entry', class: Google::Apis::SafebrowsingV4::ThreatEntry, decorator: Google::Apis::SafebrowsingV4::ThreatEntry::Representation
      
          property :platform_type, as: 'platformType'
          collection :resources, as: 'resources', class: Google::Apis::SafebrowsingV4::ThreatSource, decorator: Google::Apis::SafebrowsingV4::ThreatSource::Representation
      
          property :threat_type, as: 'threatType'
          property :user_info, as: 'userInfo', class: Google::Apis::SafebrowsingV4::UserInfo, decorator: Google::Apis::SafebrowsingV4::UserInfo::Representation
      
        end
      end
      
      class ThreatInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :platform_types, as: 'platformTypes'
          collection :threat_entries, as: 'threatEntries', class: Google::Apis::SafebrowsingV4::ThreatEntry, decorator: Google::Apis::SafebrowsingV4::ThreatEntry::Representation
      
          collection :threat_entry_types, as: 'threatEntryTypes'
          collection :threat_types, as: 'threatTypes'
        end
      end
      
      class ThreatListDescriptor
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :platform_type, as: 'platformType'
          property :threat_entry_type, as: 'threatEntryType'
          property :threat_type, as: 'threatType'
        end
      end
      
      class ThreatMatch
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cache_duration, as: 'cacheDuration'
          property :platform_type, as: 'platformType'
          property :threat, as: 'threat', class: Google::Apis::SafebrowsingV4::ThreatEntry, decorator: Google::Apis::SafebrowsingV4::ThreatEntry::Representation
      
          property :threat_entry_metadata, as: 'threatEntryMetadata', class: Google::Apis::SafebrowsingV4::ThreatEntryMetadata, decorator: Google::Apis::SafebrowsingV4::ThreatEntryMetadata::Representation
      
          property :threat_entry_type, as: 'threatEntryType'
          property :threat_type, as: 'threatType'
        end
      end
      
      class ThreatSource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :referrer, as: 'referrer'
          property :remote_ip, as: 'remoteIp'
          property :type, as: 'type'
          property :url, as: 'url'
        end
      end
      
      class UserInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :region_code, as: 'regionCode'
          property :user_id, :base64 => true, as: 'userId'
        end
      end
    end
  end
end
