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
    module RunV1alpha1
      
      class Addressable
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
      
      class AuthorizedDomain
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Binding
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Capabilities
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CloudEventOverrides
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Condition
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConfigMapEnvSource
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConfigMapKeySelector
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConfigMapVolumeSource
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Configuration
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConfigurationCondition
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConfigurationSpec
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConfigurationStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Container
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ContainerPort
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Destination
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DomainMapping
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DomainMappingCondition
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DomainMappingSpec
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DomainMappingStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Empty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EnvFromSource
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EnvVar
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EnvVarSource
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EventType
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EventTypeImporter
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EventTypeParameter
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EventTypeSpec
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ExecAction
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Expr
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HttpGetAction
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HttpHeader
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Handler
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Initializer
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Initializers
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class IntOrString
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class KeyToPath
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Lifecycle
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListAuthorizedDomainsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListConfigurationsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListDomainMappingsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListEventTypesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListLocationsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListMeta
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListPubSubsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListRevisionsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListRoutesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListServicesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListTriggersResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LocalObjectReference
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Location
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ObjectMeta
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ObjectReference
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OwnerReference
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Policy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Probe
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PubSub
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PubSubSpec
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PubSubStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Quantity
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ResourceRecord
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ResourceRequirements
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Revision
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RevisionCondition
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RevisionSpec
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RevisionStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RevisionTemplate
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Route
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RouteCondition
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RouteSpec
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RouteStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SeLinuxOptions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SecretEnvSource
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SecretKeySelector
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SecretVolumeSource
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SecurityContext
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Service
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ServiceCondition
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ServiceSpec
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ServiceSpecManualType
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ServiceSpecPinnedType
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ServiceSpecReleaseType
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ServiceSpecRunLatest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ServiceStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SetIamPolicyRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SubscriberSpec
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TcpSocketAction
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TestIamPermissionsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TestIamPermissionsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TrafficTarget
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Trigger
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TriggerCondition
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TriggerFilter
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TriggerFilterSourceAndType
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TriggerImporterSpec
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TriggerSpec
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TriggerStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Volume
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VolumeDevice
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VolumeMount
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Addressable
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :hostname, as: 'hostname'
          property :url, as: 'url'
        end
      end
      
      class AuditConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :audit_log_configs, as: 'auditLogConfigs', class: Google::Apis::RunV1alpha1::AuditLogConfig, decorator: Google::Apis::RunV1alpha1::AuditLogConfig::Representation
      
          property :service, as: 'service'
        end
      end
      
      class AuditLogConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :exempted_members, as: 'exemptedMembers'
          property :log_type, as: 'logType'
        end
      end
      
      class AuthorizedDomain
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          property :name, as: 'name'
        end
      end
      
      class Binding
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :condition, as: 'condition', class: Google::Apis::RunV1alpha1::Expr, decorator: Google::Apis::RunV1alpha1::Expr::Representation
      
          collection :members, as: 'members'
          property :role, as: 'role'
        end
      end
      
      class Capabilities
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :add, as: 'add'
          collection :drop, as: 'drop'
        end
      end
      
      class CloudEventOverrides
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :extensions, as: 'extensions'
        end
      end
      
      class Condition
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :last_transition_time, as: 'lastTransitionTime'
          property :message, as: 'message'
          property :reason, as: 'reason'
          property :severity, as: 'severity'
          property :status, as: 'status'
          property :type, as: 'type'
        end
      end
      
      class ConfigMapEnvSource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :local_object_reference, as: 'localObjectReference', class: Google::Apis::RunV1alpha1::LocalObjectReference, decorator: Google::Apis::RunV1alpha1::LocalObjectReference::Representation
      
          property :name, as: 'name'
          property :optional, as: 'optional'
        end
      end
      
      class ConfigMapKeySelector
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :key, as: 'key'
          property :local_object_reference, as: 'localObjectReference', class: Google::Apis::RunV1alpha1::LocalObjectReference, decorator: Google::Apis::RunV1alpha1::LocalObjectReference::Representation
      
          property :name, as: 'name'
          property :optional, as: 'optional'
        end
      end
      
      class ConfigMapVolumeSource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :default_mode, as: 'defaultMode'
          collection :items, as: 'items', class: Google::Apis::RunV1alpha1::KeyToPath, decorator: Google::Apis::RunV1alpha1::KeyToPath::Representation
      
          property :name, as: 'name'
          property :optional, as: 'optional'
        end
      end
      
      class Configuration
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :api_version, as: 'apiVersion'
          property :kind, as: 'kind'
          property :metadata, as: 'metadata', class: Google::Apis::RunV1alpha1::ObjectMeta, decorator: Google::Apis::RunV1alpha1::ObjectMeta::Representation
      
          property :spec, as: 'spec', class: Google::Apis::RunV1alpha1::ConfigurationSpec, decorator: Google::Apis::RunV1alpha1::ConfigurationSpec::Representation
      
          property :status, as: 'status', class: Google::Apis::RunV1alpha1::ConfigurationStatus, decorator: Google::Apis::RunV1alpha1::ConfigurationStatus::Representation
      
        end
      end
      
      class ConfigurationCondition
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :last_transition_time, as: 'lastTransitionTime'
          property :message, as: 'message'
          property :reason, as: 'reason'
          property :severity, as: 'severity'
          property :status, as: 'status'
          property :type, as: 'type'
        end
      end
      
      class ConfigurationSpec
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :generation, as: 'generation'
          property :revision_template, as: 'revisionTemplate', class: Google::Apis::RunV1alpha1::RevisionTemplate, decorator: Google::Apis::RunV1alpha1::RevisionTemplate::Representation
      
          property :template, as: 'template', class: Google::Apis::RunV1alpha1::RevisionTemplate, decorator: Google::Apis::RunV1alpha1::RevisionTemplate::Representation
      
        end
      end
      
      class ConfigurationStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :conditions, as: 'conditions', class: Google::Apis::RunV1alpha1::ConfigurationCondition, decorator: Google::Apis::RunV1alpha1::ConfigurationCondition::Representation
      
          property :latest_created_revision_name, as: 'latestCreatedRevisionName'
          property :latest_ready_revision_name, as: 'latestReadyRevisionName'
          property :observed_generation, as: 'observedGeneration'
        end
      end
      
      class Container
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :args, as: 'args'
          collection :command, as: 'command'
          collection :env, as: 'env', class: Google::Apis::RunV1alpha1::EnvVar, decorator: Google::Apis::RunV1alpha1::EnvVar::Representation
      
          collection :env_from, as: 'envFrom', class: Google::Apis::RunV1alpha1::EnvFromSource, decorator: Google::Apis::RunV1alpha1::EnvFromSource::Representation
      
          property :image, as: 'image'
          property :image_pull_policy, as: 'imagePullPolicy'
          property :lifecycle, as: 'lifecycle', class: Google::Apis::RunV1alpha1::Lifecycle, decorator: Google::Apis::RunV1alpha1::Lifecycle::Representation
      
          property :liveness_probe, as: 'livenessProbe', class: Google::Apis::RunV1alpha1::Probe, decorator: Google::Apis::RunV1alpha1::Probe::Representation
      
          property :name, as: 'name'
          collection :ports, as: 'ports', class: Google::Apis::RunV1alpha1::ContainerPort, decorator: Google::Apis::RunV1alpha1::ContainerPort::Representation
      
          property :readiness_probe, as: 'readinessProbe', class: Google::Apis::RunV1alpha1::Probe, decorator: Google::Apis::RunV1alpha1::Probe::Representation
      
          property :resources, as: 'resources', class: Google::Apis::RunV1alpha1::ResourceRequirements, decorator: Google::Apis::RunV1alpha1::ResourceRequirements::Representation
      
          property :security_context, as: 'securityContext', class: Google::Apis::RunV1alpha1::SecurityContext, decorator: Google::Apis::RunV1alpha1::SecurityContext::Representation
      
          property :stdin, as: 'stdin'
          property :stdin_once, as: 'stdinOnce'
          property :termination_message_path, as: 'terminationMessagePath'
          property :termination_message_policy, as: 'terminationMessagePolicy'
          property :tty, as: 'tty'
          collection :volume_devices, as: 'volumeDevices', class: Google::Apis::RunV1alpha1::VolumeDevice, decorator: Google::Apis::RunV1alpha1::VolumeDevice::Representation
      
          collection :volume_mounts, as: 'volumeMounts', class: Google::Apis::RunV1alpha1::VolumeMount, decorator: Google::Apis::RunV1alpha1::VolumeMount::Representation
      
          property :working_dir, as: 'workingDir'
        end
      end
      
      class ContainerPort
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :container_port, as: 'containerPort'
          property :host_ip, as: 'hostIP'
          property :host_port, as: 'hostPort'
          property :name, as: 'name'
          property :protocol, as: 'protocol'
        end
      end
      
      class Destination
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :ref, as: 'ref', class: Google::Apis::RunV1alpha1::ObjectReference, decorator: Google::Apis::RunV1alpha1::ObjectReference::Representation
      
          property :uri, as: 'uri'
        end
      end
      
      class DomainMapping
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :api_version, as: 'apiVersion'
          property :kind, as: 'kind'
          property :metadata, as: 'metadata', class: Google::Apis::RunV1alpha1::ObjectMeta, decorator: Google::Apis::RunV1alpha1::ObjectMeta::Representation
      
          property :spec, as: 'spec', class: Google::Apis::RunV1alpha1::DomainMappingSpec, decorator: Google::Apis::RunV1alpha1::DomainMappingSpec::Representation
      
          property :status, as: 'status', class: Google::Apis::RunV1alpha1::DomainMappingStatus, decorator: Google::Apis::RunV1alpha1::DomainMappingStatus::Representation
      
        end
      end
      
      class DomainMappingCondition
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :last_transition_time, as: 'lastTransitionTime'
          property :message, as: 'message'
          property :reason, as: 'reason'
          property :severity, as: 'severity'
          property :status, as: 'status'
          property :type, as: 'type'
        end
      end
      
      class DomainMappingSpec
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :certificate_mode, as: 'certificateMode'
          property :force_override, as: 'forceOverride'
          property :route_name, as: 'routeName'
        end
      end
      
      class DomainMappingStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :conditions, as: 'conditions', class: Google::Apis::RunV1alpha1::DomainMappingCondition, decorator: Google::Apis::RunV1alpha1::DomainMappingCondition::Representation
      
          property :mapped_route_name, as: 'mappedRouteName'
          property :observed_generation, as: 'observedGeneration'
          collection :resource_records, as: 'resourceRecords', class: Google::Apis::RunV1alpha1::ResourceRecord, decorator: Google::Apis::RunV1alpha1::ResourceRecord::Representation
      
        end
      end
      
      class Empty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class EnvFromSource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :config_map_ref, as: 'configMapRef', class: Google::Apis::RunV1alpha1::ConfigMapEnvSource, decorator: Google::Apis::RunV1alpha1::ConfigMapEnvSource::Representation
      
          property :prefix, as: 'prefix'
          property :secret_ref, as: 'secretRef', class: Google::Apis::RunV1alpha1::SecretEnvSource, decorator: Google::Apis::RunV1alpha1::SecretEnvSource::Representation
      
        end
      end
      
      class EnvVar
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :value, as: 'value'
          property :value_from, as: 'valueFrom', class: Google::Apis::RunV1alpha1::EnvVarSource, decorator: Google::Apis::RunV1alpha1::EnvVarSource::Representation
      
        end
      end
      
      class EnvVarSource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :config_map_key_ref, as: 'configMapKeyRef', class: Google::Apis::RunV1alpha1::ConfigMapKeySelector, decorator: Google::Apis::RunV1alpha1::ConfigMapKeySelector::Representation
      
          property :secret_key_ref, as: 'secretKeyRef', class: Google::Apis::RunV1alpha1::SecretKeySelector, decorator: Google::Apis::RunV1alpha1::SecretKeySelector::Representation
      
        end
      end
      
      class EventType
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :api_version, as: 'apiVersion'
          property :kind, as: 'kind'
          property :metadata, as: 'metadata', class: Google::Apis::RunV1alpha1::ObjectMeta, decorator: Google::Apis::RunV1alpha1::ObjectMeta::Representation
      
          property :spec, as: 'spec', class: Google::Apis::RunV1alpha1::EventTypeSpec, decorator: Google::Apis::RunV1alpha1::EventTypeSpec::Representation
      
        end
      end
      
      class EventTypeImporter
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :api_version, as: 'apiVersion'
          property :kind, as: 'kind'
          collection :parameters, as: 'parameters', class: Google::Apis::RunV1alpha1::EventTypeParameter, decorator: Google::Apis::RunV1alpha1::EventTypeParameter::Representation
      
        end
      end
      
      class EventTypeParameter
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :name, as: 'name'
        end
      end
      
      class EventTypeSpec
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :broker, as: 'broker'
          property :description, as: 'description'
          property :importer, as: 'importer', class: Google::Apis::RunV1alpha1::EventTypeImporter, decorator: Google::Apis::RunV1alpha1::EventTypeImporter::Representation
      
          property :schema, as: 'schema'
          property :source, as: 'source'
          property :type, as: 'type'
        end
      end
      
      class ExecAction
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :command, as: 'command'
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
      
      class HttpGetAction
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :host, as: 'host'
          collection :http_headers, as: 'httpHeaders', class: Google::Apis::RunV1alpha1::HttpHeader, decorator: Google::Apis::RunV1alpha1::HttpHeader::Representation
      
          property :path, as: 'path'
          property :port, as: 'port', class: Google::Apis::RunV1alpha1::IntOrString, decorator: Google::Apis::RunV1alpha1::IntOrString::Representation
      
          property :scheme, as: 'scheme'
        end
      end
      
      class HttpHeader
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :value, as: 'value'
        end
      end
      
      class Handler
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :exec, as: 'exec', class: Google::Apis::RunV1alpha1::ExecAction, decorator: Google::Apis::RunV1alpha1::ExecAction::Representation
      
          property :http_get, as: 'httpGet', class: Google::Apis::RunV1alpha1::HttpGetAction, decorator: Google::Apis::RunV1alpha1::HttpGetAction::Representation
      
          property :tcp_socket, as: 'tcpSocket', class: Google::Apis::RunV1alpha1::TcpSocketAction, decorator: Google::Apis::RunV1alpha1::TcpSocketAction::Representation
      
        end
      end
      
      class Initializer
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
        end
      end
      
      class Initializers
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :pending, as: 'pending', class: Google::Apis::RunV1alpha1::Initializer, decorator: Google::Apis::RunV1alpha1::Initializer::Representation
      
        end
      end
      
      class IntOrString
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :int_val, as: 'intVal'
          property :str_val, as: 'strVal'
          property :type, as: 'type'
        end
      end
      
      class KeyToPath
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :key, as: 'key'
          property :mode, as: 'mode'
          property :path, as: 'path'
        end
      end
      
      class Lifecycle
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :post_start, as: 'postStart', class: Google::Apis::RunV1alpha1::Handler, decorator: Google::Apis::RunV1alpha1::Handler::Representation
      
          property :pre_stop, as: 'preStop', class: Google::Apis::RunV1alpha1::Handler, decorator: Google::Apis::RunV1alpha1::Handler::Representation
      
        end
      end
      
      class ListAuthorizedDomainsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :domains, as: 'domains', class: Google::Apis::RunV1alpha1::AuthorizedDomain, decorator: Google::Apis::RunV1alpha1::AuthorizedDomain::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListConfigurationsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :api_version, as: 'apiVersion'
          collection :items, as: 'items', class: Google::Apis::RunV1alpha1::Configuration, decorator: Google::Apis::RunV1alpha1::Configuration::Representation
      
          property :kind, as: 'kind'
          property :metadata, as: 'metadata', class: Google::Apis::RunV1alpha1::ListMeta, decorator: Google::Apis::RunV1alpha1::ListMeta::Representation
      
          collection :unreachable, as: 'unreachable'
        end
      end
      
      class ListDomainMappingsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :api_version, as: 'apiVersion'
          collection :items, as: 'items', class: Google::Apis::RunV1alpha1::DomainMapping, decorator: Google::Apis::RunV1alpha1::DomainMapping::Representation
      
          property :kind, as: 'kind'
          property :metadata, as: 'metadata', class: Google::Apis::RunV1alpha1::ListMeta, decorator: Google::Apis::RunV1alpha1::ListMeta::Representation
      
          collection :unreachable, as: 'unreachable'
        end
      end
      
      class ListEventTypesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :api_version, as: 'apiVersion'
          collection :items, as: 'items', class: Google::Apis::RunV1alpha1::EventType, decorator: Google::Apis::RunV1alpha1::EventType::Representation
      
          property :kind, as: 'kind'
          property :metadata, as: 'metadata', class: Google::Apis::RunV1alpha1::ListMeta, decorator: Google::Apis::RunV1alpha1::ListMeta::Representation
      
          collection :unreachable, as: 'unreachable'
        end
      end
      
      class ListLocationsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :locations, as: 'locations', class: Google::Apis::RunV1alpha1::Location, decorator: Google::Apis::RunV1alpha1::Location::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListMeta
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :continue, as: 'continue'
          property :resource_version, as: 'resourceVersion'
          property :self_link, as: 'selfLink'
        end
      end
      
      class ListPubSubsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :api_version, as: 'apiVersion'
          collection :items, as: 'items', class: Google::Apis::RunV1alpha1::PubSub, decorator: Google::Apis::RunV1alpha1::PubSub::Representation
      
          property :kind, as: 'kind'
          property :metadata, as: 'metadata', class: Google::Apis::RunV1alpha1::ListMeta, decorator: Google::Apis::RunV1alpha1::ListMeta::Representation
      
          collection :unreachable, as: 'unreachable'
        end
      end
      
      class ListRevisionsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :api_version, as: 'apiVersion'
          collection :items, as: 'items', class: Google::Apis::RunV1alpha1::Revision, decorator: Google::Apis::RunV1alpha1::Revision::Representation
      
          property :kind, as: 'kind'
          property :metadata, as: 'metadata', class: Google::Apis::RunV1alpha1::ListMeta, decorator: Google::Apis::RunV1alpha1::ListMeta::Representation
      
          collection :unreachable, as: 'unreachable'
        end
      end
      
      class ListRoutesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :api_version, as: 'apiVersion'
          collection :items, as: 'items', class: Google::Apis::RunV1alpha1::Route, decorator: Google::Apis::RunV1alpha1::Route::Representation
      
          property :kind, as: 'kind'
          property :metadata, as: 'metadata', class: Google::Apis::RunV1alpha1::ListMeta, decorator: Google::Apis::RunV1alpha1::ListMeta::Representation
      
          collection :unreachable, as: 'unreachable'
        end
      end
      
      class ListServicesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :api_version, as: 'apiVersion'
          collection :items, as: 'items', class: Google::Apis::RunV1alpha1::Service, decorator: Google::Apis::RunV1alpha1::Service::Representation
      
          property :kind, as: 'kind'
          property :metadata, as: 'metadata', class: Google::Apis::RunV1alpha1::ListMeta, decorator: Google::Apis::RunV1alpha1::ListMeta::Representation
      
          collection :unreachable, as: 'unreachable'
        end
      end
      
      class ListTriggersResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :api_version, as: 'apiVersion'
          collection :items, as: 'items', class: Google::Apis::RunV1alpha1::Trigger, decorator: Google::Apis::RunV1alpha1::Trigger::Representation
      
          property :kind, as: 'kind'
          property :metadata, as: 'metadata', class: Google::Apis::RunV1alpha1::ListMeta, decorator: Google::Apis::RunV1alpha1::ListMeta::Representation
      
          collection :unreachable, as: 'unreachable'
        end
      end
      
      class LocalObjectReference
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
        end
      end
      
      class Location
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :display_name, as: 'displayName'
          hash :labels, as: 'labels'
          property :location_id, as: 'locationId'
          hash :metadata, as: 'metadata'
          property :name, as: 'name'
        end
      end
      
      class ObjectMeta
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :annotations, as: 'annotations'
          property :cluster_name, as: 'clusterName'
          property :creation_timestamp, as: 'creationTimestamp'
          property :deletion_grace_period_seconds, as: 'deletionGracePeriodSeconds'
          property :deletion_timestamp, as: 'deletionTimestamp'
          collection :finalizers, as: 'finalizers'
          property :generate_name, as: 'generateName'
          property :generation, as: 'generation'
          property :initializers, as: 'initializers', class: Google::Apis::RunV1alpha1::Initializers, decorator: Google::Apis::RunV1alpha1::Initializers::Representation
      
          hash :labels, as: 'labels'
          property :name, as: 'name'
          property :namespace, as: 'namespace'
          collection :owner_references, as: 'ownerReferences', class: Google::Apis::RunV1alpha1::OwnerReference, decorator: Google::Apis::RunV1alpha1::OwnerReference::Representation
      
          property :resource_version, as: 'resourceVersion'
          property :self_link, as: 'selfLink'
          property :uid, as: 'uid'
        end
      end
      
      class ObjectReference
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :api_version, as: 'apiVersion'
          property :field_path, as: 'fieldPath'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :namespace, as: 'namespace'
          property :resource_version, as: 'resourceVersion'
          property :uid, as: 'uid'
        end
      end
      
      class OwnerReference
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :api_version, as: 'apiVersion'
          property :block_owner_deletion, as: 'blockOwnerDeletion'
          property :controller, as: 'controller'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :uid, as: 'uid'
        end
      end
      
      class Policy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :audit_configs, as: 'auditConfigs', class: Google::Apis::RunV1alpha1::AuditConfig, decorator: Google::Apis::RunV1alpha1::AuditConfig::Representation
      
          collection :bindings, as: 'bindings', class: Google::Apis::RunV1alpha1::Binding, decorator: Google::Apis::RunV1alpha1::Binding::Representation
      
          property :etag, :base64 => true, as: 'etag'
          property :version, as: 'version'
        end
      end
      
      class Probe
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :failure_threshold, as: 'failureThreshold'
          property :handler, as: 'handler', class: Google::Apis::RunV1alpha1::Handler, decorator: Google::Apis::RunV1alpha1::Handler::Representation
      
          property :initial_delay_seconds, as: 'initialDelaySeconds'
          property :period_seconds, as: 'periodSeconds'
          property :success_threshold, as: 'successThreshold'
          property :timeout_seconds, as: 'timeoutSeconds'
        end
      end
      
      class PubSub
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :api_version, as: 'apiVersion'
          property :kind, as: 'kind'
          property :metadata, as: 'metadata', class: Google::Apis::RunV1alpha1::ObjectMeta, decorator: Google::Apis::RunV1alpha1::ObjectMeta::Representation
      
          property :spec, as: 'spec', class: Google::Apis::RunV1alpha1::PubSubSpec, decorator: Google::Apis::RunV1alpha1::PubSubSpec::Representation
      
          property :status, as: 'status', class: Google::Apis::RunV1alpha1::PubSubStatus, decorator: Google::Apis::RunV1alpha1::PubSubStatus::Representation
      
        end
      end
      
      class PubSubSpec
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :ack_deadline, as: 'ackDeadline'
          property :ce_overrides, as: 'ceOverrides', class: Google::Apis::RunV1alpha1::CloudEventOverrides, decorator: Google::Apis::RunV1alpha1::CloudEventOverrides::Representation
      
          property :project, as: 'project'
          property :pubsub_secret, as: 'pubsubSecret', class: Google::Apis::RunV1alpha1::SecretKeySelector, decorator: Google::Apis::RunV1alpha1::SecretKeySelector::Representation
      
          property :retain_acked_messages, as: 'retainAckedMessages'
          property :retention_duration, as: 'retentionDuration'
          property :secret, as: 'secret', class: Google::Apis::RunV1alpha1::SecretKeySelector, decorator: Google::Apis::RunV1alpha1::SecretKeySelector::Representation
      
          property :sink, as: 'sink', class: Google::Apis::RunV1alpha1::Destination, decorator: Google::Apis::RunV1alpha1::Destination::Representation
      
          property :topic, as: 'topic'
        end
      end
      
      class PubSubStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :conditions, as: 'conditions', class: Google::Apis::RunV1alpha1::Condition, decorator: Google::Apis::RunV1alpha1::Condition::Representation
      
          property :observed_generation, as: 'observedGeneration'
          property :sink_uri, as: 'sinkUri'
        end
      end
      
      class Quantity
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :string, as: 'string'
        end
      end
      
      class ResourceRecord
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :rrdata, as: 'rrdata'
          property :type, as: 'type'
        end
      end
      
      class ResourceRequirements
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :limits, as: 'limits'
          hash :limits_in_map, as: 'limitsInMap', class: Google::Apis::RunV1alpha1::Quantity, decorator: Google::Apis::RunV1alpha1::Quantity::Representation
      
          hash :requests, as: 'requests'
          hash :requests_in_map, as: 'requestsInMap', class: Google::Apis::RunV1alpha1::Quantity, decorator: Google::Apis::RunV1alpha1::Quantity::Representation
      
        end
      end
      
      class Revision
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :api_version, as: 'apiVersion'
          property :kind, as: 'kind'
          property :metadata, as: 'metadata', class: Google::Apis::RunV1alpha1::ObjectMeta, decorator: Google::Apis::RunV1alpha1::ObjectMeta::Representation
      
          property :spec, as: 'spec', class: Google::Apis::RunV1alpha1::RevisionSpec, decorator: Google::Apis::RunV1alpha1::RevisionSpec::Representation
      
          property :status, as: 'status', class: Google::Apis::RunV1alpha1::RevisionStatus, decorator: Google::Apis::RunV1alpha1::RevisionStatus::Representation
      
        end
      end
      
      class RevisionCondition
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :last_transition_time, as: 'lastTransitionTime'
          property :message, as: 'message'
          property :reason, as: 'reason'
          property :severity, as: 'severity'
          property :status, as: 'status'
          property :type, as: 'type'
        end
      end
      
      class RevisionSpec
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :concurrency_model, as: 'concurrencyModel'
          property :container, as: 'container', class: Google::Apis::RunV1alpha1::Container, decorator: Google::Apis::RunV1alpha1::Container::Representation
      
          property :container_concurrency, as: 'containerConcurrency'
          collection :containers, as: 'containers', class: Google::Apis::RunV1alpha1::Container, decorator: Google::Apis::RunV1alpha1::Container::Representation
      
          property :generation, as: 'generation'
          property :service_account_name, as: 'serviceAccountName'
          property :serving_state, as: 'servingState'
          property :timeout_seconds, as: 'timeoutSeconds'
          collection :volumes, as: 'volumes', class: Google::Apis::RunV1alpha1::Volume, decorator: Google::Apis::RunV1alpha1::Volume::Representation
      
        end
      end
      
      class RevisionStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :conditions, as: 'conditions', class: Google::Apis::RunV1alpha1::RevisionCondition, decorator: Google::Apis::RunV1alpha1::RevisionCondition::Representation
      
          property :image_digest, as: 'imageDigest'
          property :log_url, as: 'logUrl'
          property :observed_generation, as: 'observedGeneration'
          property :service_name, as: 'serviceName'
        end
      end
      
      class RevisionTemplate
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :metadata, as: 'metadata', class: Google::Apis::RunV1alpha1::ObjectMeta, decorator: Google::Apis::RunV1alpha1::ObjectMeta::Representation
      
          property :spec, as: 'spec', class: Google::Apis::RunV1alpha1::RevisionSpec, decorator: Google::Apis::RunV1alpha1::RevisionSpec::Representation
      
        end
      end
      
      class Route
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :api_version, as: 'apiVersion'
          property :kind, as: 'kind'
          property :metadata, as: 'metadata', class: Google::Apis::RunV1alpha1::ObjectMeta, decorator: Google::Apis::RunV1alpha1::ObjectMeta::Representation
      
          property :spec, as: 'spec', class: Google::Apis::RunV1alpha1::RouteSpec, decorator: Google::Apis::RunV1alpha1::RouteSpec::Representation
      
          property :status, as: 'status', class: Google::Apis::RunV1alpha1::RouteStatus, decorator: Google::Apis::RunV1alpha1::RouteStatus::Representation
      
        end
      end
      
      class RouteCondition
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :last_transition_time, as: 'lastTransitionTime'
          property :message, as: 'message'
          property :reason, as: 'reason'
          property :severity, as: 'severity'
          property :status, as: 'status'
          property :type, as: 'type'
        end
      end
      
      class RouteSpec
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :generation, as: 'generation'
          collection :traffic, as: 'traffic', class: Google::Apis::RunV1alpha1::TrafficTarget, decorator: Google::Apis::RunV1alpha1::TrafficTarget::Representation
      
        end
      end
      
      class RouteStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :address, as: 'address', class: Google::Apis::RunV1alpha1::Addressable, decorator: Google::Apis::RunV1alpha1::Addressable::Representation
      
          collection :conditions, as: 'conditions', class: Google::Apis::RunV1alpha1::RouteCondition, decorator: Google::Apis::RunV1alpha1::RouteCondition::Representation
      
          property :domain, as: 'domain'
          property :domain_internal, as: 'domainInternal'
          property :observed_generation, as: 'observedGeneration'
          collection :traffic, as: 'traffic', class: Google::Apis::RunV1alpha1::TrafficTarget, decorator: Google::Apis::RunV1alpha1::TrafficTarget::Representation
      
          property :url, as: 'url'
        end
      end
      
      class SeLinuxOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :level, as: 'level'
          property :role, as: 'role'
          property :type, as: 'type'
          property :user, as: 'user'
        end
      end
      
      class SecretEnvSource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :local_object_reference, as: 'localObjectReference', class: Google::Apis::RunV1alpha1::LocalObjectReference, decorator: Google::Apis::RunV1alpha1::LocalObjectReference::Representation
      
          property :name, as: 'name'
          property :optional, as: 'optional'
        end
      end
      
      class SecretKeySelector
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :key, as: 'key'
          property :local_object_reference, as: 'localObjectReference', class: Google::Apis::RunV1alpha1::LocalObjectReference, decorator: Google::Apis::RunV1alpha1::LocalObjectReference::Representation
      
          property :name, as: 'name'
          property :optional, as: 'optional'
        end
      end
      
      class SecretVolumeSource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :default_mode, as: 'defaultMode'
          collection :items, as: 'items', class: Google::Apis::RunV1alpha1::KeyToPath, decorator: Google::Apis::RunV1alpha1::KeyToPath::Representation
      
          property :optional, as: 'optional'
          property :secret_name, as: 'secretName'
        end
      end
      
      class SecurityContext
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :allow_privilege_escalation, as: 'allowPrivilegeEscalation'
          property :capabilities, as: 'capabilities', class: Google::Apis::RunV1alpha1::Capabilities, decorator: Google::Apis::RunV1alpha1::Capabilities::Representation
      
          property :privileged, as: 'privileged'
          property :read_only_root_filesystem, as: 'readOnlyRootFilesystem'
          property :run_as_group, as: 'runAsGroup'
          property :run_as_non_root, as: 'runAsNonRoot'
          property :run_as_user, as: 'runAsUser'
          property :se_linux_options, as: 'seLinuxOptions', class: Google::Apis::RunV1alpha1::SeLinuxOptions, decorator: Google::Apis::RunV1alpha1::SeLinuxOptions::Representation
      
        end
      end
      
      class Service
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :api_version, as: 'apiVersion'
          property :kind, as: 'kind'
          property :metadata, as: 'metadata', class: Google::Apis::RunV1alpha1::ObjectMeta, decorator: Google::Apis::RunV1alpha1::ObjectMeta::Representation
      
          property :spec, as: 'spec', class: Google::Apis::RunV1alpha1::ServiceSpec, decorator: Google::Apis::RunV1alpha1::ServiceSpec::Representation
      
          property :status, as: 'status', class: Google::Apis::RunV1alpha1::ServiceStatus, decorator: Google::Apis::RunV1alpha1::ServiceStatus::Representation
      
        end
      end
      
      class ServiceCondition
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :last_transition_time, as: 'lastTransitionTime'
          property :message, as: 'message'
          property :reason, as: 'reason'
          property :severity, as: 'severity'
          property :status, as: 'status'
          property :type, as: 'type'
        end
      end
      
      class ServiceSpec
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :generation, as: 'generation'
          property :manual, as: 'manual', class: Google::Apis::RunV1alpha1::ServiceSpecManualType, decorator: Google::Apis::RunV1alpha1::ServiceSpecManualType::Representation
      
          property :pinned, as: 'pinned', class: Google::Apis::RunV1alpha1::ServiceSpecPinnedType, decorator: Google::Apis::RunV1alpha1::ServiceSpecPinnedType::Representation
      
          property :release, as: 'release', class: Google::Apis::RunV1alpha1::ServiceSpecReleaseType, decorator: Google::Apis::RunV1alpha1::ServiceSpecReleaseType::Representation
      
          property :run_latest, as: 'runLatest', class: Google::Apis::RunV1alpha1::ServiceSpecRunLatest, decorator: Google::Apis::RunV1alpha1::ServiceSpecRunLatest::Representation
      
          property :template, as: 'template', class: Google::Apis::RunV1alpha1::RevisionTemplate, decorator: Google::Apis::RunV1alpha1::RevisionTemplate::Representation
      
          collection :traffic, as: 'traffic', class: Google::Apis::RunV1alpha1::TrafficTarget, decorator: Google::Apis::RunV1alpha1::TrafficTarget::Representation
      
        end
      end
      
      class ServiceSpecManualType
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class ServiceSpecPinnedType
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :configuration, as: 'configuration', class: Google::Apis::RunV1alpha1::ConfigurationSpec, decorator: Google::Apis::RunV1alpha1::ConfigurationSpec::Representation
      
          property :revision_name, as: 'revisionName'
        end
      end
      
      class ServiceSpecReleaseType
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :configuration, as: 'configuration', class: Google::Apis::RunV1alpha1::ConfigurationSpec, decorator: Google::Apis::RunV1alpha1::ConfigurationSpec::Representation
      
          collection :revisions, as: 'revisions'
          property :rollout_percent, as: 'rolloutPercent'
        end
      end
      
      class ServiceSpecRunLatest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :configuration, as: 'configuration', class: Google::Apis::RunV1alpha1::ConfigurationSpec, decorator: Google::Apis::RunV1alpha1::ConfigurationSpec::Representation
      
        end
      end
      
      class ServiceStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :address, as: 'address', class: Google::Apis::RunV1alpha1::Addressable, decorator: Google::Apis::RunV1alpha1::Addressable::Representation
      
          collection :conditions, as: 'conditions', class: Google::Apis::RunV1alpha1::ServiceCondition, decorator: Google::Apis::RunV1alpha1::ServiceCondition::Representation
      
          property :domain, as: 'domain'
          property :latest_created_revision_name, as: 'latestCreatedRevisionName'
          property :latest_ready_revision_name, as: 'latestReadyRevisionName'
          property :observed_generation, as: 'observedGeneration'
          collection :traffic, as: 'traffic', class: Google::Apis::RunV1alpha1::TrafficTarget, decorator: Google::Apis::RunV1alpha1::TrafficTarget::Representation
      
          property :url, as: 'url'
        end
      end
      
      class SetIamPolicyRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :policy, as: 'policy', class: Google::Apis::RunV1alpha1::Policy, decorator: Google::Apis::RunV1alpha1::Policy::Representation
      
          property :update_mask, as: 'updateMask'
        end
      end
      
      class SubscriberSpec
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :ref, as: 'ref', class: Google::Apis::RunV1alpha1::ObjectReference, decorator: Google::Apis::RunV1alpha1::ObjectReference::Representation
      
          property :uri, as: 'uri'
        end
      end
      
      class TcpSocketAction
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :host, as: 'host'
          property :port, as: 'port', class: Google::Apis::RunV1alpha1::IntOrString, decorator: Google::Apis::RunV1alpha1::IntOrString::Representation
      
        end
      end
      
      class TestIamPermissionsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :permissions, as: 'permissions'
        end
      end
      
      class TestIamPermissionsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :permissions, as: 'permissions'
        end
      end
      
      class TrafficTarget
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :configuration_name, as: 'configurationName'
          property :latest_revision, as: 'latestRevision'
          property :name, as: 'name'
          property :percent, as: 'percent'
          property :revision_name, as: 'revisionName'
          property :tag, as: 'tag'
          property :url, as: 'url'
        end
      end
      
      class Trigger
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :api_version, as: 'apiVersion'
          property :kind, as: 'kind'
          property :metadata, as: 'metadata', class: Google::Apis::RunV1alpha1::ObjectMeta, decorator: Google::Apis::RunV1alpha1::ObjectMeta::Representation
      
          property :spec, as: 'spec', class: Google::Apis::RunV1alpha1::TriggerSpec, decorator: Google::Apis::RunV1alpha1::TriggerSpec::Representation
      
          property :status, as: 'status', class: Google::Apis::RunV1alpha1::TriggerStatus, decorator: Google::Apis::RunV1alpha1::TriggerStatus::Representation
      
        end
      end
      
      class TriggerCondition
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :last_transition_time, as: 'lastTransitionTime'
          property :message, as: 'message'
          property :reason, as: 'reason'
          property :severity, as: 'severity'
          property :status, as: 'status'
          property :type, as: 'type'
        end
      end
      
      class TriggerFilter
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :attributes, as: 'attributes'
          property :source_and_type, as: 'sourceAndType', class: Google::Apis::RunV1alpha1::TriggerFilterSourceAndType, decorator: Google::Apis::RunV1alpha1::TriggerFilterSourceAndType::Representation
      
        end
      end
      
      class TriggerFilterSourceAndType
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :source, as: 'source'
          property :type, as: 'type'
        end
      end
      
      class TriggerImporterSpec
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :arguments, as: 'arguments'
          property :event_type_name, as: 'eventTypeName'
        end
      end
      
      class TriggerSpec
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :broker, as: 'broker'
          property :filter, as: 'filter', class: Google::Apis::RunV1alpha1::TriggerFilter, decorator: Google::Apis::RunV1alpha1::TriggerFilter::Representation
      
          collection :importers, as: 'importers', class: Google::Apis::RunV1alpha1::TriggerImporterSpec, decorator: Google::Apis::RunV1alpha1::TriggerImporterSpec::Representation
      
          property :subscriber, as: 'subscriber', class: Google::Apis::RunV1alpha1::SubscriberSpec, decorator: Google::Apis::RunV1alpha1::SubscriberSpec::Representation
      
        end
      end
      
      class TriggerStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :conditions, as: 'conditions', class: Google::Apis::RunV1alpha1::TriggerCondition, decorator: Google::Apis::RunV1alpha1::TriggerCondition::Representation
      
          property :observed_generation, as: 'observedGeneration'
          property :subscriber_uri, as: 'subscriberUri'
        end
      end
      
      class Volume
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :config_map, as: 'configMap', class: Google::Apis::RunV1alpha1::ConfigMapVolumeSource, decorator: Google::Apis::RunV1alpha1::ConfigMapVolumeSource::Representation
      
          property :name, as: 'name'
          property :secret, as: 'secret', class: Google::Apis::RunV1alpha1::SecretVolumeSource, decorator: Google::Apis::RunV1alpha1::SecretVolumeSource::Representation
      
        end
      end
      
      class VolumeDevice
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :device_path, as: 'devicePath'
          property :name, as: 'name'
        end
      end
      
      class VolumeMount
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :mount_path, as: 'mountPath'
          property :mount_propagation, as: 'mountPropagation'
          property :name, as: 'name'
          property :read_only, as: 'readOnly'
          property :sub_path, as: 'subPath'
        end
      end
    end
  end
end
