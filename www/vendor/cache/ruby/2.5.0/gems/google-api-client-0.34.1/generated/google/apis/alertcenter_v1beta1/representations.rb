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
    module AlertcenterV1beta1
      
      class AccountWarning
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ActivityRule
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Alert
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AlertFeedback
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AlertMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AppMakerSqlSetupNotification
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Attachment
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BadWhitelist
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BatchDeleteAlertsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BatchDeleteAlertsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BatchUndeleteAlertsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BatchUndeleteAlertsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CloudPubsubTopic
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Csv
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CsvRow
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeviceCompromised
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeviceCompromisedSecurityDetail
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DomainId
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DomainWideTakeoutInitiated
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Empty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GmailMessageInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleOperations
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListAlertFeedbackResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListAlertsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LoginDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MailPhishing
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MaliciousEntity
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Notification
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PhishingSpike
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RequestInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Settings
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class StateSponsoredAttack
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Status
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SuspiciousActivity
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SuspiciousActivitySecurityDetail
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UndeleteAlertRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AccountWarning
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :email, as: 'email'
          property :login_details, as: 'loginDetails', class: Google::Apis::AlertcenterV1beta1::LoginDetails, decorator: Google::Apis::AlertcenterV1beta1::LoginDetails::Representation
      
        end
      end
      
      class ActivityRule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :action_names, as: 'actionNames'
          property :create_time, as: 'createTime'
          property :description, as: 'description'
          property :display_name, as: 'displayName'
          property :name, as: 'name'
          property :query, as: 'query'
          collection :superseded_alerts, as: 'supersededAlerts'
          property :superseding_alert, as: 'supersedingAlert'
          property :threshold, as: 'threshold'
          property :trigger_source, as: 'triggerSource'
          property :update_time, as: 'updateTime'
          property :window_size, as: 'windowSize'
        end
      end
      
      class Alert
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :alert_id, as: 'alertId'
          property :create_time, as: 'createTime'
          property :customer_id, as: 'customerId'
          hash :data, as: 'data'
          property :deleted, as: 'deleted'
          property :end_time, as: 'endTime'
          property :etag, as: 'etag'
          property :metadata, as: 'metadata', class: Google::Apis::AlertcenterV1beta1::AlertMetadata, decorator: Google::Apis::AlertcenterV1beta1::AlertMetadata::Representation
      
          property :security_investigation_tool_link, as: 'securityInvestigationToolLink'
          property :source, as: 'source'
          property :start_time, as: 'startTime'
          property :type, as: 'type'
          property :update_time, as: 'updateTime'
        end
      end
      
      class AlertFeedback
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :alert_id, as: 'alertId'
          property :create_time, as: 'createTime'
          property :customer_id, as: 'customerId'
          property :email, as: 'email'
          property :feedback_id, as: 'feedbackId'
          property :type, as: 'type'
        end
      end
      
      class AlertMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :alert_id, as: 'alertId'
          property :assignee, as: 'assignee'
          property :customer_id, as: 'customerId'
          property :etag, as: 'etag'
          property :severity, as: 'severity'
          property :status, as: 'status'
          property :update_time, as: 'updateTime'
        end
      end
      
      class AppMakerSqlSetupNotification
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :request_info, as: 'requestInfo', class: Google::Apis::AlertcenterV1beta1::RequestInfo, decorator: Google::Apis::AlertcenterV1beta1::RequestInfo::Representation
      
        end
      end
      
      class Attachment
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :csv, as: 'csv', class: Google::Apis::AlertcenterV1beta1::Csv, decorator: Google::Apis::AlertcenterV1beta1::Csv::Representation
      
        end
      end
      
      class BadWhitelist
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :domain_id, as: 'domainId', class: Google::Apis::AlertcenterV1beta1::DomainId, decorator: Google::Apis::AlertcenterV1beta1::DomainId::Representation
      
          property :malicious_entity, as: 'maliciousEntity', class: Google::Apis::AlertcenterV1beta1::MaliciousEntity, decorator: Google::Apis::AlertcenterV1beta1::MaliciousEntity::Representation
      
          collection :messages, as: 'messages', class: Google::Apis::AlertcenterV1beta1::GmailMessageInfo, decorator: Google::Apis::AlertcenterV1beta1::GmailMessageInfo::Representation
      
          property :source_ip, as: 'sourceIp'
        end
      end
      
      class BatchDeleteAlertsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :alert_id, as: 'alertId'
          property :customer_id, as: 'customerId'
        end
      end
      
      class BatchDeleteAlertsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :failed_alert_status, as: 'failedAlertStatus', class: Google::Apis::AlertcenterV1beta1::Status, decorator: Google::Apis::AlertcenterV1beta1::Status::Representation
      
          collection :success_alert_ids, as: 'successAlertIds'
        end
      end
      
      class BatchUndeleteAlertsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :alert_id, as: 'alertId'
          property :customer_id, as: 'customerId'
        end
      end
      
      class BatchUndeleteAlertsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :failed_alert_status, as: 'failedAlertStatus', class: Google::Apis::AlertcenterV1beta1::Status, decorator: Google::Apis::AlertcenterV1beta1::Status::Representation
      
          collection :success_alert_ids, as: 'successAlertIds'
        end
      end
      
      class CloudPubsubTopic
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :payload_format, as: 'payloadFormat'
          property :topic_name, as: 'topicName'
        end
      end
      
      class Csv
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :data_rows, as: 'dataRows', class: Google::Apis::AlertcenterV1beta1::CsvRow, decorator: Google::Apis::AlertcenterV1beta1::CsvRow::Representation
      
          collection :headers, as: 'headers'
        end
      end
      
      class CsvRow
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :entries, as: 'entries'
        end
      end
      
      class DeviceCompromised
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :email, as: 'email'
          collection :events, as: 'events', class: Google::Apis::AlertcenterV1beta1::DeviceCompromisedSecurityDetail, decorator: Google::Apis::AlertcenterV1beta1::DeviceCompromisedSecurityDetail::Representation
      
        end
      end
      
      class DeviceCompromisedSecurityDetail
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :device_compromised_state, as: 'deviceCompromisedState'
          property :device_id, as: 'deviceId'
          property :device_model, as: 'deviceModel'
          property :device_type, as: 'deviceType'
          property :ios_vendor_id, as: 'iosVendorId'
          property :resource_id, as: 'resourceId'
          property :serial_number, as: 'serialNumber'
        end
      end
      
      class DomainId
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :customer_primary_domain, as: 'customerPrimaryDomain'
        end
      end
      
      class DomainWideTakeoutInitiated
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :email, as: 'email'
          property :takeout_request_id, as: 'takeoutRequestId'
        end
      end
      
      class Empty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class GmailMessageInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :attachments_sha256_hash, as: 'attachmentsSha256Hash'
          property :date, as: 'date'
          property :md5_hash_message_body, as: 'md5HashMessageBody'
          property :md5_hash_subject, as: 'md5HashSubject'
          property :message_body_snippet, as: 'messageBodySnippet'
          property :message_id, as: 'messageId'
          property :recipient, as: 'recipient'
          property :subject_text, as: 'subjectText'
        end
      end
      
      class GoogleOperations
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :affected_user_emails, as: 'affectedUserEmails'
          property :attachment_data, as: 'attachmentData', class: Google::Apis::AlertcenterV1beta1::Attachment, decorator: Google::Apis::AlertcenterV1beta1::Attachment::Representation
      
          property :description, as: 'description'
          property :title, as: 'title'
        end
      end
      
      class ListAlertFeedbackResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :feedback, as: 'feedback', class: Google::Apis::AlertcenterV1beta1::AlertFeedback, decorator: Google::Apis::AlertcenterV1beta1::AlertFeedback::Representation
      
        end
      end
      
      class ListAlertsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :alerts, as: 'alerts', class: Google::Apis::AlertcenterV1beta1::Alert, decorator: Google::Apis::AlertcenterV1beta1::Alert::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class LoginDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :ip_address, as: 'ipAddress'
          property :login_time, as: 'loginTime'
        end
      end
      
      class MailPhishing
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :domain_id, as: 'domainId', class: Google::Apis::AlertcenterV1beta1::DomainId, decorator: Google::Apis::AlertcenterV1beta1::DomainId::Representation
      
          property :is_internal, as: 'isInternal'
          property :malicious_entity, as: 'maliciousEntity', class: Google::Apis::AlertcenterV1beta1::MaliciousEntity, decorator: Google::Apis::AlertcenterV1beta1::MaliciousEntity::Representation
      
          collection :messages, as: 'messages', class: Google::Apis::AlertcenterV1beta1::GmailMessageInfo, decorator: Google::Apis::AlertcenterV1beta1::GmailMessageInfo::Representation
      
        end
      end
      
      class MaliciousEntity
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :display_name, as: 'displayName'
          property :from_header, as: 'fromHeader'
        end
      end
      
      class Notification
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cloud_pubsub_topic, as: 'cloudPubsubTopic', class: Google::Apis::AlertcenterV1beta1::CloudPubsubTopic, decorator: Google::Apis::AlertcenterV1beta1::CloudPubsubTopic::Representation
      
        end
      end
      
      class PhishingSpike
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :domain_id, as: 'domainId', class: Google::Apis::AlertcenterV1beta1::DomainId, decorator: Google::Apis::AlertcenterV1beta1::DomainId::Representation
      
          property :is_internal, as: 'isInternal'
          property :malicious_entity, as: 'maliciousEntity', class: Google::Apis::AlertcenterV1beta1::MaliciousEntity, decorator: Google::Apis::AlertcenterV1beta1::MaliciousEntity::Representation
      
          collection :messages, as: 'messages', class: Google::Apis::AlertcenterV1beta1::GmailMessageInfo, decorator: Google::Apis::AlertcenterV1beta1::GmailMessageInfo::Representation
      
        end
      end
      
      class RequestInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :app_developer_email, as: 'appDeveloperEmail'
          property :app_key, as: 'appKey'
          property :number_of_requests, :numeric_string => true, as: 'numberOfRequests'
        end
      end
      
      class Settings
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :notifications, as: 'notifications', class: Google::Apis::AlertcenterV1beta1::Notification, decorator: Google::Apis::AlertcenterV1beta1::Notification::Representation
      
        end
      end
      
      class StateSponsoredAttack
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :email, as: 'email'
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
      
      class SuspiciousActivity
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :email, as: 'email'
          collection :events, as: 'events', class: Google::Apis::AlertcenterV1beta1::SuspiciousActivitySecurityDetail, decorator: Google::Apis::AlertcenterV1beta1::SuspiciousActivitySecurityDetail::Representation
      
        end
      end
      
      class SuspiciousActivitySecurityDetail
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :device_id, as: 'deviceId'
          property :device_model, as: 'deviceModel'
          property :device_property, as: 'deviceProperty'
          property :device_type, as: 'deviceType'
          property :ios_vendor_id, as: 'iosVendorId'
          property :new_value, as: 'newValue'
          property :old_value, as: 'oldValue'
          property :resource_id, as: 'resourceId'
          property :serial_number, as: 'serialNumber'
        end
      end
      
      class UndeleteAlertRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :customer_id, as: 'customerId'
        end
      end
    end
  end
end
