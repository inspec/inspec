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
      
      # Alerts for user account warning events.
      class AccountWarning
        include Google::Apis::Core::Hashable
      
        # Required. The email of the user that this event belongs to.
        # Corresponds to the JSON property `email`
        # @return [String]
        attr_accessor :email
      
        # The details of the login action.
        # Corresponds to the JSON property `loginDetails`
        # @return [Google::Apis::AlertcenterV1beta1::LoginDetails]
        attr_accessor :login_details
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @email = args[:email] if args.key?(:email)
          @login_details = args[:login_details] if args.key?(:login_details)
        end
      end
      
      # Alerts from G Suite Security Center rules service configured by admin.
      class ActivityRule
        include Google::Apis::Core::Hashable
      
        # List of action names associated with the rule threshold.
        # Corresponds to the JSON property `actionNames`
        # @return [Array<String>]
        attr_accessor :action_names
      
        # Rule create timestamp.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Description of the rule.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Alert display name.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # Rule name.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Query that is used to get the data from the associated source.
        # Corresponds to the JSON property `query`
        # @return [String]
        attr_accessor :query
      
        # List of alert ids superseded by this alert. It is used to indicate that
        # this alert is essentially extension of superseded alerts and we found the
        # relationship after creating these alerts.
        # Corresponds to the JSON property `supersededAlerts`
        # @return [Array<String>]
        attr_accessor :superseded_alerts
      
        # Alert id superseding this alert. It is used to indicate that superseding
        # alert is essentially extension of this alert and we found the relationship
        # after creating both alerts.
        # Corresponds to the JSON property `supersedingAlert`
        # @return [String]
        attr_accessor :superseding_alert
      
        # Alert threshold is for example “COUNT > 5”.
        # Corresponds to the JSON property `threshold`
        # @return [String]
        attr_accessor :threshold
      
        # The trigger sources for this rule.
        # * GMAIL_EVENTS
        # * DEVICE_EVENTS
        # * USER_EVENTS
        # Corresponds to the JSON property `triggerSource`
        # @return [String]
        attr_accessor :trigger_source
      
        # The timestamp of the last update to the rule.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        # Rule window size. Possible values are 1 hour or 24 hours.
        # Corresponds to the JSON property `windowSize`
        # @return [String]
        attr_accessor :window_size
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @action_names = args[:action_names] if args.key?(:action_names)
          @create_time = args[:create_time] if args.key?(:create_time)
          @description = args[:description] if args.key?(:description)
          @display_name = args[:display_name] if args.key?(:display_name)
          @name = args[:name] if args.key?(:name)
          @query = args[:query] if args.key?(:query)
          @superseded_alerts = args[:superseded_alerts] if args.key?(:superseded_alerts)
          @superseding_alert = args[:superseding_alert] if args.key?(:superseding_alert)
          @threshold = args[:threshold] if args.key?(:threshold)
          @trigger_source = args[:trigger_source] if args.key?(:trigger_source)
          @update_time = args[:update_time] if args.key?(:update_time)
          @window_size = args[:window_size] if args.key?(:window_size)
        end
      end
      
      # An alert affecting a customer.
      class Alert
        include Google::Apis::Core::Hashable
      
        # Output only. The unique identifier for the alert.
        # Corresponds to the JSON property `alertId`
        # @return [String]
        attr_accessor :alert_id
      
        # Output only. The time this alert was created.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Output only. The unique identifier of the Google account of the customer.
        # Corresponds to the JSON property `customerId`
        # @return [String]
        attr_accessor :customer_id
      
        # Optional. The data associated with this alert, for example
        # google.apps.alertcenter.type.DeviceCompromised.
        # Corresponds to the JSON property `data`
        # @return [Hash<String,Object>]
        attr_accessor :data
      
        # Output only. `True` if this alert is marked for deletion.
        # Corresponds to the JSON property `deleted`
        # @return [Boolean]
        attr_accessor :deleted
        alias_method :deleted?, :deleted
      
        # Optional. The time the event that caused this alert ceased being active.
        # If provided, the end time must not be earlier than the start time.
        # If not provided, it indicates an ongoing alert.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # Optional. `etag` is used for optimistic concurrency control as a way to help
        # prevent simultaneous updates of an alert from overwriting each other.
        # It is strongly suggested that systems make use of the `etag` in the
        # read-modify-write cycle to perform alert updates in order to avoid race
        # conditions: An `etag` is returned in the response which contains alerts,
        # and systems are expected to put that etag in the request to update alert to
        # ensure that their change will be applied to the same version of the alert.
        # If no `etag` is provided in the call to update alert, then the existing
        # alert is overwritten blindly.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # An alert metadata.
        # Corresponds to the JSON property `metadata`
        # @return [Google::Apis::AlertcenterV1beta1::AlertMetadata]
        attr_accessor :metadata
      
        # Output only. An optional
        # [Security Investigation Tool](https://support.google.com/a/answer/7575955)
        # query for this alert.
        # Corresponds to the JSON property `securityInvestigationToolLink`
        # @return [String]
        attr_accessor :security_investigation_tool_link
      
        # Required. A unique identifier for the system that reported the alert.
        # This is output only after alert is created.
        # Supported sources are any of the following:
        # * Google Operations
        # * Mobile device management
        # * Gmail phishing
        # * Domain wide takeout
        # * State sponsored attack
        # * Google identity
        # Corresponds to the JSON property `source`
        # @return [String]
        attr_accessor :source
      
        # Required. The time the event that caused this alert was started or
        # detected.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        # Required. The type of the alert.
        # This is output only after alert is created.
        # For a list of available alert types see
        # [G Suite Alert types](/admin-sdk/alertcenter/reference/alert-types).
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # Output only. The time this alert was last updated.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @alert_id = args[:alert_id] if args.key?(:alert_id)
          @create_time = args[:create_time] if args.key?(:create_time)
          @customer_id = args[:customer_id] if args.key?(:customer_id)
          @data = args[:data] if args.key?(:data)
          @deleted = args[:deleted] if args.key?(:deleted)
          @end_time = args[:end_time] if args.key?(:end_time)
          @etag = args[:etag] if args.key?(:etag)
          @metadata = args[:metadata] if args.key?(:metadata)
          @security_investigation_tool_link = args[:security_investigation_tool_link] if args.key?(:security_investigation_tool_link)
          @source = args[:source] if args.key?(:source)
          @start_time = args[:start_time] if args.key?(:start_time)
          @type = args[:type] if args.key?(:type)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # A customer feedback about an alert.
      class AlertFeedback
        include Google::Apis::Core::Hashable
      
        # Output only. The alert identifier.
        # Corresponds to the JSON property `alertId`
        # @return [String]
        attr_accessor :alert_id
      
        # Output only. The time this feedback was created.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Output only. The unique identifier of the Google account of the customer.
        # Corresponds to the JSON property `customerId`
        # @return [String]
        attr_accessor :customer_id
      
        # Output only. The email of the user that provided the feedback.
        # Corresponds to the JSON property `email`
        # @return [String]
        attr_accessor :email
      
        # Output only. The unique identifier for the feedback.
        # Corresponds to the JSON property `feedbackId`
        # @return [String]
        attr_accessor :feedback_id
      
        # Required. The type of the feedback.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @alert_id = args[:alert_id] if args.key?(:alert_id)
          @create_time = args[:create_time] if args.key?(:create_time)
          @customer_id = args[:customer_id] if args.key?(:customer_id)
          @email = args[:email] if args.key?(:email)
          @feedback_id = args[:feedback_id] if args.key?(:feedback_id)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # An alert metadata.
      class AlertMetadata
        include Google::Apis::Core::Hashable
      
        # Output only. The alert identifier.
        # Corresponds to the JSON property `alertId`
        # @return [String]
        attr_accessor :alert_id
      
        # The email address of the user assigned to the alert.
        # Corresponds to the JSON property `assignee`
        # @return [String]
        attr_accessor :assignee
      
        # Output only. The unique identifier of the Google account of the customer.
        # Corresponds to the JSON property `customerId`
        # @return [String]
        attr_accessor :customer_id
      
        # Optional. `etag` is used for optimistic concurrency control as a way to
        # help prevent simultaneous updates of an alert metadata from overwriting
        # each other. It is strongly suggested that systems make use of the `etag` in
        # the read-modify-write cycle to perform metatdata updates in order to avoid
        # race conditions: An `etag` is returned in the response which contains alert
        # metadata, and systems are expected to put that etag in the request to
        # update alert metadata to ensure that their change will be applied to the
        # same version of the alert metadata.
        # If no `etag` is provided in the call to update alert metadata, then the
        # existing alert metadata is overwritten blindly.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The severity value of the alert. Alert Center will set this field at alert
        # creation time, default's to an empty string when it could not be
        # determined.
        # The supported values for update actions on this field are the following:
        # * HIGH
        # * MEDIUM
        # * LOW
        # Corresponds to the JSON property `severity`
        # @return [String]
        attr_accessor :severity
      
        # The current status of the alert.
        # The supported values are the following:
        # * NOT_STARTED
        # * IN_PROGRESS
        # * CLOSED
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        # Output only. The time this metadata was last updated.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @alert_id = args[:alert_id] if args.key?(:alert_id)
          @assignee = args[:assignee] if args.key?(:assignee)
          @customer_id = args[:customer_id] if args.key?(:customer_id)
          @etag = args[:etag] if args.key?(:etag)
          @severity = args[:severity] if args.key?(:severity)
          @status = args[:status] if args.key?(:status)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Alerts from App Maker to notify admins to set up default SQL instance.
      class AppMakerSqlSetupNotification
        include Google::Apis::Core::Hashable
      
        # List of applications with requests for default SQL set up.
        # Corresponds to the JSON property `requestInfo`
        # @return [Array<Google::Apis::AlertcenterV1beta1::RequestInfo>]
        attr_accessor :request_info
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @request_info = args[:request_info] if args.key?(:request_info)
        end
      end
      
      # Attachment with application-specific information about an alert.
      class Attachment
        include Google::Apis::Core::Hashable
      
        # A representation of a CSV file attachment, as a list of column headers and
        # a list of data rows.
        # Corresponds to the JSON property `csv`
        # @return [Google::Apis::AlertcenterV1beta1::Csv]
        attr_accessor :csv
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @csv = args[:csv] if args.key?(:csv)
        end
      end
      
      # Alert for setting the domain or IP that malicious email comes from as
      # whitelisted domain or IP in Gmail advanced settings.
      class BadWhitelist
        include Google::Apis::Core::Hashable
      
        # Domain ID of Gmail phishing alerts.
        # Corresponds to the JSON property `domainId`
        # @return [Google::Apis::AlertcenterV1beta1::DomainId]
        attr_accessor :domain_id
      
        # Entity whose actions triggered a Gmail phishing alert.
        # Corresponds to the JSON property `maliciousEntity`
        # @return [Google::Apis::AlertcenterV1beta1::MaliciousEntity]
        attr_accessor :malicious_entity
      
        # The list of messages contained by this alert.
        # Corresponds to the JSON property `messages`
        # @return [Array<Google::Apis::AlertcenterV1beta1::GmailMessageInfo>]
        attr_accessor :messages
      
        # The source IP address of the malicious email, for example,
        # `127.0.0.1`.
        # Corresponds to the JSON property `sourceIp`
        # @return [String]
        attr_accessor :source_ip
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @domain_id = args[:domain_id] if args.key?(:domain_id)
          @malicious_entity = args[:malicious_entity] if args.key?(:malicious_entity)
          @messages = args[:messages] if args.key?(:messages)
          @source_ip = args[:source_ip] if args.key?(:source_ip)
        end
      end
      
      # A request to perform batch delete on alerts.
      class BatchDeleteAlertsRequest
        include Google::Apis::Core::Hashable
      
        # Required. list of alert ids.
        # Corresponds to the JSON property `alertId`
        # @return [Array<String>]
        attr_accessor :alert_id
      
        # Optional. The unique identifier of the G Suite organization account of the
        # customer the alerts are associated with.
        # Corresponds to the JSON property `customerId`
        # @return [String]
        attr_accessor :customer_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @alert_id = args[:alert_id] if args.key?(:alert_id)
          @customer_id = args[:customer_id] if args.key?(:customer_id)
        end
      end
      
      # Response to batch delete operation on alerts.
      class BatchDeleteAlertsResponse
        include Google::Apis::Core::Hashable
      
        # The status details for each failed alert_id.
        # Corresponds to the JSON property `failedAlertStatus`
        # @return [Hash<String,Google::Apis::AlertcenterV1beta1::Status>]
        attr_accessor :failed_alert_status
      
        # The successful list of alert ids.
        # Corresponds to the JSON property `successAlertIds`
        # @return [Array<String>]
        attr_accessor :success_alert_ids
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @failed_alert_status = args[:failed_alert_status] if args.key?(:failed_alert_status)
          @success_alert_ids = args[:success_alert_ids] if args.key?(:success_alert_ids)
        end
      end
      
      # A request to perform batch undelete on alerts.
      class BatchUndeleteAlertsRequest
        include Google::Apis::Core::Hashable
      
        # Required. list of alert ids.
        # Corresponds to the JSON property `alertId`
        # @return [Array<String>]
        attr_accessor :alert_id
      
        # Optional. The unique identifier of the G Suite organization account of the
        # customer the alerts are associated with.
        # Corresponds to the JSON property `customerId`
        # @return [String]
        attr_accessor :customer_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @alert_id = args[:alert_id] if args.key?(:alert_id)
          @customer_id = args[:customer_id] if args.key?(:customer_id)
        end
      end
      
      # Response to batch undelete operation on alerts.
      class BatchUndeleteAlertsResponse
        include Google::Apis::Core::Hashable
      
        # The status details for each failed alert_id.
        # Corresponds to the JSON property `failedAlertStatus`
        # @return [Hash<String,Google::Apis::AlertcenterV1beta1::Status>]
        attr_accessor :failed_alert_status
      
        # The successful list of alert ids.
        # Corresponds to the JSON property `successAlertIds`
        # @return [Array<String>]
        attr_accessor :success_alert_ids
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @failed_alert_status = args[:failed_alert_status] if args.key?(:failed_alert_status)
          @success_alert_ids = args[:success_alert_ids] if args.key?(:success_alert_ids)
        end
      end
      
      # A reference to a Cloud Pubsub topic.
      # To register for notifications, the owner of the topic must grant
      # `alerts-api-push-notifications@system.gserviceaccount.com` the
      # `projects.topics.publish` permission.
      class CloudPubsubTopic
        include Google::Apis::Core::Hashable
      
        # Optional. The format of the payload that would be sent.
        # If not specified the format will be JSON.
        # Corresponds to the JSON property `payloadFormat`
        # @return [String]
        attr_accessor :payload_format
      
        # The `name` field of a Cloud Pubsub [Topic]
        # (https://cloud.google.com/pubsub/docs/reference/rest/v1/projects.topics#Topic).
        # Corresponds to the JSON property `topicName`
        # @return [String]
        attr_accessor :topic_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @payload_format = args[:payload_format] if args.key?(:payload_format)
          @topic_name = args[:topic_name] if args.key?(:topic_name)
        end
      end
      
      # A representation of a CSV file attachment, as a list of column headers and
      # a list of data rows.
      class Csv
        include Google::Apis::Core::Hashable
      
        # The list of data rows in a CSV file, as string arrays rather than as a
        # single comma-separated string.
        # Corresponds to the JSON property `dataRows`
        # @return [Array<Google::Apis::AlertcenterV1beta1::CsvRow>]
        attr_accessor :data_rows
      
        # The list of headers for data columns in a CSV file.
        # Corresponds to the JSON property `headers`
        # @return [Array<String>]
        attr_accessor :headers
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @data_rows = args[:data_rows] if args.key?(:data_rows)
          @headers = args[:headers] if args.key?(:headers)
        end
      end
      
      # A representation of a single data row in a CSV file.
      class CsvRow
        include Google::Apis::Core::Hashable
      
        # The data entries in a CSV file row, as a string array rather than a
        # single comma-separated string.
        # Corresponds to the JSON property `entries`
        # @return [Array<String>]
        attr_accessor :entries
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @entries = args[:entries] if args.key?(:entries)
        end
      end
      
      # A mobile device compromised alert. Derived from audit logs.
      class DeviceCompromised
        include Google::Apis::Core::Hashable
      
        # The email of the user this alert was created for.
        # Corresponds to the JSON property `email`
        # @return [String]
        attr_accessor :email
      
        # Required. The list of security events.
        # Corresponds to the JSON property `events`
        # @return [Array<Google::Apis::AlertcenterV1beta1::DeviceCompromisedSecurityDetail>]
        attr_accessor :events
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @email = args[:email] if args.key?(:email)
          @events = args[:events] if args.key?(:events)
        end
      end
      
      # Detailed information of a single MDM device compromised event.
      class DeviceCompromisedSecurityDetail
        include Google::Apis::Core::Hashable
      
        # The device compromised state. Possible values are "`Compromised`" or
        # "`Not Compromised`".
        # Corresponds to the JSON property `deviceCompromisedState`
        # @return [String]
        attr_accessor :device_compromised_state
      
        # Required. The device ID.
        # Corresponds to the JSON property `deviceId`
        # @return [String]
        attr_accessor :device_id
      
        # The model of the device.
        # Corresponds to the JSON property `deviceModel`
        # @return [String]
        attr_accessor :device_model
      
        # The type of the device.
        # Corresponds to the JSON property `deviceType`
        # @return [String]
        attr_accessor :device_type
      
        # Required for iOS, empty for others.
        # Corresponds to the JSON property `iosVendorId`
        # @return [String]
        attr_accessor :ios_vendor_id
      
        # The device resource ID.
        # Corresponds to the JSON property `resourceId`
        # @return [String]
        attr_accessor :resource_id
      
        # The serial number of the device.
        # Corresponds to the JSON property `serialNumber`
        # @return [String]
        attr_accessor :serial_number
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @device_compromised_state = args[:device_compromised_state] if args.key?(:device_compromised_state)
          @device_id = args[:device_id] if args.key?(:device_id)
          @device_model = args[:device_model] if args.key?(:device_model)
          @device_type = args[:device_type] if args.key?(:device_type)
          @ios_vendor_id = args[:ios_vendor_id] if args.key?(:ios_vendor_id)
          @resource_id = args[:resource_id] if args.key?(:resource_id)
          @serial_number = args[:serial_number] if args.key?(:serial_number)
        end
      end
      
      # Domain ID of Gmail phishing alerts.
      class DomainId
        include Google::Apis::Core::Hashable
      
        # The primary domain for the customer.
        # Corresponds to the JSON property `customerPrimaryDomain`
        # @return [String]
        attr_accessor :customer_primary_domain
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @customer_primary_domain = args[:customer_primary_domain] if args.key?(:customer_primary_domain)
        end
      end
      
      # A takeout operation for the entire domain was initiated by an admin. Derived
      # from audit logs.
      class DomainWideTakeoutInitiated
        include Google::Apis::Core::Hashable
      
        # The email of the admin who initiated the takeout.
        # Corresponds to the JSON property `email`
        # @return [String]
        attr_accessor :email
      
        # The takeout request ID.
        # Corresponds to the JSON property `takeoutRequestId`
        # @return [String]
        attr_accessor :takeout_request_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @email = args[:email] if args.key?(:email)
          @takeout_request_id = args[:takeout_request_id] if args.key?(:takeout_request_id)
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
      
      # Details of a message in phishing spike alert.
      class GmailMessageInfo
        include Google::Apis::Core::Hashable
      
        # The `SHA256` hash of email's attachment and all MIME parts.
        # Corresponds to the JSON property `attachmentsSha256Hash`
        # @return [Array<String>]
        attr_accessor :attachments_sha256_hash
      
        # The date the malicious email was sent.
        # Corresponds to the JSON property `date`
        # @return [String]
        attr_accessor :date
      
        # The hash of the message body text.
        # Corresponds to the JSON property `md5HashMessageBody`
        # @return [String]
        attr_accessor :md5_hash_message_body
      
        # The MD5 Hash of email's subject (only available for reported emails).
        # Corresponds to the JSON property `md5HashSubject`
        # @return [String]
        attr_accessor :md5_hash_subject
      
        # The snippet of the message body text (only available for reported emails).
        # Corresponds to the JSON property `messageBodySnippet`
        # @return [String]
        attr_accessor :message_body_snippet
      
        # The message ID.
        # Corresponds to the JSON property `messageId`
        # @return [String]
        attr_accessor :message_id
      
        # The recipient of this email.
        # Corresponds to the JSON property `recipient`
        # @return [String]
        attr_accessor :recipient
      
        # The email subject text (only available for reported emails).
        # Corresponds to the JSON property `subjectText`
        # @return [String]
        attr_accessor :subject_text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @attachments_sha256_hash = args[:attachments_sha256_hash] if args.key?(:attachments_sha256_hash)
          @date = args[:date] if args.key?(:date)
          @md5_hash_message_body = args[:md5_hash_message_body] if args.key?(:md5_hash_message_body)
          @md5_hash_subject = args[:md5_hash_subject] if args.key?(:md5_hash_subject)
          @message_body_snippet = args[:message_body_snippet] if args.key?(:message_body_snippet)
          @message_id = args[:message_id] if args.key?(:message_id)
          @recipient = args[:recipient] if args.key?(:recipient)
          @subject_text = args[:subject_text] if args.key?(:subject_text)
        end
      end
      
      # An incident reported by Google Operations for a G Suite application.
      class GoogleOperations
        include Google::Apis::Core::Hashable
      
        # The list of emails which correspond to the users directly affected by the
        # incident.
        # Corresponds to the JSON property `affectedUserEmails`
        # @return [Array<String>]
        attr_accessor :affected_user_emails
      
        # Attachment with application-specific information about an alert.
        # Corresponds to the JSON property `attachmentData`
        # @return [Google::Apis::AlertcenterV1beta1::Attachment]
        attr_accessor :attachment_data
      
        # A detailed, freeform incident description.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # A one-line incident description.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @affected_user_emails = args[:affected_user_emails] if args.key?(:affected_user_emails)
          @attachment_data = args[:attachment_data] if args.key?(:attachment_data)
          @description = args[:description] if args.key?(:description)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # Response message for an alert feedback listing request.
      class ListAlertFeedbackResponse
        include Google::Apis::Core::Hashable
      
        # The list of alert feedback.
        # Feedback entries for each alert are ordered by creation time descending.
        # Corresponds to the JSON property `feedback`
        # @return [Array<Google::Apis::AlertcenterV1beta1::AlertFeedback>]
        attr_accessor :feedback
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @feedback = args[:feedback] if args.key?(:feedback)
        end
      end
      
      # Response message for an alert listing request.
      class ListAlertsResponse
        include Google::Apis::Core::Hashable
      
        # The list of alerts.
        # Corresponds to the JSON property `alerts`
        # @return [Array<Google::Apis::AlertcenterV1beta1::Alert>]
        attr_accessor :alerts
      
        # The token for the next page. If not empty, indicates that there may be more
        # alerts that match the listing request; this value can be used in a
        # subsequent ListAlertsRequest to get alerts continuing from last result
        # of the current list call.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @alerts = args[:alerts] if args.key?(:alerts)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # The details of the login action.
      class LoginDetails
        include Google::Apis::Core::Hashable
      
        # Optional. The human-readable IP address (for example,
        # `11.22.33.44`) that is associated with the warning event.
        # Corresponds to the JSON property `ipAddress`
        # @return [String]
        attr_accessor :ip_address
      
        # Optional. The successful login time that is associated with the warning
        # event. This will not be present for blocked login attempts.
        # Corresponds to the JSON property `loginTime`
        # @return [String]
        attr_accessor :login_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @ip_address = args[:ip_address] if args.key?(:ip_address)
          @login_time = args[:login_time] if args.key?(:login_time)
        end
      end
      
      # Proto for all phishing alerts with common payload.
      # Supported types are any of the following:
      # * User reported phishing
      # * User reported spam spike
      # * Suspicious message reported
      # * Phishing reclassification
      # * Malware reclassification
      class MailPhishing
        include Google::Apis::Core::Hashable
      
        # Domain ID of Gmail phishing alerts.
        # Corresponds to the JSON property `domainId`
        # @return [Google::Apis::AlertcenterV1beta1::DomainId]
        attr_accessor :domain_id
      
        # If `true`, the email originated from within the organization.
        # Corresponds to the JSON property `isInternal`
        # @return [Boolean]
        attr_accessor :is_internal
        alias_method :is_internal?, :is_internal
      
        # Entity whose actions triggered a Gmail phishing alert.
        # Corresponds to the JSON property `maliciousEntity`
        # @return [Google::Apis::AlertcenterV1beta1::MaliciousEntity]
        attr_accessor :malicious_entity
      
        # The list of messages contained by this alert.
        # Corresponds to the JSON property `messages`
        # @return [Array<Google::Apis::AlertcenterV1beta1::GmailMessageInfo>]
        attr_accessor :messages
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @domain_id = args[:domain_id] if args.key?(:domain_id)
          @is_internal = args[:is_internal] if args.key?(:is_internal)
          @malicious_entity = args[:malicious_entity] if args.key?(:malicious_entity)
          @messages = args[:messages] if args.key?(:messages)
        end
      end
      
      # Entity whose actions triggered a Gmail phishing alert.
      class MaliciousEntity
        include Google::Apis::Core::Hashable
      
        # The header from display name.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # The sender email address.
        # Corresponds to the JSON property `fromHeader`
        # @return [String]
        attr_accessor :from_header
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @display_name = args[:display_name] if args.key?(:display_name)
          @from_header = args[:from_header] if args.key?(:from_header)
        end
      end
      
      # Settings for callback notifications.
      # For more details see [G Suite Alert
      # Notification](/admin-sdk/alertcenter/guides/notifications).
      class Notification
        include Google::Apis::Core::Hashable
      
        # A reference to a Cloud Pubsub topic.
        # To register for notifications, the owner of the topic must grant
        # `alerts-api-push-notifications@system.gserviceaccount.com` the
        # `projects.topics.publish` permission.
        # Corresponds to the JSON property `cloudPubsubTopic`
        # @return [Google::Apis::AlertcenterV1beta1::CloudPubsubTopic]
        attr_accessor :cloud_pubsub_topic
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cloud_pubsub_topic = args[:cloud_pubsub_topic] if args.key?(:cloud_pubsub_topic)
        end
      end
      
      # Alert for a spike in user reported phishing.
      # <aside class="warning"><b>Warning</b>: This type has been deprecated. Use
      # [MailPhishing](/admin-sdk/alertcenter/reference/rest/v1beta1/MailPhishing)
      # instead.</aside>
      class PhishingSpike
        include Google::Apis::Core::Hashable
      
        # Domain ID of Gmail phishing alerts.
        # Corresponds to the JSON property `domainId`
        # @return [Google::Apis::AlertcenterV1beta1::DomainId]
        attr_accessor :domain_id
      
        # If `true`, the email originated from within the organization.
        # Corresponds to the JSON property `isInternal`
        # @return [Boolean]
        attr_accessor :is_internal
        alias_method :is_internal?, :is_internal
      
        # Entity whose actions triggered a Gmail phishing alert.
        # Corresponds to the JSON property `maliciousEntity`
        # @return [Google::Apis::AlertcenterV1beta1::MaliciousEntity]
        attr_accessor :malicious_entity
      
        # The list of messages contained by this alert.
        # Corresponds to the JSON property `messages`
        # @return [Array<Google::Apis::AlertcenterV1beta1::GmailMessageInfo>]
        attr_accessor :messages
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @domain_id = args[:domain_id] if args.key?(:domain_id)
          @is_internal = args[:is_internal] if args.key?(:is_internal)
          @malicious_entity = args[:malicious_entity] if args.key?(:malicious_entity)
          @messages = args[:messages] if args.key?(:messages)
        end
      end
      
      # Requests for one application that needs default SQL setup.
      class RequestInfo
        include Google::Apis::Core::Hashable
      
        # List of app developers who triggered notifications for above
        # application.
        # Corresponds to the JSON property `appDeveloperEmail`
        # @return [Array<String>]
        attr_accessor :app_developer_email
      
        # Required. The application that requires the SQL setup.
        # Corresponds to the JSON property `appKey`
        # @return [String]
        attr_accessor :app_key
      
        # Required. Number of requests sent for this application to set up default
        # SQL instance.
        # Corresponds to the JSON property `numberOfRequests`
        # @return [Fixnum]
        attr_accessor :number_of_requests
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @app_developer_email = args[:app_developer_email] if args.key?(:app_developer_email)
          @app_key = args[:app_key] if args.key?(:app_key)
          @number_of_requests = args[:number_of_requests] if args.key?(:number_of_requests)
        end
      end
      
      # Customer-level settings.
      class Settings
        include Google::Apis::Core::Hashable
      
        # The list of notifications.
        # Corresponds to the JSON property `notifications`
        # @return [Array<Google::Apis::AlertcenterV1beta1::Notification>]
        attr_accessor :notifications
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @notifications = args[:notifications] if args.key?(:notifications)
        end
      end
      
      # A state-sponsored attack alert. Derived from audit logs.
      class StateSponsoredAttack
        include Google::Apis::Core::Hashable
      
        # The email of the user this incident was created for.
        # Corresponds to the JSON property `email`
        # @return [String]
        attr_accessor :email
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @email = args[:email] if args.key?(:email)
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
      
      # A mobile suspicious activity alert. Derived from audit logs.
      class SuspiciousActivity
        include Google::Apis::Core::Hashable
      
        # The email of the user this alert was created for.
        # Corresponds to the JSON property `email`
        # @return [String]
        attr_accessor :email
      
        # Required. The list of security events.
        # Corresponds to the JSON property `events`
        # @return [Array<Google::Apis::AlertcenterV1beta1::SuspiciousActivitySecurityDetail>]
        attr_accessor :events
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @email = args[:email] if args.key?(:email)
          @events = args[:events] if args.key?(:events)
        end
      end
      
      # Detailed information of a single MDM suspicious activity event.
      class SuspiciousActivitySecurityDetail
        include Google::Apis::Core::Hashable
      
        # Required. The device ID.
        # Corresponds to the JSON property `deviceId`
        # @return [String]
        attr_accessor :device_id
      
        # The model of the device.
        # Corresponds to the JSON property `deviceModel`
        # @return [String]
        attr_accessor :device_model
      
        # The device property which was changed.
        # Corresponds to the JSON property `deviceProperty`
        # @return [String]
        attr_accessor :device_property
      
        # The type of the device.
        # Corresponds to the JSON property `deviceType`
        # @return [String]
        attr_accessor :device_type
      
        # Required for iOS, empty for others.
        # Corresponds to the JSON property `iosVendorId`
        # @return [String]
        attr_accessor :ios_vendor_id
      
        # The new value of the device property after the change.
        # Corresponds to the JSON property `newValue`
        # @return [String]
        attr_accessor :new_value
      
        # The old value of the device property before the change.
        # Corresponds to the JSON property `oldValue`
        # @return [String]
        attr_accessor :old_value
      
        # The device resource ID.
        # Corresponds to the JSON property `resourceId`
        # @return [String]
        attr_accessor :resource_id
      
        # The serial number of the device.
        # Corresponds to the JSON property `serialNumber`
        # @return [String]
        attr_accessor :serial_number
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @device_id = args[:device_id] if args.key?(:device_id)
          @device_model = args[:device_model] if args.key?(:device_model)
          @device_property = args[:device_property] if args.key?(:device_property)
          @device_type = args[:device_type] if args.key?(:device_type)
          @ios_vendor_id = args[:ios_vendor_id] if args.key?(:ios_vendor_id)
          @new_value = args[:new_value] if args.key?(:new_value)
          @old_value = args[:old_value] if args.key?(:old_value)
          @resource_id = args[:resource_id] if args.key?(:resource_id)
          @serial_number = args[:serial_number] if args.key?(:serial_number)
        end
      end
      
      # A request to undelete a specific alert that was marked for deletion.
      class UndeleteAlertRequest
        include Google::Apis::Core::Hashable
      
        # Optional. The unique identifier of the G Suite organization account of the
        # customer the alert is associated with.
        # Inferred from the caller identity if not provided.
        # Corresponds to the JSON property `customerId`
        # @return [String]
        attr_accessor :customer_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @customer_id = args[:customer_id] if args.key?(:customer_id)
        end
      end
    end
  end
end
