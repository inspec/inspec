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
    module PeopleV1
      
      class Address
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AgeRangeType
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BatchGetContactGroupsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Biography
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Birthday
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BraggingRights
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ContactGroup
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ContactGroupMembership
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ContactGroupMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ContactGroupResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CoverPhoto
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateContactGroupRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Date
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeleteContactPhotoResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DomainMembership
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EmailAddress
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Empty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Event
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FieldMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Gender
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GetPeopleResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ImClient
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Interest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListConnectionsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListContactGroupsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Locale
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Membership
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ModifyContactGroupMembersRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ModifyContactGroupMembersResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Name
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Nickname
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Occupation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Organization
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Person
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PersonMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PersonResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PhoneNumber
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Photo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ProfileMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Relation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RelationshipInterest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RelationshipStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Residence
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SipAddress
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Skill
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Source
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Status
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Tagline
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UpdateContactGroupRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UpdateContactPhotoRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UpdateContactPhotoResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Url
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UserDefined
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Address
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :city, as: 'city'
          property :country, as: 'country'
          property :country_code, as: 'countryCode'
          property :extended_address, as: 'extendedAddress'
          property :formatted_type, as: 'formattedType'
          property :formatted_value, as: 'formattedValue'
          property :metadata, as: 'metadata', class: Google::Apis::PeopleV1::FieldMetadata, decorator: Google::Apis::PeopleV1::FieldMetadata::Representation
      
          property :po_box, as: 'poBox'
          property :postal_code, as: 'postalCode'
          property :region, as: 'region'
          property :street_address, as: 'streetAddress'
          property :type, as: 'type'
        end
      end
      
      class AgeRangeType
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :age_range, as: 'ageRange'
          property :metadata, as: 'metadata', class: Google::Apis::PeopleV1::FieldMetadata, decorator: Google::Apis::PeopleV1::FieldMetadata::Representation
      
        end
      end
      
      class BatchGetContactGroupsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :responses, as: 'responses', class: Google::Apis::PeopleV1::ContactGroupResponse, decorator: Google::Apis::PeopleV1::ContactGroupResponse::Representation
      
        end
      end
      
      class Biography
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :content_type, as: 'contentType'
          property :metadata, as: 'metadata', class: Google::Apis::PeopleV1::FieldMetadata, decorator: Google::Apis::PeopleV1::FieldMetadata::Representation
      
          property :value, as: 'value'
        end
      end
      
      class Birthday
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :date, as: 'date', class: Google::Apis::PeopleV1::Date, decorator: Google::Apis::PeopleV1::Date::Representation
      
          property :metadata, as: 'metadata', class: Google::Apis::PeopleV1::FieldMetadata, decorator: Google::Apis::PeopleV1::FieldMetadata::Representation
      
          property :text, as: 'text'
        end
      end
      
      class BraggingRights
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :metadata, as: 'metadata', class: Google::Apis::PeopleV1::FieldMetadata, decorator: Google::Apis::PeopleV1::FieldMetadata::Representation
      
          property :value, as: 'value'
        end
      end
      
      class ContactGroup
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :formatted_name, as: 'formattedName'
          property :group_type, as: 'groupType'
          property :member_count, as: 'memberCount'
          collection :member_resource_names, as: 'memberResourceNames'
          property :metadata, as: 'metadata', class: Google::Apis::PeopleV1::ContactGroupMetadata, decorator: Google::Apis::PeopleV1::ContactGroupMetadata::Representation
      
          property :name, as: 'name'
          property :resource_name, as: 'resourceName'
        end
      end
      
      class ContactGroupMembership
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :contact_group_id, as: 'contactGroupId'
          property :contact_group_resource_name, as: 'contactGroupResourceName'
        end
      end
      
      class ContactGroupMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :deleted, as: 'deleted'
          property :update_time, as: 'updateTime'
        end
      end
      
      class ContactGroupResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :contact_group, as: 'contactGroup', class: Google::Apis::PeopleV1::ContactGroup, decorator: Google::Apis::PeopleV1::ContactGroup::Representation
      
          property :requested_resource_name, as: 'requestedResourceName'
          property :status, as: 'status', class: Google::Apis::PeopleV1::Status, decorator: Google::Apis::PeopleV1::Status::Representation
      
        end
      end
      
      class CoverPhoto
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :default, as: 'default'
          property :metadata, as: 'metadata', class: Google::Apis::PeopleV1::FieldMetadata, decorator: Google::Apis::PeopleV1::FieldMetadata::Representation
      
          property :url, as: 'url'
        end
      end
      
      class CreateContactGroupRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :contact_group, as: 'contactGroup', class: Google::Apis::PeopleV1::ContactGroup, decorator: Google::Apis::PeopleV1::ContactGroup::Representation
      
        end
      end
      
      class Date
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :day, as: 'day'
          property :month, as: 'month'
          property :year, as: 'year'
        end
      end
      
      class DeleteContactPhotoResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :person, as: 'person', class: Google::Apis::PeopleV1::Person, decorator: Google::Apis::PeopleV1::Person::Representation
      
        end
      end
      
      class DomainMembership
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :in_viewer_domain, as: 'inViewerDomain'
        end
      end
      
      class EmailAddress
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :display_name, as: 'displayName'
          property :formatted_type, as: 'formattedType'
          property :metadata, as: 'metadata', class: Google::Apis::PeopleV1::FieldMetadata, decorator: Google::Apis::PeopleV1::FieldMetadata::Representation
      
          property :type, as: 'type'
          property :value, as: 'value'
        end
      end
      
      class Empty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class Event
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :date, as: 'date', class: Google::Apis::PeopleV1::Date, decorator: Google::Apis::PeopleV1::Date::Representation
      
          property :formatted_type, as: 'formattedType'
          property :metadata, as: 'metadata', class: Google::Apis::PeopleV1::FieldMetadata, decorator: Google::Apis::PeopleV1::FieldMetadata::Representation
      
          property :type, as: 'type'
        end
      end
      
      class FieldMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :primary, as: 'primary'
          property :source, as: 'source', class: Google::Apis::PeopleV1::Source, decorator: Google::Apis::PeopleV1::Source::Representation
      
          property :verified, as: 'verified'
        end
      end
      
      class Gender
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :formatted_value, as: 'formattedValue'
          property :metadata, as: 'metadata', class: Google::Apis::PeopleV1::FieldMetadata, decorator: Google::Apis::PeopleV1::FieldMetadata::Representation
      
          property :value, as: 'value'
        end
      end
      
      class GetPeopleResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :responses, as: 'responses', class: Google::Apis::PeopleV1::PersonResponse, decorator: Google::Apis::PeopleV1::PersonResponse::Representation
      
        end
      end
      
      class ImClient
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :formatted_protocol, as: 'formattedProtocol'
          property :formatted_type, as: 'formattedType'
          property :metadata, as: 'metadata', class: Google::Apis::PeopleV1::FieldMetadata, decorator: Google::Apis::PeopleV1::FieldMetadata::Representation
      
          property :protocol, as: 'protocol'
          property :type, as: 'type'
          property :username, as: 'username'
        end
      end
      
      class Interest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :metadata, as: 'metadata', class: Google::Apis::PeopleV1::FieldMetadata, decorator: Google::Apis::PeopleV1::FieldMetadata::Representation
      
          property :value, as: 'value'
        end
      end
      
      class ListConnectionsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :connections, as: 'connections', class: Google::Apis::PeopleV1::Person, decorator: Google::Apis::PeopleV1::Person::Representation
      
          property :next_page_token, as: 'nextPageToken'
          property :next_sync_token, as: 'nextSyncToken'
          property :total_items, as: 'totalItems'
          property :total_people, as: 'totalPeople'
        end
      end
      
      class ListContactGroupsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :contact_groups, as: 'contactGroups', class: Google::Apis::PeopleV1::ContactGroup, decorator: Google::Apis::PeopleV1::ContactGroup::Representation
      
          property :next_page_token, as: 'nextPageToken'
          property :next_sync_token, as: 'nextSyncToken'
          property :total_items, as: 'totalItems'
        end
      end
      
      class Locale
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :metadata, as: 'metadata', class: Google::Apis::PeopleV1::FieldMetadata, decorator: Google::Apis::PeopleV1::FieldMetadata::Representation
      
          property :value, as: 'value'
        end
      end
      
      class Membership
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :contact_group_membership, as: 'contactGroupMembership', class: Google::Apis::PeopleV1::ContactGroupMembership, decorator: Google::Apis::PeopleV1::ContactGroupMembership::Representation
      
          property :domain_membership, as: 'domainMembership', class: Google::Apis::PeopleV1::DomainMembership, decorator: Google::Apis::PeopleV1::DomainMembership::Representation
      
          property :metadata, as: 'metadata', class: Google::Apis::PeopleV1::FieldMetadata, decorator: Google::Apis::PeopleV1::FieldMetadata::Representation
      
        end
      end
      
      class ModifyContactGroupMembersRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :resource_names_to_add, as: 'resourceNamesToAdd'
          collection :resource_names_to_remove, as: 'resourceNamesToRemove'
        end
      end
      
      class ModifyContactGroupMembersResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :can_not_remove_last_contact_group_resource_names, as: 'canNotRemoveLastContactGroupResourceNames'
          collection :not_found_resource_names, as: 'notFoundResourceNames'
        end
      end
      
      class Name
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :display_name, as: 'displayName'
          property :display_name_last_first, as: 'displayNameLastFirst'
          property :family_name, as: 'familyName'
          property :given_name, as: 'givenName'
          property :honorific_prefix, as: 'honorificPrefix'
          property :honorific_suffix, as: 'honorificSuffix'
          property :metadata, as: 'metadata', class: Google::Apis::PeopleV1::FieldMetadata, decorator: Google::Apis::PeopleV1::FieldMetadata::Representation
      
          property :middle_name, as: 'middleName'
          property :phonetic_family_name, as: 'phoneticFamilyName'
          property :phonetic_full_name, as: 'phoneticFullName'
          property :phonetic_given_name, as: 'phoneticGivenName'
          property :phonetic_honorific_prefix, as: 'phoneticHonorificPrefix'
          property :phonetic_honorific_suffix, as: 'phoneticHonorificSuffix'
          property :phonetic_middle_name, as: 'phoneticMiddleName'
        end
      end
      
      class Nickname
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :metadata, as: 'metadata', class: Google::Apis::PeopleV1::FieldMetadata, decorator: Google::Apis::PeopleV1::FieldMetadata::Representation
      
          property :type, as: 'type'
          property :value, as: 'value'
        end
      end
      
      class Occupation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :metadata, as: 'metadata', class: Google::Apis::PeopleV1::FieldMetadata, decorator: Google::Apis::PeopleV1::FieldMetadata::Representation
      
          property :value, as: 'value'
        end
      end
      
      class Organization
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :current, as: 'current'
          property :department, as: 'department'
          property :domain, as: 'domain'
          property :end_date, as: 'endDate', class: Google::Apis::PeopleV1::Date, decorator: Google::Apis::PeopleV1::Date::Representation
      
          property :formatted_type, as: 'formattedType'
          property :job_description, as: 'jobDescription'
          property :location, as: 'location'
          property :metadata, as: 'metadata', class: Google::Apis::PeopleV1::FieldMetadata, decorator: Google::Apis::PeopleV1::FieldMetadata::Representation
      
          property :name, as: 'name'
          property :phonetic_name, as: 'phoneticName'
          property :start_date, as: 'startDate', class: Google::Apis::PeopleV1::Date, decorator: Google::Apis::PeopleV1::Date::Representation
      
          property :symbol, as: 'symbol'
          property :title, as: 'title'
          property :type, as: 'type'
        end
      end
      
      class Person
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :addresses, as: 'addresses', class: Google::Apis::PeopleV1::Address, decorator: Google::Apis::PeopleV1::Address::Representation
      
          property :age_range, as: 'ageRange'
          collection :age_ranges, as: 'ageRanges', class: Google::Apis::PeopleV1::AgeRangeType, decorator: Google::Apis::PeopleV1::AgeRangeType::Representation
      
          collection :biographies, as: 'biographies', class: Google::Apis::PeopleV1::Biography, decorator: Google::Apis::PeopleV1::Biography::Representation
      
          collection :birthdays, as: 'birthdays', class: Google::Apis::PeopleV1::Birthday, decorator: Google::Apis::PeopleV1::Birthday::Representation
      
          collection :bragging_rights, as: 'braggingRights', class: Google::Apis::PeopleV1::BraggingRights, decorator: Google::Apis::PeopleV1::BraggingRights::Representation
      
          collection :cover_photos, as: 'coverPhotos', class: Google::Apis::PeopleV1::CoverPhoto, decorator: Google::Apis::PeopleV1::CoverPhoto::Representation
      
          collection :email_addresses, as: 'emailAddresses', class: Google::Apis::PeopleV1::EmailAddress, decorator: Google::Apis::PeopleV1::EmailAddress::Representation
      
          property :etag, as: 'etag'
          collection :events, as: 'events', class: Google::Apis::PeopleV1::Event, decorator: Google::Apis::PeopleV1::Event::Representation
      
          collection :genders, as: 'genders', class: Google::Apis::PeopleV1::Gender, decorator: Google::Apis::PeopleV1::Gender::Representation
      
          collection :im_clients, as: 'imClients', class: Google::Apis::PeopleV1::ImClient, decorator: Google::Apis::PeopleV1::ImClient::Representation
      
          collection :interests, as: 'interests', class: Google::Apis::PeopleV1::Interest, decorator: Google::Apis::PeopleV1::Interest::Representation
      
          collection :locales, as: 'locales', class: Google::Apis::PeopleV1::Locale, decorator: Google::Apis::PeopleV1::Locale::Representation
      
          collection :memberships, as: 'memberships', class: Google::Apis::PeopleV1::Membership, decorator: Google::Apis::PeopleV1::Membership::Representation
      
          property :metadata, as: 'metadata', class: Google::Apis::PeopleV1::PersonMetadata, decorator: Google::Apis::PeopleV1::PersonMetadata::Representation
      
          collection :names, as: 'names', class: Google::Apis::PeopleV1::Name, decorator: Google::Apis::PeopleV1::Name::Representation
      
          collection :nicknames, as: 'nicknames', class: Google::Apis::PeopleV1::Nickname, decorator: Google::Apis::PeopleV1::Nickname::Representation
      
          collection :occupations, as: 'occupations', class: Google::Apis::PeopleV1::Occupation, decorator: Google::Apis::PeopleV1::Occupation::Representation
      
          collection :organizations, as: 'organizations', class: Google::Apis::PeopleV1::Organization, decorator: Google::Apis::PeopleV1::Organization::Representation
      
          collection :phone_numbers, as: 'phoneNumbers', class: Google::Apis::PeopleV1::PhoneNumber, decorator: Google::Apis::PeopleV1::PhoneNumber::Representation
      
          collection :photos, as: 'photos', class: Google::Apis::PeopleV1::Photo, decorator: Google::Apis::PeopleV1::Photo::Representation
      
          collection :relations, as: 'relations', class: Google::Apis::PeopleV1::Relation, decorator: Google::Apis::PeopleV1::Relation::Representation
      
          collection :relationship_interests, as: 'relationshipInterests', class: Google::Apis::PeopleV1::RelationshipInterest, decorator: Google::Apis::PeopleV1::RelationshipInterest::Representation
      
          collection :relationship_statuses, as: 'relationshipStatuses', class: Google::Apis::PeopleV1::RelationshipStatus, decorator: Google::Apis::PeopleV1::RelationshipStatus::Representation
      
          collection :residences, as: 'residences', class: Google::Apis::PeopleV1::Residence, decorator: Google::Apis::PeopleV1::Residence::Representation
      
          property :resource_name, as: 'resourceName'
          collection :sip_addresses, as: 'sipAddresses', class: Google::Apis::PeopleV1::SipAddress, decorator: Google::Apis::PeopleV1::SipAddress::Representation
      
          collection :skills, as: 'skills', class: Google::Apis::PeopleV1::Skill, decorator: Google::Apis::PeopleV1::Skill::Representation
      
          collection :taglines, as: 'taglines', class: Google::Apis::PeopleV1::Tagline, decorator: Google::Apis::PeopleV1::Tagline::Representation
      
          collection :urls, as: 'urls', class: Google::Apis::PeopleV1::Url, decorator: Google::Apis::PeopleV1::Url::Representation
      
          collection :user_defined, as: 'userDefined', class: Google::Apis::PeopleV1::UserDefined, decorator: Google::Apis::PeopleV1::UserDefined::Representation
      
        end
      end
      
      class PersonMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :deleted, as: 'deleted'
          collection :linked_people_resource_names, as: 'linkedPeopleResourceNames'
          property :object_type, as: 'objectType'
          collection :previous_resource_names, as: 'previousResourceNames'
          collection :sources, as: 'sources', class: Google::Apis::PeopleV1::Source, decorator: Google::Apis::PeopleV1::Source::Representation
      
        end
      end
      
      class PersonResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :http_status_code, as: 'httpStatusCode'
          property :person, as: 'person', class: Google::Apis::PeopleV1::Person, decorator: Google::Apis::PeopleV1::Person::Representation
      
          property :requested_resource_name, as: 'requestedResourceName'
          property :status, as: 'status', class: Google::Apis::PeopleV1::Status, decorator: Google::Apis::PeopleV1::Status::Representation
      
        end
      end
      
      class PhoneNumber
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :canonical_form, as: 'canonicalForm'
          property :formatted_type, as: 'formattedType'
          property :metadata, as: 'metadata', class: Google::Apis::PeopleV1::FieldMetadata, decorator: Google::Apis::PeopleV1::FieldMetadata::Representation
      
          property :type, as: 'type'
          property :value, as: 'value'
        end
      end
      
      class Photo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :default, as: 'default'
          property :metadata, as: 'metadata', class: Google::Apis::PeopleV1::FieldMetadata, decorator: Google::Apis::PeopleV1::FieldMetadata::Representation
      
          property :url, as: 'url'
        end
      end
      
      class ProfileMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :object_type, as: 'objectType'
          collection :user_types, as: 'userTypes'
        end
      end
      
      class Relation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :formatted_type, as: 'formattedType'
          property :metadata, as: 'metadata', class: Google::Apis::PeopleV1::FieldMetadata, decorator: Google::Apis::PeopleV1::FieldMetadata::Representation
      
          property :person, as: 'person'
          property :type, as: 'type'
        end
      end
      
      class RelationshipInterest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :formatted_value, as: 'formattedValue'
          property :metadata, as: 'metadata', class: Google::Apis::PeopleV1::FieldMetadata, decorator: Google::Apis::PeopleV1::FieldMetadata::Representation
      
          property :value, as: 'value'
        end
      end
      
      class RelationshipStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :formatted_value, as: 'formattedValue'
          property :metadata, as: 'metadata', class: Google::Apis::PeopleV1::FieldMetadata, decorator: Google::Apis::PeopleV1::FieldMetadata::Representation
      
          property :value, as: 'value'
        end
      end
      
      class Residence
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :current, as: 'current'
          property :metadata, as: 'metadata', class: Google::Apis::PeopleV1::FieldMetadata, decorator: Google::Apis::PeopleV1::FieldMetadata::Representation
      
          property :value, as: 'value'
        end
      end
      
      class SipAddress
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :formatted_type, as: 'formattedType'
          property :metadata, as: 'metadata', class: Google::Apis::PeopleV1::FieldMetadata, decorator: Google::Apis::PeopleV1::FieldMetadata::Representation
      
          property :type, as: 'type'
          property :value, as: 'value'
        end
      end
      
      class Skill
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :metadata, as: 'metadata', class: Google::Apis::PeopleV1::FieldMetadata, decorator: Google::Apis::PeopleV1::FieldMetadata::Representation
      
          property :value, as: 'value'
        end
      end
      
      class Source
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :id, as: 'id'
          property :profile_metadata, as: 'profileMetadata', class: Google::Apis::PeopleV1::ProfileMetadata, decorator: Google::Apis::PeopleV1::ProfileMetadata::Representation
      
          property :type, as: 'type'
          property :update_time, as: 'updateTime'
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
      
      class Tagline
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :metadata, as: 'metadata', class: Google::Apis::PeopleV1::FieldMetadata, decorator: Google::Apis::PeopleV1::FieldMetadata::Representation
      
          property :value, as: 'value'
        end
      end
      
      class UpdateContactGroupRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :contact_group, as: 'contactGroup', class: Google::Apis::PeopleV1::ContactGroup, decorator: Google::Apis::PeopleV1::ContactGroup::Representation
      
        end
      end
      
      class UpdateContactPhotoRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :person_fields, as: 'personFields'
          property :photo_bytes, :base64 => true, as: 'photoBytes'
        end
      end
      
      class UpdateContactPhotoResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :person, as: 'person', class: Google::Apis::PeopleV1::Person, decorator: Google::Apis::PeopleV1::Person::Representation
      
        end
      end
      
      class Url
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :formatted_type, as: 'formattedType'
          property :metadata, as: 'metadata', class: Google::Apis::PeopleV1::FieldMetadata, decorator: Google::Apis::PeopleV1::FieldMetadata::Representation
      
          property :type, as: 'type'
          property :value, as: 'value'
        end
      end
      
      class UserDefined
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :key, as: 'key'
          property :metadata, as: 'metadata', class: Google::Apis::PeopleV1::FieldMetadata, decorator: Google::Apis::PeopleV1::FieldMetadata::Representation
      
          property :value, as: 'value'
        end
      end
    end
  end
end
