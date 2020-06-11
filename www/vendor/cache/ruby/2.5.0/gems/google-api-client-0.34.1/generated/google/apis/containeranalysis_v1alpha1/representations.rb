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
    module ContaineranalysisV1alpha1
      
      class Artifact
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Attestation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AttestationAuthority
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AttestationAuthorityHint
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Basis
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Binding
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuildDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuildProvenance
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuildSignature
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuildType
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Command
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateOperationRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Deployable
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Deployment
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Derived
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Detail
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Discovered
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Discovery
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Distribution
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
      
      class FileHashes
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Fingerprint
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
      
      class GetVulnzOccurrencesSummaryResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDevtoolsContaineranalysisV1alpha1AliasContext
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDevtoolsContaineranalysisV1alpha1CloudRepoSourceContext
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDevtoolsContaineranalysisV1alpha1GerritSourceContext
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDevtoolsContaineranalysisV1alpha1GitSourceContext
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDevtoolsContaineranalysisV1alpha1OperationMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDevtoolsContaineranalysisV1alpha1ProjectRepoId
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDevtoolsContaineranalysisV1alpha1RepoId
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDevtoolsContaineranalysisV1alpha1SourceContext
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HashProp
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Installation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Layer
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListNoteOccurrencesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListNotesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListOccurrencesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListScanConfigsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Location
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Note
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Occurrence
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Operation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Package
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PackageIssue
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PgpSignedAttestation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Policy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RelatedUrl
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RepoSource
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Resource
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ScanConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SetIamPolicyRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SeverityCount
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
      
      class StorageSource
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
      
      class UpdateOperationRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UpgradeDistribution
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UpgradeNote
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UpgradeOccurrence
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Version
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VulnerabilityDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VulnerabilityLocation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VulnerabilityType
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Artifact
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :checksum, as: 'checksum'
          property :id, as: 'id'
          property :name, as: 'name'
          collection :names, as: 'names'
        end
      end
      
      class Attestation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :pgp_signed_attestation, as: 'pgpSignedAttestation', class: Google::Apis::ContaineranalysisV1alpha1::PgpSignedAttestation, decorator: Google::Apis::ContaineranalysisV1alpha1::PgpSignedAttestation::Representation
      
        end
      end
      
      class AttestationAuthority
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :hint, as: 'hint', class: Google::Apis::ContaineranalysisV1alpha1::AttestationAuthorityHint, decorator: Google::Apis::ContaineranalysisV1alpha1::AttestationAuthorityHint::Representation
      
        end
      end
      
      class AttestationAuthorityHint
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :human_readable_name, as: 'humanReadableName'
        end
      end
      
      class Basis
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :fingerprint, as: 'fingerprint', class: Google::Apis::ContaineranalysisV1alpha1::Fingerprint, decorator: Google::Apis::ContaineranalysisV1alpha1::Fingerprint::Representation
      
          property :resource_url, as: 'resourceUrl'
        end
      end
      
      class Binding
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :condition, as: 'condition', class: Google::Apis::ContaineranalysisV1alpha1::Expr, decorator: Google::Apis::ContaineranalysisV1alpha1::Expr::Representation
      
          collection :members, as: 'members'
          property :role, as: 'role'
        end
      end
      
      class BuildDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :provenance, as: 'provenance', class: Google::Apis::ContaineranalysisV1alpha1::BuildProvenance, decorator: Google::Apis::ContaineranalysisV1alpha1::BuildProvenance::Representation
      
          property :provenance_bytes, as: 'provenanceBytes'
        end
      end
      
      class BuildProvenance
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :build_options, as: 'buildOptions'
          property :builder_version, as: 'builderVersion'
          collection :built_artifacts, as: 'builtArtifacts', class: Google::Apis::ContaineranalysisV1alpha1::Artifact, decorator: Google::Apis::ContaineranalysisV1alpha1::Artifact::Representation
      
          collection :commands, as: 'commands', class: Google::Apis::ContaineranalysisV1alpha1::Command, decorator: Google::Apis::ContaineranalysisV1alpha1::Command::Representation
      
          property :create_time, as: 'createTime'
          property :creator, as: 'creator'
          property :finish_time, as: 'finishTime'
          property :id, as: 'id'
          property :logs_bucket, as: 'logsBucket'
          property :project_id, as: 'projectId'
          property :source_provenance, as: 'sourceProvenance', class: Google::Apis::ContaineranalysisV1alpha1::Source, decorator: Google::Apis::ContaineranalysisV1alpha1::Source::Representation
      
          property :start_time, as: 'startTime'
          property :trigger_id, as: 'triggerId'
        end
      end
      
      class BuildSignature
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :key_id, as: 'keyId'
          property :key_type, as: 'keyType'
          property :public_key, as: 'publicKey'
          property :signature, as: 'signature'
        end
      end
      
      class BuildType
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :builder_version, as: 'builderVersion'
          property :signature, as: 'signature', class: Google::Apis::ContaineranalysisV1alpha1::BuildSignature, decorator: Google::Apis::ContaineranalysisV1alpha1::BuildSignature::Representation
      
        end
      end
      
      class Command
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :args, as: 'args'
          property :dir, as: 'dir'
          collection :env, as: 'env'
          property :id, as: 'id'
          property :name, as: 'name'
          collection :wait_for, as: 'waitFor'
        end
      end
      
      class CreateOperationRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :operation, as: 'operation', class: Google::Apis::ContaineranalysisV1alpha1::Operation, decorator: Google::Apis::ContaineranalysisV1alpha1::Operation::Representation
      
          property :operation_id, as: 'operationId'
        end
      end
      
      class Deployable
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :resource_uri, as: 'resourceUri'
        end
      end
      
      class Deployment
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :address, as: 'address'
          property :config, as: 'config'
          property :deploy_time, as: 'deployTime'
          property :platform, as: 'platform'
          collection :resource_uri, as: 'resourceUri'
          property :undeploy_time, as: 'undeployTime'
          property :user_email, as: 'userEmail'
        end
      end
      
      class Derived
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :base_resource_url, as: 'baseResourceUrl'
          property :distance, as: 'distance'
          property :fingerprint, as: 'fingerprint', class: Google::Apis::ContaineranalysisV1alpha1::Fingerprint, decorator: Google::Apis::ContaineranalysisV1alpha1::Fingerprint::Representation
      
          collection :layer_info, as: 'layerInfo', class: Google::Apis::ContaineranalysisV1alpha1::Layer, decorator: Google::Apis::ContaineranalysisV1alpha1::Layer::Representation
      
        end
      end
      
      class Detail
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cpe_uri, as: 'cpeUri'
          property :description, as: 'description'
          property :fixed_location, as: 'fixedLocation', class: Google::Apis::ContaineranalysisV1alpha1::VulnerabilityLocation, decorator: Google::Apis::ContaineranalysisV1alpha1::VulnerabilityLocation::Representation
      
          property :is_obsolete, as: 'isObsolete'
          property :max_affected_version, as: 'maxAffectedVersion', class: Google::Apis::ContaineranalysisV1alpha1::Version, decorator: Google::Apis::ContaineranalysisV1alpha1::Version::Representation
      
          property :min_affected_version, as: 'minAffectedVersion', class: Google::Apis::ContaineranalysisV1alpha1::Version, decorator: Google::Apis::ContaineranalysisV1alpha1::Version::Representation
      
          property :package, as: 'package'
          property :package_type, as: 'packageType'
          property :severity_name, as: 'severityName'
        end
      end
      
      class Discovered
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :analysis_status, as: 'analysisStatus'
          property :analysis_status_error, as: 'analysisStatusError', class: Google::Apis::ContaineranalysisV1alpha1::Status, decorator: Google::Apis::ContaineranalysisV1alpha1::Status::Representation
      
          property :continuous_analysis, as: 'continuousAnalysis'
          property :cpe, as: 'cpe'
          property :operation, as: 'operation', class: Google::Apis::ContaineranalysisV1alpha1::Operation, decorator: Google::Apis::ContaineranalysisV1alpha1::Operation::Representation
      
        end
      end
      
      class Discovery
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :analysis_kind, as: 'analysisKind'
        end
      end
      
      class Distribution
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :architecture, as: 'architecture'
          property :cpe_uri, as: 'cpeUri'
          property :description, as: 'description'
          property :latest_version, as: 'latestVersion', class: Google::Apis::ContaineranalysisV1alpha1::Version, decorator: Google::Apis::ContaineranalysisV1alpha1::Version::Representation
      
          property :maintainer, as: 'maintainer'
          property :url, as: 'url'
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
      
      class FileHashes
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :file_hash, as: 'fileHash', class: Google::Apis::ContaineranalysisV1alpha1::HashProp, decorator: Google::Apis::ContaineranalysisV1alpha1::HashProp::Representation
      
        end
      end
      
      class Fingerprint
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :v1_name, as: 'v1Name'
          collection :v2_blob, as: 'v2Blob'
          property :v2_name, as: 'v2Name'
        end
      end
      
      class GetIamPolicyRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :options, as: 'options', class: Google::Apis::ContaineranalysisV1alpha1::GetPolicyOptions, decorator: Google::Apis::ContaineranalysisV1alpha1::GetPolicyOptions::Representation
      
        end
      end
      
      class GetPolicyOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :requested_policy_version, as: 'requestedPolicyVersion'
        end
      end
      
      class GetVulnzOccurrencesSummaryResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :counts, as: 'counts', class: Google::Apis::ContaineranalysisV1alpha1::SeverityCount, decorator: Google::Apis::ContaineranalysisV1alpha1::SeverityCount::Representation
      
        end
      end
      
      class GoogleDevtoolsContaineranalysisV1alpha1AliasContext
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :name, as: 'name'
        end
      end
      
      class GoogleDevtoolsContaineranalysisV1alpha1CloudRepoSourceContext
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :alias_context, as: 'aliasContext', class: Google::Apis::ContaineranalysisV1alpha1::GoogleDevtoolsContaineranalysisV1alpha1AliasContext, decorator: Google::Apis::ContaineranalysisV1alpha1::GoogleDevtoolsContaineranalysisV1alpha1AliasContext::Representation
      
          property :repo_id, as: 'repoId', class: Google::Apis::ContaineranalysisV1alpha1::GoogleDevtoolsContaineranalysisV1alpha1RepoId, decorator: Google::Apis::ContaineranalysisV1alpha1::GoogleDevtoolsContaineranalysisV1alpha1RepoId::Representation
      
          property :revision_id, as: 'revisionId'
        end
      end
      
      class GoogleDevtoolsContaineranalysisV1alpha1GerritSourceContext
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :alias_context, as: 'aliasContext', class: Google::Apis::ContaineranalysisV1alpha1::GoogleDevtoolsContaineranalysisV1alpha1AliasContext, decorator: Google::Apis::ContaineranalysisV1alpha1::GoogleDevtoolsContaineranalysisV1alpha1AliasContext::Representation
      
          property :gerrit_project, as: 'gerritProject'
          property :host_uri, as: 'hostUri'
          property :revision_id, as: 'revisionId'
        end
      end
      
      class GoogleDevtoolsContaineranalysisV1alpha1GitSourceContext
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :revision_id, as: 'revisionId'
          property :url, as: 'url'
        end
      end
      
      class GoogleDevtoolsContaineranalysisV1alpha1OperationMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_time, as: 'createTime'
          property :end_time, as: 'endTime'
        end
      end
      
      class GoogleDevtoolsContaineranalysisV1alpha1ProjectRepoId
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :project_id, as: 'projectId'
          property :repo_name, as: 'repoName'
        end
      end
      
      class GoogleDevtoolsContaineranalysisV1alpha1RepoId
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :project_repo_id, as: 'projectRepoId', class: Google::Apis::ContaineranalysisV1alpha1::GoogleDevtoolsContaineranalysisV1alpha1ProjectRepoId, decorator: Google::Apis::ContaineranalysisV1alpha1::GoogleDevtoolsContaineranalysisV1alpha1ProjectRepoId::Representation
      
          property :uid, as: 'uid'
        end
      end
      
      class GoogleDevtoolsContaineranalysisV1alpha1SourceContext
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cloud_repo, as: 'cloudRepo', class: Google::Apis::ContaineranalysisV1alpha1::GoogleDevtoolsContaineranalysisV1alpha1CloudRepoSourceContext, decorator: Google::Apis::ContaineranalysisV1alpha1::GoogleDevtoolsContaineranalysisV1alpha1CloudRepoSourceContext::Representation
      
          property :gerrit, as: 'gerrit', class: Google::Apis::ContaineranalysisV1alpha1::GoogleDevtoolsContaineranalysisV1alpha1GerritSourceContext, decorator: Google::Apis::ContaineranalysisV1alpha1::GoogleDevtoolsContaineranalysisV1alpha1GerritSourceContext::Representation
      
          property :git, as: 'git', class: Google::Apis::ContaineranalysisV1alpha1::GoogleDevtoolsContaineranalysisV1alpha1GitSourceContext, decorator: Google::Apis::ContaineranalysisV1alpha1::GoogleDevtoolsContaineranalysisV1alpha1GitSourceContext::Representation
      
          hash :labels, as: 'labels'
        end
      end
      
      class HashProp
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :type, as: 'type'
          property :value, :base64 => true, as: 'value'
        end
      end
      
      class Installation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :location, as: 'location', class: Google::Apis::ContaineranalysisV1alpha1::Location, decorator: Google::Apis::ContaineranalysisV1alpha1::Location::Representation
      
          property :name, as: 'name'
        end
      end
      
      class Layer
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :arguments, as: 'arguments'
          property :directive, as: 'directive'
        end
      end
      
      class ListNoteOccurrencesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :occurrences, as: 'occurrences', class: Google::Apis::ContaineranalysisV1alpha1::Occurrence, decorator: Google::Apis::ContaineranalysisV1alpha1::Occurrence::Representation
      
        end
      end
      
      class ListNotesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :notes, as: 'notes', class: Google::Apis::ContaineranalysisV1alpha1::Note, decorator: Google::Apis::ContaineranalysisV1alpha1::Note::Representation
      
        end
      end
      
      class ListOccurrencesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :occurrences, as: 'occurrences', class: Google::Apis::ContaineranalysisV1alpha1::Occurrence, decorator: Google::Apis::ContaineranalysisV1alpha1::Occurrence::Representation
      
        end
      end
      
      class ListScanConfigsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :scan_configs, as: 'scanConfigs', class: Google::Apis::ContaineranalysisV1alpha1::ScanConfig, decorator: Google::Apis::ContaineranalysisV1alpha1::ScanConfig::Representation
      
        end
      end
      
      class Location
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cpe_uri, as: 'cpeUri'
          property :path, as: 'path'
          property :version, as: 'version', class: Google::Apis::ContaineranalysisV1alpha1::Version, decorator: Google::Apis::ContaineranalysisV1alpha1::Version::Representation
      
        end
      end
      
      class Note
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :attestation_authority, as: 'attestationAuthority', class: Google::Apis::ContaineranalysisV1alpha1::AttestationAuthority, decorator: Google::Apis::ContaineranalysisV1alpha1::AttestationAuthority::Representation
      
          property :base_image, as: 'baseImage', class: Google::Apis::ContaineranalysisV1alpha1::Basis, decorator: Google::Apis::ContaineranalysisV1alpha1::Basis::Representation
      
          property :build_type, as: 'buildType', class: Google::Apis::ContaineranalysisV1alpha1::BuildType, decorator: Google::Apis::ContaineranalysisV1alpha1::BuildType::Representation
      
          property :create_time, as: 'createTime'
          property :deployable, as: 'deployable', class: Google::Apis::ContaineranalysisV1alpha1::Deployable, decorator: Google::Apis::ContaineranalysisV1alpha1::Deployable::Representation
      
          property :discovery, as: 'discovery', class: Google::Apis::ContaineranalysisV1alpha1::Discovery, decorator: Google::Apis::ContaineranalysisV1alpha1::Discovery::Representation
      
          property :expiration_time, as: 'expirationTime'
          property :kind, as: 'kind'
          property :long_description, as: 'longDescription'
          property :name, as: 'name'
          property :package, as: 'package', class: Google::Apis::ContaineranalysisV1alpha1::Package, decorator: Google::Apis::ContaineranalysisV1alpha1::Package::Representation
      
          collection :related_url, as: 'relatedUrl', class: Google::Apis::ContaineranalysisV1alpha1::RelatedUrl, decorator: Google::Apis::ContaineranalysisV1alpha1::RelatedUrl::Representation
      
          property :short_description, as: 'shortDescription'
          property :update_time, as: 'updateTime'
          property :upgrade, as: 'upgrade', class: Google::Apis::ContaineranalysisV1alpha1::UpgradeNote, decorator: Google::Apis::ContaineranalysisV1alpha1::UpgradeNote::Representation
      
          property :vulnerability_type, as: 'vulnerabilityType', class: Google::Apis::ContaineranalysisV1alpha1::VulnerabilityType, decorator: Google::Apis::ContaineranalysisV1alpha1::VulnerabilityType::Representation
      
        end
      end
      
      class Occurrence
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :attestation, as: 'attestation', class: Google::Apis::ContaineranalysisV1alpha1::Attestation, decorator: Google::Apis::ContaineranalysisV1alpha1::Attestation::Representation
      
          property :build_details, as: 'buildDetails', class: Google::Apis::ContaineranalysisV1alpha1::BuildDetails, decorator: Google::Apis::ContaineranalysisV1alpha1::BuildDetails::Representation
      
          property :create_time, as: 'createTime'
          property :deployment, as: 'deployment', class: Google::Apis::ContaineranalysisV1alpha1::Deployment, decorator: Google::Apis::ContaineranalysisV1alpha1::Deployment::Representation
      
          property :derived_image, as: 'derivedImage', class: Google::Apis::ContaineranalysisV1alpha1::Derived, decorator: Google::Apis::ContaineranalysisV1alpha1::Derived::Representation
      
          property :discovered, as: 'discovered', class: Google::Apis::ContaineranalysisV1alpha1::Discovered, decorator: Google::Apis::ContaineranalysisV1alpha1::Discovered::Representation
      
          property :installation, as: 'installation', class: Google::Apis::ContaineranalysisV1alpha1::Installation, decorator: Google::Apis::ContaineranalysisV1alpha1::Installation::Representation
      
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :note_name, as: 'noteName'
          property :remediation, as: 'remediation'
          property :resource, as: 'resource', class: Google::Apis::ContaineranalysisV1alpha1::Resource, decorator: Google::Apis::ContaineranalysisV1alpha1::Resource::Representation
      
          property :resource_url, as: 'resourceUrl'
          property :update_time, as: 'updateTime'
          property :upgrade, as: 'upgrade', class: Google::Apis::ContaineranalysisV1alpha1::UpgradeOccurrence, decorator: Google::Apis::ContaineranalysisV1alpha1::UpgradeOccurrence::Representation
      
          property :vulnerability_details, as: 'vulnerabilityDetails', class: Google::Apis::ContaineranalysisV1alpha1::VulnerabilityDetails, decorator: Google::Apis::ContaineranalysisV1alpha1::VulnerabilityDetails::Representation
      
        end
      end
      
      class Operation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :done, as: 'done'
          property :error, as: 'error', class: Google::Apis::ContaineranalysisV1alpha1::Status, decorator: Google::Apis::ContaineranalysisV1alpha1::Status::Representation
      
          hash :metadata, as: 'metadata'
          property :name, as: 'name'
          hash :response, as: 'response'
        end
      end
      
      class Package
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :distribution, as: 'distribution', class: Google::Apis::ContaineranalysisV1alpha1::Distribution, decorator: Google::Apis::ContaineranalysisV1alpha1::Distribution::Representation
      
          property :name, as: 'name'
        end
      end
      
      class PackageIssue
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :affected_location, as: 'affectedLocation', class: Google::Apis::ContaineranalysisV1alpha1::VulnerabilityLocation, decorator: Google::Apis::ContaineranalysisV1alpha1::VulnerabilityLocation::Representation
      
          property :fixed_location, as: 'fixedLocation', class: Google::Apis::ContaineranalysisV1alpha1::VulnerabilityLocation, decorator: Google::Apis::ContaineranalysisV1alpha1::VulnerabilityLocation::Representation
      
          property :severity_name, as: 'severityName'
        end
      end
      
      class PgpSignedAttestation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :content_type, as: 'contentType'
          property :pgp_key_id, as: 'pgpKeyId'
          property :signature, as: 'signature'
        end
      end
      
      class Policy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :bindings, as: 'bindings', class: Google::Apis::ContaineranalysisV1alpha1::Binding, decorator: Google::Apis::ContaineranalysisV1alpha1::Binding::Representation
      
          property :etag, :base64 => true, as: 'etag'
          property :version, as: 'version'
        end
      end
      
      class RelatedUrl
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :label, as: 'label'
          property :url, as: 'url'
        end
      end
      
      class RepoSource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :branch_name, as: 'branchName'
          property :commit_sha, as: 'commitSha'
          property :project_id, as: 'projectId'
          property :repo_name, as: 'repoName'
          property :tag_name, as: 'tagName'
        end
      end
      
      class Resource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :content_hash, as: 'contentHash', class: Google::Apis::ContaineranalysisV1alpha1::HashProp, decorator: Google::Apis::ContaineranalysisV1alpha1::HashProp::Representation
      
          property :name, as: 'name'
          property :uri, as: 'uri'
        end
      end
      
      class ScanConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_time, as: 'createTime'
          property :description, as: 'description'
          property :enabled, as: 'enabled'
          property :name, as: 'name'
          property :update_time, as: 'updateTime'
        end
      end
      
      class SetIamPolicyRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :policy, as: 'policy', class: Google::Apis::ContaineranalysisV1alpha1::Policy, decorator: Google::Apis::ContaineranalysisV1alpha1::Policy::Representation
      
        end
      end
      
      class SeverityCount
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :count, :numeric_string => true, as: 'count'
          property :severity, as: 'severity'
        end
      end
      
      class Source
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :additional_contexts, as: 'additionalContexts', class: Google::Apis::ContaineranalysisV1alpha1::GoogleDevtoolsContaineranalysisV1alpha1SourceContext, decorator: Google::Apis::ContaineranalysisV1alpha1::GoogleDevtoolsContaineranalysisV1alpha1SourceContext::Representation
      
          property :artifact_storage_source, as: 'artifactStorageSource', class: Google::Apis::ContaineranalysisV1alpha1::StorageSource, decorator: Google::Apis::ContaineranalysisV1alpha1::StorageSource::Representation
      
          property :context, as: 'context', class: Google::Apis::ContaineranalysisV1alpha1::GoogleDevtoolsContaineranalysisV1alpha1SourceContext, decorator: Google::Apis::ContaineranalysisV1alpha1::GoogleDevtoolsContaineranalysisV1alpha1SourceContext::Representation
      
          hash :file_hashes, as: 'fileHashes', class: Google::Apis::ContaineranalysisV1alpha1::FileHashes, decorator: Google::Apis::ContaineranalysisV1alpha1::FileHashes::Representation
      
          property :repo_source, as: 'repoSource', class: Google::Apis::ContaineranalysisV1alpha1::RepoSource, decorator: Google::Apis::ContaineranalysisV1alpha1::RepoSource::Representation
      
          property :storage_source, as: 'storageSource', class: Google::Apis::ContaineranalysisV1alpha1::StorageSource, decorator: Google::Apis::ContaineranalysisV1alpha1::StorageSource::Representation
      
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
      
      class StorageSource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bucket, as: 'bucket'
          property :generation, :numeric_string => true, as: 'generation'
          property :object, as: 'object'
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
      
      class UpdateOperationRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :operation, as: 'operation', class: Google::Apis::ContaineranalysisV1alpha1::Operation, decorator: Google::Apis::ContaineranalysisV1alpha1::Operation::Representation
      
          property :update_mask, as: 'updateMask'
        end
      end
      
      class UpgradeDistribution
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :classification, as: 'classification'
          property :cpe_uri, as: 'cpeUri'
          collection :cve, as: 'cve'
          property :severity, as: 'severity'
        end
      end
      
      class UpgradeNote
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :distributions, as: 'distributions', class: Google::Apis::ContaineranalysisV1alpha1::UpgradeDistribution, decorator: Google::Apis::ContaineranalysisV1alpha1::UpgradeDistribution::Representation
      
          property :package, as: 'package'
          property :version, as: 'version', class: Google::Apis::ContaineranalysisV1alpha1::Version, decorator: Google::Apis::ContaineranalysisV1alpha1::Version::Representation
      
        end
      end
      
      class UpgradeOccurrence
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :distribution, as: 'distribution', class: Google::Apis::ContaineranalysisV1alpha1::UpgradeDistribution, decorator: Google::Apis::ContaineranalysisV1alpha1::UpgradeDistribution::Representation
      
          property :package, as: 'package'
          property :parsed_version, as: 'parsedVersion', class: Google::Apis::ContaineranalysisV1alpha1::Version, decorator: Google::Apis::ContaineranalysisV1alpha1::Version::Representation
      
        end
      end
      
      class Version
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :epoch, as: 'epoch'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :revision, as: 'revision'
        end
      end
      
      class VulnerabilityDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cvss_score, as: 'cvssScore'
          property :effective_severity, as: 'effectiveSeverity'
          collection :package_issue, as: 'packageIssue', class: Google::Apis::ContaineranalysisV1alpha1::PackageIssue, decorator: Google::Apis::ContaineranalysisV1alpha1::PackageIssue::Representation
      
          property :severity, as: 'severity'
          property :type, as: 'type'
        end
      end
      
      class VulnerabilityLocation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cpe_uri, as: 'cpeUri'
          property :package, as: 'package'
          property :version, as: 'version', class: Google::Apis::ContaineranalysisV1alpha1::Version, decorator: Google::Apis::ContaineranalysisV1alpha1::Version::Representation
      
        end
      end
      
      class VulnerabilityType
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cvss_score, as: 'cvssScore'
          collection :details, as: 'details', class: Google::Apis::ContaineranalysisV1alpha1::Detail, decorator: Google::Apis::ContaineranalysisV1alpha1::Detail::Representation
      
          property :severity, as: 'severity'
        end
      end
    end
  end
end
