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
      
      # CustomResourceColumnDefinition specifies a column for server side printing.
      class CustomResourceColumnDefinition
        include Google::Apis::Core::Hashable
      
        # description is a human readable description of this column.
        # +optional
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # format is an optional OpenAPI type definition for this column. The 'name'
        # format is applied to the primary identifier column to assist in clients
        # identifying column is the resource name. See
        # https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#data-
        # types
        # for more. +optional
        # Corresponds to the JSON property `format`
        # @return [String]
        attr_accessor :format
      
        # JSONPath is a simple JSON path, i.e. with array notation.
        # Corresponds to the JSON property `jsonPath`
        # @return [String]
        attr_accessor :json_path
      
        # name is a human readable name for the column.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # priority is an integer defining the relative importance of this column
        # compared to others. Lower numbers are considered higher priority. Columns
        # that may be omitted in limited space scenarios should be given a higher
        # priority. +optional
        # Corresponds to the JSON property `priority`
        # @return [Fixnum]
        attr_accessor :priority
      
        # type is an OpenAPI type definition for this column.
        # See
        # https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#data-
        # types
        # for more.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @format = args[:format] if args.key?(:format)
          @json_path = args[:json_path] if args.key?(:json_path)
          @name = args[:name] if args.key?(:name)
          @priority = args[:priority] if args.key?(:priority)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # CustomResourceDefinition represents a resource that should be exposed on the
      # API server.  Its name MUST be in the format
      # <.spec.name>.<.spec.group>.
      class CustomResourceDefinition
        include Google::Apis::Core::Hashable
      
        # The API version for this call such as "k8s.apiextensions.io/v1beta1".
        # Corresponds to the JSON property `apiVersion`
        # @return [String]
        attr_accessor :api_version
      
        # The kind of resource, one example is "Storage".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # k8s.io.apimachinery.pkg.apis.meta.v1.ObjectMeta is metadata that all
        # persisted resources must have, which includes all objects users must create.
        # Corresponds to the JSON property `metadata`
        # @return [Google::Apis::RunV1beta1::ObjectMeta]
        attr_accessor :metadata
      
        # CustomResourceDefinitionSpec describes how a user wants their resource to
        # appear
        # Corresponds to the JSON property `spec`
        # @return [Google::Apis::RunV1beta1::CustomResourceDefinitionSpec]
        attr_accessor :spec
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @api_version = args[:api_version] if args.key?(:api_version)
          @kind = args[:kind] if args.key?(:kind)
          @metadata = args[:metadata] if args.key?(:metadata)
          @spec = args[:spec] if args.key?(:spec)
        end
      end
      
      # CustomResourceDefinitionNames indicates the names to serve this
      # CustomResourceDefinition
      class CustomResourceDefinitionNames
        include Google::Apis::Core::Hashable
      
        # Categories is a list of grouped resources custom resources belong to (e.g.
        # 'all') +optional
        # Corresponds to the JSON property `categories`
        # @return [Array<String>]
        attr_accessor :categories
      
        # Kind is the serialized kind of the resource.  It is normally CamelCase and
        # singular.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # ListKind is the serialized kind of the list for this resource.  Defaults to
        # <kind>List. +optional
        # Corresponds to the JSON property `listKind`
        # @return [String]
        attr_accessor :list_kind
      
        # Plural is the plural name of the resource to serve.  It must match the name
        # of the CustomResourceDefinition-registration too: plural.group and it must
        # be all lowercase.
        # Corresponds to the JSON property `plural`
        # @return [String]
        attr_accessor :plural
      
        # ShortNames are short names for the resource.  It must be all lowercase.
        # +optional
        # Corresponds to the JSON property `shortNames`
        # @return [Array<String>]
        attr_accessor :short_names
      
        # Singular is the singular name of the resource.  It must be all lowercase
        # Defaults to lowercased <kind> +optional
        # Corresponds to the JSON property `singular`
        # @return [String]
        attr_accessor :singular
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @categories = args[:categories] if args.key?(:categories)
          @kind = args[:kind] if args.key?(:kind)
          @list_kind = args[:list_kind] if args.key?(:list_kind)
          @plural = args[:plural] if args.key?(:plural)
          @short_names = args[:short_names] if args.key?(:short_names)
          @singular = args[:singular] if args.key?(:singular)
        end
      end
      
      # CustomResourceDefinitionSpec describes how a user wants their resource to
      # appear
      class CustomResourceDefinitionSpec
        include Google::Apis::Core::Hashable
      
        # AdditionalPrinterColumns are additional columns shown e.g. in kubectl next
        # to the name. Defaults to a created-at column. +optional
        # Corresponds to the JSON property `additionalPrinterColumns`
        # @return [Array<Google::Apis::RunV1beta1::CustomResourceColumnDefinition>]
        attr_accessor :additional_printer_columns
      
        # Group is the group this resource belongs in
        # Corresponds to the JSON property `group`
        # @return [String]
        attr_accessor :group
      
        # CustomResourceDefinitionNames indicates the names to serve this
        # CustomResourceDefinition
        # Corresponds to the JSON property `names`
        # @return [Google::Apis::RunV1beta1::CustomResourceDefinitionNames]
        attr_accessor :names
      
        # Scope indicates whether this resource is cluster or namespace scoped.
        # Default is namespaced
        # Corresponds to the JSON property `scope`
        # @return [String]
        attr_accessor :scope
      
        # CustomResourceSubresources defines the status and scale subresources for
        # CustomResources.
        # Corresponds to the JSON property `subresources`
        # @return [Google::Apis::RunV1beta1::CustomResourceSubresources]
        attr_accessor :subresources
      
        # CustomResourceValidation is a list of validation methods for CustomResources.
        # Corresponds to the JSON property `validation`
        # @return [Google::Apis::RunV1beta1::CustomResourceValidation]
        attr_accessor :validation
      
        # Version is the version this resource belongs in
        # Should be always first item in Versions field if provided.
        # Optional, but at least one of Version or Versions must be set.
        # Deprecated: Please use `Versions`.
        # +optional
        # Corresponds to the JSON property `version`
        # @return [String]
        attr_accessor :version
      
        # Versions is the list of all supported versions for this resource.
        # If Version field is provided, this field is optional.
        # Validation: All versions must use the same validation schema for now. i.e.,
        # top level Validation field is applied to all of these versions. Order: The
        # version name will be used to compute the order. If the version string is
        # "kube-like", it will sort above non "kube-like" version strings, which are
        # ordered lexicographically. "Kube-like" versions start with a "v", then are
        # followed by a number (the major version), then optionally the string
        # "alpha" or "beta" and another number (the minor version). These are sorted
        # first by GA > beta > alpha (where GA is a version with no suffix such as
        # beta or alpha), and then by comparing major version, then minor version. An
        # example sorted list of versions: v10, v2, v1, v11beta2, v10beta3, v3beta1,
        # v12alpha1, v11alpha2, foo1, foo10. +optional
        # Corresponds to the JSON property `versions`
        # @return [Array<Google::Apis::RunV1beta1::CustomResourceDefinitionVersion>]
        attr_accessor :versions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @additional_printer_columns = args[:additional_printer_columns] if args.key?(:additional_printer_columns)
          @group = args[:group] if args.key?(:group)
          @names = args[:names] if args.key?(:names)
          @scope = args[:scope] if args.key?(:scope)
          @subresources = args[:subresources] if args.key?(:subresources)
          @validation = args[:validation] if args.key?(:validation)
          @version = args[:version] if args.key?(:version)
          @versions = args[:versions] if args.key?(:versions)
        end
      end
      
      # 
      class CustomResourceDefinitionVersion
        include Google::Apis::Core::Hashable
      
        # Name is the version name, e.g. “v1”, “v2beta1”, etc.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Served is a flag enabling/disabling this version from being served via REST
        # APIs
        # Corresponds to the JSON property `served`
        # @return [Boolean]
        attr_accessor :served
        alias_method :served?, :served
      
        # Storage flags the version as storage version. There must be exactly one
        # flagged as storage version.
        # Corresponds to the JSON property `storage`
        # @return [Boolean]
        attr_accessor :storage
        alias_method :storage?, :storage
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @served = args[:served] if args.key?(:served)
          @storage = args[:storage] if args.key?(:storage)
        end
      end
      
      # CustomResourceSubresourceScale defines how to serve the scale subresource for
      # CustomResources.
      class CustomResourceSubresourceScale
        include Google::Apis::Core::Hashable
      
        # LabelSelectorPath defines the JSON path inside of a CustomResource that
        # corresponds to Scale.Status.Selector. Only JSON paths without the array
        # notation are allowed. Must be a JSON Path under .status. Must be set to
        # work with HPA. If there is no value under the given path in the
        # CustomResource, the status label selector value in the /scale subresource
        # will default to the empty string. +optional
        # Corresponds to the JSON property `labelSelectorPath`
        # @return [String]
        attr_accessor :label_selector_path
      
        # SpecReplicasPath defines the JSON path inside of a CustomResource that
        # corresponds to Scale.Spec.Replicas. Only JSON paths without the array
        # notation are allowed. Must be a JSON Path under .spec. If there is no value
        # under the given path in the CustomResource, the /scale subresource will
        # return an error on GET.
        # Corresponds to the JSON property `specReplicasPath`
        # @return [String]
        attr_accessor :spec_replicas_path
      
        # StatusReplicasPath defines the JSON path inside of a CustomResource that
        # corresponds to Scale.Status.Replicas. Only JSON paths without the array
        # notation are allowed. Must be a JSON Path under .status. If there is no
        # value under the given path in the CustomResource, the status replica value
        # in the /scale subresource will default to 0.
        # Corresponds to the JSON property `statusReplicasPath`
        # @return [String]
        attr_accessor :status_replicas_path
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @label_selector_path = args[:label_selector_path] if args.key?(:label_selector_path)
          @spec_replicas_path = args[:spec_replicas_path] if args.key?(:spec_replicas_path)
          @status_replicas_path = args[:status_replicas_path] if args.key?(:status_replicas_path)
        end
      end
      
      # CustomResourceSubresourceStatus defines how to serve the status subresource
      # for CustomResources. Status is represented by the `.status` JSON path inside
      # of a CustomResource. When set,
      # * exposes a /status subresource for the custom resource
      # * PUT requests to the /status subresource take a custom resource object, and
      # ignore changes to anything except the status stanza
      # * PUT/POST/PATCH requests to the custom resource ignore changes to the status
      # stanza
      class CustomResourceSubresourceStatus
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # CustomResourceSubresources defines the status and scale subresources for
      # CustomResources.
      class CustomResourceSubresources
        include Google::Apis::Core::Hashable
      
        # CustomResourceSubresourceScale defines how to serve the scale subresource for
        # CustomResources.
        # Corresponds to the JSON property `scale`
        # @return [Google::Apis::RunV1beta1::CustomResourceSubresourceScale]
        attr_accessor :scale
      
        # CustomResourceSubresourceStatus defines how to serve the status subresource
        # for CustomResources. Status is represented by the `.status` JSON path inside
        # of a CustomResource. When set,
        # * exposes a /status subresource for the custom resource
        # * PUT requests to the /status subresource take a custom resource object, and
        # ignore changes to anything except the status stanza
        # * PUT/POST/PATCH requests to the custom resource ignore changes to the status
        # stanza
        # Corresponds to the JSON property `status`
        # @return [Google::Apis::RunV1beta1::CustomResourceSubresourceStatus]
        attr_accessor :status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @scale = args[:scale] if args.key?(:scale)
          @status = args[:status] if args.key?(:status)
        end
      end
      
      # CustomResourceValidation is a list of validation methods for CustomResources.
      class CustomResourceValidation
        include Google::Apis::Core::Hashable
      
        # JSONSchemaProps is a JSON-Schema following Specification Draft 4
        # (http://json-schema.org/).
        # Corresponds to the JSON property `openAPIV3Schema`
        # @return [Google::Apis::RunV1beta1::JsonSchemaProps]
        attr_accessor :open_apiv3_schema
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @open_apiv3_schema = args[:open_apiv3_schema] if args.key?(:open_apiv3_schema)
        end
      end
      
      # ExternalDocumentation allows referencing an external resource for extended
      # documentation.
      class ExternalDocumentation
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # 
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @url = args[:url] if args.key?(:url)
        end
      end
      
      # JSON represents any valid JSON value.
      # These types are supported: bool, int64, float64, string, []interface``,
      # map[string]interface`` and nil.
      class Json
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `raw`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :raw
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @raw = args[:raw] if args.key?(:raw)
        end
      end
      
      # JSONSchemaProps is a JSON-Schema following Specification Draft 4
      # (http://json-schema.org/).
      class JsonSchemaProps
        include Google::Apis::Core::Hashable
      
        # JSONSchemaPropsOrBool represents JSONSchemaProps or a boolean value.
        # Defaults to true for the boolean property.
        # Corresponds to the JSON property `additionalItems`
        # @return [Google::Apis::RunV1beta1::JsonSchemaPropsOrBool]
        attr_accessor :additional_items
      
        # JSONSchemaPropsOrBool represents JSONSchemaProps or a boolean value.
        # Defaults to true for the boolean property.
        # Corresponds to the JSON property `additionalProperties`
        # @return [Google::Apis::RunV1beta1::JsonSchemaPropsOrBool]
        attr_accessor :additional_properties
      
        # 
        # Corresponds to the JSON property `allOf`
        # @return [Array<Google::Apis::RunV1beta1::JsonSchemaProps>]
        attr_accessor :all_of
      
        # 
        # Corresponds to the JSON property `anyOf`
        # @return [Array<Google::Apis::RunV1beta1::JsonSchemaProps>]
        attr_accessor :any_of
      
        # JSON represents any valid JSON value.
        # These types are supported: bool, int64, float64, string, []interface``,
        # map[string]interface`` and nil.
        # Corresponds to the JSON property `default`
        # @return [Google::Apis::RunV1beta1::Json]
        attr_accessor :default
      
        # 
        # Corresponds to the JSON property `definitions`
        # @return [Hash<String,Google::Apis::RunV1beta1::JsonSchemaProps>]
        attr_accessor :definitions
      
        # 
        # Corresponds to the JSON property `dependencies`
        # @return [Hash<String,Google::Apis::RunV1beta1::JsonSchemaPropsOrStringArray>]
        attr_accessor :dependencies
      
        # 
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # 
        # Corresponds to the JSON property `enum`
        # @return [Array<String>]
        attr_accessor :enum
      
        # JSON represents any valid JSON value.
        # These types are supported: bool, int64, float64, string, []interface``,
        # map[string]interface`` and nil.
        # Corresponds to the JSON property `example`
        # @return [Google::Apis::RunV1beta1::Json]
        attr_accessor :example
      
        # 
        # Corresponds to the JSON property `exclusiveMaximum`
        # @return [Boolean]
        attr_accessor :exclusive_maximum
        alias_method :exclusive_maximum?, :exclusive_maximum
      
        # 
        # Corresponds to the JSON property `exclusiveMinimum`
        # @return [Boolean]
        attr_accessor :exclusive_minimum
        alias_method :exclusive_minimum?, :exclusive_minimum
      
        # ExternalDocumentation allows referencing an external resource for extended
        # documentation.
        # Corresponds to the JSON property `externalDocs`
        # @return [Google::Apis::RunV1beta1::ExternalDocumentation]
        attr_accessor :external_docs
      
        # 
        # Corresponds to the JSON property `format`
        # @return [String]
        attr_accessor :format
      
        # 
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # JSONSchemaPropsOrArray represents a value that can either be a
        # JSONSchemaProps or an array of JSONSchemaProps. Mainly here for serialization
        # purposes.
        # Corresponds to the JSON property `items`
        # @return [Google::Apis::RunV1beta1::JsonSchemaPropsOrArray]
        attr_accessor :items
      
        # 
        # Corresponds to the JSON property `maxItems`
        # @return [Fixnum]
        attr_accessor :max_items
      
        # 
        # Corresponds to the JSON property `maxLength`
        # @return [Fixnum]
        attr_accessor :max_length
      
        # 
        # Corresponds to the JSON property `maxProperties`
        # @return [Fixnum]
        attr_accessor :max_properties
      
        # 
        # Corresponds to the JSON property `maximum`
        # @return [Float]
        attr_accessor :maximum
      
        # 
        # Corresponds to the JSON property `minItems`
        # @return [Fixnum]
        attr_accessor :min_items
      
        # 
        # Corresponds to the JSON property `minLength`
        # @return [Fixnum]
        attr_accessor :min_length
      
        # 
        # Corresponds to the JSON property `minProperties`
        # @return [Fixnum]
        attr_accessor :min_properties
      
        # 
        # Corresponds to the JSON property `minimum`
        # @return [Float]
        attr_accessor :minimum
      
        # 
        # Corresponds to the JSON property `multipleOf`
        # @return [Float]
        attr_accessor :multiple_of
      
        # JSONSchemaProps is a JSON-Schema following Specification Draft 4
        # (http://json-schema.org/).
        # Corresponds to the JSON property `not`
        # @return [Google::Apis::RunV1beta1::JsonSchemaProps]
        attr_accessor :not
      
        # 
        # Corresponds to the JSON property `oneOf`
        # @return [Array<Google::Apis::RunV1beta1::JsonSchemaProps>]
        attr_accessor :one_of
      
        # 
        # Corresponds to the JSON property `pattern`
        # @return [String]
        attr_accessor :pattern
      
        # 
        # Corresponds to the JSON property `patternProperties`
        # @return [Hash<String,Google::Apis::RunV1beta1::JsonSchemaProps>]
        attr_accessor :pattern_properties
      
        # 
        # Corresponds to the JSON property `properties`
        # @return [Hash<String,Google::Apis::RunV1beta1::JsonSchemaProps>]
        attr_accessor :properties
      
        # 
        # Corresponds to the JSON property `ref`
        # @return [String]
        attr_accessor :ref
      
        # 
        # Corresponds to the JSON property `required`
        # @return [Array<String>]
        attr_accessor :required
      
        # 
        # Corresponds to the JSON property `schema`
        # @return [String]
        attr_accessor :schema
      
        # 
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        # 
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # 
        # Corresponds to the JSON property `uniqueItems`
        # @return [Boolean]
        attr_accessor :unique_items
        alias_method :unique_items?, :unique_items
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @additional_items = args[:additional_items] if args.key?(:additional_items)
          @additional_properties = args[:additional_properties] if args.key?(:additional_properties)
          @all_of = args[:all_of] if args.key?(:all_of)
          @any_of = args[:any_of] if args.key?(:any_of)
          @default = args[:default] if args.key?(:default)
          @definitions = args[:definitions] if args.key?(:definitions)
          @dependencies = args[:dependencies] if args.key?(:dependencies)
          @description = args[:description] if args.key?(:description)
          @enum = args[:enum] if args.key?(:enum)
          @example = args[:example] if args.key?(:example)
          @exclusive_maximum = args[:exclusive_maximum] if args.key?(:exclusive_maximum)
          @exclusive_minimum = args[:exclusive_minimum] if args.key?(:exclusive_minimum)
          @external_docs = args[:external_docs] if args.key?(:external_docs)
          @format = args[:format] if args.key?(:format)
          @id = args[:id] if args.key?(:id)
          @items = args[:items] if args.key?(:items)
          @max_items = args[:max_items] if args.key?(:max_items)
          @max_length = args[:max_length] if args.key?(:max_length)
          @max_properties = args[:max_properties] if args.key?(:max_properties)
          @maximum = args[:maximum] if args.key?(:maximum)
          @min_items = args[:min_items] if args.key?(:min_items)
          @min_length = args[:min_length] if args.key?(:min_length)
          @min_properties = args[:min_properties] if args.key?(:min_properties)
          @minimum = args[:minimum] if args.key?(:minimum)
          @multiple_of = args[:multiple_of] if args.key?(:multiple_of)
          @not = args[:not] if args.key?(:not)
          @one_of = args[:one_of] if args.key?(:one_of)
          @pattern = args[:pattern] if args.key?(:pattern)
          @pattern_properties = args[:pattern_properties] if args.key?(:pattern_properties)
          @properties = args[:properties] if args.key?(:properties)
          @ref = args[:ref] if args.key?(:ref)
          @required = args[:required] if args.key?(:required)
          @schema = args[:schema] if args.key?(:schema)
          @title = args[:title] if args.key?(:title)
          @type = args[:type] if args.key?(:type)
          @unique_items = args[:unique_items] if args.key?(:unique_items)
        end
      end
      
      # JSONSchemaPropsOrArray represents a value that can either be a
      # JSONSchemaProps or an array of JSONSchemaProps. Mainly here for serialization
      # purposes.
      class JsonSchemaPropsOrArray
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `jsonSchemas`
        # @return [Array<Google::Apis::RunV1beta1::JsonSchemaProps>]
        attr_accessor :json_schemas
      
        # JSONSchemaProps is a JSON-Schema following Specification Draft 4
        # (http://json-schema.org/).
        # Corresponds to the JSON property `schema`
        # @return [Google::Apis::RunV1beta1::JsonSchemaProps]
        attr_accessor :schema
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @json_schemas = args[:json_schemas] if args.key?(:json_schemas)
          @schema = args[:schema] if args.key?(:schema)
        end
      end
      
      # JSONSchemaPropsOrBool represents JSONSchemaProps or a boolean value.
      # Defaults to true for the boolean property.
      class JsonSchemaPropsOrBool
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `allows`
        # @return [Boolean]
        attr_accessor :allows
        alias_method :allows?, :allows
      
        # JSONSchemaProps is a JSON-Schema following Specification Draft 4
        # (http://json-schema.org/).
        # Corresponds to the JSON property `schema`
        # @return [Google::Apis::RunV1beta1::JsonSchemaProps]
        attr_accessor :schema
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @allows = args[:allows] if args.key?(:allows)
          @schema = args[:schema] if args.key?(:schema)
        end
      end
      
      # JSONSchemaPropsOrStringArray represents a JSONSchemaProps or a string array.
      class JsonSchemaPropsOrStringArray
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `property`
        # @return [Array<String>]
        attr_accessor :property
      
        # JSONSchemaProps is a JSON-Schema following Specification Draft 4
        # (http://json-schema.org/).
        # Corresponds to the JSON property `schema`
        # @return [Google::Apis::RunV1beta1::JsonSchemaProps]
        attr_accessor :schema
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @property = args[:property] if args.key?(:property)
          @schema = args[:schema] if args.key?(:schema)
        end
      end
      
      # 
      class ListCustomResourceDefinitionsResponse
        include Google::Apis::Core::Hashable
      
        # The API version for this call such as "k8s.apiextensions.io/v1beta1".
        # Corresponds to the JSON property `apiVersion`
        # @return [String]
        attr_accessor :api_version
      
        # List of CustomResourceDefinitions.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::RunV1beta1::CustomResourceDefinition>]
        attr_accessor :items
      
        # The kind of this resource, in this case "CustomResourceDefinitionList".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # ListMeta describes metadata that synthetic resources must have, including
        # lists and various status objects. A resource may have only one of
        # `ObjectMeta, ListMeta`.
        # Corresponds to the JSON property `metadata`
        # @return [Google::Apis::RunV1beta1::ListMeta]
        attr_accessor :metadata
      
        # Locations that could not be reached.
        # Corresponds to the JSON property `unreachable`
        # @return [Array<String>]
        attr_accessor :unreachable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @api_version = args[:api_version] if args.key?(:api_version)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @metadata = args[:metadata] if args.key?(:metadata)
          @unreachable = args[:unreachable] if args.key?(:unreachable)
        end
      end
      
      # ListMeta describes metadata that synthetic resources must have, including
      # lists and various status objects. A resource may have only one of
      # `ObjectMeta, ListMeta`.
      class ListMeta
        include Google::Apis::Core::Hashable
      
        # continue may be set if the user set a limit on the number of items
        # returned, and indicates that the server has more data available. The value
        # is opaque and may be used to issue another request to the endpoint that
        # served this list to retrieve the next set of available objects. Continuing
        # a list may not be possible if the server configuration has changed or more
        # than a few minutes have passed. The resourceVersion field returned when
        # using this continue value will be identical to the value in the first
        # response.
        # Corresponds to the JSON property `continue`
        # @return [String]
        attr_accessor :continue
      
        # String that identifies the server's internal version of this object that
        # can be used by clients to determine when objects have changed. Value must
        # be treated as opaque by clients and passed unmodified back to the server.
        # Populated by the system.
        # Read-only.
        # More info:
        # https://git.k8s.io/community/contributors/devel/api-conventions.md#concurrency-
        # control-and-consistency
        # +optional
        # Corresponds to the JSON property `resourceVersion`
        # @return [String]
        attr_accessor :resource_version
      
        # SelfLink is a URL representing this object.
        # Populated by the system.
        # Read-only.
        # +optional
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @continue = args[:continue] if args.key?(:continue)
          @resource_version = args[:resource_version] if args.key?(:resource_version)
          @self_link = args[:self_link] if args.key?(:self_link)
        end
      end
      
      # k8s.io.apimachinery.pkg.apis.meta.v1.ObjectMeta is metadata that all
      # persisted resources must have, which includes all objects users must create.
      class ObjectMeta
        include Google::Apis::Core::Hashable
      
        # (Optional)
        # Annotations is an unstructured key value map stored with a resource that
        # may be set by external tools to store and retrieve arbitrary metadata. They
        # are not queryable and should be preserved when modifying objects. More
        # info: http://kubernetes.io/docs/user-guide/annotations
        # Corresponds to the JSON property `annotations`
        # @return [Hash<String,String>]
        attr_accessor :annotations
      
        # (Optional)
        # Cloud Run fully managed: not supported
        # Cloud Run for Anthos: supported
        # The name of the cluster which the object belongs to.
        # This is used to distinguish resources with same name and namespace in
        # different clusters. This field is not set anywhere right now and apiserver
        # is going to ignore it if set in create or update request.
        # Corresponds to the JSON property `clusterName`
        # @return [String]
        attr_accessor :cluster_name
      
        # (Optional)
        # CreationTimestamp is a timestamp representing the server time when this
        # object was created. It is not guaranteed to be set in happens-before order
        # across separate operations. Clients may not set this value. It is
        # represented in RFC3339 form and is in UTC.
        # Populated by the system.
        # Read-only.
        # Null for lists.
        # More info:
        # https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
        # Corresponds to the JSON property `creationTimestamp`
        # @return [String]
        attr_accessor :creation_timestamp
      
        # (Optional)
        # Cloud Run fully managed: not supported
        # Cloud Run for Anthos: supported
        # Number of seconds allowed for this object to gracefully terminate before
        # it will be removed from the system. Only set when deletionTimestamp is also
        # set. May only be shortened. Read-only.
        # Corresponds to the JSON property `deletionGracePeriodSeconds`
        # @return [Fixnum]
        attr_accessor :deletion_grace_period_seconds
      
        # (Optional)
        # Cloud Run fully managed: not supported
        # Cloud Run for Anthos: supported
        # DeletionTimestamp is RFC 3339 date and time at which this resource will be
        # deleted. This field is set by the server when a graceful deletion is
        # requested by the user, and is not directly settable by a client. The
        # resource is expected to be deleted (no longer visible from resource lists,
        # and not reachable by name) after the time in this field, once the
        # finalizers list is empty. As long as the finalizers list contains items,
        # deletion is blocked. Once the deletionTimestamp is set, this value may not
        # be unset or be set further into the future, although it may be shortened or
        # the resource may be deleted prior to this time. For example, a user may
        # request that a pod is deleted in 30 seconds. The Kubelet will react by
        # sending a graceful termination signal to the containers in the pod. After
        # that 30 seconds, the Kubelet will send a hard termination signal (SIGKILL)
        # to the container and after cleanup, remove the pod from the API. In the
        # presence of network partitions, this object may still exist after this
        # timestamp, until an administrator or automated process can determine the
        # resource is fully terminated.
        # If not set, graceful deletion of the object has not been requested.
        # Populated by the system when a graceful deletion is requested.
        # Read-only.
        # More info:
        # https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
        # Corresponds to the JSON property `deletionTimestamp`
        # @return [String]
        attr_accessor :deletion_timestamp
      
        # (Optional)
        # Cloud Run fully managed: not supported
        # Cloud Run for Anthos: supported
        # Must be empty before the object is deleted from the registry. Each entry
        # is an identifier for the responsible component that will remove the entry
        # from the list. If the deletionTimestamp of the object is non-nil, entries
        # in this list can only be removed.
        # +patchStrategy=merge
        # Corresponds to the JSON property `finalizers`
        # @return [Array<String>]
        attr_accessor :finalizers
      
        # (Optional)
        # Cloud Run fully managed: not supported
        # Cloud Run for Anthos: supported
        # GenerateName is an optional prefix, used by the server, to generate a
        # unique name ONLY IF the Name field has not been provided. If this field is
        # used, the name returned to the client will be different than the name
        # passed. This value will also be combined with a unique suffix. The provided
        # value has the same validation rules as the Name field, and may be truncated
        # by the length of the suffix required to make the value unique on the
        # server.
        # If this field is specified and the generated name exists, the server will
        # NOT return a 409 - instead, it will either return 201 Created or 500 with
        # Reason ServerTimeout indicating a unique name could not be found in the
        # time allotted, and the client should retry (optionally after the time
        # indicated in the Retry-After header).
        # Applied only if Name is not specified.
        # More info:
        # https://git.k8s.io/community/contributors/devel/api-conventions.md#idempotency
        # string generateName = 2;
        # Corresponds to the JSON property `generateName`
        # @return [String]
        attr_accessor :generate_name
      
        # (Optional)
        # A sequence number representing a specific generation of the desired state.
        # Populated by the system. Read-only.
        # Corresponds to the JSON property `generation`
        # @return [Fixnum]
        attr_accessor :generation
      
        # (Optional)
        # Map of string keys and values that can be used to organize and categorize
        # (scope and select) objects. May match selectors of replication controllers
        # and routes.
        # More info: http://kubernetes.io/docs/user-guide/labels
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # Name must be unique within a namespace, within a Cloud Run region.
        # Is required when creating
        # resources, although some resources may allow a client to request the
        # generation of an appropriate name automatically. Name is primarily intended
        # for creation idempotence and configuration definition. Cannot be updated.
        # More info: http://kubernetes.io/docs/user-guide/identifiers#names
        # +optional
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Namespace defines the space within each name must be unique, within a
        # Cloud Run region. In Cloud Run the namespace must be equal to either the
        # project ID or project number.
        # Corresponds to the JSON property `namespace`
        # @return [String]
        attr_accessor :namespace
      
        # (Optional)
        # Cloud Run fully managed: not supported
        # Cloud Run for Anthos: supported
        # List of objects that own this object. If ALL objects in the list have
        # been deleted, this object will be garbage collected.
        # Corresponds to the JSON property `ownerReferences`
        # @return [Array<Google::Apis::RunV1beta1::OwnerReference>]
        attr_accessor :owner_references
      
        # (Optional)
        # An opaque value that represents the internal version of this object that
        # can be used by clients to determine when objects have changed. May be used
        # for optimistic concurrency, change detection, and the watch operation on a
        # resource or set of resources. Clients must treat these values as opaque and
        # passed unmodified back to the server. They may only be valid for a
        # particular resource or set of resources.
        # Populated by the system.
        # Read-only.
        # Value must be treated as opaque by clients and .
        # More info:
        # https://git.k8s.io/community/contributors/devel/api-conventions.md#concurrency-
        # control-and-consistency
        # Corresponds to the JSON property `resourceVersion`
        # @return [String]
        attr_accessor :resource_version
      
        # (Optional)
        # SelfLink is a URL representing this object.
        # Populated by the system.
        # Read-only.
        # string selfLink = 4;
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        # (Optional)
        # UID is the unique in time and space value for this object. It is typically
        # generated by the server on successful creation of a resource and is not
        # allowed to change on PUT operations.
        # Populated by the system.
        # Read-only.
        # More info: http://kubernetes.io/docs/user-guide/identifiers#uids
        # Corresponds to the JSON property `uid`
        # @return [String]
        attr_accessor :uid
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @annotations = args[:annotations] if args.key?(:annotations)
          @cluster_name = args[:cluster_name] if args.key?(:cluster_name)
          @creation_timestamp = args[:creation_timestamp] if args.key?(:creation_timestamp)
          @deletion_grace_period_seconds = args[:deletion_grace_period_seconds] if args.key?(:deletion_grace_period_seconds)
          @deletion_timestamp = args[:deletion_timestamp] if args.key?(:deletion_timestamp)
          @finalizers = args[:finalizers] if args.key?(:finalizers)
          @generate_name = args[:generate_name] if args.key?(:generate_name)
          @generation = args[:generation] if args.key?(:generation)
          @labels = args[:labels] if args.key?(:labels)
          @name = args[:name] if args.key?(:name)
          @namespace = args[:namespace] if args.key?(:namespace)
          @owner_references = args[:owner_references] if args.key?(:owner_references)
          @resource_version = args[:resource_version] if args.key?(:resource_version)
          @self_link = args[:self_link] if args.key?(:self_link)
          @uid = args[:uid] if args.key?(:uid)
        end
      end
      
      # OwnerReference contains enough information to let you identify an owning
      # object. Currently, an owning object must be in the same namespace, so there
      # is no namespace field.
      class OwnerReference
        include Google::Apis::Core::Hashable
      
        # API version of the referent.
        # Corresponds to the JSON property `apiVersion`
        # @return [String]
        attr_accessor :api_version
      
        # If true, AND if the owner has the "foregroundDeletion" finalizer, then
        # the owner cannot be deleted from the key-value store until this
        # reference is removed.
        # Defaults to false.
        # To set this field, a user needs "delete" permission of the owner,
        # otherwise 422 (Unprocessable Entity) will be returned.
        # +optional
        # Corresponds to the JSON property `blockOwnerDeletion`
        # @return [Boolean]
        attr_accessor :block_owner_deletion
        alias_method :block_owner_deletion?, :block_owner_deletion
      
        # If true, this reference points to the managing controller.
        # +optional
        # Corresponds to the JSON property `controller`
        # @return [Boolean]
        attr_accessor :controller
        alias_method :controller?, :controller
      
        # Kind of the referent.
        # More info:
        # https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Name of the referent.
        # More info: http://kubernetes.io/docs/user-guide/identifiers#names
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # UID of the referent.
        # More info: http://kubernetes.io/docs/user-guide/identifiers#uids
        # Corresponds to the JSON property `uid`
        # @return [String]
        attr_accessor :uid
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @api_version = args[:api_version] if args.key?(:api_version)
          @block_owner_deletion = args[:block_owner_deletion] if args.key?(:block_owner_deletion)
          @controller = args[:controller] if args.key?(:controller)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
          @uid = args[:uid] if args.key?(:uid)
        end
      end
    end
  end
end
