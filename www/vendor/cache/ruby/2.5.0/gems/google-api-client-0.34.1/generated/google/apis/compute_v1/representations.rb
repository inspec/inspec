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
    module ComputeV1
      
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
      
      class BackendServiceGroupHealth
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BackendServiceIap
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
      
      class CircuitBreakers
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
      
      class MoveDiskRequest
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
      
      class GlobalSetLabelsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GlobalSetPolicyRequest
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
      
      class HealthCheckReference
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
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
      
      class InstanceGroupManagerStatus
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
      
      class InstanceGroupManagersDeleteInstancesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceGroupManagersListManagedInstancesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceGroupManagersRecreateInstancesRequest
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
      
      class InstanceGroupManagersSetInstanceTemplateRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstanceGroupManagersSetTargetPoolsRequest
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
      
      class MoveInstanceRequest
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
      
      class MachineType
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class ScratchDisk
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
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
      
      class MetadataFilter
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MetadataFilterLabelMatch
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
      
      class OutlierDetection
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
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
      
      class Policy
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
      
      class Quota
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
      
      class RegionInstanceGroupManagersAbandonInstancesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RegionInstanceGroupManagersDeleteInstancesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
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
      
      class Scheduling
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SchedulingNodeAffinity
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SecurityPolicy
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
      
      class SerialPortOutput
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ServerBinding
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
      
      class SourceInstanceParams
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
      
      class AddTargetPoolsHealthCheckRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AddTargetPoolsInstanceRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RemoveTargetPoolsHealthCheckRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RemoveTargetPoolsInstanceRequest
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
      
      class ValidateUrlMapsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ValidateUrlMapsResponse
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
          property :deprecated, as: 'deprecated', class: Google::Apis::ComputeV1::DeprecationStatus, decorator: Google::Apis::ComputeV1::DeprecationStatus::Representation
      
          property :description, as: 'description'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :maximum_cards_per_instance, as: 'maximumCardsPerInstance'
          property :name, as: 'name'
          property :self_link, as: 'selfLink'
          property :zone, as: 'zone'
        end
      end
      
      class AcceleratorTypeAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeV1::AcceleratorTypesScopedList, decorator: Google::Apis::ComputeV1::AcceleratorTypesScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::AcceleratorTypeAggregatedList::Warning, decorator: Google::Apis::ComputeV1::AcceleratorTypeAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::AcceleratorTypeAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeV1::AcceleratorTypeAggregatedList::Warning::Datum::Representation
        
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
          collection :items, as: 'items', class: Google::Apis::ComputeV1::AcceleratorType, decorator: Google::Apis::ComputeV1::AcceleratorType::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::AcceleratorTypeList::Warning, decorator: Google::Apis::ComputeV1::AcceleratorTypeList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::AcceleratorTypeList::Warning::Datum, decorator: Google::Apis::ComputeV1::AcceleratorTypeList::Warning::Datum::Representation
        
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
          collection :accelerator_types, as: 'acceleratorTypes', class: Google::Apis::ComputeV1::AcceleratorType, decorator: Google::Apis::ComputeV1::AcceleratorType::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::AcceleratorTypesScopedList::Warning, decorator: Google::Apis::ComputeV1::AcceleratorTypesScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::AcceleratorTypesScopedList::Warning::Datum, decorator: Google::Apis::ComputeV1::AcceleratorTypesScopedList::Warning::Datum::Representation
        
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
          property :public_ptr_domain_name, as: 'publicPtrDomainName'
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
          property :name, as: 'name'
          property :network, as: 'network'
          property :network_tier, as: 'networkTier'
          property :prefix_length, as: 'prefixLength'
          property :purpose, as: 'purpose'
          property :region, as: 'region'
          property :self_link, as: 'selfLink'
          property :status, as: 'status'
          property :subnetwork, as: 'subnetwork'
          collection :users, as: 'users'
        end
      end
      
      class AddressAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeV1::AddressesScopedList, decorator: Google::Apis::ComputeV1::AddressesScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::AddressAggregatedList::Warning, decorator: Google::Apis::ComputeV1::AddressAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::AddressAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeV1::AddressAggregatedList::Warning::Datum::Representation
        
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
          collection :items, as: 'items', class: Google::Apis::ComputeV1::Address, decorator: Google::Apis::ComputeV1::Address::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::AddressList::Warning, decorator: Google::Apis::ComputeV1::AddressList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::AddressList::Warning::Datum, decorator: Google::Apis::ComputeV1::AddressList::Warning::Datum::Representation
        
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
          collection :addresses, as: 'addresses', class: Google::Apis::ComputeV1::Address, decorator: Google::Apis::ComputeV1::Address::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::AddressesScopedList::Warning, decorator: Google::Apis::ComputeV1::AddressesScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::AddressesScopedList::Warning::Datum, decorator: Google::Apis::ComputeV1::AddressesScopedList::Warning::Datum::Representation
        
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
          collection :guest_accelerators, as: 'guestAccelerators', class: Google::Apis::ComputeV1::AcceleratorConfig, decorator: Google::Apis::ComputeV1::AcceleratorConfig::Representation
      
          collection :local_ssds, as: 'localSsds', class: Google::Apis::ComputeV1::AllocationSpecificSkuAllocationAllocatedInstancePropertiesReservedDisk, decorator: Google::Apis::ComputeV1::AllocationSpecificSkuAllocationAllocatedInstancePropertiesReservedDisk::Representation
      
          property :machine_type, as: 'machineType'
          property :min_cpu_platform, as: 'minCpuPlatform'
        end
      end
      
      class AllocationSpecificSkuReservation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :count, :numeric_string => true, as: 'count'
          property :in_use_count, :numeric_string => true, as: 'inUseCount'
          property :instance_properties, as: 'instanceProperties', class: Google::Apis::ComputeV1::AllocationSpecificSkuAllocationReservedInstanceProperties, decorator: Google::Apis::ComputeV1::AllocationSpecificSkuAllocationReservedInstanceProperties::Representation
      
        end
      end
      
      class AttachedDisk
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :auto_delete, as: 'autoDelete'
          property :boot, as: 'boot'
          property :device_name, as: 'deviceName'
          property :disk_encryption_key, as: 'diskEncryptionKey', class: Google::Apis::ComputeV1::CustomerEncryptionKey, decorator: Google::Apis::ComputeV1::CustomerEncryptionKey::Representation
      
          collection :guest_os_features, as: 'guestOsFeatures', class: Google::Apis::ComputeV1::GuestOsFeature, decorator: Google::Apis::ComputeV1::GuestOsFeature::Representation
      
          property :index, as: 'index'
          property :initialize_params, as: 'initializeParams', class: Google::Apis::ComputeV1::AttachedDiskInitializeParams, decorator: Google::Apis::ComputeV1::AttachedDiskInitializeParams::Representation
      
          property :interface, as: 'interface'
          property :kind, as: 'kind'
          collection :licenses, as: 'licenses'
          property :mode, as: 'mode'
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
          hash :labels, as: 'labels'
          collection :resource_policies, as: 'resourcePolicies'
          property :source_image, as: 'sourceImage'
          property :source_image_encryption_key, as: 'sourceImageEncryptionKey', class: Google::Apis::ComputeV1::CustomerEncryptionKey, decorator: Google::Apis::ComputeV1::CustomerEncryptionKey::Representation
      
          property :source_snapshot, as: 'sourceSnapshot'
          property :source_snapshot_encryption_key, as: 'sourceSnapshotEncryptionKey', class: Google::Apis::ComputeV1::CustomerEncryptionKey, decorator: Google::Apis::ComputeV1::CustomerEncryptionKey::Representation
      
        end
      end
      
      class AuditConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :audit_log_configs, as: 'auditLogConfigs', class: Google::Apis::ComputeV1::AuditLogConfig, decorator: Google::Apis::ComputeV1::AuditLogConfig::Representation
      
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
      
      class AuthorizationLoggingOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :permission_type, as: 'permissionType'
        end
      end
      
      class Autoscaler
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :autoscaling_policy, as: 'autoscalingPolicy', class: Google::Apis::ComputeV1::AutoscalingPolicy, decorator: Google::Apis::ComputeV1::AutoscalingPolicy::Representation
      
          property :creation_timestamp, as: 'creationTimestamp'
          property :description, as: 'description'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :region, as: 'region'
          property :self_link, as: 'selfLink'
          property :status, as: 'status'
          collection :status_details, as: 'statusDetails', class: Google::Apis::ComputeV1::AutoscalerStatusDetails, decorator: Google::Apis::ComputeV1::AutoscalerStatusDetails::Representation
      
          property :target, as: 'target'
          property :zone, as: 'zone'
        end
      end
      
      class AutoscalerAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeV1::AutoscalersScopedList, decorator: Google::Apis::ComputeV1::AutoscalersScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::AutoscalerAggregatedList::Warning, decorator: Google::Apis::ComputeV1::AutoscalerAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::AutoscalerAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeV1::AutoscalerAggregatedList::Warning::Datum::Representation
        
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
          collection :items, as: 'items', class: Google::Apis::ComputeV1::Autoscaler, decorator: Google::Apis::ComputeV1::Autoscaler::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::AutoscalerList::Warning, decorator: Google::Apis::ComputeV1::AutoscalerList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::AutoscalerList::Warning::Datum, decorator: Google::Apis::ComputeV1::AutoscalerList::Warning::Datum::Representation
        
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
          collection :autoscalers, as: 'autoscalers', class: Google::Apis::ComputeV1::Autoscaler, decorator: Google::Apis::ComputeV1::Autoscaler::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::AutoscalersScopedList::Warning, decorator: Google::Apis::ComputeV1::AutoscalersScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::AutoscalersScopedList::Warning::Datum, decorator: Google::Apis::ComputeV1::AutoscalersScopedList::Warning::Datum::Representation
        
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
          property :cpu_utilization, as: 'cpuUtilization', class: Google::Apis::ComputeV1::AutoscalingPolicyCpuUtilization, decorator: Google::Apis::ComputeV1::AutoscalingPolicyCpuUtilization::Representation
      
          collection :custom_metric_utilizations, as: 'customMetricUtilizations', class: Google::Apis::ComputeV1::AutoscalingPolicyCustomMetricUtilization, decorator: Google::Apis::ComputeV1::AutoscalingPolicyCustomMetricUtilization::Representation
      
          property :load_balancing_utilization, as: 'loadBalancingUtilization', class: Google::Apis::ComputeV1::AutoscalingPolicyLoadBalancingUtilization, decorator: Google::Apis::ComputeV1::AutoscalingPolicyLoadBalancingUtilization::Representation
      
          property :max_num_replicas, as: 'maxNumReplicas'
          property :min_num_replicas, as: 'minNumReplicas'
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
          property :metric, as: 'metric'
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
      
      class Backend
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :balancing_mode, as: 'balancingMode'
          property :capacity_scaler, as: 'capacityScaler'
          property :description, as: 'description'
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
          property :cdn_policy, as: 'cdnPolicy', class: Google::Apis::ComputeV1::BackendBucketCdnPolicy, decorator: Google::Apis::ComputeV1::BackendBucketCdnPolicy::Representation
      
          property :creation_timestamp, as: 'creationTimestamp'
          property :description, as: 'description'
          property :enable_cdn, as: 'enableCdn'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :self_link, as: 'selfLink'
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
          collection :items, as: 'items', class: Google::Apis::ComputeV1::BackendBucket, decorator: Google::Apis::ComputeV1::BackendBucket::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::BackendBucketList::Warning, decorator: Google::Apis::ComputeV1::BackendBucketList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::BackendBucketList::Warning::Datum, decorator: Google::Apis::ComputeV1::BackendBucketList::Warning::Datum::Representation
        
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
          collection :backends, as: 'backends', class: Google::Apis::ComputeV1::Backend, decorator: Google::Apis::ComputeV1::Backend::Representation
      
          property :cdn_policy, as: 'cdnPolicy', class: Google::Apis::ComputeV1::BackendServiceCdnPolicy, decorator: Google::Apis::ComputeV1::BackendServiceCdnPolicy::Representation
      
          property :circuit_breakers, as: 'circuitBreakers', class: Google::Apis::ComputeV1::CircuitBreakers, decorator: Google::Apis::ComputeV1::CircuitBreakers::Representation
      
          property :connection_draining, as: 'connectionDraining', class: Google::Apis::ComputeV1::ConnectionDraining, decorator: Google::Apis::ComputeV1::ConnectionDraining::Representation
      
          property :consistent_hash, as: 'consistentHash', class: Google::Apis::ComputeV1::ConsistentHashLoadBalancerSettings, decorator: Google::Apis::ComputeV1::ConsistentHashLoadBalancerSettings::Representation
      
          property :creation_timestamp, as: 'creationTimestamp'
          collection :custom_request_headers, as: 'customRequestHeaders'
          property :description, as: 'description'
          property :enable_cdn, as: 'enableCDN'
          property :fingerprint, :base64 => true, as: 'fingerprint'
          collection :health_checks, as: 'healthChecks'
          property :iap, as: 'iap', class: Google::Apis::ComputeV1::BackendServiceIap, decorator: Google::Apis::ComputeV1::BackendServiceIap::Representation
      
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :load_balancing_scheme, as: 'loadBalancingScheme'
          property :locality_lb_policy, as: 'localityLbPolicy'
          property :name, as: 'name'
          property :outlier_detection, as: 'outlierDetection', class: Google::Apis::ComputeV1::OutlierDetection, decorator: Google::Apis::ComputeV1::OutlierDetection::Representation
      
          property :port, as: 'port'
          property :port_name, as: 'portName'
          property :protocol, as: 'protocol'
          property :region, as: 'region'
          property :security_policy, as: 'securityPolicy'
          property :self_link, as: 'selfLink'
          property :session_affinity, as: 'sessionAffinity'
          property :timeout_sec, as: 'timeoutSec'
        end
      end
      
      class BackendServiceAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeV1::BackendServicesScopedList, decorator: Google::Apis::ComputeV1::BackendServicesScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::BackendServiceAggregatedList::Warning, decorator: Google::Apis::ComputeV1::BackendServiceAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::BackendServiceAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeV1::BackendServiceAggregatedList::Warning::Datum::Representation
        
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
          property :cache_key_policy, as: 'cacheKeyPolicy', class: Google::Apis::ComputeV1::CacheKeyPolicy, decorator: Google::Apis::ComputeV1::CacheKeyPolicy::Representation
      
          property :signed_url_cache_max_age_sec, :numeric_string => true, as: 'signedUrlCacheMaxAgeSec'
          collection :signed_url_key_names, as: 'signedUrlKeyNames'
        end
      end
      
      class BackendServiceGroupHealth
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :health_status, as: 'healthStatus', class: Google::Apis::ComputeV1::HealthStatus, decorator: Google::Apis::ComputeV1::HealthStatus::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class BackendServiceIap
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :enabled, as: 'enabled'
          property :oauth2_client_id, as: 'oauth2ClientId'
          property :oauth2_client_secret, as: 'oauth2ClientSecret'
          property :oauth2_client_secret_sha256, as: 'oauth2ClientSecretSha256'
        end
      end
      
      class BackendServiceList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeV1::BackendService, decorator: Google::Apis::ComputeV1::BackendService::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::BackendServiceList::Warning, decorator: Google::Apis::ComputeV1::BackendServiceList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::BackendServiceList::Warning::Datum, decorator: Google::Apis::ComputeV1::BackendServiceList::Warning::Datum::Representation
        
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
      
      class BackendServiceReference
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :backend_service, as: 'backendService'
        end
      end
      
      class BackendServicesScopedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :backend_services, as: 'backendServices', class: Google::Apis::ComputeV1::BackendService, decorator: Google::Apis::ComputeV1::BackendService::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::BackendServicesScopedList::Warning, decorator: Google::Apis::ComputeV1::BackendServicesScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::BackendServicesScopedList::Warning::Datum, decorator: Google::Apis::ComputeV1::BackendServicesScopedList::Warning::Datum::Representation
        
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
      
      class Binding
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :condition, as: 'condition', class: Google::Apis::ComputeV1::Expr, decorator: Google::Apis::ComputeV1::Expr::Representation
      
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
      
      class CircuitBreakers
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :max_connections, as: 'maxConnections'
          property :max_pending_requests, as: 'maxPendingRequests'
          property :max_requests, as: 'maxRequests'
          property :max_requests_per_connection, as: 'maxRequestsPerConnection'
          property :max_retries, as: 'maxRetries'
        end
      end
      
      class Commitment
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creation_timestamp, as: 'creationTimestamp'
          property :description, as: 'description'
          property :end_timestamp, as: 'endTimestamp'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :plan, as: 'plan'
          property :region, as: 'region'
          collection :reservations, as: 'reservations', class: Google::Apis::ComputeV1::Reservation, decorator: Google::Apis::ComputeV1::Reservation::Representation
      
          collection :resources, as: 'resources', class: Google::Apis::ComputeV1::ResourceCommitment, decorator: Google::Apis::ComputeV1::ResourceCommitment::Representation
      
          property :self_link, as: 'selfLink'
          property :start_timestamp, as: 'startTimestamp'
          property :status, as: 'status'
          property :status_message, as: 'statusMessage'
        end
      end
      
      class CommitmentAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeV1::CommitmentsScopedList, decorator: Google::Apis::ComputeV1::CommitmentsScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::CommitmentAggregatedList::Warning, decorator: Google::Apis::ComputeV1::CommitmentAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::CommitmentAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeV1::CommitmentAggregatedList::Warning::Datum::Representation
        
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
          collection :items, as: 'items', class: Google::Apis::ComputeV1::Commitment, decorator: Google::Apis::ComputeV1::Commitment::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::CommitmentList::Warning, decorator: Google::Apis::ComputeV1::CommitmentList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::CommitmentList::Warning::Datum, decorator: Google::Apis::ComputeV1::CommitmentList::Warning::Datum::Representation
        
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
          collection :commitments, as: 'commitments', class: Google::Apis::ComputeV1::Commitment, decorator: Google::Apis::ComputeV1::Commitment::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::CommitmentsScopedList::Warning, decorator: Google::Apis::ComputeV1::CommitmentsScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::CommitmentsScopedList::Warning::Datum, decorator: Google::Apis::ComputeV1::CommitmentsScopedList::Warning::Datum::Representation
        
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
      
      class ConnectionDraining
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :draining_timeout_sec, as: 'drainingTimeoutSec'
        end
      end
      
      class ConsistentHashLoadBalancerSettings
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :http_cookie, as: 'httpCookie', class: Google::Apis::ComputeV1::ConsistentHashLoadBalancerSettingsHttpCookie, decorator: Google::Apis::ComputeV1::ConsistentHashLoadBalancerSettingsHttpCookie::Representation
      
          property :http_header_name, as: 'httpHeaderName'
          property :minimum_ring_size, :numeric_string => true, as: 'minimumRingSize'
        end
      end
      
      class ConsistentHashLoadBalancerSettingsHttpCookie
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :path, as: 'path'
          property :ttl, as: 'ttl', class: Google::Apis::ComputeV1::Duration, decorator: Google::Apis::ComputeV1::Duration::Representation
      
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
          property :raw_key, as: 'rawKey'
          property :sha256, as: 'sha256'
        end
      end
      
      class CustomerEncryptionKeyProtectedDisk
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :disk_encryption_key, as: 'diskEncryptionKey', class: Google::Apis::ComputeV1::CustomerEncryptionKey, decorator: Google::Apis::ComputeV1::CustomerEncryptionKey::Representation
      
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
          property :disk_encryption_key, as: 'diskEncryptionKey', class: Google::Apis::ComputeV1::CustomerEncryptionKey, decorator: Google::Apis::ComputeV1::CustomerEncryptionKey::Representation
      
          collection :guest_os_features, as: 'guestOsFeatures', class: Google::Apis::ComputeV1::GuestOsFeature, decorator: Google::Apis::ComputeV1::GuestOsFeature::Representation
      
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :label_fingerprint, :base64 => true, as: 'labelFingerprint'
          hash :labels, as: 'labels'
          property :last_attach_timestamp, as: 'lastAttachTimestamp'
          property :last_detach_timestamp, as: 'lastDetachTimestamp'
          collection :license_codes, as: 'licenseCodes'
          collection :licenses, as: 'licenses'
          property :name, as: 'name'
          property :options, as: 'options'
          property :physical_block_size_bytes, :numeric_string => true, as: 'physicalBlockSizeBytes'
          property :region, as: 'region'
          collection :replica_zones, as: 'replicaZones'
          collection :resource_policies, as: 'resourcePolicies'
          property :self_link, as: 'selfLink'
          property :size_gb, :numeric_string => true, as: 'sizeGb'
          property :source_image, as: 'sourceImage'
          property :source_image_encryption_key, as: 'sourceImageEncryptionKey', class: Google::Apis::ComputeV1::CustomerEncryptionKey, decorator: Google::Apis::ComputeV1::CustomerEncryptionKey::Representation
      
          property :source_image_id, as: 'sourceImageId'
          property :source_snapshot, as: 'sourceSnapshot'
          property :source_snapshot_encryption_key, as: 'sourceSnapshotEncryptionKey', class: Google::Apis::ComputeV1::CustomerEncryptionKey, decorator: Google::Apis::ComputeV1::CustomerEncryptionKey::Representation
      
          property :source_snapshot_id, as: 'sourceSnapshotId'
          property :status, as: 'status'
          property :type, as: 'type'
          collection :users, as: 'users'
          property :zone, as: 'zone'
        end
      end
      
      class DiskAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeV1::DisksScopedList, decorator: Google::Apis::ComputeV1::DisksScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::DiskAggregatedList::Warning, decorator: Google::Apis::ComputeV1::DiskAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::DiskAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeV1::DiskAggregatedList::Warning::Datum::Representation
        
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
          collection :items, as: 'items', class: Google::Apis::ComputeV1::Disk, decorator: Google::Apis::ComputeV1::Disk::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::DiskList::Warning, decorator: Google::Apis::ComputeV1::DiskList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::DiskList::Warning::Datum, decorator: Google::Apis::ComputeV1::DiskList::Warning::Datum::Representation
        
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
      
      class MoveDiskRequest
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
          property :deprecated, as: 'deprecated', class: Google::Apis::ComputeV1::DeprecationStatus, decorator: Google::Apis::ComputeV1::DeprecationStatus::Representation
      
          property :description, as: 'description'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :region, as: 'region'
          property :self_link, as: 'selfLink'
          property :valid_disk_size, as: 'validDiskSize'
          property :zone, as: 'zone'
        end
      end
      
      class DiskTypeAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeV1::DiskTypesScopedList, decorator: Google::Apis::ComputeV1::DiskTypesScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::DiskTypeAggregatedList::Warning, decorator: Google::Apis::ComputeV1::DiskTypeAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::DiskTypeAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeV1::DiskTypeAggregatedList::Warning::Datum::Representation
        
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
          collection :items, as: 'items', class: Google::Apis::ComputeV1::DiskType, decorator: Google::Apis::ComputeV1::DiskType::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::DiskTypeList::Warning, decorator: Google::Apis::ComputeV1::DiskTypeList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::DiskTypeList::Warning::Datum, decorator: Google::Apis::ComputeV1::DiskTypeList::Warning::Datum::Representation
        
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
          collection :disk_types, as: 'diskTypes', class: Google::Apis::ComputeV1::DiskType, decorator: Google::Apis::ComputeV1::DiskType::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::DiskTypesScopedList::Warning, decorator: Google::Apis::ComputeV1::DiskTypesScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::DiskTypesScopedList::Warning::Datum, decorator: Google::Apis::ComputeV1::DiskTypesScopedList::Warning::Datum::Representation
        
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
          collection :disks, as: 'disks', class: Google::Apis::ComputeV1::Disk, decorator: Google::Apis::ComputeV1::Disk::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::DisksScopedList::Warning, decorator: Google::Apis::ComputeV1::DisksScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::DisksScopedList::Warning::Datum, decorator: Google::Apis::ComputeV1::DisksScopedList::Warning::Datum::Representation
        
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
          collection :zones, as: 'zones', class: Google::Apis::ComputeV1::DistributionPolicyZoneConfiguration, decorator: Google::Apis::ComputeV1::DistributionPolicyZoneConfiguration::Representation
      
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
          collection :interfaces, as: 'interfaces', class: Google::Apis::ComputeV1::ExternalVpnGatewayInterface, decorator: Google::Apis::ComputeV1::ExternalVpnGatewayInterface::Representation
      
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
          collection :items, as: 'items', class: Google::Apis::ComputeV1::ExternalVpnGateway, decorator: Google::Apis::ComputeV1::ExternalVpnGateway::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::ExternalVpnGatewayList::Warning, decorator: Google::Apis::ComputeV1::ExternalVpnGatewayList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::ExternalVpnGatewayList::Warning::Datum, decorator: Google::Apis::ComputeV1::ExternalVpnGatewayList::Warning::Datum::Representation
        
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
      
      class Firewall
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :allowed, as: 'allowed', class: Google::Apis::ComputeV1::Firewall::Allowed, decorator: Google::Apis::ComputeV1::Firewall::Allowed::Representation
      
          property :creation_timestamp, as: 'creationTimestamp'
          collection :denied, as: 'denied', class: Google::Apis::ComputeV1::Firewall::Denied, decorator: Google::Apis::ComputeV1::Firewall::Denied::Representation
      
          property :description, as: 'description'
          collection :destination_ranges, as: 'destinationRanges'
          property :direction, as: 'direction'
          property :disabled, as: 'disabled'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :log_config, as: 'logConfig', class: Google::Apis::ComputeV1::FirewallLogConfig, decorator: Google::Apis::ComputeV1::FirewallLogConfig::Representation
      
          property :name, as: 'name'
          property :network, as: 'network'
          property :priority, as: 'priority'
          property :self_link, as: 'selfLink'
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
          collection :items, as: 'items', class: Google::Apis::ComputeV1::Firewall, decorator: Google::Apis::ComputeV1::Firewall::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::FirewallList::Warning, decorator: Google::Apis::ComputeV1::FirewallList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::FirewallList::Warning::Datum, decorator: Google::Apis::ComputeV1::FirewallList::Warning::Datum::Representation
        
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
          property :backend_service, as: 'backendService'
          property :creation_timestamp, as: 'creationTimestamp'
          property :description, as: 'description'
          property :id, :numeric_string => true, as: 'id'
          property :ip_version, as: 'ipVersion'
          property :kind, as: 'kind'
          property :load_balancing_scheme, as: 'loadBalancingScheme'
          collection :metadata_filters, as: 'metadataFilters', class: Google::Apis::ComputeV1::MetadataFilter, decorator: Google::Apis::ComputeV1::MetadataFilter::Representation
      
          property :name, as: 'name'
          property :network, as: 'network'
          property :network_tier, as: 'networkTier'
          property :port_range, as: 'portRange'
          collection :ports, as: 'ports'
          property :region, as: 'region'
          property :self_link, as: 'selfLink'
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
          hash :items, as: 'items', class: Google::Apis::ComputeV1::ForwardingRulesScopedList, decorator: Google::Apis::ComputeV1::ForwardingRulesScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::ForwardingRuleAggregatedList::Warning, decorator: Google::Apis::ComputeV1::ForwardingRuleAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::ForwardingRuleAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeV1::ForwardingRuleAggregatedList::Warning::Datum::Representation
        
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
          collection :items, as: 'items', class: Google::Apis::ComputeV1::ForwardingRule, decorator: Google::Apis::ComputeV1::ForwardingRule::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::ForwardingRuleList::Warning, decorator: Google::Apis::ComputeV1::ForwardingRuleList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::ForwardingRuleList::Warning::Datum, decorator: Google::Apis::ComputeV1::ForwardingRuleList::Warning::Datum::Representation
        
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
          collection :forwarding_rules, as: 'forwardingRules', class: Google::Apis::ComputeV1::ForwardingRule, decorator: Google::Apis::ComputeV1::ForwardingRule::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::ForwardingRulesScopedList::Warning, decorator: Google::Apis::ComputeV1::ForwardingRulesScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::ForwardingRulesScopedList::Warning::Datum, decorator: Google::Apis::ComputeV1::ForwardingRulesScopedList::Warning::Datum::Representation
        
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
          collection :bindings, as: 'bindings', class: Google::Apis::ComputeV1::Binding, decorator: Google::Apis::ComputeV1::Binding::Representation
      
          property :etag, :base64 => true, as: 'etag'
          property :policy, as: 'policy', class: Google::Apis::ComputeV1::Policy, decorator: Google::Apis::ComputeV1::Policy::Representation
      
        end
      end
      
      class GuestAttributes
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :query_path, as: 'queryPath'
          property :query_value, as: 'queryValue', class: Google::Apis::ComputeV1::GuestAttributesValue, decorator: Google::Apis::ComputeV1::GuestAttributesValue::Representation
      
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
          collection :items, as: 'items', class: Google::Apis::ComputeV1::GuestAttributesEntry, decorator: Google::Apis::ComputeV1::GuestAttributesEntry::Representation
      
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
          property :http2_health_check, as: 'http2HealthCheck', class: Google::Apis::ComputeV1::Http2HealthCheck, decorator: Google::Apis::ComputeV1::Http2HealthCheck::Representation
      
          property :http_health_check, as: 'httpHealthCheck', class: Google::Apis::ComputeV1::HttpHealthCheck, decorator: Google::Apis::ComputeV1::HttpHealthCheck::Representation
      
          property :https_health_check, as: 'httpsHealthCheck', class: Google::Apis::ComputeV1::HttpsHealthCheck, decorator: Google::Apis::ComputeV1::HttpsHealthCheck::Representation
      
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :region, as: 'region'
          property :self_link, as: 'selfLink'
          property :ssl_health_check, as: 'sslHealthCheck', class: Google::Apis::ComputeV1::SslHealthCheck, decorator: Google::Apis::ComputeV1::SslHealthCheck::Representation
      
          property :tcp_health_check, as: 'tcpHealthCheck', class: Google::Apis::ComputeV1::TcpHealthCheck, decorator: Google::Apis::ComputeV1::TcpHealthCheck::Representation
      
          property :timeout_sec, as: 'timeoutSec'
          property :type, as: 'type'
          property :unhealthy_threshold, as: 'unhealthyThreshold'
        end
      end
      
      class HealthCheckList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeV1::HealthCheck, decorator: Google::Apis::ComputeV1::HealthCheck::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::HealthCheckList::Warning, decorator: Google::Apis::ComputeV1::HealthCheckList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::HealthCheckList::Warning::Datum, decorator: Google::Apis::ComputeV1::HealthCheckList::Warning::Datum::Representation
        
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
      
      class HealthCheckReference
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :health_check, as: 'healthCheck'
        end
      end
      
      class HealthChecksAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeV1::HealthChecksScopedList, decorator: Google::Apis::ComputeV1::HealthChecksScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::HealthChecksAggregatedList::Warning, decorator: Google::Apis::ComputeV1::HealthChecksAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::HealthChecksAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeV1::HealthChecksAggregatedList::Warning::Datum::Representation
        
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
          collection :health_checks, as: 'healthChecks', class: Google::Apis::ComputeV1::HealthCheck, decorator: Google::Apis::ComputeV1::HealthCheck::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::HealthChecksScopedList::Warning, decorator: Google::Apis::ComputeV1::HealthChecksScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::HealthChecksScopedList::Warning::Datum, decorator: Google::Apis::ComputeV1::HealthChecksScopedList::Warning::Datum::Representation
        
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
          property :health_state, as: 'healthState'
          property :instance, as: 'instance'
          property :ip_address, as: 'ipAddress'
          property :port, as: 'port'
        end
      end
      
      class HealthStatusForNetworkEndpoint
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :backend_service, as: 'backendService', class: Google::Apis::ComputeV1::BackendServiceReference, decorator: Google::Apis::ComputeV1::BackendServiceReference::Representation
      
          property :forwarding_rule, as: 'forwardingRule', class: Google::Apis::ComputeV1::ForwardingRuleReference, decorator: Google::Apis::ComputeV1::ForwardingRuleReference::Representation
      
          property :health_check, as: 'healthCheck', class: Google::Apis::ComputeV1::HealthCheckReference, decorator: Google::Apis::ComputeV1::HealthCheckReference::Representation
      
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
          property :fixed_delay, as: 'fixedDelay', class: Google::Apis::ComputeV1::Duration, decorator: Google::Apis::ComputeV1::Duration::Representation
      
          property :percentage, as: 'percentage'
        end
      end
      
      class HttpFaultInjection
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :abort, as: 'abort', class: Google::Apis::ComputeV1::HttpFaultAbort, decorator: Google::Apis::ComputeV1::HttpFaultAbort::Representation
      
          property :delay, as: 'delay', class: Google::Apis::ComputeV1::HttpFaultDelay, decorator: Google::Apis::ComputeV1::HttpFaultDelay::Representation
      
        end
      end
      
      class HttpHeaderAction
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :request_headers_to_add, as: 'requestHeadersToAdd', class: Google::Apis::ComputeV1::HttpHeaderOption, decorator: Google::Apis::ComputeV1::HttpHeaderOption::Representation
      
          collection :request_headers_to_remove, as: 'requestHeadersToRemove'
          collection :response_headers_to_add, as: 'responseHeadersToAdd', class: Google::Apis::ComputeV1::HttpHeaderOption, decorator: Google::Apis::ComputeV1::HttpHeaderOption::Representation
      
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
          property :range_match, as: 'rangeMatch', class: Google::Apis::ComputeV1::Int64RangeMatch, decorator: Google::Apis::ComputeV1::Int64RangeMatch::Representation
      
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
          property :timeout_sec, as: 'timeoutSec'
          property :unhealthy_threshold, as: 'unhealthyThreshold'
        end
      end
      
      class HttpHealthCheckList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeV1::HttpHealthCheck, decorator: Google::Apis::ComputeV1::HttpHealthCheck::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::HttpHealthCheckList::Warning, decorator: Google::Apis::ComputeV1::HttpHealthCheckList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::HttpHealthCheckList::Warning::Datum, decorator: Google::Apis::ComputeV1::HttpHealthCheckList::Warning::Datum::Representation
        
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
          property :per_try_timeout, as: 'perTryTimeout', class: Google::Apis::ComputeV1::Duration, decorator: Google::Apis::ComputeV1::Duration::Representation
      
          collection :retry_conditions, as: 'retryConditions'
        end
      end
      
      class HttpRouteAction
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cors_policy, as: 'corsPolicy', class: Google::Apis::ComputeV1::CorsPolicy, decorator: Google::Apis::ComputeV1::CorsPolicy::Representation
      
          property :fault_injection_policy, as: 'faultInjectionPolicy', class: Google::Apis::ComputeV1::HttpFaultInjection, decorator: Google::Apis::ComputeV1::HttpFaultInjection::Representation
      
          property :request_mirror_policy, as: 'requestMirrorPolicy', class: Google::Apis::ComputeV1::RequestMirrorPolicy, decorator: Google::Apis::ComputeV1::RequestMirrorPolicy::Representation
      
          property :retry_policy, as: 'retryPolicy', class: Google::Apis::ComputeV1::HttpRetryPolicy, decorator: Google::Apis::ComputeV1::HttpRetryPolicy::Representation
      
          property :timeout, as: 'timeout', class: Google::Apis::ComputeV1::Duration, decorator: Google::Apis::ComputeV1::Duration::Representation
      
          property :url_rewrite, as: 'urlRewrite', class: Google::Apis::ComputeV1::UrlRewrite, decorator: Google::Apis::ComputeV1::UrlRewrite::Representation
      
          collection :weighted_backend_services, as: 'weightedBackendServices', class: Google::Apis::ComputeV1::WeightedBackendService, decorator: Google::Apis::ComputeV1::WeightedBackendService::Representation
      
        end
      end
      
      class HttpRouteRule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :header_action, as: 'headerAction', class: Google::Apis::ComputeV1::HttpHeaderAction, decorator: Google::Apis::ComputeV1::HttpHeaderAction::Representation
      
          collection :match_rules, as: 'matchRules', class: Google::Apis::ComputeV1::HttpRouteRuleMatch, decorator: Google::Apis::ComputeV1::HttpRouteRuleMatch::Representation
      
          property :priority, as: 'priority'
          property :route_action, as: 'routeAction', class: Google::Apis::ComputeV1::HttpRouteAction, decorator: Google::Apis::ComputeV1::HttpRouteAction::Representation
      
          property :service, as: 'service'
          property :url_redirect, as: 'urlRedirect', class: Google::Apis::ComputeV1::HttpRedirectAction, decorator: Google::Apis::ComputeV1::HttpRedirectAction::Representation
      
        end
      end
      
      class HttpRouteRuleMatch
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :full_path_match, as: 'fullPathMatch'
          collection :header_matches, as: 'headerMatches', class: Google::Apis::ComputeV1::HttpHeaderMatch, decorator: Google::Apis::ComputeV1::HttpHeaderMatch::Representation
      
          property :ignore_case, as: 'ignoreCase'
          collection :metadata_filters, as: 'metadataFilters', class: Google::Apis::ComputeV1::MetadataFilter, decorator: Google::Apis::ComputeV1::MetadataFilter::Representation
      
          property :prefix_match, as: 'prefixMatch'
          collection :query_parameter_matches, as: 'queryParameterMatches', class: Google::Apis::ComputeV1::HttpQueryParameterMatch, decorator: Google::Apis::ComputeV1::HttpQueryParameterMatch::Representation
      
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
          property :timeout_sec, as: 'timeoutSec'
          property :unhealthy_threshold, as: 'unhealthyThreshold'
        end
      end
      
      class HttpsHealthCheckList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeV1::HttpsHealthCheck, decorator: Google::Apis::ComputeV1::HttpsHealthCheck::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::HttpsHealthCheckList::Warning, decorator: Google::Apis::ComputeV1::HttpsHealthCheckList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::HttpsHealthCheckList::Warning::Datum, decorator: Google::Apis::ComputeV1::HttpsHealthCheckList::Warning::Datum::Representation
        
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
          property :deprecated, as: 'deprecated', class: Google::Apis::ComputeV1::DeprecationStatus, decorator: Google::Apis::ComputeV1::DeprecationStatus::Representation
      
          property :description, as: 'description'
          property :disk_size_gb, :numeric_string => true, as: 'diskSizeGb'
          property :family, as: 'family'
          collection :guest_os_features, as: 'guestOsFeatures', class: Google::Apis::ComputeV1::GuestOsFeature, decorator: Google::Apis::ComputeV1::GuestOsFeature::Representation
      
          property :id, :numeric_string => true, as: 'id'
          property :image_encryption_key, as: 'imageEncryptionKey', class: Google::Apis::ComputeV1::CustomerEncryptionKey, decorator: Google::Apis::ComputeV1::CustomerEncryptionKey::Representation
      
          property :kind, as: 'kind'
          property :label_fingerprint, :base64 => true, as: 'labelFingerprint'
          hash :labels, as: 'labels'
          collection :license_codes, as: 'licenseCodes'
          collection :licenses, as: 'licenses'
          property :name, as: 'name'
          property :raw_disk, as: 'rawDisk', class: Google::Apis::ComputeV1::Image::RawDisk, decorator: Google::Apis::ComputeV1::Image::RawDisk::Representation
      
          property :self_link, as: 'selfLink'
          property :source_disk, as: 'sourceDisk'
          property :source_disk_encryption_key, as: 'sourceDiskEncryptionKey', class: Google::Apis::ComputeV1::CustomerEncryptionKey, decorator: Google::Apis::ComputeV1::CustomerEncryptionKey::Representation
      
          property :source_disk_id, as: 'sourceDiskId'
          property :source_image, as: 'sourceImage'
          property :source_image_encryption_key, as: 'sourceImageEncryptionKey', class: Google::Apis::ComputeV1::CustomerEncryptionKey, decorator: Google::Apis::ComputeV1::CustomerEncryptionKey::Representation
      
          property :source_image_id, as: 'sourceImageId'
          property :source_snapshot, as: 'sourceSnapshot'
          property :source_snapshot_encryption_key, as: 'sourceSnapshotEncryptionKey', class: Google::Apis::ComputeV1::CustomerEncryptionKey, decorator: Google::Apis::ComputeV1::CustomerEncryptionKey::Representation
      
          property :source_snapshot_id, as: 'sourceSnapshotId'
          property :source_type, as: 'sourceType'
          property :status, as: 'status'
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
          collection :items, as: 'items', class: Google::Apis::ComputeV1::Image, decorator: Google::Apis::ComputeV1::Image::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::ImageList::Warning, decorator: Google::Apis::ComputeV1::ImageList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::ImageList::Warning::Datum, decorator: Google::Apis::ComputeV1::ImageList::Warning::Datum::Representation
        
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
      
      class Instance
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :can_ip_forward, as: 'canIpForward'
          property :cpu_platform, as: 'cpuPlatform'
          property :creation_timestamp, as: 'creationTimestamp'
          property :deletion_protection, as: 'deletionProtection'
          property :description, as: 'description'
          collection :disks, as: 'disks', class: Google::Apis::ComputeV1::AttachedDisk, decorator: Google::Apis::ComputeV1::AttachedDisk::Representation
      
          property :display_device, as: 'displayDevice', class: Google::Apis::ComputeV1::DisplayDevice, decorator: Google::Apis::ComputeV1::DisplayDevice::Representation
      
          collection :guest_accelerators, as: 'guestAccelerators', class: Google::Apis::ComputeV1::AcceleratorConfig, decorator: Google::Apis::ComputeV1::AcceleratorConfig::Representation
      
          property :hostname, as: 'hostname'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :label_fingerprint, :base64 => true, as: 'labelFingerprint'
          hash :labels, as: 'labels'
          property :machine_type, as: 'machineType'
          property :metadata, as: 'metadata', class: Google::Apis::ComputeV1::Metadata, decorator: Google::Apis::ComputeV1::Metadata::Representation
      
          property :min_cpu_platform, as: 'minCpuPlatform'
          property :name, as: 'name'
          collection :network_interfaces, as: 'networkInterfaces', class: Google::Apis::ComputeV1::NetworkInterface, decorator: Google::Apis::ComputeV1::NetworkInterface::Representation
      
          property :reservation_affinity, as: 'reservationAffinity', class: Google::Apis::ComputeV1::ReservationAffinity, decorator: Google::Apis::ComputeV1::ReservationAffinity::Representation
      
          property :scheduling, as: 'scheduling', class: Google::Apis::ComputeV1::Scheduling, decorator: Google::Apis::ComputeV1::Scheduling::Representation
      
          property :self_link, as: 'selfLink'
          collection :service_accounts, as: 'serviceAccounts', class: Google::Apis::ComputeV1::ServiceAccount, decorator: Google::Apis::ComputeV1::ServiceAccount::Representation
      
          property :shielded_instance_config, as: 'shieldedInstanceConfig', class: Google::Apis::ComputeV1::ShieldedInstanceConfig, decorator: Google::Apis::ComputeV1::ShieldedInstanceConfig::Representation
      
          property :shielded_instance_integrity_policy, as: 'shieldedInstanceIntegrityPolicy', class: Google::Apis::ComputeV1::ShieldedInstanceIntegrityPolicy, decorator: Google::Apis::ComputeV1::ShieldedInstanceIntegrityPolicy::Representation
      
          property :start_restricted, as: 'startRestricted'
          property :status, as: 'status'
          property :status_message, as: 'statusMessage'
          property :tags, as: 'tags', class: Google::Apis::ComputeV1::Tags, decorator: Google::Apis::ComputeV1::Tags::Representation
      
          property :zone, as: 'zone'
        end
      end
      
      class InstanceAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeV1::InstancesScopedList, decorator: Google::Apis::ComputeV1::InstancesScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::InstanceAggregatedList::Warning, decorator: Google::Apis::ComputeV1::InstanceAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::InstanceAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeV1::InstanceAggregatedList::Warning::Datum::Representation
        
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
          collection :named_ports, as: 'namedPorts', class: Google::Apis::ComputeV1::NamedPort, decorator: Google::Apis::ComputeV1::NamedPort::Representation
      
          property :network, as: 'network'
          property :region, as: 'region'
          property :self_link, as: 'selfLink'
          property :size, as: 'size'
          property :subnetwork, as: 'subnetwork'
          property :zone, as: 'zone'
        end
      end
      
      class InstanceGroupAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeV1::InstanceGroupsScopedList, decorator: Google::Apis::ComputeV1::InstanceGroupsScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::InstanceGroupAggregatedList::Warning, decorator: Google::Apis::ComputeV1::InstanceGroupAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::InstanceGroupAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeV1::InstanceGroupAggregatedList::Warning::Datum::Representation
        
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
          collection :items, as: 'items', class: Google::Apis::ComputeV1::InstanceGroup, decorator: Google::Apis::ComputeV1::InstanceGroup::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::InstanceGroupList::Warning, decorator: Google::Apis::ComputeV1::InstanceGroupList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::InstanceGroupList::Warning::Datum, decorator: Google::Apis::ComputeV1::InstanceGroupList::Warning::Datum::Representation
        
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
          collection :auto_healing_policies, as: 'autoHealingPolicies', class: Google::Apis::ComputeV1::InstanceGroupManagerAutoHealingPolicy, decorator: Google::Apis::ComputeV1::InstanceGroupManagerAutoHealingPolicy::Representation
      
          property :base_instance_name, as: 'baseInstanceName'
          property :creation_timestamp, as: 'creationTimestamp'
          property :current_actions, as: 'currentActions', class: Google::Apis::ComputeV1::InstanceGroupManagerActionsSummary, decorator: Google::Apis::ComputeV1::InstanceGroupManagerActionsSummary::Representation
      
          property :description, as: 'description'
          property :distribution_policy, as: 'distributionPolicy', class: Google::Apis::ComputeV1::DistributionPolicy, decorator: Google::Apis::ComputeV1::DistributionPolicy::Representation
      
          property :fingerprint, :base64 => true, as: 'fingerprint'
          property :id, :numeric_string => true, as: 'id'
          property :instance_group, as: 'instanceGroup'
          property :instance_template, as: 'instanceTemplate'
          property :kind, as: 'kind'
          property :name, as: 'name'
          collection :named_ports, as: 'namedPorts', class: Google::Apis::ComputeV1::NamedPort, decorator: Google::Apis::ComputeV1::NamedPort::Representation
      
          property :region, as: 'region'
          property :self_link, as: 'selfLink'
          property :status, as: 'status', class: Google::Apis::ComputeV1::InstanceGroupManagerStatus, decorator: Google::Apis::ComputeV1::InstanceGroupManagerStatus::Representation
      
          collection :target_pools, as: 'targetPools'
          property :target_size, as: 'targetSize'
          property :update_policy, as: 'updatePolicy', class: Google::Apis::ComputeV1::InstanceGroupManagerUpdatePolicy, decorator: Google::Apis::ComputeV1::InstanceGroupManagerUpdatePolicy::Representation
      
          collection :versions, as: 'versions', class: Google::Apis::ComputeV1::InstanceGroupManagerVersion, decorator: Google::Apis::ComputeV1::InstanceGroupManagerVersion::Representation
      
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
          hash :items, as: 'items', class: Google::Apis::ComputeV1::InstanceGroupManagersScopedList, decorator: Google::Apis::ComputeV1::InstanceGroupManagersScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::InstanceGroupManagerAggregatedList::Warning, decorator: Google::Apis::ComputeV1::InstanceGroupManagerAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::InstanceGroupManagerAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeV1::InstanceGroupManagerAggregatedList::Warning::Datum::Representation
        
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
        end
      end
      
      class InstanceGroupManagerList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeV1::InstanceGroupManager, decorator: Google::Apis::ComputeV1::InstanceGroupManager::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::InstanceGroupManagerList::Warning, decorator: Google::Apis::ComputeV1::InstanceGroupManagerList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::InstanceGroupManagerList::Warning::Datum, decorator: Google::Apis::ComputeV1::InstanceGroupManagerList::Warning::Datum::Representation
        
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
      
      class InstanceGroupManagerStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :is_stable, as: 'isStable'
        end
      end
      
      class InstanceGroupManagerUpdatePolicy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :max_surge, as: 'maxSurge', class: Google::Apis::ComputeV1::FixedOrPercent, decorator: Google::Apis::ComputeV1::FixedOrPercent::Representation
      
          property :max_unavailable, as: 'maxUnavailable', class: Google::Apis::ComputeV1::FixedOrPercent, decorator: Google::Apis::ComputeV1::FixedOrPercent::Representation
      
          property :minimal_action, as: 'minimalAction'
          property :type, as: 'type'
        end
      end
      
      class InstanceGroupManagerVersion
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :instance_template, as: 'instanceTemplate'
          property :name, as: 'name'
          property :target_size, as: 'targetSize', class: Google::Apis::ComputeV1::FixedOrPercent, decorator: Google::Apis::ComputeV1::FixedOrPercent::Representation
      
        end
      end
      
      class InstanceGroupManagersAbandonInstancesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :instances, as: 'instances'
        end
      end
      
      class InstanceGroupManagersDeleteInstancesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :instances, as: 'instances'
        end
      end
      
      class InstanceGroupManagersListManagedInstancesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :managed_instances, as: 'managedInstances', class: Google::Apis::ComputeV1::ManagedInstance, decorator: Google::Apis::ComputeV1::ManagedInstance::Representation
      
        end
      end
      
      class InstanceGroupManagersRecreateInstancesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :instances, as: 'instances'
        end
      end
      
      class InstanceGroupManagersScopedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :instance_group_managers, as: 'instanceGroupManagers', class: Google::Apis::ComputeV1::InstanceGroupManager, decorator: Google::Apis::ComputeV1::InstanceGroupManager::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::InstanceGroupManagersScopedList::Warning, decorator: Google::Apis::ComputeV1::InstanceGroupManagersScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::InstanceGroupManagersScopedList::Warning::Datum, decorator: Google::Apis::ComputeV1::InstanceGroupManagersScopedList::Warning::Datum::Representation
        
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
      
      class InstanceGroupsAddInstancesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :instances, as: 'instances', class: Google::Apis::ComputeV1::InstanceReference, decorator: Google::Apis::ComputeV1::InstanceReference::Representation
      
        end
      end
      
      class InstanceGroupsListInstances
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeV1::InstanceWithNamedPorts, decorator: Google::Apis::ComputeV1::InstanceWithNamedPorts::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::InstanceGroupsListInstances::Warning, decorator: Google::Apis::ComputeV1::InstanceGroupsListInstances::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::InstanceGroupsListInstances::Warning::Datum, decorator: Google::Apis::ComputeV1::InstanceGroupsListInstances::Warning::Datum::Representation
        
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
          collection :instances, as: 'instances', class: Google::Apis::ComputeV1::InstanceReference, decorator: Google::Apis::ComputeV1::InstanceReference::Representation
      
        end
      end
      
      class InstanceGroupsScopedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :instance_groups, as: 'instanceGroups', class: Google::Apis::ComputeV1::InstanceGroup, decorator: Google::Apis::ComputeV1::InstanceGroup::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::InstanceGroupsScopedList::Warning, decorator: Google::Apis::ComputeV1::InstanceGroupsScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::InstanceGroupsScopedList::Warning::Datum, decorator: Google::Apis::ComputeV1::InstanceGroupsScopedList::Warning::Datum::Representation
        
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
          collection :named_ports, as: 'namedPorts', class: Google::Apis::ComputeV1::NamedPort, decorator: Google::Apis::ComputeV1::NamedPort::Representation
      
        end
      end
      
      class InstanceList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeV1::Instance, decorator: Google::Apis::ComputeV1::Instance::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::InstanceList::Warning, decorator: Google::Apis::ComputeV1::InstanceList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::InstanceList::Warning::Datum, decorator: Google::Apis::ComputeV1::InstanceList::Warning::Datum::Representation
        
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
          collection :items, as: 'items', class: Google::Apis::ComputeV1::Reference, decorator: Google::Apis::ComputeV1::Reference::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::InstanceListReferrers::Warning, decorator: Google::Apis::ComputeV1::InstanceListReferrers::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::InstanceListReferrers::Warning::Datum, decorator: Google::Apis::ComputeV1::InstanceListReferrers::Warning::Datum::Representation
        
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
      
      class MoveInstanceRequest
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
          property :description, as: 'description'
          collection :disks, as: 'disks', class: Google::Apis::ComputeV1::AttachedDisk, decorator: Google::Apis::ComputeV1::AttachedDisk::Representation
      
          collection :guest_accelerators, as: 'guestAccelerators', class: Google::Apis::ComputeV1::AcceleratorConfig, decorator: Google::Apis::ComputeV1::AcceleratorConfig::Representation
      
          hash :labels, as: 'labels'
          property :machine_type, as: 'machineType'
          property :metadata, as: 'metadata', class: Google::Apis::ComputeV1::Metadata, decorator: Google::Apis::ComputeV1::Metadata::Representation
      
          property :min_cpu_platform, as: 'minCpuPlatform'
          collection :network_interfaces, as: 'networkInterfaces', class: Google::Apis::ComputeV1::NetworkInterface, decorator: Google::Apis::ComputeV1::NetworkInterface::Representation
      
          property :reservation_affinity, as: 'reservationAffinity', class: Google::Apis::ComputeV1::ReservationAffinity, decorator: Google::Apis::ComputeV1::ReservationAffinity::Representation
      
          property :scheduling, as: 'scheduling', class: Google::Apis::ComputeV1::Scheduling, decorator: Google::Apis::ComputeV1::Scheduling::Representation
      
          collection :service_accounts, as: 'serviceAccounts', class: Google::Apis::ComputeV1::ServiceAccount, decorator: Google::Apis::ComputeV1::ServiceAccount::Representation
      
          property :shielded_instance_config, as: 'shieldedInstanceConfig', class: Google::Apis::ComputeV1::ShieldedInstanceConfig, decorator: Google::Apis::ComputeV1::ShieldedInstanceConfig::Representation
      
          property :tags, as: 'tags', class: Google::Apis::ComputeV1::Tags, decorator: Google::Apis::ComputeV1::Tags::Representation
      
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
          property :properties, as: 'properties', class: Google::Apis::ComputeV1::InstanceProperties, decorator: Google::Apis::ComputeV1::InstanceProperties::Representation
      
          property :self_link, as: 'selfLink'
          property :source_instance, as: 'sourceInstance'
          property :source_instance_params, as: 'sourceInstanceParams', class: Google::Apis::ComputeV1::SourceInstanceParams, decorator: Google::Apis::ComputeV1::SourceInstanceParams::Representation
      
        end
      end
      
      class InstanceTemplateList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeV1::InstanceTemplate, decorator: Google::Apis::ComputeV1::InstanceTemplate::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::InstanceTemplateList::Warning, decorator: Google::Apis::ComputeV1::InstanceTemplateList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::InstanceTemplateList::Warning::Datum, decorator: Google::Apis::ComputeV1::InstanceTemplateList::Warning::Datum::Representation
        
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
          collection :named_ports, as: 'namedPorts', class: Google::Apis::ComputeV1::NamedPort, decorator: Google::Apis::ComputeV1::NamedPort::Representation
      
          property :status, as: 'status'
        end
      end
      
      class InstancesScopedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :instances, as: 'instances', class: Google::Apis::ComputeV1::Instance, decorator: Google::Apis::ComputeV1::Instance::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::InstancesScopedList::Warning, decorator: Google::Apis::ComputeV1::InstancesScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::InstancesScopedList::Warning::Datum, decorator: Google::Apis::ComputeV1::InstancesScopedList::Warning::Datum::Representation
        
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
          collection :guest_accelerators, as: 'guestAccelerators', class: Google::Apis::ComputeV1::AcceleratorConfig, decorator: Google::Apis::ComputeV1::AcceleratorConfig::Representation
      
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
          collection :disks, as: 'disks', class: Google::Apis::ComputeV1::CustomerEncryptionKeyProtectedDisk, decorator: Google::Apis::ComputeV1::CustomerEncryptionKeyProtectedDisk::Representation
      
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
          collection :circuit_infos, as: 'circuitInfos', class: Google::Apis::ComputeV1::InterconnectCircuitInfo, decorator: Google::Apis::ComputeV1::InterconnectCircuitInfo::Representation
      
          property :creation_timestamp, as: 'creationTimestamp'
          property :customer_name, as: 'customerName'
          property :description, as: 'description'
          collection :expected_outages, as: 'expectedOutages', class: Google::Apis::ComputeV1::InterconnectOutageNotification, decorator: Google::Apis::ComputeV1::InterconnectOutageNotification::Representation
      
          property :google_ip_address, as: 'googleIpAddress'
          property :google_reference_id, as: 'googleReferenceId'
          property :id, :numeric_string => true, as: 'id'
          collection :interconnect_attachments, as: 'interconnectAttachments'
          property :interconnect_type, as: 'interconnectType'
          property :kind, as: 'kind'
          property :link_type, as: 'linkType'
          property :location, as: 'location'
          property :name, as: 'name'
          property :noc_contact_email, as: 'nocContactEmail'
          property :operational_status, as: 'operationalStatus'
          property :peer_ip_address, as: 'peerIpAddress'
          property :provisioned_link_count, as: 'provisionedLinkCount'
          property :requested_link_count, as: 'requestedLinkCount'
          property :self_link, as: 'selfLink'
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
          property :name, as: 'name'
          property :operational_status, as: 'operationalStatus'
          property :pairing_key, as: 'pairingKey'
          property :partner_asn, :numeric_string => true, as: 'partnerAsn'
          property :partner_metadata, as: 'partnerMetadata', class: Google::Apis::ComputeV1::InterconnectAttachmentPartnerMetadata, decorator: Google::Apis::ComputeV1::InterconnectAttachmentPartnerMetadata::Representation
      
          property :private_interconnect_info, as: 'privateInterconnectInfo', class: Google::Apis::ComputeV1::InterconnectAttachmentPrivateInfo, decorator: Google::Apis::ComputeV1::InterconnectAttachmentPrivateInfo::Representation
      
          property :region, as: 'region'
          property :router, as: 'router'
          property :self_link, as: 'selfLink'
          property :state, as: 'state'
          property :type, as: 'type'
          property :vlan_tag8021q, as: 'vlanTag8021q'
        end
      end
      
      class InterconnectAttachmentAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeV1::InterconnectAttachmentsScopedList, decorator: Google::Apis::ComputeV1::InterconnectAttachmentsScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::InterconnectAttachmentAggregatedList::Warning, decorator: Google::Apis::ComputeV1::InterconnectAttachmentAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::InterconnectAttachmentAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeV1::InterconnectAttachmentAggregatedList::Warning::Datum::Representation
        
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
          collection :items, as: 'items', class: Google::Apis::ComputeV1::InterconnectAttachment, decorator: Google::Apis::ComputeV1::InterconnectAttachment::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::InterconnectAttachmentList::Warning, decorator: Google::Apis::ComputeV1::InterconnectAttachmentList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::InterconnectAttachmentList::Warning::Datum, decorator: Google::Apis::ComputeV1::InterconnectAttachmentList::Warning::Datum::Representation
        
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
          collection :interconnect_attachments, as: 'interconnectAttachments', class: Google::Apis::ComputeV1::InterconnectAttachment, decorator: Google::Apis::ComputeV1::InterconnectAttachment::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::InterconnectAttachmentsScopedList::Warning, decorator: Google::Apis::ComputeV1::InterconnectAttachmentsScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::InterconnectAttachmentsScopedList::Warning::Datum, decorator: Google::Apis::ComputeV1::InterconnectAttachmentsScopedList::Warning::Datum::Representation
        
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
          collection :arp_caches, as: 'arpCaches', class: Google::Apis::ComputeV1::InterconnectDiagnosticsArpEntry, decorator: Google::Apis::ComputeV1::InterconnectDiagnosticsArpEntry::Representation
      
          collection :links, as: 'links', class: Google::Apis::ComputeV1::InterconnectDiagnosticsLinkStatus, decorator: Google::Apis::ComputeV1::InterconnectDiagnosticsLinkStatus::Representation
      
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
          collection :arp_caches, as: 'arpCaches', class: Google::Apis::ComputeV1::InterconnectDiagnosticsArpEntry, decorator: Google::Apis::ComputeV1::InterconnectDiagnosticsArpEntry::Representation
      
          property :circuit_id, as: 'circuitId'
          property :google_demarc, as: 'googleDemarc'
          property :lacp_status, as: 'lacpStatus', class: Google::Apis::ComputeV1::InterconnectDiagnosticsLinkLacpStatus, decorator: Google::Apis::ComputeV1::InterconnectDiagnosticsLinkLacpStatus::Representation
      
          property :receiving_optical_power, as: 'receivingOpticalPower', class: Google::Apis::ComputeV1::InterconnectDiagnosticsLinkOpticalPower, decorator: Google::Apis::ComputeV1::InterconnectDiagnosticsLinkOpticalPower::Representation
      
          property :transmitting_optical_power, as: 'transmittingOpticalPower', class: Google::Apis::ComputeV1::InterconnectDiagnosticsLinkOpticalPower, decorator: Google::Apis::ComputeV1::InterconnectDiagnosticsLinkOpticalPower::Representation
      
        end
      end
      
      class InterconnectList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeV1::Interconnect, decorator: Google::Apis::ComputeV1::Interconnect::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::InterconnectList::Warning, decorator: Google::Apis::ComputeV1::InterconnectList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::InterconnectList::Warning::Datum, decorator: Google::Apis::ComputeV1::InterconnectList::Warning::Datum::Representation
        
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
          collection :region_infos, as: 'regionInfos', class: Google::Apis::ComputeV1::InterconnectLocationRegionInfo, decorator: Google::Apis::ComputeV1::InterconnectLocationRegionInfo::Representation
      
          property :self_link, as: 'selfLink'
          property :status, as: 'status'
        end
      end
      
      class InterconnectLocationList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeV1::InterconnectLocation, decorator: Google::Apis::ComputeV1::InterconnectLocation::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::InterconnectLocationList::Warning, decorator: Google::Apis::ComputeV1::InterconnectLocationList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::InterconnectLocationList::Warning::Datum, decorator: Google::Apis::ComputeV1::InterconnectLocationList::Warning::Datum::Representation
        
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
          property :result, as: 'result', class: Google::Apis::ComputeV1::InterconnectDiagnostics, decorator: Google::Apis::ComputeV1::InterconnectDiagnostics::Representation
      
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
          property :resource_requirements, as: 'resourceRequirements', class: Google::Apis::ComputeV1::LicenseResourceRequirements, decorator: Google::Apis::ComputeV1::LicenseResourceRequirements::Representation
      
          property :self_link, as: 'selfLink'
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
          collection :license_alias, as: 'licenseAlias', class: Google::Apis::ComputeV1::LicenseCodeLicenseAlias, decorator: Google::Apis::ComputeV1::LicenseCodeLicenseAlias::Representation
      
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
          collection :items, as: 'items', class: Google::Apis::ComputeV1::License, decorator: Google::Apis::ComputeV1::License::Representation
      
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::LicensesListResponse::Warning, decorator: Google::Apis::ComputeV1::LicensesListResponse::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::LicensesListResponse::Warning::Datum, decorator: Google::Apis::ComputeV1::LicensesListResponse::Warning::Datum::Representation
        
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
      
      class LogConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cloud_audit, as: 'cloudAudit', class: Google::Apis::ComputeV1::LogConfigCloudAuditOptions, decorator: Google::Apis::ComputeV1::LogConfigCloudAuditOptions::Representation
      
          property :counter, as: 'counter', class: Google::Apis::ComputeV1::LogConfigCounterOptions, decorator: Google::Apis::ComputeV1::LogConfigCounterOptions::Representation
      
          property :data_access, as: 'dataAccess', class: Google::Apis::ComputeV1::LogConfigDataAccessOptions, decorator: Google::Apis::ComputeV1::LogConfigDataAccessOptions::Representation
      
        end
      end
      
      class LogConfigCloudAuditOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :authorization_logging_options, as: 'authorizationLoggingOptions', class: Google::Apis::ComputeV1::AuthorizationLoggingOptions, decorator: Google::Apis::ComputeV1::AuthorizationLoggingOptions::Representation
      
          property :log_name, as: 'logName'
        end
      end
      
      class LogConfigCounterOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :custom_fields, as: 'customFields', class: Google::Apis::ComputeV1::LogConfigCounterOptionsCustomField, decorator: Google::Apis::ComputeV1::LogConfigCounterOptionsCustomField::Representation
      
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
      
      class MachineType
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creation_timestamp, as: 'creationTimestamp'
          property :deprecated, as: 'deprecated', class: Google::Apis::ComputeV1::DeprecationStatus, decorator: Google::Apis::ComputeV1::DeprecationStatus::Representation
      
          property :description, as: 'description'
          property :guest_cpus, as: 'guestCpus'
          property :id, :numeric_string => true, as: 'id'
          property :image_space_gb, as: 'imageSpaceGb'
          property :is_shared_cpu, as: 'isSharedCpu'
          property :kind, as: 'kind'
          property :maximum_persistent_disks, as: 'maximumPersistentDisks'
          property :maximum_persistent_disks_size_gb, :numeric_string => true, as: 'maximumPersistentDisksSizeGb'
          property :memory_mb, as: 'memoryMb'
          property :name, as: 'name'
          collection :scratch_disks, as: 'scratchDisks', class: Google::Apis::ComputeV1::MachineType::ScratchDisk, decorator: Google::Apis::ComputeV1::MachineType::ScratchDisk::Representation
      
          property :self_link, as: 'selfLink'
          property :zone, as: 'zone'
        end
        
        class ScratchDisk
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :disk_gb, as: 'diskGb'
          end
        end
      end
      
      class MachineTypeAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeV1::MachineTypesScopedList, decorator: Google::Apis::ComputeV1::MachineTypesScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::MachineTypeAggregatedList::Warning, decorator: Google::Apis::ComputeV1::MachineTypeAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::MachineTypeAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeV1::MachineTypeAggregatedList::Warning::Datum::Representation
        
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
          collection :items, as: 'items', class: Google::Apis::ComputeV1::MachineType, decorator: Google::Apis::ComputeV1::MachineType::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::MachineTypeList::Warning, decorator: Google::Apis::ComputeV1::MachineTypeList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::MachineTypeList::Warning::Datum, decorator: Google::Apis::ComputeV1::MachineTypeList::Warning::Datum::Representation
        
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
          collection :machine_types, as: 'machineTypes', class: Google::Apis::ComputeV1::MachineType, decorator: Google::Apis::ComputeV1::MachineType::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::MachineTypesScopedList::Warning, decorator: Google::Apis::ComputeV1::MachineTypesScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::MachineTypesScopedList::Warning::Datum, decorator: Google::Apis::ComputeV1::MachineTypesScopedList::Warning::Datum::Representation
        
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
          property :instance_status, as: 'instanceStatus'
          property :last_attempt, as: 'lastAttempt', class: Google::Apis::ComputeV1::ManagedInstanceLastAttempt, decorator: Google::Apis::ComputeV1::ManagedInstanceLastAttempt::Representation
      
          property :version, as: 'version', class: Google::Apis::ComputeV1::ManagedInstanceVersion, decorator: Google::Apis::ComputeV1::ManagedInstanceVersion::Representation
      
        end
      end
      
      class ManagedInstanceLastAttempt
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :errors, as: 'errors', class: Google::Apis::ComputeV1::ManagedInstanceLastAttempt::Errors, decorator: Google::Apis::ComputeV1::ManagedInstanceLastAttempt::Errors::Representation
      
        end
        
        class Errors
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            collection :errors, as: 'errors', class: Google::Apis::ComputeV1::ManagedInstanceLastAttempt::Errors::Error, decorator: Google::Apis::ComputeV1::ManagedInstanceLastAttempt::Errors::Error::Representation
        
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
          collection :items, as: 'items', class: Google::Apis::ComputeV1::Metadata::Item, decorator: Google::Apis::ComputeV1::Metadata::Item::Representation
      
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
      
      class MetadataFilter
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :filter_labels, as: 'filterLabels', class: Google::Apis::ComputeV1::MetadataFilterLabelMatch, decorator: Google::Apis::ComputeV1::MetadataFilterLabelMatch::Representation
      
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
          property :description, as: 'description'
          property :gateway_i_pv4, as: 'gatewayIPv4'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          collection :peerings, as: 'peerings', class: Google::Apis::ComputeV1::NetworkPeering, decorator: Google::Apis::ComputeV1::NetworkPeering::Representation
      
          property :routing_config, as: 'routingConfig', class: Google::Apis::ComputeV1::NetworkRoutingConfig, decorator: Google::Apis::ComputeV1::NetworkRoutingConfig::Representation
      
          property :self_link, as: 'selfLink'
          collection :subnetworks, as: 'subnetworks'
        end
      end
      
      class NetworkEndpoint
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :instance, as: 'instance'
          property :ip_address, as: 'ipAddress'
          property :port, as: 'port'
        end
      end
      
      class NetworkEndpointGroup
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creation_timestamp, as: 'creationTimestamp'
          property :default_port, as: 'defaultPort'
          property :description, as: 'description'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :network, as: 'network'
          property :network_endpoint_type, as: 'networkEndpointType'
          property :self_link, as: 'selfLink'
          property :size, as: 'size'
          property :subnetwork, as: 'subnetwork'
          property :zone, as: 'zone'
        end
      end
      
      class NetworkEndpointGroupAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeV1::NetworkEndpointGroupsScopedList, decorator: Google::Apis::ComputeV1::NetworkEndpointGroupsScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::NetworkEndpointGroupAggregatedList::Warning, decorator: Google::Apis::ComputeV1::NetworkEndpointGroupAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::NetworkEndpointGroupAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeV1::NetworkEndpointGroupAggregatedList::Warning::Datum::Representation
        
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
      
      class NetworkEndpointGroupList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeV1::NetworkEndpointGroup, decorator: Google::Apis::ComputeV1::NetworkEndpointGroup::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::NetworkEndpointGroupList::Warning, decorator: Google::Apis::ComputeV1::NetworkEndpointGroupList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::NetworkEndpointGroupList::Warning::Datum, decorator: Google::Apis::ComputeV1::NetworkEndpointGroupList::Warning::Datum::Representation
        
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
          collection :network_endpoints, as: 'networkEndpoints', class: Google::Apis::ComputeV1::NetworkEndpoint, decorator: Google::Apis::ComputeV1::NetworkEndpoint::Representation
      
        end
      end
      
      class NetworkEndpointGroupsDetachEndpointsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :network_endpoints, as: 'networkEndpoints', class: Google::Apis::ComputeV1::NetworkEndpoint, decorator: Google::Apis::ComputeV1::NetworkEndpoint::Representation
      
        end
      end
      
      class NetworkEndpointGroupsListEndpointsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :health_status, as: 'healthStatus'
        end
      end
      
      class NetworkEndpointGroupsListNetworkEndpoints
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeV1::NetworkEndpointWithHealthStatus, decorator: Google::Apis::ComputeV1::NetworkEndpointWithHealthStatus::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::NetworkEndpointGroupsListNetworkEndpoints::Warning, decorator: Google::Apis::ComputeV1::NetworkEndpointGroupsListNetworkEndpoints::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::NetworkEndpointGroupsListNetworkEndpoints::Warning::Datum, decorator: Google::Apis::ComputeV1::NetworkEndpointGroupsListNetworkEndpoints::Warning::Datum::Representation
        
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
          collection :network_endpoint_groups, as: 'networkEndpointGroups', class: Google::Apis::ComputeV1::NetworkEndpointGroup, decorator: Google::Apis::ComputeV1::NetworkEndpointGroup::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::NetworkEndpointGroupsScopedList::Warning, decorator: Google::Apis::ComputeV1::NetworkEndpointGroupsScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::NetworkEndpointGroupsScopedList::Warning::Datum, decorator: Google::Apis::ComputeV1::NetworkEndpointGroupsScopedList::Warning::Datum::Representation
        
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
          collection :healths, as: 'healths', class: Google::Apis::ComputeV1::HealthStatusForNetworkEndpoint, decorator: Google::Apis::ComputeV1::HealthStatusForNetworkEndpoint::Representation
      
          property :network_endpoint, as: 'networkEndpoint', class: Google::Apis::ComputeV1::NetworkEndpoint, decorator: Google::Apis::ComputeV1::NetworkEndpoint::Representation
      
        end
      end
      
      class NetworkInterface
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :access_configs, as: 'accessConfigs', class: Google::Apis::ComputeV1::AccessConfig, decorator: Google::Apis::ComputeV1::AccessConfig::Representation
      
          collection :alias_ip_ranges, as: 'aliasIpRanges', class: Google::Apis::ComputeV1::AliasIpRange, decorator: Google::Apis::ComputeV1::AliasIpRange::Representation
      
          property :fingerprint, :base64 => true, as: 'fingerprint'
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
          collection :items, as: 'items', class: Google::Apis::ComputeV1::Network, decorator: Google::Apis::ComputeV1::Network::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::NetworkList::Warning, decorator: Google::Apis::ComputeV1::NetworkList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::NetworkList::Warning::Datum, decorator: Google::Apis::ComputeV1::NetworkList::Warning::Datum::Representation
        
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
          property :auto_create_routes, as: 'autoCreateRoutes'
          property :exchange_subnet_routes, as: 'exchangeSubnetRoutes'
          property :export_custom_routes, as: 'exportCustomRoutes'
          property :import_custom_routes, as: 'importCustomRoutes'
          property :name, as: 'name'
          property :network, as: 'network'
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
          property :name, as: 'name'
          property :network_peering, as: 'networkPeering', class: Google::Apis::ComputeV1::NetworkPeering, decorator: Google::Apis::ComputeV1::NetworkPeering::Representation
      
          property :peer_network, as: 'peerNetwork'
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
          property :network_peering, as: 'networkPeering', class: Google::Apis::ComputeV1::NetworkPeering, decorator: Google::Apis::ComputeV1::NetworkPeering::Representation
      
        end
      end
      
      class NodeGroup
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creation_timestamp, as: 'creationTimestamp'
          property :description, as: 'description'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :node_template, as: 'nodeTemplate'
          property :self_link, as: 'selfLink'
          property :size, as: 'size'
          property :status, as: 'status'
          property :zone, as: 'zone'
        end
      end
      
      class NodeGroupAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeV1::NodeGroupsScopedList, decorator: Google::Apis::ComputeV1::NodeGroupsScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::NodeGroupAggregatedList::Warning, decorator: Google::Apis::ComputeV1::NodeGroupAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::NodeGroupAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeV1::NodeGroupAggregatedList::Warning::Datum::Representation
        
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
      
      class NodeGroupList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeV1::NodeGroup, decorator: Google::Apis::ComputeV1::NodeGroup::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::NodeGroupList::Warning, decorator: Google::Apis::ComputeV1::NodeGroupList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::NodeGroupList::Warning::Datum, decorator: Google::Apis::ComputeV1::NodeGroupList::Warning::Datum::Representation
        
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
          collection :instances, as: 'instances'
          property :name, as: 'name'
          property :node_type, as: 'nodeType'
          property :server_binding, as: 'serverBinding', class: Google::Apis::ComputeV1::ServerBinding, decorator: Google::Apis::ComputeV1::ServerBinding::Representation
      
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
          collection :items, as: 'items', class: Google::Apis::ComputeV1::NodeGroupNode, decorator: Google::Apis::ComputeV1::NodeGroupNode::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::NodeGroupsListNodes::Warning, decorator: Google::Apis::ComputeV1::NodeGroupsListNodes::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::NodeGroupsListNodes::Warning::Datum, decorator: Google::Apis::ComputeV1::NodeGroupsListNodes::Warning::Datum::Representation
        
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
          collection :node_groups, as: 'nodeGroups', class: Google::Apis::ComputeV1::NodeGroup, decorator: Google::Apis::ComputeV1::NodeGroup::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::NodeGroupsScopedList::Warning, decorator: Google::Apis::ComputeV1::NodeGroupsScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::NodeGroupsScopedList::Warning::Datum, decorator: Google::Apis::ComputeV1::NodeGroupsScopedList::Warning::Datum::Representation
        
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
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          hash :node_affinity_labels, as: 'nodeAffinityLabels'
          property :node_type, as: 'nodeType'
          property :node_type_flexibility, as: 'nodeTypeFlexibility', class: Google::Apis::ComputeV1::NodeTemplateNodeTypeFlexibility, decorator: Google::Apis::ComputeV1::NodeTemplateNodeTypeFlexibility::Representation
      
          property :region, as: 'region'
          property :self_link, as: 'selfLink'
          property :server_binding, as: 'serverBinding', class: Google::Apis::ComputeV1::ServerBinding, decorator: Google::Apis::ComputeV1::ServerBinding::Representation
      
          property :status, as: 'status'
          property :status_message, as: 'statusMessage'
        end
      end
      
      class NodeTemplateAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeV1::NodeTemplatesScopedList, decorator: Google::Apis::ComputeV1::NodeTemplatesScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::NodeTemplateAggregatedList::Warning, decorator: Google::Apis::ComputeV1::NodeTemplateAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::NodeTemplateAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeV1::NodeTemplateAggregatedList::Warning::Datum::Representation
        
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
          collection :items, as: 'items', class: Google::Apis::ComputeV1::NodeTemplate, decorator: Google::Apis::ComputeV1::NodeTemplate::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::NodeTemplateList::Warning, decorator: Google::Apis::ComputeV1::NodeTemplateList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::NodeTemplateList::Warning::Datum, decorator: Google::Apis::ComputeV1::NodeTemplateList::Warning::Datum::Representation
        
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
          collection :node_templates, as: 'nodeTemplates', class: Google::Apis::ComputeV1::NodeTemplate, decorator: Google::Apis::ComputeV1::NodeTemplate::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::NodeTemplatesScopedList::Warning, decorator: Google::Apis::ComputeV1::NodeTemplatesScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::NodeTemplatesScopedList::Warning::Datum, decorator: Google::Apis::ComputeV1::NodeTemplatesScopedList::Warning::Datum::Representation
        
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
          property :deprecated, as: 'deprecated', class: Google::Apis::ComputeV1::DeprecationStatus, decorator: Google::Apis::ComputeV1::DeprecationStatus::Representation
      
          property :description, as: 'description'
          property :guest_cpus, as: 'guestCpus'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :local_ssd_gb, as: 'localSsdGb'
          property :memory_mb, as: 'memoryMb'
          property :name, as: 'name'
          property :self_link, as: 'selfLink'
          property :zone, as: 'zone'
        end
      end
      
      class NodeTypeAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeV1::NodeTypesScopedList, decorator: Google::Apis::ComputeV1::NodeTypesScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::NodeTypeAggregatedList::Warning, decorator: Google::Apis::ComputeV1::NodeTypeAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::NodeTypeAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeV1::NodeTypeAggregatedList::Warning::Datum::Representation
        
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
          collection :items, as: 'items', class: Google::Apis::ComputeV1::NodeType, decorator: Google::Apis::ComputeV1::NodeType::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::NodeTypeList::Warning, decorator: Google::Apis::ComputeV1::NodeTypeList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::NodeTypeList::Warning::Datum, decorator: Google::Apis::ComputeV1::NodeTypeList::Warning::Datum::Representation
        
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
          collection :node_types, as: 'nodeTypes', class: Google::Apis::ComputeV1::NodeType, decorator: Google::Apis::ComputeV1::NodeType::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::NodeTypesScopedList::Warning, decorator: Google::Apis::ComputeV1::NodeTypesScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::NodeTypesScopedList::Warning::Datum, decorator: Google::Apis::ComputeV1::NodeTypesScopedList::Warning::Datum::Representation
        
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
          property :error, as: 'error', class: Google::Apis::ComputeV1::Operation::Error, decorator: Google::Apis::ComputeV1::Operation::Error::Representation
      
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
          property :start_time, as: 'startTime'
          property :status, as: 'status'
          property :status_message, as: 'statusMessage'
          property :target_id, :numeric_string => true, as: 'targetId'
          property :target_link, as: 'targetLink'
          property :user, as: 'user'
          collection :warnings, as: 'warnings', class: Google::Apis::ComputeV1::Operation::Warning, decorator: Google::Apis::ComputeV1::Operation::Warning::Representation
      
          property :zone, as: 'zone'
        end
        
        class Error
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            collection :errors, as: 'errors', class: Google::Apis::ComputeV1::Operation::Error::Error, decorator: Google::Apis::ComputeV1::Operation::Error::Error::Representation
        
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
            collection :data, as: 'data', class: Google::Apis::ComputeV1::Operation::Warning::Datum, decorator: Google::Apis::ComputeV1::Operation::Warning::Datum::Representation
        
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
          hash :items, as: 'items', class: Google::Apis::ComputeV1::OperationsScopedList, decorator: Google::Apis::ComputeV1::OperationsScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::OperationAggregatedList::Warning, decorator: Google::Apis::ComputeV1::OperationAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::OperationAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeV1::OperationAggregatedList::Warning::Datum::Representation
        
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
          collection :items, as: 'items', class: Google::Apis::ComputeV1::Operation, decorator: Google::Apis::ComputeV1::Operation::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::OperationList::Warning, decorator: Google::Apis::ComputeV1::OperationList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::OperationList::Warning::Datum, decorator: Google::Apis::ComputeV1::OperationList::Warning::Datum::Representation
        
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
          collection :operations, as: 'operations', class: Google::Apis::ComputeV1::Operation, decorator: Google::Apis::ComputeV1::Operation::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::OperationsScopedList::Warning, decorator: Google::Apis::ComputeV1::OperationsScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::OperationsScopedList::Warning::Datum, decorator: Google::Apis::ComputeV1::OperationsScopedList::Warning::Datum::Representation
        
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
      
      class OutlierDetection
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :base_ejection_time, as: 'baseEjectionTime', class: Google::Apis::ComputeV1::Duration, decorator: Google::Apis::ComputeV1::Duration::Representation
      
          property :consecutive_errors, as: 'consecutiveErrors'
          property :consecutive_gateway_failure, as: 'consecutiveGatewayFailure'
          property :enforcing_consecutive_errors, as: 'enforcingConsecutiveErrors'
          property :enforcing_consecutive_gateway_failure, as: 'enforcingConsecutiveGatewayFailure'
          property :enforcing_success_rate, as: 'enforcingSuccessRate'
          property :interval, as: 'interval', class: Google::Apis::ComputeV1::Duration, decorator: Google::Apis::ComputeV1::Duration::Representation
      
          property :max_ejection_percent, as: 'maxEjectionPercent'
          property :success_rate_minimum_hosts, as: 'successRateMinimumHosts'
          property :success_rate_request_volume, as: 'successRateRequestVolume'
          property :success_rate_stdev_factor, as: 'successRateStdevFactor'
        end
      end
      
      class PathMatcher
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :default_route_action, as: 'defaultRouteAction', class: Google::Apis::ComputeV1::HttpRouteAction, decorator: Google::Apis::ComputeV1::HttpRouteAction::Representation
      
          property :default_service, as: 'defaultService'
          property :default_url_redirect, as: 'defaultUrlRedirect', class: Google::Apis::ComputeV1::HttpRedirectAction, decorator: Google::Apis::ComputeV1::HttpRedirectAction::Representation
      
          property :description, as: 'description'
          property :header_action, as: 'headerAction', class: Google::Apis::ComputeV1::HttpHeaderAction, decorator: Google::Apis::ComputeV1::HttpHeaderAction::Representation
      
          property :name, as: 'name'
          collection :path_rules, as: 'pathRules', class: Google::Apis::ComputeV1::PathRule, decorator: Google::Apis::ComputeV1::PathRule::Representation
      
          collection :route_rules, as: 'routeRules', class: Google::Apis::ComputeV1::HttpRouteRule, decorator: Google::Apis::ComputeV1::HttpRouteRule::Representation
      
        end
      end
      
      class PathRule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :paths, as: 'paths'
          property :route_action, as: 'routeAction', class: Google::Apis::ComputeV1::HttpRouteAction, decorator: Google::Apis::ComputeV1::HttpRouteAction::Representation
      
          property :service, as: 'service'
          property :url_redirect, as: 'urlRedirect', class: Google::Apis::ComputeV1::HttpRedirectAction, decorator: Google::Apis::ComputeV1::HttpRedirectAction::Representation
      
        end
      end
      
      class Policy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :audit_configs, as: 'auditConfigs', class: Google::Apis::ComputeV1::AuditConfig, decorator: Google::Apis::ComputeV1::AuditConfig::Representation
      
          collection :bindings, as: 'bindings', class: Google::Apis::ComputeV1::Binding, decorator: Google::Apis::ComputeV1::Binding::Representation
      
          property :etag, :base64 => true, as: 'etag'
          property :iam_owned, as: 'iamOwned'
          collection :rules, as: 'rules', class: Google::Apis::ComputeV1::Rule, decorator: Google::Apis::ComputeV1::Rule::Representation
      
          property :version, as: 'version'
        end
      end
      
      class Project
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :common_instance_metadata, as: 'commonInstanceMetadata', class: Google::Apis::ComputeV1::Metadata, decorator: Google::Apis::ComputeV1::Metadata::Representation
      
          property :creation_timestamp, as: 'creationTimestamp'
          property :default_network_tier, as: 'defaultNetworkTier'
          property :default_service_account, as: 'defaultServiceAccount'
          property :description, as: 'description'
          collection :enabled_features, as: 'enabledFeatures'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          collection :quotas, as: 'quotas', class: Google::Apis::ComputeV1::Quota, decorator: Google::Apis::ComputeV1::Quota::Representation
      
          property :self_link, as: 'selfLink'
          property :usage_export_location, as: 'usageExportLocation', class: Google::Apis::ComputeV1::UsageExportLocation, decorator: Google::Apis::ComputeV1::UsageExportLocation::Representation
      
          property :xpn_project_status, as: 'xpnProjectStatus'
        end
      end
      
      class ProjectsDisableXpnResourceRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :xpn_resource, as: 'xpnResource', class: Google::Apis::ComputeV1::XpnResourceId, decorator: Google::Apis::ComputeV1::XpnResourceId::Representation
      
        end
      end
      
      class ProjectsEnableXpnResourceRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :xpn_resource, as: 'xpnResource', class: Google::Apis::ComputeV1::XpnResourceId, decorator: Google::Apis::ComputeV1::XpnResourceId::Representation
      
        end
      end
      
      class ProjectsGetXpnResources
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          collection :resources, as: 'resources', class: Google::Apis::ComputeV1::XpnResourceId, decorator: Google::Apis::ComputeV1::XpnResourceId::Representation
      
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
      
      class Quota
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :limit, as: 'limit'
          property :metric, as: 'metric'
          property :owner, as: 'owner'
          property :usage, as: 'usage'
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
          property :deprecated, as: 'deprecated', class: Google::Apis::ComputeV1::DeprecationStatus, decorator: Google::Apis::ComputeV1::DeprecationStatus::Representation
      
          property :description, as: 'description'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          collection :quotas, as: 'quotas', class: Google::Apis::ComputeV1::Quota, decorator: Google::Apis::ComputeV1::Quota::Representation
      
          property :self_link, as: 'selfLink'
          property :status, as: 'status'
          collection :zones, as: 'zones'
        end
      end
      
      class RegionAutoscalerList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeV1::Autoscaler, decorator: Google::Apis::ComputeV1::Autoscaler::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::RegionAutoscalerList::Warning, decorator: Google::Apis::ComputeV1::RegionAutoscalerList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::RegionAutoscalerList::Warning::Datum, decorator: Google::Apis::ComputeV1::RegionAutoscalerList::Warning::Datum::Representation
        
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
      
      class RegionDiskTypeList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeV1::DiskType, decorator: Google::Apis::ComputeV1::DiskType::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::RegionDiskTypeList::Warning, decorator: Google::Apis::ComputeV1::RegionDiskTypeList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::RegionDiskTypeList::Warning::Datum, decorator: Google::Apis::ComputeV1::RegionDiskTypeList::Warning::Datum::Representation
        
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
          collection :items, as: 'items', class: Google::Apis::ComputeV1::InstanceGroup, decorator: Google::Apis::ComputeV1::InstanceGroup::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::RegionInstanceGroupList::Warning, decorator: Google::Apis::ComputeV1::RegionInstanceGroupList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::RegionInstanceGroupList::Warning::Datum, decorator: Google::Apis::ComputeV1::RegionInstanceGroupList::Warning::Datum::Representation
        
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
      
      class RegionInstanceGroupManagerList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeV1::InstanceGroupManager, decorator: Google::Apis::ComputeV1::InstanceGroupManager::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::RegionInstanceGroupManagerList::Warning, decorator: Google::Apis::ComputeV1::RegionInstanceGroupManagerList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::RegionInstanceGroupManagerList::Warning::Datum, decorator: Google::Apis::ComputeV1::RegionInstanceGroupManagerList::Warning::Datum::Representation
        
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
      
      class RegionInstanceGroupManagersAbandonInstancesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :instances, as: 'instances'
        end
      end
      
      class RegionInstanceGroupManagersDeleteInstancesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :instances, as: 'instances'
        end
      end
      
      class RegionInstanceGroupManagersListInstancesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :managed_instances, as: 'managedInstances', class: Google::Apis::ComputeV1::ManagedInstance, decorator: Google::Apis::ComputeV1::ManagedInstance::Representation
      
        end
      end
      
      class RegionInstanceGroupManagersRecreateRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :instances, as: 'instances'
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
          collection :items, as: 'items', class: Google::Apis::ComputeV1::InstanceWithNamedPorts, decorator: Google::Apis::ComputeV1::InstanceWithNamedPorts::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::RegionInstanceGroupsListInstances::Warning, decorator: Google::Apis::ComputeV1::RegionInstanceGroupsListInstances::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::RegionInstanceGroupsListInstances::Warning::Datum, decorator: Google::Apis::ComputeV1::RegionInstanceGroupsListInstances::Warning::Datum::Representation
        
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
          collection :named_ports, as: 'namedPorts', class: Google::Apis::ComputeV1::NamedPort, decorator: Google::Apis::ComputeV1::NamedPort::Representation
      
        end
      end
      
      class RegionList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeV1::Region, decorator: Google::Apis::ComputeV1::Region::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::RegionList::Warning, decorator: Google::Apis::ComputeV1::RegionList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::RegionList::Warning::Datum, decorator: Google::Apis::ComputeV1::RegionList::Warning::Datum::Representation
        
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
          collection :bindings, as: 'bindings', class: Google::Apis::ComputeV1::Binding, decorator: Google::Apis::ComputeV1::Binding::Representation
      
          property :etag, :base64 => true, as: 'etag'
          property :policy, as: 'policy', class: Google::Apis::ComputeV1::Policy, decorator: Google::Apis::ComputeV1::Policy::Representation
      
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
          property :resource, as: 'resource', class: Google::Apis::ComputeV1::UrlMap, decorator: Google::Apis::ComputeV1::UrlMap::Representation
      
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
          property :specific_reservation, as: 'specificReservation', class: Google::Apis::ComputeV1::AllocationSpecificSkuReservation, decorator: Google::Apis::ComputeV1::AllocationSpecificSkuReservation::Representation
      
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
          hash :items, as: 'items', class: Google::Apis::ComputeV1::ReservationsScopedList, decorator: Google::Apis::ComputeV1::ReservationsScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::ReservationAggregatedList::Warning, decorator: Google::Apis::ComputeV1::ReservationAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::ReservationAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeV1::ReservationAggregatedList::Warning::Datum::Representation
        
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
          collection :items, as: 'items', class: Google::Apis::ComputeV1::Reservation, decorator: Google::Apis::ComputeV1::Reservation::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::ReservationList::Warning, decorator: Google::Apis::ComputeV1::ReservationList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::ReservationList::Warning::Datum, decorator: Google::Apis::ComputeV1::ReservationList::Warning::Datum::Representation
        
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
          collection :reservations, as: 'reservations', class: Google::Apis::ComputeV1::Reservation, decorator: Google::Apis::ComputeV1::Reservation::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::ReservationsScopedList::Warning, decorator: Google::Apis::ComputeV1::ReservationsScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::ReservationsScopedList::Warning::Datum, decorator: Google::Apis::ComputeV1::ReservationsScopedList::Warning::Datum::Representation
        
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
          collection :resource_policies, as: 'resourcePolicies', class: Google::Apis::ComputeV1::ResourcePolicy, decorator: Google::Apis::ComputeV1::ResourcePolicy::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::ResourcePoliciesScopedList::Warning, decorator: Google::Apis::ComputeV1::ResourcePoliciesScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::ResourcePoliciesScopedList::Warning::Datum, decorator: Google::Apis::ComputeV1::ResourcePoliciesScopedList::Warning::Datum::Representation
        
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
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :region, as: 'region'
          property :self_link, as: 'selfLink'
          property :snapshot_schedule_policy, as: 'snapshotSchedulePolicy', class: Google::Apis::ComputeV1::ResourcePolicySnapshotSchedulePolicy, decorator: Google::Apis::ComputeV1::ResourcePolicySnapshotSchedulePolicy::Representation
      
          property :status, as: 'status'
        end
      end
      
      class ResourcePolicyAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeV1::ResourcePoliciesScopedList, decorator: Google::Apis::ComputeV1::ResourcePoliciesScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::ResourcePolicyAggregatedList::Warning, decorator: Google::Apis::ComputeV1::ResourcePolicyAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::ResourcePolicyAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeV1::ResourcePolicyAggregatedList::Warning::Datum::Representation
        
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
          collection :items, as: 'items', class: Google::Apis::ComputeV1::ResourcePolicy, decorator: Google::Apis::ComputeV1::ResourcePolicy::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::ResourcePolicyList::Warning, decorator: Google::Apis::ComputeV1::ResourcePolicyList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::ResourcePolicyList::Warning::Datum, decorator: Google::Apis::ComputeV1::ResourcePolicyList::Warning::Datum::Representation
        
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
          property :retention_policy, as: 'retentionPolicy', class: Google::Apis::ComputeV1::ResourcePolicySnapshotSchedulePolicyRetentionPolicy, decorator: Google::Apis::ComputeV1::ResourcePolicySnapshotSchedulePolicyRetentionPolicy::Representation
      
          property :schedule, as: 'schedule', class: Google::Apis::ComputeV1::ResourcePolicySnapshotSchedulePolicySchedule, decorator: Google::Apis::ComputeV1::ResourcePolicySnapshotSchedulePolicySchedule::Representation
      
          property :snapshot_properties, as: 'snapshotProperties', class: Google::Apis::ComputeV1::ResourcePolicySnapshotSchedulePolicySnapshotProperties, decorator: Google::Apis::ComputeV1::ResourcePolicySnapshotSchedulePolicySnapshotProperties::Representation
      
        end
      end
      
      class ResourcePolicySnapshotSchedulePolicyRetentionPolicy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :max_retention_days, as: 'maxRetentionDays'
          property :on_source_disk_delete, as: 'onSourceDiskDelete'
        end
      end
      
      class ResourcePolicySnapshotSchedulePolicySchedule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :daily_schedule, as: 'dailySchedule', class: Google::Apis::ComputeV1::ResourcePolicyDailyCycle, decorator: Google::Apis::ComputeV1::ResourcePolicyDailyCycle::Representation
      
          property :hourly_schedule, as: 'hourlySchedule', class: Google::Apis::ComputeV1::ResourcePolicyHourlyCycle, decorator: Google::Apis::ComputeV1::ResourcePolicyHourlyCycle::Representation
      
          property :weekly_schedule, as: 'weeklySchedule', class: Google::Apis::ComputeV1::ResourcePolicyWeeklyCycle, decorator: Google::Apis::ComputeV1::ResourcePolicyWeeklyCycle::Representation
      
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
      
      class ResourcePolicyWeeklyCycle
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :day_of_weeks, as: 'dayOfWeeks', class: Google::Apis::ComputeV1::ResourcePolicyWeeklyCycleDayOfWeek, decorator: Google::Apis::ComputeV1::ResourcePolicyWeeklyCycleDayOfWeek::Representation
      
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
          property :next_hop_ip, as: 'nextHopIp'
          property :next_hop_network, as: 'nextHopNetwork'
          property :next_hop_peering, as: 'nextHopPeering'
          property :next_hop_vpn_tunnel, as: 'nextHopVpnTunnel'
          property :priority, as: 'priority'
          property :self_link, as: 'selfLink'
          collection :tags, as: 'tags'
          collection :warnings, as: 'warnings', class: Google::Apis::ComputeV1::Route::Warning, decorator: Google::Apis::ComputeV1::Route::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::Route::Warning::Datum, decorator: Google::Apis::ComputeV1::Route::Warning::Datum::Representation
        
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
          collection :items, as: 'items', class: Google::Apis::ComputeV1::Route, decorator: Google::Apis::ComputeV1::Route::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::RouteList::Warning, decorator: Google::Apis::ComputeV1::RouteList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::RouteList::Warning::Datum, decorator: Google::Apis::ComputeV1::RouteList::Warning::Datum::Representation
        
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
          property :bgp, as: 'bgp', class: Google::Apis::ComputeV1::RouterBgp, decorator: Google::Apis::ComputeV1::RouterBgp::Representation
      
          collection :bgp_peers, as: 'bgpPeers', class: Google::Apis::ComputeV1::RouterBgpPeer, decorator: Google::Apis::ComputeV1::RouterBgpPeer::Representation
      
          property :creation_timestamp, as: 'creationTimestamp'
          property :description, as: 'description'
          property :id, :numeric_string => true, as: 'id'
          collection :interfaces, as: 'interfaces', class: Google::Apis::ComputeV1::RouterInterface, decorator: Google::Apis::ComputeV1::RouterInterface::Representation
      
          property :kind, as: 'kind'
          property :name, as: 'name'
          collection :nats, as: 'nats', class: Google::Apis::ComputeV1::RouterNat, decorator: Google::Apis::ComputeV1::RouterNat::Representation
      
          property :network, as: 'network'
          property :region, as: 'region'
          property :self_link, as: 'selfLink'
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
          hash :items, as: 'items', class: Google::Apis::ComputeV1::RoutersScopedList, decorator: Google::Apis::ComputeV1::RoutersScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::RouterAggregatedList::Warning, decorator: Google::Apis::ComputeV1::RouterAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::RouterAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeV1::RouterAggregatedList::Warning::Datum::Representation
        
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
          collection :advertised_ip_ranges, as: 'advertisedIpRanges', class: Google::Apis::ComputeV1::RouterAdvertisedIpRange, decorator: Google::Apis::ComputeV1::RouterAdvertisedIpRange::Representation
      
          property :asn, as: 'asn'
        end
      end
      
      class RouterBgpPeer
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :advertise_mode, as: 'advertiseMode'
          collection :advertised_groups, as: 'advertisedGroups'
          collection :advertised_ip_ranges, as: 'advertisedIpRanges', class: Google::Apis::ComputeV1::RouterAdvertisedIpRange, decorator: Google::Apis::ComputeV1::RouterAdvertisedIpRange::Representation
      
          property :advertised_route_priority, as: 'advertisedRoutePriority'
          property :interface_name, as: 'interfaceName'
          property :ip_address, as: 'ipAddress'
          property :management_type, as: 'managementType'
          property :name, as: 'name'
          property :peer_asn, as: 'peerAsn'
          property :peer_ip_address, as: 'peerIpAddress'
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
          collection :items, as: 'items', class: Google::Apis::ComputeV1::Router, decorator: Google::Apis::ComputeV1::Router::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::RouterList::Warning, decorator: Google::Apis::ComputeV1::RouterList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::RouterList::Warning::Datum, decorator: Google::Apis::ComputeV1::RouterList::Warning::Datum::Representation
        
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
          property :log_config, as: 'logConfig', class: Google::Apis::ComputeV1::RouterNatLogConfig, decorator: Google::Apis::ComputeV1::RouterNatLogConfig::Representation
      
          property :min_ports_per_vm, as: 'minPortsPerVm'
          property :name, as: 'name'
          property :nat_ip_allocate_option, as: 'natIpAllocateOption'
          collection :nat_ips, as: 'natIps'
          property :source_subnetwork_ip_ranges_to_nat, as: 'sourceSubnetworkIpRangesToNat'
          collection :subnetworks, as: 'subnetworks', class: Google::Apis::ComputeV1::RouterNatSubnetworkToNat, decorator: Google::Apis::ComputeV1::RouterNatSubnetworkToNat::Representation
      
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
          collection :best_routes, as: 'bestRoutes', class: Google::Apis::ComputeV1::Route, decorator: Google::Apis::ComputeV1::Route::Representation
      
          collection :best_routes_for_router, as: 'bestRoutesForRouter', class: Google::Apis::ComputeV1::Route, decorator: Google::Apis::ComputeV1::Route::Representation
      
          collection :bgp_peer_status, as: 'bgpPeerStatus', class: Google::Apis::ComputeV1::RouterStatusBgpPeerStatus, decorator: Google::Apis::ComputeV1::RouterStatusBgpPeerStatus::Representation
      
          collection :nat_status, as: 'natStatus', class: Google::Apis::ComputeV1::RouterStatusNatStatus, decorator: Google::Apis::ComputeV1::RouterStatusNatStatus::Representation
      
          property :network, as: 'network'
        end
      end
      
      class RouterStatusBgpPeerStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :advertised_routes, as: 'advertisedRoutes', class: Google::Apis::ComputeV1::Route, decorator: Google::Apis::ComputeV1::Route::Representation
      
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
          property :result, as: 'result', class: Google::Apis::ComputeV1::RouterStatus, decorator: Google::Apis::ComputeV1::RouterStatus::Representation
      
        end
      end
      
      class RoutersPreviewResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :resource, as: 'resource', class: Google::Apis::ComputeV1::Router, decorator: Google::Apis::ComputeV1::Router::Representation
      
        end
      end
      
      class RoutersScopedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :routers, as: 'routers', class: Google::Apis::ComputeV1::Router, decorator: Google::Apis::ComputeV1::Router::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::RoutersScopedList::Warning, decorator: Google::Apis::ComputeV1::RoutersScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::RoutersScopedList::Warning::Datum, decorator: Google::Apis::ComputeV1::RoutersScopedList::Warning::Datum::Representation
        
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
          collection :conditions, as: 'conditions', class: Google::Apis::ComputeV1::Condition, decorator: Google::Apis::ComputeV1::Condition::Representation
      
          property :description, as: 'description'
          collection :ins, as: 'ins'
          collection :log_configs, as: 'logConfigs', class: Google::Apis::ComputeV1::LogConfig, decorator: Google::Apis::ComputeV1::LogConfig::Representation
      
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
      
      class Scheduling
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :automatic_restart, as: 'automaticRestart'
          collection :node_affinities, as: 'nodeAffinities', class: Google::Apis::ComputeV1::SchedulingNodeAffinity, decorator: Google::Apis::ComputeV1::SchedulingNodeAffinity::Representation
      
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
      
      class SecurityPolicy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creation_timestamp, as: 'creationTimestamp'
          property :description, as: 'description'
          property :fingerprint, :base64 => true, as: 'fingerprint'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          collection :rules, as: 'rules', class: Google::Apis::ComputeV1::SecurityPolicyRule, decorator: Google::Apis::ComputeV1::SecurityPolicyRule::Representation
      
          property :self_link, as: 'selfLink'
        end
      end
      
      class SecurityPolicyList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeV1::SecurityPolicy, decorator: Google::Apis::ComputeV1::SecurityPolicy::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::SecurityPolicyList::Warning, decorator: Google::Apis::ComputeV1::SecurityPolicyList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::SecurityPolicyList::Warning::Datum, decorator: Google::Apis::ComputeV1::SecurityPolicyList::Warning::Datum::Representation
        
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
          property :kind, as: 'kind'
          property :match, as: 'match', class: Google::Apis::ComputeV1::SecurityPolicyRuleMatcher, decorator: Google::Apis::ComputeV1::SecurityPolicyRuleMatcher::Representation
      
          property :preview, as: 'preview'
          property :priority, as: 'priority'
        end
      end
      
      class SecurityPolicyRuleMatcher
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :config, as: 'config', class: Google::Apis::ComputeV1::SecurityPolicyRuleMatcherConfig, decorator: Google::Apis::ComputeV1::SecurityPolicyRuleMatcherConfig::Representation
      
          property :versioned_expr, as: 'versionedExpr'
        end
      end
      
      class SecurityPolicyRuleMatcherConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :src_ip_ranges, as: 'srcIpRanges'
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
          property :encryption_key, as: 'encryptionKey', class: Google::Apis::ComputeV1::ShieldedInstanceIdentityEntry, decorator: Google::Apis::ComputeV1::ShieldedInstanceIdentityEntry::Representation
      
          property :kind, as: 'kind'
          property :signing_key, as: 'signingKey', class: Google::Apis::ComputeV1::ShieldedInstanceIdentityEntry, decorator: Google::Apis::ComputeV1::ShieldedInstanceIdentityEntry::Representation
      
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
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :label_fingerprint, :base64 => true, as: 'labelFingerprint'
          hash :labels, as: 'labels'
          collection :license_codes, as: 'licenseCodes'
          collection :licenses, as: 'licenses'
          property :name, as: 'name'
          property :self_link, as: 'selfLink'
          property :snapshot_encryption_key, as: 'snapshotEncryptionKey', class: Google::Apis::ComputeV1::CustomerEncryptionKey, decorator: Google::Apis::ComputeV1::CustomerEncryptionKey::Representation
      
          property :source_disk, as: 'sourceDisk'
          property :source_disk_encryption_key, as: 'sourceDiskEncryptionKey', class: Google::Apis::ComputeV1::CustomerEncryptionKey, decorator: Google::Apis::ComputeV1::CustomerEncryptionKey::Representation
      
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
          collection :items, as: 'items', class: Google::Apis::ComputeV1::Snapshot, decorator: Google::Apis::ComputeV1::Snapshot::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::SnapshotList::Warning, decorator: Google::Apis::ComputeV1::SnapshotList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::SnapshotList::Warning::Datum, decorator: Google::Apis::ComputeV1::SnapshotList::Warning::Datum::Representation
        
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
      
      class SourceInstanceParams
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :disk_configs, as: 'diskConfigs', class: Google::Apis::ComputeV1::DiskInstantiationConfig, decorator: Google::Apis::ComputeV1::DiskInstantiationConfig::Representation
      
        end
      end
      
      class SslCertificate
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :certificate, as: 'certificate'
          property :creation_timestamp, as: 'creationTimestamp'
          property :description, as: 'description'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :private_key, as: 'privateKey'
          property :region, as: 'region'
          property :self_link, as: 'selfLink'
        end
      end
      
      class SslCertificateAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeV1::SslCertificatesScopedList, decorator: Google::Apis::ComputeV1::SslCertificatesScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::SslCertificateAggregatedList::Warning, decorator: Google::Apis::ComputeV1::SslCertificateAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::SslCertificateAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeV1::SslCertificateAggregatedList::Warning::Datum::Representation
        
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
          collection :items, as: 'items', class: Google::Apis::ComputeV1::SslCertificate, decorator: Google::Apis::ComputeV1::SslCertificate::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::SslCertificateList::Warning, decorator: Google::Apis::ComputeV1::SslCertificateList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::SslCertificateList::Warning::Datum, decorator: Google::Apis::ComputeV1::SslCertificateList::Warning::Datum::Representation
        
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
      
      class SslCertificatesScopedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :ssl_certificates, as: 'sslCertificates', class: Google::Apis::ComputeV1::SslCertificate, decorator: Google::Apis::ComputeV1::SslCertificate::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::SslCertificatesScopedList::Warning, decorator: Google::Apis::ComputeV1::SslCertificatesScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::SslCertificatesScopedList::Warning::Datum, decorator: Google::Apis::ComputeV1::SslCertificatesScopedList::Warning::Datum::Representation
        
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
          collection :items, as: 'items', class: Google::Apis::ComputeV1::SslPolicy, decorator: Google::Apis::ComputeV1::SslPolicy::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::SslPoliciesList::Warning, decorator: Google::Apis::ComputeV1::SslPoliciesList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::SslPoliciesList::Warning::Datum, decorator: Google::Apis::ComputeV1::SslPoliciesList::Warning::Datum::Representation
        
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
          collection :warnings, as: 'warnings', class: Google::Apis::ComputeV1::SslPolicy::Warning, decorator: Google::Apis::ComputeV1::SslPolicy::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::SslPolicy::Warning::Datum, decorator: Google::Apis::ComputeV1::SslPolicy::Warning::Datum::Representation
        
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
      
      class Subnetwork
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creation_timestamp, as: 'creationTimestamp'
          property :description, as: 'description'
          property :enable_flow_logs, as: 'enableFlowLogs'
          property :fingerprint, :base64 => true, as: 'fingerprint'
          property :gateway_address, as: 'gatewayAddress'
          property :id, :numeric_string => true, as: 'id'
          property :ip_cidr_range, as: 'ipCidrRange'
          property :kind, as: 'kind'
          property :log_config, as: 'logConfig', class: Google::Apis::ComputeV1::SubnetworkLogConfig, decorator: Google::Apis::ComputeV1::SubnetworkLogConfig::Representation
      
          property :name, as: 'name'
          property :network, as: 'network'
          property :private_ip_google_access, as: 'privateIpGoogleAccess'
          property :purpose, as: 'purpose'
          property :region, as: 'region'
          property :role, as: 'role'
          collection :secondary_ip_ranges, as: 'secondaryIpRanges', class: Google::Apis::ComputeV1::SubnetworkSecondaryRange, decorator: Google::Apis::ComputeV1::SubnetworkSecondaryRange::Representation
      
          property :self_link, as: 'selfLink'
          property :state, as: 'state'
        end
      end
      
      class SubnetworkAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeV1::SubnetworksScopedList, decorator: Google::Apis::ComputeV1::SubnetworksScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::SubnetworkAggregatedList::Warning, decorator: Google::Apis::ComputeV1::SubnetworkAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::SubnetworkAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeV1::SubnetworkAggregatedList::Warning::Datum::Representation
        
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
          collection :items, as: 'items', class: Google::Apis::ComputeV1::Subnetwork, decorator: Google::Apis::ComputeV1::Subnetwork::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::SubnetworkList::Warning, decorator: Google::Apis::ComputeV1::SubnetworkList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::SubnetworkList::Warning::Datum, decorator: Google::Apis::ComputeV1::SubnetworkList::Warning::Datum::Representation
        
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
          property :flow_sampling, as: 'flowSampling'
          property :metadata, as: 'metadata'
        end
      end
      
      class SubnetworkSecondaryRange
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :ip_cidr_range, as: 'ipCidrRange'
          property :range_name, as: 'rangeName'
        end
      end
      
      class SubnetworksExpandIpCidrRangeRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :ip_cidr_range, as: 'ipCidrRange'
        end
      end
      
      class SubnetworksScopedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :subnetworks, as: 'subnetworks', class: Google::Apis::ComputeV1::Subnetwork, decorator: Google::Apis::ComputeV1::Subnetwork::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::SubnetworksScopedList::Warning, decorator: Google::Apis::ComputeV1::SubnetworksScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::SubnetworksScopedList::Warning::Datum, decorator: Google::Apis::ComputeV1::SubnetworksScopedList::Warning::Datum::Representation
        
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
          collection :target_http_proxies, as: 'targetHttpProxies', class: Google::Apis::ComputeV1::TargetHttpProxy, decorator: Google::Apis::ComputeV1::TargetHttpProxy::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::TargetHttpProxiesScopedList::Warning, decorator: Google::Apis::ComputeV1::TargetHttpProxiesScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::TargetHttpProxiesScopedList::Warning::Datum, decorator: Google::Apis::ComputeV1::TargetHttpProxiesScopedList::Warning::Datum::Representation
        
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
          property :region, as: 'region'
          property :self_link, as: 'selfLink'
          property :url_map, as: 'urlMap'
        end
      end
      
      class TargetHttpProxyAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeV1::TargetHttpProxiesScopedList, decorator: Google::Apis::ComputeV1::TargetHttpProxiesScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
        end
      end
      
      class TargetHttpProxyList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeV1::TargetHttpProxy, decorator: Google::Apis::ComputeV1::TargetHttpProxy::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::TargetHttpProxyList::Warning, decorator: Google::Apis::ComputeV1::TargetHttpProxyList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::TargetHttpProxyList::Warning::Datum, decorator: Google::Apis::ComputeV1::TargetHttpProxyList::Warning::Datum::Representation
        
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
          collection :target_https_proxies, as: 'targetHttpsProxies', class: Google::Apis::ComputeV1::TargetHttpsProxy, decorator: Google::Apis::ComputeV1::TargetHttpsProxy::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::TargetHttpsProxiesScopedList::Warning, decorator: Google::Apis::ComputeV1::TargetHttpsProxiesScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::TargetHttpsProxiesScopedList::Warning::Datum, decorator: Google::Apis::ComputeV1::TargetHttpsProxiesScopedList::Warning::Datum::Representation
        
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
          property :quic_override, as: 'quicOverride'
          property :region, as: 'region'
          property :self_link, as: 'selfLink'
          collection :ssl_certificates, as: 'sslCertificates'
          property :ssl_policy, as: 'sslPolicy'
          property :url_map, as: 'urlMap'
        end
      end
      
      class TargetHttpsProxyAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeV1::TargetHttpsProxiesScopedList, decorator: Google::Apis::ComputeV1::TargetHttpsProxiesScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::TargetHttpsProxyAggregatedList::Warning, decorator: Google::Apis::ComputeV1::TargetHttpsProxyAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::TargetHttpsProxyAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeV1::TargetHttpsProxyAggregatedList::Warning::Datum::Representation
        
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
          collection :items, as: 'items', class: Google::Apis::ComputeV1::TargetHttpsProxy, decorator: Google::Apis::ComputeV1::TargetHttpsProxy::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::TargetHttpsProxyList::Warning, decorator: Google::Apis::ComputeV1::TargetHttpsProxyList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::TargetHttpsProxyList::Warning::Datum, decorator: Google::Apis::ComputeV1::TargetHttpsProxyList::Warning::Datum::Representation
        
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
          property :zone, as: 'zone'
        end
      end
      
      class TargetInstanceAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeV1::TargetInstancesScopedList, decorator: Google::Apis::ComputeV1::TargetInstancesScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::TargetInstanceAggregatedList::Warning, decorator: Google::Apis::ComputeV1::TargetInstanceAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::TargetInstanceAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeV1::TargetInstanceAggregatedList::Warning::Datum::Representation
        
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
          collection :items, as: 'items', class: Google::Apis::ComputeV1::TargetInstance, decorator: Google::Apis::ComputeV1::TargetInstance::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::TargetInstanceList::Warning, decorator: Google::Apis::ComputeV1::TargetInstanceList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::TargetInstanceList::Warning::Datum, decorator: Google::Apis::ComputeV1::TargetInstanceList::Warning::Datum::Representation
        
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
          collection :target_instances, as: 'targetInstances', class: Google::Apis::ComputeV1::TargetInstance, decorator: Google::Apis::ComputeV1::TargetInstance::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::TargetInstancesScopedList::Warning, decorator: Google::Apis::ComputeV1::TargetInstancesScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::TargetInstancesScopedList::Warning::Datum, decorator: Google::Apis::ComputeV1::TargetInstancesScopedList::Warning::Datum::Representation
        
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
          property :session_affinity, as: 'sessionAffinity'
        end
      end
      
      class TargetPoolAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeV1::TargetPoolsScopedList, decorator: Google::Apis::ComputeV1::TargetPoolsScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::TargetPoolAggregatedList::Warning, decorator: Google::Apis::ComputeV1::TargetPoolAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::TargetPoolAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeV1::TargetPoolAggregatedList::Warning::Datum::Representation
        
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
          collection :health_status, as: 'healthStatus', class: Google::Apis::ComputeV1::HealthStatus, decorator: Google::Apis::ComputeV1::HealthStatus::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class TargetPoolList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeV1::TargetPool, decorator: Google::Apis::ComputeV1::TargetPool::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::TargetPoolList::Warning, decorator: Google::Apis::ComputeV1::TargetPoolList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::TargetPoolList::Warning::Datum, decorator: Google::Apis::ComputeV1::TargetPoolList::Warning::Datum::Representation
        
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
      
      class AddTargetPoolsHealthCheckRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :health_checks, as: 'healthChecks', class: Google::Apis::ComputeV1::HealthCheckReference, decorator: Google::Apis::ComputeV1::HealthCheckReference::Representation
      
        end
      end
      
      class AddTargetPoolsInstanceRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :instances, as: 'instances', class: Google::Apis::ComputeV1::InstanceReference, decorator: Google::Apis::ComputeV1::InstanceReference::Representation
      
        end
      end
      
      class RemoveTargetPoolsHealthCheckRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :health_checks, as: 'healthChecks', class: Google::Apis::ComputeV1::HealthCheckReference, decorator: Google::Apis::ComputeV1::HealthCheckReference::Representation
      
        end
      end
      
      class RemoveTargetPoolsInstanceRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :instances, as: 'instances', class: Google::Apis::ComputeV1::InstanceReference, decorator: Google::Apis::ComputeV1::InstanceReference::Representation
      
        end
      end
      
      class TargetPoolsScopedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :target_pools, as: 'targetPools', class: Google::Apis::ComputeV1::TargetPool, decorator: Google::Apis::ComputeV1::TargetPool::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::TargetPoolsScopedList::Warning, decorator: Google::Apis::ComputeV1::TargetPoolsScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::TargetPoolsScopedList::Warning::Datum, decorator: Google::Apis::ComputeV1::TargetPoolsScopedList::Warning::Datum::Representation
        
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
          collection :items, as: 'items', class: Google::Apis::ComputeV1::TargetSslProxy, decorator: Google::Apis::ComputeV1::TargetSslProxy::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::TargetSslProxyList::Warning, decorator: Google::Apis::ComputeV1::TargetSslProxyList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::TargetSslProxyList::Warning::Datum, decorator: Google::Apis::ComputeV1::TargetSslProxyList::Warning::Datum::Representation
        
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
          collection :items, as: 'items', class: Google::Apis::ComputeV1::TargetTcpProxy, decorator: Google::Apis::ComputeV1::TargetTcpProxy::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::TargetTcpProxyList::Warning, decorator: Google::Apis::ComputeV1::TargetTcpProxyList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::TargetTcpProxyList::Warning::Datum, decorator: Google::Apis::ComputeV1::TargetTcpProxyList::Warning::Datum::Representation
        
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
          hash :items, as: 'items', class: Google::Apis::ComputeV1::TargetVpnGatewaysScopedList, decorator: Google::Apis::ComputeV1::TargetVpnGatewaysScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::TargetVpnGatewayAggregatedList::Warning, decorator: Google::Apis::ComputeV1::TargetVpnGatewayAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::TargetVpnGatewayAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeV1::TargetVpnGatewayAggregatedList::Warning::Datum::Representation
        
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
          collection :items, as: 'items', class: Google::Apis::ComputeV1::TargetVpnGateway, decorator: Google::Apis::ComputeV1::TargetVpnGateway::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::TargetVpnGatewayList::Warning, decorator: Google::Apis::ComputeV1::TargetVpnGatewayList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::TargetVpnGatewayList::Warning::Datum, decorator: Google::Apis::ComputeV1::TargetVpnGatewayList::Warning::Datum::Representation
        
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
          collection :target_vpn_gateways, as: 'targetVpnGateways', class: Google::Apis::ComputeV1::TargetVpnGateway, decorator: Google::Apis::ComputeV1::TargetVpnGateway::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::TargetVpnGatewaysScopedList::Warning, decorator: Google::Apis::ComputeV1::TargetVpnGatewaysScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::TargetVpnGatewaysScopedList::Warning::Datum, decorator: Google::Apis::ComputeV1::TargetVpnGatewaysScopedList::Warning::Datum::Representation
        
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
      
      class UrlMap
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creation_timestamp, as: 'creationTimestamp'
          property :default_route_action, as: 'defaultRouteAction', class: Google::Apis::ComputeV1::HttpRouteAction, decorator: Google::Apis::ComputeV1::HttpRouteAction::Representation
      
          property :default_service, as: 'defaultService'
          property :default_url_redirect, as: 'defaultUrlRedirect', class: Google::Apis::ComputeV1::HttpRedirectAction, decorator: Google::Apis::ComputeV1::HttpRedirectAction::Representation
      
          property :description, as: 'description'
          property :fingerprint, :base64 => true, as: 'fingerprint'
          property :header_action, as: 'headerAction', class: Google::Apis::ComputeV1::HttpHeaderAction, decorator: Google::Apis::ComputeV1::HttpHeaderAction::Representation
      
          collection :host_rules, as: 'hostRules', class: Google::Apis::ComputeV1::HostRule, decorator: Google::Apis::ComputeV1::HostRule::Representation
      
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          collection :path_matchers, as: 'pathMatchers', class: Google::Apis::ComputeV1::PathMatcher, decorator: Google::Apis::ComputeV1::PathMatcher::Representation
      
          property :region, as: 'region'
          property :self_link, as: 'selfLink'
          collection :tests, as: 'tests', class: Google::Apis::ComputeV1::UrlMapTest, decorator: Google::Apis::ComputeV1::UrlMapTest::Representation
      
        end
      end
      
      class UrlMapList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeV1::UrlMap, decorator: Google::Apis::ComputeV1::UrlMap::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::UrlMapList::Warning, decorator: Google::Apis::ComputeV1::UrlMapList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::UrlMapList::Warning::Datum, decorator: Google::Apis::ComputeV1::UrlMapList::Warning::Datum::Representation
        
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
          property :description, as: 'description'
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
          collection :test_failures, as: 'testFailures', class: Google::Apis::ComputeV1::TestFailure, decorator: Google::Apis::ComputeV1::TestFailure::Representation
      
          property :test_passed, as: 'testPassed'
        end
      end
      
      class UrlMapsAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeV1::UrlMapsScopedList, decorator: Google::Apis::ComputeV1::UrlMapsScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::UrlMapsAggregatedList::Warning, decorator: Google::Apis::ComputeV1::UrlMapsAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::UrlMapsAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeV1::UrlMapsAggregatedList::Warning::Datum::Representation
        
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
          collection :url_maps, as: 'urlMaps', class: Google::Apis::ComputeV1::UrlMap, decorator: Google::Apis::ComputeV1::UrlMap::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::UrlMapsScopedList::Warning, decorator: Google::Apis::ComputeV1::UrlMapsScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::UrlMapsScopedList::Warning::Datum, decorator: Google::Apis::ComputeV1::UrlMapsScopedList::Warning::Datum::Representation
        
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
      
      class ValidateUrlMapsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :resource, as: 'resource', class: Google::Apis::ComputeV1::UrlMap, decorator: Google::Apis::ComputeV1::UrlMap::Representation
      
        end
      end
      
      class ValidateUrlMapsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :result, as: 'result', class: Google::Apis::ComputeV1::UrlMapValidationResult, decorator: Google::Apis::ComputeV1::UrlMapValidationResult::Representation
      
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
          collection :secondary_ip_ranges, as: 'secondaryIpRanges', class: Google::Apis::ComputeV1::UsableSubnetworkSecondaryRange, decorator: Google::Apis::ComputeV1::UsableSubnetworkSecondaryRange::Representation
      
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
          collection :items, as: 'items', class: Google::Apis::ComputeV1::UsableSubnetwork, decorator: Google::Apis::ComputeV1::UsableSubnetwork::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::UsableSubnetworksAggregatedList::Warning, decorator: Google::Apis::ComputeV1::UsableSubnetworksAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::UsableSubnetworksAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeV1::UsableSubnetworksAggregatedList::Warning::Datum::Representation
        
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
          collection :interface_nat_mappings, as: 'interfaceNatMappings', class: Google::Apis::ComputeV1::VmEndpointNatMappingsInterfaceNatMappings, decorator: Google::Apis::ComputeV1::VmEndpointNatMappingsInterfaceNatMappings::Representation
      
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
          collection :result, as: 'result', class: Google::Apis::ComputeV1::VmEndpointNatMappings, decorator: Google::Apis::ComputeV1::VmEndpointNatMappings::Representation
      
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::VmEndpointNatMappingsList::Warning, decorator: Google::Apis::ComputeV1::VmEndpointNatMappingsList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::VmEndpointNatMappingsList::Warning::Datum, decorator: Google::Apis::ComputeV1::VmEndpointNatMappingsList::Warning::Datum::Representation
        
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
          collection :vpn_interfaces, as: 'vpnInterfaces', class: Google::Apis::ComputeV1::VpnGatewayVpnGatewayInterface, decorator: Google::Apis::ComputeV1::VpnGatewayVpnGatewayInterface::Representation
      
        end
      end
      
      class VpnGatewayAggregatedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          hash :items, as: 'items', class: Google::Apis::ComputeV1::VpnGatewaysScopedList, decorator: Google::Apis::ComputeV1::VpnGatewaysScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::VpnGatewayAggregatedList::Warning, decorator: Google::Apis::ComputeV1::VpnGatewayAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::VpnGatewayAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeV1::VpnGatewayAggregatedList::Warning::Datum::Representation
        
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
          collection :items, as: 'items', class: Google::Apis::ComputeV1::VpnGateway, decorator: Google::Apis::ComputeV1::VpnGateway::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::VpnGatewayList::Warning, decorator: Google::Apis::ComputeV1::VpnGatewayList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::VpnGatewayList::Warning::Datum, decorator: Google::Apis::ComputeV1::VpnGatewayList::Warning::Datum::Representation
        
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
          collection :vpn_connections, as: 'vpnConnections', class: Google::Apis::ComputeV1::VpnGatewayStatusVpnConnection, decorator: Google::Apis::ComputeV1::VpnGatewayStatusVpnConnection::Representation
      
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
          property :state, as: 'state', class: Google::Apis::ComputeV1::VpnGatewayStatusHighAvailabilityRequirementState, decorator: Google::Apis::ComputeV1::VpnGatewayStatusHighAvailabilityRequirementState::Representation
      
          collection :tunnels, as: 'tunnels', class: Google::Apis::ComputeV1::VpnGatewayStatusTunnel, decorator: Google::Apis::ComputeV1::VpnGatewayStatusTunnel::Representation
      
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
          property :result, as: 'result', class: Google::Apis::ComputeV1::VpnGatewayStatus, decorator: Google::Apis::ComputeV1::VpnGatewayStatus::Representation
      
        end
      end
      
      class VpnGatewaysScopedList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :vpn_gateways, as: 'vpnGateways', class: Google::Apis::ComputeV1::VpnGateway, decorator: Google::Apis::ComputeV1::VpnGateway::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::VpnGatewaysScopedList::Warning, decorator: Google::Apis::ComputeV1::VpnGatewaysScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::VpnGatewaysScopedList::Warning::Datum, decorator: Google::Apis::ComputeV1::VpnGatewaysScopedList::Warning::Datum::Representation
        
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
          hash :items, as: 'items', class: Google::Apis::ComputeV1::VpnTunnelsScopedList, decorator: Google::Apis::ComputeV1::VpnTunnelsScopedList::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::VpnTunnelAggregatedList::Warning, decorator: Google::Apis::ComputeV1::VpnTunnelAggregatedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::VpnTunnelAggregatedList::Warning::Datum, decorator: Google::Apis::ComputeV1::VpnTunnelAggregatedList::Warning::Datum::Representation
        
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
          collection :items, as: 'items', class: Google::Apis::ComputeV1::VpnTunnel, decorator: Google::Apis::ComputeV1::VpnTunnel::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::VpnTunnelList::Warning, decorator: Google::Apis::ComputeV1::VpnTunnelList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::VpnTunnelList::Warning::Datum, decorator: Google::Apis::ComputeV1::VpnTunnelList::Warning::Datum::Representation
        
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
          collection :vpn_tunnels, as: 'vpnTunnels', class: Google::Apis::ComputeV1::VpnTunnel, decorator: Google::Apis::ComputeV1::VpnTunnel::Representation
      
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::VpnTunnelsScopedList::Warning, decorator: Google::Apis::ComputeV1::VpnTunnelsScopedList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::VpnTunnelsScopedList::Warning::Datum, decorator: Google::Apis::ComputeV1::VpnTunnelsScopedList::Warning::Datum::Representation
        
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
      
      class WeightedBackendService
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :backend_service, as: 'backendService'
          property :header_action, as: 'headerAction', class: Google::Apis::ComputeV1::HttpHeaderAction, decorator: Google::Apis::ComputeV1::HttpHeaderAction::Representation
      
          property :weight, as: 'weight'
        end
      end
      
      class XpnHostList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          collection :items, as: 'items', class: Google::Apis::ComputeV1::Project, decorator: Google::Apis::ComputeV1::Project::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::XpnHostList::Warning, decorator: Google::Apis::ComputeV1::XpnHostList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::XpnHostList::Warning::Datum, decorator: Google::Apis::ComputeV1::XpnHostList::Warning::Datum::Representation
        
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
          property :deprecated, as: 'deprecated', class: Google::Apis::ComputeV1::DeprecationStatus, decorator: Google::Apis::ComputeV1::DeprecationStatus::Representation
      
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
          collection :items, as: 'items', class: Google::Apis::ComputeV1::Zone, decorator: Google::Apis::ComputeV1::Zone::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :self_link, as: 'selfLink'
          property :warning, as: 'warning', class: Google::Apis::ComputeV1::ZoneList::Warning, decorator: Google::Apis::ComputeV1::ZoneList::Warning::Representation
      
        end
        
        class Warning
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :code, as: 'code'
            collection :data, as: 'data', class: Google::Apis::ComputeV1::ZoneList::Warning::Datum, decorator: Google::Apis::ComputeV1::ZoneList::Warning::Datum::Representation
        
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
          collection :bindings, as: 'bindings', class: Google::Apis::ComputeV1::Binding, decorator: Google::Apis::ComputeV1::Binding::Representation
      
          property :etag, :base64 => true, as: 'etag'
          property :policy, as: 'policy', class: Google::Apis::ComputeV1::Policy, decorator: Google::Apis::ComputeV1::Policy::Representation
      
        end
      end
    end
  end
end
