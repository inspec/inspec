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
    module CloudprivatecatalogproducerV1beta1
      
      class GoogleCloudPrivatecatalogproducerV1beta1Association
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudPrivatecatalogproducerV1beta1Catalog
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudPrivatecatalogproducerV1beta1CopyProductRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudPrivatecatalogproducerV1beta1CreateAssociationRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudPrivatecatalogproducerV1beta1ListAssociationsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudPrivatecatalogproducerV1beta1ListCatalogsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudPrivatecatalogproducerV1beta1ListProductsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudPrivatecatalogproducerV1beta1ListVersionsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudPrivatecatalogproducerV1beta1Product
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudPrivatecatalogproducerV1beta1UndeleteCatalogRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudPrivatecatalogproducerV1beta1UploadIconRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudPrivatecatalogproducerV1beta1Version
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleIamV1AuditConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleIamV1AuditLogConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleIamV1Binding
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleIamV1Policy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleIamV1SetIamPolicyRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleIamV1TestIamPermissionsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleIamV1TestIamPermissionsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleLongrunningCancelOperationRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleLongrunningListOperationsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleLongrunningOperation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleProtobufEmpty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleRpcStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleTypeExpr
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudPrivatecatalogproducerV1beta1Association
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_time, as: 'createTime'
          property :name, as: 'name'
          property :resource, as: 'resource'
        end
      end
      
      class GoogleCloudPrivatecatalogproducerV1beta1Catalog
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_time, as: 'createTime'
          property :description, as: 'description'
          property :display_name, as: 'displayName'
          property :name, as: 'name'
          property :parent, as: 'parent'
          property :update_time, as: 'updateTime'
        end
      end
      
      class GoogleCloudPrivatecatalogproducerV1beta1CopyProductRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :destination_product_name, as: 'destinationProductName'
        end
      end
      
      class GoogleCloudPrivatecatalogproducerV1beta1CreateAssociationRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :association, as: 'association', class: Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Association, decorator: Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Association::Representation
      
        end
      end
      
      class GoogleCloudPrivatecatalogproducerV1beta1ListAssociationsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :associations, as: 'associations', class: Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Association, decorator: Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Association::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class GoogleCloudPrivatecatalogproducerV1beta1ListCatalogsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :catalogs, as: 'catalogs', class: Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Catalog, decorator: Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Catalog::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class GoogleCloudPrivatecatalogproducerV1beta1ListProductsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :products, as: 'products', class: Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Product, decorator: Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Product::Representation
      
        end
      end
      
      class GoogleCloudPrivatecatalogproducerV1beta1ListVersionsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :versions, as: 'versions', class: Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Version, decorator: Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Version::Representation
      
        end
      end
      
      class GoogleCloudPrivatecatalogproducerV1beta1Product
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :asset_type, as: 'assetType'
          property :create_time, as: 'createTime'
          hash :display_metadata, as: 'displayMetadata'
          property :icon_uri, as: 'iconUri'
          property :name, as: 'name'
          property :update_time, as: 'updateTime'
        end
      end
      
      class GoogleCloudPrivatecatalogproducerV1beta1UndeleteCatalogRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class GoogleCloudPrivatecatalogproducerV1beta1UploadIconRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :icon, :base64 => true, as: 'icon'
        end
      end
      
      class GoogleCloudPrivatecatalogproducerV1beta1Version
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :asset, as: 'asset'
          property :create_time, as: 'createTime'
          property :description, as: 'description'
          property :name, as: 'name'
          hash :original_asset, as: 'originalAsset'
          property :update_time, as: 'updateTime'
        end
      end
      
      class GoogleIamV1AuditConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :audit_log_configs, as: 'auditLogConfigs', class: Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleIamV1AuditLogConfig, decorator: Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleIamV1AuditLogConfig::Representation
      
          property :service, as: 'service'
        end
      end
      
      class GoogleIamV1AuditLogConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :exempted_members, as: 'exemptedMembers'
          property :log_type, as: 'logType'
        end
      end
      
      class GoogleIamV1Binding
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :condition, as: 'condition', class: Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleTypeExpr, decorator: Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleTypeExpr::Representation
      
          collection :members, as: 'members'
          property :role, as: 'role'
        end
      end
      
      class GoogleIamV1Policy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :audit_configs, as: 'auditConfigs', class: Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleIamV1AuditConfig, decorator: Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleIamV1AuditConfig::Representation
      
          collection :bindings, as: 'bindings', class: Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleIamV1Binding, decorator: Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleIamV1Binding::Representation
      
          property :etag, :base64 => true, as: 'etag'
          property :version, as: 'version'
        end
      end
      
      class GoogleIamV1SetIamPolicyRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :policy, as: 'policy', class: Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleIamV1Policy, decorator: Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleIamV1Policy::Representation
      
          property :update_mask, as: 'updateMask'
        end
      end
      
      class GoogleIamV1TestIamPermissionsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :permissions, as: 'permissions'
        end
      end
      
      class GoogleIamV1TestIamPermissionsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :permissions, as: 'permissions'
        end
      end
      
      class GoogleLongrunningCancelOperationRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class GoogleLongrunningListOperationsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :operations, as: 'operations', class: Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleLongrunningOperation, decorator: Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleLongrunningOperation::Representation
      
        end
      end
      
      class GoogleLongrunningOperation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :done, as: 'done'
          property :error, as: 'error', class: Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleRpcStatus, decorator: Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleRpcStatus::Representation
      
          hash :metadata, as: 'metadata'
          property :name, as: 'name'
          hash :response, as: 'response'
        end
      end
      
      class GoogleProtobufEmpty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class GoogleRpcStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :code, as: 'code'
          collection :details, as: 'details'
          property :message, as: 'message'
        end
      end
      
      class GoogleTypeExpr
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :expression, as: 'expression'
          property :location, as: 'location'
          property :title, as: 'title'
        end
      end
    end
  end
end
