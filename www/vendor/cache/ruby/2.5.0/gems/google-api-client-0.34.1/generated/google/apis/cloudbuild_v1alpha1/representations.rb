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
    module CloudbuildV1alpha1
      
      class ArtifactObjects
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ArtifactResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Artifacts
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Build
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuildOperationMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuildOptions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuildStep
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuiltImage
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Empty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FileHashes
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HashProp
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListWorkerPoolsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Network
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RepoSource
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Results
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Secret
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Source
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SourceProvenance
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class StorageSource
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TimeSpan
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Volume
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WorkerConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WorkerPool
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ArtifactObjects
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :location, as: 'location'
          collection :paths, as: 'paths'
          property :timing, as: 'timing', class: Google::Apis::CloudbuildV1alpha1::TimeSpan, decorator: Google::Apis::CloudbuildV1alpha1::TimeSpan::Representation
      
        end
      end
      
      class ArtifactResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :file_hash, as: 'fileHash', class: Google::Apis::CloudbuildV1alpha1::FileHashes, decorator: Google::Apis::CloudbuildV1alpha1::FileHashes::Representation
      
          property :location, as: 'location'
        end
      end
      
      class Artifacts
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :images, as: 'images'
          property :objects, as: 'objects', class: Google::Apis::CloudbuildV1alpha1::ArtifactObjects, decorator: Google::Apis::CloudbuildV1alpha1::ArtifactObjects::Representation
      
        end
      end
      
      class Build
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :artifacts, as: 'artifacts', class: Google::Apis::CloudbuildV1alpha1::Artifacts, decorator: Google::Apis::CloudbuildV1alpha1::Artifacts::Representation
      
          property :build_trigger_id, as: 'buildTriggerId'
          property :create_time, as: 'createTime'
          property :finish_time, as: 'finishTime'
          property :id, as: 'id'
          collection :images, as: 'images'
          property :log_url, as: 'logUrl'
          property :logs_bucket, as: 'logsBucket'
          property :options, as: 'options', class: Google::Apis::CloudbuildV1alpha1::BuildOptions, decorator: Google::Apis::CloudbuildV1alpha1::BuildOptions::Representation
      
          property :project_id, as: 'projectId'
          property :results, as: 'results', class: Google::Apis::CloudbuildV1alpha1::Results, decorator: Google::Apis::CloudbuildV1alpha1::Results::Representation
      
          collection :secrets, as: 'secrets', class: Google::Apis::CloudbuildV1alpha1::Secret, decorator: Google::Apis::CloudbuildV1alpha1::Secret::Representation
      
          property :source, as: 'source', class: Google::Apis::CloudbuildV1alpha1::Source, decorator: Google::Apis::CloudbuildV1alpha1::Source::Representation
      
          property :source_provenance, as: 'sourceProvenance', class: Google::Apis::CloudbuildV1alpha1::SourceProvenance, decorator: Google::Apis::CloudbuildV1alpha1::SourceProvenance::Representation
      
          property :start_time, as: 'startTime'
          property :status, as: 'status'
          property :status_detail, as: 'statusDetail'
          collection :steps, as: 'steps', class: Google::Apis::CloudbuildV1alpha1::BuildStep, decorator: Google::Apis::CloudbuildV1alpha1::BuildStep::Representation
      
          hash :substitutions, as: 'substitutions'
          collection :tags, as: 'tags'
          property :timeout, as: 'timeout'
          hash :timing, as: 'timing', class: Google::Apis::CloudbuildV1alpha1::TimeSpan, decorator: Google::Apis::CloudbuildV1alpha1::TimeSpan::Representation
      
        end
      end
      
      class BuildOperationMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :build, as: 'build', class: Google::Apis::CloudbuildV1alpha1::Build, decorator: Google::Apis::CloudbuildV1alpha1::Build::Representation
      
        end
      end
      
      class BuildOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :disk_size_gb, :numeric_string => true, as: 'diskSizeGb'
          collection :env, as: 'env'
          property :log_streaming_option, as: 'logStreamingOption'
          property :logging, as: 'logging'
          property :machine_type, as: 'machineType'
          property :requested_verify_option, as: 'requestedVerifyOption'
          collection :secret_env, as: 'secretEnv'
          collection :source_provenance_hash, as: 'sourceProvenanceHash'
          property :substitution_option, as: 'substitutionOption'
          collection :volumes, as: 'volumes', class: Google::Apis::CloudbuildV1alpha1::Volume, decorator: Google::Apis::CloudbuildV1alpha1::Volume::Representation
      
          property :worker_pool, as: 'workerPool'
        end
      end
      
      class BuildStep
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :args, as: 'args'
          property :dir, as: 'dir'
          property :entrypoint, as: 'entrypoint'
          collection :env, as: 'env'
          property :id, as: 'id'
          property :name, as: 'name'
          property :pull_timing, as: 'pullTiming', class: Google::Apis::CloudbuildV1alpha1::TimeSpan, decorator: Google::Apis::CloudbuildV1alpha1::TimeSpan::Representation
      
          collection :secret_env, as: 'secretEnv'
          property :status, as: 'status'
          property :timeout, as: 'timeout'
          property :timing, as: 'timing', class: Google::Apis::CloudbuildV1alpha1::TimeSpan, decorator: Google::Apis::CloudbuildV1alpha1::TimeSpan::Representation
      
          collection :volumes, as: 'volumes', class: Google::Apis::CloudbuildV1alpha1::Volume, decorator: Google::Apis::CloudbuildV1alpha1::Volume::Representation
      
          collection :wait_for, as: 'waitFor'
        end
      end
      
      class BuiltImage
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :digest, as: 'digest'
          property :name, as: 'name'
          property :push_timing, as: 'pushTiming', class: Google::Apis::CloudbuildV1alpha1::TimeSpan, decorator: Google::Apis::CloudbuildV1alpha1::TimeSpan::Representation
      
        end
      end
      
      class Empty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class FileHashes
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :file_hash, as: 'fileHash', class: Google::Apis::CloudbuildV1alpha1::HashProp, decorator: Google::Apis::CloudbuildV1alpha1::HashProp::Representation
      
        end
      end
      
      class HashProp
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :type, as: 'type'
          property :value, :base64 => true, as: 'value'
        end
      end
      
      class ListWorkerPoolsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :worker_pools, as: 'workerPools', class: Google::Apis::CloudbuildV1alpha1::WorkerPool, decorator: Google::Apis::CloudbuildV1alpha1::WorkerPool::Representation
      
        end
      end
      
      class Network
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :network, as: 'network'
          property :project_id, as: 'projectId'
          property :subnetwork, as: 'subnetwork'
        end
      end
      
      class RepoSource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :branch_name, as: 'branchName'
          property :commit_sha, as: 'commitSha'
          property :dir, as: 'dir'
          property :project_id, as: 'projectId'
          property :repo_name, as: 'repoName'
          property :tag_name, as: 'tagName'
        end
      end
      
      class Results
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :artifact_manifest, as: 'artifactManifest'
          property :artifact_timing, as: 'artifactTiming', class: Google::Apis::CloudbuildV1alpha1::TimeSpan, decorator: Google::Apis::CloudbuildV1alpha1::TimeSpan::Representation
      
          collection :build_step_images, as: 'buildStepImages'
          collection :build_step_outputs, as: 'buildStepOutputs'
          collection :images, as: 'images', class: Google::Apis::CloudbuildV1alpha1::BuiltImage, decorator: Google::Apis::CloudbuildV1alpha1::BuiltImage::Representation
      
          property :num_artifacts, :numeric_string => true, as: 'numArtifacts'
        end
      end
      
      class Secret
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kms_key_name, as: 'kmsKeyName'
          hash :secret_env, as: 'secretEnv'
        end
      end
      
      class Source
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :repo_source, as: 'repoSource', class: Google::Apis::CloudbuildV1alpha1::RepoSource, decorator: Google::Apis::CloudbuildV1alpha1::RepoSource::Representation
      
          property :storage_source, as: 'storageSource', class: Google::Apis::CloudbuildV1alpha1::StorageSource, decorator: Google::Apis::CloudbuildV1alpha1::StorageSource::Representation
      
        end
      end
      
      class SourceProvenance
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :file_hashes, as: 'fileHashes', class: Google::Apis::CloudbuildV1alpha1::FileHashes, decorator: Google::Apis::CloudbuildV1alpha1::FileHashes::Representation
      
          property :resolved_repo_source, as: 'resolvedRepoSource', class: Google::Apis::CloudbuildV1alpha1::RepoSource, decorator: Google::Apis::CloudbuildV1alpha1::RepoSource::Representation
      
          property :resolved_storage_source, as: 'resolvedStorageSource', class: Google::Apis::CloudbuildV1alpha1::StorageSource, decorator: Google::Apis::CloudbuildV1alpha1::StorageSource::Representation
      
        end
      end
      
      class StorageSource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bucket, as: 'bucket'
          property :generation, :numeric_string => true, as: 'generation'
          property :object, as: 'object'
        end
      end
      
      class TimeSpan
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :end_time, as: 'endTime'
          property :start_time, as: 'startTime'
        end
      end
      
      class Volume
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :path, as: 'path'
        end
      end
      
      class WorkerConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :disk_size_gb, :numeric_string => true, as: 'diskSizeGb'
          property :machine_type, as: 'machineType'
          property :network, as: 'network', class: Google::Apis::CloudbuildV1alpha1::Network, decorator: Google::Apis::CloudbuildV1alpha1::Network::Representation
      
          property :tag, as: 'tag'
        end
      end
      
      class WorkerPool
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_time, as: 'createTime'
          property :delete_time, as: 'deleteTime'
          property :name, as: 'name'
          property :project_id, as: 'projectId'
          collection :regions, as: 'regions'
          property :service_account_email, as: 'serviceAccountEmail'
          property :status, as: 'status'
          property :update_time, as: 'updateTime'
          property :worker_config, as: 'workerConfig', class: Google::Apis::CloudbuildV1alpha1::WorkerConfig, decorator: Google::Apis::CloudbuildV1alpha1::WorkerConfig::Representation
      
          property :worker_count, :numeric_string => true, as: 'workerCount'
        end
      end
    end
  end
end
