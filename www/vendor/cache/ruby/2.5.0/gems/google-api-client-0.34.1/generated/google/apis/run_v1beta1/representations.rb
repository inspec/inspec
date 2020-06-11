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
    module RunV1beta1
      
      class CustomResourceColumnDefinition
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomResourceDefinition
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomResourceDefinitionNames
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomResourceDefinitionSpec
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomResourceDefinitionVersion
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomResourceSubresourceScale
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomResourceSubresourceStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomResourceSubresources
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomResourceValidation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ExternalDocumentation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Json
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class JsonSchemaProps
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class JsonSchemaPropsOrArray
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class JsonSchemaPropsOrBool
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class JsonSchemaPropsOrStringArray
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListCustomResourceDefinitionsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListMeta
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ObjectMeta
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OwnerReference
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomResourceColumnDefinition
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :format, as: 'format'
          property :json_path, as: 'jsonPath'
          property :name, as: 'name'
          property :priority, as: 'priority'
          property :type, as: 'type'
        end
      end
      
      class CustomResourceDefinition
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :api_version, as: 'apiVersion'
          property :kind, as: 'kind'
          property :metadata, as: 'metadata', class: Google::Apis::RunV1beta1::ObjectMeta, decorator: Google::Apis::RunV1beta1::ObjectMeta::Representation
      
          property :spec, as: 'spec', class: Google::Apis::RunV1beta1::CustomResourceDefinitionSpec, decorator: Google::Apis::RunV1beta1::CustomResourceDefinitionSpec::Representation
      
        end
      end
      
      class CustomResourceDefinitionNames
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :categories, as: 'categories'
          property :kind, as: 'kind'
          property :list_kind, as: 'listKind'
          property :plural, as: 'plural'
          collection :short_names, as: 'shortNames'
          property :singular, as: 'singular'
        end
      end
      
      class CustomResourceDefinitionSpec
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :additional_printer_columns, as: 'additionalPrinterColumns', class: Google::Apis::RunV1beta1::CustomResourceColumnDefinition, decorator: Google::Apis::RunV1beta1::CustomResourceColumnDefinition::Representation
      
          property :group, as: 'group'
          property :names, as: 'names', class: Google::Apis::RunV1beta1::CustomResourceDefinitionNames, decorator: Google::Apis::RunV1beta1::CustomResourceDefinitionNames::Representation
      
          property :scope, as: 'scope'
          property :subresources, as: 'subresources', class: Google::Apis::RunV1beta1::CustomResourceSubresources, decorator: Google::Apis::RunV1beta1::CustomResourceSubresources::Representation
      
          property :validation, as: 'validation', class: Google::Apis::RunV1beta1::CustomResourceValidation, decorator: Google::Apis::RunV1beta1::CustomResourceValidation::Representation
      
          property :version, as: 'version'
          collection :versions, as: 'versions', class: Google::Apis::RunV1beta1::CustomResourceDefinitionVersion, decorator: Google::Apis::RunV1beta1::CustomResourceDefinitionVersion::Representation
      
        end
      end
      
      class CustomResourceDefinitionVersion
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :served, as: 'served'
          property :storage, as: 'storage'
        end
      end
      
      class CustomResourceSubresourceScale
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :label_selector_path, as: 'labelSelectorPath'
          property :spec_replicas_path, as: 'specReplicasPath'
          property :status_replicas_path, as: 'statusReplicasPath'
        end
      end
      
      class CustomResourceSubresourceStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class CustomResourceSubresources
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :scale, as: 'scale', class: Google::Apis::RunV1beta1::CustomResourceSubresourceScale, decorator: Google::Apis::RunV1beta1::CustomResourceSubresourceScale::Representation
      
          property :status, as: 'status', class: Google::Apis::RunV1beta1::CustomResourceSubresourceStatus, decorator: Google::Apis::RunV1beta1::CustomResourceSubresourceStatus::Representation
      
        end
      end
      
      class CustomResourceValidation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :open_apiv3_schema, as: 'openAPIV3Schema', class: Google::Apis::RunV1beta1::JsonSchemaProps, decorator: Google::Apis::RunV1beta1::JsonSchemaProps::Representation
      
        end
      end
      
      class ExternalDocumentation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :url, as: 'url'
        end
      end
      
      class Json
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :raw, :base64 => true, as: 'raw'
        end
      end
      
      class JsonSchemaProps
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :additional_items, as: 'additionalItems', class: Google::Apis::RunV1beta1::JsonSchemaPropsOrBool, decorator: Google::Apis::RunV1beta1::JsonSchemaPropsOrBool::Representation
      
          property :additional_properties, as: 'additionalProperties', class: Google::Apis::RunV1beta1::JsonSchemaPropsOrBool, decorator: Google::Apis::RunV1beta1::JsonSchemaPropsOrBool::Representation
      
          collection :all_of, as: 'allOf', class: Google::Apis::RunV1beta1::JsonSchemaProps, decorator: Google::Apis::RunV1beta1::JsonSchemaProps::Representation
      
          collection :any_of, as: 'anyOf', class: Google::Apis::RunV1beta1::JsonSchemaProps, decorator: Google::Apis::RunV1beta1::JsonSchemaProps::Representation
      
          property :default, as: 'default', class: Google::Apis::RunV1beta1::Json, decorator: Google::Apis::RunV1beta1::Json::Representation
      
          hash :definitions, as: 'definitions', class: Google::Apis::RunV1beta1::JsonSchemaProps, decorator: Google::Apis::RunV1beta1::JsonSchemaProps::Representation
      
          hash :dependencies, as: 'dependencies', class: Google::Apis::RunV1beta1::JsonSchemaPropsOrStringArray, decorator: Google::Apis::RunV1beta1::JsonSchemaPropsOrStringArray::Representation
      
          property :description, as: 'description'
          collection :enum, as: 'enum'
          property :example, as: 'example', class: Google::Apis::RunV1beta1::Json, decorator: Google::Apis::RunV1beta1::Json::Representation
      
          property :exclusive_maximum, as: 'exclusiveMaximum'
          property :exclusive_minimum, as: 'exclusiveMinimum'
          property :external_docs, as: 'externalDocs', class: Google::Apis::RunV1beta1::ExternalDocumentation, decorator: Google::Apis::RunV1beta1::ExternalDocumentation::Representation
      
          property :format, as: 'format'
          property :id, as: 'id'
          property :items, as: 'items', class: Google::Apis::RunV1beta1::JsonSchemaPropsOrArray, decorator: Google::Apis::RunV1beta1::JsonSchemaPropsOrArray::Representation
      
          property :max_items, :numeric_string => true, as: 'maxItems'
          property :max_length, :numeric_string => true, as: 'maxLength'
          property :max_properties, :numeric_string => true, as: 'maxProperties'
          property :maximum, as: 'maximum'
          property :min_items, :numeric_string => true, as: 'minItems'
          property :min_length, :numeric_string => true, as: 'minLength'
          property :min_properties, :numeric_string => true, as: 'minProperties'
          property :minimum, as: 'minimum'
          property :multiple_of, as: 'multipleOf'
          property :not, as: 'not', class: Google::Apis::RunV1beta1::JsonSchemaProps, decorator: Google::Apis::RunV1beta1::JsonSchemaProps::Representation
      
          collection :one_of, as: 'oneOf', class: Google::Apis::RunV1beta1::JsonSchemaProps, decorator: Google::Apis::RunV1beta1::JsonSchemaProps::Representation
      
          property :pattern, as: 'pattern'
          hash :pattern_properties, as: 'patternProperties', class: Google::Apis::RunV1beta1::JsonSchemaProps, decorator: Google::Apis::RunV1beta1::JsonSchemaProps::Representation
      
          hash :properties, as: 'properties', class: Google::Apis::RunV1beta1::JsonSchemaProps, decorator: Google::Apis::RunV1beta1::JsonSchemaProps::Representation
      
          property :ref, as: 'ref'
          collection :required, as: 'required'
          property :schema, as: 'schema'
          property :title, as: 'title'
          property :type, as: 'type'
          property :unique_items, as: 'uniqueItems'
        end
      end
      
      class JsonSchemaPropsOrArray
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :json_schemas, as: 'jsonSchemas', class: Google::Apis::RunV1beta1::JsonSchemaProps, decorator: Google::Apis::RunV1beta1::JsonSchemaProps::Representation
      
          property :schema, as: 'schema', class: Google::Apis::RunV1beta1::JsonSchemaProps, decorator: Google::Apis::RunV1beta1::JsonSchemaProps::Representation
      
        end
      end
      
      class JsonSchemaPropsOrBool
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :allows, as: 'allows'
          property :schema, as: 'schema', class: Google::Apis::RunV1beta1::JsonSchemaProps, decorator: Google::Apis::RunV1beta1::JsonSchemaProps::Representation
      
        end
      end
      
      class JsonSchemaPropsOrStringArray
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :property, as: 'property'
          property :schema, as: 'schema', class: Google::Apis::RunV1beta1::JsonSchemaProps, decorator: Google::Apis::RunV1beta1::JsonSchemaProps::Representation
      
        end
      end
      
      class ListCustomResourceDefinitionsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :api_version, as: 'apiVersion'
          collection :items, as: 'items', class: Google::Apis::RunV1beta1::CustomResourceDefinition, decorator: Google::Apis::RunV1beta1::CustomResourceDefinition::Representation
      
          property :kind, as: 'kind'
          property :metadata, as: 'metadata', class: Google::Apis::RunV1beta1::ListMeta, decorator: Google::Apis::RunV1beta1::ListMeta::Representation
      
          collection :unreachable, as: 'unreachable'
        end
      end
      
      class ListMeta
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :continue, as: 'continue'
          property :resource_version, as: 'resourceVersion'
          property :self_link, as: 'selfLink'
        end
      end
      
      class ObjectMeta
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :annotations, as: 'annotations'
          property :cluster_name, as: 'clusterName'
          property :creation_timestamp, as: 'creationTimestamp'
          property :deletion_grace_period_seconds, as: 'deletionGracePeriodSeconds'
          property :deletion_timestamp, as: 'deletionTimestamp'
          collection :finalizers, as: 'finalizers'
          property :generate_name, as: 'generateName'
          property :generation, as: 'generation'
          hash :labels, as: 'labels'
          property :name, as: 'name'
          property :namespace, as: 'namespace'
          collection :owner_references, as: 'ownerReferences', class: Google::Apis::RunV1beta1::OwnerReference, decorator: Google::Apis::RunV1beta1::OwnerReference::Representation
      
          property :resource_version, as: 'resourceVersion'
          property :self_link, as: 'selfLink'
          property :uid, as: 'uid'
        end
      end
      
      class OwnerReference
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :api_version, as: 'apiVersion'
          property :block_owner_deletion, as: 'blockOwnerDeletion'
          property :controller, as: 'controller'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :uid, as: 'uid'
        end
      end
    end
  end
end
