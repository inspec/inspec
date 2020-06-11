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
    module SourcerepoV1
      
      class AuditConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AuditLogConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Binding
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Empty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Expr
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListReposResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MirrorConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Operation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Policy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ProjectConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PubsubConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Repo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SetIamPolicyRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Status
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SyncRepoMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SyncRepoRequest
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
      
      class UpdateProjectConfigRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UpdateRepoRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AuditConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :audit_log_configs, as: 'auditLogConfigs', class: Google::Apis::SourcerepoV1::AuditLogConfig, decorator: Google::Apis::SourcerepoV1::AuditLogConfig::Representation
      
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
      
      class Binding
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :condition, as: 'condition', class: Google::Apis::SourcerepoV1::Expr, decorator: Google::Apis::SourcerepoV1::Expr::Representation
      
          collection :members, as: 'members'
          property :role, as: 'role'
        end
      end
      
      class Empty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
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
      
      class ListReposResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :repos, as: 'repos', class: Google::Apis::SourcerepoV1::Repo, decorator: Google::Apis::SourcerepoV1::Repo::Representation
      
        end
      end
      
      class MirrorConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :deploy_key_id, as: 'deployKeyId'
          property :url, as: 'url'
          property :webhook_id, as: 'webhookId'
        end
      end
      
      class Operation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :done, as: 'done'
          property :error, as: 'error', class: Google::Apis::SourcerepoV1::Status, decorator: Google::Apis::SourcerepoV1::Status::Representation
      
          hash :metadata, as: 'metadata'
          property :name, as: 'name'
          hash :response, as: 'response'
        end
      end
      
      class Policy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :audit_configs, as: 'auditConfigs', class: Google::Apis::SourcerepoV1::AuditConfig, decorator: Google::Apis::SourcerepoV1::AuditConfig::Representation
      
          collection :bindings, as: 'bindings', class: Google::Apis::SourcerepoV1::Binding, decorator: Google::Apis::SourcerepoV1::Binding::Representation
      
          property :etag, :base64 => true, as: 'etag'
          property :version, as: 'version'
        end
      end
      
      class ProjectConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :enable_private_key_check, as: 'enablePrivateKeyCheck'
          property :name, as: 'name'
          hash :pubsub_configs, as: 'pubsubConfigs', class: Google::Apis::SourcerepoV1::PubsubConfig, decorator: Google::Apis::SourcerepoV1::PubsubConfig::Representation
      
        end
      end
      
      class PubsubConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :message_format, as: 'messageFormat'
          property :service_account_email, as: 'serviceAccountEmail'
          property :topic, as: 'topic'
        end
      end
      
      class Repo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :mirror_config, as: 'mirrorConfig', class: Google::Apis::SourcerepoV1::MirrorConfig, decorator: Google::Apis::SourcerepoV1::MirrorConfig::Representation
      
          property :name, as: 'name'
          hash :pubsub_configs, as: 'pubsubConfigs', class: Google::Apis::SourcerepoV1::PubsubConfig, decorator: Google::Apis::SourcerepoV1::PubsubConfig::Representation
      
          property :size, :numeric_string => true, as: 'size'
          property :url, as: 'url'
        end
      end
      
      class SetIamPolicyRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :policy, as: 'policy', class: Google::Apis::SourcerepoV1::Policy, decorator: Google::Apis::SourcerepoV1::Policy::Representation
      
          property :update_mask, as: 'updateMask'
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
      
      class SyncRepoMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :start_time, as: 'startTime'
          property :status_message, as: 'statusMessage'
          property :update_time, as: 'updateTime'
        end
      end
      
      class SyncRepoRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
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
      
      class UpdateProjectConfigRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :project_config, as: 'projectConfig', class: Google::Apis::SourcerepoV1::ProjectConfig, decorator: Google::Apis::SourcerepoV1::ProjectConfig::Representation
      
          property :update_mask, as: 'updateMask'
        end
      end
      
      class UpdateRepoRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :repo, as: 'repo', class: Google::Apis::SourcerepoV1::Repo, decorator: Google::Apis::SourcerepoV1::Repo::Representation
      
          property :update_mask, as: 'updateMask'
        end
      end
    end
  end
end
