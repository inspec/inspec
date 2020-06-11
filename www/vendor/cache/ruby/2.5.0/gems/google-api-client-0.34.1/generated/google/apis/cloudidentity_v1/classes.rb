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
    module CloudidentityV1
      
      # An EntityKey uniquely identifies an Entity. Namespaces are used to provide
      # isolation for IDs. A single ID can be reused across namespaces but the
      # combination of a namespace and an ID must be unique.
      class EntityKey
        include Google::Apis::Core::Hashable
      
        # The ID of the entity within the given namespace. The ID must be unique
        # within its namespace.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Namespaces provide isolation for IDs, so an ID only needs to be unique
        # within its namespace.
        # Namespaces are currently only created as part of IdentitySource creation
        # from Admin Console. A namespace `"identitysources/`identity_source_id`"` is
        # created corresponding to every Identity Source `identity_source_id`.
        # Corresponds to the JSON property `namespace`
        # @return [String]
        attr_accessor :namespace
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @id = args[:id] if args.key?(:id)
          @namespace = args[:namespace] if args.key?(:namespace)
        end
      end
      
      # Resource representing a Group.
      class Group
        include Google::Apis::Core::Hashable
      
        # Output only. The time when the Group was created.
        # Output only.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # An extended description to help users determine the purpose of a Group. For
        # example, you can include information about who should join the Group, the
        # types of messages to send to the Group, links to FAQs about the Group, or
        # related Groups. Maximum length is 4,096 characters.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The Group's display name.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # An EntityKey uniquely identifies an Entity. Namespaces are used to provide
        # isolation for IDs. A single ID can be reused across namespaces but the
        # combination of a namespace and an ID must be unique.
        # Corresponds to the JSON property `groupKey`
        # @return [Google::Apis::CloudidentityV1::EntityKey]
        attr_accessor :group_key
      
        # Required. `Required`. Labels for Group resource.
        # For creating Groups under a namespace, set label key to
        # 'labels/system/groups/external' and label value as empty.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # Output only. [Resource name](https://cloud.google.com/apis/design/
        # resource_names) of the
        # Group in the format: `groups/`group_id``, where group_id is the unique ID
        # assigned to the Group.
        # Must be left blank while creating a Group.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Required. Immutable. The entity under which this Group resides in Cloud
        # Identity resource
        # hierarchy. Must be set when creating a Group, read-only afterwards.
        # Currently allowed types: `identitysources`.
        # Corresponds to the JSON property `parent`
        # @return [String]
        attr_accessor :parent
      
        # Output only. The time when the Group was last updated.
        # Output only.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @description = args[:description] if args.key?(:description)
          @display_name = args[:display_name] if args.key?(:display_name)
          @group_key = args[:group_key] if args.key?(:group_key)
          @labels = args[:labels] if args.key?(:labels)
          @name = args[:name] if args.key?(:name)
          @parent = args[:parent] if args.key?(:parent)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Response message for ListGroups operation.
      class ListGroupsResponse
        include Google::Apis::Core::Hashable
      
        # Groups returned in response to list request.
        # The results are not sorted.
        # Corresponds to the JSON property `groups`
        # @return [Array<Google::Apis::CloudidentityV1::Group>]
        attr_accessor :groups
      
        # Token to retrieve the next page of results, or empty if there are no
        # more results available for listing.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @groups = args[:groups] if args.key?(:groups)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # 
      class ListMembershipsResponse
        include Google::Apis::Core::Hashable
      
        # List of Memberships.
        # Corresponds to the JSON property `memberships`
        # @return [Array<Google::Apis::CloudidentityV1::Membership>]
        attr_accessor :memberships
      
        # Token to retrieve the next page of results, or empty if there are no
        # more results available for listing.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @memberships = args[:memberships] if args.key?(:memberships)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # 
      class LookupGroupNameResponse
        include Google::Apis::Core::Hashable
      
        # [Resource name](https://cloud.google.com/apis/design/resource_names) of the
        # Group in the format: `groups/`group_id``, where `group_id` is the unique ID
        # assigned to the Group.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # 
      class LookupMembershipNameResponse
        include Google::Apis::Core::Hashable
      
        # [Resource name](https://cloud.google.com/apis/design/resource_names) of the
        # Membership being looked up.
        # Format: `groups/`group_id`/memberships/`member_id``, where `group_id` is
        # the unique ID assigned to the Group to which Membership belongs to, and
        # `member_id` is the unique ID assigned to the member.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Resource representing a Membership within a Group
      class Membership
        include Google::Apis::Core::Hashable
      
        # Output only. Creation timestamp of the Membership. Output only.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Output only. [Resource name](https://cloud.google.com/apis/design/
        # resource_names) of the
        # Membership in the format: `groups/`group_id`/memberships/`member_id``,
        # where group_id is the unique ID assigned to the Group to which Membership
        # belongs to, and member_id is the unique ID assigned to the member
        # Must be left blank while creating a Membership.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # An EntityKey uniquely identifies an Entity. Namespaces are used to provide
        # isolation for IDs. A single ID can be reused across namespaces but the
        # combination of a namespace and an ID must be unique.
        # Corresponds to the JSON property `preferredMemberKey`
        # @return [Google::Apis::CloudidentityV1::EntityKey]
        attr_accessor :preferred_member_key
      
        # Roles for a member within the Group.
        # Currently supported MembershipRoles: `"MEMBER"`.
        # Corresponds to the JSON property `roles`
        # @return [Array<Google::Apis::CloudidentityV1::MembershipRole>]
        attr_accessor :roles
      
        # Output only. Last updated timestamp of the Membership. Output only.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @name = args[:name] if args.key?(:name)
          @preferred_member_key = args[:preferred_member_key] if args.key?(:preferred_member_key)
          @roles = args[:roles] if args.key?(:roles)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Resource representing a role within a Membership.
      class MembershipRole
        include Google::Apis::Core::Hashable
      
        # MembershipRole in string format.
        # Currently supported MembershipRoles: `"MEMBER"`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # This resource represents a long-running operation that is the result of a
      # network API call.
      class Operation
        include Google::Apis::Core::Hashable
      
        # If the value is `false`, it means the operation is still in progress.
        # If `true`, the operation is completed, and either `error` or `response` is
        # available.
        # Corresponds to the JSON property `done`
        # @return [Boolean]
        attr_accessor :done
        alias_method :done?, :done
      
        # The `Status` type defines a logical error model that is suitable for
        # different programming environments, including REST APIs and RPC APIs. It is
        # used by [gRPC](https://github.com/grpc). Each `Status` message contains
        # three pieces of data: error code, error message, and error details.
        # You can find out more about this error model and how to work with it in the
        # [API Design Guide](https://cloud.google.com/apis/design/errors).
        # Corresponds to the JSON property `error`
        # @return [Google::Apis::CloudidentityV1::Status]
        attr_accessor :error
      
        # Service-specific metadata associated with the operation.  It typically
        # contains progress information and common metadata such as create time.
        # Some services might not provide such metadata.  Any method that returns a
        # long-running operation should document the metadata type, if any.
        # Corresponds to the JSON property `metadata`
        # @return [Hash<String,Object>]
        attr_accessor :metadata
      
        # The server-assigned name, which is only unique within the same service that
        # originally returns it. If you use the default HTTP mapping, the
        # `name` should be a resource name ending with `operations/`unique_id``.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The normal response of the operation in case of success.  If the original
        # method returns no data on success, such as `Delete`, the response is
        # `google.protobuf.Empty`.  If the original method is standard
        # `Get`/`Create`/`Update`, the response should be the resource.  For other
        # methods, the response should have the type `XxxResponse`, where `Xxx`
        # is the original method name.  For example, if the original method name
        # is `TakeSnapshot()`, the inferred response type is
        # `TakeSnapshotResponse`.
        # Corresponds to the JSON property `response`
        # @return [Hash<String,Object>]
        attr_accessor :response
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @done = args[:done] if args.key?(:done)
          @error = args[:error] if args.key?(:error)
          @metadata = args[:metadata] if args.key?(:metadata)
          @name = args[:name] if args.key?(:name)
          @response = args[:response] if args.key?(:response)
        end
      end
      
      # 
      class SearchGroupsResponse
        include Google::Apis::Core::Hashable
      
        # List of Groups satisfying the search query.
        # Corresponds to the JSON property `groups`
        # @return [Array<Google::Apis::CloudidentityV1::Group>]
        attr_accessor :groups
      
        # Token to retrieve the next page of results, or empty if there are no
        # more results available for specified query.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @groups = args[:groups] if args.key?(:groups)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
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
    end
  end
end
