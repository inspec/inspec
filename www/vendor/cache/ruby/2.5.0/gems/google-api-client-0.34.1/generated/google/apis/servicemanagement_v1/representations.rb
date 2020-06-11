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
    module ServicemanagementV1
      
      class Advice
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Api
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AuditConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AuditLogConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AuthProvider
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AuthRequirement
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Authentication
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AuthenticationRule
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Backend
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BackendRule
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Billing
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BillingDestination
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Binding
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ChangeReport
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConfigChange
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConfigFile
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConfigRef
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConfigSource
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Context
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ContextRule
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Control
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomError
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomErrorRule
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomHttpPattern
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeleteServiceStrategy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Diagnostic
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DisableServiceRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DisableServiceResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Documentation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DocumentationRule
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EnableServiceRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EnableServiceResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Endpoint
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Enum
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EnumValue
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Expr
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Field
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FlowErrorDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GenerateConfigReportRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GenerateConfigReportResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GetIamPolicyRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GetPolicyOptions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Http
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HttpRule
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LabelDescriptor
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListOperationsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListServiceConfigsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListServiceRolloutsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListServicesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LogDescriptor
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Logging
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LoggingDestination
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ManagedService
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MethodProp
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MetricDescriptor
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MetricDescriptorMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MetricRule
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Mixin
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MonitoredResourceDescriptor
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Monitoring
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MonitoringDestination
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OAuthRequirements
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Operation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OperationMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Option
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Page
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Policy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Quota
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class QuotaLimit
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Rollout
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Service
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SetIamPolicyRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SourceContext
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SourceInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Status
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Step
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SubmitConfigSourceRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SubmitConfigSourceResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SystemParameter
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SystemParameterRule
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SystemParameters
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TestIamPermissionsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TestIamPermissionsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TrafficPercentStrategy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Type
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UndeleteServiceResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Usage
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UsageRule
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Advice
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
        end
      end
      
      class Api
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :methods_prop, as: 'methods', class: Google::Apis::ServicemanagementV1::MethodProp, decorator: Google::Apis::ServicemanagementV1::MethodProp::Representation
      
          collection :mixins, as: 'mixins', class: Google::Apis::ServicemanagementV1::Mixin, decorator: Google::Apis::ServicemanagementV1::Mixin::Representation
      
          property :name, as: 'name'
          collection :options, as: 'options', class: Google::Apis::ServicemanagementV1::Option, decorator: Google::Apis::ServicemanagementV1::Option::Representation
      
          property :source_context, as: 'sourceContext', class: Google::Apis::ServicemanagementV1::SourceContext, decorator: Google::Apis::ServicemanagementV1::SourceContext::Representation
      
          property :syntax, as: 'syntax'
          property :version, as: 'version'
        end
      end
      
      class AuditConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :audit_log_configs, as: 'auditLogConfigs', class: Google::Apis::ServicemanagementV1::AuditLogConfig, decorator: Google::Apis::ServicemanagementV1::AuditLogConfig::Representation
      
          property :service, as: 'service'
        end
      end
      
      class AuditLogConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :exempted_members, as: 'exemptedMembers'
          property :log_type, as: 'logType'
        end
      end
      
      class AuthProvider
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :audiences, as: 'audiences'
          property :authorization_url, as: 'authorizationUrl'
          property :id, as: 'id'
          property :issuer, as: 'issuer'
          property :jwks_uri, as: 'jwksUri'
        end
      end
      
      class AuthRequirement
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :audiences, as: 'audiences'
          property :provider_id, as: 'providerId'
        end
      end
      
      class Authentication
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :providers, as: 'providers', class: Google::Apis::ServicemanagementV1::AuthProvider, decorator: Google::Apis::ServicemanagementV1::AuthProvider::Representation
      
          collection :rules, as: 'rules', class: Google::Apis::ServicemanagementV1::AuthenticationRule, decorator: Google::Apis::ServicemanagementV1::AuthenticationRule::Representation
      
        end
      end
      
      class AuthenticationRule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :allow_without_credential, as: 'allowWithoutCredential'
          property :oauth, as: 'oauth', class: Google::Apis::ServicemanagementV1::OAuthRequirements, decorator: Google::Apis::ServicemanagementV1::OAuthRequirements::Representation
      
          collection :requirements, as: 'requirements', class: Google::Apis::ServicemanagementV1::AuthRequirement, decorator: Google::Apis::ServicemanagementV1::AuthRequirement::Representation
      
          property :selector, as: 'selector'
        end
      end
      
      class Backend
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :rules, as: 'rules', class: Google::Apis::ServicemanagementV1::BackendRule, decorator: Google::Apis::ServicemanagementV1::BackendRule::Representation
      
        end
      end
      
      class BackendRule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :address, as: 'address'
          property :deadline, as: 'deadline'
          property :jwt_audience, as: 'jwtAudience'
          property :min_deadline, as: 'minDeadline'
          property :operation_deadline, as: 'operationDeadline'
          property :path_translation, as: 'pathTranslation'
          property :selector, as: 'selector'
        end
      end
      
      class Billing
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :consumer_destinations, as: 'consumerDestinations', class: Google::Apis::ServicemanagementV1::BillingDestination, decorator: Google::Apis::ServicemanagementV1::BillingDestination::Representation
      
        end
      end
      
      class BillingDestination
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :metrics, as: 'metrics'
          property :monitored_resource, as: 'monitoredResource'
        end
      end
      
      class Binding
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :condition, as: 'condition', class: Google::Apis::ServicemanagementV1::Expr, decorator: Google::Apis::ServicemanagementV1::Expr::Representation
      
          collection :members, as: 'members'
          property :role, as: 'role'
        end
      end
      
      class ChangeReport
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :config_changes, as: 'configChanges', class: Google::Apis::ServicemanagementV1::ConfigChange, decorator: Google::Apis::ServicemanagementV1::ConfigChange::Representation
      
        end
      end
      
      class ConfigChange
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :advices, as: 'advices', class: Google::Apis::ServicemanagementV1::Advice, decorator: Google::Apis::ServicemanagementV1::Advice::Representation
      
          property :change_type, as: 'changeType'
          property :element, as: 'element'
          property :new_value, as: 'newValue'
          property :old_value, as: 'oldValue'
        end
      end
      
      class ConfigFile
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :file_contents, :base64 => true, as: 'fileContents'
          property :file_path, as: 'filePath'
          property :file_type, as: 'fileType'
        end
      end
      
      class ConfigRef
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
        end
      end
      
      class ConfigSource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :files, as: 'files', class: Google::Apis::ServicemanagementV1::ConfigFile, decorator: Google::Apis::ServicemanagementV1::ConfigFile::Representation
      
          property :id, as: 'id'
        end
      end
      
      class Context
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :rules, as: 'rules', class: Google::Apis::ServicemanagementV1::ContextRule, decorator: Google::Apis::ServicemanagementV1::ContextRule::Representation
      
        end
      end
      
      class ContextRule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :allowed_request_extensions, as: 'allowedRequestExtensions'
          collection :allowed_response_extensions, as: 'allowedResponseExtensions'
          collection :provided, as: 'provided'
          collection :requested, as: 'requested'
          property :selector, as: 'selector'
        end
      end
      
      class Control
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :environment, as: 'environment'
        end
      end
      
      class CustomError
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :rules, as: 'rules', class: Google::Apis::ServicemanagementV1::CustomErrorRule, decorator: Google::Apis::ServicemanagementV1::CustomErrorRule::Representation
      
          collection :types, as: 'types'
        end
      end
      
      class CustomErrorRule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :is_error_type, as: 'isErrorType'
          property :selector, as: 'selector'
        end
      end
      
      class CustomHttpPattern
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :path, as: 'path'
        end
      end
      
      class DeleteServiceStrategy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class Diagnostic
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :location, as: 'location'
          property :message, as: 'message'
        end
      end
      
      class DisableServiceRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :consumer_id, as: 'consumerId'
        end
      end
      
      class DisableServiceResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class Documentation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :documentation_root_url, as: 'documentationRootUrl'
          property :overview, as: 'overview'
          collection :pages, as: 'pages', class: Google::Apis::ServicemanagementV1::Page, decorator: Google::Apis::ServicemanagementV1::Page::Representation
      
          collection :rules, as: 'rules', class: Google::Apis::ServicemanagementV1::DocumentationRule, decorator: Google::Apis::ServicemanagementV1::DocumentationRule::Representation
      
          property :service_root_url, as: 'serviceRootUrl'
          property :summary, as: 'summary'
        end
      end
      
      class DocumentationRule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :deprecation_description, as: 'deprecationDescription'
          property :description, as: 'description'
          property :selector, as: 'selector'
        end
      end
      
      class EnableServiceRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :consumer_id, as: 'consumerId'
        end
      end
      
      class EnableServiceResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class Endpoint
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :aliases, as: 'aliases'
          property :allow_cors, as: 'allowCors'
          collection :features, as: 'features'
          property :name, as: 'name'
          property :target, as: 'target'
        end
      end
      
      class Enum
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :enumvalue, as: 'enumvalue', class: Google::Apis::ServicemanagementV1::EnumValue, decorator: Google::Apis::ServicemanagementV1::EnumValue::Representation
      
          property :name, as: 'name'
          collection :options, as: 'options', class: Google::Apis::ServicemanagementV1::Option, decorator: Google::Apis::ServicemanagementV1::Option::Representation
      
          property :source_context, as: 'sourceContext', class: Google::Apis::ServicemanagementV1::SourceContext, decorator: Google::Apis::ServicemanagementV1::SourceContext::Representation
      
          property :syntax, as: 'syntax'
        end
      end
      
      class EnumValue
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :number, as: 'number'
          collection :options, as: 'options', class: Google::Apis::ServicemanagementV1::Option, decorator: Google::Apis::ServicemanagementV1::Option::Representation
      
        end
      end
      
      class Expr
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :expression, as: 'expression'
          property :location, as: 'location'
          property :title, as: 'title'
        end
      end
      
      class Field
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cardinality, as: 'cardinality'
          property :default_value, as: 'defaultValue'
          property :json_name, as: 'jsonName'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :number, as: 'number'
          property :oneof_index, as: 'oneofIndex'
          collection :options, as: 'options', class: Google::Apis::ServicemanagementV1::Option, decorator: Google::Apis::ServicemanagementV1::Option::Representation
      
          property :packed, as: 'packed'
          property :type_url, as: 'typeUrl'
        end
      end
      
      class FlowErrorDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :exception_type, as: 'exceptionType'
          property :flow_step_id, as: 'flowStepId'
        end
      end
      
      class GenerateConfigReportRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :new_config, as: 'newConfig'
          hash :old_config, as: 'oldConfig'
        end
      end
      
      class GenerateConfigReportResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :change_reports, as: 'changeReports', class: Google::Apis::ServicemanagementV1::ChangeReport, decorator: Google::Apis::ServicemanagementV1::ChangeReport::Representation
      
          collection :diagnostics, as: 'diagnostics', class: Google::Apis::ServicemanagementV1::Diagnostic, decorator: Google::Apis::ServicemanagementV1::Diagnostic::Representation
      
          property :id, as: 'id'
          property :service_name, as: 'serviceName'
        end
      end
      
      class GetIamPolicyRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :options, as: 'options', class: Google::Apis::ServicemanagementV1::GetPolicyOptions, decorator: Google::Apis::ServicemanagementV1::GetPolicyOptions::Representation
      
        end
      end
      
      class GetPolicyOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :requested_policy_version, as: 'requestedPolicyVersion'
        end
      end
      
      class Http
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :fully_decode_reserved_expansion, as: 'fullyDecodeReservedExpansion'
          collection :rules, as: 'rules', class: Google::Apis::ServicemanagementV1::HttpRule, decorator: Google::Apis::ServicemanagementV1::HttpRule::Representation
      
        end
      end
      
      class HttpRule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :additional_bindings, as: 'additionalBindings', class: Google::Apis::ServicemanagementV1::HttpRule, decorator: Google::Apis::ServicemanagementV1::HttpRule::Representation
      
          property :body, as: 'body'
          property :custom, as: 'custom', class: Google::Apis::ServicemanagementV1::CustomHttpPattern, decorator: Google::Apis::ServicemanagementV1::CustomHttpPattern::Representation
      
          property :delete, as: 'delete'
          property :get, as: 'get'
          property :patch, as: 'patch'
          property :post, as: 'post'
          property :put, as: 'put'
          property :response_body, as: 'responseBody'
          property :selector, as: 'selector'
        end
      end
      
      class LabelDescriptor
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :key, as: 'key'
          property :value_type, as: 'valueType'
        end
      end
      
      class ListOperationsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :operations, as: 'operations', class: Google::Apis::ServicemanagementV1::Operation, decorator: Google::Apis::ServicemanagementV1::Operation::Representation
      
        end
      end
      
      class ListServiceConfigsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :service_configs, as: 'serviceConfigs', class: Google::Apis::ServicemanagementV1::Service, decorator: Google::Apis::ServicemanagementV1::Service::Representation
      
        end
      end
      
      class ListServiceRolloutsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :rollouts, as: 'rollouts', class: Google::Apis::ServicemanagementV1::Rollout, decorator: Google::Apis::ServicemanagementV1::Rollout::Representation
      
        end
      end
      
      class ListServicesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :services, as: 'services', class: Google::Apis::ServicemanagementV1::ManagedService, decorator: Google::Apis::ServicemanagementV1::ManagedService::Representation
      
        end
      end
      
      class LogDescriptor
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :display_name, as: 'displayName'
          collection :labels, as: 'labels', class: Google::Apis::ServicemanagementV1::LabelDescriptor, decorator: Google::Apis::ServicemanagementV1::LabelDescriptor::Representation
      
          property :name, as: 'name'
        end
      end
      
      class Logging
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :consumer_destinations, as: 'consumerDestinations', class: Google::Apis::ServicemanagementV1::LoggingDestination, decorator: Google::Apis::ServicemanagementV1::LoggingDestination::Representation
      
          collection :producer_destinations, as: 'producerDestinations', class: Google::Apis::ServicemanagementV1::LoggingDestination, decorator: Google::Apis::ServicemanagementV1::LoggingDestination::Representation
      
        end
      end
      
      class LoggingDestination
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :logs, as: 'logs'
          property :monitored_resource, as: 'monitoredResource'
        end
      end
      
      class ManagedService
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :producer_project_id, as: 'producerProjectId'
          property :service_name, as: 'serviceName'
        end
      end
      
      class MethodProp
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          collection :options, as: 'options', class: Google::Apis::ServicemanagementV1::Option, decorator: Google::Apis::ServicemanagementV1::Option::Representation
      
          property :request_streaming, as: 'requestStreaming'
          property :request_type_url, as: 'requestTypeUrl'
          property :response_streaming, as: 'responseStreaming'
          property :response_type_url, as: 'responseTypeUrl'
          property :syntax, as: 'syntax'
        end
      end
      
      class MetricDescriptor
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :display_name, as: 'displayName'
          collection :labels, as: 'labels', class: Google::Apis::ServicemanagementV1::LabelDescriptor, decorator: Google::Apis::ServicemanagementV1::LabelDescriptor::Representation
      
          property :launch_stage, as: 'launchStage'
          property :metadata, as: 'metadata', class: Google::Apis::ServicemanagementV1::MetricDescriptorMetadata, decorator: Google::Apis::ServicemanagementV1::MetricDescriptorMetadata::Representation
      
          property :metric_kind, as: 'metricKind'
          collection :monitored_resource_types, as: 'monitoredResourceTypes'
          property :name, as: 'name'
          property :type, as: 'type'
          property :unit, as: 'unit'
          property :value_type, as: 'valueType'
        end
      end
      
      class MetricDescriptorMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :ingest_delay, as: 'ingestDelay'
          property :launch_stage, as: 'launchStage'
          property :sample_period, as: 'samplePeriod'
        end
      end
      
      class MetricRule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :metric_costs, as: 'metricCosts'
          property :selector, as: 'selector'
        end
      end
      
      class Mixin
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :root, as: 'root'
        end
      end
      
      class MonitoredResourceDescriptor
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :display_name, as: 'displayName'
          collection :labels, as: 'labels', class: Google::Apis::ServicemanagementV1::LabelDescriptor, decorator: Google::Apis::ServicemanagementV1::LabelDescriptor::Representation
      
          property :launch_stage, as: 'launchStage'
          property :name, as: 'name'
          property :type, as: 'type'
        end
      end
      
      class Monitoring
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :consumer_destinations, as: 'consumerDestinations', class: Google::Apis::ServicemanagementV1::MonitoringDestination, decorator: Google::Apis::ServicemanagementV1::MonitoringDestination::Representation
      
          collection :producer_destinations, as: 'producerDestinations', class: Google::Apis::ServicemanagementV1::MonitoringDestination, decorator: Google::Apis::ServicemanagementV1::MonitoringDestination::Representation
      
        end
      end
      
      class MonitoringDestination
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :metrics, as: 'metrics'
          property :monitored_resource, as: 'monitoredResource'
        end
      end
      
      class OAuthRequirements
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :canonical_scopes, as: 'canonicalScopes'
        end
      end
      
      class Operation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :done, as: 'done'
          property :error, as: 'error', class: Google::Apis::ServicemanagementV1::Status, decorator: Google::Apis::ServicemanagementV1::Status::Representation
      
          hash :metadata, as: 'metadata'
          property :name, as: 'name'
          hash :response, as: 'response'
        end
      end
      
      class OperationMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :progress_percentage, as: 'progressPercentage'
          collection :resource_names, as: 'resourceNames'
          property :start_time, as: 'startTime'
          collection :steps, as: 'steps', class: Google::Apis::ServicemanagementV1::Step, decorator: Google::Apis::ServicemanagementV1::Step::Representation
      
        end
      end
      
      class Option
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          hash :value, as: 'value'
        end
      end
      
      class Page
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :content, as: 'content'
          property :name, as: 'name'
          collection :subpages, as: 'subpages', class: Google::Apis::ServicemanagementV1::Page, decorator: Google::Apis::ServicemanagementV1::Page::Representation
      
        end
      end
      
      class Policy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :audit_configs, as: 'auditConfigs', class: Google::Apis::ServicemanagementV1::AuditConfig, decorator: Google::Apis::ServicemanagementV1::AuditConfig::Representation
      
          collection :bindings, as: 'bindings', class: Google::Apis::ServicemanagementV1::Binding, decorator: Google::Apis::ServicemanagementV1::Binding::Representation
      
          property :etag, :base64 => true, as: 'etag'
          property :version, as: 'version'
        end
      end
      
      class Quota
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :limits, as: 'limits', class: Google::Apis::ServicemanagementV1::QuotaLimit, decorator: Google::Apis::ServicemanagementV1::QuotaLimit::Representation
      
          collection :metric_rules, as: 'metricRules', class: Google::Apis::ServicemanagementV1::MetricRule, decorator: Google::Apis::ServicemanagementV1::MetricRule::Representation
      
        end
      end
      
      class QuotaLimit
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :default_limit, :numeric_string => true, as: 'defaultLimit'
          property :description, as: 'description'
          property :display_name, as: 'displayName'
          property :duration, as: 'duration'
          property :free_tier, :numeric_string => true, as: 'freeTier'
          property :max_limit, :numeric_string => true, as: 'maxLimit'
          property :metric, as: 'metric'
          property :name, as: 'name'
          property :unit, as: 'unit'
          hash :values, as: 'values'
        end
      end
      
      class Rollout
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_time, as: 'createTime'
          property :created_by, as: 'createdBy'
          property :delete_service_strategy, as: 'deleteServiceStrategy', class: Google::Apis::ServicemanagementV1::DeleteServiceStrategy, decorator: Google::Apis::ServicemanagementV1::DeleteServiceStrategy::Representation
      
          property :rollout_id, as: 'rolloutId'
          property :service_name, as: 'serviceName'
          property :status, as: 'status'
          property :traffic_percent_strategy, as: 'trafficPercentStrategy', class: Google::Apis::ServicemanagementV1::TrafficPercentStrategy, decorator: Google::Apis::ServicemanagementV1::TrafficPercentStrategy::Representation
      
        end
      end
      
      class Service
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :apis, as: 'apis', class: Google::Apis::ServicemanagementV1::Api, decorator: Google::Apis::ServicemanagementV1::Api::Representation
      
          property :authentication, as: 'authentication', class: Google::Apis::ServicemanagementV1::Authentication, decorator: Google::Apis::ServicemanagementV1::Authentication::Representation
      
          property :backend, as: 'backend', class: Google::Apis::ServicemanagementV1::Backend, decorator: Google::Apis::ServicemanagementV1::Backend::Representation
      
          property :billing, as: 'billing', class: Google::Apis::ServicemanagementV1::Billing, decorator: Google::Apis::ServicemanagementV1::Billing::Representation
      
          property :config_version, as: 'configVersion'
          property :context, as: 'context', class: Google::Apis::ServicemanagementV1::Context, decorator: Google::Apis::ServicemanagementV1::Context::Representation
      
          property :control, as: 'control', class: Google::Apis::ServicemanagementV1::Control, decorator: Google::Apis::ServicemanagementV1::Control::Representation
      
          property :custom_error, as: 'customError', class: Google::Apis::ServicemanagementV1::CustomError, decorator: Google::Apis::ServicemanagementV1::CustomError::Representation
      
          property :documentation, as: 'documentation', class: Google::Apis::ServicemanagementV1::Documentation, decorator: Google::Apis::ServicemanagementV1::Documentation::Representation
      
          collection :endpoints, as: 'endpoints', class: Google::Apis::ServicemanagementV1::Endpoint, decorator: Google::Apis::ServicemanagementV1::Endpoint::Representation
      
          collection :enums, as: 'enums', class: Google::Apis::ServicemanagementV1::Enum, decorator: Google::Apis::ServicemanagementV1::Enum::Representation
      
          property :http, as: 'http', class: Google::Apis::ServicemanagementV1::Http, decorator: Google::Apis::ServicemanagementV1::Http::Representation
      
          property :id, as: 'id'
          property :logging, as: 'logging', class: Google::Apis::ServicemanagementV1::Logging, decorator: Google::Apis::ServicemanagementV1::Logging::Representation
      
          collection :logs, as: 'logs', class: Google::Apis::ServicemanagementV1::LogDescriptor, decorator: Google::Apis::ServicemanagementV1::LogDescriptor::Representation
      
          collection :metrics, as: 'metrics', class: Google::Apis::ServicemanagementV1::MetricDescriptor, decorator: Google::Apis::ServicemanagementV1::MetricDescriptor::Representation
      
          collection :monitored_resources, as: 'monitoredResources', class: Google::Apis::ServicemanagementV1::MonitoredResourceDescriptor, decorator: Google::Apis::ServicemanagementV1::MonitoredResourceDescriptor::Representation
      
          property :monitoring, as: 'monitoring', class: Google::Apis::ServicemanagementV1::Monitoring, decorator: Google::Apis::ServicemanagementV1::Monitoring::Representation
      
          property :name, as: 'name'
          property :producer_project_id, as: 'producerProjectId'
          property :quota, as: 'quota', class: Google::Apis::ServicemanagementV1::Quota, decorator: Google::Apis::ServicemanagementV1::Quota::Representation
      
          property :source_info, as: 'sourceInfo', class: Google::Apis::ServicemanagementV1::SourceInfo, decorator: Google::Apis::ServicemanagementV1::SourceInfo::Representation
      
          property :system_parameters, as: 'systemParameters', class: Google::Apis::ServicemanagementV1::SystemParameters, decorator: Google::Apis::ServicemanagementV1::SystemParameters::Representation
      
          collection :system_types, as: 'systemTypes', class: Google::Apis::ServicemanagementV1::Type, decorator: Google::Apis::ServicemanagementV1::Type::Representation
      
          property :title, as: 'title'
          collection :types, as: 'types', class: Google::Apis::ServicemanagementV1::Type, decorator: Google::Apis::ServicemanagementV1::Type::Representation
      
          property :usage, as: 'usage', class: Google::Apis::ServicemanagementV1::Usage, decorator: Google::Apis::ServicemanagementV1::Usage::Representation
      
        end
      end
      
      class SetIamPolicyRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :policy, as: 'policy', class: Google::Apis::ServicemanagementV1::Policy, decorator: Google::Apis::ServicemanagementV1::Policy::Representation
      
          property :update_mask, as: 'updateMask'
        end
      end
      
      class SourceContext
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :file_name, as: 'fileName'
        end
      end
      
      class SourceInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :source_files, as: 'sourceFiles'
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
      
      class Step
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :status, as: 'status'
        end
      end
      
      class SubmitConfigSourceRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :config_source, as: 'configSource', class: Google::Apis::ServicemanagementV1::ConfigSource, decorator: Google::Apis::ServicemanagementV1::ConfigSource::Representation
      
          property :validate_only, as: 'validateOnly'
        end
      end
      
      class SubmitConfigSourceResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :service_config, as: 'serviceConfig', class: Google::Apis::ServicemanagementV1::Service, decorator: Google::Apis::ServicemanagementV1::Service::Representation
      
        end
      end
      
      class SystemParameter
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :http_header, as: 'httpHeader'
          property :name, as: 'name'
          property :url_query_parameter, as: 'urlQueryParameter'
        end
      end
      
      class SystemParameterRule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :parameters, as: 'parameters', class: Google::Apis::ServicemanagementV1::SystemParameter, decorator: Google::Apis::ServicemanagementV1::SystemParameter::Representation
      
          property :selector, as: 'selector'
        end
      end
      
      class SystemParameters
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :rules, as: 'rules', class: Google::Apis::ServicemanagementV1::SystemParameterRule, decorator: Google::Apis::ServicemanagementV1::SystemParameterRule::Representation
      
        end
      end
      
      class TestIamPermissionsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :permissions, as: 'permissions'
        end
      end
      
      class TestIamPermissionsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :permissions, as: 'permissions'
        end
      end
      
      class TrafficPercentStrategy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :percentages, as: 'percentages'
        end
      end
      
      class Type
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :fields, as: 'fields', class: Google::Apis::ServicemanagementV1::Field, decorator: Google::Apis::ServicemanagementV1::Field::Representation
      
          property :name, as: 'name'
          collection :oneofs, as: 'oneofs'
          collection :options, as: 'options', class: Google::Apis::ServicemanagementV1::Option, decorator: Google::Apis::ServicemanagementV1::Option::Representation
      
          property :source_context, as: 'sourceContext', class: Google::Apis::ServicemanagementV1::SourceContext, decorator: Google::Apis::ServicemanagementV1::SourceContext::Representation
      
          property :syntax, as: 'syntax'
        end
      end
      
      class UndeleteServiceResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :service, as: 'service', class: Google::Apis::ServicemanagementV1::ManagedService, decorator: Google::Apis::ServicemanagementV1::ManagedService::Representation
      
        end
      end
      
      class Usage
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :producer_notification_channel, as: 'producerNotificationChannel'
          collection :requirements, as: 'requirements'
          collection :rules, as: 'rules', class: Google::Apis::ServicemanagementV1::UsageRule, decorator: Google::Apis::ServicemanagementV1::UsageRule::Representation
      
        end
      end
      
      class UsageRule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :allow_unregistered_calls, as: 'allowUnregisteredCalls'
          property :selector, as: 'selector'
          property :skip_service_control, as: 'skipServiceControl'
        end
      end
    end
  end
end
