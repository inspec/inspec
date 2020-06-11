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
      
      class AccessApprovalSettings
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AccessLocations
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AccessReason
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ApprovalRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ApproveApprovalRequestMessage
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ApproveDecision
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DismissApprovalRequestMessage
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DismissDecision
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Empty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EnrolledService
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListApprovalRequestsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ResourceProperties
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AccessApprovalSettings
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :enrolled_ancestor, as: 'enrolledAncestor'
          collection :enrolled_services, as: 'enrolledServices', class: Google::Apis::AccessapprovalV1beta1::EnrolledService, decorator: Google::Apis::AccessapprovalV1beta1::EnrolledService::Representation
      
          property :name, as: 'name'
          collection :notification_emails, as: 'notificationEmails'
        end
      end
      
      class AccessLocations
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :principal_office_country, as: 'principalOfficeCountry'
          property :principal_physical_location_country, as: 'principalPhysicalLocationCountry'
        end
      end
      
      class AccessReason
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :detail, as: 'detail'
          property :type, as: 'type'
        end
      end
      
      class ApprovalRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :approve, as: 'approve', class: Google::Apis::AccessapprovalV1beta1::ApproveDecision, decorator: Google::Apis::AccessapprovalV1beta1::ApproveDecision::Representation
      
          property :dismiss, as: 'dismiss', class: Google::Apis::AccessapprovalV1beta1::DismissDecision, decorator: Google::Apis::AccessapprovalV1beta1::DismissDecision::Representation
      
          property :name, as: 'name'
          property :request_time, as: 'requestTime'
          property :requested_expiration, as: 'requestedExpiration'
          property :requested_locations, as: 'requestedLocations', class: Google::Apis::AccessapprovalV1beta1::AccessLocations, decorator: Google::Apis::AccessapprovalV1beta1::AccessLocations::Representation
      
          property :requested_reason, as: 'requestedReason', class: Google::Apis::AccessapprovalV1beta1::AccessReason, decorator: Google::Apis::AccessapprovalV1beta1::AccessReason::Representation
      
          property :requested_resource_name, as: 'requestedResourceName'
          property :requested_resource_properties, as: 'requestedResourceProperties', class: Google::Apis::AccessapprovalV1beta1::ResourceProperties, decorator: Google::Apis::AccessapprovalV1beta1::ResourceProperties::Representation
      
        end
      end
      
      class ApproveApprovalRequestMessage
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :expire_time, as: 'expireTime'
        end
      end
      
      class ApproveDecision
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :approve_time, as: 'approveTime'
          property :expire_time, as: 'expireTime'
        end
      end
      
      class DismissApprovalRequestMessage
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class DismissDecision
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :dismiss_time, as: 'dismissTime'
        end
      end
      
      class Empty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class EnrolledService
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cloud_product, as: 'cloudProduct'
          property :enrollment_level, as: 'enrollmentLevel'
        end
      end
      
      class ListApprovalRequestsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :approval_requests, as: 'approvalRequests', class: Google::Apis::AccessapprovalV1beta1::ApprovalRequest, decorator: Google::Apis::AccessapprovalV1beta1::ApprovalRequest::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ResourceProperties
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :excludes_descendants, as: 'excludesDescendants'
        end
      end
    end
  end
end
