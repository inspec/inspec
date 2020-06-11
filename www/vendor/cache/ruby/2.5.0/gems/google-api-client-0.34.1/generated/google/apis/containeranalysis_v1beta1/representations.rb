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
    module ContaineranalysisV1beta1
      
      class AliasContext
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Artifact
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Attestation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Authority
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Basis
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BatchCreateNotesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BatchCreateNotesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BatchCreateOccurrencesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BatchCreateOccurrencesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Binding
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Build
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
      
      class CvsSv3
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CloudRepoSourceContext
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Command
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
      
      class Details
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
      
      class FixableTotalByDigest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GenericSignedAttestation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GerritSourceContext
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
      
      class GitSourceContext
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDevtoolsContaineranalysisV1alpha1OperationMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GrafeasV1beta1BuildDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GrafeasV1beta1DeploymentDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GrafeasV1beta1DiscoveryDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GrafeasV1beta1ImageDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GrafeasV1beta1PackageDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GrafeasV1beta1VulnerabilityDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HashProp
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Hint
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Installation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class KnowledgeBase
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
      
      class ProjectRepoId
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RelatedUrl
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RepoId
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
      
      class Signature
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Source
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SourceContext
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Status
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
      
      class Version
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Vulnerability
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VulnerabilityLocation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VulnerabilityOccurrencesSummary
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WindowsDetail
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AliasContext
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :name, as: 'name'
        end
      end
      
      class Artifact
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :checksum, as: 'checksum'
          property :id, as: 'id'
          collection :names, as: 'names'
        end
      end
      
      class Attestation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :generic_signed_attestation, as: 'genericSignedAttestation', class: Google::Apis::ContaineranalysisV1beta1::GenericSignedAttestation, decorator: Google::Apis::ContaineranalysisV1beta1::GenericSignedAttestation::Representation
      
          property :pgp_signed_attestation, as: 'pgpSignedAttestation', class: Google::Apis::ContaineranalysisV1beta1::PgpSignedAttestation, decorator: Google::Apis::ContaineranalysisV1beta1::PgpSignedAttestation::Representation
      
        end
      end
      
      class Authority
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :hint, as: 'hint', class: Google::Apis::ContaineranalysisV1beta1::Hint, decorator: Google::Apis::ContaineranalysisV1beta1::Hint::Representation
      
        end
      end
      
      class Basis
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :fingerprint, as: 'fingerprint', class: Google::Apis::ContaineranalysisV1beta1::Fingerprint, decorator: Google::Apis::ContaineranalysisV1beta1::Fingerprint::Representation
      
          property :resource_url, as: 'resourceUrl'
        end
      end
      
      class BatchCreateNotesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :notes, as: 'notes', class: Google::Apis::ContaineranalysisV1beta1::Note, decorator: Google::Apis::ContaineranalysisV1beta1::Note::Representation
      
        end
      end
      
      class BatchCreateNotesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :notes, as: 'notes', class: Google::Apis::ContaineranalysisV1beta1::Note, decorator: Google::Apis::ContaineranalysisV1beta1::Note::Representation
      
        end
      end
      
      class BatchCreateOccurrencesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :occurrences, as: 'occurrences', class: Google::Apis::ContaineranalysisV1beta1::Occurrence, decorator: Google::Apis::ContaineranalysisV1beta1::Occurrence::Representation
      
        end
      end
      
      class BatchCreateOccurrencesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :occurrences, as: 'occurrences', class: Google::Apis::ContaineranalysisV1beta1::Occurrence, decorator: Google::Apis::ContaineranalysisV1beta1::Occurrence::Representation
      
        end
      end
      
      class Binding
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :condition, as: 'condition', class: Google::Apis::ContaineranalysisV1beta1::Expr, decorator: Google::Apis::ContaineranalysisV1beta1::Expr::Representation
      
          collection :members, as: 'members'
          property :role, as: 'role'
        end
      end
      
      class Build
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :builder_version, as: 'builderVersion'
          property :signature, as: 'signature', class: Google::Apis::ContaineranalysisV1beta1::BuildSignature, decorator: Google::Apis::ContaineranalysisV1beta1::BuildSignature::Representation
      
        end
      end
      
      class BuildProvenance
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :build_options, as: 'buildOptions'
          property :builder_version, as: 'builderVersion'
          collection :built_artifacts, as: 'builtArtifacts', class: Google::Apis::ContaineranalysisV1beta1::Artifact, decorator: Google::Apis::ContaineranalysisV1beta1::Artifact::Representation
      
          collection :commands, as: 'commands', class: Google::Apis::ContaineranalysisV1beta1::Command, decorator: Google::Apis::ContaineranalysisV1beta1::Command::Representation
      
          property :create_time, as: 'createTime'
          property :creator, as: 'creator'
          property :end_time, as: 'endTime'
          property :id, as: 'id'
          property :logs_uri, as: 'logsUri'
          property :project_id, as: 'projectId'
          property :source_provenance, as: 'sourceProvenance', class: Google::Apis::ContaineranalysisV1beta1::Source, decorator: Google::Apis::ContaineranalysisV1beta1::Source::Representation
      
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
          property :signature, :base64 => true, as: 'signature'
        end
      end
      
      class CvsSv3
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :attack_complexity, as: 'attackComplexity'
          property :attack_vector, as: 'attackVector'
          property :availability_impact, as: 'availabilityImpact'
          property :base_score, as: 'baseScore'
          property :confidentiality_impact, as: 'confidentialityImpact'
          property :exploitability_score, as: 'exploitabilityScore'
          property :impact_score, as: 'impactScore'
          property :integrity_impact, as: 'integrityImpact'
          property :privileges_required, as: 'privilegesRequired'
          property :scope, as: 'scope'
          property :user_interaction, as: 'userInteraction'
        end
      end
      
      class CloudRepoSourceContext
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :alias_context, as: 'aliasContext', class: Google::Apis::ContaineranalysisV1beta1::AliasContext, decorator: Google::Apis::ContaineranalysisV1beta1::AliasContext::Representation
      
          property :repo_id, as: 'repoId', class: Google::Apis::ContaineranalysisV1beta1::RepoId, decorator: Google::Apis::ContaineranalysisV1beta1::RepoId::Representation
      
          property :revision_id, as: 'revisionId'
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
          property :fingerprint, as: 'fingerprint', class: Google::Apis::ContaineranalysisV1beta1::Fingerprint, decorator: Google::Apis::ContaineranalysisV1beta1::Fingerprint::Representation
      
          collection :layer_info, as: 'layerInfo', class: Google::Apis::ContaineranalysisV1beta1::Layer, decorator: Google::Apis::ContaineranalysisV1beta1::Layer::Representation
      
        end
      end
      
      class Detail
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cpe_uri, as: 'cpeUri'
          property :description, as: 'description'
          property :fixed_location, as: 'fixedLocation', class: Google::Apis::ContaineranalysisV1beta1::VulnerabilityLocation, decorator: Google::Apis::ContaineranalysisV1beta1::VulnerabilityLocation::Representation
      
          property :is_obsolete, as: 'isObsolete'
          property :max_affected_version, as: 'maxAffectedVersion', class: Google::Apis::ContaineranalysisV1beta1::Version, decorator: Google::Apis::ContaineranalysisV1beta1::Version::Representation
      
          property :min_affected_version, as: 'minAffectedVersion', class: Google::Apis::ContaineranalysisV1beta1::Version, decorator: Google::Apis::ContaineranalysisV1beta1::Version::Representation
      
          property :package, as: 'package'
          property :package_type, as: 'packageType'
          property :severity_name, as: 'severityName'
          property :source_update_time, as: 'sourceUpdateTime'
        end
      end
      
      class Details
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :attestation, as: 'attestation', class: Google::Apis::ContaineranalysisV1beta1::Attestation, decorator: Google::Apis::ContaineranalysisV1beta1::Attestation::Representation
      
        end
      end
      
      class Discovered
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :analysis_status, as: 'analysisStatus'
          property :analysis_status_error, as: 'analysisStatusError', class: Google::Apis::ContaineranalysisV1beta1::Status, decorator: Google::Apis::ContaineranalysisV1beta1::Status::Representation
      
          property :continuous_analysis, as: 'continuousAnalysis'
          property :last_analysis_time, as: 'lastAnalysisTime'
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
          property :latest_version, as: 'latestVersion', class: Google::Apis::ContaineranalysisV1beta1::Version, decorator: Google::Apis::ContaineranalysisV1beta1::Version::Representation
      
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
          collection :file_hash, as: 'fileHash', class: Google::Apis::ContaineranalysisV1beta1::HashProp, decorator: Google::Apis::ContaineranalysisV1beta1::HashProp::Representation
      
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
      
      class FixableTotalByDigest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :fixable_count, :numeric_string => true, as: 'fixableCount'
          property :resource, as: 'resource', class: Google::Apis::ContaineranalysisV1beta1::Resource, decorator: Google::Apis::ContaineranalysisV1beta1::Resource::Representation
      
          property :severity, as: 'severity'
          property :total_count, :numeric_string => true, as: 'totalCount'
        end
      end
      
      class GenericSignedAttestation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :content_type, as: 'contentType'
          property :serialized_payload, :base64 => true, as: 'serializedPayload'
          collection :signatures, as: 'signatures', class: Google::Apis::ContaineranalysisV1beta1::Signature, decorator: Google::Apis::ContaineranalysisV1beta1::Signature::Representation
      
        end
      end
      
      class GerritSourceContext
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :alias_context, as: 'aliasContext', class: Google::Apis::ContaineranalysisV1beta1::AliasContext, decorator: Google::Apis::ContaineranalysisV1beta1::AliasContext::Representation
      
          property :gerrit_project, as: 'gerritProject'
          property :host_uri, as: 'hostUri'
          property :revision_id, as: 'revisionId'
        end
      end
      
      class GetIamPolicyRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :options, as: 'options', class: Google::Apis::ContaineranalysisV1beta1::GetPolicyOptions, decorator: Google::Apis::ContaineranalysisV1beta1::GetPolicyOptions::Representation
      
        end
      end
      
      class GetPolicyOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :requested_policy_version, as: 'requestedPolicyVersion'
        end
      end
      
      class GitSourceContext
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
      
      class GrafeasV1beta1BuildDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :provenance, as: 'provenance', class: Google::Apis::ContaineranalysisV1beta1::BuildProvenance, decorator: Google::Apis::ContaineranalysisV1beta1::BuildProvenance::Representation
      
          property :provenance_bytes, as: 'provenanceBytes'
        end
      end
      
      class GrafeasV1beta1DeploymentDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :deployment, as: 'deployment', class: Google::Apis::ContaineranalysisV1beta1::Deployment, decorator: Google::Apis::ContaineranalysisV1beta1::Deployment::Representation
      
        end
      end
      
      class GrafeasV1beta1DiscoveryDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :discovered, as: 'discovered', class: Google::Apis::ContaineranalysisV1beta1::Discovered, decorator: Google::Apis::ContaineranalysisV1beta1::Discovered::Representation
      
        end
      end
      
      class GrafeasV1beta1ImageDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :derived_image, as: 'derivedImage', class: Google::Apis::ContaineranalysisV1beta1::Derived, decorator: Google::Apis::ContaineranalysisV1beta1::Derived::Representation
      
        end
      end
      
      class GrafeasV1beta1PackageDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :installation, as: 'installation', class: Google::Apis::ContaineranalysisV1beta1::Installation, decorator: Google::Apis::ContaineranalysisV1beta1::Installation::Representation
      
        end
      end
      
      class GrafeasV1beta1VulnerabilityDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cvss_score, as: 'cvssScore'
          property :effective_severity, as: 'effectiveSeverity'
          property :long_description, as: 'longDescription'
          collection :package_issue, as: 'packageIssue', class: Google::Apis::ContaineranalysisV1beta1::PackageIssue, decorator: Google::Apis::ContaineranalysisV1beta1::PackageIssue::Representation
      
          collection :related_urls, as: 'relatedUrls', class: Google::Apis::ContaineranalysisV1beta1::RelatedUrl, decorator: Google::Apis::ContaineranalysisV1beta1::RelatedUrl::Representation
      
          property :severity, as: 'severity'
          property :short_description, as: 'shortDescription'
          property :type, as: 'type'
        end
      end
      
      class HashProp
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :type, as: 'type'
          property :value, :base64 => true, as: 'value'
        end
      end
      
      class Hint
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :human_readable_name, as: 'humanReadableName'
        end
      end
      
      class Installation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :location, as: 'location', class: Google::Apis::ContaineranalysisV1beta1::Location, decorator: Google::Apis::ContaineranalysisV1beta1::Location::Representation
      
          property :name, as: 'name'
        end
      end
      
      class KnowledgeBase
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :url, as: 'url'
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
          collection :occurrences, as: 'occurrences', class: Google::Apis::ContaineranalysisV1beta1::Occurrence, decorator: Google::Apis::ContaineranalysisV1beta1::Occurrence::Representation
      
        end
      end
      
      class ListNotesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :notes, as: 'notes', class: Google::Apis::ContaineranalysisV1beta1::Note, decorator: Google::Apis::ContaineranalysisV1beta1::Note::Representation
      
        end
      end
      
      class ListOccurrencesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :occurrences, as: 'occurrences', class: Google::Apis::ContaineranalysisV1beta1::Occurrence, decorator: Google::Apis::ContaineranalysisV1beta1::Occurrence::Representation
      
        end
      end
      
      class ListScanConfigsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :scan_configs, as: 'scanConfigs', class: Google::Apis::ContaineranalysisV1beta1::ScanConfig, decorator: Google::Apis::ContaineranalysisV1beta1::ScanConfig::Representation
      
        end
      end
      
      class Location
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cpe_uri, as: 'cpeUri'
          property :path, as: 'path'
          property :version, as: 'version', class: Google::Apis::ContaineranalysisV1beta1::Version, decorator: Google::Apis::ContaineranalysisV1beta1::Version::Representation
      
        end
      end
      
      class Note
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :attestation_authority, as: 'attestationAuthority', class: Google::Apis::ContaineranalysisV1beta1::Authority, decorator: Google::Apis::ContaineranalysisV1beta1::Authority::Representation
      
          property :base_image, as: 'baseImage', class: Google::Apis::ContaineranalysisV1beta1::Basis, decorator: Google::Apis::ContaineranalysisV1beta1::Basis::Representation
      
          property :build, as: 'build', class: Google::Apis::ContaineranalysisV1beta1::Build, decorator: Google::Apis::ContaineranalysisV1beta1::Build::Representation
      
          property :create_time, as: 'createTime'
          property :deployable, as: 'deployable', class: Google::Apis::ContaineranalysisV1beta1::Deployable, decorator: Google::Apis::ContaineranalysisV1beta1::Deployable::Representation
      
          property :discovery, as: 'discovery', class: Google::Apis::ContaineranalysisV1beta1::Discovery, decorator: Google::Apis::ContaineranalysisV1beta1::Discovery::Representation
      
          property :expiration_time, as: 'expirationTime'
          property :kind, as: 'kind'
          property :long_description, as: 'longDescription'
          property :name, as: 'name'
          property :package, as: 'package', class: Google::Apis::ContaineranalysisV1beta1::Package, decorator: Google::Apis::ContaineranalysisV1beta1::Package::Representation
      
          collection :related_note_names, as: 'relatedNoteNames'
          collection :related_url, as: 'relatedUrl', class: Google::Apis::ContaineranalysisV1beta1::RelatedUrl, decorator: Google::Apis::ContaineranalysisV1beta1::RelatedUrl::Representation
      
          property :short_description, as: 'shortDescription'
          property :update_time, as: 'updateTime'
          property :vulnerability, as: 'vulnerability', class: Google::Apis::ContaineranalysisV1beta1::Vulnerability, decorator: Google::Apis::ContaineranalysisV1beta1::Vulnerability::Representation
      
        end
      end
      
      class Occurrence
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :attestation, as: 'attestation', class: Google::Apis::ContaineranalysisV1beta1::Details, decorator: Google::Apis::ContaineranalysisV1beta1::Details::Representation
      
          property :build, as: 'build', class: Google::Apis::ContaineranalysisV1beta1::GrafeasV1beta1BuildDetails, decorator: Google::Apis::ContaineranalysisV1beta1::GrafeasV1beta1BuildDetails::Representation
      
          property :create_time, as: 'createTime'
          property :deployment, as: 'deployment', class: Google::Apis::ContaineranalysisV1beta1::GrafeasV1beta1DeploymentDetails, decorator: Google::Apis::ContaineranalysisV1beta1::GrafeasV1beta1DeploymentDetails::Representation
      
          property :derived_image, as: 'derivedImage', class: Google::Apis::ContaineranalysisV1beta1::GrafeasV1beta1ImageDetails, decorator: Google::Apis::ContaineranalysisV1beta1::GrafeasV1beta1ImageDetails::Representation
      
          property :discovered, as: 'discovered', class: Google::Apis::ContaineranalysisV1beta1::GrafeasV1beta1DiscoveryDetails, decorator: Google::Apis::ContaineranalysisV1beta1::GrafeasV1beta1DiscoveryDetails::Representation
      
          property :installation, as: 'installation', class: Google::Apis::ContaineranalysisV1beta1::GrafeasV1beta1PackageDetails, decorator: Google::Apis::ContaineranalysisV1beta1::GrafeasV1beta1PackageDetails::Representation
      
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :note_name, as: 'noteName'
          property :remediation, as: 'remediation'
          property :resource, as: 'resource', class: Google::Apis::ContaineranalysisV1beta1::Resource, decorator: Google::Apis::ContaineranalysisV1beta1::Resource::Representation
      
          property :update_time, as: 'updateTime'
          property :vulnerability, as: 'vulnerability', class: Google::Apis::ContaineranalysisV1beta1::GrafeasV1beta1VulnerabilityDetails, decorator: Google::Apis::ContaineranalysisV1beta1::GrafeasV1beta1VulnerabilityDetails::Representation
      
        end
      end
      
      class Package
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :distribution, as: 'distribution', class: Google::Apis::ContaineranalysisV1beta1::Distribution, decorator: Google::Apis::ContaineranalysisV1beta1::Distribution::Representation
      
          property :name, as: 'name'
        end
      end
      
      class PackageIssue
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :affected_location, as: 'affectedLocation', class: Google::Apis::ContaineranalysisV1beta1::VulnerabilityLocation, decorator: Google::Apis::ContaineranalysisV1beta1::VulnerabilityLocation::Representation
      
          property :fixed_location, as: 'fixedLocation', class: Google::Apis::ContaineranalysisV1beta1::VulnerabilityLocation, decorator: Google::Apis::ContaineranalysisV1beta1::VulnerabilityLocation::Representation
      
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
          collection :bindings, as: 'bindings', class: Google::Apis::ContaineranalysisV1beta1::Binding, decorator: Google::Apis::ContaineranalysisV1beta1::Binding::Representation
      
          property :etag, :base64 => true, as: 'etag'
          property :version, as: 'version'
        end
      end
      
      class ProjectRepoId
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :project_id, as: 'projectId'
          property :repo_name, as: 'repoName'
        end
      end
      
      class RelatedUrl
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :label, as: 'label'
          property :url, as: 'url'
        end
      end
      
      class RepoId
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :project_repo_id, as: 'projectRepoId', class: Google::Apis::ContaineranalysisV1beta1::ProjectRepoId, decorator: Google::Apis::ContaineranalysisV1beta1::ProjectRepoId::Representation
      
          property :uid, as: 'uid'
        end
      end
      
      class Resource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :content_hash, as: 'contentHash', class: Google::Apis::ContaineranalysisV1beta1::HashProp, decorator: Google::Apis::ContaineranalysisV1beta1::HashProp::Representation
      
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
          property :policy, as: 'policy', class: Google::Apis::ContaineranalysisV1beta1::Policy, decorator: Google::Apis::ContaineranalysisV1beta1::Policy::Representation
      
        end
      end
      
      class Signature
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :public_key_id, as: 'publicKeyId'
          property :signature, :base64 => true, as: 'signature'
        end
      end
      
      class Source
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :additional_contexts, as: 'additionalContexts', class: Google::Apis::ContaineranalysisV1beta1::SourceContext, decorator: Google::Apis::ContaineranalysisV1beta1::SourceContext::Representation
      
          property :artifact_storage_source_uri, as: 'artifactStorageSourceUri'
          property :context, as: 'context', class: Google::Apis::ContaineranalysisV1beta1::SourceContext, decorator: Google::Apis::ContaineranalysisV1beta1::SourceContext::Representation
      
          hash :file_hashes, as: 'fileHashes', class: Google::Apis::ContaineranalysisV1beta1::FileHashes, decorator: Google::Apis::ContaineranalysisV1beta1::FileHashes::Representation
      
        end
      end
      
      class SourceContext
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cloud_repo, as: 'cloudRepo', class: Google::Apis::ContaineranalysisV1beta1::CloudRepoSourceContext, decorator: Google::Apis::ContaineranalysisV1beta1::CloudRepoSourceContext::Representation
      
          property :gerrit, as: 'gerrit', class: Google::Apis::ContaineranalysisV1beta1::GerritSourceContext, decorator: Google::Apis::ContaineranalysisV1beta1::GerritSourceContext::Representation
      
          property :git, as: 'git', class: Google::Apis::ContaineranalysisV1beta1::GitSourceContext, decorator: Google::Apis::ContaineranalysisV1beta1::GitSourceContext::Representation
      
          hash :labels, as: 'labels'
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
      
      class Version
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :epoch, as: 'epoch'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :revision, as: 'revision'
        end
      end
      
      class Vulnerability
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cvss_score, as: 'cvssScore'
          property :cvss_v3, as: 'cvssV3', class: Google::Apis::ContaineranalysisV1beta1::CvsSv3, decorator: Google::Apis::ContaineranalysisV1beta1::CvsSv3::Representation
      
          collection :details, as: 'details', class: Google::Apis::ContaineranalysisV1beta1::Detail, decorator: Google::Apis::ContaineranalysisV1beta1::Detail::Representation
      
          property :severity, as: 'severity'
          property :source_update_time, as: 'sourceUpdateTime'
          collection :windows_details, as: 'windowsDetails', class: Google::Apis::ContaineranalysisV1beta1::WindowsDetail, decorator: Google::Apis::ContaineranalysisV1beta1::WindowsDetail::Representation
      
        end
      end
      
      class VulnerabilityLocation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cpe_uri, as: 'cpeUri'
          property :package, as: 'package'
          property :version, as: 'version', class: Google::Apis::ContaineranalysisV1beta1::Version, decorator: Google::Apis::ContaineranalysisV1beta1::Version::Representation
      
        end
      end
      
      class VulnerabilityOccurrencesSummary
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :counts, as: 'counts', class: Google::Apis::ContaineranalysisV1beta1::FixableTotalByDigest, decorator: Google::Apis::ContaineranalysisV1beta1::FixableTotalByDigest::Representation
      
        end
      end
      
      class WindowsDetail
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cpe_uri, as: 'cpeUri'
          property :description, as: 'description'
          collection :fixing_kbs, as: 'fixingKbs', class: Google::Apis::ContaineranalysisV1beta1::KnowledgeBase, decorator: Google::Apis::ContaineranalysisV1beta1::KnowledgeBase::Representation
      
          property :name, as: 'name'
        end
      end
    end
  end
end
