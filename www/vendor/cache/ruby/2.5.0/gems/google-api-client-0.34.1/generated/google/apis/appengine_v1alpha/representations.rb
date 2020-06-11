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
    module AppengineV1alpha
      
      class AuthorizedCertificate
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AuthorizedDomain
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CertificateRawData
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateVersionMetadataV1
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateVersionMetadataV1Alpha
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateVersionMetadataV1Beta
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DomainMapping
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Empty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListAuthorizedCertificatesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListAuthorizedDomainsResponse
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
      
      class ListOperationsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Location
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LocationMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ManagedCertificate
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Operation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OperationMetadataV1
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OperationMetadataV1Alpha
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OperationMetadataV1Beta
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ResourceRecord
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SslSettings
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Status
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AuthorizedCertificate
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :certificate_raw_data, as: 'certificateRawData', class: Google::Apis::AppengineV1alpha::CertificateRawData, decorator: Google::Apis::AppengineV1alpha::CertificateRawData::Representation
      
          property :display_name, as: 'displayName'
          property :domain_mappings_count, as: 'domainMappingsCount'
          collection :domain_names, as: 'domainNames'
          property :expire_time, as: 'expireTime'
          property :id, as: 'id'
          property :managed_certificate, as: 'managedCertificate', class: Google::Apis::AppengineV1alpha::ManagedCertificate, decorator: Google::Apis::AppengineV1alpha::ManagedCertificate::Representation
      
          property :name, as: 'name'
          collection :visible_domain_mappings, as: 'visibleDomainMappings'
        end
      end
      
      class AuthorizedDomain
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          property :name, as: 'name'
        end
      end
      
      class CertificateRawData
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :private_key, as: 'privateKey'
          property :public_certificate, as: 'publicCertificate'
        end
      end
      
      class CreateVersionMetadataV1
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cloud_build_id, as: 'cloudBuildId'
        end
      end
      
      class CreateVersionMetadataV1Alpha
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cloud_build_id, as: 'cloudBuildId'
        end
      end
      
      class CreateVersionMetadataV1Beta
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cloud_build_id, as: 'cloudBuildId'
        end
      end
      
      class DomainMapping
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          property :name, as: 'name'
          collection :resource_records, as: 'resourceRecords', class: Google::Apis::AppengineV1alpha::ResourceRecord, decorator: Google::Apis::AppengineV1alpha::ResourceRecord::Representation
      
          property :ssl_settings, as: 'sslSettings', class: Google::Apis::AppengineV1alpha::SslSettings, decorator: Google::Apis::AppengineV1alpha::SslSettings::Representation
      
        end
      end
      
      class Empty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class ListAuthorizedCertificatesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :certificates, as: 'certificates', class: Google::Apis::AppengineV1alpha::AuthorizedCertificate, decorator: Google::Apis::AppengineV1alpha::AuthorizedCertificate::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListAuthorizedDomainsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :domains, as: 'domains', class: Google::Apis::AppengineV1alpha::AuthorizedDomain, decorator: Google::Apis::AppengineV1alpha::AuthorizedDomain::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListDomainMappingsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :domain_mappings, as: 'domainMappings', class: Google::Apis::AppengineV1alpha::DomainMapping, decorator: Google::Apis::AppengineV1alpha::DomainMapping::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListLocationsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :locations, as: 'locations', class: Google::Apis::AppengineV1alpha::Location, decorator: Google::Apis::AppengineV1alpha::Location::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListOperationsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :operations, as: 'operations', class: Google::Apis::AppengineV1alpha::Operation, decorator: Google::Apis::AppengineV1alpha::Operation::Representation
      
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
      
      class LocationMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :flexible_environment_available, as: 'flexibleEnvironmentAvailable'
          property :standard_environment_available, as: 'standardEnvironmentAvailable'
        end
      end
      
      class ManagedCertificate
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :last_renewal_time, as: 'lastRenewalTime'
          property :status, as: 'status'
        end
      end
      
      class Operation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :done, as: 'done'
          property :error, as: 'error', class: Google::Apis::AppengineV1alpha::Status, decorator: Google::Apis::AppengineV1alpha::Status::Representation
      
          hash :metadata, as: 'metadata'
          property :name, as: 'name'
          hash :response, as: 'response'
        end
      end
      
      class OperationMetadataV1
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_version_metadata, as: 'createVersionMetadata', class: Google::Apis::AppengineV1alpha::CreateVersionMetadataV1, decorator: Google::Apis::AppengineV1alpha::CreateVersionMetadataV1::Representation
      
          property :end_time, as: 'endTime'
          property :ephemeral_message, as: 'ephemeralMessage'
          property :insert_time, as: 'insertTime'
          property :method_prop, as: 'method'
          property :target, as: 'target'
          property :user, as: 'user'
          collection :warning, as: 'warning'
        end
      end
      
      class OperationMetadataV1Alpha
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_version_metadata, as: 'createVersionMetadata', class: Google::Apis::AppengineV1alpha::CreateVersionMetadataV1Alpha, decorator: Google::Apis::AppengineV1alpha::CreateVersionMetadataV1Alpha::Representation
      
          property :end_time, as: 'endTime'
          property :ephemeral_message, as: 'ephemeralMessage'
          property :insert_time, as: 'insertTime'
          property :method_prop, as: 'method'
          property :target, as: 'target'
          property :user, as: 'user'
          collection :warning, as: 'warning'
        end
      end
      
      class OperationMetadataV1Beta
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_version_metadata, as: 'createVersionMetadata', class: Google::Apis::AppengineV1alpha::CreateVersionMetadataV1Beta, decorator: Google::Apis::AppengineV1alpha::CreateVersionMetadataV1Beta::Representation
      
          property :end_time, as: 'endTime'
          property :ephemeral_message, as: 'ephemeralMessage'
          property :insert_time, as: 'insertTime'
          property :method_prop, as: 'method'
          property :target, as: 'target'
          property :user, as: 'user'
          collection :warning, as: 'warning'
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
      
      class SslSettings
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :certificate_id, as: 'certificateId'
          property :is_managed_certificate, as: 'isManagedCertificate'
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
    end
  end
end
