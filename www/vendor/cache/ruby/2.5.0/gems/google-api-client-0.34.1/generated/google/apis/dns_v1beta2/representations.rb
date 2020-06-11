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
    module DnsV1beta2
      
      class Change
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ChangesListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DnsKey
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DnsKeyDigest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DnsKeySpec
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DnsKeysListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ManagedZone
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ManagedZoneDnsSecConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ManagedZoneForwardingConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ManagedZoneForwardingConfigNameServerTarget
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ManagedZoneOperationsListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ManagedZonePeeringConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ManagedZonePeeringConfigTargetNetwork
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ManagedZonePrivateVisibilityConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ManagedZonePrivateVisibilityConfigNetwork
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ManagedZonesListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Operation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OperationDnsKeyContext
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OperationManagedZoneContext
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PoliciesListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PoliciesPatchResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PoliciesUpdateResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Policy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PolicyAlternativeNameServerConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PolicyAlternativeNameServerConfigTargetNameServer
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PolicyNetwork
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Project
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Quota
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ResourceRecordSet
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ResourceRecordSetsListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ResponseHeader
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Change
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :additions, as: 'additions', class: Google::Apis::DnsV1beta2::ResourceRecordSet, decorator: Google::Apis::DnsV1beta2::ResourceRecordSet::Representation
      
          collection :deletions, as: 'deletions', class: Google::Apis::DnsV1beta2::ResourceRecordSet, decorator: Google::Apis::DnsV1beta2::ResourceRecordSet::Representation
      
          property :id, as: 'id'
          property :is_serving, as: 'isServing'
          property :kind, as: 'kind'
          property :start_time, as: 'startTime'
          property :status, as: 'status'
        end
      end
      
      class ChangesListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :changes, as: 'changes', class: Google::Apis::DnsV1beta2::Change, decorator: Google::Apis::DnsV1beta2::Change::Representation
      
          property :header, as: 'header', class: Google::Apis::DnsV1beta2::ResponseHeader, decorator: Google::Apis::DnsV1beta2::ResponseHeader::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class DnsKey
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :algorithm, as: 'algorithm'
          property :creation_time, as: 'creationTime'
          property :description, as: 'description'
          collection :digests, as: 'digests', class: Google::Apis::DnsV1beta2::DnsKeyDigest, decorator: Google::Apis::DnsV1beta2::DnsKeyDigest::Representation
      
          property :id, as: 'id'
          property :is_active, as: 'isActive'
          property :key_length, as: 'keyLength'
          property :key_tag, as: 'keyTag'
          property :kind, as: 'kind'
          property :public_key, as: 'publicKey'
          property :type, as: 'type'
        end
      end
      
      class DnsKeyDigest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :digest, as: 'digest'
          property :type, as: 'type'
        end
      end
      
      class DnsKeySpec
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :algorithm, as: 'algorithm'
          property :key_length, as: 'keyLength'
          property :key_type, as: 'keyType'
          property :kind, as: 'kind'
        end
      end
      
      class DnsKeysListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :dns_keys, as: 'dnsKeys', class: Google::Apis::DnsV1beta2::DnsKey, decorator: Google::Apis::DnsV1beta2::DnsKey::Representation
      
          property :header, as: 'header', class: Google::Apis::DnsV1beta2::ResponseHeader, decorator: Google::Apis::DnsV1beta2::ResponseHeader::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ManagedZone
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creation_time, as: 'creationTime'
          property :description, as: 'description'
          property :dns_name, as: 'dnsName'
          property :dnssec_config, as: 'dnssecConfig', class: Google::Apis::DnsV1beta2::ManagedZoneDnsSecConfig, decorator: Google::Apis::DnsV1beta2::ManagedZoneDnsSecConfig::Representation
      
          property :forwarding_config, as: 'forwardingConfig', class: Google::Apis::DnsV1beta2::ManagedZoneForwardingConfig, decorator: Google::Apis::DnsV1beta2::ManagedZoneForwardingConfig::Representation
      
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          hash :labels, as: 'labels'
          property :name, as: 'name'
          property :name_server_set, as: 'nameServerSet'
          collection :name_servers, as: 'nameServers'
          property :peering_config, as: 'peeringConfig', class: Google::Apis::DnsV1beta2::ManagedZonePeeringConfig, decorator: Google::Apis::DnsV1beta2::ManagedZonePeeringConfig::Representation
      
          property :private_visibility_config, as: 'privateVisibilityConfig', class: Google::Apis::DnsV1beta2::ManagedZonePrivateVisibilityConfig, decorator: Google::Apis::DnsV1beta2::ManagedZonePrivateVisibilityConfig::Representation
      
          property :visibility, as: 'visibility'
        end
      end
      
      class ManagedZoneDnsSecConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :default_key_specs, as: 'defaultKeySpecs', class: Google::Apis::DnsV1beta2::DnsKeySpec, decorator: Google::Apis::DnsV1beta2::DnsKeySpec::Representation
      
          property :kind, as: 'kind'
          property :non_existence, as: 'nonExistence'
          property :state, as: 'state'
        end
      end
      
      class ManagedZoneForwardingConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          collection :target_name_servers, as: 'targetNameServers', class: Google::Apis::DnsV1beta2::ManagedZoneForwardingConfigNameServerTarget, decorator: Google::Apis::DnsV1beta2::ManagedZoneForwardingConfigNameServerTarget::Representation
      
        end
      end
      
      class ManagedZoneForwardingConfigNameServerTarget
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :ipv4_address, as: 'ipv4Address'
          property :kind, as: 'kind'
        end
      end
      
      class ManagedZoneOperationsListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :header, as: 'header', class: Google::Apis::DnsV1beta2::ResponseHeader, decorator: Google::Apis::DnsV1beta2::ResponseHeader::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          collection :operations, as: 'operations', class: Google::Apis::DnsV1beta2::Operation, decorator: Google::Apis::DnsV1beta2::Operation::Representation
      
        end
      end
      
      class ManagedZonePeeringConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :target_network, as: 'targetNetwork', class: Google::Apis::DnsV1beta2::ManagedZonePeeringConfigTargetNetwork, decorator: Google::Apis::DnsV1beta2::ManagedZonePeeringConfigTargetNetwork::Representation
      
        end
      end
      
      class ManagedZonePeeringConfigTargetNetwork
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :deactivate_time, as: 'deactivateTime'
          property :kind, as: 'kind'
          property :network_url, as: 'networkUrl'
        end
      end
      
      class ManagedZonePrivateVisibilityConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          collection :networks, as: 'networks', class: Google::Apis::DnsV1beta2::ManagedZonePrivateVisibilityConfigNetwork, decorator: Google::Apis::DnsV1beta2::ManagedZonePrivateVisibilityConfigNetwork::Representation
      
        end
      end
      
      class ManagedZonePrivateVisibilityConfigNetwork
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :network_url, as: 'networkUrl'
        end
      end
      
      class ManagedZonesListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :header, as: 'header', class: Google::Apis::DnsV1beta2::ResponseHeader, decorator: Google::Apis::DnsV1beta2::ResponseHeader::Representation
      
          property :kind, as: 'kind'
          collection :managed_zones, as: 'managedZones', class: Google::Apis::DnsV1beta2::ManagedZone, decorator: Google::Apis::DnsV1beta2::ManagedZone::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class Operation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :dns_key_context, as: 'dnsKeyContext', class: Google::Apis::DnsV1beta2::OperationDnsKeyContext, decorator: Google::Apis::DnsV1beta2::OperationDnsKeyContext::Representation
      
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :start_time, as: 'startTime'
          property :status, as: 'status'
          property :type, as: 'type'
          property :user, as: 'user'
          property :zone_context, as: 'zoneContext', class: Google::Apis::DnsV1beta2::OperationManagedZoneContext, decorator: Google::Apis::DnsV1beta2::OperationManagedZoneContext::Representation
      
        end
      end
      
      class OperationDnsKeyContext
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :new_value, as: 'newValue', class: Google::Apis::DnsV1beta2::DnsKey, decorator: Google::Apis::DnsV1beta2::DnsKey::Representation
      
          property :old_value, as: 'oldValue', class: Google::Apis::DnsV1beta2::DnsKey, decorator: Google::Apis::DnsV1beta2::DnsKey::Representation
      
        end
      end
      
      class OperationManagedZoneContext
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :new_value, as: 'newValue', class: Google::Apis::DnsV1beta2::ManagedZone, decorator: Google::Apis::DnsV1beta2::ManagedZone::Representation
      
          property :old_value, as: 'oldValue', class: Google::Apis::DnsV1beta2::ManagedZone, decorator: Google::Apis::DnsV1beta2::ManagedZone::Representation
      
        end
      end
      
      class PoliciesListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :header, as: 'header', class: Google::Apis::DnsV1beta2::ResponseHeader, decorator: Google::Apis::DnsV1beta2::ResponseHeader::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          collection :policies, as: 'policies', class: Google::Apis::DnsV1beta2::Policy, decorator: Google::Apis::DnsV1beta2::Policy::Representation
      
        end
      end
      
      class PoliciesPatchResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :header, as: 'header', class: Google::Apis::DnsV1beta2::ResponseHeader, decorator: Google::Apis::DnsV1beta2::ResponseHeader::Representation
      
          property :policy, as: 'policy', class: Google::Apis::DnsV1beta2::Policy, decorator: Google::Apis::DnsV1beta2::Policy::Representation
      
        end
      end
      
      class PoliciesUpdateResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :header, as: 'header', class: Google::Apis::DnsV1beta2::ResponseHeader, decorator: Google::Apis::DnsV1beta2::ResponseHeader::Representation
      
          property :policy, as: 'policy', class: Google::Apis::DnsV1beta2::Policy, decorator: Google::Apis::DnsV1beta2::Policy::Representation
      
        end
      end
      
      class Policy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :alternative_name_server_config, as: 'alternativeNameServerConfig', class: Google::Apis::DnsV1beta2::PolicyAlternativeNameServerConfig, decorator: Google::Apis::DnsV1beta2::PolicyAlternativeNameServerConfig::Representation
      
          property :description, as: 'description'
          property :enable_inbound_forwarding, as: 'enableInboundForwarding'
          property :enable_logging, as: 'enableLogging'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          collection :networks, as: 'networks', class: Google::Apis::DnsV1beta2::PolicyNetwork, decorator: Google::Apis::DnsV1beta2::PolicyNetwork::Representation
      
        end
      end
      
      class PolicyAlternativeNameServerConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          collection :target_name_servers, as: 'targetNameServers', class: Google::Apis::DnsV1beta2::PolicyAlternativeNameServerConfigTargetNameServer, decorator: Google::Apis::DnsV1beta2::PolicyAlternativeNameServerConfigTargetNameServer::Representation
      
        end
      end
      
      class PolicyAlternativeNameServerConfigTargetNameServer
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :ipv4_address, as: 'ipv4Address'
          property :kind, as: 'kind'
        end
      end
      
      class PolicyNetwork
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :network_url, as: 'networkUrl'
        end
      end
      
      class Project
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :number, :numeric_string => true, as: 'number'
          property :quota, as: 'quota', class: Google::Apis::DnsV1beta2::Quota, decorator: Google::Apis::DnsV1beta2::Quota::Representation
      
        end
      end
      
      class Quota
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :dns_keys_per_managed_zone, as: 'dnsKeysPerManagedZone'
          property :kind, as: 'kind'
          property :managed_zones, as: 'managedZones'
          property :managed_zones_per_network, as: 'managedZonesPerNetwork'
          property :networks_per_managed_zone, as: 'networksPerManagedZone'
          property :networks_per_policy, as: 'networksPerPolicy'
          property :policies, as: 'policies'
          property :resource_records_per_rrset, as: 'resourceRecordsPerRrset'
          property :rrset_additions_per_change, as: 'rrsetAdditionsPerChange'
          property :rrset_deletions_per_change, as: 'rrsetDeletionsPerChange'
          property :rrsets_per_managed_zone, as: 'rrsetsPerManagedZone'
          property :target_name_servers_per_managed_zone, as: 'targetNameServersPerManagedZone'
          property :target_name_servers_per_policy, as: 'targetNameServersPerPolicy'
          property :total_rrdata_size_per_change, as: 'totalRrdataSizePerChange'
          collection :whitelisted_key_specs, as: 'whitelistedKeySpecs', class: Google::Apis::DnsV1beta2::DnsKeySpec, decorator: Google::Apis::DnsV1beta2::DnsKeySpec::Representation
      
        end
      end
      
      class ResourceRecordSet
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :name, as: 'name'
          collection :rrdatas, as: 'rrdatas'
          collection :signature_rrdatas, as: 'signatureRrdatas'
          property :ttl, as: 'ttl'
          property :type, as: 'type'
        end
      end
      
      class ResourceRecordSetsListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :header, as: 'header', class: Google::Apis::DnsV1beta2::ResponseHeader, decorator: Google::Apis::DnsV1beta2::ResponseHeader::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          collection :rrsets, as: 'rrsets', class: Google::Apis::DnsV1beta2::ResourceRecordSet, decorator: Google::Apis::DnsV1beta2::ResourceRecordSet::Representation
      
        end
      end
      
      class ResponseHeader
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :operation_id, as: 'operationId'
        end
      end
    end
  end
end
