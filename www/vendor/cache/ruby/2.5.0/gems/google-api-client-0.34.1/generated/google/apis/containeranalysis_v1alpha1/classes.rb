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
      
      # Artifact describes a build product.
      class Artifact
        include Google::Apis::Core::Hashable
      
        # Hash or checksum value of a binary, or Docker Registry 2.0 digest of a
        # container.
        # Corresponds to the JSON property `checksum`
        # @return [String]
        attr_accessor :checksum
      
        # Artifact ID, if any; for container images, this will be a URL by digest
        # like gcr.io/projectID/imagename@sha256:123456
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Name of the artifact. This may be the path to a binary or jar file, or in
        # the case of a container build, the name used to push the container image to
        # Google Container Registry, as presented to `docker push`.
        # This field is deprecated in favor of the plural `names` field; it continues
        # to exist here to allow existing BuildProvenance serialized to json in
        # google.devtools.containeranalysis.v1alpha1.BuildDetails.provenance_bytes to
        # deserialize back into proto.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Related artifact names. This may be the path to a binary or jar file, or in
        # the case of a container build, the name used to push the container image to
        # Google Container Registry, as presented to `docker push`. Note that a
        # single Artifact ID can have multiple names, for example if two tags are
        # applied to one image.
        # Corresponds to the JSON property `names`
        # @return [Array<String>]
        attr_accessor :names
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @checksum = args[:checksum] if args.key?(:checksum)
          @id = args[:id] if args.key?(:id)
          @name = args[:name] if args.key?(:name)
          @names = args[:names] if args.key?(:names)
        end
      end
      
      # Occurrence that represents a single "attestation".  The authenticity of an
      # Attestation can be verified using the attached signature. If the verifier
      # trusts the public key of the signer, then verifying the signature is
      # sufficient to establish trust.  In this circumstance, the
      # AttestationAuthority to which this Attestation is attached is primarily
      # useful for look-up (how to find this Attestation if you already know the
      # Authority and artifact to be verified) and intent (which authority was this
      # attestation intended to sign for).
      class Attestation
        include Google::Apis::Core::Hashable
      
        # An attestation wrapper with a PGP-compatible signature.
        # This message only supports `ATTACHED` signatures, where the payload that is
        # signed is included alongside the signature itself in the same file.
        # Corresponds to the JSON property `pgpSignedAttestation`
        # @return [Google::Apis::ContaineranalysisV1alpha1::PgpSignedAttestation]
        attr_accessor :pgp_signed_attestation
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @pgp_signed_attestation = args[:pgp_signed_attestation] if args.key?(:pgp_signed_attestation)
        end
      end
      
      # Note kind that represents a logical attestation "role" or "authority".  For
      # example, an organization might have one `AttestationAuthority` for "QA" and
      # one for "build".  This Note is intended to act strictly as a grouping
      # mechanism for the attached Occurrences (Attestations).  This grouping
      # mechanism also provides a security boundary, since IAM ACLs gate the ability
      # for a principle to attach an Occurrence to a given Note.  It also provides a
      # single point of lookup to find all attached Attestation Occurrences, even if
      # they don't all live in the same project.
      class AttestationAuthority
        include Google::Apis::Core::Hashable
      
        # This submessage provides human-readable hints about the purpose of the
        # AttestationAuthority.  Because the name of a Note acts as its resource
        # reference, it is important to disambiguate the canonical name of the Note
        # (which might be a UUID for security purposes) from "readable" names more
        # suitable for debug output.  Note that these hints should NOT be used to
        # look up AttestationAuthorities in security sensitive contexts, such as when
        # looking up Attestations to verify.
        # Corresponds to the JSON property `hint`
        # @return [Google::Apis::ContaineranalysisV1alpha1::AttestationAuthorityHint]
        attr_accessor :hint
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @hint = args[:hint] if args.key?(:hint)
        end
      end
      
      # This submessage provides human-readable hints about the purpose of the
      # AttestationAuthority.  Because the name of a Note acts as its resource
      # reference, it is important to disambiguate the canonical name of the Note
      # (which might be a UUID for security purposes) from "readable" names more
      # suitable for debug output.  Note that these hints should NOT be used to
      # look up AttestationAuthorities in security sensitive contexts, such as when
      # looking up Attestations to verify.
      class AttestationAuthorityHint
        include Google::Apis::Core::Hashable
      
        # The human readable name of this Attestation Authority, for example "qa".
        # Corresponds to the JSON property `humanReadableName`
        # @return [String]
        attr_accessor :human_readable_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @human_readable_name = args[:human_readable_name] if args.key?(:human_readable_name)
        end
      end
      
      # Basis describes the base image portion (Note) of the DockerImage
      # relationship.  Linked occurrences are derived from this or an
      # equivalent image via:
      # FROM <Basis.resource_url>
      # Or an equivalent reference, e.g. a tag of the resource_url.
      class Basis
        include Google::Apis::Core::Hashable
      
        # A set of properties that uniquely identify a given Docker image.
        # Corresponds to the JSON property `fingerprint`
        # @return [Google::Apis::ContaineranalysisV1alpha1::Fingerprint]
        attr_accessor :fingerprint
      
        # The resource_url for the resource representing the basis of
        # associated occurrence images.
        # Corresponds to the JSON property `resourceUrl`
        # @return [String]
        attr_accessor :resource_url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @fingerprint = args[:fingerprint] if args.key?(:fingerprint)
          @resource_url = args[:resource_url] if args.key?(:resource_url)
        end
      end
      
      # Associates `members` with a `role`.
      class Binding
        include Google::Apis::Core::Hashable
      
        # Represents an expression text. Example:
        # title: "User account presence"
        # description: "Determines whether the request has a user account"
        # expression: "size(request.user) > 0"
        # Corresponds to the JSON property `condition`
        # @return [Google::Apis::ContaineranalysisV1alpha1::Expr]
        attr_accessor :condition
      
        # Specifies the identities requesting access for a Cloud Platform resource.
        # `members` can have the following values:
        # * `allUsers`: A special identifier that represents anyone who is
        # on the internet; with or without a Google account.
        # * `allAuthenticatedUsers`: A special identifier that represents anyone
        # who is authenticated with a Google account or a service account.
        # * `user:`emailid``: An email address that represents a specific Google
        # account. For example, `alice@example.com` .
        # * `serviceAccount:`emailid``: An email address that represents a service
        # account. For example, `my-other-app@appspot.gserviceaccount.com`.
        # * `group:`emailid``: An email address that represents a Google group.
        # For example, `admins@example.com`.
        # * `domain:`domain``: The G Suite domain (primary) that represents all the
        # users of that domain. For example, `google.com` or `example.com`.
        # Corresponds to the JSON property `members`
        # @return [Array<String>]
        attr_accessor :members
      
        # Role that is assigned to `members`.
        # For example, `roles/viewer`, `roles/editor`, or `roles/owner`.
        # Corresponds to the JSON property `role`
        # @return [String]
        attr_accessor :role
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @condition = args[:condition] if args.key?(:condition)
          @members = args[:members] if args.key?(:members)
          @role = args[:role] if args.key?(:role)
        end
      end
      
      # Message encapsulating build provenance details.
      class BuildDetails
        include Google::Apis::Core::Hashable
      
        # Provenance of a build. Contains all information needed to verify the full
        # details about the build from source to completion.
        # Corresponds to the JSON property `provenance`
        # @return [Google::Apis::ContaineranalysisV1alpha1::BuildProvenance]
        attr_accessor :provenance
      
        # Serialized JSON representation of the provenance, used in generating the
        # `BuildSignature` in the corresponding Result. After verifying the
        # signature, `provenance_bytes` can be unmarshalled and compared to the
        # provenance to confirm that it is unchanged. A base64-encoded string
        # representation of the provenance bytes is used for the signature in order
        # to interoperate with openssl which expects this format for signature
        # verification.
        # The serialized form is captured both to avoid ambiguity in how the
        # provenance is marshalled to json as well to prevent incompatibilities with
        # future changes.
        # Corresponds to the JSON property `provenanceBytes`
        # @return [String]
        attr_accessor :provenance_bytes
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @provenance = args[:provenance] if args.key?(:provenance)
          @provenance_bytes = args[:provenance_bytes] if args.key?(:provenance_bytes)
        end
      end
      
      # Provenance of a build. Contains all information needed to verify the full
      # details about the build from source to completion.
      class BuildProvenance
        include Google::Apis::Core::Hashable
      
        # Special options applied to this build. This is a catch-all field where
        # build providers can enter any desired additional details.
        # Corresponds to the JSON property `buildOptions`
        # @return [Hash<String,String>]
        attr_accessor :build_options
      
        # Version string of the builder at the time this build was executed.
        # Corresponds to the JSON property `builderVersion`
        # @return [String]
        attr_accessor :builder_version
      
        # Output of the build.
        # Corresponds to the JSON property `builtArtifacts`
        # @return [Array<Google::Apis::ContaineranalysisV1alpha1::Artifact>]
        attr_accessor :built_artifacts
      
        # Commands requested by the build.
        # Corresponds to the JSON property `commands`
        # @return [Array<Google::Apis::ContaineranalysisV1alpha1::Command>]
        attr_accessor :commands
      
        # Time at which the build was created.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # E-mail address of the user who initiated this build. Note that this was the
        # user's e-mail address at the time the build was initiated; this address may
        # not represent the same end-user for all time.
        # Corresponds to the JSON property `creator`
        # @return [String]
        attr_accessor :creator
      
        # Time at which execution of the build was finished.
        # Corresponds to the JSON property `finishTime`
        # @return [String]
        attr_accessor :finish_time
      
        # Unique identifier of the build.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Google Cloud Storage bucket where logs were written.
        # Corresponds to the JSON property `logsBucket`
        # @return [String]
        attr_accessor :logs_bucket
      
        # ID of the project.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # Source describes the location of the source used for the build.
        # Corresponds to the JSON property `sourceProvenance`
        # @return [Google::Apis::ContaineranalysisV1alpha1::Source]
        attr_accessor :source_provenance
      
        # Time at which execution of the build was started.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        # Trigger identifier if the build was triggered automatically; empty if not.
        # Corresponds to the JSON property `triggerId`
        # @return [String]
        attr_accessor :trigger_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @build_options = args[:build_options] if args.key?(:build_options)
          @builder_version = args[:builder_version] if args.key?(:builder_version)
          @built_artifacts = args[:built_artifacts] if args.key?(:built_artifacts)
          @commands = args[:commands] if args.key?(:commands)
          @create_time = args[:create_time] if args.key?(:create_time)
          @creator = args[:creator] if args.key?(:creator)
          @finish_time = args[:finish_time] if args.key?(:finish_time)
          @id = args[:id] if args.key?(:id)
          @logs_bucket = args[:logs_bucket] if args.key?(:logs_bucket)
          @project_id = args[:project_id] if args.key?(:project_id)
          @source_provenance = args[:source_provenance] if args.key?(:source_provenance)
          @start_time = args[:start_time] if args.key?(:start_time)
          @trigger_id = args[:trigger_id] if args.key?(:trigger_id)
        end
      end
      
      # Message encapsulating the signature of the verified build.
      class BuildSignature
        include Google::Apis::Core::Hashable
      
        # An Id for the key used to sign. This could be either an Id for the key
        # stored in `public_key` (such as the Id or fingerprint for a PGP key, or the
        # CN for a cert), or a reference to an external key (such as a reference to a
        # key in Cloud Key Management Service).
        # Corresponds to the JSON property `keyId`
        # @return [String]
        attr_accessor :key_id
      
        # The type of the key, either stored in `public_key` or referenced in
        # `key_id`
        # Corresponds to the JSON property `keyType`
        # @return [String]
        attr_accessor :key_type
      
        # Public key of the builder which can be used to verify that the related
        # findings are valid and unchanged. If `key_type` is empty, this defaults
        # to PEM encoded public keys.
        # This field may be empty if `key_id` references an external key.
        # For Cloud Build based signatures, this is a PEM encoded public
        # key. To verify the Cloud Build signature, place the contents of
        # this field into a file (public.pem). The signature field is base64-decoded
        # into its binary representation in signature.bin, and the provenance bytes
        # from `BuildDetails` are base64-decoded into a binary representation in
        # signed.bin. OpenSSL can then verify the signature:
        # `openssl sha256 -verify public.pem -signature signature.bin signed.bin`
        # Corresponds to the JSON property `publicKey`
        # @return [String]
        attr_accessor :public_key
      
        # Signature of the related `BuildProvenance`, encoded in a base64 string.
        # Corresponds to the JSON property `signature`
        # @return [String]
        attr_accessor :signature
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @key_id = args[:key_id] if args.key?(:key_id)
          @key_type = args[:key_type] if args.key?(:key_type)
          @public_key = args[:public_key] if args.key?(:public_key)
          @signature = args[:signature] if args.key?(:signature)
        end
      end
      
      # Note holding the version of the provider's builder and the signature of
      # the provenance message in linked BuildDetails.
      class BuildType
        include Google::Apis::Core::Hashable
      
        # Version of the builder which produced this Note.
        # Corresponds to the JSON property `builderVersion`
        # @return [String]
        attr_accessor :builder_version
      
        # Message encapsulating the signature of the verified build.
        # Corresponds to the JSON property `signature`
        # @return [Google::Apis::ContaineranalysisV1alpha1::BuildSignature]
        attr_accessor :signature
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @builder_version = args[:builder_version] if args.key?(:builder_version)
          @signature = args[:signature] if args.key?(:signature)
        end
      end
      
      # Command describes a step performed as part of the build pipeline.
      class Command
        include Google::Apis::Core::Hashable
      
        # Command-line arguments used when executing this Command.
        # Corresponds to the JSON property `args`
        # @return [Array<String>]
        attr_accessor :args
      
        # Working directory (relative to project source root) used when running
        # this Command.
        # Corresponds to the JSON property `dir`
        # @return [String]
        attr_accessor :dir
      
        # Environment variables set before running this Command.
        # Corresponds to the JSON property `env`
        # @return [Array<String>]
        attr_accessor :env
      
        # Optional unique identifier for this Command, used in wait_for to reference
        # this Command as a dependency.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Name of the command, as presented on the command line, or if the command is
        # packaged as a Docker container, as presented to `docker pull`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The ID(s) of the Command(s) that this Command depends on.
        # Corresponds to the JSON property `waitFor`
        # @return [Array<String>]
        attr_accessor :wait_for
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @args = args[:args] if args.key?(:args)
          @dir = args[:dir] if args.key?(:dir)
          @env = args[:env] if args.key?(:env)
          @id = args[:id] if args.key?(:id)
          @name = args[:name] if args.key?(:name)
          @wait_for = args[:wait_for] if args.key?(:wait_for)
        end
      end
      
      # Request for creating an operation
      class CreateOperationRequest
        include Google::Apis::Core::Hashable
      
        # This resource represents a long-running operation that is the result of a
        # network API call.
        # Corresponds to the JSON property `operation`
        # @return [Google::Apis::ContaineranalysisV1alpha1::Operation]
        attr_accessor :operation
      
        # The ID to use for this operation.
        # Corresponds to the JSON property `operationId`
        # @return [String]
        attr_accessor :operation_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @operation = args[:operation] if args.key?(:operation)
          @operation_id = args[:operation_id] if args.key?(:operation_id)
        end
      end
      
      # An artifact that can be deployed in some runtime.
      class Deployable
        include Google::Apis::Core::Hashable
      
        # Resource URI for the artifact being deployed.
        # Corresponds to the JSON property `resourceUri`
        # @return [Array<String>]
        attr_accessor :resource_uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @resource_uri = args[:resource_uri] if args.key?(:resource_uri)
        end
      end
      
      # The period during which some deployable was active in a runtime.
      class Deployment
        include Google::Apis::Core::Hashable
      
        # Address of the runtime element hosting this deployment.
        # Corresponds to the JSON property `address`
        # @return [String]
        attr_accessor :address
      
        # Configuration used to create this deployment.
        # Corresponds to the JSON property `config`
        # @return [String]
        attr_accessor :config
      
        # Beginning of the lifetime of this deployment.
        # Corresponds to the JSON property `deployTime`
        # @return [String]
        attr_accessor :deploy_time
      
        # Platform hosting this deployment.
        # Corresponds to the JSON property `platform`
        # @return [String]
        attr_accessor :platform
      
        # Output only. Resource URI for the artifact being deployed taken from the
        # deployable field with the same name.
        # Corresponds to the JSON property `resourceUri`
        # @return [Array<String>]
        attr_accessor :resource_uri
      
        # End of the lifetime of this deployment.
        # Corresponds to the JSON property `undeployTime`
        # @return [String]
        attr_accessor :undeploy_time
      
        # Identity of the user that triggered this deployment.
        # Corresponds to the JSON property `userEmail`
        # @return [String]
        attr_accessor :user_email
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @address = args[:address] if args.key?(:address)
          @config = args[:config] if args.key?(:config)
          @deploy_time = args[:deploy_time] if args.key?(:deploy_time)
          @platform = args[:platform] if args.key?(:platform)
          @resource_uri = args[:resource_uri] if args.key?(:resource_uri)
          @undeploy_time = args[:undeploy_time] if args.key?(:undeploy_time)
          @user_email = args[:user_email] if args.key?(:user_email)
        end
      end
      
      # Derived describes the derived image portion (Occurrence) of the
      # DockerImage relationship.  This image would be produced from a Dockerfile
      # with FROM <DockerImage.Basis in attached Note>.
      class Derived
        include Google::Apis::Core::Hashable
      
        # Output only. This contains the base image URL for the derived image
        # occurrence.
        # Corresponds to the JSON property `baseResourceUrl`
        # @return [String]
        attr_accessor :base_resource_url
      
        # Output only. The number of layers by which this image differs from the
        # associated image basis.
        # Corresponds to the JSON property `distance`
        # @return [Fixnum]
        attr_accessor :distance
      
        # A set of properties that uniquely identify a given Docker image.
        # Corresponds to the JSON property `fingerprint`
        # @return [Google::Apis::ContaineranalysisV1alpha1::Fingerprint]
        attr_accessor :fingerprint
      
        # This contains layer-specific metadata, if populated it has length
        # "distance" and is ordered with [distance] being the layer immediately
        # following the base image and [1] being the final layer.
        # Corresponds to the JSON property `layerInfo`
        # @return [Array<Google::Apis::ContaineranalysisV1alpha1::Layer>]
        attr_accessor :layer_info
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @base_resource_url = args[:base_resource_url] if args.key?(:base_resource_url)
          @distance = args[:distance] if args.key?(:distance)
          @fingerprint = args[:fingerprint] if args.key?(:fingerprint)
          @layer_info = args[:layer_info] if args.key?(:layer_info)
        end
      end
      
      # Identifies all occurrences of this vulnerability in the package for a
      # specific distro/location
      # For example: glibc in cpe:/o:debian:debian_linux:8 for versions 2.1 - 2.2
      class Detail
        include Google::Apis::Core::Hashable
      
        # The cpe_uri in [cpe format] (https://cpe.mitre.org/specification/) in
        # which the vulnerability manifests.  Examples include distro or storage
        # location for vulnerable jar.
        # This field can be used as a filter in list requests.
        # Corresponds to the JSON property `cpeUri`
        # @return [String]
        attr_accessor :cpe_uri
      
        # A vendor-specific description of this note.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The location of the vulnerability
        # Corresponds to the JSON property `fixedLocation`
        # @return [Google::Apis::ContaineranalysisV1alpha1::VulnerabilityLocation]
        attr_accessor :fixed_location
      
        # Whether this Detail is obsolete. Occurrences are expected not to point to
        # obsolete details.
        # Corresponds to the JSON property `isObsolete`
        # @return [Boolean]
        attr_accessor :is_obsolete
        alias_method :is_obsolete?, :is_obsolete
      
        # Version contains structured information about the version of the package.
        # For a discussion of this in Debian/Ubuntu:
        # http://serverfault.com/questions/604541/debian-packages-version-convention
        # For a discussion of this in Redhat/Fedora/Centos:
        # http://blog.jasonantman.com/2014/07/how-yum-and-rpm-compare-versions/
        # Corresponds to the JSON property `maxAffectedVersion`
        # @return [Google::Apis::ContaineranalysisV1alpha1::Version]
        attr_accessor :max_affected_version
      
        # Version contains structured information about the version of the package.
        # For a discussion of this in Debian/Ubuntu:
        # http://serverfault.com/questions/604541/debian-packages-version-convention
        # For a discussion of this in Redhat/Fedora/Centos:
        # http://blog.jasonantman.com/2014/07/how-yum-and-rpm-compare-versions/
        # Corresponds to the JSON property `minAffectedVersion`
        # @return [Google::Apis::ContaineranalysisV1alpha1::Version]
        attr_accessor :min_affected_version
      
        # The name of the package where the vulnerability was found.
        # This field can be used as a filter in list requests.
        # Corresponds to the JSON property `package`
        # @return [String]
        attr_accessor :package
      
        # The type of package; whether native or non native(ruby gems,
        # node.js packages etc)
        # Corresponds to the JSON property `packageType`
        # @return [String]
        attr_accessor :package_type
      
        # The severity (eg: distro assigned severity) for this vulnerability.
        # Corresponds to the JSON property `severityName`
        # @return [String]
        attr_accessor :severity_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cpe_uri = args[:cpe_uri] if args.key?(:cpe_uri)
          @description = args[:description] if args.key?(:description)
          @fixed_location = args[:fixed_location] if args.key?(:fixed_location)
          @is_obsolete = args[:is_obsolete] if args.key?(:is_obsolete)
          @max_affected_version = args[:max_affected_version] if args.key?(:max_affected_version)
          @min_affected_version = args[:min_affected_version] if args.key?(:min_affected_version)
          @package = args[:package] if args.key?(:package)
          @package_type = args[:package_type] if args.key?(:package_type)
          @severity_name = args[:severity_name] if args.key?(:severity_name)
        end
      end
      
      # Provides information about the scan status of a discovered resource.
      class Discovered
        include Google::Apis::Core::Hashable
      
        # The status of discovery for the resource.
        # Corresponds to the JSON property `analysisStatus`
        # @return [String]
        attr_accessor :analysis_status
      
        # The `Status` type defines a logical error model that is suitable for
        # different programming environments, including REST APIs and RPC APIs. It is
        # used by [gRPC](https://github.com/grpc). Each `Status` message contains
        # three pieces of data: error code, error message, and error details.
        # You can find out more about this error model and how to work with it in the
        # [API Design Guide](https://cloud.google.com/apis/design/errors).
        # Corresponds to the JSON property `analysisStatusError`
        # @return [Google::Apis::ContaineranalysisV1alpha1::Status]
        attr_accessor :analysis_status_error
      
        # Whether the resource is continuously analyzed.
        # Corresponds to the JSON property `continuousAnalysis`
        # @return [String]
        attr_accessor :continuous_analysis
      
        # The CPE of the resource being scanned.
        # Corresponds to the JSON property `cpe`
        # @return [String]
        attr_accessor :cpe
      
        # This resource represents a long-running operation that is the result of a
        # network API call.
        # Corresponds to the JSON property `operation`
        # @return [Google::Apis::ContaineranalysisV1alpha1::Operation]
        attr_accessor :operation
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @analysis_status = args[:analysis_status] if args.key?(:analysis_status)
          @analysis_status_error = args[:analysis_status_error] if args.key?(:analysis_status_error)
          @continuous_analysis = args[:continuous_analysis] if args.key?(:continuous_analysis)
          @cpe = args[:cpe] if args.key?(:cpe)
          @operation = args[:operation] if args.key?(:operation)
        end
      end
      
      # A note that indicates a type of analysis a provider would perform. This note
      # exists in a provider's project. A `Discovery` occurrence is created in a
      # consumer's project at the start of analysis. The occurrence's operation will
      # indicate the status of the analysis. Absence of an occurrence linked to this
      # note for a resource indicates that analysis hasn't started.
      class Discovery
        include Google::Apis::Core::Hashable
      
        # The kind of analysis that is handled by this discovery.
        # Corresponds to the JSON property `analysisKind`
        # @return [String]
        attr_accessor :analysis_kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @analysis_kind = args[:analysis_kind] if args.key?(:analysis_kind)
        end
      end
      
      # This represents a particular channel of distribution for a given package.
      # e.g. Debian's jessie-backports dpkg mirror
      class Distribution
        include Google::Apis::Core::Hashable
      
        # The CPU architecture for which packages in this distribution
        # channel were built
        # Corresponds to the JSON property `architecture`
        # @return [String]
        attr_accessor :architecture
      
        # The cpe_uri in [cpe format](https://cpe.mitre.org/specification/)
        # denoting the package manager version distributing a package.
        # Corresponds to the JSON property `cpeUri`
        # @return [String]
        attr_accessor :cpe_uri
      
        # The distribution channel-specific description of this package.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Version contains structured information about the version of the package.
        # For a discussion of this in Debian/Ubuntu:
        # http://serverfault.com/questions/604541/debian-packages-version-convention
        # For a discussion of this in Redhat/Fedora/Centos:
        # http://blog.jasonantman.com/2014/07/how-yum-and-rpm-compare-versions/
        # Corresponds to the JSON property `latestVersion`
        # @return [Google::Apis::ContaineranalysisV1alpha1::Version]
        attr_accessor :latest_version
      
        # A freeform string denoting the maintainer of this package.
        # Corresponds to the JSON property `maintainer`
        # @return [String]
        attr_accessor :maintainer
      
        # The distribution channel-specific homepage for this package.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @architecture = args[:architecture] if args.key?(:architecture)
          @cpe_uri = args[:cpe_uri] if args.key?(:cpe_uri)
          @description = args[:description] if args.key?(:description)
          @latest_version = args[:latest_version] if args.key?(:latest_version)
          @maintainer = args[:maintainer] if args.key?(:maintainer)
          @url = args[:url] if args.key?(:url)
        end
      end
      
      # A generic empty message that you can re-use to avoid defining duplicated
      # empty messages in your APIs. A typical example is to use it as the request
      # or the response type of an API method. For instance:
      # service Foo `
      # rpc Bar(google.protobuf.Empty) returns (google.protobuf.Empty);
      # `
      # The JSON representation for `Empty` is empty JSON object ````.
      class Empty
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Represents an expression text. Example:
      # title: "User account presence"
      # description: "Determines whether the request has a user account"
      # expression: "size(request.user) > 0"
      class Expr
        include Google::Apis::Core::Hashable
      
        # An optional description of the expression. This is a longer text which
        # describes the expression, e.g. when hovered over it in a UI.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Textual representation of an expression in
        # Common Expression Language syntax.
        # The application context of the containing message determines which
        # well-known feature set of CEL is supported.
        # Corresponds to the JSON property `expression`
        # @return [String]
        attr_accessor :expression
      
        # An optional string indicating the location of the expression for error
        # reporting, e.g. a file name and a position in the file.
        # Corresponds to the JSON property `location`
        # @return [String]
        attr_accessor :location
      
        # An optional title for the expression, i.e. a short string describing
        # its purpose. This can be used e.g. in UIs which allow to enter the
        # expression.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @expression = args[:expression] if args.key?(:expression)
          @location = args[:location] if args.key?(:location)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # Container message for hashes of byte content of files, used in Source
      # messages to verify integrity of source input to the build.
      class FileHashes
        include Google::Apis::Core::Hashable
      
        # Collection of file hashes.
        # Corresponds to the JSON property `fileHash`
        # @return [Array<Google::Apis::ContaineranalysisV1alpha1::HashProp>]
        attr_accessor :file_hash
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @file_hash = args[:file_hash] if args.key?(:file_hash)
        end
      end
      
      # A set of properties that uniquely identify a given Docker image.
      class Fingerprint
        include Google::Apis::Core::Hashable
      
        # The layer-id of the final layer in the Docker image's v1
        # representation.
        # This field can be used as a filter in list requests.
        # Corresponds to the JSON property `v1Name`
        # @return [String]
        attr_accessor :v1_name
      
        # The ordered list of v2 blobs that represent a given image.
        # Corresponds to the JSON property `v2Blob`
        # @return [Array<String>]
        attr_accessor :v2_blob
      
        # Output only. The name of the image's v2 blobs computed via:
        # [bottom] := v2_blobbottom := sha256(v2_blob[N] + " " + v2_name[N+1])
        # Only the name of the final blob is kept.
        # This field can be used as a filter in list requests.
        # Corresponds to the JSON property `v2Name`
        # @return [String]
        attr_accessor :v2_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @v1_name = args[:v1_name] if args.key?(:v1_name)
          @v2_blob = args[:v2_blob] if args.key?(:v2_blob)
          @v2_name = args[:v2_name] if args.key?(:v2_name)
        end
      end
      
      # Request message for `GetIamPolicy` method.
      class GetIamPolicyRequest
        include Google::Apis::Core::Hashable
      
        # Encapsulates settings provided to GetIamPolicy.
        # Corresponds to the JSON property `options`
        # @return [Google::Apis::ContaineranalysisV1alpha1::GetPolicyOptions]
        attr_accessor :options
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @options = args[:options] if args.key?(:options)
        end
      end
      
      # Encapsulates settings provided to GetIamPolicy.
      class GetPolicyOptions
        include Google::Apis::Core::Hashable
      
        # Optional. The policy format version to be returned.
        # Valid values are 0, 1, and 3. Requests specifying an invalid value will be
        # rejected.
        # Requests for policies with any conditional bindings must specify version 3.
        # Policies without any conditional bindings may specify any valid value or
        # leave the field unset.
        # Corresponds to the JSON property `requestedPolicyVersion`
        # @return [Fixnum]
        attr_accessor :requested_policy_version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @requested_policy_version = args[:requested_policy_version] if args.key?(:requested_policy_version)
        end
      end
      
      # A summary of how many vulnz occurrences there are per severity type.
      # counts by groups, or if we should have different summary messages
      # like this.
      class GetVulnzOccurrencesSummaryResponse
        include Google::Apis::Core::Hashable
      
        # A map of how many occurrences were found for each severity.
        # Corresponds to the JSON property `counts`
        # @return [Array<Google::Apis::ContaineranalysisV1alpha1::SeverityCount>]
        attr_accessor :counts
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @counts = args[:counts] if args.key?(:counts)
        end
      end
      
      # An alias to a repo revision.
      class GoogleDevtoolsContaineranalysisV1alpha1AliasContext
        include Google::Apis::Core::Hashable
      
        # The alias kind.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The alias name.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # A CloudRepoSourceContext denotes a particular revision in a Google Cloud
      # Source Repo.
      class GoogleDevtoolsContaineranalysisV1alpha1CloudRepoSourceContext
        include Google::Apis::Core::Hashable
      
        # An alias to a repo revision.
        # Corresponds to the JSON property `aliasContext`
        # @return [Google::Apis::ContaineranalysisV1alpha1::GoogleDevtoolsContaineranalysisV1alpha1AliasContext]
        attr_accessor :alias_context
      
        # A unique identifier for a Cloud Repo.
        # Corresponds to the JSON property `repoId`
        # @return [Google::Apis::ContaineranalysisV1alpha1::GoogleDevtoolsContaineranalysisV1alpha1RepoId]
        attr_accessor :repo_id
      
        # A revision ID.
        # Corresponds to the JSON property `revisionId`
        # @return [String]
        attr_accessor :revision_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @alias_context = args[:alias_context] if args.key?(:alias_context)
          @repo_id = args[:repo_id] if args.key?(:repo_id)
          @revision_id = args[:revision_id] if args.key?(:revision_id)
        end
      end
      
      # A SourceContext referring to a Gerrit project.
      class GoogleDevtoolsContaineranalysisV1alpha1GerritSourceContext
        include Google::Apis::Core::Hashable
      
        # An alias to a repo revision.
        # Corresponds to the JSON property `aliasContext`
        # @return [Google::Apis::ContaineranalysisV1alpha1::GoogleDevtoolsContaineranalysisV1alpha1AliasContext]
        attr_accessor :alias_context
      
        # The full project name within the host. Projects may be nested, so
        # "project/subproject" is a valid project name. The "repo name" is
        # the hostURI/project.
        # Corresponds to the JSON property `gerritProject`
        # @return [String]
        attr_accessor :gerrit_project
      
        # The URI of a running Gerrit instance.
        # Corresponds to the JSON property `hostUri`
        # @return [String]
        attr_accessor :host_uri
      
        # A revision (commit) ID.
        # Corresponds to the JSON property `revisionId`
        # @return [String]
        attr_accessor :revision_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @alias_context = args[:alias_context] if args.key?(:alias_context)
          @gerrit_project = args[:gerrit_project] if args.key?(:gerrit_project)
          @host_uri = args[:host_uri] if args.key?(:host_uri)
          @revision_id = args[:revision_id] if args.key?(:revision_id)
        end
      end
      
      # A GitSourceContext denotes a particular revision in a third party Git
      # repository (e.g., GitHub).
      class GoogleDevtoolsContaineranalysisV1alpha1GitSourceContext
        include Google::Apis::Core::Hashable
      
        # Required. Git commit hash.
        # Corresponds to the JSON property `revisionId`
        # @return [String]
        attr_accessor :revision_id
      
        # Git repository URL.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @revision_id = args[:revision_id] if args.key?(:revision_id)
          @url = args[:url] if args.key?(:url)
        end
      end
      
      # Metadata for all operations used and required for all operations
      # that created by Container Analysis Providers
      class GoogleDevtoolsContaineranalysisV1alpha1OperationMetadata
        include Google::Apis::Core::Hashable
      
        # Output only. The time this operation was created.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Output only. The time that this operation was marked completed or failed.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @end_time = args[:end_time] if args.key?(:end_time)
        end
      end
      
      # Selects a repo using a Google Cloud Platform project ID (e.g.,
      # winged-cargo-31) and a repo name within that project.
      class GoogleDevtoolsContaineranalysisV1alpha1ProjectRepoId
        include Google::Apis::Core::Hashable
      
        # The ID of the project.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # The name of the repo. Leave empty for the default repo.
        # Corresponds to the JSON property `repoName`
        # @return [String]
        attr_accessor :repo_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @project_id = args[:project_id] if args.key?(:project_id)
          @repo_name = args[:repo_name] if args.key?(:repo_name)
        end
      end
      
      # A unique identifier for a Cloud Repo.
      class GoogleDevtoolsContaineranalysisV1alpha1RepoId
        include Google::Apis::Core::Hashable
      
        # Selects a repo using a Google Cloud Platform project ID (e.g.,
        # winged-cargo-31) and a repo name within that project.
        # Corresponds to the JSON property `projectRepoId`
        # @return [Google::Apis::ContaineranalysisV1alpha1::GoogleDevtoolsContaineranalysisV1alpha1ProjectRepoId]
        attr_accessor :project_repo_id
      
        # A server-assigned, globally unique identifier.
        # Corresponds to the JSON property `uid`
        # @return [String]
        attr_accessor :uid
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @project_repo_id = args[:project_repo_id] if args.key?(:project_repo_id)
          @uid = args[:uid] if args.key?(:uid)
        end
      end
      
      # A SourceContext is a reference to a tree of files. A SourceContext together
      # with a path point to a unique revision of a single file or directory.
      class GoogleDevtoolsContaineranalysisV1alpha1SourceContext
        include Google::Apis::Core::Hashable
      
        # A CloudRepoSourceContext denotes a particular revision in a Google Cloud
        # Source Repo.
        # Corresponds to the JSON property `cloudRepo`
        # @return [Google::Apis::ContaineranalysisV1alpha1::GoogleDevtoolsContaineranalysisV1alpha1CloudRepoSourceContext]
        attr_accessor :cloud_repo
      
        # A SourceContext referring to a Gerrit project.
        # Corresponds to the JSON property `gerrit`
        # @return [Google::Apis::ContaineranalysisV1alpha1::GoogleDevtoolsContaineranalysisV1alpha1GerritSourceContext]
        attr_accessor :gerrit
      
        # A GitSourceContext denotes a particular revision in a third party Git
        # repository (e.g., GitHub).
        # Corresponds to the JSON property `git`
        # @return [Google::Apis::ContaineranalysisV1alpha1::GoogleDevtoolsContaineranalysisV1alpha1GitSourceContext]
        attr_accessor :git
      
        # Labels with user defined metadata.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cloud_repo = args[:cloud_repo] if args.key?(:cloud_repo)
          @gerrit = args[:gerrit] if args.key?(:gerrit)
          @git = args[:git] if args.key?(:git)
          @labels = args[:labels] if args.key?(:labels)
        end
      end
      
      # Container message for hash values.
      class HashProp
        include Google::Apis::Core::Hashable
      
        # The type of hash that was performed.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # The hash value.
        # Corresponds to the JSON property `value`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @type = args[:type] if args.key?(:type)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # This represents how a particular software package may be installed on
      # a system.
      class Installation
        include Google::Apis::Core::Hashable
      
        # All of the places within the filesystem versions of this package
        # have been found.
        # Corresponds to the JSON property `location`
        # @return [Array<Google::Apis::ContaineranalysisV1alpha1::Location>]
        attr_accessor :location
      
        # Output only. The name of the installed package.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @location = args[:location] if args.key?(:location)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Layer holds metadata specific to a layer of a Docker image.
      class Layer
        include Google::Apis::Core::Hashable
      
        # The recovered arguments to the Dockerfile directive.
        # Corresponds to the JSON property `arguments`
        # @return [String]
        attr_accessor :arguments
      
        # The recovered Dockerfile directive used to construct this layer.
        # Corresponds to the JSON property `directive`
        # @return [String]
        attr_accessor :directive
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @arguments = args[:arguments] if args.key?(:arguments)
          @directive = args[:directive] if args.key?(:directive)
        end
      end
      
      # Response including listed occurrences for a note.
      class ListNoteOccurrencesResponse
        include Google::Apis::Core::Hashable
      
        # Token to receive the next page of notes.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The occurrences attached to the specified note.
        # Corresponds to the JSON property `occurrences`
        # @return [Array<Google::Apis::ContaineranalysisV1alpha1::Occurrence>]
        attr_accessor :occurrences
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @occurrences = args[:occurrences] if args.key?(:occurrences)
        end
      end
      
      # Response including listed notes.
      class ListNotesResponse
        include Google::Apis::Core::Hashable
      
        # The next pagination token in the list response. It should be used as
        # page_token for the following request. An empty value means no more result.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The occurrences requested
        # Corresponds to the JSON property `notes`
        # @return [Array<Google::Apis::ContaineranalysisV1alpha1::Note>]
        attr_accessor :notes
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @notes = args[:notes] if args.key?(:notes)
        end
      end
      
      # Response including listed active occurrences.
      class ListOccurrencesResponse
        include Google::Apis::Core::Hashable
      
        # The next pagination token in the list response. It should be used as
        # `page_token` for the following request. An empty value means no more
        # results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The occurrences requested.
        # Corresponds to the JSON property `occurrences`
        # @return [Array<Google::Apis::ContaineranalysisV1alpha1::Occurrence>]
        attr_accessor :occurrences
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @occurrences = args[:occurrences] if args.key?(:occurrences)
        end
      end
      
      # A list of scan configs for the project.
      class ListScanConfigsResponse
        include Google::Apis::Core::Hashable
      
        # A page token to pass in order to get more scan configs.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The set of scan configs.
        # Corresponds to the JSON property `scanConfigs`
        # @return [Array<Google::Apis::ContaineranalysisV1alpha1::ScanConfig>]
        attr_accessor :scan_configs
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @scan_configs = args[:scan_configs] if args.key?(:scan_configs)
        end
      end
      
      # An occurrence of a particular package installation found within a
      # system's filesystem.
      # e.g. glibc was found in /var/lib/dpkg/status
      class Location
        include Google::Apis::Core::Hashable
      
        # The cpe_uri in [cpe format](https://cpe.mitre.org/specification/)
        # denoting the package manager version distributing a package.
        # Corresponds to the JSON property `cpeUri`
        # @return [String]
        attr_accessor :cpe_uri
      
        # The path from which we gathered that this package/version is installed.
        # Corresponds to the JSON property `path`
        # @return [String]
        attr_accessor :path
      
        # Version contains structured information about the version of the package.
        # For a discussion of this in Debian/Ubuntu:
        # http://serverfault.com/questions/604541/debian-packages-version-convention
        # For a discussion of this in Redhat/Fedora/Centos:
        # http://blog.jasonantman.com/2014/07/how-yum-and-rpm-compare-versions/
        # Corresponds to the JSON property `version`
        # @return [Google::Apis::ContaineranalysisV1alpha1::Version]
        attr_accessor :version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cpe_uri = args[:cpe_uri] if args.key?(:cpe_uri)
          @path = args[:path] if args.key?(:path)
          @version = args[:version] if args.key?(:version)
        end
      end
      
      # Provides a detailed description of a `Note`.
      class Note
        include Google::Apis::Core::Hashable
      
        # Note kind that represents a logical attestation "role" or "authority".  For
        # example, an organization might have one `AttestationAuthority` for "QA" and
        # one for "build".  This Note is intended to act strictly as a grouping
        # mechanism for the attached Occurrences (Attestations).  This grouping
        # mechanism also provides a security boundary, since IAM ACLs gate the ability
        # for a principle to attach an Occurrence to a given Note.  It also provides a
        # single point of lookup to find all attached Attestation Occurrences, even if
        # they don't all live in the same project.
        # Corresponds to the JSON property `attestationAuthority`
        # @return [Google::Apis::ContaineranalysisV1alpha1::AttestationAuthority]
        attr_accessor :attestation_authority
      
        # Basis describes the base image portion (Note) of the DockerImage
        # relationship.  Linked occurrences are derived from this or an
        # equivalent image via:
        # FROM <Basis.resource_url>
        # Or an equivalent reference, e.g. a tag of the resource_url.
        # Corresponds to the JSON property `baseImage`
        # @return [Google::Apis::ContaineranalysisV1alpha1::Basis]
        attr_accessor :base_image
      
        # Note holding the version of the provider's builder and the signature of
        # the provenance message in linked BuildDetails.
        # Corresponds to the JSON property `buildType`
        # @return [Google::Apis::ContaineranalysisV1alpha1::BuildType]
        attr_accessor :build_type
      
        # Output only. The time this note was created. This field can be used as a
        # filter in list requests.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # An artifact that can be deployed in some runtime.
        # Corresponds to the JSON property `deployable`
        # @return [Google::Apis::ContaineranalysisV1alpha1::Deployable]
        attr_accessor :deployable
      
        # A note that indicates a type of analysis a provider would perform. This note
        # exists in a provider's project. A `Discovery` occurrence is created in a
        # consumer's project at the start of analysis. The occurrence's operation will
        # indicate the status of the analysis. Absence of an occurrence linked to this
        # note for a resource indicates that analysis hasn't started.
        # Corresponds to the JSON property `discovery`
        # @return [Google::Apis::ContaineranalysisV1alpha1::Discovery]
        attr_accessor :discovery
      
        # Time of expiration for this note, null if note does not expire.
        # Corresponds to the JSON property `expirationTime`
        # @return [String]
        attr_accessor :expiration_time
      
        # Output only. This explicitly denotes which kind of note is specified. This
        # field can be used as a filter in list requests.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # A detailed description of this `Note`.
        # Corresponds to the JSON property `longDescription`
        # @return [String]
        attr_accessor :long_description
      
        # The name of the note in the form
        # "projects/`provider_project_id`/notes/`NOTE_ID`"
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # This represents a particular package that is distributed over
        # various channels.
        # e.g. glibc (aka libc6) is distributed by many, at various versions.
        # Corresponds to the JSON property `package`
        # @return [Google::Apis::ContaineranalysisV1alpha1::Package]
        attr_accessor :package
      
        # URLs associated with this note
        # Corresponds to the JSON property `relatedUrl`
        # @return [Array<Google::Apis::ContaineranalysisV1alpha1::RelatedUrl>]
        attr_accessor :related_url
      
        # A one sentence description of this `Note`.
        # Corresponds to the JSON property `shortDescription`
        # @return [String]
        attr_accessor :short_description
      
        # Output only. The time this note was last updated. This field can be used as
        # a filter in list requests.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        # An Upgrade Note represents a potential upgrade of a package to a given
        # version. For each package version combination (i.e. bash 4.0, bash 4.1,
        # bash 4.1.2), there will be a Upgrade Note.
        # Corresponds to the JSON property `upgrade`
        # @return [Google::Apis::ContaineranalysisV1alpha1::UpgradeNote]
        attr_accessor :upgrade
      
        # VulnerabilityType provides metadata about a security vulnerability.
        # Corresponds to the JSON property `vulnerabilityType`
        # @return [Google::Apis::ContaineranalysisV1alpha1::VulnerabilityType]
        attr_accessor :vulnerability_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @attestation_authority = args[:attestation_authority] if args.key?(:attestation_authority)
          @base_image = args[:base_image] if args.key?(:base_image)
          @build_type = args[:build_type] if args.key?(:build_type)
          @create_time = args[:create_time] if args.key?(:create_time)
          @deployable = args[:deployable] if args.key?(:deployable)
          @discovery = args[:discovery] if args.key?(:discovery)
          @expiration_time = args[:expiration_time] if args.key?(:expiration_time)
          @kind = args[:kind] if args.key?(:kind)
          @long_description = args[:long_description] if args.key?(:long_description)
          @name = args[:name] if args.key?(:name)
          @package = args[:package] if args.key?(:package)
          @related_url = args[:related_url] if args.key?(:related_url)
          @short_description = args[:short_description] if args.key?(:short_description)
          @update_time = args[:update_time] if args.key?(:update_time)
          @upgrade = args[:upgrade] if args.key?(:upgrade)
          @vulnerability_type = args[:vulnerability_type] if args.key?(:vulnerability_type)
        end
      end
      
      # `Occurrence` includes information about analysis occurrences for an image.
      class Occurrence
        include Google::Apis::Core::Hashable
      
        # Occurrence that represents a single "attestation".  The authenticity of an
        # Attestation can be verified using the attached signature. If the verifier
        # trusts the public key of the signer, then verifying the signature is
        # sufficient to establish trust.  In this circumstance, the
        # AttestationAuthority to which this Attestation is attached is primarily
        # useful for look-up (how to find this Attestation if you already know the
        # Authority and artifact to be verified) and intent (which authority was this
        # attestation intended to sign for).
        # Corresponds to the JSON property `attestation`
        # @return [Google::Apis::ContaineranalysisV1alpha1::Attestation]
        attr_accessor :attestation
      
        # Message encapsulating build provenance details.
        # Corresponds to the JSON property `buildDetails`
        # @return [Google::Apis::ContaineranalysisV1alpha1::BuildDetails]
        attr_accessor :build_details
      
        # Output only. The time this `Occurrence` was created.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # The period during which some deployable was active in a runtime.
        # Corresponds to the JSON property `deployment`
        # @return [Google::Apis::ContaineranalysisV1alpha1::Deployment]
        attr_accessor :deployment
      
        # Derived describes the derived image portion (Occurrence) of the
        # DockerImage relationship.  This image would be produced from a Dockerfile
        # with FROM <DockerImage.Basis in attached Note>.
        # Corresponds to the JSON property `derivedImage`
        # @return [Google::Apis::ContaineranalysisV1alpha1::Derived]
        attr_accessor :derived_image
      
        # Provides information about the scan status of a discovered resource.
        # Corresponds to the JSON property `discovered`
        # @return [Google::Apis::ContaineranalysisV1alpha1::Discovered]
        attr_accessor :discovered
      
        # This represents how a particular software package may be installed on
        # a system.
        # Corresponds to the JSON property `installation`
        # @return [Google::Apis::ContaineranalysisV1alpha1::Installation]
        attr_accessor :installation
      
        # Output only. This explicitly denotes which of the `Occurrence` details are
        # specified. This field can be used as a filter in list requests.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Output only. The name of the `Occurrence` in the form
        # "projects/`project_id`/occurrences/`OCCURRENCE_ID`"
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # An analysis note associated with this image, in the form
        # "providers/`provider_id`/notes/`NOTE_ID`"
        # This field can be used as a filter in list requests.
        # Corresponds to the JSON property `noteName`
        # @return [String]
        attr_accessor :note_name
      
        # A description of actions that can be taken to remedy the `Note`
        # Corresponds to the JSON property `remediation`
        # @return [String]
        attr_accessor :remediation
      
        # Resource is an entity that can have metadata. E.g., a Docker image.
        # Corresponds to the JSON property `resource`
        # @return [Google::Apis::ContaineranalysisV1alpha1::Resource]
        attr_accessor :resource
      
        # The unique URL of the image or the container for which the `Occurrence`
        # applies. For example, https://gcr.io/project/image@sha256:foo This field
        # can be used as a filter in list requests.
        # Corresponds to the JSON property `resourceUrl`
        # @return [String]
        attr_accessor :resource_url
      
        # Output only. The time this `Occurrence` was last updated.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        # An Upgrade Occurrence represents that a specific resource_url could install a
        # specific upgrade. This presence is supplied via local sources (i.e. it is
        # present in the mirror and the running system has noticed its availability).
        # Corresponds to the JSON property `upgrade`
        # @return [Google::Apis::ContaineranalysisV1alpha1::UpgradeOccurrence]
        attr_accessor :upgrade
      
        # Used by Occurrence to point to where the vulnerability exists and how
        # to fix it.
        # Corresponds to the JSON property `vulnerabilityDetails`
        # @return [Google::Apis::ContaineranalysisV1alpha1::VulnerabilityDetails]
        attr_accessor :vulnerability_details
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @attestation = args[:attestation] if args.key?(:attestation)
          @build_details = args[:build_details] if args.key?(:build_details)
          @create_time = args[:create_time] if args.key?(:create_time)
          @deployment = args[:deployment] if args.key?(:deployment)
          @derived_image = args[:derived_image] if args.key?(:derived_image)
          @discovered = args[:discovered] if args.key?(:discovered)
          @installation = args[:installation] if args.key?(:installation)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
          @note_name = args[:note_name] if args.key?(:note_name)
          @remediation = args[:remediation] if args.key?(:remediation)
          @resource = args[:resource] if args.key?(:resource)
          @resource_url = args[:resource_url] if args.key?(:resource_url)
          @update_time = args[:update_time] if args.key?(:update_time)
          @upgrade = args[:upgrade] if args.key?(:upgrade)
          @vulnerability_details = args[:vulnerability_details] if args.key?(:vulnerability_details)
        end
      end
      
      # This resource represents a long-running operation that is the result of a
      # network API call.
      class Operation
        include Google::Apis::Core::Hashable
      
        # If the value is `false`, it means the operation is still in progress.
        # If `true`, the operation is completed, and either `error` or `response` is
        # available.
        # Corresponds to the JSON property `done`
        # @return [Boolean]
        attr_accessor :done
        alias_method :done?, :done
      
        # The `Status` type defines a logical error model that is suitable for
        # different programming environments, including REST APIs and RPC APIs. It is
        # used by [gRPC](https://github.com/grpc). Each `Status` message contains
        # three pieces of data: error code, error message, and error details.
        # You can find out more about this error model and how to work with it in the
        # [API Design Guide](https://cloud.google.com/apis/design/errors).
        # Corresponds to the JSON property `error`
        # @return [Google::Apis::ContaineranalysisV1alpha1::Status]
        attr_accessor :error
      
        # Service-specific metadata associated with the operation.  It typically
        # contains progress information and common metadata such as create time.
        # Some services might not provide such metadata.  Any method that returns a
        # long-running operation should document the metadata type, if any.
        # Corresponds to the JSON property `metadata`
        # @return [Hash<String,Object>]
        attr_accessor :metadata
      
        # The server-assigned name, which is only unique within the same service that
        # originally returns it. If you use the default HTTP mapping, the
        # `name` should be a resource name ending with `operations/`unique_id``.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The normal response of the operation in case of success.  If the original
        # method returns no data on success, such as `Delete`, the response is
        # `google.protobuf.Empty`.  If the original method is standard
        # `Get`/`Create`/`Update`, the response should be the resource.  For other
        # methods, the response should have the type `XxxResponse`, where `Xxx`
        # is the original method name.  For example, if the original method name
        # is `TakeSnapshot()`, the inferred response type is
        # `TakeSnapshotResponse`.
        # Corresponds to the JSON property `response`
        # @return [Hash<String,Object>]
        attr_accessor :response
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @done = args[:done] if args.key?(:done)
          @error = args[:error] if args.key?(:error)
          @metadata = args[:metadata] if args.key?(:metadata)
          @name = args[:name] if args.key?(:name)
          @response = args[:response] if args.key?(:response)
        end
      end
      
      # This represents a particular package that is distributed over
      # various channels.
      # e.g. glibc (aka libc6) is distributed by many, at various versions.
      class Package
        include Google::Apis::Core::Hashable
      
        # The various channels by which a package is distributed.
        # Corresponds to the JSON property `distribution`
        # @return [Array<Google::Apis::ContaineranalysisV1alpha1::Distribution>]
        attr_accessor :distribution
      
        # The name of the package.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @distribution = args[:distribution] if args.key?(:distribution)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # This message wraps a location affected by a vulnerability and its
      # associated fix (if one is available).
      class PackageIssue
        include Google::Apis::Core::Hashable
      
        # The location of the vulnerability
        # Corresponds to the JSON property `affectedLocation`
        # @return [Google::Apis::ContaineranalysisV1alpha1::VulnerabilityLocation]
        attr_accessor :affected_location
      
        # The location of the vulnerability
        # Corresponds to the JSON property `fixedLocation`
        # @return [Google::Apis::ContaineranalysisV1alpha1::VulnerabilityLocation]
        attr_accessor :fixed_location
      
        # 
        # Corresponds to the JSON property `severityName`
        # @return [String]
        attr_accessor :severity_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @affected_location = args[:affected_location] if args.key?(:affected_location)
          @fixed_location = args[:fixed_location] if args.key?(:fixed_location)
          @severity_name = args[:severity_name] if args.key?(:severity_name)
        end
      end
      
      # An attestation wrapper with a PGP-compatible signature.
      # This message only supports `ATTACHED` signatures, where the payload that is
      # signed is included alongside the signature itself in the same file.
      class PgpSignedAttestation
        include Google::Apis::Core::Hashable
      
        # Type (for example schema) of the attestation payload that was signed.
        # The verifier must ensure that the provided type is one that the verifier
        # supports, and that the attestation payload is a valid instantiation of that
        # type (for example by validating a JSON schema).
        # Corresponds to the JSON property `contentType`
        # @return [String]
        attr_accessor :content_type
      
        # The cryptographic fingerprint of the key used to generate the signature,
        # as output by, e.g. `gpg --list-keys`. This should be the version 4, full
        # 160-bit fingerprint, expressed as a 40 character hexadecimal string. See
        # https://tools.ietf.org/html/rfc4880#section-12.2 for details.
        # Implementations may choose to acknowledge "LONG", "SHORT", or other
        # abbreviated key IDs, but only the full fingerprint is guaranteed to work.
        # In gpg, the full fingerprint can be retrieved from the `fpr` field
        # returned when calling --list-keys with --with-colons.  For example:
        # ```
        # gpg --with-colons --with-fingerprint --force-v4-certs \
        # --list-keys attester@example.com
        # tru::1:1513631572:0:3:1:5
        # pub:...<SNIP>...
        # fpr:::::::::24FF6481B76AC91E66A00AC657A93A81EF3AE6FB:
        # ```
        # Above, the fingerprint is `24FF6481B76AC91E66A00AC657A93A81EF3AE6FB`.
        # Corresponds to the JSON property `pgpKeyId`
        # @return [String]
        attr_accessor :pgp_key_id
      
        # The raw content of the signature, as output by GNU Privacy Guard (GPG) or
        # equivalent.  Since this message only supports attached signatures, the
        # payload that was signed must be attached. While the signature format
        # supported is dependent on the verification implementation, currently only
        # ASCII-armored (`--armor` to gpg), non-clearsigned (`--sign` rather than
        # `--clearsign` to gpg) are supported. Concretely, `gpg --sign --armor
        # --output=signature.gpg payload.json` will create the signature content
        # expected in this field in `signature.gpg` for the `payload.json`
        # attestation payload.
        # Corresponds to the JSON property `signature`
        # @return [String]
        attr_accessor :signature
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content_type = args[:content_type] if args.key?(:content_type)
          @pgp_key_id = args[:pgp_key_id] if args.key?(:pgp_key_id)
          @signature = args[:signature] if args.key?(:signature)
        end
      end
      
      # Defines an Identity and Access Management (IAM) policy. It is used to
      # specify access control policies for Cloud Platform resources.
      # A `Policy` is a collection of `bindings`. A `binding` binds one or more
      # `members` to a single `role`. Members can be user accounts, service accounts,
      # Google groups, and domains (such as G Suite). A `role` is a named list of
      # permissions (defined by IAM or configured by users). A `binding` can
      # optionally specify a `condition`, which is a logic expression that further
      # constrains the role binding based on attributes about the request and/or
      # target resource.
      # **JSON Example**
      # `
      # "bindings": [
      # `
      # "role": "roles/resourcemanager.organizationAdmin",
      # "members": [
      # "user:mike@example.com",
      # "group:admins@example.com",
      # "domain:google.com",
      # "serviceAccount:my-project-id@appspot.gserviceaccount.com"
      # ]
      # `,
      # `
      # "role": "roles/resourcemanager.organizationViewer",
      # "members": ["user:eve@example.com"],
      # "condition": `
      # "title": "expirable access",
      # "description": "Does not grant access after Sep 2020",
      # "expression": "request.time <
      # timestamp('2020-10-01T00:00:00.000Z')",
      # `
      # `
      # ]
      # `
      # **YAML Example**
      # bindings:
      # - members:
      # - user:mike@example.com
      # - group:admins@example.com
      # - domain:google.com
      # - serviceAccount:my-project-id@appspot.gserviceaccount.com
      # role: roles/resourcemanager.organizationAdmin
      # - members:
      # - user:eve@example.com
      # role: roles/resourcemanager.organizationViewer
      # condition:
      # title: expirable access
      # description: Does not grant access after Sep 2020
      # expression: request.time < timestamp('2020-10-01T00:00:00.000Z')
      # For a description of IAM and its features, see the
      # [IAM developer's guide](https://cloud.google.com/iam/docs).
      class Policy
        include Google::Apis::Core::Hashable
      
        # Associates a list of `members` to a `role`. Optionally may specify a
        # `condition` that determines when binding is in effect.
        # `bindings` with no members will result in an error.
        # Corresponds to the JSON property `bindings`
        # @return [Array<Google::Apis::ContaineranalysisV1alpha1::Binding>]
        attr_accessor :bindings
      
        # `etag` is used for optimistic concurrency control as a way to help
        # prevent simultaneous updates of a policy from overwriting each other.
        # It is strongly suggested that systems make use of the `etag` in the
        # read-modify-write cycle to perform policy updates in order to avoid race
        # conditions: An `etag` is returned in the response to `getIamPolicy`, and
        # systems are expected to put that etag in the request to `setIamPolicy` to
        # ensure that their change will be applied to the same version of the policy.
        # If no `etag` is provided in the call to `setIamPolicy`, then the existing
        # policy is overwritten. Due to blind-set semantics of an etag-less policy,
        # 'setIamPolicy' will not fail even if either of incoming or stored policy
        # does not meet the version requirements.
        # Corresponds to the JSON property `etag`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :etag
      
        # Specifies the format of the policy.
        # Valid values are 0, 1, and 3. Requests specifying an invalid value will be
        # rejected.
        # Operations affecting conditional bindings must specify version 3. This can
        # be either setting a conditional policy, modifying a conditional binding,
        # or removing a conditional binding from the stored conditional policy.
        # Operations on non-conditional policies may specify any valid value or
        # leave the field unset.
        # If no etag is provided in the call to `setIamPolicy`, any version
        # compliance checks on the incoming and/or stored policy is skipped.
        # Corresponds to the JSON property `version`
        # @return [Fixnum]
        attr_accessor :version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bindings = args[:bindings] if args.key?(:bindings)
          @etag = args[:etag] if args.key?(:etag)
          @version = args[:version] if args.key?(:version)
        end
      end
      
      # Metadata for any related URL information
      class RelatedUrl
        include Google::Apis::Core::Hashable
      
        # Label to describe usage of the URL
        # Corresponds to the JSON property `label`
        # @return [String]
        attr_accessor :label
      
        # Specific URL to associate with the note
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @label = args[:label] if args.key?(:label)
          @url = args[:url] if args.key?(:url)
        end
      end
      
      # RepoSource describes the location of the source in a Google Cloud Source
      # Repository.
      class RepoSource
        include Google::Apis::Core::Hashable
      
        # Name of the branch to build.
        # Corresponds to the JSON property `branchName`
        # @return [String]
        attr_accessor :branch_name
      
        # Explicit commit SHA to build.
        # Corresponds to the JSON property `commitSha`
        # @return [String]
        attr_accessor :commit_sha
      
        # ID of the project that owns the repo.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # Name of the repo.
        # Corresponds to the JSON property `repoName`
        # @return [String]
        attr_accessor :repo_name
      
        # Name of the tag to build.
        # Corresponds to the JSON property `tagName`
        # @return [String]
        attr_accessor :tag_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @branch_name = args[:branch_name] if args.key?(:branch_name)
          @commit_sha = args[:commit_sha] if args.key?(:commit_sha)
          @project_id = args[:project_id] if args.key?(:project_id)
          @repo_name = args[:repo_name] if args.key?(:repo_name)
          @tag_name = args[:tag_name] if args.key?(:tag_name)
        end
      end
      
      # Resource is an entity that can have metadata. E.g., a Docker image.
      class Resource
        include Google::Apis::Core::Hashable
      
        # Container message for hash values.
        # Corresponds to the JSON property `contentHash`
        # @return [Google::Apis::ContaineranalysisV1alpha1::HashProp]
        attr_accessor :content_hash
      
        # The name of the resource. E.g., the name of a Docker image - "Debian".
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The unique URI of the resource. E.g.,
        # "https://gcr.io/project/image@sha256:foo" for a Docker image.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content_hash = args[:content_hash] if args.key?(:content_hash)
          @name = args[:name] if args.key?(:name)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # Indicates various scans and whether they are turned on or off.
      class ScanConfig
        include Google::Apis::Core::Hashable
      
        # Output only. The time this scan config was created.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Output only. A human-readable description of what the `ScanConfig` does.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Indicates whether the Scan is enabled.
        # Corresponds to the JSON property `enabled`
        # @return [Boolean]
        attr_accessor :enabled
        alias_method :enabled?, :enabled
      
        # Output only. The name of the ScanConfig in the form
        # “projects/`project_id`/scanConfigs/`scan_config_id`".
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Output only. The time this scan config was last updated.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @description = args[:description] if args.key?(:description)
          @enabled = args[:enabled] if args.key?(:enabled)
          @name = args[:name] if args.key?(:name)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Request message for `SetIamPolicy` method.
      class SetIamPolicyRequest
        include Google::Apis::Core::Hashable
      
        # Defines an Identity and Access Management (IAM) policy. It is used to
        # specify access control policies for Cloud Platform resources.
        # A `Policy` is a collection of `bindings`. A `binding` binds one or more
        # `members` to a single `role`. Members can be user accounts, service accounts,
        # Google groups, and domains (such as G Suite). A `role` is a named list of
        # permissions (defined by IAM or configured by users). A `binding` can
        # optionally specify a `condition`, which is a logic expression that further
        # constrains the role binding based on attributes about the request and/or
        # target resource.
        # **JSON Example**
        # `
        # "bindings": [
        # `
        # "role": "roles/resourcemanager.organizationAdmin",
        # "members": [
        # "user:mike@example.com",
        # "group:admins@example.com",
        # "domain:google.com",
        # "serviceAccount:my-project-id@appspot.gserviceaccount.com"
        # ]
        # `,
        # `
        # "role": "roles/resourcemanager.organizationViewer",
        # "members": ["user:eve@example.com"],
        # "condition": `
        # "title": "expirable access",
        # "description": "Does not grant access after Sep 2020",
        # "expression": "request.time <
        # timestamp('2020-10-01T00:00:00.000Z')",
        # `
        # `
        # ]
        # `
        # **YAML Example**
        # bindings:
        # - members:
        # - user:mike@example.com
        # - group:admins@example.com
        # - domain:google.com
        # - serviceAccount:my-project-id@appspot.gserviceaccount.com
        # role: roles/resourcemanager.organizationAdmin
        # - members:
        # - user:eve@example.com
        # role: roles/resourcemanager.organizationViewer
        # condition:
        # title: expirable access
        # description: Does not grant access after Sep 2020
        # expression: request.time < timestamp('2020-10-01T00:00:00.000Z')
        # For a description of IAM and its features, see the
        # [IAM developer's guide](https://cloud.google.com/iam/docs).
        # Corresponds to the JSON property `policy`
        # @return [Google::Apis::ContaineranalysisV1alpha1::Policy]
        attr_accessor :policy
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @policy = args[:policy] if args.key?(:policy)
        end
      end
      
      # The number of occurrences created for a specific severity.
      class SeverityCount
        include Google::Apis::Core::Hashable
      
        # The number of occurrences with the severity.
        # Corresponds to the JSON property `count`
        # @return [Fixnum]
        attr_accessor :count
      
        # The severity of the occurrences.
        # Corresponds to the JSON property `severity`
        # @return [String]
        attr_accessor :severity
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @count = args[:count] if args.key?(:count)
          @severity = args[:severity] if args.key?(:severity)
        end
      end
      
      # Source describes the location of the source used for the build.
      class Source
        include Google::Apis::Core::Hashable
      
        # If provided, some of the source code used for the build may be found in
        # these locations, in the case where the source repository had multiple
        # remotes or submodules. This list will not include the context specified in
        # the context field.
        # Corresponds to the JSON property `additionalContexts`
        # @return [Array<Google::Apis::ContaineranalysisV1alpha1::GoogleDevtoolsContaineranalysisV1alpha1SourceContext>]
        attr_accessor :additional_contexts
      
        # StorageSource describes the location of the source in an archive file in
        # Google Cloud Storage.
        # Corresponds to the JSON property `artifactStorageSource`
        # @return [Google::Apis::ContaineranalysisV1alpha1::StorageSource]
        attr_accessor :artifact_storage_source
      
        # A SourceContext is a reference to a tree of files. A SourceContext together
        # with a path point to a unique revision of a single file or directory.
        # Corresponds to the JSON property `context`
        # @return [Google::Apis::ContaineranalysisV1alpha1::GoogleDevtoolsContaineranalysisV1alpha1SourceContext]
        attr_accessor :context
      
        # Hash(es) of the build source, which can be used to verify that the original
        # source integrity was maintained in the build.
        # The keys to this map are file paths used as build source and the values
        # contain the hash values for those files.
        # If the build source came in a single package such as a gzipped tarfile
        # (.tar.gz), the FileHash will be for the single path to that file.
        # Corresponds to the JSON property `fileHashes`
        # @return [Hash<String,Google::Apis::ContaineranalysisV1alpha1::FileHashes>]
        attr_accessor :file_hashes
      
        # RepoSource describes the location of the source in a Google Cloud Source
        # Repository.
        # Corresponds to the JSON property `repoSource`
        # @return [Google::Apis::ContaineranalysisV1alpha1::RepoSource]
        attr_accessor :repo_source
      
        # StorageSource describes the location of the source in an archive file in
        # Google Cloud Storage.
        # Corresponds to the JSON property `storageSource`
        # @return [Google::Apis::ContaineranalysisV1alpha1::StorageSource]
        attr_accessor :storage_source
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @additional_contexts = args[:additional_contexts] if args.key?(:additional_contexts)
          @artifact_storage_source = args[:artifact_storage_source] if args.key?(:artifact_storage_source)
          @context = args[:context] if args.key?(:context)
          @file_hashes = args[:file_hashes] if args.key?(:file_hashes)
          @repo_source = args[:repo_source] if args.key?(:repo_source)
          @storage_source = args[:storage_source] if args.key?(:storage_source)
        end
      end
      
      # The `Status` type defines a logical error model that is suitable for
      # different programming environments, including REST APIs and RPC APIs. It is
      # used by [gRPC](https://github.com/grpc). Each `Status` message contains
      # three pieces of data: error code, error message, and error details.
      # You can find out more about this error model and how to work with it in the
      # [API Design Guide](https://cloud.google.com/apis/design/errors).
      class Status
        include Google::Apis::Core::Hashable
      
        # The status code, which should be an enum value of google.rpc.Code.
        # Corresponds to the JSON property `code`
        # @return [Fixnum]
        attr_accessor :code
      
        # A list of messages that carry the error details.  There is a common set of
        # message types for APIs to use.
        # Corresponds to the JSON property `details`
        # @return [Array<Hash<String,Object>>]
        attr_accessor :details
      
        # A developer-facing error message, which should be in English. Any
        # user-facing error message should be localized and sent in the
        # google.rpc.Status.details field, or localized by the client.
        # Corresponds to the JSON property `message`
        # @return [String]
        attr_accessor :message
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @code = args[:code] if args.key?(:code)
          @details = args[:details] if args.key?(:details)
          @message = args[:message] if args.key?(:message)
        end
      end
      
      # StorageSource describes the location of the source in an archive file in
      # Google Cloud Storage.
      class StorageSource
        include Google::Apis::Core::Hashable
      
        # Google Cloud Storage bucket containing source (see [Bucket Name
        # Requirements]
        # (https://cloud.google.com/storage/docs/bucket-naming#requirements)).
        # Corresponds to the JSON property `bucket`
        # @return [String]
        attr_accessor :bucket
      
        # Google Cloud Storage generation for the object.
        # Corresponds to the JSON property `generation`
        # @return [Fixnum]
        attr_accessor :generation
      
        # Google Cloud Storage object containing source.
        # Corresponds to the JSON property `object`
        # @return [String]
        attr_accessor :object
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bucket = args[:bucket] if args.key?(:bucket)
          @generation = args[:generation] if args.key?(:generation)
          @object = args[:object] if args.key?(:object)
        end
      end
      
      # Request message for `TestIamPermissions` method.
      class TestIamPermissionsRequest
        include Google::Apis::Core::Hashable
      
        # The set of permissions to check for the `resource`. Permissions with
        # wildcards (such as '*' or 'storage.*') are not allowed. For more
        # information see
        # [IAM Overview](https://cloud.google.com/iam/docs/overview#permissions).
        # Corresponds to the JSON property `permissions`
        # @return [Array<String>]
        attr_accessor :permissions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @permissions = args[:permissions] if args.key?(:permissions)
        end
      end
      
      # Response message for `TestIamPermissions` method.
      class TestIamPermissionsResponse
        include Google::Apis::Core::Hashable
      
        # A subset of `TestPermissionsRequest.permissions` that the caller is
        # allowed.
        # Corresponds to the JSON property `permissions`
        # @return [Array<String>]
        attr_accessor :permissions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @permissions = args[:permissions] if args.key?(:permissions)
        end
      end
      
      # Request for updating an existing operation
      class UpdateOperationRequest
        include Google::Apis::Core::Hashable
      
        # This resource represents a long-running operation that is the result of a
        # network API call.
        # Corresponds to the JSON property `operation`
        # @return [Google::Apis::ContaineranalysisV1alpha1::Operation]
        attr_accessor :operation
      
        # The fields to update.
        # Corresponds to the JSON property `updateMask`
        # @return [String]
        attr_accessor :update_mask
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @operation = args[:operation] if args.key?(:operation)
          @update_mask = args[:update_mask] if args.key?(:update_mask)
        end
      end
      
      # The Upgrade Distribution represents metadata about the Upgrade for each
      # operating system (CPE). Some distributions have additional metadata around
      # updates, classifying them into various categories and severities.
      class UpgradeDistribution
        include Google::Apis::Core::Hashable
      
        # The operating system classification of this Upgrade, as specified by the
        # upstream operating system upgrade feed.
        # Corresponds to the JSON property `classification`
        # @return [String]
        attr_accessor :classification
      
        # Required - The specific operating system this metadata applies to. See
        # https://cpe.mitre.org/specification/.
        # Corresponds to the JSON property `cpeUri`
        # @return [String]
        attr_accessor :cpe_uri
      
        # The cve that would be resolved by this upgrade.
        # Corresponds to the JSON property `cve`
        # @return [Array<String>]
        attr_accessor :cve
      
        # The severity as specified by the upstream operating system.
        # Corresponds to the JSON property `severity`
        # @return [String]
        attr_accessor :severity
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @classification = args[:classification] if args.key?(:classification)
          @cpe_uri = args[:cpe_uri] if args.key?(:cpe_uri)
          @cve = args[:cve] if args.key?(:cve)
          @severity = args[:severity] if args.key?(:severity)
        end
      end
      
      # An Upgrade Note represents a potential upgrade of a package to a given
      # version. For each package version combination (i.e. bash 4.0, bash 4.1,
      # bash 4.1.2), there will be a Upgrade Note.
      class UpgradeNote
        include Google::Apis::Core::Hashable
      
        # Metadata about the upgrade for each specific operating system.
        # Corresponds to the JSON property `distributions`
        # @return [Array<Google::Apis::ContaineranalysisV1alpha1::UpgradeDistribution>]
        attr_accessor :distributions
      
        # Required - The package this Upgrade is for.
        # Corresponds to the JSON property `package`
        # @return [String]
        attr_accessor :package
      
        # Version contains structured information about the version of the package.
        # For a discussion of this in Debian/Ubuntu:
        # http://serverfault.com/questions/604541/debian-packages-version-convention
        # For a discussion of this in Redhat/Fedora/Centos:
        # http://blog.jasonantman.com/2014/07/how-yum-and-rpm-compare-versions/
        # Corresponds to the JSON property `version`
        # @return [Google::Apis::ContaineranalysisV1alpha1::Version]
        attr_accessor :version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @distributions = args[:distributions] if args.key?(:distributions)
          @package = args[:package] if args.key?(:package)
          @version = args[:version] if args.key?(:version)
        end
      end
      
      # An Upgrade Occurrence represents that a specific resource_url could install a
      # specific upgrade. This presence is supplied via local sources (i.e. it is
      # present in the mirror and the running system has noticed its availability).
      class UpgradeOccurrence
        include Google::Apis::Core::Hashable
      
        # The Upgrade Distribution represents metadata about the Upgrade for each
        # operating system (CPE). Some distributions have additional metadata around
        # updates, classifying them into various categories and severities.
        # Corresponds to the JSON property `distribution`
        # @return [Google::Apis::ContaineranalysisV1alpha1::UpgradeDistribution]
        attr_accessor :distribution
      
        # Required - The package this Upgrade is for.
        # Corresponds to the JSON property `package`
        # @return [String]
        attr_accessor :package
      
        # Version contains structured information about the version of the package.
        # For a discussion of this in Debian/Ubuntu:
        # http://serverfault.com/questions/604541/debian-packages-version-convention
        # For a discussion of this in Redhat/Fedora/Centos:
        # http://blog.jasonantman.com/2014/07/how-yum-and-rpm-compare-versions/
        # Corresponds to the JSON property `parsedVersion`
        # @return [Google::Apis::ContaineranalysisV1alpha1::Version]
        attr_accessor :parsed_version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @distribution = args[:distribution] if args.key?(:distribution)
          @package = args[:package] if args.key?(:package)
          @parsed_version = args[:parsed_version] if args.key?(:parsed_version)
        end
      end
      
      # Version contains structured information about the version of the package.
      # For a discussion of this in Debian/Ubuntu:
      # http://serverfault.com/questions/604541/debian-packages-version-convention
      # For a discussion of this in Redhat/Fedora/Centos:
      # http://blog.jasonantman.com/2014/07/how-yum-and-rpm-compare-versions/
      class Version
        include Google::Apis::Core::Hashable
      
        # Used to correct mistakes in the version numbering scheme.
        # Corresponds to the JSON property `epoch`
        # @return [Fixnum]
        attr_accessor :epoch
      
        # Distinguish between sentinel MIN/MAX versions and normal versions.
        # If kind is not NORMAL, then the other fields are ignored.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The main part of the version name.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The iteration of the package build from the above version.
        # Corresponds to the JSON property `revision`
        # @return [String]
        attr_accessor :revision
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @epoch = args[:epoch] if args.key?(:epoch)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
          @revision = args[:revision] if args.key?(:revision)
        end
      end
      
      # Used by Occurrence to point to where the vulnerability exists and how
      # to fix it.
      class VulnerabilityDetails
        include Google::Apis::Core::Hashable
      
        # Output only. The CVSS score of this vulnerability. CVSS score is on a
        # scale of 0-10 where 0 indicates low severity and 10 indicates high
        # severity.
        # Corresponds to the JSON property `cvssScore`
        # @return [Float]
        attr_accessor :cvss_score
      
        # The distro assigned severity for this vulnerability when that is
        # available and note provider assigned severity when distro has not yet
        # assigned a severity for this vulnerability.
        # Corresponds to the JSON property `effectiveSeverity`
        # @return [String]
        attr_accessor :effective_severity
      
        # The set of affected locations and their fixes (if available) within
        # the associated resource.
        # Corresponds to the JSON property `packageIssue`
        # @return [Array<Google::Apis::ContaineranalysisV1alpha1::PackageIssue>]
        attr_accessor :package_issue
      
        # Output only. The note provider assigned Severity of the vulnerability.
        # Corresponds to the JSON property `severity`
        # @return [String]
        attr_accessor :severity
      
        # The type of package; whether native or non native(ruby gems,
        # node.js packages etc)
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cvss_score = args[:cvss_score] if args.key?(:cvss_score)
          @effective_severity = args[:effective_severity] if args.key?(:effective_severity)
          @package_issue = args[:package_issue] if args.key?(:package_issue)
          @severity = args[:severity] if args.key?(:severity)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # The location of the vulnerability
      class VulnerabilityLocation
        include Google::Apis::Core::Hashable
      
        # The cpe_uri in [cpe format] (https://cpe.mitre.org/specification/)
        # format. Examples include distro or storage location for vulnerable jar.
        # This field can be used as a filter in list requests.
        # Corresponds to the JSON property `cpeUri`
        # @return [String]
        attr_accessor :cpe_uri
      
        # The package being described.
        # Corresponds to the JSON property `package`
        # @return [String]
        attr_accessor :package
      
        # Version contains structured information about the version of the package.
        # For a discussion of this in Debian/Ubuntu:
        # http://serverfault.com/questions/604541/debian-packages-version-convention
        # For a discussion of this in Redhat/Fedora/Centos:
        # http://blog.jasonantman.com/2014/07/how-yum-and-rpm-compare-versions/
        # Corresponds to the JSON property `version`
        # @return [Google::Apis::ContaineranalysisV1alpha1::Version]
        attr_accessor :version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cpe_uri = args[:cpe_uri] if args.key?(:cpe_uri)
          @package = args[:package] if args.key?(:package)
          @version = args[:version] if args.key?(:version)
        end
      end
      
      # VulnerabilityType provides metadata about a security vulnerability.
      class VulnerabilityType
        include Google::Apis::Core::Hashable
      
        # The CVSS score for this Vulnerability.
        # Corresponds to the JSON property `cvssScore`
        # @return [Float]
        attr_accessor :cvss_score
      
        # All information about the package to specifically identify this
        # vulnerability. One entry per (version range and cpe_uri) the
        # package vulnerability has manifested in.
        # Corresponds to the JSON property `details`
        # @return [Array<Google::Apis::ContaineranalysisV1alpha1::Detail>]
        attr_accessor :details
      
        # Note provider assigned impact of the vulnerability
        # Corresponds to the JSON property `severity`
        # @return [String]
        attr_accessor :severity
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cvss_score = args[:cvss_score] if args.key?(:cvss_score)
          @details = args[:details] if args.key?(:details)
          @severity = args[:severity] if args.key?(:severity)
        end
      end
    end
  end
end
