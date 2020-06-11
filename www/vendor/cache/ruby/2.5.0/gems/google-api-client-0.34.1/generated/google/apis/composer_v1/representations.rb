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
    module ComposerV1
      
      class Empty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Environment
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EnvironmentConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ImageVersion
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListEnvironmentsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListImageVersionsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListOperationsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NodeConfig
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
      
      class SoftwareConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Status
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Empty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class Environment
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :config, as: 'config', class: Google::Apis::ComposerV1::EnvironmentConfig, decorator: Google::Apis::ComposerV1::EnvironmentConfig::Representation
      
          property :create_time, as: 'createTime'
          hash :labels, as: 'labels'
          property :name, as: 'name'
          property :state, as: 'state'
          property :update_time, as: 'updateTime'
          property :uuid, as: 'uuid'
        end
      end
      
      class EnvironmentConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :airflow_uri, as: 'airflowUri'
          property :dag_gcs_prefix, as: 'dagGcsPrefix'
          property :gke_cluster, as: 'gkeCluster'
          property :node_config, as: 'nodeConfig', class: Google::Apis::ComposerV1::NodeConfig, decorator: Google::Apis::ComposerV1::NodeConfig::Representation
      
          property :node_count, as: 'nodeCount'
          property :software_config, as: 'softwareConfig', class: Google::Apis::ComposerV1::SoftwareConfig, decorator: Google::Apis::ComposerV1::SoftwareConfig::Representation
      
        end
      end
      
      class ImageVersion
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :image_version_id, as: 'imageVersionId'
          property :is_default, as: 'isDefault'
          collection :supported_python_versions, as: 'supportedPythonVersions'
        end
      end
      
      class ListEnvironmentsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :environments, as: 'environments', class: Google::Apis::ComposerV1::Environment, decorator: Google::Apis::ComposerV1::Environment::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListImageVersionsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :image_versions, as: 'imageVersions', class: Google::Apis::ComposerV1::ImageVersion, decorator: Google::Apis::ComposerV1::ImageVersion::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListOperationsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :operations, as: 'operations', class: Google::Apis::ComposerV1::Operation, decorator: Google::Apis::ComposerV1::Operation::Representation
      
        end
      end
      
      class NodeConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :disk_size_gb, as: 'diskSizeGb'
          property :location, as: 'location'
          property :machine_type, as: 'machineType'
          property :network, as: 'network'
          collection :oauth_scopes, as: 'oauthScopes'
          property :service_account, as: 'serviceAccount'
          property :subnetwork, as: 'subnetwork'
          collection :tags, as: 'tags'
        end
      end
      
      class Operation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :done, as: 'done'
          property :error, as: 'error', class: Google::Apis::ComposerV1::Status, decorator: Google::Apis::ComposerV1::Status::Representation
      
          hash :metadata, as: 'metadata'
          property :name, as: 'name'
          hash :response, as: 'response'
        end
      end
      
      class OperationMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_time, as: 'createTime'
          property :end_time, as: 'endTime'
          property :operation_type, as: 'operationType'
          property :resource, as: 'resource'
          property :resource_uuid, as: 'resourceUuid'
          property :state, as: 'state'
        end
      end
      
      class SoftwareConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :airflow_config_overrides, as: 'airflowConfigOverrides'
          hash :env_variables, as: 'envVariables'
          property :image_version, as: 'imageVersion'
          hash :pypi_packages, as: 'pypiPackages'
          property :python_version, as: 'pythonVersion'
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
