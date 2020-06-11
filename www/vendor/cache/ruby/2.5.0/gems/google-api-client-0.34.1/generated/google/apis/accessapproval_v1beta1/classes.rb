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
    module AccessapprovalV1beta1
      
      # Settings on a Project/Folder/Organization related to Access Approval.
      class AccessApprovalSettings
        include Google::Apis::Core::Hashable
      
        # Output only. This field is read only (not settable via
        # UpdateAccessAccessApprovalSettings method). If the field is true, that
        # indicates that at least one service is enrolled for Access Approval in one
        # or more ancestors of the Project or Folder (this field will always be
        # unset for the organization since organizations do not have ancestors).
        # Corresponds to the JSON property `enrolledAncestor`
        # @return [Boolean]
        attr_accessor :enrolled_ancestor
        alias_method :enrolled_ancestor?, :enrolled_ancestor
      
        # A list of Google Cloud Services for which the given resource has Access
        # Approval enrolled. Access requests for the resource given by name against
        # any of these services contained here will be required to have explicit
        # approval. If name refers to an organization, enrollment can be done for
        # individual services. If name refers to a folder or project, enrollment can
        # only be done on an all or nothing basis.
        # If a cloud_product is repeated in this list, the first entry will be
        # honored and all following entries will be discarded. A maximum of 10
        # enrolled services will be enforced, to be expanded as the set of supported
        # services is expanded.
        # Corresponds to the JSON property `enrolledServices`
        # @return [Array<Google::Apis::AccessapprovalV1beta1::EnrolledService>]
        attr_accessor :enrolled_services
      
        # The resource name of the settings. Format is one of:
        # <ol>
        # <li>"projects/`project_id`/accessApprovalSettings"</li>
        # <li>"folders/`folder_id`/accessApprovalSettings"</li>
        # <li>"organizations/`organization_id`/accessApprovalSettings"</li>
        # <ol>
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # A list of email addresses to which notifications relating to approval
        # requests should be sent. Notifications relating to a resource will be sent
        # to all emails in the settings of ancestor resources of that resource. A
        # maximum of 50 email addresses are allowed.
        # Corresponds to the JSON property `notificationEmails`
        # @return [Array<String>]
        attr_accessor :notification_emails
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @enrolled_ancestor = args[:enrolled_ancestor] if args.key?(:enrolled_ancestor)
          @enrolled_services = args[:enrolled_services] if args.key?(:enrolled_services)
          @name = args[:name] if args.key?(:name)
          @notification_emails = args[:notification_emails] if args.key?(:notification_emails)
        end
      end
      
      # Home office and physical location of the principal.
      class AccessLocations
        include Google::Apis::Core::Hashable
      
        # The "home office" location of the principal. A two-letter country code
        # (ISO 3166-1 alpha-2), such as "US", "DE" or "GB" or a region code. In some
        # limited situations Google systems may refer refer to a region code instead
        # of a country code.
        # Possible Region Codes:
        # <ol>
        # <li>ASI: Asia</li>
        # <li>EUR: Europe</li>
        # <li>OCE: Oceania</li>
        # <li>AFR: Africa</li>
        # <li>NAM: North America</li>
        # <li>SAM: South America</li>
        # <li>ANT: Antarctica</li>
        # <li>ANY: Any location</li>
        # </ol>
        # Corresponds to the JSON property `principalOfficeCountry`
        # @return [String]
        attr_accessor :principal_office_country
      
        # Physical location of the principal at the time of the access. A
        # two-letter country code (ISO 3166-1 alpha-2), such as "US", "DE" or "GB" or
        # a region code. In some limited situations Google systems may refer refer to
        # a region code instead of a country code.
        # Possible Region Codes:
        # <ol>
        # <li>ASI: Asia</li>
        # <li>EUR: Europe</li>
        # <li>OCE: Oceania</li>
        # <li>AFR: Africa</li>
        # <li>NAM: North America</li>
        # <li>SAM: South America</li>
        # <li>ANT: Antarctica</li>
        # <li>ANY: Any location</li>
        # </ol>
        # Corresponds to the JSON property `principalPhysicalLocationCountry`
        # @return [String]
        attr_accessor :principal_physical_location_country
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @principal_office_country = args[:principal_office_country] if args.key?(:principal_office_country)
          @principal_physical_location_country = args[:principal_physical_location_country] if args.key?(:principal_physical_location_country)
        end
      end
      
      # 
      class AccessReason
        include Google::Apis::Core::Hashable
      
        # More detail about certain reason types. See comments for each type above.
        # Corresponds to the JSON property `detail`
        # @return [String]
        attr_accessor :detail
      
        # Type of access justification.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @detail = args[:detail] if args.key?(:detail)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # A request for the customer to approve access to a resource.
      class ApprovalRequest
        include Google::Apis::Core::Hashable
      
        # A decision that has been made to approve access to a resource.
        # Corresponds to the JSON property `approve`
        # @return [Google::Apis::AccessapprovalV1beta1::ApproveDecision]
        attr_accessor :approve
      
        # A decision that has been made to dismiss an approval request.
        # Corresponds to the JSON property `dismiss`
        # @return [Google::Apis::AccessapprovalV1beta1::DismissDecision]
        attr_accessor :dismiss
      
        # The resource name of the request. Format is
        # "`projects|folders|organizations`/`id`/approvalRequests/`approval_request_id`".
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The time at which approval was requested.
        # Corresponds to the JSON property `requestTime`
        # @return [String]
        attr_accessor :request_time
      
        # The requested expiration for the approval. If the request is approved,
        # access will be granted from the time of approval until the expiration time.
        # Corresponds to the JSON property `requestedExpiration`
        # @return [String]
        attr_accessor :requested_expiration
      
        # Home office and physical location of the principal.
        # Corresponds to the JSON property `requestedLocations`
        # @return [Google::Apis::AccessapprovalV1beta1::AccessLocations]
        attr_accessor :requested_locations
      
        # The justification for which approval is being requested.
        # Corresponds to the JSON property `requestedReason`
        # @return [Google::Apis::AccessapprovalV1beta1::AccessReason]
        attr_accessor :requested_reason
      
        # The resource for which approval is being requested. The format of the
        # resource name is defined at
        # https://cloud.google.com/apis/design/resource_names. The resource name here
        # may either be a "full" resource name (e.g.
        # "//library.googleapis.com/shelves/shelf1/books/book2") or a "relative"
        # resource name (e.g. "shelves/shelf1/books/book2") as described in the
        # resource name specification.
        # Corresponds to the JSON property `requestedResourceName`
        # @return [String]
        attr_accessor :requested_resource_name
      
        # The properties associated with the resource of the request.
        # Corresponds to the JSON property `requestedResourceProperties`
        # @return [Google::Apis::AccessapprovalV1beta1::ResourceProperties]
        attr_accessor :requested_resource_properties
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @approve = args[:approve] if args.key?(:approve)
          @dismiss = args[:dismiss] if args.key?(:dismiss)
          @name = args[:name] if args.key?(:name)
          @request_time = args[:request_time] if args.key?(:request_time)
          @requested_expiration = args[:requested_expiration] if args.key?(:requested_expiration)
          @requested_locations = args[:requested_locations] if args.key?(:requested_locations)
          @requested_reason = args[:requested_reason] if args.key?(:requested_reason)
          @requested_resource_name = args[:requested_resource_name] if args.key?(:requested_resource_name)
          @requested_resource_properties = args[:requested_resource_properties] if args.key?(:requested_resource_properties)
        end
      end
      
      # Request to approve an ApprovalRequest.
      class ApproveApprovalRequestMessage
        include Google::Apis::Core::Hashable
      
        # The expiration time of this approval.
        # Corresponds to the JSON property `expireTime`
        # @return [String]
        attr_accessor :expire_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @expire_time = args[:expire_time] if args.key?(:expire_time)
        end
      end
      
      # A decision that has been made to approve access to a resource.
      class ApproveDecision
        include Google::Apis::Core::Hashable
      
        # The time at which approval was granted.
        # Corresponds to the JSON property `approveTime`
        # @return [String]
        attr_accessor :approve_time
      
        # The time at which the approval expires.
        # Corresponds to the JSON property `expireTime`
        # @return [String]
        attr_accessor :expire_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @approve_time = args[:approve_time] if args.key?(:approve_time)
          @expire_time = args[:expire_time] if args.key?(:expire_time)
        end
      end
      
      # Request to dismiss an approval request.
      class DismissApprovalRequestMessage
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # A decision that has been made to dismiss an approval request.
      class DismissDecision
        include Google::Apis::Core::Hashable
      
        # The time at which the approval request was dismissed.
        # Corresponds to the JSON property `dismissTime`
        # @return [String]
        attr_accessor :dismiss_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dismiss_time = args[:dismiss_time] if args.key?(:dismiss_time)
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
      
      # Represents the enrollment of a cloud resource into a specific service.
      class EnrolledService
        include Google::Apis::Core::Hashable
      
        # The product for which Access Approval will be enrolled. Allowed values are
        # listed below (case-sensitive):
        # <ol>
        # <li>all</li>
        # <li>appengine.googleapis.com</li>
        # <li>bigquery.googleapis.com</li>
        # <li>bigtable.googleapis.com</li>
        # <li>cloudkms.googleapis.com</li>
        # <li>compute.googleapis.com</li>
        # <li>dataflow.googleapis.com</li>
        # <li>iam.googleapis.com</li>
        # <li>pubsub.googleapis.com</li>
        # <li>storage.googleapis.com</li>
        # <ol>
        # Corresponds to the JSON property `cloudProduct`
        # @return [String]
        attr_accessor :cloud_product
      
        # The enrollment level of the service.
        # Corresponds to the JSON property `enrollmentLevel`
        # @return [String]
        attr_accessor :enrollment_level
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cloud_product = args[:cloud_product] if args.key?(:cloud_product)
          @enrollment_level = args[:enrollment_level] if args.key?(:enrollment_level)
        end
      end
      
      # Response to listing of ApprovalRequest objects.
      class ListApprovalRequestsResponse
        include Google::Apis::Core::Hashable
      
        # Approval request details.
        # Corresponds to the JSON property `approvalRequests`
        # @return [Array<Google::Apis::AccessapprovalV1beta1::ApprovalRequest>]
        attr_accessor :approval_requests
      
        # Token to retrieve the next page of results, or empty if there are no more.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @approval_requests = args[:approval_requests] if args.key?(:approval_requests)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # The properties associated with the resource of the request.
      class ResourceProperties
        include Google::Apis::Core::Hashable
      
        # Whether an approval will exclude the descendants of the resource being
        # requested.
        # Corresponds to the JSON property `excludesDescendants`
        # @return [Boolean]
        attr_accessor :excludes_descendants
        alias_method :excludes_descendants?, :excludes_descendants
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @excludes_descendants = args[:excludes_descendants] if args.key?(:excludes_descendants)
        end
      end
    end
  end
end
