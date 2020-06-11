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
    module ComputeAlpha
      
      class AcceleratorConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AcceleratorType
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AcceleratorTypeAggregatedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AcceleratorTypeList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AcceleratorTypesScopedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AccessConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Address
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AddressAggregatedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AddressList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AddressesScopedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AliasIpRange
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AllocationSpecificSkuAllocationAllocatedInstancePropertiesReservedDisk
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AllocationSpecificSkuAllocationReservedInstanceProperties
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AllocationSpecificSkuReservation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AttachedDisk
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AttachedDiskInitializeParams
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AuditConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AuditLogConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AuthenticationPolicy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AuthorizationConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AuthorizationLoggingOptions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Autoscaler
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AutoscalerAggregatedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AutoscalerList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AutoscalerStatusDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AutoscalersScopedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AutoscalingPolicy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AutoscalingPolicyCpuUtilization
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AutoscalingPolicyCustomMetricUtilization
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AutoscalingPolicyLoadBalancingUtilization
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AutoscalingPolicyQueueBasedScaling
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AutoscalingPolicyQueueBasedScalingCloudPubSub
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AutoscalingPolicyScaleDownControl
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Backend
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BackendBucket
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BackendBucketCdnPolicy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BackendBucketList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BackendService
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BackendServiceAggregatedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BackendServiceCdnPolicy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BackendServiceFailoverPolicy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BackendServiceGroupHealth
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BackendServiceIap
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BackendServiceIapoAuth2ClientInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BackendServiceList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BackendServiceLogConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BackendServiceReference
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BackendServicesScopedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BfdPacket
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BfdStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BfdStatusPacketCounts
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Binding
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CacheInvalidationRule
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CacheKeyPolicy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CallCredentials
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ChannelCredentials
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CircuitBreakers
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ClientTlsSettings
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Commitment
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CommitmentAggregatedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CommitmentList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CommitmentsScopedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Condition
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConfidentialInstanceConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConnectionDraining
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConsistentHashLoadBalancerSettings
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConsistentHashLoadBalancerSettingsHttpCookie
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CorsPolicy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomerEncryptionKey
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomerEncryptionKeyProtectedDisk
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeprecationStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Disk
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DiskAggregatedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DiskInstantiationConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DiskList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DiskMoveRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DiskType
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DiskTypeAggregatedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DiskTypeList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DiskTypesScopedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DisksAddResourcePoliciesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DisksRemoveResourcePoliciesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DisksResizeRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DisksScopedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DisplayDevice
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DistributionPolicy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DistributionPolicyZoneConfiguration
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Duration
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ExchangedPeeringRoute
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ExchangedPeeringRoutesList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Expr
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ExternalVpnGateway
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ExternalVpnGatewayInterface
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ExternalVpnGatewayList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FileContentBuffer
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Firewall
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Allowed
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Denied
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FirewallList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FirewallLogConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FixedOrPercent
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ForwardingRule
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ForwardingRuleAggregatedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ForwardingRuleList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ForwardingRuleReference
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ForwardingRulesScopedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GlobalNetworkEndpointGroupsAttachEndpointsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GlobalNetworkEndpointGroupsDetachEndpointsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GlobalSetLabelsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GlobalSetPolicyRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GrpcServiceConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GuestAttributes
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GuestAttributesEntry
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GuestAttributesValue
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GuestOsFeature
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Http2HealthCheck
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HttpHealthCheck
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HttpsHealthCheck
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HealthCheck
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HealthCheckList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HealthCheckLogConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HealthCheckReference
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HealthCheckService
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HealthCheckServiceReference
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HealthCheckServicesList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HealthChecksAggregatedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HealthChecksScopedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HealthStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HealthStatusForNetworkEndpoint
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HostRule
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HttpFaultAbort
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HttpFaultDelay
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HttpFaultInjection
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HttpHeaderAction
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HttpHeaderMatch
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HttpHeaderOption
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HttpHealthCheck
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HttpHealthCheckList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HttpQueryParameterMatch
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HttpRedirectAction
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HttpRetryPolicy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HttpRouteAction
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HttpRouteRule
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HttpRouteRuleMatch
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HttpsHealthCheck
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HttpsHealthCheckList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Image
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class RawDisk
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ImageList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InitialStateConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Instance
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceAggregatedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceGroup
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceGroupAggregatedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceGroupList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceGroupManager
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceGroupManagerActionsSummary
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceGroupManagerAggregatedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceGroupManagerAutoHealingPolicy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceGroupManagerList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceGroupManagerPendingActionsSummary
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceGroupManagerStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceGroupManagerStatusStateful
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceGroupManagerStatusVersionTarget
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceGroupManagerUpdatePolicy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceGroupManagerVersion
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceGroupManagersAbandonInstancesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceGroupManagersApplyUpdatesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceGroupManagersCreateInstancesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceGroupManagersDeleteInstancesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceGroupManagersDeletePerInstanceConfigsReq
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceGroupManagersListErrorsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceGroupManagersListManagedInstancesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceGroupManagersListPerInstanceConfigsResp
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceGroupManagersPatchPerInstanceConfigsReq
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceGroupManagersRecreateInstancesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceGroupManagersResizeAdvancedRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceGroupManagersScopedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceGroupManagersSetAutoHealingRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceGroupManagersSetInstanceTemplateRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceGroupManagersSetTargetPoolsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceGroupManagersUpdatePerInstanceConfigsReq
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceGroupsAddInstancesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceGroupsListInstances
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceGroupsListInstancesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceGroupsRemoveInstancesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceGroupsScopedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceGroupsSetNamedPortsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceListReferrers
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceManagedByIgmError
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceManagedByIgmErrorInstanceActionDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceManagedByIgmErrorManagedInstanceError
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceMoveRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceProperties
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceReference
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceTemplate
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceTemplateList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceWithNamedPorts
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstancesAddResourcePoliciesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstancesGetEffectiveFirewallsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstancesGetEffectiveFirewallsResponseOrganizationFirewallPolicy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstancesRemoveResourcePoliciesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstancesResumeRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstancesScopedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstancesSetLabelsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstancesSetMachineResourcesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstancesSetMachineTypeRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstancesSetMinCpuPlatformRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstancesSetNameRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstancesSetServiceAccountRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstancesStartWithEncryptionKeyRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Int64RangeMatch
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Interconnect
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InterconnectAttachment
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InterconnectAttachmentAggregatedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InterconnectAttachmentList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InterconnectAttachmentPartnerMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InterconnectAttachmentPrivateInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InterconnectAttachmentsScopedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InterconnectCircuitInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InterconnectDiagnostics
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InterconnectDiagnosticsArpEntry
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InterconnectDiagnosticsLinkLacpStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InterconnectDiagnosticsLinkOpticalPower
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InterconnectDiagnosticsLinkStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InterconnectList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InterconnectLocation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InterconnectLocationList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InterconnectLocationRegionInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InterconnectOutageNotification
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InterconnectsGetDiagnosticsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InternalIpAddress
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InternalIpOwner
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class IpAddressesList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class IpOwnerList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Jwt
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class JwtHeader
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class License
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LicenseCode
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LicenseCodeLicenseAlias
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LicenseResourceCommitment
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LicenseResourceRequirements
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LicensesListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LocalDisk
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LogConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LogConfigCloudAuditOptions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LogConfigCounterOptions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LogConfigCounterOptionsCustomField
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LogConfigDataAccessOptions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MachineImage
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MachineImageList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MachineType
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MachineTypeAggregatedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MachineTypeList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MachineTypesScopedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ManagedInstance
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ManagedInstanceInstanceHealth
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ManagedInstanceLastAttempt
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Errors
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Error
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ManagedInstanceVersion
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Metadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Item
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MetadataCredentialsFromPlugin
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MetadataFilter
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MetadataFilterLabelMatch
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MutualTls
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NamedPort
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Network
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NetworkEndpoint
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NetworkEndpointGroup
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NetworkEndpointGroupAggregatedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NetworkEndpointGroupAppEngine
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NetworkEndpointGroupCloudFunction
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NetworkEndpointGroupCloudRun
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NetworkEndpointGroupLbNetworkEndpointGroup
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NetworkEndpointGroupList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NetworkEndpointGroupsAttachEndpointsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NetworkEndpointGroupsDetachEndpointsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NetworkEndpointGroupsListEndpointsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NetworkEndpointGroupsListEndpointsRequestNetworkEndpointFilter
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NetworkEndpointGroupsListNetworkEndpoints
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NetworkEndpointGroupsScopedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NetworkEndpointWithHealthStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NetworkInterface
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NetworkList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NetworkPeering
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NetworkRoutingConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NetworksAddPeeringRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NetworksGetEffectiveFirewallsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NetworksGetEffectiveFirewallsResponseOrganizationFirewallPolicy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NetworksRemovePeeringRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NetworksUpdatePeeringRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NodeGroup
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NodeGroupAggregatedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NodeGroupAutoscalingPolicy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NodeGroupList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NodeGroupNode
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NodeGroupsAddNodesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NodeGroupsDeleteNodesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NodeGroupsListNodes
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NodeGroupsScopedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NodeGroupsSetAutoscalingPolicyRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NodeGroupsSetNodeTemplateRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NodeTemplate
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NodeTemplateAggregatedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NodeTemplateList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NodeTemplateNodeTypeFlexibility
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NodeTemplatesScopedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NodeType
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NodeTypeAggregatedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NodeTypeList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NodeTypesScopedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NotificationEndpoint
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NotificationEndpointGrpcSettings
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NotificationEndpointList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Operation
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Error
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Error
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OperationAggregatedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OperationList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OperationsScopedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrganizationSecurityPoliciesListAssociationsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OriginAuthenticationMethod
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OutlierDetection
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PacketIntervals
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PacketMirroring
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PacketMirroringAggregatedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PacketMirroringCollectorInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PacketMirroringCollectorInfoInstanceInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PacketMirroringFilter
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PacketMirroringForwardingRuleInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PacketMirroringList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PacketMirroringMirroredResourceInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PacketMirroringMirroredResourceInfoInstanceInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PacketMirroringMirroredResourceInfoSubnetInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PacketMirroringNetworkInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PacketMirroringPacketMatcher
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PacketMirroringsScopedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PathMatcher
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PathRule
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PeerAuthenticationMethod
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PerInstanceConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Permission
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PermissionConstraint
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Policy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PreconfiguredWafSet
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PreservedState
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PreservedStatePreservedDisk
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Principal
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Project
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ProjectsDisableXpnResourceRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ProjectsEnableXpnResourceRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ProjectsGetXpnResources
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ProjectsListXpnHostsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ProjectsSetDefaultNetworkTierRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ProjectsSetDefaultServiceAccountRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PublicAdvertisedPrefix
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PublicAdvertisedPrefixList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PublicAdvertisedPrefixPublicDelegatedPrefix
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PublicDelegatedPrefix
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PublicDelegatedPrefixAggregatedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PublicDelegatedPrefixList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PublicDelegatedPrefixPublicDelegatedSubPrefix
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PublicDelegatedPrefixesScopedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Quota
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RbacPolicy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Reference
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Region
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RegionAutoscalerList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RegionCommitmentsUpdateReservationsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RegionDiskTypeList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RegionDisksAddResourcePoliciesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RegionDisksRemoveResourcePoliciesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RegionDisksResizeRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RegionInstanceGroupList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RegionInstanceGroupManagerDeleteInstanceConfigReq
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RegionInstanceGroupManagerList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RegionInstanceGroupManagerPatchInstanceConfigReq
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RegionInstanceGroupManagerUpdateInstanceConfigReq
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RegionInstanceGroupManagersAbandonInstancesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RegionInstanceGroupManagersApplyUpdatesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RegionInstanceGroupManagersCreateInstancesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RegionInstanceGroupManagersDeleteInstancesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RegionInstanceGroupManagersListErrorsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RegionInstanceGroupManagersListInstanceConfigsResp
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RegionInstanceGroupManagersListInstancesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RegionInstanceGroupManagersRecreateRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RegionInstanceGroupManagersSetAutoHealingRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RegionInstanceGroupManagersSetTargetPoolsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RegionInstanceGroupManagersSetTemplateRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RegionInstanceGroupsListInstances
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RegionInstanceGroupsListInstancesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RegionInstanceGroupsSetNamedPortsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RegionList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RegionSetLabelsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RegionSetPolicyRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RegionTargetHttpsProxiesSetSslCertificatesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RegionUrlMapsValidateRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RequestMirrorPolicy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Reservation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReservationAffinity
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReservationAggregatedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReservationList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReservationsResizeRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReservationsScopedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ResourceCommitment
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ResourceGroupReference
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ResourcePoliciesScopedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ResourcePolicy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ResourcePolicyAggregatedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ResourcePolicyDailyCycle
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ResourcePolicyGroupPlacementPolicy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ResourcePolicyHourlyCycle
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ResourcePolicyList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ResourcePolicySnapshotSchedulePolicy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ResourcePolicySnapshotSchedulePolicyRetentionPolicy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ResourcePolicySnapshotSchedulePolicySchedule
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ResourcePolicySnapshotSchedulePolicySnapshotProperties
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ResourcePolicyVmMaintenancePolicy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ResourcePolicyVmMaintenancePolicyConcurrencyControl
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ResourcePolicyVmMaintenancePolicyMaintenanceWindow
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ResourcePolicyWeeklyCycle
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ResourcePolicyWeeklyCycleDayOfWeek
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Route
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RouteList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Router
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RouterAdvertisedIpRange
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RouterAggregatedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RouterBgp
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RouterBgpPeer
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RouterBgpPeerBfd
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RouterInterface
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RouterList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RouterNat
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RouterNatLogConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RouterNatSubnetworkToNat
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RouterStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RouterStatusBgpPeerStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RouterStatusNatStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RouterStatusResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RoutersPreviewResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RoutersScopedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Rule
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SslHealthCheck
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SavedAttachedDisk
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Scheduling
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SchedulingNodeAffinity
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SdsConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SecurityPoliciesListPreconfiguredExpressionSetsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SecurityPoliciesWafConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SecurityPolicy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SecurityPolicyAssociation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SecurityPolicyCloudArmorConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SecurityPolicyList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SecurityPolicyReference
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SecurityPolicyRule
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SecurityPolicyRuleMatcher
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SecurityPolicyRuleMatcherConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SecurityPolicyRuleMatcherConfigDestinationPort
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SecurityPolicyRuleRateLimitOptions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SecuritySettings
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SerialPortOutput
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ServerBinding
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ServerTlsSettings
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ServiceAccount
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ShieldedInstanceConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ShieldedInstanceIdentity
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ShieldedInstanceIdentityEntry
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ShieldedInstanceIntegrityPolicy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ShieldedVmConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ShieldedVmIdentity
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ShieldedVmIdentityEntry
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ShieldedVmIntegrityPolicy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SignedUrlKey
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Snapshot
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SnapshotList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SourceDiskEncryptionKey
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SourceInstanceParams
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SourceInstanceProperties
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SslCertificate
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SslCertificateAggregatedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SslCertificateList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SslCertificateManagedSslCertificate
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SslCertificateSelfManagedSslCertificate
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SslCertificatesScopedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SslPoliciesList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SslPoliciesListAvailableFeaturesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SslPolicy
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SslPolicyReference
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class StatefulPolicy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class StatefulPolicyPreservedState
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class StatefulPolicyPreservedStateDiskDevice
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Subnetwork
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SubnetworkAggregatedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SubnetworkList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SubnetworkLogConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SubnetworkSecondaryRange
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SubnetworksExpandIpCidrRangeRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SubnetworksScopedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SubnetworksSetPrivateIpGoogleAccessRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TcpHealthCheck
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Tags
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TargetHttpProxiesScopedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TargetHttpProxy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TargetHttpProxyAggregatedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TargetHttpProxyList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TargetHttpsProxiesScopedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TargetHttpsProxiesSetQuicOverrideRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TargetHttpsProxiesSetSslCertificatesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TargetHttpsProxy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TargetHttpsProxyAggregatedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TargetHttpsProxyList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TargetInstance
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TargetInstanceAggregatedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TargetInstanceList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TargetInstancesScopedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TargetPool
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TargetPoolAggregatedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TargetPoolInstanceHealth
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TargetPoolList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TargetPoolsAddHealthCheckRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TargetPoolsAddInstanceRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TargetPoolsRemoveHealthCheckRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TargetPoolsRemoveInstanceRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TargetPoolsScopedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TargetReference
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TargetSslProxiesSetBackendServiceRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TargetSslProxiesSetProxyHeaderRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TargetSslProxiesSetSslCertificatesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TargetSslProxy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TargetSslProxyList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TargetTcpProxiesSetBackendServiceRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TargetTcpProxiesSetProxyHeaderRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TargetTcpProxy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TargetTcpProxyList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TargetVpnGateway
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TargetVpnGatewayAggregatedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TargetVpnGatewayList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TargetVpnGatewaysScopedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TestFailure
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TestPermissionsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TestPermissionsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TlsCertificateContext
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TlsCertificatePaths
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TlsContext
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TlsValidationContext
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UdpHealthCheck
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UrlMap
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UrlMapList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UrlMapReference
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UrlMapTest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UrlMapValidationResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UrlMapsAggregatedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UrlMapsScopedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UrlMapsValidateRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UrlMapsValidateResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UrlRewrite
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UsableSubnetwork
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UsableSubnetworkSecondaryRange
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UsableSubnetworksAggregatedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UsageExportLocation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VmEndpointNatMappings
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VmEndpointNatMappingsInterfaceNatMappings
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VmEndpointNatMappingsList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VpnGateway
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VpnGatewayAggregatedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VpnGatewayList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VpnGatewayStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VpnGatewayStatusHighAvailabilityRequirementState
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VpnGatewayStatusTunnel
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VpnGatewayStatusVpnConnection
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VpnGatewayVpnGatewayInterface
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VpnGatewaysGetStatusResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VpnGatewaysScopedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VpnTunnel
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VpnTunnelAggregatedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VpnTunnelList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VpnTunnelsScopedList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WafExpressionSet
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WafExpressionSetExpression
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WeightedBackendService
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class XpnHostList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class XpnResourceId
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Zone
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ZoneList
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Warning
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Datum
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ZoneSetLabelsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ZoneSetPolicyRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AcceleratorConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :accelerator_count, as: 'acceleratorCount'
          property :accelerator_type, as: 'acceleratorType'
        end
      end
      
      class AcceleratorType
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creation_timestamp, as: 'creationTimestamp'
          property :deprecated, as: 'deprecated', class: Google::Apis::ComputeAlpha::DeprecationStatus, decorator: Google::Apis::ComputeAlpha::DeprecationStatus::Representation
      
          property :description, as: 'description'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :maximum_cards_per_instance, as: 'maximumCardsPerInstance'
          property :name, as: 'name'
          property :self_link, as: 'selfLink'
          property :self_link_with_id, as: 'selfLinkWithId'
          property :zone, as: 'zone'
        end
      end
      
      class AcceleratorTypeAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeAlpha::AcceleratorTypesScopedList, decorator: Google::Apis::ComputeAlpha::AcceleratorTypesScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::AcceleratorTypeAggregatedList::Warning, decorator: Google::Apis::ComputeAlpha::AcceleratorTypeAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::AcceleratorTypeAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::AcceleratorTypeAggregatedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class AcceleratorTypeList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::AcceleratorType, decorator: Google::Apis::ComputeAlpha::AcceleratorType::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::AcceleratorTypeList::Warning, decorator: Google::Apis::ComputeAlpha::AcceleratorTypeList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::AcceleratorTypeList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::AcceleratorTypeList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class AcceleratorTypesScopedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :accelerator_types, as: 'acceleratorTypes', class: Google::Apis::ComputeAlpha::AcceleratorType, decorator: Google::Apis::ComputeAlpha::AcceleratorType::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::AcceleratorTypesScopedList::Warning, decorator: Google::Apis::ComputeAlpha::AcceleratorTypesScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::AcceleratorTypesScopedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::AcceleratorTypesScopedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class AccessConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :nat_ip, as: 'natIP'
          property :network_tier, as: 'networkTier'
          property :public_dns_name, as: 'publicDnsName'
          property :public_ptr_domain_name, as: 'publicPtrDomainName'
          property :set_public_dns, as: 'setPublicDns'
          property :set_public_ptr, as: 'setPublicPtr'
          property :type, as: 'type'
        end
      end
      
      class Address
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :address, as: 'address'
          property :address_type, as: 'addressType'
          property :creation_timestamp, as: 'creationTimestamp'
          property :description, as: 'description'
          property :id, :numeric_string => true, as: 'id'
          property :ip_version, as: 'ipVersion'
          property :kind, as: 'kind'
          property :label_fingerprint, :base64 => true, as: 'labelFingerprint'
          hash :labels, as: 'labels'
          property :name, as: 'name'
          property :network, as: 'network'
          property :network_tier, as: 'networkTier'
          property :prefix_length, as: 'prefixLength'
          property :purpose, as: 'purpose'
          property :region, as: 'region'
          property :self_link, as: 'selfLink'
          property :self_link_with_id, as: 'selfLinkWithId'
          property :status, as: 'status'
          property :subnetwork, as: 'subnetwork'
          collection :users, as: 'users'
        end
      end
      
      class AddressAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeAlpha::AddressesScopedList, decorator: Google::Apis::ComputeAlpha::AddressesScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::AddressAggregatedList::Warning, decorator: Google::Apis::ComputeAlpha::AddressAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::AddressAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::AddressAggregatedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class AddressList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::Address, decorator: Google::Apis::ComputeAlpha::Address::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::AddressList::Warning, decorator: Google::Apis::ComputeAlpha::AddressList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::AddressList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::AddressList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class AddressesScopedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :addresses, as: 'addresses', class: Google::Apis::ComputeAlpha::Address, decorator: Google::Apis::ComputeAlpha::Address::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::AddressesScopedList::Warning, decorator: Google::Apis::ComputeAlpha::AddressesScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::AddressesScopedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::AddressesScopedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class AliasIpRange
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :ip_cidr_range, as: 'ipCidrRange'
          property :subnetwork_range_name, as: 'subnetworkRangeName'
        end
      end
      
      class AllocationSpecificSkuAllocationAllocatedInstancePropertiesReservedDisk
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :disk_size_gb, :numeric_string => true, as: 'diskSizeGb'
          property :interface, as: 'interface'
        end
      end
      
      class AllocationSpecificSkuAllocationReservedInstanceProperties
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :guest_accelerators, as: 'guestAccelerators', class: Google::Apis::ComputeAlpha::AcceleratorConfig, decorator: Google::Apis::ComputeAlpha::AcceleratorConfig::Representation
      
          collection :local_ssds, as: 'localSsds', class: Google::Apis::ComputeAlpha::AllocationSpecificSkuAllocationAllocatedInstancePropertiesReservedDisk, decorator: Google::Apis::ComputeAlpha::AllocationSpecificSkuAllocationAllocatedInstancePropertiesReservedDisk::Representation
      
          property :machine_type, as: 'machineType'
          property :min_cpu_platform, as: 'minCpuPlatform'
        end
      end
      
      class AllocationSpecificSkuReservation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :count, :numeric_string => true, as: 'count'
          property :in_use_count, :numeric_string => true, as: 'inUseCount'
          property :instance_properties, as: 'instanceProperties', class: Google::Apis::ComputeAlpha::AllocationSpecificSkuAllocationReservedInstanceProperties, decorator: Google::Apis::ComputeAlpha::AllocationSpecificSkuAllocationReservedInstanceProperties::Representation
      
        end
      end
      
      class AttachedDisk
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :auto_delete, as: 'autoDelete'
          property :boot, as: 'boot'
          property :device_name, as: 'deviceName'
          property :disk_encryption_key, as: 'diskEncryptionKey', class: Google::Apis::ComputeAlpha::CustomerEncryptionKey, decorator: Google::Apis::ComputeAlpha::CustomerEncryptionKey::Representation
      
          property :disk_size_gb, :numeric_string => true, as: 'diskSizeGb'
          collection :guest_os_features, as: 'guestOsFeatures', class: Google::Apis::ComputeAlpha::GuestOsFeature, decorator: Google::Apis::ComputeAlpha::GuestOsFeature::Representation
      
          property :index, as: 'index'
          property :initialize_params, as: 'initializeParams', class: Google::Apis::ComputeAlpha::AttachedDiskInitializeParams, decorator: Google::Apis::ComputeAlpha::AttachedDiskInitializeParams::Representation
      
          property :interface, as: 'interface'
          property :kind, as: 'kind'
          collection :licenses, as: 'licenses'
          property :mode, as: 'mode'
          property :saved_state, as: 'savedState'
          property :shielded_instance_initial_state, as: 'shieldedInstanceInitialState', class: Google::Apis::ComputeAlpha::InitialStateConfig, decorator: Google::Apis::ComputeAlpha::InitialStateConfig::Representation
      
          property :source, as: 'source'
          property :type, as: 'type'
        end
      end
      
      class AttachedDiskInitializeParams
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :disk_name, as: 'diskName'
          property :disk_size_gb, :numeric_string => true, as: 'diskSizeGb'
          property :disk_type, as: 'diskType'
          collection :guest_os_features, as: 'guestOsFeatures', class: Google::Apis::ComputeAlpha::GuestOsFeature, decorator: Google::Apis::ComputeAlpha::GuestOsFeature::Representation
      
          hash :labels, as: 'labels'
          collection :replica_zones, as: 'replicaZones'
          collection :resource_policies, as: 'resourcePolicies'
          property :source_image, as: 'sourceImage'
          property :source_image_encryption_key, as: 'sourceImageEncryptionKey', class: Google::Apis::ComputeAlpha::CustomerEncryptionKey, decorator: Google::Apis::ComputeAlpha::CustomerEncryptionKey::Representation
      
          property :source_snapshot, as: 'sourceSnapshot'
          property :source_snapshot_encryption_key, as: 'sourceSnapshotEncryptionKey', class: Google::Apis::ComputeAlpha::CustomerEncryptionKey, decorator: Google::Apis::ComputeAlpha::CustomerEncryptionKey::Representation
      
        end
      end
      
      class AuditConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :audit_log_configs, as: 'auditLogConfigs', class: Google::Apis::ComputeAlpha::AuditLogConfig, decorator: Google::Apis::ComputeAlpha::AuditLogConfig::Representation
      
          collection :exempted_members, as: 'exemptedMembers'
          property :service, as: 'service'
        end
      end
      
      class AuditLogConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :exempted_members, as: 'exemptedMembers'
          property :ignore_child_exemptions, as: 'ignoreChildExemptions'
          property :log_type, as: 'logType'
        end
      end
      
      class AuthenticationPolicy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :origins, as: 'origins', class: Google::Apis::ComputeAlpha::OriginAuthenticationMethod, decorator: Google::Apis::ComputeAlpha::OriginAuthenticationMethod::Representation
      
          collection :peers, as: 'peers', class: Google::Apis::ComputeAlpha::PeerAuthenticationMethod, decorator: Google::Apis::ComputeAlpha::PeerAuthenticationMethod::Representation
      
          property :principal_binding, as: 'principalBinding'
          property :server_tls_context, as: 'serverTlsContext', class: Google::Apis::ComputeAlpha::TlsContext, decorator: Google::Apis::ComputeAlpha::TlsContext::Representation
      
        end
      end
      
      class AuthorizationConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :policies, as: 'policies', class: Google::Apis::ComputeAlpha::RbacPolicy, decorator: Google::Apis::ComputeAlpha::RbacPolicy::Representation
      
        end
      end
      
      class AuthorizationLoggingOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :permission_type, as: 'permissionType'
        end
      end
      
      class Autoscaler
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :autoscaling_policy, as: 'autoscalingPolicy', class: Google::Apis::ComputeAlpha::AutoscalingPolicy, decorator: Google::Apis::ComputeAlpha::AutoscalingPolicy::Representation
      
          property :creation_timestamp, as: 'creationTimestamp'
          property :description, as: 'description'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :recommended_size, as: 'recommendedSize'
          property :region, as: 'region'
          property :self_link, as: 'selfLink'
          property :self_link_with_id, as: 'selfLinkWithId'
          property :status, as: 'status'
          collection :status_details, as: 'statusDetails', class: Google::Apis::ComputeAlpha::AutoscalerStatusDetails, decorator: Google::Apis::ComputeAlpha::AutoscalerStatusDetails::Representation
      
          property :target, as: 'target'
          property :zone, as: 'zone'
        end
      end
      
      class AutoscalerAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeAlpha::AutoscalersScopedList, decorator: Google::Apis::ComputeAlpha::AutoscalersScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::AutoscalerAggregatedList::Warning, decorator: Google::Apis::ComputeAlpha::AutoscalerAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::AutoscalerAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::AutoscalerAggregatedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class AutoscalerList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::Autoscaler, decorator: Google::Apis::ComputeAlpha::Autoscaler::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::AutoscalerList::Warning, decorator: Google::Apis::ComputeAlpha::AutoscalerList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::AutoscalerList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::AutoscalerList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class AutoscalerStatusDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :message, as: 'message'
          property :type, as: 'type'
        end
      end
      
      class AutoscalersScopedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :autoscalers, as: 'autoscalers', class: Google::Apis::ComputeAlpha::Autoscaler, decorator: Google::Apis::ComputeAlpha::Autoscaler::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::AutoscalersScopedList::Warning, decorator: Google::Apis::ComputeAlpha::AutoscalersScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::AutoscalersScopedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::AutoscalersScopedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class AutoscalingPolicy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cool_down_period_sec, as: 'coolDownPeriodSec'
          property :cpu_utilization, as: 'cpuUtilization', class: Google::Apis::ComputeAlpha::AutoscalingPolicyCpuUtilization, decorator: Google::Apis::ComputeAlpha::AutoscalingPolicyCpuUtilization::Representation
      
          collection :custom_metric_utilizations, as: 'customMetricUtilizations', class: Google::Apis::ComputeAlpha::AutoscalingPolicyCustomMetricUtilization, decorator: Google::Apis::ComputeAlpha::AutoscalingPolicyCustomMetricUtilization::Representation
      
          property :load_balancing_utilization, as: 'loadBalancingUtilization', class: Google::Apis::ComputeAlpha::AutoscalingPolicyLoadBalancingUtilization, decorator: Google::Apis::ComputeAlpha::AutoscalingPolicyLoadBalancingUtilization::Representation
      
          property :max_num_replicas, as: 'maxNumReplicas'
          property :min_num_replicas, as: 'minNumReplicas'
          property :mode, as: 'mode'
          property :queue_based_scaling, as: 'queueBasedScaling', class: Google::Apis::ComputeAlpha::AutoscalingPolicyQueueBasedScaling, decorator: Google::Apis::ComputeAlpha::AutoscalingPolicyQueueBasedScaling::Representation
      
          property :scale_down_control, as: 'scaleDownControl', class: Google::Apis::ComputeAlpha::AutoscalingPolicyScaleDownControl, decorator: Google::Apis::ComputeAlpha::AutoscalingPolicyScaleDownControl::Representation
      
        end
      end
      
      class AutoscalingPolicyCpuUtilization
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :utilization_target, as: 'utilizationTarget'
        end
      end
      
      class AutoscalingPolicyCustomMetricUtilization
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :filter, as: 'filter'
          property :metric, as: 'metric'
          property :single_instance_assignment, as: 'singleInstanceAssignment'
          property :utilization_target, as: 'utilizationTarget'
          property :utilization_target_type, as: 'utilizationTargetType'
        end
      end
      
      class AutoscalingPolicyLoadBalancingUtilization
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :utilization_target, as: 'utilizationTarget'
        end
      end
      
      class AutoscalingPolicyQueueBasedScaling
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :acceptable_backlog_per_instance, as: 'acceptableBacklogPerInstance'
          property :cloud_pub_sub, as: 'cloudPubSub', class: Google::Apis::ComputeAlpha::AutoscalingPolicyQueueBasedScalingCloudPubSub, decorator: Google::Apis::ComputeAlpha::AutoscalingPolicyQueueBasedScalingCloudPubSub::Representation
      
          property :single_worker_throughput_per_sec, as: 'singleWorkerThroughputPerSec'
        end
      end
      
      class AutoscalingPolicyQueueBasedScalingCloudPubSub
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :subscription, as: 'subscription'
          property :topic, as: 'topic'
        end
      end
      
      class AutoscalingPolicyScaleDownControl
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :max_scaled_down_replicas, as: 'maxScaledDownReplicas', class: Google::Apis::ComputeAlpha::FixedOrPercent, decorator: Google::Apis::ComputeAlpha::FixedOrPercent::Representation
      
          property :time_window_sec, as: 'timeWindowSec'
        end
      end
      
      class Backend
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :balancing_mode, as: 'balancingMode'
          property :capacity_scaler, as: 'capacityScaler'
          property :description, as: 'description'
          property :failover, as: 'failover'
          property :group, as: 'group'
          property :max_connections, as: 'maxConnections'
          property :max_connections_per_endpoint, as: 'maxConnectionsPerEndpoint'
          property :max_connections_per_instance, as: 'maxConnectionsPerInstance'
          property :max_rate, as: 'maxRate'
          property :max_rate_per_endpoint, as: 'maxRatePerEndpoint'
          property :max_rate_per_instance, as: 'maxRatePerInstance'
          property :max_utilization, as: 'maxUtilization'
        end
      end
      
      class BackendBucket
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bucket_name, as: 'bucketName'
          property :cdn_policy, as: 'cdnPolicy', class: Google::Apis::ComputeAlpha::BackendBucketCdnPolicy, decorator: Google::Apis::ComputeAlpha::BackendBucketCdnPolicy::Representation
      
          property :creation_timestamp, as: 'creationTimestamp'
          property :description, as: 'description'
          property :enable_cdn, as: 'enableCdn'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :self_link, as: 'selfLink'
          property :self_link_with_id, as: 'selfLinkWithId'
        end
      end
      
      class BackendBucketCdnPolicy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :signed_url_cache_max_age_sec, :numeric_string => true, as: 'signedUrlCacheMaxAgeSec'
          collection :signed_url_key_names, as: 'signedUrlKeyNames'
        end
      end
      
      class BackendBucketList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::BackendBucket, decorator: Google::Apis::ComputeAlpha::BackendBucket::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::BackendBucketList::Warning, decorator: Google::Apis::ComputeAlpha::BackendBucketList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::BackendBucketList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::BackendBucketList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class BackendService
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :affinity_cookie_ttl_sec, as: 'affinityCookieTtlSec'
          collection :backends, as: 'backends', class: Google::Apis::ComputeAlpha::Backend, decorator: Google::Apis::ComputeAlpha::Backend::Representation
      
          property :cdn_policy, as: 'cdnPolicy', class: Google::Apis::ComputeAlpha::BackendServiceCdnPolicy, decorator: Google::Apis::ComputeAlpha::BackendServiceCdnPolicy::Representation
      
          property :circuit_breakers, as: 'circuitBreakers', class: Google::Apis::ComputeAlpha::CircuitBreakers, decorator: Google::Apis::ComputeAlpha::CircuitBreakers::Representation
      
          property :connection_draining, as: 'connectionDraining', class: Google::Apis::ComputeAlpha::ConnectionDraining, decorator: Google::Apis::ComputeAlpha::ConnectionDraining::Representation
      
          property :consistent_hash, as: 'consistentHash', class: Google::Apis::ComputeAlpha::ConsistentHashLoadBalancerSettings, decorator: Google::Apis::ComputeAlpha::ConsistentHashLoadBalancerSettings::Representation
      
          property :creation_timestamp, as: 'creationTimestamp'
          collection :custom_request_headers, as: 'customRequestHeaders'
          property :description, as: 'description'
          property :enable_cdn, as: 'enableCDN'
          property :failover_policy, as: 'failoverPolicy', class: Google::Apis::ComputeAlpha::BackendServiceFailoverPolicy, decorator: Google::Apis::ComputeAlpha::BackendServiceFailoverPolicy::Representation
      
          property :fingerprint, :base64 => true, as: 'fingerprint'
          collection :health_checks, as: 'healthChecks'
          property :iap, as: 'iap', class: Google::Apis::ComputeAlpha::BackendServiceIap, decorator: Google::Apis::ComputeAlpha::BackendServiceIap::Representation
      
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :load_balancing_scheme, as: 'loadBalancingScheme'
          property :locality_lb_policy, as: 'localityLbPolicy'
          property :log_config, as: 'logConfig', class: Google::Apis::ComputeAlpha::BackendServiceLogConfig, decorator: Google::Apis::ComputeAlpha::BackendServiceLogConfig::Representation
      
          property :name, as: 'name'
          property :network, as: 'network'
          property :outlier_detection, as: 'outlierDetection', class: Google::Apis::ComputeAlpha::OutlierDetection, decorator: Google::Apis::ComputeAlpha::OutlierDetection::Representation
      
          property :port, as: 'port'
          property :port_name, as: 'portName'
          property :protocol, as: 'protocol'
          property :region, as: 'region'
          property :security_policy, as: 'securityPolicy'
          property :security_settings, as: 'securitySettings', class: Google::Apis::ComputeAlpha::SecuritySettings, decorator: Google::Apis::ComputeAlpha::SecuritySettings::Representation
      
          property :self_link, as: 'selfLink'
          property :self_link_with_id, as: 'selfLinkWithId'
          property :session_affinity, as: 'sessionAffinity'
          property :timeout_sec, as: 'timeoutSec'
        end
      end
      
      class BackendServiceAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeAlpha::BackendServicesScopedList, decorator: Google::Apis::ComputeAlpha::BackendServicesScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::BackendServiceAggregatedList::Warning, decorator: Google::Apis::ComputeAlpha::BackendServiceAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::BackendServiceAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::BackendServiceAggregatedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class BackendServiceCdnPolicy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cache_key_policy, as: 'cacheKeyPolicy', class: Google::Apis::ComputeAlpha::CacheKeyPolicy, decorator: Google::Apis::ComputeAlpha::CacheKeyPolicy::Representation
      
          property :signed_url_cache_max_age_sec, :numeric_string => true, as: 'signedUrlCacheMaxAgeSec'
          collection :signed_url_key_names, as: 'signedUrlKeyNames'
        end
      end
      
      class BackendServiceFailoverPolicy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :disable_connection_drain_on_failover, as: 'disableConnectionDrainOnFailover'
          property :drop_traffic_if_unhealthy, as: 'dropTrafficIfUnhealthy'
          property :failover_ratio, as: 'failoverRatio'
        end
      end
      
      class BackendServiceGroupHealth
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :annotations, as: 'annotations'
          collection :health_status, as: 'healthStatus', class: Google::Apis::ComputeAlpha::HealthStatus, decorator: Google::Apis::ComputeAlpha::HealthStatus::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class BackendServiceIap
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :enabled, as: 'enabled'
          property :oauth2_client_id, as: 'oauth2ClientId'
          property :oauth2_client_info, as: 'oauth2ClientInfo', class: Google::Apis::ComputeAlpha::BackendServiceIapoAuth2ClientInfo, decorator: Google::Apis::ComputeAlpha::BackendServiceIapoAuth2ClientInfo::Representation
      
          property :oauth2_client_secret, as: 'oauth2ClientSecret'
          property :oauth2_client_secret_sha256, as: 'oauth2ClientSecretSha256'
        end
      end
      
      class BackendServiceIapoAuth2ClientInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :application_name, as: 'applicationName'
          property :client_name, as: 'clientName'
          property :developer_email_address, as: 'developerEmailAddress'
        end
      end
      
      class BackendServiceList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::BackendService, decorator: Google::Apis::ComputeAlpha::BackendService::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::BackendServiceList::Warning, decorator: Google::Apis::ComputeAlpha::BackendServiceList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::BackendServiceList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::BackendServiceList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class BackendServiceLogConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :enable, as: 'enable'
          property :sample_rate, as: 'sampleRate'
        end
      end
      
      class BackendServiceReference
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :backend_service, as: 'backendService'
        end
      end
      
      class BackendServicesScopedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :backend_services, as: 'backendServices', class: Google::Apis::ComputeAlpha::BackendService, decorator: Google::Apis::ComputeAlpha::BackendService::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::BackendServicesScopedList::Warning, decorator: Google::Apis::ComputeAlpha::BackendServicesScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::BackendServicesScopedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::BackendServicesScopedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class BfdPacket
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :authentication_present, as: 'authenticationPresent'
          property :control_plane_independent, as: 'controlPlaneIndependent'
          property :demand, as: 'demand'
          property :diagnostic, as: 'diagnostic'
          property :final, as: 'final'
          property :length, as: 'length'
          property :min_echo_rx_interval_ms, as: 'minEchoRxIntervalMs'
          property :min_rx_interval_ms, as: 'minRxIntervalMs'
          property :min_tx_interval_ms, as: 'minTxIntervalMs'
          property :multiplier, as: 'multiplier'
          property :multipoint, as: 'multipoint'
          property :my_discriminator, as: 'myDiscriminator'
          property :poll, as: 'poll'
          property :state, as: 'state'
          property :version, as: 'version'
          property :your_discriminator, as: 'yourDiscriminator'
        end
      end
      
      class BfdStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bfd_session_initialization_mode, as: 'bfdSessionInitializationMode'
          property :config_update_timestamp_micros, :numeric_string => true, as: 'configUpdateTimestampMicros'
          property :control_packet_counts, as: 'controlPacketCounts', class: Google::Apis::ComputeAlpha::BfdStatusPacketCounts, decorator: Google::Apis::ComputeAlpha::BfdStatusPacketCounts::Representation
      
          collection :control_packet_intervals, as: 'controlPacketIntervals', class: Google::Apis::ComputeAlpha::PacketIntervals, decorator: Google::Apis::ComputeAlpha::PacketIntervals::Representation
      
          property :echo_packet_counts, as: 'echoPacketCounts', class: Google::Apis::ComputeAlpha::BfdStatusPacketCounts, decorator: Google::Apis::ComputeAlpha::BfdStatusPacketCounts::Representation
      
          collection :echo_packet_intervals, as: 'echoPacketIntervals', class: Google::Apis::ComputeAlpha::PacketIntervals, decorator: Google::Apis::ComputeAlpha::PacketIntervals::Representation
      
          property :local_diagnostic, as: 'localDiagnostic'
          property :local_state, as: 'localState'
          property :negotiated_local_control_tx_interval_ms, as: 'negotiatedLocalControlTxIntervalMs'
          property :negotiated_local_echo_tx_interval_ms, as: 'negotiatedLocalEchoTxIntervalMs'
          property :rx_packet, as: 'rxPacket', class: Google::Apis::ComputeAlpha::BfdPacket, decorator: Google::Apis::ComputeAlpha::BfdPacket::Representation
      
          property :tx_packet, as: 'txPacket', class: Google::Apis::ComputeAlpha::BfdPacket, decorator: Google::Apis::ComputeAlpha::BfdPacket::Representation
      
          property :uptime_ms, :numeric_string => true, as: 'uptimeMs'
          property :using_echo_mode, as: 'usingEchoMode'
        end
      end
      
      class BfdStatusPacketCounts
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :num_rx, as: 'numRx'
          property :num_rx_rejected, as: 'numRxRejected'
          property :num_rx_successful, as: 'numRxSuccessful'
          property :num_tx, as: 'numTx'
        end
      end
      
      class Binding
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :condition, as: 'condition', class: Google::Apis::ComputeAlpha::Expr, decorator: Google::Apis::ComputeAlpha::Expr::Representation
      
          collection :members, as: 'members'
          property :role, as: 'role'
        end
      end
      
      class CacheInvalidationRule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :host, as: 'host'
          property :path, as: 'path'
        end
      end
      
      class CacheKeyPolicy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :include_host, as: 'includeHost'
          property :include_protocol, as: 'includeProtocol'
          property :include_query_string, as: 'includeQueryString'
          collection :query_string_blacklist, as: 'queryStringBlacklist'
          collection :query_string_whitelist, as: 'queryStringWhitelist'
        end
      end
      
      class CallCredentials
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :call_credential_type, as: 'callCredentialType'
          property :from_plugin, as: 'fromPlugin', class: Google::Apis::ComputeAlpha::MetadataCredentialsFromPlugin, decorator: Google::Apis::ComputeAlpha::MetadataCredentialsFromPlugin::Representation
      
        end
      end
      
      class ChannelCredentials
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :certificates, as: 'certificates', class: Google::Apis::ComputeAlpha::TlsCertificatePaths, decorator: Google::Apis::ComputeAlpha::TlsCertificatePaths::Representation
      
          property :channel_credential_type, as: 'channelCredentialType'
        end
      end
      
      class CircuitBreakers
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :connect_timeout, as: 'connectTimeout', class: Google::Apis::ComputeAlpha::Duration, decorator: Google::Apis::ComputeAlpha::Duration::Representation
      
          property :max_connections, as: 'maxConnections'
          property :max_pending_requests, as: 'maxPendingRequests'
          property :max_requests, as: 'maxRequests'
          property :max_requests_per_connection, as: 'maxRequestsPerConnection'
          property :max_retries, as: 'maxRetries'
        end
      end
      
      class ClientTlsSettings
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :client_tls_context, as: 'clientTlsContext', class: Google::Apis::ComputeAlpha::TlsContext, decorator: Google::Apis::ComputeAlpha::TlsContext::Representation
      
          property :mode, as: 'mode'
          property :sni, as: 'sni'
          collection :subject_alt_names, as: 'subjectAltNames'
        end
      end
      
      class Commitment
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :category, as: 'category'
          property :creation_timestamp, as: 'creationTimestamp'
          property :description, as: 'description'
          property :end_timestamp, as: 'endTimestamp'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          collection :license_resources, as: 'licenseResources', class: Google::Apis::ComputeAlpha::LicenseResourceCommitment, decorator: Google::Apis::ComputeAlpha::LicenseResourceCommitment::Representation
      
          property :name, as: 'name'
          property :plan, as: 'plan'
          property :region, as: 'region'
          collection :reservations, as: 'reservations', class: Google::Apis::ComputeAlpha::Reservation, decorator: Google::Apis::ComputeAlpha::Reservation::Representation
      
          collection :resources, as: 'resources', class: Google::Apis::ComputeAlpha::ResourceCommitment, decorator: Google::Apis::ComputeAlpha::ResourceCommitment::Representation
      
          property :self_link, as: 'selfLink'
          property :self_link_with_id, as: 'selfLinkWithId'
          property :start_timestamp, as: 'startTimestamp'
          property :status, as: 'status'
          property :status_message, as: 'statusMessage'
          property :type, as: 'type'
        end
      end
      
      class CommitmentAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeAlpha::CommitmentsScopedList, decorator: Google::Apis::ComputeAlpha::CommitmentsScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::CommitmentAggregatedList::Warning, decorator: Google::Apis::ComputeAlpha::CommitmentAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::CommitmentAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::CommitmentAggregatedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class CommitmentList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::Commitment, decorator: Google::Apis::ComputeAlpha::Commitment::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::CommitmentList::Warning, decorator: Google::Apis::ComputeAlpha::CommitmentList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::CommitmentList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::CommitmentList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class CommitmentsScopedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :commitments, as: 'commitments', class: Google::Apis::ComputeAlpha::Commitment, decorator: Google::Apis::ComputeAlpha::Commitment::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::CommitmentsScopedList::Warning, decorator: Google::Apis::ComputeAlpha::CommitmentsScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::CommitmentsScopedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::CommitmentsScopedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class Condition
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :iam, as: 'iam'
          property :op, as: 'op'
          property :svc, as: 'svc'
          property :sys, as: 'sys'
          collection :values, as: 'values'
        end
      end
      
      class ConfidentialInstanceConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :enable_confidential_compute, as: 'enableConfidentialCompute'
        end
      end
      
      class ConnectionDraining
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :draining_timeout_sec, as: 'drainingTimeoutSec'
        end
      end
      
      class ConsistentHashLoadBalancerSettings
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :http_cookie, as: 'httpCookie', class: Google::Apis::ComputeAlpha::ConsistentHashLoadBalancerSettingsHttpCookie, decorator: Google::Apis::ComputeAlpha::ConsistentHashLoadBalancerSettingsHttpCookie::Representation
      
          property :http_header_name, as: 'httpHeaderName'
          property :minimum_ring_size, :numeric_string => true, as: 'minimumRingSize'
        end
      end
      
      class ConsistentHashLoadBalancerSettingsHttpCookie
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :path, as: 'path'
          property :ttl, as: 'ttl', class: Google::Apis::ComputeAlpha::Duration, decorator: Google::Apis::ComputeAlpha::Duration::Representation
      
        end
      end
      
      class CorsPolicy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :allow_credentials, as: 'allowCredentials'
          collection :allow_headers, as: 'allowHeaders'
          collection :allow_methods, as: 'allowMethods'
          collection :allow_origin_regexes, as: 'allowOriginRegexes'
          collection :allow_origins, as: 'allowOrigins'
          property :disabled, as: 'disabled'
          collection :expose_headers, as: 'exposeHeaders'
          property :max_age, as: 'maxAge'
        end
      end
      
      class CustomerEncryptionKey
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kms_key_name, as: 'kmsKeyName'
          property :kms_key_service_account, as: 'kmsKeyServiceAccount'
          property :raw_key, as: 'rawKey'
          property :rsa_encrypted_key, as: 'rsaEncryptedKey'
          property :sha256, as: 'sha256'
        end
      end
      
      class CustomerEncryptionKeyProtectedDisk
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :disk_encryption_key, as: 'diskEncryptionKey', class: Google::Apis::ComputeAlpha::CustomerEncryptionKey, decorator: Google::Apis::ComputeAlpha::CustomerEncryptionKey::Representation
      
          property :source, as: 'source'
        end
      end
      
      class DeprecationStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :deleted, as: 'deleted'
          property :deprecated, as: 'deprecated'
          property :obsolete, as: 'obsolete'
          property :replacement, as: 'replacement'
          property :state, as: 'state'
        end
      end
      
      class Disk
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creation_timestamp, as: 'creationTimestamp'
          property :description, as: 'description'
          property :disk_encryption_key, as: 'diskEncryptionKey', class: Google::Apis::ComputeAlpha::CustomerEncryptionKey, decorator: Google::Apis::ComputeAlpha::CustomerEncryptionKey::Representation
      
          property :erase_windows_vss_signature, as: 'eraseWindowsVssSignature'
          collection :guest_os_features, as: 'guestOsFeatures', class: Google::Apis::ComputeAlpha::GuestOsFeature, decorator: Google::Apis::ComputeAlpha::GuestOsFeature::Representation
      
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :label_fingerprint, :base64 => true, as: 'labelFingerprint'
          hash :labels, as: 'labels'
          property :last_attach_timestamp, as: 'lastAttachTimestamp'
          property :last_detach_timestamp, as: 'lastDetachTimestamp'
          collection :license_codes, as: 'licenseCodes'
          collection :licenses, as: 'licenses'
          property :multi_writer, as: 'multiWriter'
          property :name, as: 'name'
          property :options, as: 'options'
          property :physical_block_size_bytes, :numeric_string => true, as: 'physicalBlockSizeBytes'
          property :region, as: 'region'
          collection :replica_zones, as: 'replicaZones'
          collection :resource_policies, as: 'resourcePolicies'
          property :self_link, as: 'selfLink'
          property :self_link_with_id, as: 'selfLinkWithId'
          property :size_gb, :numeric_string => true, as: 'sizeGb'
          property :source_disk, as: 'sourceDisk'
          property :source_disk_id, as: 'sourceDiskId'
          property :source_image, as: 'sourceImage'
          property :source_image_encryption_key, as: 'sourceImageEncryptionKey', class: Google::Apis::ComputeAlpha::CustomerEncryptionKey, decorator: Google::Apis::ComputeAlpha::CustomerEncryptionKey::Representation
      
          property :source_image_id, as: 'sourceImageId'
          property :source_snapshot, as: 'sourceSnapshot'
          property :source_snapshot_encryption_key, as: 'sourceSnapshotEncryptionKey', class: Google::Apis::ComputeAlpha::CustomerEncryptionKey, decorator: Google::Apis::ComputeAlpha::CustomerEncryptionKey::Representation
      
          property :source_snapshot_id, as: 'sourceSnapshotId'
          property :status, as: 'status'
          property :storage_type, as: 'storageType'
          property :type, as: 'type'
          collection :users, as: 'users'
          property :zone, as: 'zone'
        end
      end
      
      class DiskAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeAlpha::DisksScopedList, decorator: Google::Apis::ComputeAlpha::DisksScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::DiskAggregatedList::Warning, decorator: Google::Apis::ComputeAlpha::DiskAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::DiskAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::DiskAggregatedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class DiskInstantiationConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :auto_delete, as: 'autoDelete'
          property :custom_image, as: 'customImage'
          property :device_name, as: 'deviceName'
          property :instantiate_from, as: 'instantiateFrom'
        end
      end
      
      class DiskList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::Disk, decorator: Google::Apis::ComputeAlpha::Disk::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::DiskList::Warning, decorator: Google::Apis::ComputeAlpha::DiskList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::DiskList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::DiskList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class DiskMoveRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :destination_zone, as: 'destinationZone'
          property :target_disk, as: 'targetDisk'
        end
      end
      
      class DiskType
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creation_timestamp, as: 'creationTimestamp'
          property :default_disk_size_gb, :numeric_string => true, as: 'defaultDiskSizeGb'
          property :deprecated, as: 'deprecated', class: Google::Apis::ComputeAlpha::DeprecationStatus, decorator: Google::Apis::ComputeAlpha::DeprecationStatus::Representation
      
          property :description, as: 'description'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :region, as: 'region'
          property :self_link, as: 'selfLink'
          property :self_link_with_id, as: 'selfLinkWithId'
          property :valid_disk_size, as: 'validDiskSize'
          property :zone, as: 'zone'
        end
      end
      
      class DiskTypeAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeAlpha::DiskTypesScopedList, decorator: Google::Apis::ComputeAlpha::DiskTypesScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::DiskTypeAggregatedList::Warning, decorator: Google::Apis::ComputeAlpha::DiskTypeAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::DiskTypeAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::DiskTypeAggregatedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class DiskTypeList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::DiskType, decorator: Google::Apis::ComputeAlpha::DiskType::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::DiskTypeList::Warning, decorator: Google::Apis::ComputeAlpha::DiskTypeList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::DiskTypeList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::DiskTypeList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class DiskTypesScopedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :disk_types, as: 'diskTypes', class: Google::Apis::ComputeAlpha::DiskType, decorator: Google::Apis::ComputeAlpha::DiskType::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::DiskTypesScopedList::Warning, decorator: Google::Apis::ComputeAlpha::DiskTypesScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::DiskTypesScopedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::DiskTypesScopedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class DisksAddResourcePoliciesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :resource_policies, as: 'resourcePolicies'
        end
      end
      
      class DisksRemoveResourcePoliciesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :resource_policies, as: 'resourcePolicies'
        end
      end
      
      class DisksResizeRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :size_gb, :numeric_string => true, as: 'sizeGb'
        end
      end
      
      class DisksScopedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :disks, as: 'disks', class: Google::Apis::ComputeAlpha::Disk, decorator: Google::Apis::ComputeAlpha::Disk::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::DisksScopedList::Warning, decorator: Google::Apis::ComputeAlpha::DisksScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::DisksScopedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::DisksScopedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class DisplayDevice
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :enable_display, as: 'enableDisplay'
        end
      end
      
      class DistributionPolicy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :zones, as: 'zones', class: Google::Apis::ComputeAlpha::DistributionPolicyZoneConfiguration, decorator: Google::Apis::ComputeAlpha::DistributionPolicyZoneConfiguration::Representation
      
        end
      end
      
      class DistributionPolicyZoneConfiguration
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :zone, as: 'zone'
        end
      end
      
      class Duration
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :nanos, as: 'nanos'
          property :seconds, :numeric_string => true, as: 'seconds'
        end
      end
      
      class ExchangedPeeringRoute
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :dest_range, as: 'destRange'
          property :imported, as: 'imported'
          property :next_hop_region, as: 'nextHopRegion'
          property :priority, as: 'priority'
          property :type, as: 'type'
        end
      end
      
      class ExchangedPeeringRoutesList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::ExchangedPeeringRoute, decorator: Google::Apis::ComputeAlpha::ExchangedPeeringRoute::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::ExchangedPeeringRoutesList::Warning, decorator: Google::Apis::ComputeAlpha::ExchangedPeeringRoutesList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::ExchangedPeeringRoutesList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::ExchangedPeeringRoutesList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class Expr
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :expression, as: 'expression'
          property :location, as: 'location'
          property :title, as: 'title'
        end
      end
      
      class ExternalVpnGateway
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creation_timestamp, as: 'creationTimestamp'
          property :description, as: 'description'
          property :id, :numeric_string => true, as: 'id'
          collection :interfaces, as: 'interfaces', class: Google::Apis::ComputeAlpha::ExternalVpnGatewayInterface, decorator: Google::Apis::ComputeAlpha::ExternalVpnGatewayInterface::Representation
      
          property :kind, as: 'kind'
          property :label_fingerprint, :base64 => true, as: 'labelFingerprint'
          hash :labels, as: 'labels'
          property :name, as: 'name'
          property :redundancy_type, as: 'redundancyType'
          property :self_link, as: 'selfLink'
        end
      end
      
      class ExternalVpnGatewayInterface
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          property :ip_address, as: 'ipAddress'
        end
      end
      
      class ExternalVpnGatewayList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::ExternalVpnGateway, decorator: Google::Apis::ComputeAlpha::ExternalVpnGateway::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::ExternalVpnGatewayList::Warning, decorator: Google::Apis::ComputeAlpha::ExternalVpnGatewayList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::ExternalVpnGatewayList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::ExternalVpnGatewayList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class FileContentBuffer
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :content, :base64 => true, as: 'content'
          property :file_type, as: 'fileType'
        end
      end
      
      class Firewall
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :allowed, as: 'allowed', class: Google::Apis::ComputeAlpha::Firewall::Allowed, decorator: Google::Apis::ComputeAlpha::Firewall::Allowed::Representation
      
          property :creation_timestamp, as: 'creationTimestamp'
          collection :denied, as: 'denied', class: Google::Apis::ComputeAlpha::Firewall::Denied, decorator: Google::Apis::ComputeAlpha::Firewall::Denied::Representation
      
          property :description, as: 'description'
          collection :destination_ranges, as: 'destinationRanges'
          property :direction, as: 'direction'
          property :disabled, as: 'disabled'
          property :enable_logging, as: 'enableLogging'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :log_config, as: 'logConfig', class: Google::Apis::ComputeAlpha::FirewallLogConfig, decorator: Google::Apis::ComputeAlpha::FirewallLogConfig::Representation
      
          property :name, as: 'name'
          property :network, as: 'network'
          property :priority, as: 'priority'
          property :self_link, as: 'selfLink'
          property :self_link_with_id, as: 'selfLinkWithId'
          collection :source_ranges, as: 'sourceRanges'
          collection :source_service_accounts, as: 'sourceServiceAccounts'
          collection :source_tags, as: 'sourceTags'
          collection :target_service_accounts, as: 'targetServiceAccounts'
          collection :target_tags, as: 'targetTags'
        end
        
        class Allowed
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :ip_protocol, as: 'IPProtocol'
            collection :ports, as: 'ports'
          end
        end
        
        class Denied
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :ip_protocol, as: 'IPProtocol'
            collection :ports, as: 'ports'
          end
        end
      end
      
      class FirewallList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::Firewall, decorator: Google::Apis::ComputeAlpha::Firewall::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::FirewallList::Warning, decorator: Google::Apis::ComputeAlpha::FirewallList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::FirewallList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::FirewallList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class FirewallLogConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :enable, as: 'enable'
          property :metadata, as: 'metadata'
        end
      end
      
      class FixedOrPercent
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :calculated, as: 'calculated'
          property :fixed, as: 'fixed'
          property :percent, as: 'percent'
        end
      end
      
      class ForwardingRule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :ip_address, as: 'IPAddress'
          property :ip_protocol, as: 'IPProtocol'
          property :all_ports, as: 'allPorts'
          property :allow_global_access, as: 'allowGlobalAccess'
          property :backend_service, as: 'backendService'
          property :creation_timestamp, as: 'creationTimestamp'
          property :description, as: 'description'
          property :fingerprint, :base64 => true, as: 'fingerprint'
          property :id, :numeric_string => true, as: 'id'
          property :ip_version, as: 'ipVersion'
          property :is_mirroring_collector, as: 'isMirroringCollector'
          property :kind, as: 'kind'
          property :label_fingerprint, :base64 => true, as: 'labelFingerprint'
          hash :labels, as: 'labels'
          property :load_balancing_scheme, as: 'loadBalancingScheme'
          collection :metadata_filters, as: 'metadataFilters', class: Google::Apis::ComputeAlpha::MetadataFilter, decorator: Google::Apis::ComputeAlpha::MetadataFilter::Representation
      
          property :name, as: 'name'
          property :network, as: 'network'
          property :network_tier, as: 'networkTier'
          property :port_range, as: 'portRange'
          collection :ports, as: 'ports'
          property :region, as: 'region'
          property :self_link, as: 'selfLink'
          property :self_link_with_id, as: 'selfLinkWithId'
          property :service_label, as: 'serviceLabel'
          property :service_name, as: 'serviceName'
          property :subnetwork, as: 'subnetwork'
          property :target, as: 'target'
        end
      end
      
      class ForwardingRuleAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeAlpha::ForwardingRulesScopedList, decorator: Google::Apis::ComputeAlpha::ForwardingRulesScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::ForwardingRuleAggregatedList::Warning, decorator: Google::Apis::ComputeAlpha::ForwardingRuleAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::ForwardingRuleAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::ForwardingRuleAggregatedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class ForwardingRuleList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::ForwardingRule, decorator: Google::Apis::ComputeAlpha::ForwardingRule::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::ForwardingRuleList::Warning, decorator: Google::Apis::ComputeAlpha::ForwardingRuleList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::ForwardingRuleList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::ForwardingRuleList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class ForwardingRuleReference
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :forwarding_rule, as: 'forwardingRule'
        end
      end
      
      class ForwardingRulesScopedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :forwarding_rules, as: 'forwardingRules', class: Google::Apis::ComputeAlpha::ForwardingRule, decorator: Google::Apis::ComputeAlpha::ForwardingRule::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::ForwardingRulesScopedList::Warning, decorator: Google::Apis::ComputeAlpha::ForwardingRulesScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::ForwardingRulesScopedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::ForwardingRulesScopedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class GlobalNetworkEndpointGroupsAttachEndpointsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :network_endpoints, as: 'networkEndpoints', class: Google::Apis::ComputeAlpha::NetworkEndpoint, decorator: Google::Apis::ComputeAlpha::NetworkEndpoint::Representation
      
        end
      end
      
      class GlobalNetworkEndpointGroupsDetachEndpointsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :network_endpoints, as: 'networkEndpoints', class: Google::Apis::ComputeAlpha::NetworkEndpoint, decorator: Google::Apis::ComputeAlpha::NetworkEndpoint::Representation
      
        end
      end
      
      class GlobalSetLabelsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :label_fingerprint, :base64 => true, as: 'labelFingerprint'
          hash :labels, as: 'labels'
        end
      end
      
      class GlobalSetPolicyRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :bindings, as: 'bindings', class: Google::Apis::ComputeAlpha::Binding, decorator: Google::Apis::ComputeAlpha::Binding::Representation
      
          property :etag, :base64 => true, as: 'etag'
          property :policy, as: 'policy', class: Google::Apis::ComputeAlpha::Policy, decorator: Google::Apis::ComputeAlpha::Policy::Representation
      
        end
      end
      
      class GrpcServiceConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :call_credentials, as: 'callCredentials', class: Google::Apis::ComputeAlpha::CallCredentials, decorator: Google::Apis::ComputeAlpha::CallCredentials::Representation
      
          property :channel_credentials, as: 'channelCredentials', class: Google::Apis::ComputeAlpha::ChannelCredentials, decorator: Google::Apis::ComputeAlpha::ChannelCredentials::Representation
      
          property :target_uri, as: 'targetUri'
        end
      end
      
      class GuestAttributes
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :query_path, as: 'queryPath'
          property :query_value, as: 'queryValue', class: Google::Apis::ComputeAlpha::GuestAttributesValue, decorator: Google::Apis::ComputeAlpha::GuestAttributesValue::Representation
      
          property :self_link, as: 'selfLink'
          property :variable_key, as: 'variableKey'
          property :variable_value, as: 'variableValue'
        end
      end
      
      class GuestAttributesEntry
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :key, as: 'key'
          property :namespace, as: 'namespace'
          property :value, as: 'value'
        end
      end
      
      class GuestAttributesValue
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::GuestAttributesEntry, decorator: Google::Apis::ComputeAlpha::GuestAttributesEntry::Representation
      
        end
      end
      
      class GuestOsFeature
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :type, as: 'type'
        end
      end
      
      class Http2HealthCheck
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :host, as: 'host'
          property :port, as: 'port'
          property :port_name, as: 'portName'
          property :port_specification, as: 'portSpecification'
          property :proxy_header, as: 'proxyHeader'
          property :request_path, as: 'requestPath'
          property :response, as: 'response'
        end
      end
      
      class HttpHealthCheck
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :host, as: 'host'
          property :port, as: 'port'
          property :port_name, as: 'portName'
          property :port_specification, as: 'portSpecification'
          property :proxy_header, as: 'proxyHeader'
          property :request_path, as: 'requestPath'
          property :response, as: 'response'
        end
      end
      
      class HttpsHealthCheck
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :host, as: 'host'
          property :port, as: 'port'
          property :port_name, as: 'portName'
          property :port_specification, as: 'portSpecification'
          property :proxy_header, as: 'proxyHeader'
          property :request_path, as: 'requestPath'
          property :response, as: 'response'
        end
      end
      
      class HealthCheck
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :check_interval_sec, as: 'checkIntervalSec'
          property :creation_timestamp, as: 'creationTimestamp'
          property :description, as: 'description'
          property :healthy_threshold, as: 'healthyThreshold'
          property :http2_health_check, as: 'http2HealthCheck', class: Google::Apis::ComputeAlpha::Http2HealthCheck, decorator: Google::Apis::ComputeAlpha::Http2HealthCheck::Representation
      
          property :http_health_check, as: 'httpHealthCheck', class: Google::Apis::ComputeAlpha::HttpHealthCheck, decorator: Google::Apis::ComputeAlpha::HttpHealthCheck::Representation
      
          property :https_health_check, as: 'httpsHealthCheck', class: Google::Apis::ComputeAlpha::HttpsHealthCheck, decorator: Google::Apis::ComputeAlpha::HttpsHealthCheck::Representation
      
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :log_config, as: 'logConfig', class: Google::Apis::ComputeAlpha::HealthCheckLogConfig, decorator: Google::Apis::ComputeAlpha::HealthCheckLogConfig::Representation
      
          property :name, as: 'name'
          property :region, as: 'region'
          property :self_link, as: 'selfLink'
          property :self_link_with_id, as: 'selfLinkWithId'
          property :ssl_health_check, as: 'sslHealthCheck', class: Google::Apis::ComputeAlpha::SslHealthCheck, decorator: Google::Apis::ComputeAlpha::SslHealthCheck::Representation
      
          property :tcp_health_check, as: 'tcpHealthCheck', class: Google::Apis::ComputeAlpha::TcpHealthCheck, decorator: Google::Apis::ComputeAlpha::TcpHealthCheck::Representation
      
          property :timeout_sec, as: 'timeoutSec'
          property :type, as: 'type'
          property :udp_health_check, as: 'udpHealthCheck', class: Google::Apis::ComputeAlpha::UdpHealthCheck, decorator: Google::Apis::ComputeAlpha::UdpHealthCheck::Representation
      
          property :unhealthy_threshold, as: 'unhealthyThreshold'
        end
      end
      
      class HealthCheckList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::HealthCheck, decorator: Google::Apis::ComputeAlpha::HealthCheck::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::HealthCheckList::Warning, decorator: Google::Apis::ComputeAlpha::HealthCheckList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::HealthCheckList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::HealthCheckList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class HealthCheckLogConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :enable, as: 'enable'
        end
      end
      
      class HealthCheckReference
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :health_check, as: 'healthCheck'
        end
      end
      
      class HealthCheckService
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creation_timestamp, as: 'creationTimestamp'
          property :description, as: 'description'
          collection :health_checks, as: 'healthChecks'
          property :health_status_aggregation_policy, as: 'healthStatusAggregationPolicy'
          property :health_status_aggregation_strategy, as: 'healthStatusAggregationStrategy'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          collection :network_endpoint_groups, as: 'networkEndpointGroups'
          collection :notification_endpoints, as: 'notificationEndpoints'
          property :region, as: 'region'
          property :self_link, as: 'selfLink'
          property :self_link_with_id, as: 'selfLinkWithId'
        end
      end
      
      class HealthCheckServiceReference
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :health_check_service, as: 'healthCheckService'
        end
      end
      
      class HealthCheckServicesList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::HealthCheckService, decorator: Google::Apis::ComputeAlpha::HealthCheckService::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::HealthCheckServicesList::Warning, decorator: Google::Apis::ComputeAlpha::HealthCheckServicesList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::HealthCheckServicesList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::HealthCheckServicesList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class HealthChecksAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeAlpha::HealthChecksScopedList, decorator: Google::Apis::ComputeAlpha::HealthChecksScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::HealthChecksAggregatedList::Warning, decorator: Google::Apis::ComputeAlpha::HealthChecksAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::HealthChecksAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::HealthChecksAggregatedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class HealthChecksScopedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :health_checks, as: 'healthChecks', class: Google::Apis::ComputeAlpha::HealthCheck, decorator: Google::Apis::ComputeAlpha::HealthCheck::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::HealthChecksScopedList::Warning, decorator: Google::Apis::ComputeAlpha::HealthChecksScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::HealthChecksScopedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::HealthChecksScopedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class HealthStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :annotations, as: 'annotations'
          property :health_state, as: 'healthState'
          property :instance, as: 'instance'
          property :ip_address, as: 'ipAddress'
          property :port, as: 'port'
        end
      end
      
      class HealthStatusForNetworkEndpoint
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :backend_service, as: 'backendService', class: Google::Apis::ComputeAlpha::BackendServiceReference, decorator: Google::Apis::ComputeAlpha::BackendServiceReference::Representation
      
          property :forwarding_rule, as: 'forwardingRule', class: Google::Apis::ComputeAlpha::ForwardingRuleReference, decorator: Google::Apis::ComputeAlpha::ForwardingRuleReference::Representation
      
          property :health_check, as: 'healthCheck', class: Google::Apis::ComputeAlpha::HealthCheckReference, decorator: Google::Apis::ComputeAlpha::HealthCheckReference::Representation
      
          property :health_check_service, as: 'healthCheckService', class: Google::Apis::ComputeAlpha::HealthCheckServiceReference, decorator: Google::Apis::ComputeAlpha::HealthCheckServiceReference::Representation
      
          property :health_state, as: 'healthState'
        end
      end
      
      class HostRule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          collection :hosts, as: 'hosts'
          property :path_matcher, as: 'pathMatcher'
        end
      end
      
      class HttpFaultAbort
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :http_status, as: 'httpStatus'
          property :percentage, as: 'percentage'
        end
      end
      
      class HttpFaultDelay
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :fixed_delay, as: 'fixedDelay', class: Google::Apis::ComputeAlpha::Duration, decorator: Google::Apis::ComputeAlpha::Duration::Representation
      
          property :percentage, as: 'percentage'
        end
      end
      
      class HttpFaultInjection
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :abort, as: 'abort', class: Google::Apis::ComputeAlpha::HttpFaultAbort, decorator: Google::Apis::ComputeAlpha::HttpFaultAbort::Representation
      
          property :delay, as: 'delay', class: Google::Apis::ComputeAlpha::HttpFaultDelay, decorator: Google::Apis::ComputeAlpha::HttpFaultDelay::Representation
      
        end
      end
      
      class HttpHeaderAction
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :request_headers_to_add, as: 'requestHeadersToAdd', class: Google::Apis::ComputeAlpha::HttpHeaderOption, decorator: Google::Apis::ComputeAlpha::HttpHeaderOption::Representation
      
          collection :request_headers_to_remove, as: 'requestHeadersToRemove'
          collection :response_headers_to_add, as: 'responseHeadersToAdd', class: Google::Apis::ComputeAlpha::HttpHeaderOption, decorator: Google::Apis::ComputeAlpha::HttpHeaderOption::Representation
      
          collection :response_headers_to_remove, as: 'responseHeadersToRemove'
        end
      end
      
      class HttpHeaderMatch
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :exact_match, as: 'exactMatch'
          property :header_name, as: 'headerName'
          property :invert_match, as: 'invertMatch'
          property :prefix_match, as: 'prefixMatch'
          property :present_match, as: 'presentMatch'
          property :range_match, as: 'rangeMatch', class: Google::Apis::ComputeAlpha::Int64RangeMatch, decorator: Google::Apis::ComputeAlpha::Int64RangeMatch::Representation
      
          property :regex_match, as: 'regexMatch'
          property :suffix_match, as: 'suffixMatch'
        end
      end
      
      class HttpHeaderOption
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :header_name, as: 'headerName'
          property :header_value, as: 'headerValue'
          property :replace, as: 'replace'
        end
      end
      
      class HttpHealthCheck
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :check_interval_sec, as: 'checkIntervalSec'
          property :creation_timestamp, as: 'creationTimestamp'
          property :description, as: 'description'
          property :healthy_threshold, as: 'healthyThreshold'
          property :host, as: 'host'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :port, as: 'port'
          property :request_path, as: 'requestPath'
          property :self_link, as: 'selfLink'
          property :self_link_with_id, as: 'selfLinkWithId'
          property :timeout_sec, as: 'timeoutSec'
          property :unhealthy_threshold, as: 'unhealthyThreshold'
        end
      end
      
      class HttpHealthCheckList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::HttpHealthCheck, decorator: Google::Apis::ComputeAlpha::HttpHealthCheck::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::HttpHealthCheckList::Warning, decorator: Google::Apis::ComputeAlpha::HttpHealthCheckList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::HttpHealthCheckList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::HttpHealthCheckList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class HttpQueryParameterMatch
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :exact_match, as: 'exactMatch'
          property :name, as: 'name'
          property :present_match, as: 'presentMatch'
          property :regex_match, as: 'regexMatch'
        end
      end
      
      class HttpRedirectAction
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :host_redirect, as: 'hostRedirect'
          property :https_redirect, as: 'httpsRedirect'
          property :path_redirect, as: 'pathRedirect'
          property :prefix_redirect, as: 'prefixRedirect'
          property :redirect_response_code, as: 'redirectResponseCode'
          property :strip_query, as: 'stripQuery'
        end
      end
      
      class HttpRetryPolicy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :num_retries, as: 'numRetries'
          property :per_try_timeout, as: 'perTryTimeout', class: Google::Apis::ComputeAlpha::Duration, decorator: Google::Apis::ComputeAlpha::Duration::Representation
      
          collection :retry_conditions, as: 'retryConditions'
        end
      end
      
      class HttpRouteAction
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cors_policy, as: 'corsPolicy', class: Google::Apis::ComputeAlpha::CorsPolicy, decorator: Google::Apis::ComputeAlpha::CorsPolicy::Representation
      
          property :fault_injection_policy, as: 'faultInjectionPolicy', class: Google::Apis::ComputeAlpha::HttpFaultInjection, decorator: Google::Apis::ComputeAlpha::HttpFaultInjection::Representation
      
          property :request_mirror_policy, as: 'requestMirrorPolicy', class: Google::Apis::ComputeAlpha::RequestMirrorPolicy, decorator: Google::Apis::ComputeAlpha::RequestMirrorPolicy::Representation
      
          property :retry_policy, as: 'retryPolicy', class: Google::Apis::ComputeAlpha::HttpRetryPolicy, decorator: Google::Apis::ComputeAlpha::HttpRetryPolicy::Representation
      
          property :timeout, as: 'timeout', class: Google::Apis::ComputeAlpha::Duration, decorator: Google::Apis::ComputeAlpha::Duration::Representation
      
          property :url_rewrite, as: 'urlRewrite', class: Google::Apis::ComputeAlpha::UrlRewrite, decorator: Google::Apis::ComputeAlpha::UrlRewrite::Representation
      
          collection :weighted_backend_services, as: 'weightedBackendServices', class: Google::Apis::ComputeAlpha::WeightedBackendService, decorator: Google::Apis::ComputeAlpha::WeightedBackendService::Representation
      
        end
      end
      
      class HttpRouteRule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :header_action, as: 'headerAction', class: Google::Apis::ComputeAlpha::HttpHeaderAction, decorator: Google::Apis::ComputeAlpha::HttpHeaderAction::Representation
      
          collection :match_rules, as: 'matchRules', class: Google::Apis::ComputeAlpha::HttpRouteRuleMatch, decorator: Google::Apis::ComputeAlpha::HttpRouteRuleMatch::Representation
      
          property :priority, as: 'priority'
          property :route_action, as: 'routeAction', class: Google::Apis::ComputeAlpha::HttpRouteAction, decorator: Google::Apis::ComputeAlpha::HttpRouteAction::Representation
      
          property :service, as: 'service'
          property :url_redirect, as: 'urlRedirect', class: Google::Apis::ComputeAlpha::HttpRedirectAction, decorator: Google::Apis::ComputeAlpha::HttpRedirectAction::Representation
      
        end
      end
      
      class HttpRouteRuleMatch
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :full_path_match, as: 'fullPathMatch'
          collection :header_matches, as: 'headerMatches', class: Google::Apis::ComputeAlpha::HttpHeaderMatch, decorator: Google::Apis::ComputeAlpha::HttpHeaderMatch::Representation
      
          property :ignore_case, as: 'ignoreCase'
          collection :metadata_filters, as: 'metadataFilters', class: Google::Apis::ComputeAlpha::MetadataFilter, decorator: Google::Apis::ComputeAlpha::MetadataFilter::Representation
      
          property :prefix_match, as: 'prefixMatch'
          collection :query_parameter_matches, as: 'queryParameterMatches', class: Google::Apis::ComputeAlpha::HttpQueryParameterMatch, decorator: Google::Apis::ComputeAlpha::HttpQueryParameterMatch::Representation
      
          property :regex_match, as: 'regexMatch'
        end
      end
      
      class HttpsHealthCheck
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :check_interval_sec, as: 'checkIntervalSec'
          property :creation_timestamp, as: 'creationTimestamp'
          property :description, as: 'description'
          property :healthy_threshold, as: 'healthyThreshold'
          property :host, as: 'host'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :port, as: 'port'
          property :request_path, as: 'requestPath'
          property :self_link, as: 'selfLink'
          property :self_link_with_id, as: 'selfLinkWithId'
          property :timeout_sec, as: 'timeoutSec'
          property :unhealthy_threshold, as: 'unhealthyThreshold'
        end
      end
      
      class HttpsHealthCheckList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::HttpsHealthCheck, decorator: Google::Apis::ComputeAlpha::HttpsHealthCheck::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::HttpsHealthCheckList::Warning, decorator: Google::Apis::ComputeAlpha::HttpsHealthCheckList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::HttpsHealthCheckList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::HttpsHealthCheckList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class Image
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :archive_size_bytes, :numeric_string => true, as: 'archiveSizeBytes'
          property :creation_timestamp, as: 'creationTimestamp'
          property :deprecated, as: 'deprecated', class: Google::Apis::ComputeAlpha::DeprecationStatus, decorator: Google::Apis::ComputeAlpha::DeprecationStatus::Representation
      
          property :description, as: 'description'
          property :disk_size_gb, :numeric_string => true, as: 'diskSizeGb'
          property :family, as: 'family'
          collection :guest_os_features, as: 'guestOsFeatures', class: Google::Apis::ComputeAlpha::GuestOsFeature, decorator: Google::Apis::ComputeAlpha::GuestOsFeature::Representation
      
          property :id, :numeric_string => true, as: 'id'
          property :image_encryption_key, as: 'imageEncryptionKey', class: Google::Apis::ComputeAlpha::CustomerEncryptionKey, decorator: Google::Apis::ComputeAlpha::CustomerEncryptionKey::Representation
      
          property :kind, as: 'kind'
          property :label_fingerprint, :base64 => true, as: 'labelFingerprint'
          hash :labels, as: 'labels'
          collection :license_codes, as: 'licenseCodes'
          collection :licenses, as: 'licenses'
          property :name, as: 'name'
          property :raw_disk, as: 'rawDisk', class: Google::Apis::ComputeAlpha::Image::RawDisk, decorator: Google::Apis::ComputeAlpha::Image::RawDisk::Representation
      
          property :self_link, as: 'selfLink'
          property :self_link_with_id, as: 'selfLinkWithId'
          property :shielded_instance_initial_state, as: 'shieldedInstanceInitialState', class: Google::Apis::ComputeAlpha::InitialStateConfig, decorator: Google::Apis::ComputeAlpha::InitialStateConfig::Representation
      
          property :source_disk, as: 'sourceDisk'
          property :source_disk_encryption_key, as: 'sourceDiskEncryptionKey', class: Google::Apis::ComputeAlpha::CustomerEncryptionKey, decorator: Google::Apis::ComputeAlpha::CustomerEncryptionKey::Representation
      
          property :source_disk_id, as: 'sourceDiskId'
          property :source_image, as: 'sourceImage'
          property :source_image_encryption_key, as: 'sourceImageEncryptionKey', class: Google::Apis::ComputeAlpha::CustomerEncryptionKey, decorator: Google::Apis::ComputeAlpha::CustomerEncryptionKey::Representation
      
          property :source_image_id, as: 'sourceImageId'
          property :source_snapshot, as: 'sourceSnapshot'
          property :source_snapshot_encryption_key, as: 'sourceSnapshotEncryptionKey', class: Google::Apis::ComputeAlpha::CustomerEncryptionKey, decorator: Google::Apis::ComputeAlpha::CustomerEncryptionKey::Representation
      
          property :source_snapshot_id, as: 'sourceSnapshotId'
          property :source_type, as: 'sourceType'
          property :status, as: 'status'
          collection :storage_locations, as: 'storageLocations'
        end
        
        class RawDisk
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :container_type, as: 'containerType'
            property :sha1_checksum, as: 'sha1Checksum'
            property :source, as: 'source'
          end
        end
      end
      
      class ImageList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::Image, decorator: Google::Apis::ComputeAlpha::Image::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::ImageList::Warning, decorator: Google::Apis::ComputeAlpha::ImageList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::ImageList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::ImageList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class InitialStateConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :dbs, as: 'dbs', class: Google::Apis::ComputeAlpha::FileContentBuffer, decorator: Google::Apis::ComputeAlpha::FileContentBuffer::Representation
      
          collection :dbxs, as: 'dbxs', class: Google::Apis::ComputeAlpha::FileContentBuffer, decorator: Google::Apis::ComputeAlpha::FileContentBuffer::Representation
      
          collection :keks, as: 'keks', class: Google::Apis::ComputeAlpha::FileContentBuffer, decorator: Google::Apis::ComputeAlpha::FileContentBuffer::Representation
      
          property :pk, as: 'pk', class: Google::Apis::ComputeAlpha::FileContentBuffer, decorator: Google::Apis::ComputeAlpha::FileContentBuffer::Representation
      
        end
      end
      
      class Instance
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :can_ip_forward, as: 'canIpForward'
          property :confidential_instance_config, as: 'confidentialInstanceConfig', class: Google::Apis::ComputeAlpha::ConfidentialInstanceConfig, decorator: Google::Apis::ComputeAlpha::ConfidentialInstanceConfig::Representation
      
          property :cpu_platform, as: 'cpuPlatform'
          property :creation_timestamp, as: 'creationTimestamp'
          property :deletion_protection, as: 'deletionProtection'
          property :description, as: 'description'
          collection :disks, as: 'disks', class: Google::Apis::ComputeAlpha::AttachedDisk, decorator: Google::Apis::ComputeAlpha::AttachedDisk::Representation
      
          property :display_device, as: 'displayDevice', class: Google::Apis::ComputeAlpha::DisplayDevice, decorator: Google::Apis::ComputeAlpha::DisplayDevice::Representation
      
          property :erase_windows_vss_signature, as: 'eraseWindowsVssSignature'
          collection :guest_accelerators, as: 'guestAccelerators', class: Google::Apis::ComputeAlpha::AcceleratorConfig, decorator: Google::Apis::ComputeAlpha::AcceleratorConfig::Representation
      
          property :hostname, as: 'hostname'
          property :id, :numeric_string => true, as: 'id'
          property :instance_encryption_key, as: 'instanceEncryptionKey', class: Google::Apis::ComputeAlpha::CustomerEncryptionKey, decorator: Google::Apis::ComputeAlpha::CustomerEncryptionKey::Representation
      
          property :kind, as: 'kind'
          property :label_fingerprint, :base64 => true, as: 'labelFingerprint'
          hash :labels, as: 'labels'
          property :machine_type, as: 'machineType'
          property :metadata, as: 'metadata', class: Google::Apis::ComputeAlpha::Metadata, decorator: Google::Apis::ComputeAlpha::Metadata::Representation
      
          property :min_cpu_platform, as: 'minCpuPlatform'
          property :name, as: 'name'
          collection :network_interfaces, as: 'networkInterfaces', class: Google::Apis::ComputeAlpha::NetworkInterface, decorator: Google::Apis::ComputeAlpha::NetworkInterface::Representation
      
          property :post_key_revocation_action_type, as: 'postKeyRevocationActionType'
          property :preserved_state_size_gb, :numeric_string => true, as: 'preservedStateSizeGb'
          property :reservation_affinity, as: 'reservationAffinity', class: Google::Apis::ComputeAlpha::ReservationAffinity, decorator: Google::Apis::ComputeAlpha::ReservationAffinity::Representation
      
          collection :resource_policies, as: 'resourcePolicies'
          property :scheduling, as: 'scheduling', class: Google::Apis::ComputeAlpha::Scheduling, decorator: Google::Apis::ComputeAlpha::Scheduling::Representation
      
          property :self_link, as: 'selfLink'
          property :self_link_with_id, as: 'selfLinkWithId'
          collection :service_accounts, as: 'serviceAccounts', class: Google::Apis::ComputeAlpha::ServiceAccount, decorator: Google::Apis::ComputeAlpha::ServiceAccount::Representation
      
          property :shielded_instance_config, as: 'shieldedInstanceConfig', class: Google::Apis::ComputeAlpha::ShieldedInstanceConfig, decorator: Google::Apis::ComputeAlpha::ShieldedInstanceConfig::Representation
      
          property :shielded_instance_integrity_policy, as: 'shieldedInstanceIntegrityPolicy', class: Google::Apis::ComputeAlpha::ShieldedInstanceIntegrityPolicy, decorator: Google::Apis::ComputeAlpha::ShieldedInstanceIntegrityPolicy::Representation
      
          property :shielded_vm_config, as: 'shieldedVmConfig', class: Google::Apis::ComputeAlpha::ShieldedVmConfig, decorator: Google::Apis::ComputeAlpha::ShieldedVmConfig::Representation
      
          property :shielded_vm_integrity_policy, as: 'shieldedVmIntegrityPolicy', class: Google::Apis::ComputeAlpha::ShieldedVmIntegrityPolicy, decorator: Google::Apis::ComputeAlpha::ShieldedVmIntegrityPolicy::Representation
      
          property :source_machine_image, as: 'sourceMachineImage'
          property :source_machine_image_encryption_key, as: 'sourceMachineImageEncryptionKey', class: Google::Apis::ComputeAlpha::CustomerEncryptionKey, decorator: Google::Apis::ComputeAlpha::CustomerEncryptionKey::Representation
      
          property :start_restricted, as: 'startRestricted'
          property :status, as: 'status'
          property :status_message, as: 'statusMessage'
          property :tags, as: 'tags', class: Google::Apis::ComputeAlpha::Tags, decorator: Google::Apis::ComputeAlpha::Tags::Representation
      
          property :zone, as: 'zone'
        end
      end
      
      class InstanceAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeAlpha::InstancesScopedList, decorator: Google::Apis::ComputeAlpha::InstancesScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::InstanceAggregatedList::Warning, decorator: Google::Apis::ComputeAlpha::InstanceAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::InstanceAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::InstanceAggregatedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class InstanceGroup
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creation_timestamp, as: 'creationTimestamp'
          property :description, as: 'description'
          property :fingerprint, :base64 => true, as: 'fingerprint'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          collection :named_ports, as: 'namedPorts', class: Google::Apis::ComputeAlpha::NamedPort, decorator: Google::Apis::ComputeAlpha::NamedPort::Representation
      
          property :network, as: 'network'
          property :region, as: 'region'
          property :self_link, as: 'selfLink'
          property :self_link_with_id, as: 'selfLinkWithId'
          property :size, as: 'size'
          property :subnetwork, as: 'subnetwork'
          property :zone, as: 'zone'
        end
      end
      
      class InstanceGroupAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeAlpha::InstanceGroupsScopedList, decorator: Google::Apis::ComputeAlpha::InstanceGroupsScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::InstanceGroupAggregatedList::Warning, decorator: Google::Apis::ComputeAlpha::InstanceGroupAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::InstanceGroupAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::InstanceGroupAggregatedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class InstanceGroupList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::InstanceGroup, decorator: Google::Apis::ComputeAlpha::InstanceGroup::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::InstanceGroupList::Warning, decorator: Google::Apis::ComputeAlpha::InstanceGroupList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::InstanceGroupList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::InstanceGroupList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class InstanceGroupManager
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :auto_healing_policies, as: 'autoHealingPolicies', class: Google::Apis::ComputeAlpha::InstanceGroupManagerAutoHealingPolicy, decorator: Google::Apis::ComputeAlpha::InstanceGroupManagerAutoHealingPolicy::Representation
      
          property :base_instance_name, as: 'baseInstanceName'
          property :creation_timestamp, as: 'creationTimestamp'
          property :current_actions, as: 'currentActions', class: Google::Apis::ComputeAlpha::InstanceGroupManagerActionsSummary, decorator: Google::Apis::ComputeAlpha::InstanceGroupManagerActionsSummary::Representation
      
          property :description, as: 'description'
          property :distribution_policy, as: 'distributionPolicy', class: Google::Apis::ComputeAlpha::DistributionPolicy, decorator: Google::Apis::ComputeAlpha::DistributionPolicy::Representation
      
          property :failover_action, as: 'failoverAction'
          property :fingerprint, :base64 => true, as: 'fingerprint'
          property :id, :numeric_string => true, as: 'id'
          property :instance_group, as: 'instanceGroup'
          property :instance_template, as: 'instanceTemplate'
          property :kind, as: 'kind'
          property :name, as: 'name'
          collection :named_ports, as: 'namedPorts', class: Google::Apis::ComputeAlpha::NamedPort, decorator: Google::Apis::ComputeAlpha::NamedPort::Representation
      
          property :pending_actions, as: 'pendingActions', class: Google::Apis::ComputeAlpha::InstanceGroupManagerPendingActionsSummary, decorator: Google::Apis::ComputeAlpha::InstanceGroupManagerPendingActionsSummary::Representation
      
          property :region, as: 'region'
          property :self_link, as: 'selfLink'
          property :self_link_with_id, as: 'selfLinkWithId'
          property :service_account, as: 'serviceAccount'
          property :stateful_policy, as: 'statefulPolicy', class: Google::Apis::ComputeAlpha::StatefulPolicy, decorator: Google::Apis::ComputeAlpha::StatefulPolicy::Representation
      
          property :status, as: 'status', class: Google::Apis::ComputeAlpha::InstanceGroupManagerStatus, decorator: Google::Apis::ComputeAlpha::InstanceGroupManagerStatus::Representation
      
          collection :target_pools, as: 'targetPools'
          property :target_size, as: 'targetSize'
          property :update_policy, as: 'updatePolicy', class: Google::Apis::ComputeAlpha::InstanceGroupManagerUpdatePolicy, decorator: Google::Apis::ComputeAlpha::InstanceGroupManagerUpdatePolicy::Representation
      
          collection :versions, as: 'versions', class: Google::Apis::ComputeAlpha::InstanceGroupManagerVersion, decorator: Google::Apis::ComputeAlpha::InstanceGroupManagerVersion::Representation
      
          property :zone, as: 'zone'
        end
      end
      
      class InstanceGroupManagerActionsSummary
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :abandoning, as: 'abandoning'
          property :creating, as: 'creating'
          property :creating_without_retries, as: 'creatingWithoutRetries'
          property :deleting, as: 'deleting'
          property :none, as: 'none'
          property :recreating, as: 'recreating'
          property :refreshing, as: 'refreshing'
          property :restarting, as: 'restarting'
          property :verifying, as: 'verifying'
        end
      end
      
      class InstanceGroupManagerAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeAlpha::InstanceGroupManagersScopedList, decorator: Google::Apis::ComputeAlpha::InstanceGroupManagersScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::InstanceGroupManagerAggregatedList::Warning, decorator: Google::Apis::ComputeAlpha::InstanceGroupManagerAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::InstanceGroupManagerAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::InstanceGroupManagerAggregatedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class InstanceGroupManagerAutoHealingPolicy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :health_check, as: 'healthCheck'
          property :initial_delay_sec, as: 'initialDelaySec'
          property :max_unavailable, as: 'maxUnavailable', class: Google::Apis::ComputeAlpha::FixedOrPercent, decorator: Google::Apis::ComputeAlpha::FixedOrPercent::Representation
      
        end
      end
      
      class InstanceGroupManagerList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::InstanceGroupManager, decorator: Google::Apis::ComputeAlpha::InstanceGroupManager::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::InstanceGroupManagerList::Warning, decorator: Google::Apis::ComputeAlpha::InstanceGroupManagerList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::InstanceGroupManagerList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::InstanceGroupManagerList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class InstanceGroupManagerPendingActionsSummary
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creating, as: 'creating'
          property :deleting, as: 'deleting'
          property :recreating, as: 'recreating'
          property :restarting, as: 'restarting'
        end
      end
      
      class InstanceGroupManagerStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :autoscaler, as: 'autoscaler'
          property :is_stable, as: 'isStable'
          property :stateful, as: 'stateful', class: Google::Apis::ComputeAlpha::InstanceGroupManagerStatusStateful, decorator: Google::Apis::ComputeAlpha::InstanceGroupManagerStatusStateful::Representation
      
          property :version_target, as: 'versionTarget', class: Google::Apis::ComputeAlpha::InstanceGroupManagerStatusVersionTarget, decorator: Google::Apis::ComputeAlpha::InstanceGroupManagerStatusVersionTarget::Representation
      
        end
      end
      
      class InstanceGroupManagerStatusStateful
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :is_stateful, as: 'isStateful'
        end
      end
      
      class InstanceGroupManagerStatusVersionTarget
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :is_reached, as: 'isReached'
        end
      end
      
      class InstanceGroupManagerUpdatePolicy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :instance_redistribution_type, as: 'instanceRedistributionType'
          property :max_surge, as: 'maxSurge', class: Google::Apis::ComputeAlpha::FixedOrPercent, decorator: Google::Apis::ComputeAlpha::FixedOrPercent::Representation
      
          property :max_unavailable, as: 'maxUnavailable', class: Google::Apis::ComputeAlpha::FixedOrPercent, decorator: Google::Apis::ComputeAlpha::FixedOrPercent::Representation
      
          property :min_ready_sec, as: 'minReadySec'
          property :minimal_action, as: 'minimalAction'
          property :replacement_method, as: 'replacementMethod'
          property :type, as: 'type'
        end
      end
      
      class InstanceGroupManagerVersion
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :instance_template, as: 'instanceTemplate'
          property :name, as: 'name'
          property :tag, as: 'tag'
          property :target_size, as: 'targetSize', class: Google::Apis::ComputeAlpha::FixedOrPercent, decorator: Google::Apis::ComputeAlpha::FixedOrPercent::Representation
      
        end
      end
      
      class InstanceGroupManagersAbandonInstancesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :instances, as: 'instances'
        end
      end
      
      class InstanceGroupManagersApplyUpdatesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :instances, as: 'instances'
          property :maximal_action, as: 'maximalAction'
          property :minimal_action, as: 'minimalAction'
          property :most_disruptive_allowed_action, as: 'mostDisruptiveAllowedAction'
        end
      end
      
      class InstanceGroupManagersCreateInstancesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :instances, as: 'instances', class: Google::Apis::ComputeAlpha::PerInstanceConfig, decorator: Google::Apis::ComputeAlpha::PerInstanceConfig::Representation
      
        end
      end
      
      class InstanceGroupManagersDeleteInstancesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :instances, as: 'instances'
        end
      end
      
      class InstanceGroupManagersDeletePerInstanceConfigsReq
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :names, as: 'names'
        end
      end
      
      class InstanceGroupManagersListErrorsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::InstanceManagedByIgmError, decorator: Google::Apis::ComputeAlpha::InstanceManagedByIgmError::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class InstanceGroupManagersListManagedInstancesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :managed_instances, as: 'managedInstances', class: Google::Apis::ComputeAlpha::ManagedInstance, decorator: Google::Apis::ComputeAlpha::ManagedInstance::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class InstanceGroupManagersListPerInstanceConfigsResp
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::PerInstanceConfig, decorator: Google::Apis::ComputeAlpha::PerInstanceConfig::Representation
      
          property :next_page_token, as: 'nextPageToken'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::InstanceGroupManagersListPerInstanceConfigsResp::Warning, decorator: Google::Apis::ComputeAlpha::InstanceGroupManagersListPerInstanceConfigsResp::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::InstanceGroupManagersListPerInstanceConfigsResp::Warning::Datum, decorator: Google::Apis::ComputeAlpha::InstanceGroupManagersListPerInstanceConfigsResp::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class InstanceGroupManagersPatchPerInstanceConfigsReq
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :per_instance_configs, as: 'perInstanceConfigs', class: Google::Apis::ComputeAlpha::PerInstanceConfig, decorator: Google::Apis::ComputeAlpha::PerInstanceConfig::Representation
      
        end
      end
      
      class InstanceGroupManagersRecreateInstancesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :instances, as: 'instances'
        end
      end
      
      class InstanceGroupManagersResizeAdvancedRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :no_creation_retries, as: 'noCreationRetries'
          property :target_size, as: 'targetSize'
        end
      end
      
      class InstanceGroupManagersScopedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :instance_group_managers, as: 'instanceGroupManagers', class: Google::Apis::ComputeAlpha::InstanceGroupManager, decorator: Google::Apis::ComputeAlpha::InstanceGroupManager::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::InstanceGroupManagersScopedList::Warning, decorator: Google::Apis::ComputeAlpha::InstanceGroupManagersScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::InstanceGroupManagersScopedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::InstanceGroupManagersScopedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class InstanceGroupManagersSetAutoHealingRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :auto_healing_policies, as: 'autoHealingPolicies', class: Google::Apis::ComputeAlpha::InstanceGroupManagerAutoHealingPolicy, decorator: Google::Apis::ComputeAlpha::InstanceGroupManagerAutoHealingPolicy::Representation
      
        end
      end
      
      class InstanceGroupManagersSetInstanceTemplateRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :instance_template, as: 'instanceTemplate'
        end
      end
      
      class InstanceGroupManagersSetTargetPoolsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :fingerprint, :base64 => true, as: 'fingerprint'
          collection :target_pools, as: 'targetPools'
        end
      end
      
      class InstanceGroupManagersUpdatePerInstanceConfigsReq
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :per_instance_configs, as: 'perInstanceConfigs', class: Google::Apis::ComputeAlpha::PerInstanceConfig, decorator: Google::Apis::ComputeAlpha::PerInstanceConfig::Representation
      
        end
      end
      
      class InstanceGroupsAddInstancesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :instances, as: 'instances', class: Google::Apis::ComputeAlpha::InstanceReference, decorator: Google::Apis::ComputeAlpha::InstanceReference::Representation
      
        end
      end
      
      class InstanceGroupsListInstances
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::InstanceWithNamedPorts, decorator: Google::Apis::ComputeAlpha::InstanceWithNamedPorts::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::InstanceGroupsListInstances::Warning, decorator: Google::Apis::ComputeAlpha::InstanceGroupsListInstances::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::InstanceGroupsListInstances::Warning::Datum, decorator: Google::Apis::ComputeAlpha::InstanceGroupsListInstances::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class InstanceGroupsListInstancesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :instance_state, as: 'instanceState'
        end
      end
      
      class InstanceGroupsRemoveInstancesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :instances, as: 'instances', class: Google::Apis::ComputeAlpha::InstanceReference, decorator: Google::Apis::ComputeAlpha::InstanceReference::Representation
      
        end
      end
      
      class InstanceGroupsScopedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :instance_groups, as: 'instanceGroups', class: Google::Apis::ComputeAlpha::InstanceGroup, decorator: Google::Apis::ComputeAlpha::InstanceGroup::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::InstanceGroupsScopedList::Warning, decorator: Google::Apis::ComputeAlpha::InstanceGroupsScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::InstanceGroupsScopedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::InstanceGroupsScopedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class InstanceGroupsSetNamedPortsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :fingerprint, :base64 => true, as: 'fingerprint'
          collection :named_ports, as: 'namedPorts', class: Google::Apis::ComputeAlpha::NamedPort, decorator: Google::Apis::ComputeAlpha::NamedPort::Representation
      
        end
      end
      
      class InstanceList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::Instance, decorator: Google::Apis::ComputeAlpha::Instance::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::InstanceList::Warning, decorator: Google::Apis::ComputeAlpha::InstanceList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::InstanceList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::InstanceList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class InstanceListReferrers
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::Reference, decorator: Google::Apis::ComputeAlpha::Reference::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::InstanceListReferrers::Warning, decorator: Google::Apis::ComputeAlpha::InstanceListReferrers::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::InstanceListReferrers::Warning::Datum, decorator: Google::Apis::ComputeAlpha::InstanceListReferrers::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class InstanceManagedByIgmError
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :error, as: 'error', class: Google::Apis::ComputeAlpha::InstanceManagedByIgmErrorManagedInstanceError, decorator: Google::Apis::ComputeAlpha::InstanceManagedByIgmErrorManagedInstanceError::Representation
      
          property :instance_action_details, as: 'instanceActionDetails', class: Google::Apis::ComputeAlpha::InstanceManagedByIgmErrorInstanceActionDetails, decorator: Google::Apis::ComputeAlpha::InstanceManagedByIgmErrorInstanceActionDetails::Representation
      
          property :timestamp, as: 'timestamp'
        end
      end
      
      class InstanceManagedByIgmErrorInstanceActionDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :action, as: 'action'
          property :instance, as: 'instance'
          property :version, as: 'version', class: Google::Apis::ComputeAlpha::ManagedInstanceVersion, decorator: Google::Apis::ComputeAlpha::ManagedInstanceVersion::Representation
      
        end
      end
      
      class InstanceManagedByIgmErrorManagedInstanceError
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :code, as: 'code'
          property :message, as: 'message'
        end
      end
      
      class InstanceMoveRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :destination_zone, as: 'destinationZone'
          property :target_instance, as: 'targetInstance'
        end
      end
      
      class InstanceProperties
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :can_ip_forward, as: 'canIpForward'
          property :confidential_instance_config, as: 'confidentialInstanceConfig', class: Google::Apis::ComputeAlpha::ConfidentialInstanceConfig, decorator: Google::Apis::ComputeAlpha::ConfidentialInstanceConfig::Representation
      
          property :description, as: 'description'
          collection :disks, as: 'disks', class: Google::Apis::ComputeAlpha::AttachedDisk, decorator: Google::Apis::ComputeAlpha::AttachedDisk::Representation
      
          property :display_device, as: 'displayDevice', class: Google::Apis::ComputeAlpha::DisplayDevice, decorator: Google::Apis::ComputeAlpha::DisplayDevice::Representation
      
          collection :guest_accelerators, as: 'guestAccelerators', class: Google::Apis::ComputeAlpha::AcceleratorConfig, decorator: Google::Apis::ComputeAlpha::AcceleratorConfig::Representation
      
          hash :labels, as: 'labels'
          property :machine_type, as: 'machineType'
          property :metadata, as: 'metadata', class: Google::Apis::ComputeAlpha::Metadata, decorator: Google::Apis::ComputeAlpha::Metadata::Representation
      
          property :min_cpu_platform, as: 'minCpuPlatform'
          collection :network_interfaces, as: 'networkInterfaces', class: Google::Apis::ComputeAlpha::NetworkInterface, decorator: Google::Apis::ComputeAlpha::NetworkInterface::Representation
      
          property :post_key_revocation_action_type, as: 'postKeyRevocationActionType'
          property :reservation_affinity, as: 'reservationAffinity', class: Google::Apis::ComputeAlpha::ReservationAffinity, decorator: Google::Apis::ComputeAlpha::ReservationAffinity::Representation
      
          property :scheduling, as: 'scheduling', class: Google::Apis::ComputeAlpha::Scheduling, decorator: Google::Apis::ComputeAlpha::Scheduling::Representation
      
          collection :service_accounts, as: 'serviceAccounts', class: Google::Apis::ComputeAlpha::ServiceAccount, decorator: Google::Apis::ComputeAlpha::ServiceAccount::Representation
      
          property :shielded_instance_config, as: 'shieldedInstanceConfig', class: Google::Apis::ComputeAlpha::ShieldedInstanceConfig, decorator: Google::Apis::ComputeAlpha::ShieldedInstanceConfig::Representation
      
          property :shielded_vm_config, as: 'shieldedVmConfig', class: Google::Apis::ComputeAlpha::ShieldedVmConfig, decorator: Google::Apis::ComputeAlpha::ShieldedVmConfig::Representation
      
          property :tags, as: 'tags', class: Google::Apis::ComputeAlpha::Tags, decorator: Google::Apis::ComputeAlpha::Tags::Representation
      
        end
      end
      
      class InstanceReference
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :instance, as: 'instance'
        end
      end
      
      class InstanceTemplate
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creation_timestamp, as: 'creationTimestamp'
          property :description, as: 'description'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :properties, as: 'properties', class: Google::Apis::ComputeAlpha::InstanceProperties, decorator: Google::Apis::ComputeAlpha::InstanceProperties::Representation
      
          property :self_link, as: 'selfLink'
          property :self_link_with_id, as: 'selfLinkWithId'
          property :source_instance, as: 'sourceInstance'
          property :source_instance_params, as: 'sourceInstanceParams', class: Google::Apis::ComputeAlpha::SourceInstanceParams, decorator: Google::Apis::ComputeAlpha::SourceInstanceParams::Representation
      
        end
      end
      
      class InstanceTemplateList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::InstanceTemplate, decorator: Google::Apis::ComputeAlpha::InstanceTemplate::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::InstanceTemplateList::Warning, decorator: Google::Apis::ComputeAlpha::InstanceTemplateList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::InstanceTemplateList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::InstanceTemplateList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class InstanceWithNamedPorts
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :instance, as: 'instance'
          collection :named_ports, as: 'namedPorts', class: Google::Apis::ComputeAlpha::NamedPort, decorator: Google::Apis::ComputeAlpha::NamedPort::Representation
      
          property :status, as: 'status'
        end
      end
      
      class InstancesAddResourcePoliciesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :resource_policies, as: 'resourcePolicies'
        end
      end
      
      class InstancesGetEffectiveFirewallsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :firewalls, as: 'firewalls', class: Google::Apis::ComputeAlpha::Firewall, decorator: Google::Apis::ComputeAlpha::Firewall::Representation
      
          collection :organization_firewalls, as: 'organizationFirewalls', class: Google::Apis::ComputeAlpha::InstancesGetEffectiveFirewallsResponseOrganizationFirewallPolicy, decorator: Google::Apis::ComputeAlpha::InstancesGetEffectiveFirewallsResponseOrganizationFirewallPolicy::Representation
      
        end
      end
      
      class InstancesGetEffectiveFirewallsResponseOrganizationFirewallPolicy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, :numeric_string => true, as: 'id'
          collection :rules, as: 'rules', class: Google::Apis::ComputeAlpha::SecurityPolicyRule, decorator: Google::Apis::ComputeAlpha::SecurityPolicyRule::Representation
      
        end
      end
      
      class InstancesRemoveResourcePoliciesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :resource_policies, as: 'resourcePolicies'
        end
      end
      
      class InstancesResumeRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :disks, as: 'disks', class: Google::Apis::ComputeAlpha::CustomerEncryptionKeyProtectedDisk, decorator: Google::Apis::ComputeAlpha::CustomerEncryptionKeyProtectedDisk::Representation
      
          property :instance_encryption_key, as: 'instanceEncryptionKey', class: Google::Apis::ComputeAlpha::CustomerEncryptionKey, decorator: Google::Apis::ComputeAlpha::CustomerEncryptionKey::Representation
      
        end
      end
      
      class InstancesScopedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :instances, as: 'instances', class: Google::Apis::ComputeAlpha::Instance, decorator: Google::Apis::ComputeAlpha::Instance::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::InstancesScopedList::Warning, decorator: Google::Apis::ComputeAlpha::InstancesScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::InstancesScopedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::InstancesScopedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class InstancesSetLabelsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :label_fingerprint, :base64 => true, as: 'labelFingerprint'
          hash :labels, as: 'labels'
        end
      end
      
      class InstancesSetMachineResourcesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :guest_accelerators, as: 'guestAccelerators', class: Google::Apis::ComputeAlpha::AcceleratorConfig, decorator: Google::Apis::ComputeAlpha::AcceleratorConfig::Representation
      
        end
      end
      
      class InstancesSetMachineTypeRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :machine_type, as: 'machineType'
        end
      end
      
      class InstancesSetMinCpuPlatformRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :min_cpu_platform, as: 'minCpuPlatform'
        end
      end
      
      class InstancesSetNameRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :current_name, as: 'currentName'
          property :name, as: 'name'
        end
      end
      
      class InstancesSetServiceAccountRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :email, as: 'email'
          collection :scopes, as: 'scopes'
        end
      end
      
      class InstancesStartWithEncryptionKeyRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :disks, as: 'disks', class: Google::Apis::ComputeAlpha::CustomerEncryptionKeyProtectedDisk, decorator: Google::Apis::ComputeAlpha::CustomerEncryptionKeyProtectedDisk::Representation
      
          property :instance_encryption_key, as: 'instanceEncryptionKey', class: Google::Apis::ComputeAlpha::CustomerEncryptionKey, decorator: Google::Apis::ComputeAlpha::CustomerEncryptionKey::Representation
      
        end
      end
      
      class Int64RangeMatch
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :range_end, :numeric_string => true, as: 'rangeEnd'
          property :range_start, :numeric_string => true, as: 'rangeStart'
        end
      end
      
      class Interconnect
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :admin_enabled, as: 'adminEnabled'
          collection :circuit_infos, as: 'circuitInfos', class: Google::Apis::ComputeAlpha::InterconnectCircuitInfo, decorator: Google::Apis::ComputeAlpha::InterconnectCircuitInfo::Representation
      
          property :creation_timestamp, as: 'creationTimestamp'
          property :customer_name, as: 'customerName'
          property :description, as: 'description'
          collection :expected_outages, as: 'expectedOutages', class: Google::Apis::ComputeAlpha::InterconnectOutageNotification, decorator: Google::Apis::ComputeAlpha::InterconnectOutageNotification::Representation
      
          property :google_ip_address, as: 'googleIpAddress'
          property :google_reference_id, as: 'googleReferenceId'
          property :id, :numeric_string => true, as: 'id'
          collection :interconnect_attachments, as: 'interconnectAttachments'
          property :interconnect_type, as: 'interconnectType'
          property :kind, as: 'kind'
          property :label_fingerprint, :base64 => true, as: 'labelFingerprint'
          hash :labels, as: 'labels'
          property :link_type, as: 'linkType'
          property :location, as: 'location'
          property :name, as: 'name'
          property :noc_contact_email, as: 'nocContactEmail'
          property :operational_status, as: 'operationalStatus'
          property :peer_ip_address, as: 'peerIpAddress'
          property :provisioned_link_count, as: 'provisionedLinkCount'
          property :requested_link_count, as: 'requestedLinkCount'
          property :self_link, as: 'selfLink'
          property :self_link_with_id, as: 'selfLinkWithId'
          property :state, as: 'state'
        end
      end
      
      class InterconnectAttachment
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :admin_enabled, as: 'adminEnabled'
          property :bandwidth, as: 'bandwidth'
          collection :candidate_subnets, as: 'candidateSubnets'
          property :cloud_router_ip_address, as: 'cloudRouterIpAddress'
          property :creation_timestamp, as: 'creationTimestamp'
          property :customer_router_ip_address, as: 'customerRouterIpAddress'
          property :description, as: 'description'
          property :edge_availability_domain, as: 'edgeAvailabilityDomain'
          property :google_reference_id, as: 'googleReferenceId'
          property :id, :numeric_string => true, as: 'id'
          property :interconnect, as: 'interconnect'
          property :kind, as: 'kind'
          property :label_fingerprint, :base64 => true, as: 'labelFingerprint'
          hash :labels, as: 'labels'
          property :mtu, as: 'mtu'
          property :name, as: 'name'
          property :operational_status, as: 'operationalStatus'
          property :pairing_key, as: 'pairingKey'
          property :partner_asn, :numeric_string => true, as: 'partnerAsn'
          property :partner_metadata, as: 'partnerMetadata', class: Google::Apis::ComputeAlpha::InterconnectAttachmentPartnerMetadata, decorator: Google::Apis::ComputeAlpha::InterconnectAttachmentPartnerMetadata::Representation
      
          property :private_interconnect_info, as: 'privateInterconnectInfo', class: Google::Apis::ComputeAlpha::InterconnectAttachmentPrivateInfo, decorator: Google::Apis::ComputeAlpha::InterconnectAttachmentPrivateInfo::Representation
      
          property :region, as: 'region'
          property :router, as: 'router'
          property :self_link, as: 'selfLink'
          property :self_link_with_id, as: 'selfLinkWithId'
          property :state, as: 'state'
          property :type, as: 'type'
          property :vlan_tag8021q, as: 'vlanTag8021q'
        end
      end
      
      class InterconnectAttachmentAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeAlpha::InterconnectAttachmentsScopedList, decorator: Google::Apis::ComputeAlpha::InterconnectAttachmentsScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::InterconnectAttachmentAggregatedList::Warning, decorator: Google::Apis::ComputeAlpha::InterconnectAttachmentAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::InterconnectAttachmentAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::InterconnectAttachmentAggregatedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class InterconnectAttachmentList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::InterconnectAttachment, decorator: Google::Apis::ComputeAlpha::InterconnectAttachment::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::InterconnectAttachmentList::Warning, decorator: Google::Apis::ComputeAlpha::InterconnectAttachmentList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::InterconnectAttachmentList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::InterconnectAttachmentList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class InterconnectAttachmentPartnerMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :interconnect_name, as: 'interconnectName'
          property :partner_name, as: 'partnerName'
          property :portal_url, as: 'portalUrl'
        end
      end
      
      class InterconnectAttachmentPrivateInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :tag8021q, as: 'tag8021q'
        end
      end
      
      class InterconnectAttachmentsScopedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :interconnect_attachments, as: 'interconnectAttachments', class: Google::Apis::ComputeAlpha::InterconnectAttachment, decorator: Google::Apis::ComputeAlpha::InterconnectAttachment::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::InterconnectAttachmentsScopedList::Warning, decorator: Google::Apis::ComputeAlpha::InterconnectAttachmentsScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::InterconnectAttachmentsScopedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::InterconnectAttachmentsScopedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class InterconnectCircuitInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :customer_demarc_id, as: 'customerDemarcId'
          property :google_circuit_id, as: 'googleCircuitId'
          property :google_demarc_id, as: 'googleDemarcId'
        end
      end
      
      class InterconnectDiagnostics
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :arp_caches, as: 'arpCaches', class: Google::Apis::ComputeAlpha::InterconnectDiagnosticsArpEntry, decorator: Google::Apis::ComputeAlpha::InterconnectDiagnosticsArpEntry::Representation
      
          collection :links, as: 'links', class: Google::Apis::ComputeAlpha::InterconnectDiagnosticsLinkStatus, decorator: Google::Apis::ComputeAlpha::InterconnectDiagnosticsLinkStatus::Representation
      
          property :mac_address, as: 'macAddress'
        end
      end
      
      class InterconnectDiagnosticsArpEntry
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :ip_address, as: 'ipAddress'
          property :mac_address, as: 'macAddress'
        end
      end
      
      class InterconnectDiagnosticsLinkLacpStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :google_system_id, as: 'googleSystemId'
          property :neighbor_system_id, as: 'neighborSystemId'
          property :state, as: 'state'
        end
      end
      
      class InterconnectDiagnosticsLinkOpticalPower
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :state, as: 'state'
          property :value, as: 'value'
        end
      end
      
      class InterconnectDiagnosticsLinkStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :arp_caches, as: 'arpCaches', class: Google::Apis::ComputeAlpha::InterconnectDiagnosticsArpEntry, decorator: Google::Apis::ComputeAlpha::InterconnectDiagnosticsArpEntry::Representation
      
          property :circuit_id, as: 'circuitId'
          property :google_demarc, as: 'googleDemarc'
          property :lacp_status, as: 'lacpStatus', class: Google::Apis::ComputeAlpha::InterconnectDiagnosticsLinkLacpStatus, decorator: Google::Apis::ComputeAlpha::InterconnectDiagnosticsLinkLacpStatus::Representation
      
          property :receiving_optical_power, as: 'receivingOpticalPower', class: Google::Apis::ComputeAlpha::InterconnectDiagnosticsLinkOpticalPower, decorator: Google::Apis::ComputeAlpha::InterconnectDiagnosticsLinkOpticalPower::Representation
      
          property :transmitting_optical_power, as: 'transmittingOpticalPower', class: Google::Apis::ComputeAlpha::InterconnectDiagnosticsLinkOpticalPower, decorator: Google::Apis::ComputeAlpha::InterconnectDiagnosticsLinkOpticalPower::Representation
      
        end
      end
      
      class InterconnectList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::Interconnect, decorator: Google::Apis::ComputeAlpha::Interconnect::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::InterconnectList::Warning, decorator: Google::Apis::ComputeAlpha::InterconnectList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::InterconnectList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::InterconnectList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class InterconnectLocation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :address, as: 'address'
          property :availability_zone, as: 'availabilityZone'
          property :city, as: 'city'
          property :continent, as: 'continent'
          property :creation_timestamp, as: 'creationTimestamp'
          property :description, as: 'description'
          property :facility_provider, as: 'facilityProvider'
          property :facility_provider_facility_id, as: 'facilityProviderFacilityId'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :peeringdb_facility_id, as: 'peeringdbFacilityId'
          collection :region_infos, as: 'regionInfos', class: Google::Apis::ComputeAlpha::InterconnectLocationRegionInfo, decorator: Google::Apis::ComputeAlpha::InterconnectLocationRegionInfo::Representation
      
          property :self_link, as: 'selfLink'
          property :self_link_with_id, as: 'selfLinkWithId'
          property :status, as: 'status'
        end
      end
      
      class InterconnectLocationList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::InterconnectLocation, decorator: Google::Apis::ComputeAlpha::InterconnectLocation::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::InterconnectLocationList::Warning, decorator: Google::Apis::ComputeAlpha::InterconnectLocationList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::InterconnectLocationList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::InterconnectLocationList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class InterconnectLocationRegionInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :expected_rtt_ms, :numeric_string => true, as: 'expectedRttMs'
          property :location_presence, as: 'locationPresence'
          property :region, as: 'region'
        end
      end
      
      class InterconnectOutageNotification
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :affected_circuits, as: 'affectedCircuits'
          property :description, as: 'description'
          property :end_time, :numeric_string => true, as: 'endTime'
          property :issue_type, as: 'issueType'
          property :name, as: 'name'
          property :source, as: 'source'
          property :start_time, :numeric_string => true, as: 'startTime'
          property :state, as: 'state'
        end
      end
      
      class InterconnectsGetDiagnosticsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :result, as: 'result', class: Google::Apis::ComputeAlpha::InterconnectDiagnostics, decorator: Google::Apis::ComputeAlpha::InterconnectDiagnostics::Representation
      
        end
      end
      
      class InternalIpAddress
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cidr, as: 'cidr'
          property :owner, as: 'owner'
          property :purpose, as: 'purpose'
          property :region, as: 'region'
          property :type, as: 'type'
        end
      end
      
      class InternalIpOwner
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :ip_cidr_range, as: 'ipCidrRange'
          collection :owners, as: 'owners'
          property :system_owned, as: 'systemOwned'
        end
      end
      
      class IpAddressesList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::InternalIpAddress, decorator: Google::Apis::ComputeAlpha::InternalIpAddress::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::IpAddressesList::Warning, decorator: Google::Apis::ComputeAlpha::IpAddressesList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::IpAddressesList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::IpAddressesList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class IpOwnerList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::InternalIpOwner, decorator: Google::Apis::ComputeAlpha::InternalIpOwner::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::IpOwnerList::Warning, decorator: Google::Apis::ComputeAlpha::IpOwnerList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::IpOwnerList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::IpOwnerList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class Jwt
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :audiences, as: 'audiences'
          property :issuer, as: 'issuer'
          property :jwks_public_keys, as: 'jwksPublicKeys'
          collection :jwt_headers, as: 'jwtHeaders', class: Google::Apis::ComputeAlpha::JwtHeader, decorator: Google::Apis::ComputeAlpha::JwtHeader::Representation
      
          collection :jwt_params, as: 'jwtParams'
        end
      end
      
      class JwtHeader
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :value_prefix, as: 'valuePrefix'
        end
      end
      
      class License
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :charges_use_fee, as: 'chargesUseFee'
          property :creation_timestamp, as: 'creationTimestamp'
          property :description, as: 'description'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :license_code, :numeric_string => true, as: 'licenseCode'
          property :name, as: 'name'
          property :resource_requirements, as: 'resourceRequirements', class: Google::Apis::ComputeAlpha::LicenseResourceRequirements, decorator: Google::Apis::ComputeAlpha::LicenseResourceRequirements::Representation
      
          property :self_link, as: 'selfLink'
          property :self_link_with_id, as: 'selfLinkWithId'
          property :transferable, as: 'transferable'
        end
      end
      
      class LicenseCode
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creation_timestamp, as: 'creationTimestamp'
          property :description, as: 'description'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          collection :license_alias, as: 'licenseAlias', class: Google::Apis::ComputeAlpha::LicenseCodeLicenseAlias, decorator: Google::Apis::ComputeAlpha::LicenseCodeLicenseAlias::Representation
      
          property :name, as: 'name'
          property :self_link, as: 'selfLink'
          property :state, as: 'state'
          property :transferable, as: 'transferable'
        end
      end
      
      class LicenseCodeLicenseAlias
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :self_link, as: 'selfLink'
        end
      end
      
      class LicenseResourceCommitment
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :amount, :numeric_string => true, as: 'amount'
          property :cores_per_license, as: 'coresPerLicense'
          property :license, as: 'license'
        end
      end
      
      class LicenseResourceRequirements
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :min_guest_cpu_count, as: 'minGuestCpuCount'
          property :min_memory_mb, as: 'minMemoryMb'
        end
      end
      
      class LicensesListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::License, decorator: Google::Apis::ComputeAlpha::License::Representation
      
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::LicensesListResponse::Warning, decorator: Google::Apis::ComputeAlpha::LicensesListResponse::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::LicensesListResponse::Warning::Datum, decorator: Google::Apis::ComputeAlpha::LicensesListResponse::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class LocalDisk
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :disk_count, as: 'diskCount'
          property :disk_size_gb, as: 'diskSizeGb'
          property :disk_type, as: 'diskType'
        end
      end
      
      class LogConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cloud_audit, as: 'cloudAudit', class: Google::Apis::ComputeAlpha::LogConfigCloudAuditOptions, decorator: Google::Apis::ComputeAlpha::LogConfigCloudAuditOptions::Representation
      
          property :counter, as: 'counter', class: Google::Apis::ComputeAlpha::LogConfigCounterOptions, decorator: Google::Apis::ComputeAlpha::LogConfigCounterOptions::Representation
      
          property :data_access, as: 'dataAccess', class: Google::Apis::ComputeAlpha::LogConfigDataAccessOptions, decorator: Google::Apis::ComputeAlpha::LogConfigDataAccessOptions::Representation
      
        end
      end
      
      class LogConfigCloudAuditOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :authorization_logging_options, as: 'authorizationLoggingOptions', class: Google::Apis::ComputeAlpha::AuthorizationLoggingOptions, decorator: Google::Apis::ComputeAlpha::AuthorizationLoggingOptions::Representation
      
          property :log_name, as: 'logName'
        end
      end
      
      class LogConfigCounterOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :custom_fields, as: 'customFields', class: Google::Apis::ComputeAlpha::LogConfigCounterOptionsCustomField, decorator: Google::Apis::ComputeAlpha::LogConfigCounterOptionsCustomField::Representation
      
          property :field, as: 'field'
          property :metric, as: 'metric'
        end
      end
      
      class LogConfigCounterOptionsCustomField
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :value, as: 'value'
        end
      end
      
      class LogConfigDataAccessOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :log_mode, as: 'logMode'
        end
      end
      
      class MachineImage
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creation_timestamp, as: 'creationTimestamp'
          property :description, as: 'description'
          property :guest_flush, as: 'guestFlush'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :machine_image_encryption_key, as: 'machineImageEncryptionKey', class: Google::Apis::ComputeAlpha::CustomerEncryptionKey, decorator: Google::Apis::ComputeAlpha::CustomerEncryptionKey::Representation
      
          property :name, as: 'name'
          property :self_link, as: 'selfLink'
          property :self_link_with_id, as: 'selfLinkWithId'
          collection :source_disk_encryption_keys, as: 'sourceDiskEncryptionKeys', class: Google::Apis::ComputeAlpha::SourceDiskEncryptionKey, decorator: Google::Apis::ComputeAlpha::SourceDiskEncryptionKey::Representation
      
          property :source_instance, as: 'sourceInstance'
          property :source_instance_properties, as: 'sourceInstanceProperties', class: Google::Apis::ComputeAlpha::SourceInstanceProperties, decorator: Google::Apis::ComputeAlpha::SourceInstanceProperties::Representation
      
          property :status, as: 'status'
          collection :storage_locations, as: 'storageLocations'
          property :total_storage_bytes, :numeric_string => true, as: 'totalStorageBytes'
        end
      end
      
      class MachineImageList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::MachineImage, decorator: Google::Apis::ComputeAlpha::MachineImage::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::MachineImageList::Warning, decorator: Google::Apis::ComputeAlpha::MachineImageList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::MachineImageList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::MachineImageList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class MachineType
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creation_timestamp, as: 'creationTimestamp'
          property :deprecated, as: 'deprecated', class: Google::Apis::ComputeAlpha::DeprecationStatus, decorator: Google::Apis::ComputeAlpha::DeprecationStatus::Representation
      
          property :description, as: 'description'
          property :guest_cpus, as: 'guestCpus'
          property :id, :numeric_string => true, as: 'id'
          property :is_shared_cpu, as: 'isSharedCpu'
          property :kind, as: 'kind'
          property :maximum_persistent_disks, as: 'maximumPersistentDisks'
          property :maximum_persistent_disks_size_gb, :numeric_string => true, as: 'maximumPersistentDisksSizeGb'
          property :memory_mb, as: 'memoryMb'
          property :name, as: 'name'
          property :self_link, as: 'selfLink'
          property :self_link_with_id, as: 'selfLinkWithId'
          property :zone, as: 'zone'
        end
      end
      
      class MachineTypeAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeAlpha::MachineTypesScopedList, decorator: Google::Apis::ComputeAlpha::MachineTypesScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::MachineTypeAggregatedList::Warning, decorator: Google::Apis::ComputeAlpha::MachineTypeAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::MachineTypeAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::MachineTypeAggregatedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class MachineTypeList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::MachineType, decorator: Google::Apis::ComputeAlpha::MachineType::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::MachineTypeList::Warning, decorator: Google::Apis::ComputeAlpha::MachineTypeList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::MachineTypeList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::MachineTypeList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class MachineTypesScopedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :machine_types, as: 'machineTypes', class: Google::Apis::ComputeAlpha::MachineType, decorator: Google::Apis::ComputeAlpha::MachineType::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::MachineTypesScopedList::Warning, decorator: Google::Apis::ComputeAlpha::MachineTypesScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::MachineTypesScopedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::MachineTypesScopedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class ManagedInstance
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :current_action, as: 'currentAction'
          property :id, :numeric_string => true, as: 'id'
          property :instance, as: 'instance'
          collection :instance_health, as: 'instanceHealth', class: Google::Apis::ComputeAlpha::ManagedInstanceInstanceHealth, decorator: Google::Apis::ComputeAlpha::ManagedInstanceInstanceHealth::Representation
      
          property :instance_status, as: 'instanceStatus'
          property :instance_template, as: 'instanceTemplate'
          property :last_attempt, as: 'lastAttempt', class: Google::Apis::ComputeAlpha::ManagedInstanceLastAttempt, decorator: Google::Apis::ComputeAlpha::ManagedInstanceLastAttempt::Representation
      
          property :preserved_state_from_config, as: 'preservedStateFromConfig', class: Google::Apis::ComputeAlpha::PreservedState, decorator: Google::Apis::ComputeAlpha::PreservedState::Representation
      
          property :preserved_state_from_policy, as: 'preservedStateFromPolicy', class: Google::Apis::ComputeAlpha::PreservedState, decorator: Google::Apis::ComputeAlpha::PreservedState::Representation
      
          property :tag, as: 'tag'
          property :version, as: 'version', class: Google::Apis::ComputeAlpha::ManagedInstanceVersion, decorator: Google::Apis::ComputeAlpha::ManagedInstanceVersion::Representation
      
        end
      end
      
      class ManagedInstanceInstanceHealth
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :detailed_health_state, as: 'detailedHealthState'
          property :health_check, as: 'healthCheck'
          property :health_state, as: 'healthState'
        end
      end
      
      class ManagedInstanceLastAttempt
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :errors, as: 'errors', class: Google::Apis::ComputeAlpha::ManagedInstanceLastAttempt::Errors, decorator: Google::Apis::ComputeAlpha::ManagedInstanceLastAttempt::Errors::Representation
      
        end
        
        class Errors
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            collection :errors, as: 'errors', class: Google::Apis::ComputeAlpha::ManagedInstanceLastAttempt::Errors::Error, decorator: Google::Apis::ComputeAlpha::ManagedInstanceLastAttempt::Errors::Error::Representation
        
          end
          
          class Error
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :code, as: 'code'
              property :location, as: 'location'
              property :message, as: 'message'
            end
          end
        end
      end
      
      class ManagedInstanceVersion
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :instance_template, as: 'instanceTemplate'
          property :name, as: 'name'
        end
      end
      
      class Metadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :fingerprint, :base64 => true, as: 'fingerprint'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::Metadata::Item, decorator: Google::Apis::ComputeAlpha::Metadata::Item::Representation
      
          property :kind, as: 'kind'
        end
        
        class Item
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :key, as: 'key'
            property :value, as: 'value'
          end
        end
      end
      
      class MetadataCredentialsFromPlugin
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :struct_config, as: 'structConfig'
        end
      end
      
      class MetadataFilter
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :filter_labels, as: 'filterLabels', class: Google::Apis::ComputeAlpha::MetadataFilterLabelMatch, decorator: Google::Apis::ComputeAlpha::MetadataFilterLabelMatch::Representation
      
          property :filter_match_criteria, as: 'filterMatchCriteria'
        end
      end
      
      class MetadataFilterLabelMatch
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :value, as: 'value'
        end
      end
      
      class MutualTls
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :mode, as: 'mode'
        end
      end
      
      class NamedPort
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :port, as: 'port'
        end
      end
      
      class Network
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :i_pv4_range, as: 'IPv4Range'
          property :auto_create_subnetworks, as: 'autoCreateSubnetworks'
          property :creation_timestamp, as: 'creationTimestamp'
          property :cross_vm_encryption, as: 'crossVmEncryption'
          property :description, as: 'description'
          property :gateway_i_pv4, as: 'gatewayIPv4'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :load_balancer_vm_encryption, as: 'loadBalancerVmEncryption'
          property :mtu, as: 'mtu'
          property :multicast_mode, as: 'multicastMode'
          property :name, as: 'name'
          collection :peerings, as: 'peerings', class: Google::Apis::ComputeAlpha::NetworkPeering, decorator: Google::Apis::ComputeAlpha::NetworkPeering::Representation
      
          property :routing_config, as: 'routingConfig', class: Google::Apis::ComputeAlpha::NetworkRoutingConfig, decorator: Google::Apis::ComputeAlpha::NetworkRoutingConfig::Representation
      
          property :self_link, as: 'selfLink'
          property :self_link_with_id, as: 'selfLinkWithId'
          collection :subnetworks, as: 'subnetworks'
        end
      end
      
      class NetworkEndpoint
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :annotations, as: 'annotations'
          property :fqdn, as: 'fqdn'
          property :instance, as: 'instance'
          property :ip_address, as: 'ipAddress'
          property :port, as: 'port'
        end
      end
      
      class NetworkEndpointGroup
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :annotations, as: 'annotations'
          property :app_engine, as: 'appEngine', class: Google::Apis::ComputeAlpha::NetworkEndpointGroupAppEngine, decorator: Google::Apis::ComputeAlpha::NetworkEndpointGroupAppEngine::Representation
      
          property :cloud_function, as: 'cloudFunction', class: Google::Apis::ComputeAlpha::NetworkEndpointGroupCloudFunction, decorator: Google::Apis::ComputeAlpha::NetworkEndpointGroupCloudFunction::Representation
      
          property :cloud_run, as: 'cloudRun', class: Google::Apis::ComputeAlpha::NetworkEndpointGroupCloudRun, decorator: Google::Apis::ComputeAlpha::NetworkEndpointGroupCloudRun::Representation
      
          property :creation_timestamp, as: 'creationTimestamp'
          property :default_port, as: 'defaultPort'
          property :description, as: 'description'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :load_balancer, as: 'loadBalancer', class: Google::Apis::ComputeAlpha::NetworkEndpointGroupLbNetworkEndpointGroup, decorator: Google::Apis::ComputeAlpha::NetworkEndpointGroupLbNetworkEndpointGroup::Representation
      
          property :name, as: 'name'
          property :network, as: 'network'
          property :network_endpoint_type, as: 'networkEndpointType'
          property :region, as: 'region'
          property :self_link, as: 'selfLink'
          property :self_link_with_id, as: 'selfLinkWithId'
          property :size, as: 'size'
          property :subnetwork, as: 'subnetwork'
          property :type, as: 'type'
          property :zone, as: 'zone'
        end
      end
      
      class NetworkEndpointGroupAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeAlpha::NetworkEndpointGroupsScopedList, decorator: Google::Apis::ComputeAlpha::NetworkEndpointGroupsScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::NetworkEndpointGroupAggregatedList::Warning, decorator: Google::Apis::ComputeAlpha::NetworkEndpointGroupAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::NetworkEndpointGroupAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::NetworkEndpointGroupAggregatedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class NetworkEndpointGroupAppEngine
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :service, as: 'service'
          property :url_mask, as: 'urlMask'
          property :version, as: 'version'
        end
      end
      
      class NetworkEndpointGroupCloudFunction
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :function, as: 'function'
          property :url_mask, as: 'urlMask'
        end
      end
      
      class NetworkEndpointGroupCloudRun
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :service, as: 'service'
          property :tag, as: 'tag'
          property :url_mask, as: 'urlMask'
        end
      end
      
      class NetworkEndpointGroupLbNetworkEndpointGroup
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :default_port, as: 'defaultPort'
          property :network, as: 'network'
          property :subnetwork, as: 'subnetwork'
          property :zone, as: 'zone'
        end
      end
      
      class NetworkEndpointGroupList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::NetworkEndpointGroup, decorator: Google::Apis::ComputeAlpha::NetworkEndpointGroup::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::NetworkEndpointGroupList::Warning, decorator: Google::Apis::ComputeAlpha::NetworkEndpointGroupList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::NetworkEndpointGroupList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::NetworkEndpointGroupList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class NetworkEndpointGroupsAttachEndpointsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :network_endpoints, as: 'networkEndpoints', class: Google::Apis::ComputeAlpha::NetworkEndpoint, decorator: Google::Apis::ComputeAlpha::NetworkEndpoint::Representation
      
        end
      end
      
      class NetworkEndpointGroupsDetachEndpointsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :network_endpoints, as: 'networkEndpoints', class: Google::Apis::ComputeAlpha::NetworkEndpoint, decorator: Google::Apis::ComputeAlpha::NetworkEndpoint::Representation
      
        end
      end
      
      class NetworkEndpointGroupsListEndpointsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :endpoint_filters, as: 'endpointFilters', class: Google::Apis::ComputeAlpha::NetworkEndpointGroupsListEndpointsRequestNetworkEndpointFilter, decorator: Google::Apis::ComputeAlpha::NetworkEndpointGroupsListEndpointsRequestNetworkEndpointFilter::Representation
      
          property :health_status, as: 'healthStatus'
        end
      end
      
      class NetworkEndpointGroupsListEndpointsRequestNetworkEndpointFilter
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :network_endpoint, as: 'networkEndpoint', class: Google::Apis::ComputeAlpha::NetworkEndpoint, decorator: Google::Apis::ComputeAlpha::NetworkEndpoint::Representation
      
        end
      end
      
      class NetworkEndpointGroupsListNetworkEndpoints
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::NetworkEndpointWithHealthStatus, decorator: Google::Apis::ComputeAlpha::NetworkEndpointWithHealthStatus::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::NetworkEndpointGroupsListNetworkEndpoints::Warning, decorator: Google::Apis::ComputeAlpha::NetworkEndpointGroupsListNetworkEndpoints::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::NetworkEndpointGroupsListNetworkEndpoints::Warning::Datum, decorator: Google::Apis::ComputeAlpha::NetworkEndpointGroupsListNetworkEndpoints::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class NetworkEndpointGroupsScopedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :network_endpoint_groups, as: 'networkEndpointGroups', class: Google::Apis::ComputeAlpha::NetworkEndpointGroup, decorator: Google::Apis::ComputeAlpha::NetworkEndpointGroup::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::NetworkEndpointGroupsScopedList::Warning, decorator: Google::Apis::ComputeAlpha::NetworkEndpointGroupsScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::NetworkEndpointGroupsScopedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::NetworkEndpointGroupsScopedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class NetworkEndpointWithHealthStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :healths, as: 'healths', class: Google::Apis::ComputeAlpha::HealthStatusForNetworkEndpoint, decorator: Google::Apis::ComputeAlpha::HealthStatusForNetworkEndpoint::Representation
      
          property :network_endpoint, as: 'networkEndpoint', class: Google::Apis::ComputeAlpha::NetworkEndpoint, decorator: Google::Apis::ComputeAlpha::NetworkEndpoint::Representation
      
        end
      end
      
      class NetworkInterface
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :access_configs, as: 'accessConfigs', class: Google::Apis::ComputeAlpha::AccessConfig, decorator: Google::Apis::ComputeAlpha::AccessConfig::Representation
      
          collection :alias_ip_ranges, as: 'aliasIpRanges', class: Google::Apis::ComputeAlpha::AliasIpRange, decorator: Google::Apis::ComputeAlpha::AliasIpRange::Representation
      
          property :fingerprint, :base64 => true, as: 'fingerprint'
          property :ipv6_address, as: 'ipv6Address'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :network, as: 'network'
          property :network_ip, as: 'networkIP'
          property :subnetwork, as: 'subnetwork'
        end
      end
      
      class NetworkList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::Network, decorator: Google::Apis::ComputeAlpha::Network::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::NetworkList::Warning, decorator: Google::Apis::ComputeAlpha::NetworkList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::NetworkList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::NetworkList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class NetworkPeering
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :advertise_peer_subnets_via_routers, as: 'advertisePeerSubnetsViaRouters'
          property :auto_create_routes, as: 'autoCreateRoutes'
          property :exchange_subnet_routes, as: 'exchangeSubnetRoutes'
          property :export_custom_routes, as: 'exportCustomRoutes'
          property :export_subnet_routes_with_public_ip, as: 'exportSubnetRoutesWithPublicIp'
          property :import_custom_routes, as: 'importCustomRoutes'
          property :import_subnet_routes_with_public_ip, as: 'importSubnetRoutesWithPublicIp'
          property :name, as: 'name'
          property :network, as: 'network'
          property :peer_mtu, as: 'peerMtu'
          property :state, as: 'state'
          property :state_details, as: 'stateDetails'
        end
      end
      
      class NetworkRoutingConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :routing_mode, as: 'routingMode'
        end
      end
      
      class NetworksAddPeeringRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :auto_create_routes, as: 'autoCreateRoutes'
          property :export_custom_routes, as: 'exportCustomRoutes'
          property :import_custom_routes, as: 'importCustomRoutes'
          property :name, as: 'name'
          property :network_peering, as: 'networkPeering', class: Google::Apis::ComputeAlpha::NetworkPeering, decorator: Google::Apis::ComputeAlpha::NetworkPeering::Representation
      
          property :peer_network, as: 'peerNetwork'
        end
      end
      
      class NetworksGetEffectiveFirewallsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :firewalls, as: 'firewalls', class: Google::Apis::ComputeAlpha::Firewall, decorator: Google::Apis::ComputeAlpha::Firewall::Representation
      
          collection :organization_firewalls, as: 'organizationFirewalls', class: Google::Apis::ComputeAlpha::NetworksGetEffectiveFirewallsResponseOrganizationFirewallPolicy, decorator: Google::Apis::ComputeAlpha::NetworksGetEffectiveFirewallsResponseOrganizationFirewallPolicy::Representation
      
        end
      end
      
      class NetworksGetEffectiveFirewallsResponseOrganizationFirewallPolicy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, :numeric_string => true, as: 'id'
          collection :rules, as: 'rules', class: Google::Apis::ComputeAlpha::SecurityPolicyRule, decorator: Google::Apis::ComputeAlpha::SecurityPolicyRule::Representation
      
        end
      end
      
      class NetworksRemovePeeringRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
        end
      end
      
      class NetworksUpdatePeeringRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :network_peering, as: 'networkPeering', class: Google::Apis::ComputeAlpha::NetworkPeering, decorator: Google::Apis::ComputeAlpha::NetworkPeering::Representation
      
        end
      end
      
      class NodeGroup
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :autoscaling_policy, as: 'autoscalingPolicy', class: Google::Apis::ComputeAlpha::NodeGroupAutoscalingPolicy, decorator: Google::Apis::ComputeAlpha::NodeGroupAutoscalingPolicy::Representation
      
          property :creation_timestamp, as: 'creationTimestamp'
          property :description, as: 'description'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :maintenance_policy, as: 'maintenancePolicy'
          property :name, as: 'name'
          property :node_template, as: 'nodeTemplate'
          property :self_link, as: 'selfLink'
          property :self_link_with_id, as: 'selfLinkWithId'
          property :size, as: 'size'
          property :status, as: 'status'
          property :zone, as: 'zone'
        end
      end
      
      class NodeGroupAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeAlpha::NodeGroupsScopedList, decorator: Google::Apis::ComputeAlpha::NodeGroupsScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::NodeGroupAggregatedList::Warning, decorator: Google::Apis::ComputeAlpha::NodeGroupAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::NodeGroupAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::NodeGroupAggregatedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class NodeGroupAutoscalingPolicy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :max_size, as: 'maxSize'
          property :min_size, as: 'minSize'
          property :mode, as: 'mode'
        end
      end
      
      class NodeGroupList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::NodeGroup, decorator: Google::Apis::ComputeAlpha::NodeGroup::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::NodeGroupList::Warning, decorator: Google::Apis::ComputeAlpha::NodeGroupList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::NodeGroupList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::NodeGroupList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class NodeGroupNode
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :disks, as: 'disks', class: Google::Apis::ComputeAlpha::LocalDisk, decorator: Google::Apis::ComputeAlpha::LocalDisk::Representation
      
          collection :instances, as: 'instances'
          property :name, as: 'name'
          property :node_type, as: 'nodeType'
          property :server_binding, as: 'serverBinding', class: Google::Apis::ComputeAlpha::ServerBinding, decorator: Google::Apis::ComputeAlpha::ServerBinding::Representation
      
          property :server_id, as: 'serverId'
          property :status, as: 'status'
        end
      end
      
      class NodeGroupsAddNodesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :additional_node_count, as: 'additionalNodeCount'
        end
      end
      
      class NodeGroupsDeleteNodesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :nodes, as: 'nodes'
        end
      end
      
      class NodeGroupsListNodes
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::NodeGroupNode, decorator: Google::Apis::ComputeAlpha::NodeGroupNode::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::NodeGroupsListNodes::Warning, decorator: Google::Apis::ComputeAlpha::NodeGroupsListNodes::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::NodeGroupsListNodes::Warning::Datum, decorator: Google::Apis::ComputeAlpha::NodeGroupsListNodes::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class NodeGroupsScopedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :node_groups, as: 'nodeGroups', class: Google::Apis::ComputeAlpha::NodeGroup, decorator: Google::Apis::ComputeAlpha::NodeGroup::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::NodeGroupsScopedList::Warning, decorator: Google::Apis::ComputeAlpha::NodeGroupsScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::NodeGroupsScopedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::NodeGroupsScopedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class NodeGroupsSetAutoscalingPolicyRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :autoscaling_policy, as: 'autoscalingPolicy', class: Google::Apis::ComputeAlpha::NodeGroupAutoscalingPolicy, decorator: Google::Apis::ComputeAlpha::NodeGroupAutoscalingPolicy::Representation
      
        end
      end
      
      class NodeGroupsSetNodeTemplateRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :node_template, as: 'nodeTemplate'
        end
      end
      
      class NodeTemplate
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creation_timestamp, as: 'creationTimestamp'
          property :description, as: 'description'
          collection :disks, as: 'disks', class: Google::Apis::ComputeAlpha::LocalDisk, decorator: Google::Apis::ComputeAlpha::LocalDisk::Representation
      
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          hash :node_affinity_labels, as: 'nodeAffinityLabels'
          property :node_type, as: 'nodeType'
          property :node_type_flexibility, as: 'nodeTypeFlexibility', class: Google::Apis::ComputeAlpha::NodeTemplateNodeTypeFlexibility, decorator: Google::Apis::ComputeAlpha::NodeTemplateNodeTypeFlexibility::Representation
      
          property :region, as: 'region'
          property :self_link, as: 'selfLink'
          property :self_link_with_id, as: 'selfLinkWithId'
          property :server_binding, as: 'serverBinding', class: Google::Apis::ComputeAlpha::ServerBinding, decorator: Google::Apis::ComputeAlpha::ServerBinding::Representation
      
          property :status, as: 'status'
          property :status_message, as: 'statusMessage'
        end
      end
      
      class NodeTemplateAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeAlpha::NodeTemplatesScopedList, decorator: Google::Apis::ComputeAlpha::NodeTemplatesScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::NodeTemplateAggregatedList::Warning, decorator: Google::Apis::ComputeAlpha::NodeTemplateAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::NodeTemplateAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::NodeTemplateAggregatedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class NodeTemplateList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::NodeTemplate, decorator: Google::Apis::ComputeAlpha::NodeTemplate::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::NodeTemplateList::Warning, decorator: Google::Apis::ComputeAlpha::NodeTemplateList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::NodeTemplateList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::NodeTemplateList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class NodeTemplateNodeTypeFlexibility
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cpus, as: 'cpus'
          property :local_ssd, as: 'localSsd'
          property :memory, as: 'memory'
        end
      end
      
      class NodeTemplatesScopedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :node_templates, as: 'nodeTemplates', class: Google::Apis::ComputeAlpha::NodeTemplate, decorator: Google::Apis::ComputeAlpha::NodeTemplate::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::NodeTemplatesScopedList::Warning, decorator: Google::Apis::ComputeAlpha::NodeTemplatesScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::NodeTemplatesScopedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::NodeTemplatesScopedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class NodeType
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cpu_platform, as: 'cpuPlatform'
          property :creation_timestamp, as: 'creationTimestamp'
          property :deprecated, as: 'deprecated', class: Google::Apis::ComputeAlpha::DeprecationStatus, decorator: Google::Apis::ComputeAlpha::DeprecationStatus::Representation
      
          property :description, as: 'description'
          property :guest_cpus, as: 'guestCpus'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :local_ssd_gb, as: 'localSsdGb'
          property :memory_mb, as: 'memoryMb'
          property :name, as: 'name'
          property :self_link, as: 'selfLink'
          property :self_link_with_id, as: 'selfLinkWithId'
          property :zone, as: 'zone'
        end
      end
      
      class NodeTypeAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeAlpha::NodeTypesScopedList, decorator: Google::Apis::ComputeAlpha::NodeTypesScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::NodeTypeAggregatedList::Warning, decorator: Google::Apis::ComputeAlpha::NodeTypeAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::NodeTypeAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::NodeTypeAggregatedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class NodeTypeList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::NodeType, decorator: Google::Apis::ComputeAlpha::NodeType::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::NodeTypeList::Warning, decorator: Google::Apis::ComputeAlpha::NodeTypeList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::NodeTypeList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::NodeTypeList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class NodeTypesScopedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :node_types, as: 'nodeTypes', class: Google::Apis::ComputeAlpha::NodeType, decorator: Google::Apis::ComputeAlpha::NodeType::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::NodeTypesScopedList::Warning, decorator: Google::Apis::ComputeAlpha::NodeTypesScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::NodeTypesScopedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::NodeTypesScopedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class NotificationEndpoint
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creation_timestamp, as: 'creationTimestamp'
          property :description, as: 'description'
          property :grpc_settings, as: 'grpcSettings', class: Google::Apis::ComputeAlpha::NotificationEndpointGrpcSettings, decorator: Google::Apis::ComputeAlpha::NotificationEndpointGrpcSettings::Representation
      
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :region, as: 'region'
          property :self_link, as: 'selfLink'
        end
      end
      
      class NotificationEndpointGrpcSettings
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :authority, as: 'authority'
          property :endpoint, as: 'endpoint'
          property :payload_name, as: 'payloadName'
          property :resend_interval, as: 'resendInterval', class: Google::Apis::ComputeAlpha::Duration, decorator: Google::Apis::ComputeAlpha::Duration::Representation
      
          property :retry_duration_sec, as: 'retryDurationSec'
        end
      end
      
      class NotificationEndpointList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::NotificationEndpoint, decorator: Google::Apis::ComputeAlpha::NotificationEndpoint::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::NotificationEndpointList::Warning, decorator: Google::Apis::ComputeAlpha::NotificationEndpointList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::NotificationEndpointList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::NotificationEndpointList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class Operation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :client_operation_id, as: 'clientOperationId'
          property :creation_timestamp, as: 'creationTimestamp'
          property :description, as: 'description'
          property :end_time, as: 'endTime'
          property :error, as: 'error', class: Google::Apis::ComputeAlpha::Operation::Error, decorator: Google::Apis::ComputeAlpha::Operation::Error::Representation
      
          property :http_error_message, as: 'httpErrorMessage'
          property :http_error_status_code, as: 'httpErrorStatusCode'
          property :id, :numeric_string => true, as: 'id'
          property :insert_time, as: 'insertTime'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :operation_type, as: 'operationType'
          property :progress, as: 'progress'
          property :region, as: 'region'
          property :self_link, as: 'selfLink'
          property :self_link_with_id, as: 'selfLinkWithId'
          property :start_time, as: 'startTime'
          property :status, as: 'status'
          property :status_message, as: 'statusMessage'
          property :target_id, :numeric_string => true, as: 'targetId'
          property :target_link, as: 'targetLink'
          property :user, as: 'user'
          collection :warnings, as: 'warnings', class: Google::Apis::ComputeAlpha::Operation::Warning, decorator: Google::Apis::ComputeAlpha::Operation::Warning::Representation
      
          property :zone, as: 'zone'
        end
        
        class Error
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            collection :errors, as: 'errors', class: Google::Apis::ComputeAlpha::Operation::Error::Error, decorator: Google::Apis::ComputeAlpha::Operation::Error::Error::Representation
        
          end
          
          class Error
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :code, as: 'code'
              property :location, as: 'location'
              property :message, as: 'message'
            end
          end
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::Operation::Warning::Datum, decorator: Google::Apis::ComputeAlpha::Operation::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class OperationAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeAlpha::OperationsScopedList, decorator: Google::Apis::ComputeAlpha::OperationsScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::OperationAggregatedList::Warning, decorator: Google::Apis::ComputeAlpha::OperationAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::OperationAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::OperationAggregatedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class OperationList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::Operation, decorator: Google::Apis::ComputeAlpha::Operation::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::OperationList::Warning, decorator: Google::Apis::ComputeAlpha::OperationList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::OperationList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::OperationList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class OperationsScopedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :operations, as: 'operations', class: Google::Apis::ComputeAlpha::Operation, decorator: Google::Apis::ComputeAlpha::Operation::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::OperationsScopedList::Warning, decorator: Google::Apis::ComputeAlpha::OperationsScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::OperationsScopedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::OperationsScopedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class OrganizationSecurityPoliciesListAssociationsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :associations, as: 'associations', class: Google::Apis::ComputeAlpha::SecurityPolicyAssociation, decorator: Google::Apis::ComputeAlpha::SecurityPolicyAssociation::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class OriginAuthenticationMethod
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :jwt, as: 'jwt', class: Google::Apis::ComputeAlpha::Jwt, decorator: Google::Apis::ComputeAlpha::Jwt::Representation
      
        end
      end
      
      class OutlierDetection
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :base_ejection_time, as: 'baseEjectionTime', class: Google::Apis::ComputeAlpha::Duration, decorator: Google::Apis::ComputeAlpha::Duration::Representation
      
          property :consecutive_errors, as: 'consecutiveErrors'
          property :consecutive_gateway_failure, as: 'consecutiveGatewayFailure'
          property :enforcing_consecutive_errors, as: 'enforcingConsecutiveErrors'
          property :enforcing_consecutive_gateway_failure, as: 'enforcingConsecutiveGatewayFailure'
          property :enforcing_success_rate, as: 'enforcingSuccessRate'
          property :interval, as: 'interval', class: Google::Apis::ComputeAlpha::Duration, decorator: Google::Apis::ComputeAlpha::Duration::Representation
      
          property :max_ejection_percent, as: 'maxEjectionPercent'
          property :success_rate_minimum_hosts, as: 'successRateMinimumHosts'
          property :success_rate_request_volume, as: 'successRateRequestVolume'
          property :success_rate_stdev_factor, as: 'successRateStdevFactor'
        end
      end
      
      class PacketIntervals
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :avg_ms, :numeric_string => true, as: 'avgMs'
          property :duration, as: 'duration'
          property :max_ms, :numeric_string => true, as: 'maxMs'
          property :min_ms, :numeric_string => true, as: 'minMs'
          property :num_intervals, :numeric_string => true, as: 'numIntervals'
          property :type, as: 'type'
        end
      end
      
      class PacketMirroring
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :collector_ilb, as: 'collectorIlb', class: Google::Apis::ComputeAlpha::PacketMirroringForwardingRuleInfo, decorator: Google::Apis::ComputeAlpha::PacketMirroringForwardingRuleInfo::Representation
      
          property :collectors, as: 'collectors', class: Google::Apis::ComputeAlpha::PacketMirroringCollectorInfo, decorator: Google::Apis::ComputeAlpha::PacketMirroringCollectorInfo::Representation
      
          property :creation_timestamp, as: 'creationTimestamp'
          property :description, as: 'description'
          property :enable, as: 'enable'
          property :filter, as: 'filter', class: Google::Apis::ComputeAlpha::PacketMirroringFilter, decorator: Google::Apis::ComputeAlpha::PacketMirroringFilter::Representation
      
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :mirrored_resources, as: 'mirroredResources', class: Google::Apis::ComputeAlpha::PacketMirroringMirroredResourceInfo, decorator: Google::Apis::ComputeAlpha::PacketMirroringMirroredResourceInfo::Representation
      
          property :name, as: 'name'
          property :network, as: 'network', class: Google::Apis::ComputeAlpha::PacketMirroringNetworkInfo, decorator: Google::Apis::ComputeAlpha::PacketMirroringNetworkInfo::Representation
      
          collection :packet_matchers, as: 'packetMatchers', class: Google::Apis::ComputeAlpha::PacketMirroringPacketMatcher, decorator: Google::Apis::ComputeAlpha::PacketMirroringPacketMatcher::Representation
      
          property :priority, as: 'priority'
          property :region, as: 'region'
          property :self_link, as: 'selfLink'
          property :self_link_with_id, as: 'selfLinkWithId'
        end
      end
      
      class PacketMirroringAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeAlpha::PacketMirroringsScopedList, decorator: Google::Apis::ComputeAlpha::PacketMirroringsScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::PacketMirroringAggregatedList::Warning, decorator: Google::Apis::ComputeAlpha::PacketMirroringAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::PacketMirroringAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::PacketMirroringAggregatedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class PacketMirroringCollectorInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :instances, as: 'instances', class: Google::Apis::ComputeAlpha::PacketMirroringCollectorInfoInstanceInfo, decorator: Google::Apis::ComputeAlpha::PacketMirroringCollectorInfoInstanceInfo::Representation
      
        end
      end
      
      class PacketMirroringCollectorInfoInstanceInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :url, as: 'url'
        end
      end
      
      class PacketMirroringFilter
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :ip_protocols, as: 'IPProtocols'
          collection :cidr_ranges, as: 'cidrRanges'
        end
      end
      
      class PacketMirroringForwardingRuleInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :canonical_url, as: 'canonicalUrl'
          property :url, as: 'url'
        end
      end
      
      class PacketMirroringList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::PacketMirroring, decorator: Google::Apis::ComputeAlpha::PacketMirroring::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::PacketMirroringList::Warning, decorator: Google::Apis::ComputeAlpha::PacketMirroringList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::PacketMirroringList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::PacketMirroringList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class PacketMirroringMirroredResourceInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :instances, as: 'instances', class: Google::Apis::ComputeAlpha::PacketMirroringMirroredResourceInfoInstanceInfo, decorator: Google::Apis::ComputeAlpha::PacketMirroringMirroredResourceInfoInstanceInfo::Representation
      
          collection :subnetworks, as: 'subnetworks', class: Google::Apis::ComputeAlpha::PacketMirroringMirroredResourceInfoSubnetInfo, decorator: Google::Apis::ComputeAlpha::PacketMirroringMirroredResourceInfoSubnetInfo::Representation
      
          collection :tags, as: 'tags'
        end
      end
      
      class PacketMirroringMirroredResourceInfoInstanceInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :canonical_url, as: 'canonicalUrl'
          property :url, as: 'url'
        end
      end
      
      class PacketMirroringMirroredResourceInfoSubnetInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :canonical_url, as: 'canonicalUrl'
          property :url, as: 'url'
        end
      end
      
      class PacketMirroringNetworkInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :canonical_url, as: 'canonicalUrl'
          property :url, as: 'url'
        end
      end
      
      class PacketMirroringPacketMatcher
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cidr_range, as: 'cidrRange'
        end
      end
      
      class PacketMirroringsScopedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :packet_mirrorings, as: 'packetMirrorings', class: Google::Apis::ComputeAlpha::PacketMirroring, decorator: Google::Apis::ComputeAlpha::PacketMirroring::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::PacketMirroringsScopedList::Warning, decorator: Google::Apis::ComputeAlpha::PacketMirroringsScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::PacketMirroringsScopedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::PacketMirroringsScopedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class PathMatcher
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :default_route_action, as: 'defaultRouteAction', class: Google::Apis::ComputeAlpha::HttpRouteAction, decorator: Google::Apis::ComputeAlpha::HttpRouteAction::Representation
      
          property :default_service, as: 'defaultService'
          property :default_url_redirect, as: 'defaultUrlRedirect', class: Google::Apis::ComputeAlpha::HttpRedirectAction, decorator: Google::Apis::ComputeAlpha::HttpRedirectAction::Representation
      
          property :description, as: 'description'
          property :header_action, as: 'headerAction', class: Google::Apis::ComputeAlpha::HttpHeaderAction, decorator: Google::Apis::ComputeAlpha::HttpHeaderAction::Representation
      
          property :name, as: 'name'
          collection :path_rules, as: 'pathRules', class: Google::Apis::ComputeAlpha::PathRule, decorator: Google::Apis::ComputeAlpha::PathRule::Representation
      
          collection :route_rules, as: 'routeRules', class: Google::Apis::ComputeAlpha::HttpRouteRule, decorator: Google::Apis::ComputeAlpha::HttpRouteRule::Representation
      
        end
      end
      
      class PathRule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :paths, as: 'paths'
          property :route_action, as: 'routeAction', class: Google::Apis::ComputeAlpha::HttpRouteAction, decorator: Google::Apis::ComputeAlpha::HttpRouteAction::Representation
      
          property :service, as: 'service'
          property :url_redirect, as: 'urlRedirect', class: Google::Apis::ComputeAlpha::HttpRedirectAction, decorator: Google::Apis::ComputeAlpha::HttpRedirectAction::Representation
      
        end
      end
      
      class PeerAuthenticationMethod
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :mtls, as: 'mtls', class: Google::Apis::ComputeAlpha::MutualTls, decorator: Google::Apis::ComputeAlpha::MutualTls::Representation
      
        end
      end
      
      class PerInstanceConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :fingerprint, :base64 => true, as: 'fingerprint'
          property :name, as: 'name'
          property :preserved_state, as: 'preservedState', class: Google::Apis::ComputeAlpha::PreservedState, decorator: Google::Apis::ComputeAlpha::PreservedState::Representation
      
        end
      end
      
      class Permission
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :constraints, as: 'constraints', class: Google::Apis::ComputeAlpha::PermissionConstraint, decorator: Google::Apis::ComputeAlpha::PermissionConstraint::Representation
      
          collection :hosts, as: 'hosts'
          collection :methods_prop, as: 'methods'
          collection :not_hosts, as: 'notHosts'
          collection :not_methods, as: 'notMethods'
          collection :not_paths, as: 'notPaths'
          collection :not_ports, as: 'notPorts'
          collection :paths, as: 'paths'
          collection :ports, as: 'ports'
        end
      end
      
      class PermissionConstraint
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :key, as: 'key'
          collection :values, as: 'values'
        end
      end
      
      class Policy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :audit_configs, as: 'auditConfigs', class: Google::Apis::ComputeAlpha::AuditConfig, decorator: Google::Apis::ComputeAlpha::AuditConfig::Representation
      
          collection :bindings, as: 'bindings', class: Google::Apis::ComputeAlpha::Binding, decorator: Google::Apis::ComputeAlpha::Binding::Representation
      
          property :etag, :base64 => true, as: 'etag'
          property :iam_owned, as: 'iamOwned'
          collection :rules, as: 'rules', class: Google::Apis::ComputeAlpha::Rule, decorator: Google::Apis::ComputeAlpha::Rule::Representation
      
          property :version, as: 'version'
        end
      end
      
      class PreconfiguredWafSet
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :expression_sets, as: 'expressionSets', class: Google::Apis::ComputeAlpha::WafExpressionSet, decorator: Google::Apis::ComputeAlpha::WafExpressionSet::Representation
      
        end
      end
      
      class PreservedState
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :disks, as: 'disks', class: Google::Apis::ComputeAlpha::PreservedStatePreservedDisk, decorator: Google::Apis::ComputeAlpha::PreservedStatePreservedDisk::Representation
      
          hash :metadata, as: 'metadata'
        end
      end
      
      class PreservedStatePreservedDisk
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :auto_delete, as: 'autoDelete'
          property :mode, as: 'mode'
          property :source, as: 'source'
        end
      end
      
      class Principal
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :condition, as: 'condition'
          collection :groups, as: 'groups'
          collection :ips, as: 'ips'
          collection :namespaces, as: 'namespaces'
          collection :not_groups, as: 'notGroups'
          collection :not_ips, as: 'notIps'
          collection :not_namespaces, as: 'notNamespaces'
          collection :not_users, as: 'notUsers'
          hash :properties, as: 'properties'
          collection :users, as: 'users'
        end
      end
      
      class Project
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :common_instance_metadata, as: 'commonInstanceMetadata', class: Google::Apis::ComputeAlpha::Metadata, decorator: Google::Apis::ComputeAlpha::Metadata::Representation
      
          property :creation_timestamp, as: 'creationTimestamp'
          property :default_network_tier, as: 'defaultNetworkTier'
          property :default_service_account, as: 'defaultServiceAccount'
          property :description, as: 'description'
          collection :enabled_features, as: 'enabledFeatures'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          collection :quotas, as: 'quotas', class: Google::Apis::ComputeAlpha::Quota, decorator: Google::Apis::ComputeAlpha::Quota::Representation
      
          property :self_link, as: 'selfLink'
          property :usage_export_location, as: 'usageExportLocation', class: Google::Apis::ComputeAlpha::UsageExportLocation, decorator: Google::Apis::ComputeAlpha::UsageExportLocation::Representation
      
          property :xpn_project_status, as: 'xpnProjectStatus'
        end
      end
      
      class ProjectsDisableXpnResourceRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :xpn_resource, as: 'xpnResource', class: Google::Apis::ComputeAlpha::XpnResourceId, decorator: Google::Apis::ComputeAlpha::XpnResourceId::Representation
      
        end
      end
      
      class ProjectsEnableXpnResourceRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :xpn_resource, as: 'xpnResource', class: Google::Apis::ComputeAlpha::XpnResourceId, decorator: Google::Apis::ComputeAlpha::XpnResourceId::Representation
      
        end
      end
      
      class ProjectsGetXpnResources
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          collection :resources, as: 'resources', class: Google::Apis::ComputeAlpha::XpnResourceId, decorator: Google::Apis::ComputeAlpha::XpnResourceId::Representation
      
        end
      end
      
      class ProjectsListXpnHostsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :organization, as: 'organization'
        end
      end
      
      class ProjectsSetDefaultNetworkTierRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :network_tier, as: 'networkTier'
        end
      end
      
      class ProjectsSetDefaultServiceAccountRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :email, as: 'email'
        end
      end
      
      class PublicAdvertisedPrefix
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creation_timestamp, as: 'creationTimestamp'
          property :description, as: 'description'
          property :dns_verification_ip, as: 'dnsVerificationIp'
          property :fingerprint, :base64 => true, as: 'fingerprint'
          property :id, :numeric_string => true, as: 'id'
          property :ip_cidr_range, as: 'ipCidrRange'
          property :kind, as: 'kind'
          property :name, as: 'name'
          collection :public_delegated_prefixs, as: 'publicDelegatedPrefixs', class: Google::Apis::ComputeAlpha::PublicAdvertisedPrefixPublicDelegatedPrefix, decorator: Google::Apis::ComputeAlpha::PublicAdvertisedPrefixPublicDelegatedPrefix::Representation
      
          property :self_link, as: 'selfLink'
          property :self_link_with_id, as: 'selfLinkWithId'
          property :shared_secret, as: 'sharedSecret'
          property :status, as: 'status'
        end
      end
      
      class PublicAdvertisedPrefixList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::PublicAdvertisedPrefix, decorator: Google::Apis::ComputeAlpha::PublicAdvertisedPrefix::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::PublicAdvertisedPrefixList::Warning, decorator: Google::Apis::ComputeAlpha::PublicAdvertisedPrefixList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::PublicAdvertisedPrefixList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::PublicAdvertisedPrefixList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class PublicAdvertisedPrefixPublicDelegatedPrefix
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :region, as: 'region'
          property :status, as: 'status'
        end
      end
      
      class PublicDelegatedPrefix
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creation_timestamp, as: 'creationTimestamp'
          property :description, as: 'description'
          property :fingerprint, :base64 => true, as: 'fingerprint'
          property :id, :numeric_string => true, as: 'id'
          property :ip_cidr_range, as: 'ipCidrRange'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :parent_prefix, as: 'parentPrefix'
          collection :public_delegated_sub_prefixs, as: 'publicDelegatedSubPrefixs', class: Google::Apis::ComputeAlpha::PublicDelegatedPrefixPublicDelegatedSubPrefix, decorator: Google::Apis::ComputeAlpha::PublicDelegatedPrefixPublicDelegatedSubPrefix::Representation
      
          property :region, as: 'region'
          property :self_link, as: 'selfLink'
          property :self_link_with_id, as: 'selfLinkWithId'
          property :status, as: 'status'
        end
      end
      
      class PublicDelegatedPrefixAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeAlpha::PublicDelegatedPrefixesScopedList, decorator: Google::Apis::ComputeAlpha::PublicDelegatedPrefixesScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::PublicDelegatedPrefixAggregatedList::Warning, decorator: Google::Apis::ComputeAlpha::PublicDelegatedPrefixAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::PublicDelegatedPrefixAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::PublicDelegatedPrefixAggregatedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class PublicDelegatedPrefixList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::PublicDelegatedPrefix, decorator: Google::Apis::ComputeAlpha::PublicDelegatedPrefix::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::PublicDelegatedPrefixList::Warning, decorator: Google::Apis::ComputeAlpha::PublicDelegatedPrefixList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::PublicDelegatedPrefixList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::PublicDelegatedPrefixList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class PublicDelegatedPrefixPublicDelegatedSubPrefix
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :delegatee_project, as: 'delegateeProject'
          property :description, as: 'description'
          property :ip_cidr_range, as: 'ipCidrRange'
          property :is_address, as: 'isAddress'
          property :name, as: 'name'
          property :region, as: 'region'
          property :status, as: 'status'
        end
      end
      
      class PublicDelegatedPrefixesScopedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :public_delegated_prefixes, as: 'publicDelegatedPrefixes', class: Google::Apis::ComputeAlpha::PublicDelegatedPrefix, decorator: Google::Apis::ComputeAlpha::PublicDelegatedPrefix::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::PublicDelegatedPrefixesScopedList::Warning, decorator: Google::Apis::ComputeAlpha::PublicDelegatedPrefixesScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::PublicDelegatedPrefixesScopedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::PublicDelegatedPrefixesScopedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class Quota
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :limit, as: 'limit'
          property :metric, as: 'metric'
          property :owner, as: 'owner'
          property :usage, as: 'usage'
        end
      end
      
      class RbacPolicy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          collection :permissions, as: 'permissions', class: Google::Apis::ComputeAlpha::Permission, decorator: Google::Apis::ComputeAlpha::Permission::Representation
      
          collection :principals, as: 'principals', class: Google::Apis::ComputeAlpha::Principal, decorator: Google::Apis::ComputeAlpha::Principal::Representation
      
        end
      end
      
      class Reference
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :reference_type, as: 'referenceType'
          property :referrer, as: 'referrer'
          property :target, as: 'target'
        end
      end
      
      class Region
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creation_timestamp, as: 'creationTimestamp'
          property :deprecated, as: 'deprecated', class: Google::Apis::ComputeAlpha::DeprecationStatus, decorator: Google::Apis::ComputeAlpha::DeprecationStatus::Representation
      
          property :description, as: 'description'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          collection :quotas, as: 'quotas', class: Google::Apis::ComputeAlpha::Quota, decorator: Google::Apis::ComputeAlpha::Quota::Representation
      
          property :self_link, as: 'selfLink'
          property :self_link_with_id, as: 'selfLinkWithId'
          property :status, as: 'status'
          collection :zones, as: 'zones'
        end
      end
      
      class RegionAutoscalerList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::Autoscaler, decorator: Google::Apis::ComputeAlpha::Autoscaler::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::RegionAutoscalerList::Warning, decorator: Google::Apis::ComputeAlpha::RegionAutoscalerList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::RegionAutoscalerList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::RegionAutoscalerList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class RegionCommitmentsUpdateReservationsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :reservations, as: 'reservations', class: Google::Apis::ComputeAlpha::Reservation, decorator: Google::Apis::ComputeAlpha::Reservation::Representation
      
        end
      end
      
      class RegionDiskTypeList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::DiskType, decorator: Google::Apis::ComputeAlpha::DiskType::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::RegionDiskTypeList::Warning, decorator: Google::Apis::ComputeAlpha::RegionDiskTypeList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::RegionDiskTypeList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::RegionDiskTypeList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class RegionDisksAddResourcePoliciesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :resource_policies, as: 'resourcePolicies'
        end
      end
      
      class RegionDisksRemoveResourcePoliciesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :resource_policies, as: 'resourcePolicies'
        end
      end
      
      class RegionDisksResizeRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :size_gb, :numeric_string => true, as: 'sizeGb'
        end
      end
      
      class RegionInstanceGroupList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::InstanceGroup, decorator: Google::Apis::ComputeAlpha::InstanceGroup::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::RegionInstanceGroupList::Warning, decorator: Google::Apis::ComputeAlpha::RegionInstanceGroupList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::RegionInstanceGroupList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::RegionInstanceGroupList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class RegionInstanceGroupManagerDeleteInstanceConfigReq
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :names, as: 'names'
        end
      end
      
      class RegionInstanceGroupManagerList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::InstanceGroupManager, decorator: Google::Apis::ComputeAlpha::InstanceGroupManager::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::RegionInstanceGroupManagerList::Warning, decorator: Google::Apis::ComputeAlpha::RegionInstanceGroupManagerList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::RegionInstanceGroupManagerList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::RegionInstanceGroupManagerList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class RegionInstanceGroupManagerPatchInstanceConfigReq
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :per_instance_configs, as: 'perInstanceConfigs', class: Google::Apis::ComputeAlpha::PerInstanceConfig, decorator: Google::Apis::ComputeAlpha::PerInstanceConfig::Representation
      
        end
      end
      
      class RegionInstanceGroupManagerUpdateInstanceConfigReq
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :per_instance_configs, as: 'perInstanceConfigs', class: Google::Apis::ComputeAlpha::PerInstanceConfig, decorator: Google::Apis::ComputeAlpha::PerInstanceConfig::Representation
      
        end
      end
      
      class RegionInstanceGroupManagersAbandonInstancesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :instances, as: 'instances'
        end
      end
      
      class RegionInstanceGroupManagersApplyUpdatesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :instances, as: 'instances'
          property :maximal_action, as: 'maximalAction'
          property :minimal_action, as: 'minimalAction'
          property :most_disruptive_allowed_action, as: 'mostDisruptiveAllowedAction'
        end
      end
      
      class RegionInstanceGroupManagersCreateInstancesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :instances, as: 'instances', class: Google::Apis::ComputeAlpha::PerInstanceConfig, decorator: Google::Apis::ComputeAlpha::PerInstanceConfig::Representation
      
        end
      end
      
      class RegionInstanceGroupManagersDeleteInstancesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :instances, as: 'instances'
        end
      end
      
      class RegionInstanceGroupManagersListErrorsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::InstanceManagedByIgmError, decorator: Google::Apis::ComputeAlpha::InstanceManagedByIgmError::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class RegionInstanceGroupManagersListInstanceConfigsResp
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::PerInstanceConfig, decorator: Google::Apis::ComputeAlpha::PerInstanceConfig::Representation
      
          property :next_page_token, as: 'nextPageToken'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::RegionInstanceGroupManagersListInstanceConfigsResp::Warning, decorator: Google::Apis::ComputeAlpha::RegionInstanceGroupManagersListInstanceConfigsResp::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::RegionInstanceGroupManagersListInstanceConfigsResp::Warning::Datum, decorator: Google::Apis::ComputeAlpha::RegionInstanceGroupManagersListInstanceConfigsResp::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class RegionInstanceGroupManagersListInstancesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :managed_instances, as: 'managedInstances', class: Google::Apis::ComputeAlpha::ManagedInstance, decorator: Google::Apis::ComputeAlpha::ManagedInstance::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class RegionInstanceGroupManagersRecreateRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :instances, as: 'instances'
        end
      end
      
      class RegionInstanceGroupManagersSetAutoHealingRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :auto_healing_policies, as: 'autoHealingPolicies', class: Google::Apis::ComputeAlpha::InstanceGroupManagerAutoHealingPolicy, decorator: Google::Apis::ComputeAlpha::InstanceGroupManagerAutoHealingPolicy::Representation
      
        end
      end
      
      class RegionInstanceGroupManagersSetTargetPoolsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :fingerprint, :base64 => true, as: 'fingerprint'
          collection :target_pools, as: 'targetPools'
        end
      end
      
      class RegionInstanceGroupManagersSetTemplateRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :instance_template, as: 'instanceTemplate'
        end
      end
      
      class RegionInstanceGroupsListInstances
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::InstanceWithNamedPorts, decorator: Google::Apis::ComputeAlpha::InstanceWithNamedPorts::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::RegionInstanceGroupsListInstances::Warning, decorator: Google::Apis::ComputeAlpha::RegionInstanceGroupsListInstances::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::RegionInstanceGroupsListInstances::Warning::Datum, decorator: Google::Apis::ComputeAlpha::RegionInstanceGroupsListInstances::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class RegionInstanceGroupsListInstancesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :instance_state, as: 'instanceState'
          property :port_name, as: 'portName'
        end
      end
      
      class RegionInstanceGroupsSetNamedPortsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :fingerprint, :base64 => true, as: 'fingerprint'
          collection :named_ports, as: 'namedPorts', class: Google::Apis::ComputeAlpha::NamedPort, decorator: Google::Apis::ComputeAlpha::NamedPort::Representation
      
        end
      end
      
      class RegionList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::Region, decorator: Google::Apis::ComputeAlpha::Region::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::RegionList::Warning, decorator: Google::Apis::ComputeAlpha::RegionList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::RegionList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::RegionList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class RegionSetLabelsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :label_fingerprint, :base64 => true, as: 'labelFingerprint'
          hash :labels, as: 'labels'
        end
      end
      
      class RegionSetPolicyRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :bindings, as: 'bindings', class: Google::Apis::ComputeAlpha::Binding, decorator: Google::Apis::ComputeAlpha::Binding::Representation
      
          property :etag, :base64 => true, as: 'etag'
          property :policy, as: 'policy', class: Google::Apis::ComputeAlpha::Policy, decorator: Google::Apis::ComputeAlpha::Policy::Representation
      
        end
      end
      
      class RegionTargetHttpsProxiesSetSslCertificatesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :ssl_certificates, as: 'sslCertificates'
        end
      end
      
      class RegionUrlMapsValidateRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :resource, as: 'resource', class: Google::Apis::ComputeAlpha::UrlMap, decorator: Google::Apis::ComputeAlpha::UrlMap::Representation
      
        end
      end
      
      class RequestMirrorPolicy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :backend_service, as: 'backendService'
        end
      end
      
      class Reservation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :commitment, as: 'commitment'
          property :creation_timestamp, as: 'creationTimestamp'
          property :description, as: 'description'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :self_link, as: 'selfLink'
          property :self_link_with_id, as: 'selfLinkWithId'
          property :specific_reservation, as: 'specificReservation', class: Google::Apis::ComputeAlpha::AllocationSpecificSkuReservation, decorator: Google::Apis::ComputeAlpha::AllocationSpecificSkuReservation::Representation
      
          property :specific_reservation_required, as: 'specificReservationRequired'
          property :status, as: 'status'
          property :zone, as: 'zone'
        end
      end
      
      class ReservationAffinity
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :consume_reservation_type, as: 'consumeReservationType'
          property :key, as: 'key'
          collection :values, as: 'values'
        end
      end
      
      class ReservationAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeAlpha::ReservationsScopedList, decorator: Google::Apis::ComputeAlpha::ReservationsScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::ReservationAggregatedList::Warning, decorator: Google::Apis::ComputeAlpha::ReservationAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::ReservationAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::ReservationAggregatedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class ReservationList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::Reservation, decorator: Google::Apis::ComputeAlpha::Reservation::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::ReservationList::Warning, decorator: Google::Apis::ComputeAlpha::ReservationList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::ReservationList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::ReservationList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class ReservationsResizeRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :specific_sku_count, :numeric_string => true, as: 'specificSkuCount'
        end
      end
      
      class ReservationsScopedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :reservations, as: 'reservations', class: Google::Apis::ComputeAlpha::Reservation, decorator: Google::Apis::ComputeAlpha::Reservation::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::ReservationsScopedList::Warning, decorator: Google::Apis::ComputeAlpha::ReservationsScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::ReservationsScopedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::ReservationsScopedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class ResourceCommitment
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :accelerator_type, as: 'acceleratorType'
          property :amount, :numeric_string => true, as: 'amount'
          property :type, as: 'type'
        end
      end
      
      class ResourceGroupReference
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :group, as: 'group'
        end
      end
      
      class ResourcePoliciesScopedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :resource_policies, as: 'resourcePolicies', class: Google::Apis::ComputeAlpha::ResourcePolicy, decorator: Google::Apis::ComputeAlpha::ResourcePolicy::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::ResourcePoliciesScopedList::Warning, decorator: Google::Apis::ComputeAlpha::ResourcePoliciesScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::ResourcePoliciesScopedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::ResourcePoliciesScopedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class ResourcePolicy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creation_timestamp, as: 'creationTimestamp'
          property :description, as: 'description'
          property :group_placement_policy, as: 'groupPlacementPolicy', class: Google::Apis::ComputeAlpha::ResourcePolicyGroupPlacementPolicy, decorator: Google::Apis::ComputeAlpha::ResourcePolicyGroupPlacementPolicy::Representation
      
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :region, as: 'region'
          property :self_link, as: 'selfLink'
          property :self_link_with_id, as: 'selfLinkWithId'
          property :snapshot_schedule_policy, as: 'snapshotSchedulePolicy', class: Google::Apis::ComputeAlpha::ResourcePolicySnapshotSchedulePolicy, decorator: Google::Apis::ComputeAlpha::ResourcePolicySnapshotSchedulePolicy::Representation
      
          property :status, as: 'status'
          property :vm_maintenance_policy, as: 'vmMaintenancePolicy', class: Google::Apis::ComputeAlpha::ResourcePolicyVmMaintenancePolicy, decorator: Google::Apis::ComputeAlpha::ResourcePolicyVmMaintenancePolicy::Representation
      
        end
      end
      
      class ResourcePolicyAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeAlpha::ResourcePoliciesScopedList, decorator: Google::Apis::ComputeAlpha::ResourcePoliciesScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::ResourcePolicyAggregatedList::Warning, decorator: Google::Apis::ComputeAlpha::ResourcePolicyAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::ResourcePolicyAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::ResourcePolicyAggregatedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class ResourcePolicyDailyCycle
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :days_in_cycle, as: 'daysInCycle'
          property :duration, as: 'duration'
          property :start_time, as: 'startTime'
        end
      end
      
      class ResourcePolicyGroupPlacementPolicy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :availability_domain_count, as: 'availabilityDomainCount'
          property :distribution, as: 'distribution'
          property :locality, as: 'locality'
          property :style, as: 'style'
          property :vm_count, as: 'vmCount'
        end
      end
      
      class ResourcePolicyHourlyCycle
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :duration, as: 'duration'
          property :hours_in_cycle, as: 'hoursInCycle'
          property :start_time, as: 'startTime'
        end
      end
      
      class ResourcePolicyList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::ResourcePolicy, decorator: Google::Apis::ComputeAlpha::ResourcePolicy::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::ResourcePolicyList::Warning, decorator: Google::Apis::ComputeAlpha::ResourcePolicyList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::ResourcePolicyList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::ResourcePolicyList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class ResourcePolicySnapshotSchedulePolicy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :retention_policy, as: 'retentionPolicy', class: Google::Apis::ComputeAlpha::ResourcePolicySnapshotSchedulePolicyRetentionPolicy, decorator: Google::Apis::ComputeAlpha::ResourcePolicySnapshotSchedulePolicyRetentionPolicy::Representation
      
          property :schedule, as: 'schedule', class: Google::Apis::ComputeAlpha::ResourcePolicySnapshotSchedulePolicySchedule, decorator: Google::Apis::ComputeAlpha::ResourcePolicySnapshotSchedulePolicySchedule::Representation
      
          property :snapshot_properties, as: 'snapshotProperties', class: Google::Apis::ComputeAlpha::ResourcePolicySnapshotSchedulePolicySnapshotProperties, decorator: Google::Apis::ComputeAlpha::ResourcePolicySnapshotSchedulePolicySnapshotProperties::Representation
      
        end
      end
      
      class ResourcePolicySnapshotSchedulePolicyRetentionPolicy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :max_retention_days, as: 'maxRetentionDays'
          property :on_policy_switch, as: 'onPolicySwitch'
          property :on_source_disk_delete, as: 'onSourceDiskDelete'
        end
      end
      
      class ResourcePolicySnapshotSchedulePolicySchedule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :daily_schedule, as: 'dailySchedule', class: Google::Apis::ComputeAlpha::ResourcePolicyDailyCycle, decorator: Google::Apis::ComputeAlpha::ResourcePolicyDailyCycle::Representation
      
          property :hourly_schedule, as: 'hourlySchedule', class: Google::Apis::ComputeAlpha::ResourcePolicyHourlyCycle, decorator: Google::Apis::ComputeAlpha::ResourcePolicyHourlyCycle::Representation
      
          property :weekly_schedule, as: 'weeklySchedule', class: Google::Apis::ComputeAlpha::ResourcePolicyWeeklyCycle, decorator: Google::Apis::ComputeAlpha::ResourcePolicyWeeklyCycle::Representation
      
        end
      end
      
      class ResourcePolicySnapshotSchedulePolicySnapshotProperties
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :guest_flush, as: 'guestFlush'
          hash :labels, as: 'labels'
          collection :storage_locations, as: 'storageLocations'
        end
      end
      
      class ResourcePolicyVmMaintenancePolicy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :concurrency_control_group, as: 'concurrencyControlGroup', class: Google::Apis::ComputeAlpha::ResourcePolicyVmMaintenancePolicyConcurrencyControl, decorator: Google::Apis::ComputeAlpha::ResourcePolicyVmMaintenancePolicyConcurrencyControl::Representation
      
          property :maintenance_window, as: 'maintenanceWindow', class: Google::Apis::ComputeAlpha::ResourcePolicyVmMaintenancePolicyMaintenanceWindow, decorator: Google::Apis::ComputeAlpha::ResourcePolicyVmMaintenancePolicyMaintenanceWindow::Representation
      
        end
      end
      
      class ResourcePolicyVmMaintenancePolicyConcurrencyControl
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :concurrency_limit, as: 'concurrencyLimit'
        end
      end
      
      class ResourcePolicyVmMaintenancePolicyMaintenanceWindow
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :daily_maintenance_window, as: 'dailyMaintenanceWindow', class: Google::Apis::ComputeAlpha::ResourcePolicyDailyCycle, decorator: Google::Apis::ComputeAlpha::ResourcePolicyDailyCycle::Representation
      
        end
      end
      
      class ResourcePolicyWeeklyCycle
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :day_of_weeks, as: 'dayOfWeeks', class: Google::Apis::ComputeAlpha::ResourcePolicyWeeklyCycleDayOfWeek, decorator: Google::Apis::ComputeAlpha::ResourcePolicyWeeklyCycleDayOfWeek::Representation
      
        end
      end
      
      class ResourcePolicyWeeklyCycleDayOfWeek
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :day, as: 'day'
          property :duration, as: 'duration'
          property :start_time, as: 'startTime'
        end
      end
      
      class Route
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creation_timestamp, as: 'creationTimestamp'
          property :description, as: 'description'
          property :dest_range, as: 'destRange'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :network, as: 'network'
          property :next_hop_gateway, as: 'nextHopGateway'
          property :next_hop_ilb, as: 'nextHopIlb'
          property :next_hop_instance, as: 'nextHopInstance'
          property :next_hop_interconnect_attachment, as: 'nextHopInterconnectAttachment'
          property :next_hop_ip, as: 'nextHopIp'
          property :next_hop_network, as: 'nextHopNetwork'
          property :next_hop_peering, as: 'nextHopPeering'
          property :next_hop_vpn_tunnel, as: 'nextHopVpnTunnel'
          property :priority, as: 'priority'
          property :self_link, as: 'selfLink'
          property :self_link_with_id, as: 'selfLinkWithId'
          collection :tags, as: 'tags'
          collection :warnings, as: 'warnings', class: Google::Apis::ComputeAlpha::Route::Warning, decorator: Google::Apis::ComputeAlpha::Route::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::Route::Warning::Datum, decorator: Google::Apis::ComputeAlpha::Route::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class RouteList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::Route, decorator: Google::Apis::ComputeAlpha::Route::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::RouteList::Warning, decorator: Google::Apis::ComputeAlpha::RouteList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::RouteList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::RouteList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class Router
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bgp, as: 'bgp', class: Google::Apis::ComputeAlpha::RouterBgp, decorator: Google::Apis::ComputeAlpha::RouterBgp::Representation
      
          collection :bgp_peers, as: 'bgpPeers', class: Google::Apis::ComputeAlpha::RouterBgpPeer, decorator: Google::Apis::ComputeAlpha::RouterBgpPeer::Representation
      
          property :creation_timestamp, as: 'creationTimestamp'
          property :description, as: 'description'
          property :id, :numeric_string => true, as: 'id'
          collection :interfaces, as: 'interfaces', class: Google::Apis::ComputeAlpha::RouterInterface, decorator: Google::Apis::ComputeAlpha::RouterInterface::Representation
      
          property :kind, as: 'kind'
          property :name, as: 'name'
          collection :nats, as: 'nats', class: Google::Apis::ComputeAlpha::RouterNat, decorator: Google::Apis::ComputeAlpha::RouterNat::Representation
      
          property :network, as: 'network'
          property :region, as: 'region'
          property :self_link, as: 'selfLink'
          property :self_link_with_id, as: 'selfLinkWithId'
        end
      end
      
      class RouterAdvertisedIpRange
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :range, as: 'range'
        end
      end
      
      class RouterAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeAlpha::RoutersScopedList, decorator: Google::Apis::ComputeAlpha::RoutersScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::RouterAggregatedList::Warning, decorator: Google::Apis::ComputeAlpha::RouterAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::RouterAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::RouterAggregatedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class RouterBgp
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :advertise_mode, as: 'advertiseMode'
          collection :advertised_groups, as: 'advertisedGroups'
          collection :advertised_ip_ranges, as: 'advertisedIpRanges', class: Google::Apis::ComputeAlpha::RouterAdvertisedIpRange, decorator: Google::Apis::ComputeAlpha::RouterAdvertisedIpRange::Representation
      
          property :asn, as: 'asn'
          property :keepalive_interval, as: 'keepaliveInterval'
        end
      end
      
      class RouterBgpPeer
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :advertise_mode, as: 'advertiseMode'
          collection :advertised_groups, as: 'advertisedGroups'
          collection :advertised_ip_ranges, as: 'advertisedIpRanges', class: Google::Apis::ComputeAlpha::RouterAdvertisedIpRange, decorator: Google::Apis::ComputeAlpha::RouterAdvertisedIpRange::Representation
      
          property :advertised_route_priority, as: 'advertisedRoutePriority'
          property :bfd, as: 'bfd', class: Google::Apis::ComputeAlpha::RouterBgpPeerBfd, decorator: Google::Apis::ComputeAlpha::RouterBgpPeerBfd::Representation
      
          property :enable, as: 'enable'
          property :interface_name, as: 'interfaceName'
          property :ip_address, as: 'ipAddress'
          property :management_type, as: 'managementType'
          property :name, as: 'name'
          property :peer_asn, as: 'peerAsn'
          property :peer_ip_address, as: 'peerIpAddress'
        end
      end
      
      class RouterBgpPeerBfd
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :min_receive_interval, as: 'minReceiveInterval'
          property :min_transmit_interval, as: 'minTransmitInterval'
          property :mode, as: 'mode'
          property :multiplier, as: 'multiplier'
          property :packet_mode, as: 'packetMode'
          property :session_initialization_mode, as: 'sessionInitializationMode'
          property :slow_timer_interval, as: 'slowTimerInterval'
        end
      end
      
      class RouterInterface
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :ip_range, as: 'ipRange'
          property :linked_interconnect_attachment, as: 'linkedInterconnectAttachment'
          property :linked_vpn_tunnel, as: 'linkedVpnTunnel'
          property :management_type, as: 'managementType'
          property :name, as: 'name'
        end
      end
      
      class RouterList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::Router, decorator: Google::Apis::ComputeAlpha::Router::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::RouterList::Warning, decorator: Google::Apis::ComputeAlpha::RouterList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::RouterList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::RouterList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class RouterNat
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :drain_nat_ips, as: 'drainNatIps'
          property :icmp_idle_timeout_sec, as: 'icmpIdleTimeoutSec'
          property :log_config, as: 'logConfig', class: Google::Apis::ComputeAlpha::RouterNatLogConfig, decorator: Google::Apis::ComputeAlpha::RouterNatLogConfig::Representation
      
          property :min_ports_per_vm, as: 'minPortsPerVm'
          property :name, as: 'name'
          property :nat_ip_allocate_option, as: 'natIpAllocateOption'
          collection :nat_ips, as: 'natIps'
          property :source_subnetwork_ip_ranges_to_nat, as: 'sourceSubnetworkIpRangesToNat'
          collection :subnetworks, as: 'subnetworks', class: Google::Apis::ComputeAlpha::RouterNatSubnetworkToNat, decorator: Google::Apis::ComputeAlpha::RouterNatSubnetworkToNat::Representation
      
          property :tcp_established_idle_timeout_sec, as: 'tcpEstablishedIdleTimeoutSec'
          property :tcp_transitory_idle_timeout_sec, as: 'tcpTransitoryIdleTimeoutSec'
          property :udp_idle_timeout_sec, as: 'udpIdleTimeoutSec'
        end
      end
      
      class RouterNatLogConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :enable, as: 'enable'
          property :filter, as: 'filter'
        end
      end
      
      class RouterNatSubnetworkToNat
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          collection :secondary_ip_range_names, as: 'secondaryIpRangeNames'
          collection :source_ip_ranges_to_nat, as: 'sourceIpRangesToNat'
        end
      end
      
      class RouterStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :best_routes, as: 'bestRoutes', class: Google::Apis::ComputeAlpha::Route, decorator: Google::Apis::ComputeAlpha::Route::Representation
      
          collection :best_routes_for_router, as: 'bestRoutesForRouter', class: Google::Apis::ComputeAlpha::Route, decorator: Google::Apis::ComputeAlpha::Route::Representation
      
          collection :bgp_peer_status, as: 'bgpPeerStatus', class: Google::Apis::ComputeAlpha::RouterStatusBgpPeerStatus, decorator: Google::Apis::ComputeAlpha::RouterStatusBgpPeerStatus::Representation
      
          collection :nat_status, as: 'natStatus', class: Google::Apis::ComputeAlpha::RouterStatusNatStatus, decorator: Google::Apis::ComputeAlpha::RouterStatusNatStatus::Representation
      
          property :network, as: 'network'
        end
      end
      
      class RouterStatusBgpPeerStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :advertised_routes, as: 'advertisedRoutes', class: Google::Apis::ComputeAlpha::Route, decorator: Google::Apis::ComputeAlpha::Route::Representation
      
          property :bfd_status, as: 'bfdStatus', class: Google::Apis::ComputeAlpha::BfdStatus, decorator: Google::Apis::ComputeAlpha::BfdStatus::Representation
      
          property :ip_address, as: 'ipAddress'
          property :linked_vpn_tunnel, as: 'linkedVpnTunnel'
          property :name, as: 'name'
          property :num_learned_routes, as: 'numLearnedRoutes'
          property :peer_ip_address, as: 'peerIpAddress'
          property :state, as: 'state'
          property :status, as: 'status'
          property :uptime, as: 'uptime'
          property :uptime_seconds, as: 'uptimeSeconds'
        end
      end
      
      class RouterStatusNatStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :auto_allocated_nat_ips, as: 'autoAllocatedNatIps'
          collection :drain_auto_allocated_nat_ips, as: 'drainAutoAllocatedNatIps'
          collection :drain_user_allocated_nat_ips, as: 'drainUserAllocatedNatIps'
          property :min_extra_nat_ips_needed, as: 'minExtraNatIpsNeeded'
          property :name, as: 'name'
          property :num_vm_endpoints_with_nat_mappings, as: 'numVmEndpointsWithNatMappings'
          collection :user_allocated_nat_ip_resources, as: 'userAllocatedNatIpResources'
          collection :user_allocated_nat_ips, as: 'userAllocatedNatIps'
        end
      end
      
      class RouterStatusResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :result, as: 'result', class: Google::Apis::ComputeAlpha::RouterStatus, decorator: Google::Apis::ComputeAlpha::RouterStatus::Representation
      
        end
      end
      
      class RoutersPreviewResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :resource, as: 'resource', class: Google::Apis::ComputeAlpha::Router, decorator: Google::Apis::ComputeAlpha::Router::Representation
      
        end
      end
      
      class RoutersScopedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :routers, as: 'routers', class: Google::Apis::ComputeAlpha::Router, decorator: Google::Apis::ComputeAlpha::Router::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::RoutersScopedList::Warning, decorator: Google::Apis::ComputeAlpha::RoutersScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::RoutersScopedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::RoutersScopedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class Rule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :action, as: 'action'
          collection :conditions, as: 'conditions', class: Google::Apis::ComputeAlpha::Condition, decorator: Google::Apis::ComputeAlpha::Condition::Representation
      
          property :description, as: 'description'
          collection :ins, as: 'ins'
          collection :log_configs, as: 'logConfigs', class: Google::Apis::ComputeAlpha::LogConfig, decorator: Google::Apis::ComputeAlpha::LogConfig::Representation
      
          collection :not_ins, as: 'notIns'
          collection :permissions, as: 'permissions'
        end
      end
      
      class SslHealthCheck
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :port, as: 'port'
          property :port_name, as: 'portName'
          property :port_specification, as: 'portSpecification'
          property :proxy_header, as: 'proxyHeader'
          property :request, as: 'request'
          property :response, as: 'response'
        end
      end
      
      class SavedAttachedDisk
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :auto_delete, as: 'autoDelete'
          property :boot, as: 'boot'
          property :device_name, as: 'deviceName'
          property :disk_encryption_key, as: 'diskEncryptionKey', class: Google::Apis::ComputeAlpha::CustomerEncryptionKey, decorator: Google::Apis::ComputeAlpha::CustomerEncryptionKey::Representation
      
          property :disk_size_gb, :numeric_string => true, as: 'diskSizeGb'
          collection :guest_os_features, as: 'guestOsFeatures', class: Google::Apis::ComputeAlpha::GuestOsFeature, decorator: Google::Apis::ComputeAlpha::GuestOsFeature::Representation
      
          property :index, as: 'index'
          property :interface, as: 'interface'
          property :kind, as: 'kind'
          collection :licenses, as: 'licenses'
          property :mode, as: 'mode'
          property :source, as: 'source'
          property :storage_bytes, :numeric_string => true, as: 'storageBytes'
          property :storage_bytes_status, as: 'storageBytesStatus'
          property :type, as: 'type'
        end
      end
      
      class Scheduling
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :automatic_restart, as: 'automaticRestart'
          property :latency_tolerant, as: 'latencyTolerant'
          property :location_hint, as: 'locationHint'
          property :min_node_cpus, as: 'minNodeCpus'
          collection :node_affinities, as: 'nodeAffinities', class: Google::Apis::ComputeAlpha::SchedulingNodeAffinity, decorator: Google::Apis::ComputeAlpha::SchedulingNodeAffinity::Representation
      
          property :on_host_maintenance, as: 'onHostMaintenance'
          property :preemptible, as: 'preemptible'
        end
      end
      
      class SchedulingNodeAffinity
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :key, as: 'key'
          property :operator, as: 'operator'
          collection :values, as: 'values'
        end
      end
      
      class SdsConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :grpc_service_config, as: 'grpcServiceConfig', class: Google::Apis::ComputeAlpha::GrpcServiceConfig, decorator: Google::Apis::ComputeAlpha::GrpcServiceConfig::Representation
      
        end
      end
      
      class SecurityPoliciesListPreconfiguredExpressionSetsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :preconfigured_expression_sets, as: 'preconfiguredExpressionSets', class: Google::Apis::ComputeAlpha::SecurityPoliciesWafConfig, decorator: Google::Apis::ComputeAlpha::SecurityPoliciesWafConfig::Representation
      
        end
      end
      
      class SecurityPoliciesWafConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :waf_rules, as: 'wafRules', class: Google::Apis::ComputeAlpha::PreconfiguredWafSet, decorator: Google::Apis::ComputeAlpha::PreconfiguredWafSet::Representation
      
        end
      end
      
      class SecurityPolicy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :associations, as: 'associations', class: Google::Apis::ComputeAlpha::SecurityPolicyAssociation, decorator: Google::Apis::ComputeAlpha::SecurityPolicyAssociation::Representation
      
          property :cloud_armor_config, as: 'cloudArmorConfig', class: Google::Apis::ComputeAlpha::SecurityPolicyCloudArmorConfig, decorator: Google::Apis::ComputeAlpha::SecurityPolicyCloudArmorConfig::Representation
      
          property :creation_timestamp, as: 'creationTimestamp'
          property :description, as: 'description'
          property :fingerprint, :base64 => true, as: 'fingerprint'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :label_fingerprint, :base64 => true, as: 'labelFingerprint'
          hash :labels, as: 'labels'
          property :name, as: 'name'
          property :rule_tuple_count, as: 'ruleTupleCount'
          collection :rules, as: 'rules', class: Google::Apis::ComputeAlpha::SecurityPolicyRule, decorator: Google::Apis::ComputeAlpha::SecurityPolicyRule::Representation
      
          property :self_link, as: 'selfLink'
          property :self_link_with_id, as: 'selfLinkWithId'
          property :type, as: 'type'
        end
      end
      
      class SecurityPolicyAssociation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :attachment_id, as: 'attachmentId'
          property :name, as: 'name'
          property :security_policy_id, as: 'securityPolicyId'
        end
      end
      
      class SecurityPolicyCloudArmorConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :enable_ml, as: 'enableMl'
        end
      end
      
      class SecurityPolicyList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::SecurityPolicy, decorator: Google::Apis::ComputeAlpha::SecurityPolicy::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::SecurityPolicyList::Warning, decorator: Google::Apis::ComputeAlpha::SecurityPolicyList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::SecurityPolicyList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::SecurityPolicyList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class SecurityPolicyReference
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :security_policy, as: 'securityPolicy'
        end
      end
      
      class SecurityPolicyRule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :action, as: 'action'
          property :description, as: 'description'
          property :direction, as: 'direction'
          property :enable_logging, as: 'enableLogging'
          property :kind, as: 'kind'
          property :match, as: 'match', class: Google::Apis::ComputeAlpha::SecurityPolicyRuleMatcher, decorator: Google::Apis::ComputeAlpha::SecurityPolicyRuleMatcher::Representation
      
          property :preview, as: 'preview'
          property :priority, as: 'priority'
          property :rate_limit_options, as: 'rateLimitOptions', class: Google::Apis::ComputeAlpha::SecurityPolicyRuleRateLimitOptions, decorator: Google::Apis::ComputeAlpha::SecurityPolicyRuleRateLimitOptions::Representation
      
          property :rule_tuple_count, as: 'ruleTupleCount'
          collection :target_resources, as: 'targetResources'
        end
      end
      
      class SecurityPolicyRuleMatcher
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :config, as: 'config', class: Google::Apis::ComputeAlpha::SecurityPolicyRuleMatcherConfig, decorator: Google::Apis::ComputeAlpha::SecurityPolicyRuleMatcherConfig::Representation
      
          property :expr, as: 'expr', class: Google::Apis::ComputeAlpha::Expr, decorator: Google::Apis::ComputeAlpha::Expr::Representation
      
          property :versioned_expr, as: 'versionedExpr'
        end
      end
      
      class SecurityPolicyRuleMatcherConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :dest_ip_ranges, as: 'destIpRanges'
          collection :dest_ports, as: 'destPorts', class: Google::Apis::ComputeAlpha::SecurityPolicyRuleMatcherConfigDestinationPort, decorator: Google::Apis::ComputeAlpha::SecurityPolicyRuleMatcherConfigDestinationPort::Representation
      
          collection :src_ip_ranges, as: 'srcIpRanges'
        end
      end
      
      class SecurityPolicyRuleMatcherConfigDestinationPort
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :ip_protocol, as: 'ipProtocol'
          collection :ports, as: 'ports'
        end
      end
      
      class SecurityPolicyRuleRateLimitOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :block_duration, as: 'blockDuration'
          property :conform_action, as: 'conformAction'
          property :enforce_on_key, as: 'enforceOnKey'
          property :exceed_action, as: 'exceedAction'
          property :threshold_rps, as: 'thresholdRps'
        end
      end
      
      class SecuritySettings
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :authentication_policy, as: 'authenticationPolicy', class: Google::Apis::ComputeAlpha::AuthenticationPolicy, decorator: Google::Apis::ComputeAlpha::AuthenticationPolicy::Representation
      
          property :authorization_config, as: 'authorizationConfig', class: Google::Apis::ComputeAlpha::AuthorizationConfig, decorator: Google::Apis::ComputeAlpha::AuthorizationConfig::Representation
      
          property :client_tls_settings, as: 'clientTlsSettings', class: Google::Apis::ComputeAlpha::ClientTlsSettings, decorator: Google::Apis::ComputeAlpha::ClientTlsSettings::Representation
      
        end
      end
      
      class SerialPortOutput
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :contents, as: 'contents'
          property :kind, as: 'kind'
          property :next, :numeric_string => true, as: 'next'
          property :self_link, as: 'selfLink'
          property :start, :numeric_string => true, as: 'start'
        end
      end
      
      class ServerBinding
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :type, as: 'type'
        end
      end
      
      class ServerTlsSettings
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :proxy_tls_context, as: 'proxyTlsContext', class: Google::Apis::ComputeAlpha::TlsContext, decorator: Google::Apis::ComputeAlpha::TlsContext::Representation
      
          collection :subject_alt_names, as: 'subjectAltNames'
          property :tls_mode, as: 'tlsMode'
        end
      end
      
      class ServiceAccount
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :email, as: 'email'
          collection :scopes, as: 'scopes'
        end
      end
      
      class ShieldedInstanceConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :enable_integrity_monitoring, as: 'enableIntegrityMonitoring'
          property :enable_secure_boot, as: 'enableSecureBoot'
          property :enable_vtpm, as: 'enableVtpm'
        end
      end
      
      class ShieldedInstanceIdentity
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :encryption_key, as: 'encryptionKey', class: Google::Apis::ComputeAlpha::ShieldedInstanceIdentityEntry, decorator: Google::Apis::ComputeAlpha::ShieldedInstanceIdentityEntry::Representation
      
          property :kind, as: 'kind'
          property :signing_key, as: 'signingKey', class: Google::Apis::ComputeAlpha::ShieldedInstanceIdentityEntry, decorator: Google::Apis::ComputeAlpha::ShieldedInstanceIdentityEntry::Representation
      
        end
      end
      
      class ShieldedInstanceIdentityEntry
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :ek_cert, as: 'ekCert'
          property :ek_pub, as: 'ekPub'
        end
      end
      
      class ShieldedInstanceIntegrityPolicy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :update_auto_learn_policy, as: 'updateAutoLearnPolicy'
        end
      end
      
      class ShieldedVmConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :enable_integrity_monitoring, as: 'enableIntegrityMonitoring'
          property :enable_secure_boot, as: 'enableSecureBoot'
          property :enable_vtpm, as: 'enableVtpm'
        end
      end
      
      class ShieldedVmIdentity
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :encryption_key, as: 'encryptionKey', class: Google::Apis::ComputeAlpha::ShieldedVmIdentityEntry, decorator: Google::Apis::ComputeAlpha::ShieldedVmIdentityEntry::Representation
      
          property :kind, as: 'kind'
          property :signing_key, as: 'signingKey', class: Google::Apis::ComputeAlpha::ShieldedVmIdentityEntry, decorator: Google::Apis::ComputeAlpha::ShieldedVmIdentityEntry::Representation
      
        end
      end
      
      class ShieldedVmIdentityEntry
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :ek_cert, as: 'ekCert'
          property :ek_pub, as: 'ekPub'
        end
      end
      
      class ShieldedVmIntegrityPolicy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :update_auto_learn_policy, as: 'updateAutoLearnPolicy'
        end
      end
      
      class SignedUrlKey
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :key_name, as: 'keyName'
          property :key_value, as: 'keyValue'
        end
      end
      
      class Snapshot
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :auto_created, as: 'autoCreated'
          property :creation_timestamp, as: 'creationTimestamp'
          property :description, as: 'description'
          property :disk_size_gb, :numeric_string => true, as: 'diskSizeGb'
          collection :guest_os_features, as: 'guestOsFeatures', class: Google::Apis::ComputeAlpha::GuestOsFeature, decorator: Google::Apis::ComputeAlpha::GuestOsFeature::Representation
      
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :label_fingerprint, :base64 => true, as: 'labelFingerprint'
          hash :labels, as: 'labels'
          collection :license_codes, as: 'licenseCodes'
          collection :licenses, as: 'licenses'
          property :name, as: 'name'
          property :self_link, as: 'selfLink'
          property :self_link_with_id, as: 'selfLinkWithId'
          property :snapshot_encryption_key, as: 'snapshotEncryptionKey', class: Google::Apis::ComputeAlpha::CustomerEncryptionKey, decorator: Google::Apis::ComputeAlpha::CustomerEncryptionKey::Representation
      
          property :source_disk, as: 'sourceDisk'
          property :source_disk_encryption_key, as: 'sourceDiskEncryptionKey', class: Google::Apis::ComputeAlpha::CustomerEncryptionKey, decorator: Google::Apis::ComputeAlpha::CustomerEncryptionKey::Representation
      
          property :source_disk_id, as: 'sourceDiskId'
          property :status, as: 'status'
          property :storage_bytes, :numeric_string => true, as: 'storageBytes'
          property :storage_bytes_status, as: 'storageBytesStatus'
          collection :storage_locations, as: 'storageLocations'
        end
      end
      
      class SnapshotList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::Snapshot, decorator: Google::Apis::ComputeAlpha::Snapshot::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::SnapshotList::Warning, decorator: Google::Apis::ComputeAlpha::SnapshotList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::SnapshotList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::SnapshotList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class SourceDiskEncryptionKey
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :disk_encryption_key, as: 'diskEncryptionKey', class: Google::Apis::ComputeAlpha::CustomerEncryptionKey, decorator: Google::Apis::ComputeAlpha::CustomerEncryptionKey::Representation
      
          property :source_disk, as: 'sourceDisk'
        end
      end
      
      class SourceInstanceParams
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :disk_configs, as: 'diskConfigs', class: Google::Apis::ComputeAlpha::DiskInstantiationConfig, decorator: Google::Apis::ComputeAlpha::DiskInstantiationConfig::Representation
      
        end
      end
      
      class SourceInstanceProperties
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :can_ip_forward, as: 'canIpForward'
          property :deletion_protection, as: 'deletionProtection'
          property :description, as: 'description'
          collection :disks, as: 'disks', class: Google::Apis::ComputeAlpha::SavedAttachedDisk, decorator: Google::Apis::ComputeAlpha::SavedAttachedDisk::Representation
      
          collection :guest_accelerators, as: 'guestAccelerators', class: Google::Apis::ComputeAlpha::AcceleratorConfig, decorator: Google::Apis::ComputeAlpha::AcceleratorConfig::Representation
      
          hash :labels, as: 'labels'
          property :machine_type, as: 'machineType'
          property :metadata, as: 'metadata', class: Google::Apis::ComputeAlpha::Metadata, decorator: Google::Apis::ComputeAlpha::Metadata::Representation
      
          property :min_cpu_platform, as: 'minCpuPlatform'
          collection :network_interfaces, as: 'networkInterfaces', class: Google::Apis::ComputeAlpha::NetworkInterface, decorator: Google::Apis::ComputeAlpha::NetworkInterface::Representation
      
          property :scheduling, as: 'scheduling', class: Google::Apis::ComputeAlpha::Scheduling, decorator: Google::Apis::ComputeAlpha::Scheduling::Representation
      
          collection :service_accounts, as: 'serviceAccounts', class: Google::Apis::ComputeAlpha::ServiceAccount, decorator: Google::Apis::ComputeAlpha::ServiceAccount::Representation
      
          property :tags, as: 'tags', class: Google::Apis::ComputeAlpha::Tags, decorator: Google::Apis::ComputeAlpha::Tags::Representation
      
        end
      end
      
      class SslCertificate
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :certificate, as: 'certificate'
          property :creation_timestamp, as: 'creationTimestamp'
          property :description, as: 'description'
          property :expire_time, as: 'expireTime'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :managed, as: 'managed', class: Google::Apis::ComputeAlpha::SslCertificateManagedSslCertificate, decorator: Google::Apis::ComputeAlpha::SslCertificateManagedSslCertificate::Representation
      
          property :name, as: 'name'
          property :private_key, as: 'privateKey'
          property :region, as: 'region'
          property :self_link, as: 'selfLink'
          property :self_link_with_id, as: 'selfLinkWithId'
          property :self_managed, as: 'selfManaged', class: Google::Apis::ComputeAlpha::SslCertificateSelfManagedSslCertificate, decorator: Google::Apis::ComputeAlpha::SslCertificateSelfManagedSslCertificate::Representation
      
          collection :subject_alternative_names, as: 'subjectAlternativeNames'
          property :type, as: 'type'
        end
      end
      
      class SslCertificateAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeAlpha::SslCertificatesScopedList, decorator: Google::Apis::ComputeAlpha::SslCertificatesScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::SslCertificateAggregatedList::Warning, decorator: Google::Apis::ComputeAlpha::SslCertificateAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::SslCertificateAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::SslCertificateAggregatedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class SslCertificateList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::SslCertificate, decorator: Google::Apis::ComputeAlpha::SslCertificate::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::SslCertificateList::Warning, decorator: Google::Apis::ComputeAlpha::SslCertificateList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::SslCertificateList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::SslCertificateList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class SslCertificateManagedSslCertificate
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :domain_status, as: 'domainStatus'
          collection :domains, as: 'domains'
          property :status, as: 'status'
        end
      end
      
      class SslCertificateSelfManagedSslCertificate
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :certificate, as: 'certificate'
          property :private_key, as: 'privateKey'
        end
      end
      
      class SslCertificatesScopedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :ssl_certificates, as: 'sslCertificates', class: Google::Apis::ComputeAlpha::SslCertificate, decorator: Google::Apis::ComputeAlpha::SslCertificate::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::SslCertificatesScopedList::Warning, decorator: Google::Apis::ComputeAlpha::SslCertificatesScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::SslCertificatesScopedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::SslCertificatesScopedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class SslPoliciesList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::SslPolicy, decorator: Google::Apis::ComputeAlpha::SslPolicy::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::SslPoliciesList::Warning, decorator: Google::Apis::ComputeAlpha::SslPoliciesList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::SslPoliciesList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::SslPoliciesList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class SslPoliciesListAvailableFeaturesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :features, as: 'features'
        end
      end
      
      class SslPolicy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creation_timestamp, as: 'creationTimestamp'
          collection :custom_features, as: 'customFeatures'
          property :description, as: 'description'
          collection :enabled_features, as: 'enabledFeatures'
          property :fingerprint, :base64 => true, as: 'fingerprint'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :min_tls_version, as: 'minTlsVersion'
          property :name, as: 'name'
          property :profile, as: 'profile'
          property :self_link, as: 'selfLink'
          property :self_link_with_id, as: 'selfLinkWithId'
          property :tls_settings, as: 'tlsSettings', class: Google::Apis::ComputeAlpha::ServerTlsSettings, decorator: Google::Apis::ComputeAlpha::ServerTlsSettings::Representation
      
          collection :warnings, as: 'warnings', class: Google::Apis::ComputeAlpha::SslPolicy::Warning, decorator: Google::Apis::ComputeAlpha::SslPolicy::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::SslPolicy::Warning::Datum, decorator: Google::Apis::ComputeAlpha::SslPolicy::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class SslPolicyReference
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :ssl_policy, as: 'sslPolicy'
        end
      end
      
      class StatefulPolicy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :preserved_state, as: 'preservedState', class: Google::Apis::ComputeAlpha::StatefulPolicyPreservedState, decorator: Google::Apis::ComputeAlpha::StatefulPolicyPreservedState::Representation
      
        end
      end
      
      class StatefulPolicyPreservedState
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :disks, as: 'disks', class: Google::Apis::ComputeAlpha::StatefulPolicyPreservedStateDiskDevice, decorator: Google::Apis::ComputeAlpha::StatefulPolicyPreservedStateDiskDevice::Representation
      
        end
      end
      
      class StatefulPolicyPreservedStateDiskDevice
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :auto_delete, as: 'autoDelete'
        end
      end
      
      class Subnetwork
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :aggregation_interval, as: 'aggregationInterval'
          property :allow_subnet_cidr_routes_overlap, as: 'allowSubnetCidrRoutesOverlap'
          property :creation_timestamp, as: 'creationTimestamp'
          property :description, as: 'description'
          property :enable_flow_logs, as: 'enableFlowLogs'
          property :enable_private_v6_access, as: 'enablePrivateV6Access'
          property :fingerprint, :base64 => true, as: 'fingerprint'
          property :flow_sampling, as: 'flowSampling'
          property :gateway_address, as: 'gatewayAddress'
          property :id, :numeric_string => true, as: 'id'
          property :ip_cidr_range, as: 'ipCidrRange'
          property :ipv6_cidr_range, as: 'ipv6CidrRange'
          property :kind, as: 'kind'
          property :log_config, as: 'logConfig', class: Google::Apis::ComputeAlpha::SubnetworkLogConfig, decorator: Google::Apis::ComputeAlpha::SubnetworkLogConfig::Representation
      
          property :metadata, as: 'metadata'
          property :name, as: 'name'
          property :network, as: 'network'
          property :private_ip_google_access, as: 'privateIpGoogleAccess'
          property :private_ipv6_google_access, as: 'privateIpv6GoogleAccess'
          collection :private_ipv6_google_access_service_accounts, as: 'privateIpv6GoogleAccessServiceAccounts'
          property :purpose, as: 'purpose'
          property :range_type, as: 'rangeType'
          property :region, as: 'region'
          property :role, as: 'role'
          collection :secondary_ip_ranges, as: 'secondaryIpRanges', class: Google::Apis::ComputeAlpha::SubnetworkSecondaryRange, decorator: Google::Apis::ComputeAlpha::SubnetworkSecondaryRange::Representation
      
          property :self_link, as: 'selfLink'
          property :self_link_with_id, as: 'selfLinkWithId'
          property :state, as: 'state'
        end
      end
      
      class SubnetworkAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeAlpha::SubnetworksScopedList, decorator: Google::Apis::ComputeAlpha::SubnetworksScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::SubnetworkAggregatedList::Warning, decorator: Google::Apis::ComputeAlpha::SubnetworkAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::SubnetworkAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::SubnetworkAggregatedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class SubnetworkList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::Subnetwork, decorator: Google::Apis::ComputeAlpha::Subnetwork::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::SubnetworkList::Warning, decorator: Google::Apis::ComputeAlpha::SubnetworkList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::SubnetworkList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::SubnetworkList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class SubnetworkLogConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :aggregation_interval, as: 'aggregationInterval'
          property :enable, as: 'enable'
          property :filter_expr, as: 'filterExpr'
          property :flow_sampling, as: 'flowSampling'
          property :metadata, as: 'metadata'
          collection :metadata_fields, as: 'metadataFields'
        end
      end
      
      class SubnetworkSecondaryRange
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :ip_cidr_range, as: 'ipCidrRange'
          property :range_name, as: 'rangeName'
          property :range_type, as: 'rangeType'
        end
      end
      
      class SubnetworksExpandIpCidrRangeRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :ip_cidr_range, as: 'ipCidrRange'
          property :range_type, as: 'rangeType'
        end
      end
      
      class SubnetworksScopedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :subnetworks, as: 'subnetworks', class: Google::Apis::ComputeAlpha::Subnetwork, decorator: Google::Apis::ComputeAlpha::Subnetwork::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::SubnetworksScopedList::Warning, decorator: Google::Apis::ComputeAlpha::SubnetworksScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::SubnetworksScopedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::SubnetworksScopedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class SubnetworksSetPrivateIpGoogleAccessRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :private_ip_google_access, as: 'privateIpGoogleAccess'
        end
      end
      
      class TcpHealthCheck
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :port, as: 'port'
          property :port_name, as: 'portName'
          property :port_specification, as: 'portSpecification'
          property :proxy_header, as: 'proxyHeader'
          property :request, as: 'request'
          property :response, as: 'response'
        end
      end
      
      class Tags
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :fingerprint, :base64 => true, as: 'fingerprint'
          collection :items, as: 'items'
        end
      end
      
      class TargetHttpProxiesScopedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :target_http_proxies, as: 'targetHttpProxies', class: Google::Apis::ComputeAlpha::TargetHttpProxy, decorator: Google::Apis::ComputeAlpha::TargetHttpProxy::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::TargetHttpProxiesScopedList::Warning, decorator: Google::Apis::ComputeAlpha::TargetHttpProxiesScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::TargetHttpProxiesScopedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::TargetHttpProxiesScopedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class TargetHttpProxy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creation_timestamp, as: 'creationTimestamp'
          property :description, as: 'description'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :proxy_bind, as: 'proxyBind'
          property :region, as: 'region'
          property :self_link, as: 'selfLink'
          property :self_link_with_id, as: 'selfLinkWithId'
          property :url_map, as: 'urlMap'
        end
      end
      
      class TargetHttpProxyAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeAlpha::TargetHttpProxiesScopedList, decorator: Google::Apis::ComputeAlpha::TargetHttpProxiesScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::TargetHttpProxyAggregatedList::Warning, decorator: Google::Apis::ComputeAlpha::TargetHttpProxyAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::TargetHttpProxyAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::TargetHttpProxyAggregatedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class TargetHttpProxyList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::TargetHttpProxy, decorator: Google::Apis::ComputeAlpha::TargetHttpProxy::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::TargetHttpProxyList::Warning, decorator: Google::Apis::ComputeAlpha::TargetHttpProxyList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::TargetHttpProxyList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::TargetHttpProxyList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class TargetHttpsProxiesScopedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :target_https_proxies, as: 'targetHttpsProxies', class: Google::Apis::ComputeAlpha::TargetHttpsProxy, decorator: Google::Apis::ComputeAlpha::TargetHttpsProxy::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::TargetHttpsProxiesScopedList::Warning, decorator: Google::Apis::ComputeAlpha::TargetHttpsProxiesScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::TargetHttpsProxiesScopedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::TargetHttpsProxiesScopedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class TargetHttpsProxiesSetQuicOverrideRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :quic_override, as: 'quicOverride'
        end
      end
      
      class TargetHttpsProxiesSetSslCertificatesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :ssl_certificates, as: 'sslCertificates'
        end
      end
      
      class TargetHttpsProxy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creation_timestamp, as: 'creationTimestamp'
          property :description, as: 'description'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :proxy_bind, as: 'proxyBind'
          property :quic_override, as: 'quicOverride'
          property :region, as: 'region'
          property :self_link, as: 'selfLink'
          property :self_link_with_id, as: 'selfLinkWithId'
          collection :ssl_certificates, as: 'sslCertificates'
          property :ssl_policy, as: 'sslPolicy'
          property :url_map, as: 'urlMap'
        end
      end
      
      class TargetHttpsProxyAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeAlpha::TargetHttpsProxiesScopedList, decorator: Google::Apis::ComputeAlpha::TargetHttpsProxiesScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::TargetHttpsProxyAggregatedList::Warning, decorator: Google::Apis::ComputeAlpha::TargetHttpsProxyAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::TargetHttpsProxyAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::TargetHttpsProxyAggregatedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class TargetHttpsProxyList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::TargetHttpsProxy, decorator: Google::Apis::ComputeAlpha::TargetHttpsProxy::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::TargetHttpsProxyList::Warning, decorator: Google::Apis::ComputeAlpha::TargetHttpsProxyList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::TargetHttpsProxyList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::TargetHttpsProxyList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class TargetInstance
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creation_timestamp, as: 'creationTimestamp'
          property :description, as: 'description'
          property :id, :numeric_string => true, as: 'id'
          property :instance, as: 'instance'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :nat_policy, as: 'natPolicy'
          property :self_link, as: 'selfLink'
          property :self_link_with_id, as: 'selfLinkWithId'
          property :zone, as: 'zone'
        end
      end
      
      class TargetInstanceAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeAlpha::TargetInstancesScopedList, decorator: Google::Apis::ComputeAlpha::TargetInstancesScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::TargetInstanceAggregatedList::Warning, decorator: Google::Apis::ComputeAlpha::TargetInstanceAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::TargetInstanceAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::TargetInstanceAggregatedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class TargetInstanceList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::TargetInstance, decorator: Google::Apis::ComputeAlpha::TargetInstance::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::TargetInstanceList::Warning, decorator: Google::Apis::ComputeAlpha::TargetInstanceList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::TargetInstanceList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::TargetInstanceList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class TargetInstancesScopedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :target_instances, as: 'targetInstances', class: Google::Apis::ComputeAlpha::TargetInstance, decorator: Google::Apis::ComputeAlpha::TargetInstance::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::TargetInstancesScopedList::Warning, decorator: Google::Apis::ComputeAlpha::TargetInstancesScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::TargetInstancesScopedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::TargetInstancesScopedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class TargetPool
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :backup_pool, as: 'backupPool'
          property :creation_timestamp, as: 'creationTimestamp'
          property :description, as: 'description'
          property :failover_ratio, as: 'failoverRatio'
          collection :health_checks, as: 'healthChecks'
          property :id, :numeric_string => true, as: 'id'
          collection :instances, as: 'instances'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :region, as: 'region'
          property :self_link, as: 'selfLink'
          property :self_link_with_id, as: 'selfLinkWithId'
          property :session_affinity, as: 'sessionAffinity'
        end
      end
      
      class TargetPoolAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeAlpha::TargetPoolsScopedList, decorator: Google::Apis::ComputeAlpha::TargetPoolsScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::TargetPoolAggregatedList::Warning, decorator: Google::Apis::ComputeAlpha::TargetPoolAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::TargetPoolAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::TargetPoolAggregatedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class TargetPoolInstanceHealth
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :health_status, as: 'healthStatus', class: Google::Apis::ComputeAlpha::HealthStatus, decorator: Google::Apis::ComputeAlpha::HealthStatus::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class TargetPoolList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::TargetPool, decorator: Google::Apis::ComputeAlpha::TargetPool::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::TargetPoolList::Warning, decorator: Google::Apis::ComputeAlpha::TargetPoolList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::TargetPoolList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::TargetPoolList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class TargetPoolsAddHealthCheckRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :health_checks, as: 'healthChecks', class: Google::Apis::ComputeAlpha::HealthCheckReference, decorator: Google::Apis::ComputeAlpha::HealthCheckReference::Representation
      
        end
      end
      
      class TargetPoolsAddInstanceRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :instances, as: 'instances', class: Google::Apis::ComputeAlpha::InstanceReference, decorator: Google::Apis::ComputeAlpha::InstanceReference::Representation
      
        end
      end
      
      class TargetPoolsRemoveHealthCheckRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :health_checks, as: 'healthChecks', class: Google::Apis::ComputeAlpha::HealthCheckReference, decorator: Google::Apis::ComputeAlpha::HealthCheckReference::Representation
      
        end
      end
      
      class TargetPoolsRemoveInstanceRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :instances, as: 'instances', class: Google::Apis::ComputeAlpha::InstanceReference, decorator: Google::Apis::ComputeAlpha::InstanceReference::Representation
      
        end
      end
      
      class TargetPoolsScopedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :target_pools, as: 'targetPools', class: Google::Apis::ComputeAlpha::TargetPool, decorator: Google::Apis::ComputeAlpha::TargetPool::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::TargetPoolsScopedList::Warning, decorator: Google::Apis::ComputeAlpha::TargetPoolsScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::TargetPoolsScopedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::TargetPoolsScopedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class TargetReference
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :target, as: 'target'
        end
      end
      
      class TargetSslProxiesSetBackendServiceRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :service, as: 'service'
        end
      end
      
      class TargetSslProxiesSetProxyHeaderRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :proxy_header, as: 'proxyHeader'
        end
      end
      
      class TargetSslProxiesSetSslCertificatesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :ssl_certificates, as: 'sslCertificates'
        end
      end
      
      class TargetSslProxy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creation_timestamp, as: 'creationTimestamp'
          property :description, as: 'description'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :proxy_header, as: 'proxyHeader'
          property :self_link, as: 'selfLink'
          property :service, as: 'service'
          collection :ssl_certificates, as: 'sslCertificates'
          property :ssl_policy, as: 'sslPolicy'
        end
      end
      
      class TargetSslProxyList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::TargetSslProxy, decorator: Google::Apis::ComputeAlpha::TargetSslProxy::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::TargetSslProxyList::Warning, decorator: Google::Apis::ComputeAlpha::TargetSslProxyList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::TargetSslProxyList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::TargetSslProxyList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class TargetTcpProxiesSetBackendServiceRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :service, as: 'service'
        end
      end
      
      class TargetTcpProxiesSetProxyHeaderRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :proxy_header, as: 'proxyHeader'
        end
      end
      
      class TargetTcpProxy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creation_timestamp, as: 'creationTimestamp'
          property :description, as: 'description'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :proxy_header, as: 'proxyHeader'
          property :self_link, as: 'selfLink'
          property :service, as: 'service'
        end
      end
      
      class TargetTcpProxyList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::TargetTcpProxy, decorator: Google::Apis::ComputeAlpha::TargetTcpProxy::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::TargetTcpProxyList::Warning, decorator: Google::Apis::ComputeAlpha::TargetTcpProxyList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::TargetTcpProxyList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::TargetTcpProxyList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class TargetVpnGateway
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creation_timestamp, as: 'creationTimestamp'
          property :description, as: 'description'
          collection :forwarding_rules, as: 'forwardingRules'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :label_fingerprint, :base64 => true, as: 'labelFingerprint'
          hash :labels, as: 'labels'
          property :name, as: 'name'
          property :network, as: 'network'
          property :region, as: 'region'
          property :self_link, as: 'selfLink'
          property :status, as: 'status'
          collection :tunnels, as: 'tunnels'
        end
      end
      
      class TargetVpnGatewayAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeAlpha::TargetVpnGatewaysScopedList, decorator: Google::Apis::ComputeAlpha::TargetVpnGatewaysScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::TargetVpnGatewayAggregatedList::Warning, decorator: Google::Apis::ComputeAlpha::TargetVpnGatewayAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::TargetVpnGatewayAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::TargetVpnGatewayAggregatedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class TargetVpnGatewayList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::TargetVpnGateway, decorator: Google::Apis::ComputeAlpha::TargetVpnGateway::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::TargetVpnGatewayList::Warning, decorator: Google::Apis::ComputeAlpha::TargetVpnGatewayList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::TargetVpnGatewayList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::TargetVpnGatewayList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class TargetVpnGatewaysScopedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :target_vpn_gateways, as: 'targetVpnGateways', class: Google::Apis::ComputeAlpha::TargetVpnGateway, decorator: Google::Apis::ComputeAlpha::TargetVpnGateway::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::TargetVpnGatewaysScopedList::Warning, decorator: Google::Apis::ComputeAlpha::TargetVpnGatewaysScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::TargetVpnGatewaysScopedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::TargetVpnGatewaysScopedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class TestFailure
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :actual_service, as: 'actualService'
          property :expected_service, as: 'expectedService'
          property :host, as: 'host'
          property :path, as: 'path'
        end
      end
      
      class TestPermissionsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :permissions, as: 'permissions'
        end
      end
      
      class TestPermissionsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :permissions, as: 'permissions'
        end
      end
      
      class TlsCertificateContext
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :certificate_paths, as: 'certificatePaths', class: Google::Apis::ComputeAlpha::TlsCertificatePaths, decorator: Google::Apis::ComputeAlpha::TlsCertificatePaths::Representation
      
          property :certificate_source, as: 'certificateSource'
          property :sds_config, as: 'sdsConfig', class: Google::Apis::ComputeAlpha::SdsConfig, decorator: Google::Apis::ComputeAlpha::SdsConfig::Representation
      
        end
      end
      
      class TlsCertificatePaths
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :certificate_path, as: 'certificatePath'
          property :private_key_path, as: 'privateKeyPath'
        end
      end
      
      class TlsContext
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :certificate_context, as: 'certificateContext', class: Google::Apis::ComputeAlpha::TlsCertificateContext, decorator: Google::Apis::ComputeAlpha::TlsCertificateContext::Representation
      
          property :validation_context, as: 'validationContext', class: Google::Apis::ComputeAlpha::TlsValidationContext, decorator: Google::Apis::ComputeAlpha::TlsValidationContext::Representation
      
        end
      end
      
      class TlsValidationContext
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :certificate_path, as: 'certificatePath'
          property :sds_config, as: 'sdsConfig', class: Google::Apis::ComputeAlpha::SdsConfig, decorator: Google::Apis::ComputeAlpha::SdsConfig::Representation
      
          property :validation_source, as: 'validationSource'
        end
      end
      
      class UdpHealthCheck
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :port, as: 'port'
          property :port_name, as: 'portName'
          property :request, as: 'request'
          property :response, as: 'response'
        end
      end
      
      class UrlMap
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creation_timestamp, as: 'creationTimestamp'
          property :default_route_action, as: 'defaultRouteAction', class: Google::Apis::ComputeAlpha::HttpRouteAction, decorator: Google::Apis::ComputeAlpha::HttpRouteAction::Representation
      
          property :default_service, as: 'defaultService'
          property :default_url_redirect, as: 'defaultUrlRedirect', class: Google::Apis::ComputeAlpha::HttpRedirectAction, decorator: Google::Apis::ComputeAlpha::HttpRedirectAction::Representation
      
          property :description, as: 'description'
          property :fingerprint, :base64 => true, as: 'fingerprint'
          property :header_action, as: 'headerAction', class: Google::Apis::ComputeAlpha::HttpHeaderAction, decorator: Google::Apis::ComputeAlpha::HttpHeaderAction::Representation
      
          collection :host_rules, as: 'hostRules', class: Google::Apis::ComputeAlpha::HostRule, decorator: Google::Apis::ComputeAlpha::HostRule::Representation
      
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          collection :path_matchers, as: 'pathMatchers', class: Google::Apis::ComputeAlpha::PathMatcher, decorator: Google::Apis::ComputeAlpha::PathMatcher::Representation
      
          property :region, as: 'region'
          property :self_link, as: 'selfLink'
          collection :tests, as: 'tests', class: Google::Apis::ComputeAlpha::UrlMapTest, decorator: Google::Apis::ComputeAlpha::UrlMapTest::Representation
      
        end
      end
      
      class UrlMapList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::UrlMap, decorator: Google::Apis::ComputeAlpha::UrlMap::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::UrlMapList::Warning, decorator: Google::Apis::ComputeAlpha::UrlMapList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::UrlMapList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::UrlMapList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class UrlMapReference
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :url_map, as: 'urlMap'
        end
      end
      
      class UrlMapTest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :backend_service_weight, as: 'backendServiceWeight'
          property :description, as: 'description'
          property :expected_url_redirect, as: 'expectedUrlRedirect'
          property :host, as: 'host'
          property :path, as: 'path'
          property :service, as: 'service'
        end
      end
      
      class UrlMapValidationResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :load_errors, as: 'loadErrors'
          property :load_succeeded, as: 'loadSucceeded'
          collection :test_failures, as: 'testFailures', class: Google::Apis::ComputeAlpha::TestFailure, decorator: Google::Apis::ComputeAlpha::TestFailure::Representation
      
          property :test_passed, as: 'testPassed'
        end
      end
      
      class UrlMapsAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeAlpha::UrlMapsScopedList, decorator: Google::Apis::ComputeAlpha::UrlMapsScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::UrlMapsAggregatedList::Warning, decorator: Google::Apis::ComputeAlpha::UrlMapsAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::UrlMapsAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::UrlMapsAggregatedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class UrlMapsScopedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :url_maps, as: 'urlMaps', class: Google::Apis::ComputeAlpha::UrlMap, decorator: Google::Apis::ComputeAlpha::UrlMap::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::UrlMapsScopedList::Warning, decorator: Google::Apis::ComputeAlpha::UrlMapsScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::UrlMapsScopedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::UrlMapsScopedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class UrlMapsValidateRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :resource, as: 'resource', class: Google::Apis::ComputeAlpha::UrlMap, decorator: Google::Apis::ComputeAlpha::UrlMap::Representation
      
        end
      end
      
      class UrlMapsValidateResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :result, as: 'result', class: Google::Apis::ComputeAlpha::UrlMapValidationResult, decorator: Google::Apis::ComputeAlpha::UrlMapValidationResult::Representation
      
        end
      end
      
      class UrlRewrite
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :host_rewrite, as: 'hostRewrite'
          property :path_prefix_rewrite, as: 'pathPrefixRewrite'
        end
      end
      
      class UsableSubnetwork
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :ip_cidr_range, as: 'ipCidrRange'
          property :network, as: 'network'
          collection :secondary_ip_ranges, as: 'secondaryIpRanges', class: Google::Apis::ComputeAlpha::UsableSubnetworkSecondaryRange, decorator: Google::Apis::ComputeAlpha::UsableSubnetworkSecondaryRange::Representation
      
          property :subnetwork, as: 'subnetwork'
        end
      end
      
      class UsableSubnetworkSecondaryRange
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :ip_cidr_range, as: 'ipCidrRange'
          property :range_name, as: 'rangeName'
        end
      end
      
      class UsableSubnetworksAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::UsableSubnetwork, decorator: Google::Apis::ComputeAlpha::UsableSubnetwork::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::UsableSubnetworksAggregatedList::Warning, decorator: Google::Apis::ComputeAlpha::UsableSubnetworksAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::UsableSubnetworksAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::UsableSubnetworksAggregatedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class UsageExportLocation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bucket_name, as: 'bucketName'
          property :report_name_prefix, as: 'reportNamePrefix'
        end
      end
      
      class VmEndpointNatMappings
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :instance_name, as: 'instanceName'
          collection :interface_nat_mappings, as: 'interfaceNatMappings', class: Google::Apis::ComputeAlpha::VmEndpointNatMappingsInterfaceNatMappings, decorator: Google::Apis::ComputeAlpha::VmEndpointNatMappingsInterfaceNatMappings::Representation
      
        end
      end
      
      class VmEndpointNatMappingsInterfaceNatMappings
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :drain_nat_ip_port_ranges, as: 'drainNatIpPortRanges'
          collection :nat_ip_port_ranges, as: 'natIpPortRanges'
          property :num_total_drain_nat_ports, as: 'numTotalDrainNatPorts'
          property :num_total_nat_ports, as: 'numTotalNatPorts'
          property :source_alias_ip_range, as: 'sourceAliasIpRange'
          property :source_virtual_ip, as: 'sourceVirtualIp'
        end
      end
      
      class VmEndpointNatMappingsList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          collection :result, as: 'result', class: Google::Apis::ComputeAlpha::VmEndpointNatMappings, decorator: Google::Apis::ComputeAlpha::VmEndpointNatMappings::Representation
      
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::VmEndpointNatMappingsList::Warning, decorator: Google::Apis::ComputeAlpha::VmEndpointNatMappingsList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::VmEndpointNatMappingsList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::VmEndpointNatMappingsList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class VpnGateway
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creation_timestamp, as: 'creationTimestamp'
          property :description, as: 'description'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :label_fingerprint, :base64 => true, as: 'labelFingerprint'
          hash :labels, as: 'labels'
          property :name, as: 'name'
          property :network, as: 'network'
          property :region, as: 'region'
          property :self_link, as: 'selfLink'
          collection :vpn_interfaces, as: 'vpnInterfaces', class: Google::Apis::ComputeAlpha::VpnGatewayVpnGatewayInterface, decorator: Google::Apis::ComputeAlpha::VpnGatewayVpnGatewayInterface::Representation
      
        end
      end
      
      class VpnGatewayAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeAlpha::VpnGatewaysScopedList, decorator: Google::Apis::ComputeAlpha::VpnGatewaysScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::VpnGatewayAggregatedList::Warning, decorator: Google::Apis::ComputeAlpha::VpnGatewayAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::VpnGatewayAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::VpnGatewayAggregatedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class VpnGatewayList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::VpnGateway, decorator: Google::Apis::ComputeAlpha::VpnGateway::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::VpnGatewayList::Warning, decorator: Google::Apis::ComputeAlpha::VpnGatewayList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::VpnGatewayList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::VpnGatewayList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class VpnGatewayStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :vpn_connections, as: 'vpnConnections', class: Google::Apis::ComputeAlpha::VpnGatewayStatusVpnConnection, decorator: Google::Apis::ComputeAlpha::VpnGatewayStatusVpnConnection::Representation
      
        end
      end
      
      class VpnGatewayStatusHighAvailabilityRequirementState
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :state, as: 'state'
          property :unsatisfied_reason, as: 'unsatisfiedReason'
        end
      end
      
      class VpnGatewayStatusTunnel
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :local_gateway_interface, as: 'localGatewayInterface'
          property :peer_gateway_interface, as: 'peerGatewayInterface'
          property :tunnel_url, as: 'tunnelUrl'
        end
      end
      
      class VpnGatewayStatusVpnConnection
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :peer_external_gateway, as: 'peerExternalGateway'
          property :peer_gcp_gateway, as: 'peerGcpGateway'
          property :state, as: 'state', class: Google::Apis::ComputeAlpha::VpnGatewayStatusHighAvailabilityRequirementState, decorator: Google::Apis::ComputeAlpha::VpnGatewayStatusHighAvailabilityRequirementState::Representation
      
          collection :tunnels, as: 'tunnels', class: Google::Apis::ComputeAlpha::VpnGatewayStatusTunnel, decorator: Google::Apis::ComputeAlpha::VpnGatewayStatusTunnel::Representation
      
        end
      end
      
      class VpnGatewayVpnGatewayInterface
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          property :ip_address, as: 'ipAddress'
        end
      end
      
      class VpnGatewaysGetStatusResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :result, as: 'result', class: Google::Apis::ComputeAlpha::VpnGatewayStatus, decorator: Google::Apis::ComputeAlpha::VpnGatewayStatus::Representation
      
        end
      end
      
      class VpnGatewaysScopedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :vpn_gateways, as: 'vpnGateways', class: Google::Apis::ComputeAlpha::VpnGateway, decorator: Google::Apis::ComputeAlpha::VpnGateway::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::VpnGatewaysScopedList::Warning, decorator: Google::Apis::ComputeAlpha::VpnGatewaysScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::VpnGatewaysScopedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::VpnGatewaysScopedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class VpnTunnel
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creation_timestamp, as: 'creationTimestamp'
          property :description, as: 'description'
          property :detailed_status, as: 'detailedStatus'
          property :id, :numeric_string => true, as: 'id'
          property :ike_version, as: 'ikeVersion'
          property :kind, as: 'kind'
          property :label_fingerprint, :base64 => true, as: 'labelFingerprint'
          hash :labels, as: 'labels'
          collection :local_traffic_selector, as: 'localTrafficSelector'
          property :name, as: 'name'
          property :peer_external_gateway, as: 'peerExternalGateway'
          property :peer_external_gateway_interface, as: 'peerExternalGatewayInterface'
          property :peer_gcp_gateway, as: 'peerGcpGateway'
          property :peer_ip, as: 'peerIp'
          property :region, as: 'region'
          collection :remote_traffic_selector, as: 'remoteTrafficSelector'
          property :router, as: 'router'
          property :self_link, as: 'selfLink'
          property :shared_secret, as: 'sharedSecret'
          property :shared_secret_hash, as: 'sharedSecretHash'
          property :status, as: 'status'
          property :target_vpn_gateway, as: 'targetVpnGateway'
          property :vpn_gateway, as: 'vpnGateway'
          property :vpn_gateway_interface, as: 'vpnGatewayInterface'
        end
      end
      
      class VpnTunnelAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeAlpha::VpnTunnelsScopedList, decorator: Google::Apis::ComputeAlpha::VpnTunnelsScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::VpnTunnelAggregatedList::Warning, decorator: Google::Apis::ComputeAlpha::VpnTunnelAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::VpnTunnelAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::VpnTunnelAggregatedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class VpnTunnelList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::VpnTunnel, decorator: Google::Apis::ComputeAlpha::VpnTunnel::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::VpnTunnelList::Warning, decorator: Google::Apis::ComputeAlpha::VpnTunnelList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::VpnTunnelList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::VpnTunnelList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class VpnTunnelsScopedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :vpn_tunnels, as: 'vpnTunnels', class: Google::Apis::ComputeAlpha::VpnTunnel, decorator: Google::Apis::ComputeAlpha::VpnTunnel::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::VpnTunnelsScopedList::Warning, decorator: Google::Apis::ComputeAlpha::VpnTunnelsScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::VpnTunnelsScopedList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::VpnTunnelsScopedList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class WafExpressionSet
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :aliases, as: 'aliases'
          collection :expressions, as: 'expressions', class: Google::Apis::ComputeAlpha::WafExpressionSetExpression, decorator: Google::Apis::ComputeAlpha::WafExpressionSetExpression::Representation
      
          property :id, as: 'id'
        end
      end
      
      class WafExpressionSetExpression
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
        end
      end
      
      class WeightedBackendService
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :backend_service, as: 'backendService'
          property :header_action, as: 'headerAction', class: Google::Apis::ComputeAlpha::HttpHeaderAction, decorator: Google::Apis::ComputeAlpha::HttpHeaderAction::Representation
      
          property :weight, as: 'weight'
        end
      end
      
      class XpnHostList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::Project, decorator: Google::Apis::ComputeAlpha::Project::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::XpnHostList::Warning, decorator: Google::Apis::ComputeAlpha::XpnHostList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::XpnHostList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::XpnHostList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class XpnResourceId
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          property :type, as: 'type'
        end
      end
      
      class Zone
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :available_cpu_platforms, as: 'availableCpuPlatforms'
          property :creation_timestamp, as: 'creationTimestamp'
          property :deprecated, as: 'deprecated', class: Google::Apis::ComputeAlpha::DeprecationStatus, decorator: Google::Apis::ComputeAlpha::DeprecationStatus::Representation
      
          property :description, as: 'description'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :region, as: 'region'
          property :self_link, as: 'selfLink'
          property :status, as: 'status'
        end
      end
      
      class ZoneList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeAlpha::Zone, decorator: Google::Apis::ComputeAlpha::Zone::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeAlpha::ZoneList::Warning, decorator: Google::Apis::ComputeAlpha::ZoneList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeAlpha::ZoneList::Warning::Datum, decorator: Google::Apis::ComputeAlpha::ZoneList::Warning::Datum::Representation
        
            property :message, as: 'message'
          end
          
          class Datum
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :key, as: 'key'
              property :value, as: 'value'
            end
          end
        end
      end
      
      class ZoneSetLabelsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :label_fingerprint, :base64 => true, as: 'labelFingerprint'
          hash :labels, as: 'labels'
        end
      end
      
      class ZoneSetPolicyRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :bindings, as: 'bindings', class: Google::Apis::ComputeAlpha::Binding, decorator: Google::Apis::ComputeAlpha::Binding::Representation
      
          property :etag, :base64 => true, as: 'etag'
          property :policy, as: 'policy', class: Google::Apis::ComputeAlpha::Policy, decorator: Google::Apis::ComputeAlpha::Policy::Representation
      
        end
      end
    end
  end
end
