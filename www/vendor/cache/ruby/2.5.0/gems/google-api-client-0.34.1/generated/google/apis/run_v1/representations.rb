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
    module RunV1
      
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
      
      class AutoDomainMapping
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AutoDomainMappingSpec
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AutoDomainMappingStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Binding
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
      
      class DomainMapping
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
      
      class ExecAction
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Expr
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudRunV1Condition
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
      
      class IntOrString
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class KeyToPath
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListAuthorizedDomainsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListAutoDomainMappingsResponse
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
      
      class ListLocationsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListMeta
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
      
      class RouteSpec
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RouteStatus
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
      
      class ServiceSpec
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
      
      class Status
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class StatusCause
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class StatusDetails
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
      
      class Volume
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
          property :url, as: 'url'
        end
      end
      
      class AuditConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :audit_log_configs, as: 'auditLogConfigs', class: Google::Apis::RunV1::AuditLogConfig, decorator: Google::Apis::RunV1::AuditLogConfig::Representation
      
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
      
      class AutoDomainMapping
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :api_version, as: 'apiVersion'
          property :kind, as: 'kind'
          property :metadata, as: 'metadata', class: Google::Apis::RunV1::ObjectMeta, decorator: Google::Apis::RunV1::ObjectMeta::Representation
      
          property :spec, as: 'spec', class: Google::Apis::RunV1::AutoDomainMappingSpec, decorator: Google::Apis::RunV1::AutoDomainMappingSpec::Representation
      
          property :status, as: 'status', class: Google::Apis::RunV1::AutoDomainMappingStatus, decorator: Google::Apis::RunV1::AutoDomainMappingStatus::Representation
      
        end
      end
      
      class AutoDomainMappingSpec
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :certificate_mode, as: 'certificateMode'
          property :expansion_type, as: 'expansionType'
          property :force_override, as: 'forceOverride'
        end
      end
      
      class AutoDomainMappingStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :conditions, as: 'conditions', class: Google::Apis::RunV1::GoogleCloudRunV1Condition, decorator: Google::Apis::RunV1::GoogleCloudRunV1Condition::Representation
      
          property :observed_generation, as: 'observedGeneration'
          collection :resource_records, as: 'resourceRecords', class: Google::Apis::RunV1::ResourceRecord, decorator: Google::Apis::RunV1::ResourceRecord::Representation
      
        end
      end
      
      class Binding
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :condition, as: 'condition', class: Google::Apis::RunV1::Expr, decorator: Google::Apis::RunV1::Expr::Representation
      
          collection :members, as: 'members'
          property :role, as: 'role'
        end
      end
      
      class ConfigMapEnvSource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :local_object_reference, as: 'localObjectReference', class: Google::Apis::RunV1::LocalObjectReference, decorator: Google::Apis::RunV1::LocalObjectReference::Representation
      
          property :name, as: 'name'
          property :optional, as: 'optional'
        end
      end
      
      class ConfigMapKeySelector
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :key, as: 'key'
          property :local_object_reference, as: 'localObjectReference', class: Google::Apis::RunV1::LocalObjectReference, decorator: Google::Apis::RunV1::LocalObjectReference::Representation
      
          property :name, as: 'name'
          property :optional, as: 'optional'
        end
      end
      
      class ConfigMapVolumeSource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :default_mode, as: 'defaultMode'
          collection :items, as: 'items', class: Google::Apis::RunV1::KeyToPath, decorator: Google::Apis::RunV1::KeyToPath::Representation
      
          property :name, as: 'name'
          property :optional, as: 'optional'
        end
      end
      
      class Configuration
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :api_version, as: 'apiVersion'
          property :kind, as: 'kind'
          property :metadata, as: 'metadata', class: Google::Apis::RunV1::ObjectMeta, decorator: Google::Apis::RunV1::ObjectMeta::Representation
      
          property :spec, as: 'spec', class: Google::Apis::RunV1::ConfigurationSpec, decorator: Google::Apis::RunV1::ConfigurationSpec::Representation
      
          property :status, as: 'status', class: Google::Apis::RunV1::ConfigurationStatus, decorator: Google::Apis::RunV1::ConfigurationStatus::Representation
      
        end
      end
      
      class ConfigurationSpec
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :template, as: 'template', class: Google::Apis::RunV1::RevisionTemplate, decorator: Google::Apis::RunV1::RevisionTemplate::Representation
      
        end
      end
      
      class ConfigurationStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :conditions, as: 'conditions', class: Google::Apis::RunV1::GoogleCloudRunV1Condition, decorator: Google::Apis::RunV1::GoogleCloudRunV1Condition::Representation
      
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
          collection :env, as: 'env', class: Google::Apis::RunV1::EnvVar, decorator: Google::Apis::RunV1::EnvVar::Representation
      
          collection :env_from, as: 'envFrom', class: Google::Apis::RunV1::EnvFromSource, decorator: Google::Apis::RunV1::EnvFromSource::Representation
      
          property :image, as: 'image'
          property :image_pull_policy, as: 'imagePullPolicy'
          property :liveness_probe, as: 'livenessProbe', class: Google::Apis::RunV1::Probe, decorator: Google::Apis::RunV1::Probe::Representation
      
          property :name, as: 'name'
          collection :ports, as: 'ports', class: Google::Apis::RunV1::ContainerPort, decorator: Google::Apis::RunV1::ContainerPort::Representation
      
          property :readiness_probe, as: 'readinessProbe', class: Google::Apis::RunV1::Probe, decorator: Google::Apis::RunV1::Probe::Representation
      
          property :resources, as: 'resources', class: Google::Apis::RunV1::ResourceRequirements, decorator: Google::Apis::RunV1::ResourceRequirements::Representation
      
          property :security_context, as: 'securityContext', class: Google::Apis::RunV1::SecurityContext, decorator: Google::Apis::RunV1::SecurityContext::Representation
      
          property :termination_message_path, as: 'terminationMessagePath'
          property :termination_message_policy, as: 'terminationMessagePolicy'
          collection :volume_mounts, as: 'volumeMounts', class: Google::Apis::RunV1::VolumeMount, decorator: Google::Apis::RunV1::VolumeMount::Representation
      
          property :working_dir, as: 'workingDir'
        end
      end
      
      class ContainerPort
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :container_port, as: 'containerPort'
          property :name, as: 'name'
          property :protocol, as: 'protocol'
        end
      end
      
      class DomainMapping
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :api_version, as: 'apiVersion'
          property :kind, as: 'kind'
          property :metadata, as: 'metadata', class: Google::Apis::RunV1::ObjectMeta, decorator: Google::Apis::RunV1::ObjectMeta::Representation
      
          property :spec, as: 'spec', class: Google::Apis::RunV1::DomainMappingSpec, decorator: Google::Apis::RunV1::DomainMappingSpec::Representation
      
          property :status, as: 'status', class: Google::Apis::RunV1::DomainMappingStatus, decorator: Google::Apis::RunV1::DomainMappingStatus::Representation
      
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
          collection :conditions, as: 'conditions', class: Google::Apis::RunV1::GoogleCloudRunV1Condition, decorator: Google::Apis::RunV1::GoogleCloudRunV1Condition::Representation
      
          property :mapped_route_name, as: 'mappedRouteName'
          property :observed_generation, as: 'observedGeneration'
          collection :resource_records, as: 'resourceRecords', class: Google::Apis::RunV1::ResourceRecord, decorator: Google::Apis::RunV1::ResourceRecord::Representation
      
        end
      end
      
      class EnvFromSource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :config_map_ref, as: 'configMapRef', class: Google::Apis::RunV1::ConfigMapEnvSource, decorator: Google::Apis::RunV1::ConfigMapEnvSource::Representation
      
          property :prefix, as: 'prefix'
          property :secret_ref, as: 'secretRef', class: Google::Apis::RunV1::SecretEnvSource, decorator: Google::Apis::RunV1::SecretEnvSource::Representation
      
        end
      end
      
      class EnvVar
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :value, as: 'value'
          property :value_from, as: 'valueFrom', class: Google::Apis::RunV1::EnvVarSource, decorator: Google::Apis::RunV1::EnvVarSource::Representation
      
        end
      end
      
      class EnvVarSource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :config_map_key_ref, as: 'configMapKeyRef', class: Google::Apis::RunV1::ConfigMapKeySelector, decorator: Google::Apis::RunV1::ConfigMapKeySelector::Representation
      
          property :secret_key_ref, as: 'secretKeyRef', class: Google::Apis::RunV1::SecretKeySelector, decorator: Google::Apis::RunV1::SecretKeySelector::Representation
      
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
      
      class GoogleCloudRunV1Condition
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
      
      class HttpGetAction
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :host, as: 'host'
          collection :http_headers, as: 'httpHeaders', class: Google::Apis::RunV1::HttpHeader, decorator: Google::Apis::RunV1::HttpHeader::Representation
      
          property :path, as: 'path'
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
          property :exec, as: 'exec', class: Google::Apis::RunV1::ExecAction, decorator: Google::Apis::RunV1::ExecAction::Representation
      
          property :http_get, as: 'httpGet', class: Google::Apis::RunV1::HttpGetAction, decorator: Google::Apis::RunV1::HttpGetAction::Representation
      
          property :tcp_socket, as: 'tcpSocket', class: Google::Apis::RunV1::TcpSocketAction, decorator: Google::Apis::RunV1::TcpSocketAction::Representation
      
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
      
      class ListAuthorizedDomainsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :domains, as: 'domains', class: Google::Apis::RunV1::AuthorizedDomain, decorator: Google::Apis::RunV1::AuthorizedDomain::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListAutoDomainMappingsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :api_version, as: 'apiVersion'
          collection :items, as: 'items', class: Google::Apis::RunV1::AutoDomainMapping, decorator: Google::Apis::RunV1::AutoDomainMapping::Representation
      
          property :kind, as: 'kind'
          property :metadata, as: 'metadata', class: Google::Apis::RunV1::ListMeta, decorator: Google::Apis::RunV1::ListMeta::Representation
      
          collection :unreachable, as: 'unreachable'
        end
      end
      
      class ListConfigurationsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :api_version, as: 'apiVersion'
          collection :items, as: 'items', class: Google::Apis::RunV1::Configuration, decorator: Google::Apis::RunV1::Configuration::Representation
      
          property :kind, as: 'kind'
          property :metadata, as: 'metadata', class: Google::Apis::RunV1::ListMeta, decorator: Google::Apis::RunV1::ListMeta::Representation
      
          collection :unreachable, as: 'unreachable'
        end
      end
      
      class ListDomainMappingsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :api_version, as: 'apiVersion'
          collection :items, as: 'items', class: Google::Apis::RunV1::DomainMapping, decorator: Google::Apis::RunV1::DomainMapping::Representation
      
          property :kind, as: 'kind'
          property :metadata, as: 'metadata', class: Google::Apis::RunV1::ListMeta, decorator: Google::Apis::RunV1::ListMeta::Representation
      
          collection :unreachable, as: 'unreachable'
        end
      end
      
      class ListLocationsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :locations, as: 'locations', class: Google::Apis::RunV1::Location, decorator: Google::Apis::RunV1::Location::Representation
      
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
      
      class ListRevisionsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :api_version, as: 'apiVersion'
          collection :items, as: 'items', class: Google::Apis::RunV1::Revision, decorator: Google::Apis::RunV1::Revision::Representation
      
          property :kind, as: 'kind'
          property :metadata, as: 'metadata', class: Google::Apis::RunV1::ListMeta, decorator: Google::Apis::RunV1::ListMeta::Representation
      
          collection :unreachable, as: 'unreachable'
        end
      end
      
      class ListRoutesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :api_version, as: 'apiVersion'
          collection :items, as: 'items', class: Google::Apis::RunV1::Route, decorator: Google::Apis::RunV1::Route::Representation
      
          property :kind, as: 'kind'
          property :metadata, as: 'metadata', class: Google::Apis::RunV1::ListMeta, decorator: Google::Apis::RunV1::ListMeta::Representation
      
          collection :unreachable, as: 'unreachable'
        end
      end
      
      class ListServicesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :api_version, as: 'apiVersion'
          collection :items, as: 'items', class: Google::Apis::RunV1::Service, decorator: Google::Apis::RunV1::Service::Representation
      
          property :kind, as: 'kind'
          property :metadata, as: 'metadata', class: Google::Apis::RunV1::ListMeta, decorator: Google::Apis::RunV1::ListMeta::Representation
      
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
          hash :labels, as: 'labels'
          property :name, as: 'name'
          property :namespace, as: 'namespace'
          collection :owner_references, as: 'ownerReferences', class: Google::Apis::RunV1::OwnerReference, decorator: Google::Apis::RunV1::OwnerReference::Representation
      
          property :resource_version, as: 'resourceVersion'
          property :self_link, as: 'selfLink'
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
          collection :audit_configs, as: 'auditConfigs', class: Google::Apis::RunV1::AuditConfig, decorator: Google::Apis::RunV1::AuditConfig::Representation
      
          collection :bindings, as: 'bindings', class: Google::Apis::RunV1::Binding, decorator: Google::Apis::RunV1::Binding::Representation
      
          property :etag, :base64 => true, as: 'etag'
          property :version, as: 'version'
        end
      end
      
      class Probe
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :failure_threshold, as: 'failureThreshold'
          property :handler, as: 'handler', class: Google::Apis::RunV1::Handler, decorator: Google::Apis::RunV1::Handler::Representation
      
          property :initial_delay_seconds, as: 'initialDelaySeconds'
          property :period_seconds, as: 'periodSeconds'
          property :success_threshold, as: 'successThreshold'
          property :timeout_seconds, as: 'timeoutSeconds'
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
          hash :requests, as: 'requests'
        end
      end
      
      class Revision
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :api_version, as: 'apiVersion'
          property :kind, as: 'kind'
          property :metadata, as: 'metadata', class: Google::Apis::RunV1::ObjectMeta, decorator: Google::Apis::RunV1::ObjectMeta::Representation
      
          property :spec, as: 'spec', class: Google::Apis::RunV1::RevisionSpec, decorator: Google::Apis::RunV1::RevisionSpec::Representation
      
          property :status, as: 'status', class: Google::Apis::RunV1::RevisionStatus, decorator: Google::Apis::RunV1::RevisionStatus::Representation
      
        end
      end
      
      class RevisionSpec
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :container_concurrency, as: 'containerConcurrency'
          collection :containers, as: 'containers', class: Google::Apis::RunV1::Container, decorator: Google::Apis::RunV1::Container::Representation
      
          property :service_account_name, as: 'serviceAccountName'
          property :timeout_seconds, as: 'timeoutSeconds'
          collection :volumes, as: 'volumes', class: Google::Apis::RunV1::Volume, decorator: Google::Apis::RunV1::Volume::Representation
      
        end
      end
      
      class RevisionStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :conditions, as: 'conditions', class: Google::Apis::RunV1::GoogleCloudRunV1Condition, decorator: Google::Apis::RunV1::GoogleCloudRunV1Condition::Representation
      
          property :image_digest, as: 'imageDigest'
          property :log_url, as: 'logUrl'
          property :observed_generation, as: 'observedGeneration'
          property :service_name, as: 'serviceName'
        end
      end
      
      class RevisionTemplate
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :metadata, as: 'metadata', class: Google::Apis::RunV1::ObjectMeta, decorator: Google::Apis::RunV1::ObjectMeta::Representation
      
          property :spec, as: 'spec', class: Google::Apis::RunV1::RevisionSpec, decorator: Google::Apis::RunV1::RevisionSpec::Representation
      
        end
      end
      
      class Route
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :api_version, as: 'apiVersion'
          property :kind, as: 'kind'
          property :metadata, as: 'metadata', class: Google::Apis::RunV1::ObjectMeta, decorator: Google::Apis::RunV1::ObjectMeta::Representation
      
          property :spec, as: 'spec', class: Google::Apis::RunV1::RouteSpec, decorator: Google::Apis::RunV1::RouteSpec::Representation
      
          property :status, as: 'status', class: Google::Apis::RunV1::RouteStatus, decorator: Google::Apis::RunV1::RouteStatus::Representation
      
        end
      end
      
      class RouteSpec
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :traffic, as: 'traffic', class: Google::Apis::RunV1::TrafficTarget, decorator: Google::Apis::RunV1::TrafficTarget::Representation
      
        end
      end
      
      class RouteStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :address, as: 'address', class: Google::Apis::RunV1::Addressable, decorator: Google::Apis::RunV1::Addressable::Representation
      
          collection :conditions, as: 'conditions', class: Google::Apis::RunV1::GoogleCloudRunV1Condition, decorator: Google::Apis::RunV1::GoogleCloudRunV1Condition::Representation
      
          property :observed_generation, as: 'observedGeneration'
          collection :traffic, as: 'traffic', class: Google::Apis::RunV1::TrafficTarget, decorator: Google::Apis::RunV1::TrafficTarget::Representation
      
          property :url, as: 'url'
        end
      end
      
      class SecretEnvSource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :local_object_reference, as: 'localObjectReference', class: Google::Apis::RunV1::LocalObjectReference, decorator: Google::Apis::RunV1::LocalObjectReference::Representation
      
          property :name, as: 'name'
          property :optional, as: 'optional'
        end
      end
      
      class SecretKeySelector
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :key, as: 'key'
          property :local_object_reference, as: 'localObjectReference', class: Google::Apis::RunV1::LocalObjectReference, decorator: Google::Apis::RunV1::LocalObjectReference::Representation
      
          property :name, as: 'name'
          property :optional, as: 'optional'
        end
      end
      
      class SecretVolumeSource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :default_mode, as: 'defaultMode'
          collection :items, as: 'items', class: Google::Apis::RunV1::KeyToPath, decorator: Google::Apis::RunV1::KeyToPath::Representation
      
          property :optional, as: 'optional'
          property :secret_name, as: 'secretName'
        end
      end
      
      class SecurityContext
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :run_as_user, as: 'runAsUser'
        end
      end
      
      class Service
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :api_version, as: 'apiVersion'
          property :kind, as: 'kind'
          property :metadata, as: 'metadata', class: Google::Apis::RunV1::ObjectMeta, decorator: Google::Apis::RunV1::ObjectMeta::Representation
      
          property :spec, as: 'spec', class: Google::Apis::RunV1::ServiceSpec, decorator: Google::Apis::RunV1::ServiceSpec::Representation
      
          property :status, as: 'status', class: Google::Apis::RunV1::ServiceStatus, decorator: Google::Apis::RunV1::ServiceStatus::Representation
      
        end
      end
      
      class ServiceSpec
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :template, as: 'template', class: Google::Apis::RunV1::RevisionTemplate, decorator: Google::Apis::RunV1::RevisionTemplate::Representation
      
          collection :traffic, as: 'traffic', class: Google::Apis::RunV1::TrafficTarget, decorator: Google::Apis::RunV1::TrafficTarget::Representation
      
        end
      end
      
      class ServiceStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :address, as: 'address', class: Google::Apis::RunV1::Addressable, decorator: Google::Apis::RunV1::Addressable::Representation
      
          collection :conditions, as: 'conditions', class: Google::Apis::RunV1::GoogleCloudRunV1Condition, decorator: Google::Apis::RunV1::GoogleCloudRunV1Condition::Representation
      
          property :latest_created_revision_name, as: 'latestCreatedRevisionName'
          property :latest_ready_revision_name, as: 'latestReadyRevisionName'
          property :observed_generation, as: 'observedGeneration'
          collection :traffic, as: 'traffic', class: Google::Apis::RunV1::TrafficTarget, decorator: Google::Apis::RunV1::TrafficTarget::Representation
      
          property :url, as: 'url'
        end
      end
      
      class SetIamPolicyRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :policy, as: 'policy', class: Google::Apis::RunV1::Policy, decorator: Google::Apis::RunV1::Policy::Representation
      
          property :update_mask, as: 'updateMask'
        end
      end
      
      class Status
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :code, as: 'code'
          property :details, as: 'details', class: Google::Apis::RunV1::StatusDetails, decorator: Google::Apis::RunV1::StatusDetails::Representation
      
          property :message, as: 'message'
          property :metadata, as: 'metadata', class: Google::Apis::RunV1::ListMeta, decorator: Google::Apis::RunV1::ListMeta::Representation
      
          property :reason, as: 'reason'
          property :status, as: 'status'
        end
      end
      
      class StatusCause
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :field, as: 'field'
          property :message, as: 'message'
          property :reason, as: 'reason'
        end
      end
      
      class StatusDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :causes, as: 'causes', class: Google::Apis::RunV1::StatusCause, decorator: Google::Apis::RunV1::StatusCause::Representation
      
          property :group, as: 'group'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :retry_after_seconds, as: 'retryAfterSeconds'
          property :uid, as: 'uid'
        end
      end
      
      class TcpSocketAction
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :host, as: 'host'
          property :port, as: 'port', class: Google::Apis::RunV1::IntOrString, decorator: Google::Apis::RunV1::IntOrString::Representation
      
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
          property :percent, as: 'percent'
          property :revision_name, as: 'revisionName'
          property :tag, as: 'tag'
          property :url, as: 'url'
        end
      end
      
      class Volume
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :config_map, as: 'configMap', class: Google::Apis::RunV1::ConfigMapVolumeSource, decorator: Google::Apis::RunV1::ConfigMapVolumeSource::Representation
      
          property :name, as: 'name'
          property :secret, as: 'secret', class: Google::Apis::RunV1::SecretVolumeSource, decorator: Google::Apis::RunV1::SecretVolumeSource::Representation
      
        end
      end
      
      class VolumeMount
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :mount_path, as: 'mountPath'
          property :name, as: 'name'
          property :read_only, as: 'readOnly'
          property :sub_path, as: 'subPath'
        end
      end
    end
  end
end
