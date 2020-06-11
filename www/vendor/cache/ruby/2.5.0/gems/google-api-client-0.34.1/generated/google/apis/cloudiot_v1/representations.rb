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
    module CloudiotV1
      
      class BindDeviceToGatewayRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BindDeviceToGatewayResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Binding
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Device
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeviceConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeviceCredential
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeviceRegistry
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeviceState
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Empty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EventNotificationConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Expr
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GatewayConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GetIamPolicyRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GetPolicyOptions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HttpConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListDeviceConfigVersionsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListDeviceRegistriesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListDeviceStatesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListDevicesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ModifyCloudToDeviceConfigRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MqttConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Policy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PublicKeyCertificate
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PublicKeyCredential
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RegistryCredential
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SendCommandToDeviceRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SendCommandToDeviceResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SetIamPolicyRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class StateNotificationConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Status
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
      
      class UnbindDeviceFromGatewayRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UnbindDeviceFromGatewayResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class X509CertificateDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BindDeviceToGatewayRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :device_id, as: 'deviceId'
          property :gateway_id, as: 'gatewayId'
        end
      end
      
      class BindDeviceToGatewayResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class Binding
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :condition, as: 'condition', class: Google::Apis::CloudiotV1::Expr, decorator: Google::Apis::CloudiotV1::Expr::Representation
      
          collection :members, as: 'members'
          property :role, as: 'role'
        end
      end
      
      class Device
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :blocked, as: 'blocked'
          property :config, as: 'config', class: Google::Apis::CloudiotV1::DeviceConfig, decorator: Google::Apis::CloudiotV1::DeviceConfig::Representation
      
          collection :credentials, as: 'credentials', class: Google::Apis::CloudiotV1::DeviceCredential, decorator: Google::Apis::CloudiotV1::DeviceCredential::Representation
      
          property :gateway_config, as: 'gatewayConfig', class: Google::Apis::CloudiotV1::GatewayConfig, decorator: Google::Apis::CloudiotV1::GatewayConfig::Representation
      
          property :id, as: 'id'
          property :last_config_ack_time, as: 'lastConfigAckTime'
          property :last_config_send_time, as: 'lastConfigSendTime'
          property :last_error_status, as: 'lastErrorStatus', class: Google::Apis::CloudiotV1::Status, decorator: Google::Apis::CloudiotV1::Status::Representation
      
          property :last_error_time, as: 'lastErrorTime'
          property :last_event_time, as: 'lastEventTime'
          property :last_heartbeat_time, as: 'lastHeartbeatTime'
          property :last_state_time, as: 'lastStateTime'
          property :log_level, as: 'logLevel'
          hash :metadata, as: 'metadata'
          property :name, as: 'name'
          property :num_id, :numeric_string => true, as: 'numId'
          property :state, as: 'state', class: Google::Apis::CloudiotV1::DeviceState, decorator: Google::Apis::CloudiotV1::DeviceState::Representation
      
        end
      end
      
      class DeviceConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :binary_data, :base64 => true, as: 'binaryData'
          property :cloud_update_time, as: 'cloudUpdateTime'
          property :device_ack_time, as: 'deviceAckTime'
          property :version, :numeric_string => true, as: 'version'
        end
      end
      
      class DeviceCredential
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :expiration_time, as: 'expirationTime'
          property :public_key, as: 'publicKey', class: Google::Apis::CloudiotV1::PublicKeyCredential, decorator: Google::Apis::CloudiotV1::PublicKeyCredential::Representation
      
        end
      end
      
      class DeviceRegistry
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :credentials, as: 'credentials', class: Google::Apis::CloudiotV1::RegistryCredential, decorator: Google::Apis::CloudiotV1::RegistryCredential::Representation
      
          collection :event_notification_configs, as: 'eventNotificationConfigs', class: Google::Apis::CloudiotV1::EventNotificationConfig, decorator: Google::Apis::CloudiotV1::EventNotificationConfig::Representation
      
          property :http_config, as: 'httpConfig', class: Google::Apis::CloudiotV1::HttpConfig, decorator: Google::Apis::CloudiotV1::HttpConfig::Representation
      
          property :id, as: 'id'
          property :log_level, as: 'logLevel'
          property :mqtt_config, as: 'mqttConfig', class: Google::Apis::CloudiotV1::MqttConfig, decorator: Google::Apis::CloudiotV1::MqttConfig::Representation
      
          property :name, as: 'name'
          property :state_notification_config, as: 'stateNotificationConfig', class: Google::Apis::CloudiotV1::StateNotificationConfig, decorator: Google::Apis::CloudiotV1::StateNotificationConfig::Representation
      
        end
      end
      
      class DeviceState
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :binary_data, :base64 => true, as: 'binaryData'
          property :update_time, as: 'updateTime'
        end
      end
      
      class Empty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class EventNotificationConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :pubsub_topic_name, as: 'pubsubTopicName'
          property :subfolder_matches, as: 'subfolderMatches'
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
      
      class GatewayConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :gateway_auth_method, as: 'gatewayAuthMethod'
          property :gateway_type, as: 'gatewayType'
          property :last_accessed_gateway_id, as: 'lastAccessedGatewayId'
          property :last_accessed_gateway_time, as: 'lastAccessedGatewayTime'
        end
      end
      
      class GetIamPolicyRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :options, as: 'options', class: Google::Apis::CloudiotV1::GetPolicyOptions, decorator: Google::Apis::CloudiotV1::GetPolicyOptions::Representation
      
        end
      end
      
      class GetPolicyOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :requested_policy_version, as: 'requestedPolicyVersion'
        end
      end
      
      class HttpConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :http_enabled_state, as: 'httpEnabledState'
        end
      end
      
      class ListDeviceConfigVersionsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :device_configs, as: 'deviceConfigs', class: Google::Apis::CloudiotV1::DeviceConfig, decorator: Google::Apis::CloudiotV1::DeviceConfig::Representation
      
        end
      end
      
      class ListDeviceRegistriesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :device_registries, as: 'deviceRegistries', class: Google::Apis::CloudiotV1::DeviceRegistry, decorator: Google::Apis::CloudiotV1::DeviceRegistry::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListDeviceStatesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :device_states, as: 'deviceStates', class: Google::Apis::CloudiotV1::DeviceState, decorator: Google::Apis::CloudiotV1::DeviceState::Representation
      
        end
      end
      
      class ListDevicesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :devices, as: 'devices', class: Google::Apis::CloudiotV1::Device, decorator: Google::Apis::CloudiotV1::Device::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ModifyCloudToDeviceConfigRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :binary_data, :base64 => true, as: 'binaryData'
          property :version_to_update, :numeric_string => true, as: 'versionToUpdate'
        end
      end
      
      class MqttConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :mqtt_enabled_state, as: 'mqttEnabledState'
        end
      end
      
      class Policy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :bindings, as: 'bindings', class: Google::Apis::CloudiotV1::Binding, decorator: Google::Apis::CloudiotV1::Binding::Representation
      
          property :etag, :base64 => true, as: 'etag'
          property :version, as: 'version'
        end
      end
      
      class PublicKeyCertificate
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :certificate, as: 'certificate'
          property :format, as: 'format'
          property :x509_details, as: 'x509Details', class: Google::Apis::CloudiotV1::X509CertificateDetails, decorator: Google::Apis::CloudiotV1::X509CertificateDetails::Representation
      
        end
      end
      
      class PublicKeyCredential
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :format, as: 'format'
          property :key, as: 'key'
        end
      end
      
      class RegistryCredential
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :public_key_certificate, as: 'publicKeyCertificate', class: Google::Apis::CloudiotV1::PublicKeyCertificate, decorator: Google::Apis::CloudiotV1::PublicKeyCertificate::Representation
      
        end
      end
      
      class SendCommandToDeviceRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :binary_data, :base64 => true, as: 'binaryData'
          property :subfolder, as: 'subfolder'
        end
      end
      
      class SendCommandToDeviceResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class SetIamPolicyRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :policy, as: 'policy', class: Google::Apis::CloudiotV1::Policy, decorator: Google::Apis::CloudiotV1::Policy::Representation
      
        end
      end
      
      class StateNotificationConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :pubsub_topic_name, as: 'pubsubTopicName'
        end
      end
      
      class Status
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :code, as: 'code'
          collection :details, as: 'details'
          property :message, as: 'message'
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
      
      class UnbindDeviceFromGatewayRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :device_id, as: 'deviceId'
          property :gateway_id, as: 'gatewayId'
        end
      end
      
      class UnbindDeviceFromGatewayResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class X509CertificateDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :expiry_time, as: 'expiryTime'
          property :issuer, as: 'issuer'
          property :public_key_type, as: 'publicKeyType'
          property :signature_algorithm, as: 'signatureAlgorithm'
          property :start_time, as: 'startTime'
          property :subject, as: 'subject'
        end
      end
    end
  end
end
