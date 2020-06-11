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
    module HomegraphV1
      
      class AgentDeviceId
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AgentOtherDeviceId
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Device
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeviceInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeviceNames
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Empty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class QueryRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class QueryRequestInput
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class QueryRequestPayload
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class QueryResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class QueryResponsePayload
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReportStateAndNotificationDevice
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReportStateAndNotificationRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReportStateAndNotificationResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RequestSyncDevicesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RequestSyncDevicesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class StateAndNotificationPayload
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SyncRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SyncResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SyncResponsePayload
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AgentDeviceId
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
        end
      end
      
      class AgentOtherDeviceId
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :agent_id, as: 'agentId'
          property :device_id, as: 'deviceId'
        end
      end
      
      class Device
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :attributes, as: 'attributes'
          property :custom_data, as: 'customData'
          property :device_info, as: 'deviceInfo', class: Google::Apis::HomegraphV1::DeviceInfo, decorator: Google::Apis::HomegraphV1::DeviceInfo::Representation
      
          property :id, as: 'id'
          property :name, as: 'name', class: Google::Apis::HomegraphV1::DeviceNames, decorator: Google::Apis::HomegraphV1::DeviceNames::Representation
      
          collection :other_device_ids, as: 'otherDeviceIds', class: Google::Apis::HomegraphV1::AgentOtherDeviceId, decorator: Google::Apis::HomegraphV1::AgentOtherDeviceId::Representation
      
          property :room_hint, as: 'roomHint'
          property :structure_hint, as: 'structureHint'
          collection :traits, as: 'traits'
          property :type, as: 'type'
          property :will_report_state, as: 'willReportState'
        end
      end
      
      class DeviceInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :hw_version, as: 'hwVersion'
          property :manufacturer, as: 'manufacturer'
          property :model, as: 'model'
          property :sw_version, as: 'swVersion'
        end
      end
      
      class DeviceNames
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :default_names, as: 'defaultNames'
          property :name, as: 'name'
          collection :nicknames, as: 'nicknames'
        end
      end
      
      class Empty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class QueryRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :agent_user_id, as: 'agentUserId'
          collection :inputs, as: 'inputs', class: Google::Apis::HomegraphV1::QueryRequestInput, decorator: Google::Apis::HomegraphV1::QueryRequestInput::Representation
      
          property :request_id, as: 'requestId'
        end
      end
      
      class QueryRequestInput
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :payload, as: 'payload', class: Google::Apis::HomegraphV1::QueryRequestPayload, decorator: Google::Apis::HomegraphV1::QueryRequestPayload::Representation
      
        end
      end
      
      class QueryRequestPayload
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :devices, as: 'devices', class: Google::Apis::HomegraphV1::AgentDeviceId, decorator: Google::Apis::HomegraphV1::AgentDeviceId::Representation
      
        end
      end
      
      class QueryResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :payload, as: 'payload', class: Google::Apis::HomegraphV1::QueryResponsePayload, decorator: Google::Apis::HomegraphV1::QueryResponsePayload::Representation
      
          property :request_id, as: 'requestId'
        end
      end
      
      class QueryResponsePayload
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :devices, as: 'devices'
        end
      end
      
      class ReportStateAndNotificationDevice
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :notifications, as: 'notifications'
          hash :states, as: 'states'
        end
      end
      
      class ReportStateAndNotificationRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :agent_user_id, as: 'agentUserId'
          property :event_id, as: 'eventId'
          property :follow_up_token, as: 'followUpToken'
          property :payload, as: 'payload', class: Google::Apis::HomegraphV1::StateAndNotificationPayload, decorator: Google::Apis::HomegraphV1::StateAndNotificationPayload::Representation
      
          property :request_id, as: 'requestId'
        end
      end
      
      class ReportStateAndNotificationResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :request_id, as: 'requestId'
        end
      end
      
      class RequestSyncDevicesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :agent_user_id, as: 'agentUserId'
          property :async, as: 'async'
        end
      end
      
      class RequestSyncDevicesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class StateAndNotificationPayload
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :devices, as: 'devices', class: Google::Apis::HomegraphV1::ReportStateAndNotificationDevice, decorator: Google::Apis::HomegraphV1::ReportStateAndNotificationDevice::Representation
      
        end
      end
      
      class SyncRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :agent_user_id, as: 'agentUserId'
          property :request_id, as: 'requestId'
        end
      end
      
      class SyncResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :payload, as: 'payload', class: Google::Apis::HomegraphV1::SyncResponsePayload, decorator: Google::Apis::HomegraphV1::SyncResponsePayload::Representation
      
          property :request_id, as: 'requestId'
        end
      end
      
      class SyncResponsePayload
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :agent_user_id, as: 'agentUserId'
          collection :devices, as: 'devices', class: Google::Apis::HomegraphV1::Device, decorator: Google::Apis::HomegraphV1::Device::Representation
      
        end
      end
    end
  end
end
