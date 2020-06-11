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
      
      # Request for `BindDeviceToGateway`.
      class BindDeviceToGatewayRequest
        include Google::Apis::Core::Hashable
      
        # Required. The device to associate with the specified gateway. The value of
        # `device_id` can be either the device numeric ID or the user-defined device
        # identifier.
        # Corresponds to the JSON property `deviceId`
        # @return [String]
        attr_accessor :device_id
      
        # Required. The value of `gateway_id` can be either the device numeric ID or the
        # user-defined device identifier.
        # Corresponds to the JSON property `gatewayId`
        # @return [String]
        attr_accessor :gateway_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @device_id = args[:device_id] if args.key?(:device_id)
          @gateway_id = args[:gateway_id] if args.key?(:gateway_id)
        end
      end
      
      # Response for `BindDeviceToGateway`.
      class BindDeviceToGatewayResponse
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Associates `members` with a `role`.
      class Binding
        include Google::Apis::Core::Hashable
      
        # Represents an expression text. Example:
        # title: "User account presence"
        # description: "Determines whether the request has a user account"
        # expression: "size(request.user) > 0"
        # Corresponds to the JSON property `condition`
        # @return [Google::Apis::CloudiotV1::Expr]
        attr_accessor :condition
      
        # Specifies the identities requesting access for a Cloud Platform resource.
        # `members` can have the following values:
        # * `allUsers`: A special identifier that represents anyone who is
        # on the internet; with or without a Google account.
        # * `allAuthenticatedUsers`: A special identifier that represents anyone
        # who is authenticated with a Google account or a service account.
        # * `user:`emailid``: An email address that represents a specific Google
        # account. For example, `alice@example.com` .
        # * `serviceAccount:`emailid``: An email address that represents a service
        # account. For example, `my-other-app@appspot.gserviceaccount.com`.
        # * `group:`emailid``: An email address that represents a Google group.
        # For example, `admins@example.com`.
        # * `domain:`domain``: The G Suite domain (primary) that represents all the
        # users of that domain. For example, `google.com` or `example.com`.
        # Corresponds to the JSON property `members`
        # @return [Array<String>]
        attr_accessor :members
      
        # Role that is assigned to `members`.
        # For example, `roles/viewer`, `roles/editor`, or `roles/owner`.
        # Corresponds to the JSON property `role`
        # @return [String]
        attr_accessor :role
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @condition = args[:condition] if args.key?(:condition)
          @members = args[:members] if args.key?(:members)
          @role = args[:role] if args.key?(:role)
        end
      end
      
      # The device resource.
      class Device
        include Google::Apis::Core::Hashable
      
        # If a device is blocked, connections or requests from this device will fail.
        # Can be used to temporarily prevent the device from connecting if, for
        # example, the sensor is generating bad data and needs maintenance.
        # Corresponds to the JSON property `blocked`
        # @return [Boolean]
        attr_accessor :blocked
        alias_method :blocked?, :blocked
      
        # The device configuration. Eventually delivered to devices.
        # Corresponds to the JSON property `config`
        # @return [Google::Apis::CloudiotV1::DeviceConfig]
        attr_accessor :config
      
        # The credentials used to authenticate this device. To allow credential
        # rotation without interruption, multiple device credentials can be bound to
        # this device. No more than 3 credentials can be bound to a single device at
        # a time. When new credentials are added to a device, they are verified
        # against the registry credentials. For details, see the description of the
        # `DeviceRegistry.credentials` field.
        # Corresponds to the JSON property `credentials`
        # @return [Array<Google::Apis::CloudiotV1::DeviceCredential>]
        attr_accessor :credentials
      
        # Gateway-related configuration and state.
        # Corresponds to the JSON property `gatewayConfig`
        # @return [Google::Apis::CloudiotV1::GatewayConfig]
        attr_accessor :gateway_config
      
        # The user-defined device identifier. The device ID must be unique
        # within a device registry.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # [Output only] The last time a cloud-to-device config version acknowledgment
        # was received from the device. This field is only for configurations
        # sent through MQTT.
        # Corresponds to the JSON property `lastConfigAckTime`
        # @return [String]
        attr_accessor :last_config_ack_time
      
        # [Output only] The last time a cloud-to-device config version was sent to
        # the device.
        # Corresponds to the JSON property `lastConfigSendTime`
        # @return [String]
        attr_accessor :last_config_send_time
      
        # The `Status` type defines a logical error model that is suitable for
        # different programming environments, including REST APIs and RPC APIs. It is
        # used by [gRPC](https://github.com/grpc). Each `Status` message contains
        # three pieces of data: error code, error message, and error details.
        # You can find out more about this error model and how to work with it in the
        # [API Design Guide](https://cloud.google.com/apis/design/errors).
        # Corresponds to the JSON property `lastErrorStatus`
        # @return [Google::Apis::CloudiotV1::Status]
        attr_accessor :last_error_status
      
        # [Output only] The time the most recent error occurred, such as a failure to
        # publish to Cloud Pub/Sub. This field is the timestamp of
        # 'last_error_status'.
        # Corresponds to the JSON property `lastErrorTime`
        # @return [String]
        attr_accessor :last_error_time
      
        # [Output only] The last time a telemetry event was received. Timestamps are
        # periodically collected and written to storage; they may be stale by a few
        # minutes.
        # Corresponds to the JSON property `lastEventTime`
        # @return [String]
        attr_accessor :last_event_time
      
        # [Output only] The last time an MQTT `PINGREQ` was received. This field
        # applies only to devices connecting through MQTT. MQTT clients usually only
        # send `PINGREQ` messages if the connection is idle, and no other messages
        # have been sent. Timestamps are periodically collected and written to
        # storage; they may be stale by a few minutes.
        # Corresponds to the JSON property `lastHeartbeatTime`
        # @return [String]
        attr_accessor :last_heartbeat_time
      
        # [Output only] The last time a state event was received. Timestamps are
        # periodically collected and written to storage; they may be stale by a few
        # minutes.
        # Corresponds to the JSON property `lastStateTime`
        # @return [String]
        attr_accessor :last_state_time
      
        # **Beta Feature**
        # The logging verbosity for device activity. If unspecified,
        # DeviceRegistry.log_level will be used.
        # Corresponds to the JSON property `logLevel`
        # @return [String]
        attr_accessor :log_level
      
        # The metadata key-value pairs assigned to the device. This metadata is not
        # interpreted or indexed by Cloud IoT Core. It can be used to add contextual
        # information for the device.
        # Keys must conform to the regular expression a-zA-Z+ and
        # be less than 128 bytes in length.
        # Values are free-form strings. Each value must be less than or equal to 32
        # KB in size.
        # The total size of all keys and values must be less than 256 KB, and the
        # maximum number of key-value pairs is 500.
        # Corresponds to the JSON property `metadata`
        # @return [Hash<String,String>]
        attr_accessor :metadata
      
        # The resource path name. For example,
        # `projects/p1/locations/us-central1/registries/registry0/devices/dev0` or
        # `projects/p1/locations/us-central1/registries/registry0/devices/`num_id``.
        # When `name` is populated as a response from the service, it always ends
        # in the device numeric ID.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # [Output only] A server-defined unique numeric ID for the device. This is a
        # more compact way to identify devices, and it is globally unique.
        # Corresponds to the JSON property `numId`
        # @return [Fixnum]
        attr_accessor :num_id
      
        # The device state, as reported by the device.
        # Corresponds to the JSON property `state`
        # @return [Google::Apis::CloudiotV1::DeviceState]
        attr_accessor :state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @blocked = args[:blocked] if args.key?(:blocked)
          @config = args[:config] if args.key?(:config)
          @credentials = args[:credentials] if args.key?(:credentials)
          @gateway_config = args[:gateway_config] if args.key?(:gateway_config)
          @id = args[:id] if args.key?(:id)
          @last_config_ack_time = args[:last_config_ack_time] if args.key?(:last_config_ack_time)
          @last_config_send_time = args[:last_config_send_time] if args.key?(:last_config_send_time)
          @last_error_status = args[:last_error_status] if args.key?(:last_error_status)
          @last_error_time = args[:last_error_time] if args.key?(:last_error_time)
          @last_event_time = args[:last_event_time] if args.key?(:last_event_time)
          @last_heartbeat_time = args[:last_heartbeat_time] if args.key?(:last_heartbeat_time)
          @last_state_time = args[:last_state_time] if args.key?(:last_state_time)
          @log_level = args[:log_level] if args.key?(:log_level)
          @metadata = args[:metadata] if args.key?(:metadata)
          @name = args[:name] if args.key?(:name)
          @num_id = args[:num_id] if args.key?(:num_id)
          @state = args[:state] if args.key?(:state)
        end
      end
      
      # The device configuration. Eventually delivered to devices.
      class DeviceConfig
        include Google::Apis::Core::Hashable
      
        # The device configuration data.
        # Corresponds to the JSON property `binaryData`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :binary_data
      
        # [Output only] The time at which this configuration version was updated in
        # Cloud IoT Core. This timestamp is set by the server.
        # Corresponds to the JSON property `cloudUpdateTime`
        # @return [String]
        attr_accessor :cloud_update_time
      
        # [Output only] The time at which Cloud IoT Core received the
        # acknowledgment from the device, indicating that the device has received
        # this configuration version. If this field is not present, the device has
        # not yet acknowledged that it received this version. Note that when
        # the config was sent to the device, many config versions may have been
        # available in Cloud IoT Core while the device was disconnected, and on
        # connection, only the latest version is sent to the device. Some
        # versions may never be sent to the device, and therefore are never
        # acknowledged. This timestamp is set by Cloud IoT Core.
        # Corresponds to the JSON property `deviceAckTime`
        # @return [String]
        attr_accessor :device_ack_time
      
        # [Output only] The version of this update. The version number is assigned by
        # the server, and is always greater than 0 after device creation. The
        # version must be 0 on the `CreateDevice` request if a `config` is
        # specified; the response of `CreateDevice` will always have a value of 1.
        # Corresponds to the JSON property `version`
        # @return [Fixnum]
        attr_accessor :version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @binary_data = args[:binary_data] if args.key?(:binary_data)
          @cloud_update_time = args[:cloud_update_time] if args.key?(:cloud_update_time)
          @device_ack_time = args[:device_ack_time] if args.key?(:device_ack_time)
          @version = args[:version] if args.key?(:version)
        end
      end
      
      # A server-stored device credential used for authentication.
      class DeviceCredential
        include Google::Apis::Core::Hashable
      
        # [Optional] The time at which this credential becomes invalid. This
        # credential will be ignored for new client authentication requests after
        # this timestamp; however, it will not be automatically deleted.
        # Corresponds to the JSON property `expirationTime`
        # @return [String]
        attr_accessor :expiration_time
      
        # A public key format and data.
        # Corresponds to the JSON property `publicKey`
        # @return [Google::Apis::CloudiotV1::PublicKeyCredential]
        attr_accessor :public_key
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @expiration_time = args[:expiration_time] if args.key?(:expiration_time)
          @public_key = args[:public_key] if args.key?(:public_key)
        end
      end
      
      # A container for a group of devices.
      class DeviceRegistry
        include Google::Apis::Core::Hashable
      
        # The credentials used to verify the device credentials. No more than 10
        # credentials can be bound to a single registry at a time. The verification
        # process occurs at the time of device creation or update. If this field is
        # empty, no verification is performed. Otherwise, the credentials of a newly
        # created device or added credentials of an updated device should be signed
        # with one of these registry credentials.
        # Note, however, that existing devices will never be affected by
        # modifications to this list of credentials: after a device has been
        # successfully created in a registry, it should be able to connect even if
        # its registry credentials are revoked, deleted, or modified.
        # Corresponds to the JSON property `credentials`
        # @return [Array<Google::Apis::CloudiotV1::RegistryCredential>]
        attr_accessor :credentials
      
        # The configuration for notification of telemetry events received from the
        # device. All telemetry events that were successfully published by the
        # device and acknowledged by Cloud IoT Core are guaranteed to be
        # delivered to Cloud Pub/Sub. If multiple configurations match a message,
        # only the first matching configuration is used. If you try to publish a
        # device telemetry event using MQTT without specifying a Cloud Pub/Sub topic
        # for the device's registry, the connection closes automatically. If you try
        # to do so using an HTTP connection, an error is returned. Up to 10
        # configurations may be provided.
        # Corresponds to the JSON property `eventNotificationConfigs`
        # @return [Array<Google::Apis::CloudiotV1::EventNotificationConfig>]
        attr_accessor :event_notification_configs
      
        # The configuration of the HTTP bridge for a device registry.
        # Corresponds to the JSON property `httpConfig`
        # @return [Google::Apis::CloudiotV1::HttpConfig]
        attr_accessor :http_config
      
        # The identifier of this device registry. For example, `myRegistry`.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # **Beta Feature**
        # The default logging verbosity for activity from devices in this registry.
        # The verbosity level can be overridden by Device.log_level.
        # Corresponds to the JSON property `logLevel`
        # @return [String]
        attr_accessor :log_level
      
        # The configuration of MQTT for a device registry.
        # Corresponds to the JSON property `mqttConfig`
        # @return [Google::Apis::CloudiotV1::MqttConfig]
        attr_accessor :mqtt_config
      
        # The resource path name. For example,
        # `projects/example-project/locations/us-central1/registries/my-registry`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The configuration for notification of new states received from the device.
        # Corresponds to the JSON property `stateNotificationConfig`
        # @return [Google::Apis::CloudiotV1::StateNotificationConfig]
        attr_accessor :state_notification_config
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @credentials = args[:credentials] if args.key?(:credentials)
          @event_notification_configs = args[:event_notification_configs] if args.key?(:event_notification_configs)
          @http_config = args[:http_config] if args.key?(:http_config)
          @id = args[:id] if args.key?(:id)
          @log_level = args[:log_level] if args.key?(:log_level)
          @mqtt_config = args[:mqtt_config] if args.key?(:mqtt_config)
          @name = args[:name] if args.key?(:name)
          @state_notification_config = args[:state_notification_config] if args.key?(:state_notification_config)
        end
      end
      
      # The device state, as reported by the device.
      class DeviceState
        include Google::Apis::Core::Hashable
      
        # The device state data.
        # Corresponds to the JSON property `binaryData`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :binary_data
      
        # [Output only] The time at which this state version was updated in Cloud
        # IoT Core.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @binary_data = args[:binary_data] if args.key?(:binary_data)
          @update_time = args[:update_time] if args.key?(:update_time)
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
      
      # The configuration for forwarding telemetry events.
      class EventNotificationConfig
        include Google::Apis::Core::Hashable
      
        # A Cloud Pub/Sub topic name. For example,
        # `projects/myProject/topics/deviceEvents`.
        # Corresponds to the JSON property `pubsubTopicName`
        # @return [String]
        attr_accessor :pubsub_topic_name
      
        # If the subfolder name matches this string exactly, this configuration will
        # be used. The string must not include the leading '/' character. If empty,
        # all strings are matched. This field is used only for telemetry events;
        # subfolders are not supported for state changes.
        # Corresponds to the JSON property `subfolderMatches`
        # @return [String]
        attr_accessor :subfolder_matches
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @pubsub_topic_name = args[:pubsub_topic_name] if args.key?(:pubsub_topic_name)
          @subfolder_matches = args[:subfolder_matches] if args.key?(:subfolder_matches)
        end
      end
      
      # Represents an expression text. Example:
      # title: "User account presence"
      # description: "Determines whether the request has a user account"
      # expression: "size(request.user) > 0"
      class Expr
        include Google::Apis::Core::Hashable
      
        # An optional description of the expression. This is a longer text which
        # describes the expression, e.g. when hovered over it in a UI.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Textual representation of an expression in
        # Common Expression Language syntax.
        # The application context of the containing message determines which
        # well-known feature set of CEL is supported.
        # Corresponds to the JSON property `expression`
        # @return [String]
        attr_accessor :expression
      
        # An optional string indicating the location of the expression for error
        # reporting, e.g. a file name and a position in the file.
        # Corresponds to the JSON property `location`
        # @return [String]
        attr_accessor :location
      
        # An optional title for the expression, i.e. a short string describing
        # its purpose. This can be used e.g. in UIs which allow to enter the
        # expression.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @expression = args[:expression] if args.key?(:expression)
          @location = args[:location] if args.key?(:location)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # Gateway-related configuration and state.
      class GatewayConfig
        include Google::Apis::Core::Hashable
      
        # Indicates how to authorize and/or authenticate devices to access the
        # gateway.
        # Corresponds to the JSON property `gatewayAuthMethod`
        # @return [String]
        attr_accessor :gateway_auth_method
      
        # Indicates whether the device is a gateway.
        # Corresponds to the JSON property `gatewayType`
        # @return [String]
        attr_accessor :gateway_type
      
        # [Output only] The ID of the gateway the device accessed most recently.
        # Corresponds to the JSON property `lastAccessedGatewayId`
        # @return [String]
        attr_accessor :last_accessed_gateway_id
      
        # [Output only] The most recent time at which the device accessed the gateway
        # specified in `last_accessed_gateway`.
        # Corresponds to the JSON property `lastAccessedGatewayTime`
        # @return [String]
        attr_accessor :last_accessed_gateway_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @gateway_auth_method = args[:gateway_auth_method] if args.key?(:gateway_auth_method)
          @gateway_type = args[:gateway_type] if args.key?(:gateway_type)
          @last_accessed_gateway_id = args[:last_accessed_gateway_id] if args.key?(:last_accessed_gateway_id)
          @last_accessed_gateway_time = args[:last_accessed_gateway_time] if args.key?(:last_accessed_gateway_time)
        end
      end
      
      # Request message for `GetIamPolicy` method.
      class GetIamPolicyRequest
        include Google::Apis::Core::Hashable
      
        # Encapsulates settings provided to GetIamPolicy.
        # Corresponds to the JSON property `options`
        # @return [Google::Apis::CloudiotV1::GetPolicyOptions]
        attr_accessor :options
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @options = args[:options] if args.key?(:options)
        end
      end
      
      # Encapsulates settings provided to GetIamPolicy.
      class GetPolicyOptions
        include Google::Apis::Core::Hashable
      
        # Optional. The policy format version to be returned.
        # Valid values are 0, 1, and 3. Requests specifying an invalid value will be
        # rejected.
        # Requests for policies with any conditional bindings must specify version 3.
        # Policies without any conditional bindings may specify any valid value or
        # leave the field unset.
        # Corresponds to the JSON property `requestedPolicyVersion`
        # @return [Fixnum]
        attr_accessor :requested_policy_version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @requested_policy_version = args[:requested_policy_version] if args.key?(:requested_policy_version)
        end
      end
      
      # The configuration of the HTTP bridge for a device registry.
      class HttpConfig
        include Google::Apis::Core::Hashable
      
        # If enabled, allows devices to use DeviceService via the HTTP protocol.
        # Otherwise, any requests to DeviceService will fail for this registry.
        # Corresponds to the JSON property `httpEnabledState`
        # @return [String]
        attr_accessor :http_enabled_state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @http_enabled_state = args[:http_enabled_state] if args.key?(:http_enabled_state)
        end
      end
      
      # Response for `ListDeviceConfigVersions`.
      class ListDeviceConfigVersionsResponse
        include Google::Apis::Core::Hashable
      
        # The device configuration for the last few versions. Versions are listed
        # in decreasing order, starting from the most recent one.
        # Corresponds to the JSON property `deviceConfigs`
        # @return [Array<Google::Apis::CloudiotV1::DeviceConfig>]
        attr_accessor :device_configs
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @device_configs = args[:device_configs] if args.key?(:device_configs)
        end
      end
      
      # Response for `ListDeviceRegistries`.
      class ListDeviceRegistriesResponse
        include Google::Apis::Core::Hashable
      
        # The registries that matched the query.
        # Corresponds to the JSON property `deviceRegistries`
        # @return [Array<Google::Apis::CloudiotV1::DeviceRegistry>]
        attr_accessor :device_registries
      
        # If not empty, indicates that there may be more registries that match the
        # request; this value should be passed in a new
        # `ListDeviceRegistriesRequest`.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @device_registries = args[:device_registries] if args.key?(:device_registries)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Response for `ListDeviceStates`.
      class ListDeviceStatesResponse
        include Google::Apis::Core::Hashable
      
        # The last few device states. States are listed in descending order of server
        # update time, starting from the most recent one.
        # Corresponds to the JSON property `deviceStates`
        # @return [Array<Google::Apis::CloudiotV1::DeviceState>]
        attr_accessor :device_states
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @device_states = args[:device_states] if args.key?(:device_states)
        end
      end
      
      # Response for `ListDevices`.
      class ListDevicesResponse
        include Google::Apis::Core::Hashable
      
        # The devices that match the request.
        # Corresponds to the JSON property `devices`
        # @return [Array<Google::Apis::CloudiotV1::Device>]
        attr_accessor :devices
      
        # If not empty, indicates that there may be more devices that match the
        # request; this value should be passed in a new `ListDevicesRequest`.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @devices = args[:devices] if args.key?(:devices)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Request for `ModifyCloudToDeviceConfig`.
      class ModifyCloudToDeviceConfigRequest
        include Google::Apis::Core::Hashable
      
        # Required. The configuration data for the device.
        # Corresponds to the JSON property `binaryData`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :binary_data
      
        # The version number to update. If this value is zero, it will not check the
        # version number of the server and will always update the current version;
        # otherwise, this update will fail if the version number found on the server
        # does not match this version number. This is used to support multiple
        # simultaneous updates without losing data.
        # Corresponds to the JSON property `versionToUpdate`
        # @return [Fixnum]
        attr_accessor :version_to_update
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @binary_data = args[:binary_data] if args.key?(:binary_data)
          @version_to_update = args[:version_to_update] if args.key?(:version_to_update)
        end
      end
      
      # The configuration of MQTT for a device registry.
      class MqttConfig
        include Google::Apis::Core::Hashable
      
        # If enabled, allows connections using the MQTT protocol. Otherwise, MQTT
        # connections to this registry will fail.
        # Corresponds to the JSON property `mqttEnabledState`
        # @return [String]
        attr_accessor :mqtt_enabled_state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @mqtt_enabled_state = args[:mqtt_enabled_state] if args.key?(:mqtt_enabled_state)
        end
      end
      
      # Defines an Identity and Access Management (IAM) policy. It is used to
      # specify access control policies for Cloud Platform resources.
      # A `Policy` is a collection of `bindings`. A `binding` binds one or more
      # `members` to a single `role`. Members can be user accounts, service accounts,
      # Google groups, and domains (such as G Suite). A `role` is a named list of
      # permissions (defined by IAM or configured by users). A `binding` can
      # optionally specify a `condition`, which is a logic expression that further
      # constrains the role binding based on attributes about the request and/or
      # target resource.
      # **JSON Example**
      # `
      # "bindings": [
      # `
      # "role": "roles/resourcemanager.organizationAdmin",
      # "members": [
      # "user:mike@example.com",
      # "group:admins@example.com",
      # "domain:google.com",
      # "serviceAccount:my-project-id@appspot.gserviceaccount.com"
      # ]
      # `,
      # `
      # "role": "roles/resourcemanager.organizationViewer",
      # "members": ["user:eve@example.com"],
      # "condition": `
      # "title": "expirable access",
      # "description": "Does not grant access after Sep 2020",
      # "expression": "request.time <
      # timestamp('2020-10-01T00:00:00.000Z')",
      # `
      # `
      # ]
      # `
      # **YAML Example**
      # bindings:
      # - members:
      # - user:mike@example.com
      # - group:admins@example.com
      # - domain:google.com
      # - serviceAccount:my-project-id@appspot.gserviceaccount.com
      # role: roles/resourcemanager.organizationAdmin
      # - members:
      # - user:eve@example.com
      # role: roles/resourcemanager.organizationViewer
      # condition:
      # title: expirable access
      # description: Does not grant access after Sep 2020
      # expression: request.time < timestamp('2020-10-01T00:00:00.000Z')
      # For a description of IAM and its features, see the
      # [IAM developer's guide](https://cloud.google.com/iam/docs).
      class Policy
        include Google::Apis::Core::Hashable
      
        # Associates a list of `members` to a `role`. Optionally may specify a
        # `condition` that determines when binding is in effect.
        # `bindings` with no members will result in an error.
        # Corresponds to the JSON property `bindings`
        # @return [Array<Google::Apis::CloudiotV1::Binding>]
        attr_accessor :bindings
      
        # `etag` is used for optimistic concurrency control as a way to help
        # prevent simultaneous updates of a policy from overwriting each other.
        # It is strongly suggested that systems make use of the `etag` in the
        # read-modify-write cycle to perform policy updates in order to avoid race
        # conditions: An `etag` is returned in the response to `getIamPolicy`, and
        # systems are expected to put that etag in the request to `setIamPolicy` to
        # ensure that their change will be applied to the same version of the policy.
        # If no `etag` is provided in the call to `setIamPolicy`, then the existing
        # policy is overwritten. Due to blind-set semantics of an etag-less policy,
        # 'setIamPolicy' will not fail even if either of incoming or stored policy
        # does not meet the version requirements.
        # Corresponds to the JSON property `etag`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :etag
      
        # Specifies the format of the policy.
        # Valid values are 0, 1, and 3. Requests specifying an invalid value will be
        # rejected.
        # Operations affecting conditional bindings must specify version 3. This can
        # be either setting a conditional policy, modifying a conditional binding,
        # or removing a conditional binding from the stored conditional policy.
        # Operations on non-conditional policies may specify any valid value or
        # leave the field unset.
        # If no etag is provided in the call to `setIamPolicy`, any version
        # compliance checks on the incoming and/or stored policy is skipped.
        # Corresponds to the JSON property `version`
        # @return [Fixnum]
        attr_accessor :version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bindings = args[:bindings] if args.key?(:bindings)
          @etag = args[:etag] if args.key?(:etag)
          @version = args[:version] if args.key?(:version)
        end
      end
      
      # A public key certificate format and data.
      class PublicKeyCertificate
        include Google::Apis::Core::Hashable
      
        # The certificate data.
        # Corresponds to the JSON property `certificate`
        # @return [String]
        attr_accessor :certificate
      
        # The certificate format.
        # Corresponds to the JSON property `format`
        # @return [String]
        attr_accessor :format
      
        # Details of an X.509 certificate. For informational purposes only.
        # Corresponds to the JSON property `x509Details`
        # @return [Google::Apis::CloudiotV1::X509CertificateDetails]
        attr_accessor :x509_details
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @certificate = args[:certificate] if args.key?(:certificate)
          @format = args[:format] if args.key?(:format)
          @x509_details = args[:x509_details] if args.key?(:x509_details)
        end
      end
      
      # A public key format and data.
      class PublicKeyCredential
        include Google::Apis::Core::Hashable
      
        # The format of the key.
        # Corresponds to the JSON property `format`
        # @return [String]
        attr_accessor :format
      
        # The key data.
        # Corresponds to the JSON property `key`
        # @return [String]
        attr_accessor :key
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @format = args[:format] if args.key?(:format)
          @key = args[:key] if args.key?(:key)
        end
      end
      
      # A server-stored registry credential used to validate device credentials.
      class RegistryCredential
        include Google::Apis::Core::Hashable
      
        # A public key certificate format and data.
        # Corresponds to the JSON property `publicKeyCertificate`
        # @return [Google::Apis::CloudiotV1::PublicKeyCertificate]
        attr_accessor :public_key_certificate
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @public_key_certificate = args[:public_key_certificate] if args.key?(:public_key_certificate)
        end
      end
      
      # Request for `SendCommandToDevice`.
      class SendCommandToDeviceRequest
        include Google::Apis::Core::Hashable
      
        # Required. The command data to send to the device.
        # Corresponds to the JSON property `binaryData`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :binary_data
      
        # Optional subfolder for the command. If empty, the command will be delivered
        # to the /devices/`device-id`/commands topic, otherwise it will be delivered
        # to the /devices/`device-id`/commands/`subfolder` topic. Multi-level
        # subfolders are allowed. This field must not have more than 256 characters,
        # and must not contain any MQTT wildcards ("+" or "#") or null characters.
        # Corresponds to the JSON property `subfolder`
        # @return [String]
        attr_accessor :subfolder
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @binary_data = args[:binary_data] if args.key?(:binary_data)
          @subfolder = args[:subfolder] if args.key?(:subfolder)
        end
      end
      
      # Response for `SendCommandToDevice`.
      class SendCommandToDeviceResponse
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Request message for `SetIamPolicy` method.
      class SetIamPolicyRequest
        include Google::Apis::Core::Hashable
      
        # Defines an Identity and Access Management (IAM) policy. It is used to
        # specify access control policies for Cloud Platform resources.
        # A `Policy` is a collection of `bindings`. A `binding` binds one or more
        # `members` to a single `role`. Members can be user accounts, service accounts,
        # Google groups, and domains (such as G Suite). A `role` is a named list of
        # permissions (defined by IAM or configured by users). A `binding` can
        # optionally specify a `condition`, which is a logic expression that further
        # constrains the role binding based on attributes about the request and/or
        # target resource.
        # **JSON Example**
        # `
        # "bindings": [
        # `
        # "role": "roles/resourcemanager.organizationAdmin",
        # "members": [
        # "user:mike@example.com",
        # "group:admins@example.com",
        # "domain:google.com",
        # "serviceAccount:my-project-id@appspot.gserviceaccount.com"
        # ]
        # `,
        # `
        # "role": "roles/resourcemanager.organizationViewer",
        # "members": ["user:eve@example.com"],
        # "condition": `
        # "title": "expirable access",
        # "description": "Does not grant access after Sep 2020",
        # "expression": "request.time <
        # timestamp('2020-10-01T00:00:00.000Z')",
        # `
        # `
        # ]
        # `
        # **YAML Example**
        # bindings:
        # - members:
        # - user:mike@example.com
        # - group:admins@example.com
        # - domain:google.com
        # - serviceAccount:my-project-id@appspot.gserviceaccount.com
        # role: roles/resourcemanager.organizationAdmin
        # - members:
        # - user:eve@example.com
        # role: roles/resourcemanager.organizationViewer
        # condition:
        # title: expirable access
        # description: Does not grant access after Sep 2020
        # expression: request.time < timestamp('2020-10-01T00:00:00.000Z')
        # For a description of IAM and its features, see the
        # [IAM developer's guide](https://cloud.google.com/iam/docs).
        # Corresponds to the JSON property `policy`
        # @return [Google::Apis::CloudiotV1::Policy]
        attr_accessor :policy
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @policy = args[:policy] if args.key?(:policy)
        end
      end
      
      # The configuration for notification of new states received from the device.
      class StateNotificationConfig
        include Google::Apis::Core::Hashable
      
        # A Cloud Pub/Sub topic name. For example,
        # `projects/myProject/topics/deviceEvents`.
        # Corresponds to the JSON property `pubsubTopicName`
        # @return [String]
        attr_accessor :pubsub_topic_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @pubsub_topic_name = args[:pubsub_topic_name] if args.key?(:pubsub_topic_name)
        end
      end
      
      # The `Status` type defines a logical error model that is suitable for
      # different programming environments, including REST APIs and RPC APIs. It is
      # used by [gRPC](https://github.com/grpc). Each `Status` message contains
      # three pieces of data: error code, error message, and error details.
      # You can find out more about this error model and how to work with it in the
      # [API Design Guide](https://cloud.google.com/apis/design/errors).
      class Status
        include Google::Apis::Core::Hashable
      
        # The status code, which should be an enum value of google.rpc.Code.
        # Corresponds to the JSON property `code`
        # @return [Fixnum]
        attr_accessor :code
      
        # A list of messages that carry the error details.  There is a common set of
        # message types for APIs to use.
        # Corresponds to the JSON property `details`
        # @return [Array<Hash<String,Object>>]
        attr_accessor :details
      
        # A developer-facing error message, which should be in English. Any
        # user-facing error message should be localized and sent in the
        # google.rpc.Status.details field, or localized by the client.
        # Corresponds to the JSON property `message`
        # @return [String]
        attr_accessor :message
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @code = args[:code] if args.key?(:code)
          @details = args[:details] if args.key?(:details)
          @message = args[:message] if args.key?(:message)
        end
      end
      
      # Request message for `TestIamPermissions` method.
      class TestIamPermissionsRequest
        include Google::Apis::Core::Hashable
      
        # The set of permissions to check for the `resource`. Permissions with
        # wildcards (such as '*' or 'storage.*') are not allowed. For more
        # information see
        # [IAM Overview](https://cloud.google.com/iam/docs/overview#permissions).
        # Corresponds to the JSON property `permissions`
        # @return [Array<String>]
        attr_accessor :permissions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @permissions = args[:permissions] if args.key?(:permissions)
        end
      end
      
      # Response message for `TestIamPermissions` method.
      class TestIamPermissionsResponse
        include Google::Apis::Core::Hashable
      
        # A subset of `TestPermissionsRequest.permissions` that the caller is
        # allowed.
        # Corresponds to the JSON property `permissions`
        # @return [Array<String>]
        attr_accessor :permissions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @permissions = args[:permissions] if args.key?(:permissions)
        end
      end
      
      # Request for `UnbindDeviceFromGateway`.
      class UnbindDeviceFromGatewayRequest
        include Google::Apis::Core::Hashable
      
        # Required. The device to disassociate from the specified gateway. The value of
        # `device_id` can be either the device numeric ID or the user-defined device
        # identifier.
        # Corresponds to the JSON property `deviceId`
        # @return [String]
        attr_accessor :device_id
      
        # Required. The value of `gateway_id` can be either the device numeric ID or the
        # user-defined device identifier.
        # Corresponds to the JSON property `gatewayId`
        # @return [String]
        attr_accessor :gateway_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @device_id = args[:device_id] if args.key?(:device_id)
          @gateway_id = args[:gateway_id] if args.key?(:gateway_id)
        end
      end
      
      # Response for `UnbindDeviceFromGateway`.
      class UnbindDeviceFromGatewayResponse
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Details of an X.509 certificate. For informational purposes only.
      class X509CertificateDetails
        include Google::Apis::Core::Hashable
      
        # The time the certificate becomes invalid.
        # Corresponds to the JSON property `expiryTime`
        # @return [String]
        attr_accessor :expiry_time
      
        # The entity that signed the certificate.
        # Corresponds to the JSON property `issuer`
        # @return [String]
        attr_accessor :issuer
      
        # The type of public key in the certificate.
        # Corresponds to the JSON property `publicKeyType`
        # @return [String]
        attr_accessor :public_key_type
      
        # The algorithm used to sign the certificate.
        # Corresponds to the JSON property `signatureAlgorithm`
        # @return [String]
        attr_accessor :signature_algorithm
      
        # The time the certificate becomes valid.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        # The entity the certificate and public key belong to.
        # Corresponds to the JSON property `subject`
        # @return [String]
        attr_accessor :subject
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @expiry_time = args[:expiry_time] if args.key?(:expiry_time)
          @issuer = args[:issuer] if args.key?(:issuer)
          @public_key_type = args[:public_key_type] if args.key?(:public_key_type)
          @signature_algorithm = args[:signature_algorithm] if args.key?(:signature_algorithm)
          @start_time = args[:start_time] if args.key?(:start_time)
          @subject = args[:subject] if args.key?(:subject)
        end
      end
    end
  end
end
