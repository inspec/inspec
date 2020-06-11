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
      
      # The expected state of a client's local database.
      class Checksum
        include Google::Apis::Core::Hashable
      
        # The SHA256 hash of the client state; that is, of the sorted list of all
        # hashes present in the database.
        # Corresponds to the JSON property `sha256`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :sha256
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @sha256 = args[:sha256] if args.key?(:sha256)
        end
      end
      
      # The client metadata associated with Safe Browsing API requests.
      class ClientInfo
        include Google::Apis::Core::Hashable
      
        # A client ID that (hopefully) uniquely identifies the client implementation
        # of the Safe Browsing API.
        # Corresponds to the JSON property `clientId`
        # @return [String]
        attr_accessor :client_id
      
        # The version of the client implementation.
        # Corresponds to the JSON property `clientVersion`
        # @return [String]
        attr_accessor :client_version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @client_id = args[:client_id] if args.key?(:client_id)
          @client_version = args[:client_version] if args.key?(:client_version)
        end
      end
      
      # The constraints for this update.
      class Constraints
        include Google::Apis::Core::Hashable
      
        # A client's physical location, expressed as a ISO 31166-1 alpha-2
        # region code.
        # Corresponds to the JSON property `deviceLocation`
        # @return [String]
        attr_accessor :device_location
      
        # Requests the lists for a specific language. Expects ISO 639 alpha-2
        # format.
        # Corresponds to the JSON property `language`
        # @return [String]
        attr_accessor :language
      
        # Sets the maximum number of entries that the client is willing to have
        # in the local database. This should be a power of 2 between 2**10 and
        # 2**20. If zero, no database size limit is set.
        # Corresponds to the JSON property `maxDatabaseEntries`
        # @return [Fixnum]
        attr_accessor :max_database_entries
      
        # The maximum size in number of entries. The update will not contain more
        # entries than this value.  This should be a power of 2 between 2**10 and
        # 2**20.  If zero, no update size limit is set.
        # Corresponds to the JSON property `maxUpdateEntries`
        # @return [Fixnum]
        attr_accessor :max_update_entries
      
        # Requests the list for a specific geographic location. If not set the
        # server may pick that value based on the user's IP address. Expects ISO
        # 3166-1 alpha-2 format.
        # Corresponds to the JSON property `region`
        # @return [String]
        attr_accessor :region
      
        # The compression types supported by the client.
        # Corresponds to the JSON property `supportedCompressions`
        # @return [Array<String>]
        attr_accessor :supported_compressions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @device_location = args[:device_location] if args.key?(:device_location)
          @language = args[:language] if args.key?(:language)
          @max_database_entries = args[:max_database_entries] if args.key?(:max_database_entries)
          @max_update_entries = args[:max_update_entries] if args.key?(:max_update_entries)
          @region = args[:region] if args.key?(:region)
          @supported_compressions = args[:supported_compressions] if args.key?(:supported_compressions)
        end
      end
      
      # A generic empty message that you can re-use to avoid defining duplicated
      # empty messages in your APIs. A typical example is to use it as the request
      # or the response type of an API method. For instance:
      # service Foo `
      # rpc Bar(google.protobuf.Empty) returns (google.protobuf.Empty);
      # `
      # The JSON representation for `Empty` is empty JSON object ````.
      class Empty
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Describes a Safe Browsing API update request. Clients can request updates for
      # multiple lists in a single request.
      # NOTE: Field index 2 is unused.
      # NEXT: 5
      class FetchThreatListUpdatesRequest
        include Google::Apis::Core::Hashable
      
        # The client metadata associated with Safe Browsing API requests.
        # Corresponds to the JSON property `client`
        # @return [Google::Apis::SafebrowsingV4::ClientInfo]
        attr_accessor :client
      
        # The requested threat list updates.
        # Corresponds to the JSON property `listUpdateRequests`
        # @return [Array<Google::Apis::SafebrowsingV4::ListUpdateRequest>]
        attr_accessor :list_update_requests
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @client = args[:client] if args.key?(:client)
          @list_update_requests = args[:list_update_requests] if args.key?(:list_update_requests)
        end
      end
      
      # 
      class FetchThreatListUpdatesResponse
        include Google::Apis::Core::Hashable
      
        # The list updates requested by the clients.
        # Corresponds to the JSON property `listUpdateResponses`
        # @return [Array<Google::Apis::SafebrowsingV4::ListUpdateResponse>]
        attr_accessor :list_update_responses
      
        # The minimum duration the client must wait before issuing any update
        # request. If this field is not set clients may update as soon as they want.
        # Corresponds to the JSON property `minimumWaitDuration`
        # @return [String]
        attr_accessor :minimum_wait_duration
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @list_update_responses = args[:list_update_responses] if args.key?(:list_update_responses)
          @minimum_wait_duration = args[:minimum_wait_duration] if args.key?(:minimum_wait_duration)
        end
      end
      
      # Request to return full hashes matched by the provided hash prefixes.
      class FindFullHashesRequest
        include Google::Apis::Core::Hashable
      
        # The client metadata associated with Safe Browsing API requests.
        # Corresponds to the JSON property `apiClient`
        # @return [Google::Apis::SafebrowsingV4::ClientInfo]
        attr_accessor :api_client
      
        # The client metadata associated with Safe Browsing API requests.
        # Corresponds to the JSON property `client`
        # @return [Google::Apis::SafebrowsingV4::ClientInfo]
        attr_accessor :client
      
        # The current client states for each of the client's local threat lists.
        # Corresponds to the JSON property `clientStates`
        # @return [Array<String>]
        attr_accessor :client_states
      
        # The information regarding one or more threats that a client submits when
        # checking for matches in threat lists.
        # Corresponds to the JSON property `threatInfo`
        # @return [Google::Apis::SafebrowsingV4::ThreatInfo]
        attr_accessor :threat_info
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @api_client = args[:api_client] if args.key?(:api_client)
          @client = args[:client] if args.key?(:client)
          @client_states = args[:client_states] if args.key?(:client_states)
          @threat_info = args[:threat_info] if args.key?(:threat_info)
        end
      end
      
      # 
      class FindFullHashesResponse
        include Google::Apis::Core::Hashable
      
        # The full hashes that matched the requested prefixes.
        # Corresponds to the JSON property `matches`
        # @return [Array<Google::Apis::SafebrowsingV4::ThreatMatch>]
        attr_accessor :matches
      
        # The minimum duration the client must wait before issuing any find hashes
        # request. If this field is not set, clients can issue a request as soon as
        # they want.
        # Corresponds to the JSON property `minimumWaitDuration`
        # @return [String]
        attr_accessor :minimum_wait_duration
      
        # For requested entities that did not match the threat list, how long to
        # cache the response.
        # Corresponds to the JSON property `negativeCacheDuration`
        # @return [String]
        attr_accessor :negative_cache_duration
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @matches = args[:matches] if args.key?(:matches)
          @minimum_wait_duration = args[:minimum_wait_duration] if args.key?(:minimum_wait_duration)
          @negative_cache_duration = args[:negative_cache_duration] if args.key?(:negative_cache_duration)
        end
      end
      
      # Request to check entries against lists.
      class FindThreatMatchesRequest
        include Google::Apis::Core::Hashable
      
        # The client metadata associated with Safe Browsing API requests.
        # Corresponds to the JSON property `client`
        # @return [Google::Apis::SafebrowsingV4::ClientInfo]
        attr_accessor :client
      
        # The information regarding one or more threats that a client submits when
        # checking for matches in threat lists.
        # Corresponds to the JSON property `threatInfo`
        # @return [Google::Apis::SafebrowsingV4::ThreatInfo]
        attr_accessor :threat_info
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @client = args[:client] if args.key?(:client)
          @threat_info = args[:threat_info] if args.key?(:threat_info)
        end
      end
      
      # 
      class FindThreatMatchesResponse
        include Google::Apis::Core::Hashable
      
        # The threat list matches.
        # Corresponds to the JSON property `matches`
        # @return [Array<Google::Apis::SafebrowsingV4::ThreatMatch>]
        attr_accessor :matches
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @matches = args[:matches] if args.key?(:matches)
        end
      end
      
      # 
      class ListThreatListsResponse
        include Google::Apis::Core::Hashable
      
        # The lists available for download by the client.
        # Corresponds to the JSON property `threatLists`
        # @return [Array<Google::Apis::SafebrowsingV4::ThreatListDescriptor>]
        attr_accessor :threat_lists
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @threat_lists = args[:threat_lists] if args.key?(:threat_lists)
        end
      end
      
      # A single list update request.
      class ListUpdateRequest
        include Google::Apis::Core::Hashable
      
        # The constraints for this update.
        # Corresponds to the JSON property `constraints`
        # @return [Google::Apis::SafebrowsingV4::Constraints]
        attr_accessor :constraints
      
        # The type of platform at risk by entries present in the list.
        # Corresponds to the JSON property `platformType`
        # @return [String]
        attr_accessor :platform_type
      
        # The current state of the client for the requested list (the encrypted
        # client state that was received from the last successful list update).
        # Corresponds to the JSON property `state`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :state
      
        # The types of entries present in the list.
        # Corresponds to the JSON property `threatEntryType`
        # @return [String]
        attr_accessor :threat_entry_type
      
        # The type of threat posed by entries present in the list.
        # Corresponds to the JSON property `threatType`
        # @return [String]
        attr_accessor :threat_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @constraints = args[:constraints] if args.key?(:constraints)
          @platform_type = args[:platform_type] if args.key?(:platform_type)
          @state = args[:state] if args.key?(:state)
          @threat_entry_type = args[:threat_entry_type] if args.key?(:threat_entry_type)
          @threat_type = args[:threat_type] if args.key?(:threat_type)
        end
      end
      
      # An update to an individual list.
      class ListUpdateResponse
        include Google::Apis::Core::Hashable
      
        # A set of entries to add to a local threat type's list. Repeated to allow
        # for a combination of compressed and raw data to be sent in a single
        # response.
        # Corresponds to the JSON property `additions`
        # @return [Array<Google::Apis::SafebrowsingV4::ThreatEntrySet>]
        attr_accessor :additions
      
        # The expected state of a client's local database.
        # Corresponds to the JSON property `checksum`
        # @return [Google::Apis::SafebrowsingV4::Checksum]
        attr_accessor :checksum
      
        # The new client state, in encrypted format. Opaque to clients.
        # Corresponds to the JSON property `newClientState`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :new_client_state
      
        # The platform type for which data is returned.
        # Corresponds to the JSON property `platformType`
        # @return [String]
        attr_accessor :platform_type
      
        # A set of entries to remove from a local threat type's list. In practice,
        # this field is empty or contains exactly one ThreatEntrySet.
        # Corresponds to the JSON property `removals`
        # @return [Array<Google::Apis::SafebrowsingV4::ThreatEntrySet>]
        attr_accessor :removals
      
        # The type of response. This may indicate that an action is required by the
        # client when the response is received.
        # Corresponds to the JSON property `responseType`
        # @return [String]
        attr_accessor :response_type
      
        # The format of the threats.
        # Corresponds to the JSON property `threatEntryType`
        # @return [String]
        attr_accessor :threat_entry_type
      
        # The threat type for which data is returned.
        # Corresponds to the JSON property `threatType`
        # @return [String]
        attr_accessor :threat_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @additions = args[:additions] if args.key?(:additions)
          @checksum = args[:checksum] if args.key?(:checksum)
          @new_client_state = args[:new_client_state] if args.key?(:new_client_state)
          @platform_type = args[:platform_type] if args.key?(:platform_type)
          @removals = args[:removals] if args.key?(:removals)
          @response_type = args[:response_type] if args.key?(:response_type)
          @threat_entry_type = args[:threat_entry_type] if args.key?(:threat_entry_type)
          @threat_type = args[:threat_type] if args.key?(:threat_type)
        end
      end
      
      # A single metadata entry.
      class MetadataEntry
        include Google::Apis::Core::Hashable
      
        # The metadata entry key. For JSON requests, the key is base64-encoded.
        # Corresponds to the JSON property `key`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :key
      
        # The metadata entry value. For JSON requests, the value is base64-encoded.
        # Corresponds to the JSON property `value`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @key = args[:key] if args.key?(:key)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # The uncompressed threat entries in hash format of a particular prefix length.
      # Hashes can be anywhere from 4 to 32 bytes in size. A large majority are 4
      # bytes, but some hashes are lengthened if they collide with the hash of a
      # popular URL.
      # Used for sending ThreatEntrySet to clients that do not support compression,
      # or when sending non-4-byte hashes to clients that do support compression.
      class RawHashes
        include Google::Apis::Core::Hashable
      
        # The number of bytes for each prefix encoded below.  This field can be
        # anywhere from 4 (shortest prefix) to 32 (full SHA256 hash).
        # Corresponds to the JSON property `prefixSize`
        # @return [Fixnum]
        attr_accessor :prefix_size
      
        # The hashes, in binary format, concatenated into one long string. Hashes are
        # sorted in lexicographic order. For JSON API users, hashes are
        # base64-encoded.
        # Corresponds to the JSON property `rawHashes`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :raw_hashes
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @prefix_size = args[:prefix_size] if args.key?(:prefix_size)
          @raw_hashes = args[:raw_hashes] if args.key?(:raw_hashes)
        end
      end
      
      # A set of raw indices to remove from a local list.
      class RawIndices
        include Google::Apis::Core::Hashable
      
        # The indices to remove from a lexicographically-sorted local list.
        # Corresponds to the JSON property `indices`
        # @return [Array<Fixnum>]
        attr_accessor :indices
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @indices = args[:indices] if args.key?(:indices)
        end
      end
      
      # The Rice-Golomb encoded data. Used for sending compressed 4-byte hashes or
      # compressed removal indices.
      class RiceDeltaEncoding
        include Google::Apis::Core::Hashable
      
        # The encoded deltas that are encoded using the Golomb-Rice coder.
        # Corresponds to the JSON property `encodedData`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :encoded_data
      
        # The offset of the first entry in the encoded data, or, if only a single
        # integer was encoded, that single integer's value. If the field is empty or
        # missing, assume zero.
        # Corresponds to the JSON property `firstValue`
        # @return [Fixnum]
        attr_accessor :first_value
      
        # The number of entries that are delta encoded in the encoded data. If only a
        # single integer was encoded, this will be zero and the single value will be
        # stored in `first_value`.
        # Corresponds to the JSON property `numEntries`
        # @return [Fixnum]
        attr_accessor :num_entries
      
        # The Golomb-Rice parameter, which is a number between 2 and 28. This field
        # is missing (that is, zero) if `num_entries` is zero.
        # Corresponds to the JSON property `riceParameter`
        # @return [Fixnum]
        attr_accessor :rice_parameter
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @encoded_data = args[:encoded_data] if args.key?(:encoded_data)
          @first_value = args[:first_value] if args.key?(:first_value)
          @num_entries = args[:num_entries] if args.key?(:num_entries)
          @rice_parameter = args[:rice_parameter] if args.key?(:rice_parameter)
        end
      end
      
      # An individual threat; for example, a malicious URL or its hash
      # representation. Only one of these fields should be set.
      class ThreatEntry
        include Google::Apis::Core::Hashable
      
        # The digest of an executable in SHA256 format. The API supports both
        # binary and hex digests. For JSON requests, digests are base64-encoded.
        # Corresponds to the JSON property `digest`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :digest
      
        # A hash prefix, consisting of the most significant 4-32 bytes of a SHA256
        # hash. This field is in binary format. For JSON requests, hashes are
        # base64-encoded.
        # Corresponds to the JSON property `hash`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :hash_prop
      
        # A URL.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @digest = args[:digest] if args.key?(:digest)
          @hash_prop = args[:hash_prop] if args.key?(:hash_prop)
          @url = args[:url] if args.key?(:url)
        end
      end
      
      # The metadata associated with a specific threat entry. The client is expected
      # to know the metadata key/value pairs associated with each threat type.
      class ThreatEntryMetadata
        include Google::Apis::Core::Hashable
      
        # The metadata entries.
        # Corresponds to the JSON property `entries`
        # @return [Array<Google::Apis::SafebrowsingV4::MetadataEntry>]
        attr_accessor :entries
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @entries = args[:entries] if args.key?(:entries)
        end
      end
      
      # A set of threats that should be added or removed from a client's local
      # database.
      class ThreatEntrySet
        include Google::Apis::Core::Hashable
      
        # The compression type for the entries in this set.
        # Corresponds to the JSON property `compressionType`
        # @return [String]
        attr_accessor :compression_type
      
        # The uncompressed threat entries in hash format of a particular prefix length.
        # Hashes can be anywhere from 4 to 32 bytes in size. A large majority are 4
        # bytes, but some hashes are lengthened if they collide with the hash of a
        # popular URL.
        # Used for sending ThreatEntrySet to clients that do not support compression,
        # or when sending non-4-byte hashes to clients that do support compression.
        # Corresponds to the JSON property `rawHashes`
        # @return [Google::Apis::SafebrowsingV4::RawHashes]
        attr_accessor :raw_hashes
      
        # A set of raw indices to remove from a local list.
        # Corresponds to the JSON property `rawIndices`
        # @return [Google::Apis::SafebrowsingV4::RawIndices]
        attr_accessor :raw_indices
      
        # The Rice-Golomb encoded data. Used for sending compressed 4-byte hashes or
        # compressed removal indices.
        # Corresponds to the JSON property `riceHashes`
        # @return [Google::Apis::SafebrowsingV4::RiceDeltaEncoding]
        attr_accessor :rice_hashes
      
        # The Rice-Golomb encoded data. Used for sending compressed 4-byte hashes or
        # compressed removal indices.
        # Corresponds to the JSON property `riceIndices`
        # @return [Google::Apis::SafebrowsingV4::RiceDeltaEncoding]
        attr_accessor :rice_indices
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @compression_type = args[:compression_type] if args.key?(:compression_type)
          @raw_hashes = args[:raw_hashes] if args.key?(:raw_hashes)
          @raw_indices = args[:raw_indices] if args.key?(:raw_indices)
          @rice_hashes = args[:rice_hashes] if args.key?(:rice_hashes)
          @rice_indices = args[:rice_indices] if args.key?(:rice_indices)
        end
      end
      
      # 
      class ThreatHit
        include Google::Apis::Core::Hashable
      
        # The client metadata associated with Safe Browsing API requests.
        # Corresponds to the JSON property `clientInfo`
        # @return [Google::Apis::SafebrowsingV4::ClientInfo]
        attr_accessor :client_info
      
        # An individual threat; for example, a malicious URL or its hash
        # representation. Only one of these fields should be set.
        # Corresponds to the JSON property `entry`
        # @return [Google::Apis::SafebrowsingV4::ThreatEntry]
        attr_accessor :entry
      
        # The platform type reported.
        # Corresponds to the JSON property `platformType`
        # @return [String]
        attr_accessor :platform_type
      
        # The resources related to the threat hit.
        # Corresponds to the JSON property `resources`
        # @return [Array<Google::Apis::SafebrowsingV4::ThreatSource>]
        attr_accessor :resources
      
        # The threat type reported.
        # Corresponds to the JSON property `threatType`
        # @return [String]
        attr_accessor :threat_type
      
        # Details about the user that encountered the threat.
        # Corresponds to the JSON property `userInfo`
        # @return [Google::Apis::SafebrowsingV4::UserInfo]
        attr_accessor :user_info
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @client_info = args[:client_info] if args.key?(:client_info)
          @entry = args[:entry] if args.key?(:entry)
          @platform_type = args[:platform_type] if args.key?(:platform_type)
          @resources = args[:resources] if args.key?(:resources)
          @threat_type = args[:threat_type] if args.key?(:threat_type)
          @user_info = args[:user_info] if args.key?(:user_info)
        end
      end
      
      # The information regarding one or more threats that a client submits when
      # checking for matches in threat lists.
      class ThreatInfo
        include Google::Apis::Core::Hashable
      
        # The platform types to be checked.
        # Corresponds to the JSON property `platformTypes`
        # @return [Array<String>]
        attr_accessor :platform_types
      
        # The threat entries to be checked.
        # Corresponds to the JSON property `threatEntries`
        # @return [Array<Google::Apis::SafebrowsingV4::ThreatEntry>]
        attr_accessor :threat_entries
      
        # The entry types to be checked.
        # Corresponds to the JSON property `threatEntryTypes`
        # @return [Array<String>]
        attr_accessor :threat_entry_types
      
        # The threat types to be checked.
        # Corresponds to the JSON property `threatTypes`
        # @return [Array<String>]
        attr_accessor :threat_types
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @platform_types = args[:platform_types] if args.key?(:platform_types)
          @threat_entries = args[:threat_entries] if args.key?(:threat_entries)
          @threat_entry_types = args[:threat_entry_types] if args.key?(:threat_entry_types)
          @threat_types = args[:threat_types] if args.key?(:threat_types)
        end
      end
      
      # Describes an individual threat list. A list is defined by three parameters:
      # the type of threat posed, the type of platform targeted by the threat, and
      # the type of entries in the list.
      class ThreatListDescriptor
        include Google::Apis::Core::Hashable
      
        # The platform type targeted by the list's entries.
        # Corresponds to the JSON property `platformType`
        # @return [String]
        attr_accessor :platform_type
      
        # The entry types contained in the list.
        # Corresponds to the JSON property `threatEntryType`
        # @return [String]
        attr_accessor :threat_entry_type
      
        # The threat type posed by the list's entries.
        # Corresponds to the JSON property `threatType`
        # @return [String]
        attr_accessor :threat_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @platform_type = args[:platform_type] if args.key?(:platform_type)
          @threat_entry_type = args[:threat_entry_type] if args.key?(:threat_entry_type)
          @threat_type = args[:threat_type] if args.key?(:threat_type)
        end
      end
      
      # A match when checking a threat entry in the Safe Browsing threat lists.
      class ThreatMatch
        include Google::Apis::Core::Hashable
      
        # The cache lifetime for the returned match. Clients must not cache this
        # response for more than this duration to avoid false positives.
        # Corresponds to the JSON property `cacheDuration`
        # @return [String]
        attr_accessor :cache_duration
      
        # The platform type matching this threat.
        # Corresponds to the JSON property `platformType`
        # @return [String]
        attr_accessor :platform_type
      
        # An individual threat; for example, a malicious URL or its hash
        # representation. Only one of these fields should be set.
        # Corresponds to the JSON property `threat`
        # @return [Google::Apis::SafebrowsingV4::ThreatEntry]
        attr_accessor :threat
      
        # The metadata associated with a specific threat entry. The client is expected
        # to know the metadata key/value pairs associated with each threat type.
        # Corresponds to the JSON property `threatEntryMetadata`
        # @return [Google::Apis::SafebrowsingV4::ThreatEntryMetadata]
        attr_accessor :threat_entry_metadata
      
        # The threat entry type matching this threat.
        # Corresponds to the JSON property `threatEntryType`
        # @return [String]
        attr_accessor :threat_entry_type
      
        # The threat type matching this threat.
        # Corresponds to the JSON property `threatType`
        # @return [String]
        attr_accessor :threat_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cache_duration = args[:cache_duration] if args.key?(:cache_duration)
          @platform_type = args[:platform_type] if args.key?(:platform_type)
          @threat = args[:threat] if args.key?(:threat)
          @threat_entry_metadata = args[:threat_entry_metadata] if args.key?(:threat_entry_metadata)
          @threat_entry_type = args[:threat_entry_type] if args.key?(:threat_entry_type)
          @threat_type = args[:threat_type] if args.key?(:threat_type)
        end
      end
      
      # A single resource related to a threat hit.
      class ThreatSource
        include Google::Apis::Core::Hashable
      
        # Referrer of the resource. Only set if the referrer is available.
        # Corresponds to the JSON property `referrer`
        # @return [String]
        attr_accessor :referrer
      
        # The remote IP of the resource in ASCII format. Either IPv4 or IPv6.
        # Corresponds to the JSON property `remoteIp`
        # @return [String]
        attr_accessor :remote_ip
      
        # The type of source reported.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # The URL of the resource.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @referrer = args[:referrer] if args.key?(:referrer)
          @remote_ip = args[:remote_ip] if args.key?(:remote_ip)
          @type = args[:type] if args.key?(:type)
          @url = args[:url] if args.key?(:url)
        end
      end
      
      # Details about the user that encountered the threat.
      class UserInfo
        include Google::Apis::Core::Hashable
      
        # The UN M.49 region code associated with the user's location.
        # Corresponds to the JSON property `regionCode`
        # @return [String]
        attr_accessor :region_code
      
        # Unique user identifier defined by the client.
        # Corresponds to the JSON property `userId`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :user_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @region_code = args[:region_code] if args.key?(:region_code)
          @user_id = args[:user_id] if args.key?(:user_id)
        end
      end
    end
  end
end
