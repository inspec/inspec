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
    module RunV1alpha1
      
      # Information for connecting over HTTP(s).
      class Addressable
        include Google::Apis::Core::Hashable
      
        # Deprecated - use url instead.
        # Corresponds to the JSON property `hostname`
        # @return [String]
        attr_accessor :hostname
      
        # 
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @hostname = args[:hostname] if args.key?(:hostname)
          @url = args[:url] if args.key?(:url)
        end
      end
      
      # Specifies the audit configuration for a service.
      # The configuration determines which permission types are logged, and what
      # identities, if any, are exempted from logging.
      # An AuditConfig must have one or more AuditLogConfigs.
      # If there are AuditConfigs for both `allServices` and a specific service,
      # the union of the two AuditConfigs is used for that service: the log_types
      # specified in each AuditConfig are enabled, and the exempted_members in each
      # AuditLogConfig are exempted.
      # Example Policy with multiple AuditConfigs:
      # `
      # "audit_configs": [
      # `
      # "service": "allServices"
      # "audit_log_configs": [
      # `
      # "log_type": "DATA_READ",
      # "exempted_members": [
      # "user:jose@example.com"
      # ]
      # `,
      # `
      # "log_type": "DATA_WRITE",
      # `,
      # `
      # "log_type": "ADMIN_READ",
      # `
      # ]
      # `,
      # `
      # "service": "sampleservice.googleapis.com"
      # "audit_log_configs": [
      # `
      # "log_type": "DATA_READ",
      # `,
      # `
      # "log_type": "DATA_WRITE",
      # "exempted_members": [
      # "user:aliya@example.com"
      # ]
      # `
      # ]
      # `
      # ]
      # `
      # For sampleservice, this policy enables DATA_READ, DATA_WRITE and ADMIN_READ
      # logging. It also exempts jose@example.com from DATA_READ logging, and
      # aliya@example.com from DATA_WRITE logging.
      class AuditConfig
        include Google::Apis::Core::Hashable
      
        # The configuration for logging of each type of permission.
        # Corresponds to the JSON property `auditLogConfigs`
        # @return [Array<Google::Apis::RunV1alpha1::AuditLogConfig>]
        attr_accessor :audit_log_configs
      
        # Specifies a service that will be enabled for audit logging.
        # For example, `storage.googleapis.com`, `cloudsql.googleapis.com`.
        # `allServices` is a special value that covers all services.
        # Corresponds to the JSON property `service`
        # @return [String]
        attr_accessor :service
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @audit_log_configs = args[:audit_log_configs] if args.key?(:audit_log_configs)
          @service = args[:service] if args.key?(:service)
        end
      end
      
      # Provides the configuration for logging a type of permissions.
      # Example:
      # `
      # "audit_log_configs": [
      # `
      # "log_type": "DATA_READ",
      # "exempted_members": [
      # "user:jose@example.com"
      # ]
      # `,
      # `
      # "log_type": "DATA_WRITE",
      # `
      # ]
      # `
      # This enables 'DATA_READ' and 'DATA_WRITE' logging, while exempting
      # jose@example.com from DATA_READ logging.
      class AuditLogConfig
        include Google::Apis::Core::Hashable
      
        # Specifies the identities that do not cause logging for this type of
        # permission.
        # Follows the same format of Binding.members.
        # Corresponds to the JSON property `exemptedMembers`
        # @return [Array<String>]
        attr_accessor :exempted_members
      
        # The log type that this config enables.
        # Corresponds to the JSON property `logType`
        # @return [String]
        attr_accessor :log_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @exempted_members = args[:exempted_members] if args.key?(:exempted_members)
          @log_type = args[:log_type] if args.key?(:log_type)
        end
      end
      
      # A domain that a user has been authorized to administer. To authorize use
      # of a domain, verify ownership via
      # [Webmaster Central](https://www.google.com/webmasters/verification/home).
      class AuthorizedDomain
        include Google::Apis::Core::Hashable
      
        # Relative name of the domain authorized for use. Example: `example.com`.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Read only. Full path to the `AuthorizedDomain` resource in the API.
        # Example: `apps/myapp/authorizedDomains/example.com`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @id = args[:id] if args.key?(:id)
          @name = args[:name] if args.key?(:name)
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
        # @return [Google::Apis::RunV1alpha1::Expr]
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
      
      # Adds and removes POSIX capabilities from running containers.
      class Capabilities
        include Google::Apis::Core::Hashable
      
        # Added capabilities
        # +optional
        # Corresponds to the JSON property `add`
        # @return [Array<String>]
        attr_accessor :add
      
        # Removed capabilities
        # +optional
        # Corresponds to the JSON property `drop`
        # @return [Array<String>]
        attr_accessor :drop
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @add = args[:add] if args.key?(:add)
          @drop = args[:drop] if args.key?(:drop)
        end
      end
      
      # CloudEventOverrides defines arguments for a Source that control the output
      # format of the CloudEvents produced by the Source.
      class CloudEventOverrides
        include Google::Apis::Core::Hashable
      
        # Extensions specify what attribute are added or overridden on the outbound
        # event. Each `Extensions` key-value pair are set on the event as an
        # attribute extension independently.
        # +optional
        # Corresponds to the JSON property `extensions`
        # @return [Hash<String,String>]
        attr_accessor :extensions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @extensions = args[:extensions] if args.key?(:extensions)
        end
      end
      
      # Condition defines a generic condition for a Resource
      class Condition
        include Google::Apis::Core::Hashable
      
        # Optional. Last time the condition transitioned from one status to another.
        # Corresponds to the JSON property `lastTransitionTime`
        # @return [String]
        attr_accessor :last_transition_time
      
        # Optional. Human readable message indicating details about the current status.
        # Corresponds to the JSON property `message`
        # @return [String]
        attr_accessor :message
      
        # Optional. One-word CamelCase reason for the condition's last transition.
        # Corresponds to the JSON property `reason`
        # @return [String]
        attr_accessor :reason
      
        # Optional. How to interpret failures of this condition, one of Error, Warning,
        # Info
        # Corresponds to the JSON property `severity`
        # @return [String]
        attr_accessor :severity
      
        # Status of the condition, one of True, False, Unknown.
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        # type is used to communicate the status of the reconciliation process.
        # See also:
        # https://github.com/knative/serving/blob/master/docs/spec/errors.md#error-
        # conditions-and-reporting
        # Types common to all resources include:
        # * "Ready": True when the Resource is ready.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @last_transition_time = args[:last_transition_time] if args.key?(:last_transition_time)
          @message = args[:message] if args.key?(:message)
          @reason = args[:reason] if args.key?(:reason)
          @severity = args[:severity] if args.key?(:severity)
          @status = args[:status] if args.key?(:status)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # ConfigMapEnvSource selects a ConfigMap to populate the environment
      # variables with.
      # The contents of the target ConfigMap's Data field will represent the
      # key-value pairs as environment variables.
      class ConfigMapEnvSource
        include Google::Apis::Core::Hashable
      
        # LocalObjectReference contains enough information to let you locate the
        # referenced object inside the same namespace.
        # Corresponds to the JSON property `localObjectReference`
        # @return [Google::Apis::RunV1alpha1::LocalObjectReference]
        attr_accessor :local_object_reference
      
        # Cloud Run fully managed: not supported
        # Cloud Run for Anthos: supported
        # The ConfigMap to select from.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Cloud Run fully managed: not supported
        # Cloud Run for Anthos: supported
        # Specify whether the ConfigMap must be defined
        # +optional
        # Corresponds to the JSON property `optional`
        # @return [Boolean]
        attr_accessor :optional
        alias_method :optional?, :optional
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @local_object_reference = args[:local_object_reference] if args.key?(:local_object_reference)
          @name = args[:name] if args.key?(:name)
          @optional = args[:optional] if args.key?(:optional)
        end
      end
      
      # Cloud Run fully managed: not supported
      # Cloud Run on GKE: supported
      # Selects a key from a ConfigMap.
      class ConfigMapKeySelector
        include Google::Apis::Core::Hashable
      
        # Cloud Run fully managed: not supported
        # Cloud Run on GKE: supported
        # The key to select.
        # Corresponds to the JSON property `key`
        # @return [String]
        attr_accessor :key
      
        # LocalObjectReference contains enough information to let you locate the
        # referenced object inside the same namespace.
        # Corresponds to the JSON property `localObjectReference`
        # @return [Google::Apis::RunV1alpha1::LocalObjectReference]
        attr_accessor :local_object_reference
      
        # Cloud Run fully managed: not supported
        # Cloud Run on GKE: supported
        # The ConfigMap to select from.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Cloud Run fully managed: not supported
        # Cloud Run on GKE: supported
        # Specify whether the ConfigMap or its key must be defined
        # +optional
        # Corresponds to the JSON property `optional`
        # @return [Boolean]
        attr_accessor :optional
        alias_method :optional?, :optional
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @key = args[:key] if args.key?(:key)
          @local_object_reference = args[:local_object_reference] if args.key?(:local_object_reference)
          @name = args[:name] if args.key?(:name)
          @optional = args[:optional] if args.key?(:optional)
        end
      end
      
      # Adapts a ConfigMap into a volume.
      # The contents of the target ConfigMap's Data field will be presented in a
      # volume as files using the keys in the Data field as the file names, unless
      # the items element is populated with specific mappings of keys to paths.
      class ConfigMapVolumeSource
        include Google::Apis::Core::Hashable
      
        # Mode bits to use on created files by default. Must be a value between 0 and
        # 0777. Defaults to 0644. Directories within the path are not affected by
        # this setting. This might be in conflict with other options that affect the
        # file mode, like fsGroup, and the result can be other mode bits set.
        # Corresponds to the JSON property `defaultMode`
        # @return [Fixnum]
        attr_accessor :default_mode
      
        # If unspecified, each key-value pair in the Data field of the referenced
        # Secret will be projected into the volume as a file whose name is the
        # key and content is the value. If specified, the listed keys will be
        # projected into the specified paths, and unlisted keys will not be
        # present. If a key is specified which is not present in the Secret,
        # the volume setup will error unless it is marked optional.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::RunV1alpha1::KeyToPath>]
        attr_accessor :items
      
        # Name of the config.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Specify whether the Secret or its keys must be defined.
        # Corresponds to the JSON property `optional`
        # @return [Boolean]
        attr_accessor :optional
        alias_method :optional?, :optional
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @default_mode = args[:default_mode] if args.key?(:default_mode)
          @items = args[:items] if args.key?(:items)
          @name = args[:name] if args.key?(:name)
          @optional = args[:optional] if args.key?(:optional)
        end
      end
      
      # Configuration represents the "floating HEAD" of a linear history of
      # Revisions, and optionally how the containers those revisions reference are
      # built. Users create new Revisions by updating the Configuration's spec. The
      # "latest created" revision's name is available under status, as is the "latest
      # ready" revision's name. See also:
      # https://github.com/knative/serving/blob/master/docs/spec/overview.md#
      # configuration
      class Configuration
        include Google::Apis::Core::Hashable
      
        # The API version for this call such as "serving.knative.dev/v1alpha1".
        # Corresponds to the JSON property `apiVersion`
        # @return [String]
        attr_accessor :api_version
      
        # The kind of resource, in this case always "Configuration".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # ObjectMeta is metadata that all persisted resources must have, which includes
        # all objects users must create.
        # Corresponds to the JSON property `metadata`
        # @return [Google::Apis::RunV1alpha1::ObjectMeta]
        attr_accessor :metadata
      
        # ConfigurationSpec holds the desired state of the Configuration (from the
        # client).
        # Corresponds to the JSON property `spec`
        # @return [Google::Apis::RunV1alpha1::ConfigurationSpec]
        attr_accessor :spec
      
        # ConfigurationStatus communicates the observed state of the Configuration
        # (from the controller).
        # Corresponds to the JSON property `status`
        # @return [Google::Apis::RunV1alpha1::ConfigurationStatus]
        attr_accessor :status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @api_version = args[:api_version] if args.key?(:api_version)
          @kind = args[:kind] if args.key?(:kind)
          @metadata = args[:metadata] if args.key?(:metadata)
          @spec = args[:spec] if args.key?(:spec)
          @status = args[:status] if args.key?(:status)
        end
      end
      
      # ConfigurationCondition defines a readiness condition for a Configuration.
      class ConfigurationCondition
        include Google::Apis::Core::Hashable
      
        # Last time the condition transitioned from one status to another.
        # +optional
        # Corresponds to the JSON property `lastTransitionTime`
        # @return [String]
        attr_accessor :last_transition_time
      
        # Human-readable message indicating details about last transition.
        # +optional
        # Corresponds to the JSON property `message`
        # @return [String]
        attr_accessor :message
      
        # One-word CamelCase reason for the condition's last transition.
        # +optional
        # Corresponds to the JSON property `reason`
        # @return [String]
        attr_accessor :reason
      
        # How to interpret failures of this condition, one of Error, Warning, Info
        # +optional
        # Corresponds to the JSON property `severity`
        # @return [String]
        attr_accessor :severity
      
        # Status of the condition, one of True, False, Unknown.
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        # ConfigurationConditionType is used to communicate the status of the
        # reconciliation process. See also:
        # https://github.com/knative/serving/blob/master/docs/spec/errors.md#error-
        # conditions-and-reporting
        # Types include:"Ready"
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @last_transition_time = args[:last_transition_time] if args.key?(:last_transition_time)
          @message = args[:message] if args.key?(:message)
          @reason = args[:reason] if args.key?(:reason)
          @severity = args[:severity] if args.key?(:severity)
          @status = args[:status] if args.key?(:status)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # ConfigurationSpec holds the desired state of the Configuration (from the
      # client).
      class ConfigurationSpec
        include Google::Apis::Core::Hashable
      
        # Deprecated and not currently populated by Cloud Run. See
        # metadata.generation instead, which is the sequence number containing the
        # latest generation of the desired state.
        # Read-only.
        # Corresponds to the JSON property `generation`
        # @return [Fixnum]
        attr_accessor :generation
      
        # RevisionTemplateSpec describes the data a revision should have when created
        # from a template. Based on:
        # https://github.com/kubernetes/api/blob/e771f807/core/v1/types.go#L3179-L3190
        # Corresponds to the JSON property `revisionTemplate`
        # @return [Google::Apis::RunV1alpha1::RevisionTemplate]
        attr_accessor :revision_template
      
        # RevisionTemplateSpec describes the data a revision should have when created
        # from a template. Based on:
        # https://github.com/kubernetes/api/blob/e771f807/core/v1/types.go#L3179-L3190
        # Corresponds to the JSON property `template`
        # @return [Google::Apis::RunV1alpha1::RevisionTemplate]
        attr_accessor :template
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @generation = args[:generation] if args.key?(:generation)
          @revision_template = args[:revision_template] if args.key?(:revision_template)
          @template = args[:template] if args.key?(:template)
        end
      end
      
      # ConfigurationStatus communicates the observed state of the Configuration
      # (from the controller).
      class ConfigurationStatus
        include Google::Apis::Core::Hashable
      
        # Conditions communicates information about ongoing/complete
        # reconciliation processes that bring the "spec" inline with the observed
        # state of the world.
        # Corresponds to the JSON property `conditions`
        # @return [Array<Google::Apis::RunV1alpha1::ConfigurationCondition>]
        attr_accessor :conditions
      
        # LatestCreatedRevisionName is the last revision that was created from this
        # Configuration. It might not be ready yet, for that use
        # LatestReadyRevisionName.
        # Corresponds to the JSON property `latestCreatedRevisionName`
        # @return [String]
        attr_accessor :latest_created_revision_name
      
        # LatestReadyRevisionName holds the name of the latest Revision stamped out
        # from this Configuration that has had its "Ready" condition become "True".
        # Corresponds to the JSON property `latestReadyRevisionName`
        # @return [String]
        attr_accessor :latest_ready_revision_name
      
        # ObservedGeneration is the 'Generation' of the Configuration that
        # was last processed by the controller. The observed generation is updated
        # even if the controller failed to process the spec and create the Revision.
        # Clients polling for completed reconciliation should poll until
        # observedGeneration = metadata.generation, and the Ready condition's status
        # is True or False.
        # Corresponds to the JSON property `observedGeneration`
        # @return [Fixnum]
        attr_accessor :observed_generation
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @conditions = args[:conditions] if args.key?(:conditions)
          @latest_created_revision_name = args[:latest_created_revision_name] if args.key?(:latest_created_revision_name)
          @latest_ready_revision_name = args[:latest_ready_revision_name] if args.key?(:latest_ready_revision_name)
          @observed_generation = args[:observed_generation] if args.key?(:observed_generation)
        end
      end
      
      # A single application container.
      # This specifies both the container to run, the command to run in the container
      # and the arguments to supply to it.
      # Note that additional arguments may be supplied by the system to the container
      # at runtime.
      class Container
        include Google::Apis::Core::Hashable
      
        # Arguments to the entrypoint.
        # The docker image's CMD is used if this is not provided.
        # Variable references $(VAR_NAME) are expanded using the container's
        # environment. If a variable cannot be resolved, the reference in the input
        # string will be unchanged. The $(VAR_NAME) syntax can be escaped with a
        # double $$, ie: $$(VAR_NAME). Escaped references will never be expanded,
        # regardless of whether the variable exists or not.
        # Cannot be updated.
        # More info:
        # https://kubernetes.io/docs/tasks/inject-data-application/define-command-
        # argument-container/#running-a-command-in-a-shell
        # +optional
        # Corresponds to the JSON property `args`
        # @return [Array<String>]
        attr_accessor :args
      
        # Entrypoint array. Not executed within a shell.
        # The docker image's ENTRYPOINT is used if this is not provided.
        # Variable references $(VAR_NAME) are expanded using the container's
        # environment. If a variable cannot be resolved, the reference in the input
        # string will be unchanged. The $(VAR_NAME) syntax can be escaped with a
        # double $$, ie: $$(VAR_NAME). Escaped references will never be expanded,
        # regardless of whether the variable exists or not.
        # Cannot be updated.
        # More info:
        # https://kubernetes.io/docs/tasks/inject-data-application/define-command-
        # argument-container/#running-a-command-in-a-shell
        # +optional
        # Corresponds to the JSON property `command`
        # @return [Array<String>]
        attr_accessor :command
      
        # List of environment variables to set in the container.
        # Cannot be updated.
        # +optional
        # Corresponds to the JSON property `env`
        # @return [Array<Google::Apis::RunV1alpha1::EnvVar>]
        attr_accessor :env
      
        # List of sources to populate environment variables in the container.
        # The keys defined within a source must be a C_IDENTIFIER. All invalid keys
        # will be reported as an event when the container is starting. When a key
        # exists in multiple sources, the value associated with the last source will
        # take precedence. Values defined by an Env with a duplicate key will take
        # precedence. Cannot be updated. +optional
        # Corresponds to the JSON property `envFrom`
        # @return [Array<Google::Apis::RunV1alpha1::EnvFromSource>]
        attr_accessor :env_from
      
        # Docker image name.
        # More info: https://kubernetes.io/docs/concepts/containers/images
        # Corresponds to the JSON property `image`
        # @return [String]
        attr_accessor :image
      
        # Image pull policy.
        # One of Always, Never, IfNotPresent.
        # Defaults to Always if :latest tag is specified, or IfNotPresent otherwise.
        # Cannot be updated.
        # More info:
        # https://kubernetes.io/docs/concepts/containers/images#updating-images
        # +optional
        # Corresponds to the JSON property `imagePullPolicy`
        # @return [String]
        attr_accessor :image_pull_policy
      
        # Lifecycle describes actions that the management system should take in
        # response to container lifecycle events. For the PostStart and PreStop
        # lifecycle handlers, management of the container blocks until the action is
        # complete, unless the container process fails, in which case the handler is
        # aborted.
        # Corresponds to the JSON property `lifecycle`
        # @return [Google::Apis::RunV1alpha1::Lifecycle]
        attr_accessor :lifecycle
      
        # Probe describes a health check to be performed against a container to
        # determine whether it is alive or ready to receive traffic.
        # Corresponds to the JSON property `livenessProbe`
        # @return [Google::Apis::RunV1alpha1::Probe]
        attr_accessor :liveness_probe
      
        # Name of the container specified as a DNS_LABEL.
        # Each container must have a unique name (DNS_LABEL).
        # Cannot be updated.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # List of ports to expose from the container. Exposing a port here gives
        # the system additional information about the network connections a
        # container uses, but is primarily informational. Not specifying a port here
        # DOES NOT prevent that port from being exposed. Any port which is
        # listening on the default "0.0.0.0" address inside a container will be
        # accessible from the network.
        # Cannot be updated.
        # +optional
        # Corresponds to the JSON property `ports`
        # @return [Array<Google::Apis::RunV1alpha1::ContainerPort>]
        attr_accessor :ports
      
        # Probe describes a health check to be performed against a container to
        # determine whether it is alive or ready to receive traffic.
        # Corresponds to the JSON property `readinessProbe`
        # @return [Google::Apis::RunV1alpha1::Probe]
        attr_accessor :readiness_probe
      
        # ResourceRequirements describes the compute resource requirements.
        # Corresponds to the JSON property `resources`
        # @return [Google::Apis::RunV1alpha1::ResourceRequirements]
        attr_accessor :resources
      
        # SecurityContext holds security configuration that will be applied to a
        # container. Some fields are present in both SecurityContext and
        # PodSecurityContext.  When both are set, the values in SecurityContext take
        # precedence.
        # Corresponds to the JSON property `securityContext`
        # @return [Google::Apis::RunV1alpha1::SecurityContext]
        attr_accessor :security_context
      
        # Whether this container should allocate a buffer for stdin in the container
        # runtime. If this is not set, reads from stdin in the container will always
        # result in EOF. Default is false. +optional
        # Corresponds to the JSON property `stdin`
        # @return [Boolean]
        attr_accessor :stdin
        alias_method :stdin?, :stdin
      
        # Whether the container runtime should close the stdin channel after it has
        # been opened by a single attach. When stdin is true the stdin stream will
        # remain open across multiple attach sessions. If stdinOnce is set to true,
        # stdin is opened on container start, is empty until the first client
        # attaches to stdin, and then remains open and accepts data until the client
        # disconnects, at which time stdin is closed and remains closed until the
        # container is restarted. If this flag is false, a container processes that
        # reads from stdin will never receive an EOF. Default is false +optional
        # Corresponds to the JSON property `stdinOnce`
        # @return [Boolean]
        attr_accessor :stdin_once
        alias_method :stdin_once?, :stdin_once
      
        # Optional: Path at which the file to which the container's termination
        # message will be written is mounted into the container's filesystem. Message
        # written is intended to be brief final status, such as an assertion failure
        # message. Will be truncated by the node if greater than 4096 bytes. The
        # total message length across all containers will be limited to 12kb.
        # Defaults to /dev/termination-log.
        # Cannot be updated.
        # +optional
        # Corresponds to the JSON property `terminationMessagePath`
        # @return [String]
        attr_accessor :termination_message_path
      
        # Indicate how the termination message should be populated. File will use the
        # contents of terminationMessagePath to populate the container status message
        # on both success and failure. FallbackToLogsOnError will use the last chunk
        # of container log output if the termination message file is empty and the
        # container exited with an error. The log output is limited to 2048 bytes or
        # 80 lines, whichever is smaller. Defaults to File. Cannot be updated.
        # +optional
        # Corresponds to the JSON property `terminationMessagePolicy`
        # @return [String]
        attr_accessor :termination_message_policy
      
        # Whether this container should allocate a TTY for itself, also requires
        # 'stdin' to be true. Default is false. +optional
        # Corresponds to the JSON property `tty`
        # @return [Boolean]
        attr_accessor :tty
        alias_method :tty?, :tty
      
        # volumeDevices is the list of block devices to be used by the container.
        # This is an alpha feature and may change in the future.
        # +optional
        # Corresponds to the JSON property `volumeDevices`
        # @return [Array<Google::Apis::RunV1alpha1::VolumeDevice>]
        attr_accessor :volume_devices
      
        # Pod volumes to mount into the container's filesystem.
        # Cannot be updated.
        # +optional
        # Corresponds to the JSON property `volumeMounts`
        # @return [Array<Google::Apis::RunV1alpha1::VolumeMount>]
        attr_accessor :volume_mounts
      
        # Container's working directory.
        # If not specified, the container runtime's default will be used, which
        # might be configured in the container image.
        # Cannot be updated.
        # +optional
        # Corresponds to the JSON property `workingDir`
        # @return [String]
        attr_accessor :working_dir
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @args = args[:args] if args.key?(:args)
          @command = args[:command] if args.key?(:command)
          @env = args[:env] if args.key?(:env)
          @env_from = args[:env_from] if args.key?(:env_from)
          @image = args[:image] if args.key?(:image)
          @image_pull_policy = args[:image_pull_policy] if args.key?(:image_pull_policy)
          @lifecycle = args[:lifecycle] if args.key?(:lifecycle)
          @liveness_probe = args[:liveness_probe] if args.key?(:liveness_probe)
          @name = args[:name] if args.key?(:name)
          @ports = args[:ports] if args.key?(:ports)
          @readiness_probe = args[:readiness_probe] if args.key?(:readiness_probe)
          @resources = args[:resources] if args.key?(:resources)
          @security_context = args[:security_context] if args.key?(:security_context)
          @stdin = args[:stdin] if args.key?(:stdin)
          @stdin_once = args[:stdin_once] if args.key?(:stdin_once)
          @termination_message_path = args[:termination_message_path] if args.key?(:termination_message_path)
          @termination_message_policy = args[:termination_message_policy] if args.key?(:termination_message_policy)
          @tty = args[:tty] if args.key?(:tty)
          @volume_devices = args[:volume_devices] if args.key?(:volume_devices)
          @volume_mounts = args[:volume_mounts] if args.key?(:volume_mounts)
          @working_dir = args[:working_dir] if args.key?(:working_dir)
        end
      end
      
      # ContainerPort represents a network port in a single container.
      class ContainerPort
        include Google::Apis::Core::Hashable
      
        # Number of port to expose on the pod's IP address.
        # This must be a valid port number, 0 < x < 65536.
        # Corresponds to the JSON property `containerPort`
        # @return [Fixnum]
        attr_accessor :container_port
      
        # What host IP to bind the external port to.
        # +optional
        # Corresponds to the JSON property `hostIP`
        # @return [String]
        attr_accessor :host_ip
      
        # Number of port to expose on the host.
        # If specified, this must be a valid port number, 0 < x < 65536.
        # If HostNetwork is specified, this must match ContainerPort.
        # Most containers do not need this.
        # +optional
        # Corresponds to the JSON property `hostPort`
        # @return [Fixnum]
        attr_accessor :host_port
      
        # If specified, this must be an IANA_SVC_NAME and unique within the pod. Each
        # named port in a pod must have a unique name. Name for the port that can be
        # referred to by services.
        # +optional
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Protocol for port. Must be UDP or TCP.
        # Defaults to "TCP".
        # +optional
        # Corresponds to the JSON property `protocol`
        # @return [String]
        attr_accessor :protocol
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @container_port = args[:container_port] if args.key?(:container_port)
          @host_ip = args[:host_ip] if args.key?(:host_ip)
          @host_port = args[:host_port] if args.key?(:host_port)
          @name = args[:name] if args.key?(:name)
          @protocol = args[:protocol] if args.key?(:protocol)
        end
      end
      
      # 
      class Destination
        include Google::Apis::Core::Hashable
      
        # ObjectReference contains enough information to let you inspect or modify the
        # referred object.
        # Corresponds to the JSON property `ref`
        # @return [Google::Apis::RunV1alpha1::ObjectReference]
        attr_accessor :ref
      
        # URI is for direct URI Designations or used with the resulting URL from
        # Addressable ObjectReference. If used with an ObjectReference, will be
        # appended to the path of the resulting URL from the Addressable.
        # + optional
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @ref = args[:ref] if args.key?(:ref)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # Resource to hold the state and status of a user's domain mapping.
      class DomainMapping
        include Google::Apis::Core::Hashable
      
        # The API version for this call such as "domains.cloudrun.com/v1alpha1".
        # Corresponds to the JSON property `apiVersion`
        # @return [String]
        attr_accessor :api_version
      
        # The kind of resource, in this case "DomainMapping".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # ObjectMeta is metadata that all persisted resources must have, which includes
        # all objects users must create.
        # Corresponds to the JSON property `metadata`
        # @return [Google::Apis::RunV1alpha1::ObjectMeta]
        attr_accessor :metadata
      
        # The desired state of the Domain Mapping.
        # Corresponds to the JSON property `spec`
        # @return [Google::Apis::RunV1alpha1::DomainMappingSpec]
        attr_accessor :spec
      
        # The current state of the Domain Mapping.
        # Corresponds to the JSON property `status`
        # @return [Google::Apis::RunV1alpha1::DomainMappingStatus]
        attr_accessor :status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @api_version = args[:api_version] if args.key?(:api_version)
          @kind = args[:kind] if args.key?(:kind)
          @metadata = args[:metadata] if args.key?(:metadata)
          @spec = args[:spec] if args.key?(:spec)
          @status = args[:status] if args.key?(:status)
        end
      end
      
      # DomainMappingCondition contains state information for a DomainMapping.
      class DomainMappingCondition
        include Google::Apis::Core::Hashable
      
        # Last time the condition transitioned from one status to another.
        # +optional
        # Corresponds to the JSON property `lastTransitionTime`
        # @return [String]
        attr_accessor :last_transition_time
      
        # Human readable message indicating details about the current status.
        # +optional
        # Corresponds to the JSON property `message`
        # @return [String]
        attr_accessor :message
      
        # One-word CamelCase reason for the condition's current status.
        # +optional
        # Corresponds to the JSON property `reason`
        # @return [String]
        attr_accessor :reason
      
        # How to interpret failures of this condition, one of Error, Warning, Info
        # +optional
        # Corresponds to the JSON property `severity`
        # @return [String]
        attr_accessor :severity
      
        # Status of the condition, one of True, False, Unknown.
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        # Type of domain mapping condition.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @last_transition_time = args[:last_transition_time] if args.key?(:last_transition_time)
          @message = args[:message] if args.key?(:message)
          @reason = args[:reason] if args.key?(:reason)
          @severity = args[:severity] if args.key?(:severity)
          @status = args[:status] if args.key?(:status)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # The desired state of the Domain Mapping.
      class DomainMappingSpec
        include Google::Apis::Core::Hashable
      
        # The mode of the certificate.
        # Corresponds to the JSON property `certificateMode`
        # @return [String]
        attr_accessor :certificate_mode
      
        # If set, the mapping will override any mapping set before this spec was set.
        # It is recommended that the user leaves this empty to receive an error
        # warning about a potential conflict and only set it once the respective UI
        # has given such a warning.
        # Corresponds to the JSON property `forceOverride`
        # @return [Boolean]
        attr_accessor :force_override
        alias_method :force_override?, :force_override
      
        # The name of the Knative Route that this DomainMapping applies to.
        # The route must exist.
        # Corresponds to the JSON property `routeName`
        # @return [String]
        attr_accessor :route_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @certificate_mode = args[:certificate_mode] if args.key?(:certificate_mode)
          @force_override = args[:force_override] if args.key?(:force_override)
          @route_name = args[:route_name] if args.key?(:route_name)
        end
      end
      
      # The current state of the Domain Mapping.
      class DomainMappingStatus
        include Google::Apis::Core::Hashable
      
        # Array of observed DomainMappingConditions, indicating the current state
        # of the DomainMapping.
        # Corresponds to the JSON property `conditions`
        # @return [Array<Google::Apis::RunV1alpha1::DomainMappingCondition>]
        attr_accessor :conditions
      
        # The name of the route that the mapping currently points to.
        # Corresponds to the JSON property `mappedRouteName`
        # @return [String]
        attr_accessor :mapped_route_name
      
        # ObservedGeneration is the 'Generation' of the DomainMapping that
        # was last processed by the controller.
        # Clients polling for completed reconciliation should poll until
        # observedGeneration = metadata.generation and the Ready condition's status
        # is True or False.
        # Corresponds to the JSON property `observedGeneration`
        # @return [Fixnum]
        attr_accessor :observed_generation
      
        # The resource records required to configure this domain mapping. These
        # records must be added to the domain's DNS configuration in order to
        # serve the application via this domain mapping.
        # Corresponds to the JSON property `resourceRecords`
        # @return [Array<Google::Apis::RunV1alpha1::ResourceRecord>]
        attr_accessor :resource_records
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @conditions = args[:conditions] if args.key?(:conditions)
          @mapped_route_name = args[:mapped_route_name] if args.key?(:mapped_route_name)
          @observed_generation = args[:observed_generation] if args.key?(:observed_generation)
          @resource_records = args[:resource_records] if args.key?(:resource_records)
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
      
      # EnvFromSource represents the source of a set of ConfigMaps
      class EnvFromSource
        include Google::Apis::Core::Hashable
      
        # ConfigMapEnvSource selects a ConfigMap to populate the environment
        # variables with.
        # The contents of the target ConfigMap's Data field will represent the
        # key-value pairs as environment variables.
        # Corresponds to the JSON property `configMapRef`
        # @return [Google::Apis::RunV1alpha1::ConfigMapEnvSource]
        attr_accessor :config_map_ref
      
        # An optional identifier to prepend to each key in the ConfigMap. Must be a
        # C_IDENTIFIER. +optional
        # Corresponds to the JSON property `prefix`
        # @return [String]
        attr_accessor :prefix
      
        # SecretEnvSource selects a Secret to populate the environment
        # variables with.
        # The contents of the target Secret's Data field will represent the
        # key-value pairs as environment variables.
        # Corresponds to the JSON property `secretRef`
        # @return [Google::Apis::RunV1alpha1::SecretEnvSource]
        attr_accessor :secret_ref
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @config_map_ref = args[:config_map_ref] if args.key?(:config_map_ref)
          @prefix = args[:prefix] if args.key?(:prefix)
          @secret_ref = args[:secret_ref] if args.key?(:secret_ref)
        end
      end
      
      # EnvVar represents an environment variable present in a Container.
      class EnvVar
        include Google::Apis::Core::Hashable
      
        # Name of the environment variable. Must be a C_IDENTIFIER.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Variable references $(VAR_NAME) are expanded
        # using the previous defined environment variables in the container and
        # any route environment variables. If a variable cannot be resolved,
        # the reference in the input string will be unchanged. The $(VAR_NAME)
        # syntax can be escaped with a double $$, ie: $$(VAR_NAME). Escaped
        # references will never be expanded, regardless of whether the variable
        # exists or not.
        # Defaults to "".
        # +optional
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        # Cloud Run fully managed: not supported
        # Cloud Run on GKE: supported
        # EnvVarSource represents a source for the value of an EnvVar.
        # Corresponds to the JSON property `valueFrom`
        # @return [Google::Apis::RunV1alpha1::EnvVarSource]
        attr_accessor :value_from
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @value = args[:value] if args.key?(:value)
          @value_from = args[:value_from] if args.key?(:value_from)
        end
      end
      
      # Cloud Run fully managed: not supported
      # Cloud Run on GKE: supported
      # EnvVarSource represents a source for the value of an EnvVar.
      class EnvVarSource
        include Google::Apis::Core::Hashable
      
        # Cloud Run fully managed: not supported
        # Cloud Run on GKE: supported
        # Selects a key from a ConfigMap.
        # Corresponds to the JSON property `configMapKeyRef`
        # @return [Google::Apis::RunV1alpha1::ConfigMapKeySelector]
        attr_accessor :config_map_key_ref
      
        # Cloud Run fully managed: not supported
        # Cloud Run on GKE: supported
        # SecretKeySelector selects a key of a Secret.
        # Corresponds to the JSON property `secretKeyRef`
        # @return [Google::Apis::RunV1alpha1::SecretKeySelector]
        attr_accessor :secret_key_ref
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @config_map_key_ref = args[:config_map_key_ref] if args.key?(:config_map_key_ref)
          @secret_key_ref = args[:secret_key_ref] if args.key?(:secret_key_ref)
        end
      end
      
      # 
      class EventType
        include Google::Apis::Core::Hashable
      
        # The API version for this call such as "eventing.knative.dev/v1alpha1".
        # Corresponds to the JSON property `apiVersion`
        # @return [String]
        attr_accessor :api_version
      
        # The kind of resource, in this case "EventType".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # ObjectMeta is metadata that all persisted resources must have, which includes
        # all objects users must create.
        # Corresponds to the JSON property `metadata`
        # @return [Google::Apis::RunV1alpha1::ObjectMeta]
        attr_accessor :metadata
      
        # Spec defines the desired state of the EventType.
        # Corresponds to the JSON property `spec`
        # @return [Google::Apis::RunV1alpha1::EventTypeSpec]
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
      
      # 
      class EventTypeImporter
        include Google::Apis::Core::Hashable
      
        # The API version of the importer CRD.
        # Corresponds to the JSON property `apiVersion`
        # @return [String]
        attr_accessor :api_version
      
        # The kind of the importer CRD.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Parameters required to create an importer for the EventType.
        # Corresponds to the JSON property `parameters`
        # @return [Array<Google::Apis::RunV1alpha1::EventTypeParameter>]
        attr_accessor :parameters
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @api_version = args[:api_version] if args.key?(:api_version)
          @kind = args[:kind] if args.key?(:kind)
          @parameters = args[:parameters] if args.key?(:parameters)
        end
      end
      
      # 
      class EventTypeParameter
        include Google::Apis::Core::Hashable
      
        # Description of the parameter. E.g. "Google Cloud Project Id."
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Name of the parameter. E.g. googleCloudProject.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # 
      class EventTypeSpec
        include Google::Apis::Core::Hashable
      
        # Refers to the Broker that can provide the EventType.
        # Corresponds to the JSON property `broker`
        # @return [String]
        attr_accessor :broker
      
        # Description is a string describing what the EventType is about.
        # +optional
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The importer that provides this EventType to the eventing mesh.
        # Corresponds to the JSON property `importer`
        # @return [Google::Apis::RunV1alpha1::EventTypeImporter]
        attr_accessor :importer
      
        # Schema is a URI with the EventType schema. It may be a JSON schema, a
        # protobuf schema, etc.
        # +optional
        # Corresponds to the JSON property `schema`
        # @return [String]
        attr_accessor :schema
      
        # Source is a valid URI. Refers to the CloudEvent source as it enters into
        # the eventing mesh.
        # Corresponds to the JSON property `source`
        # @return [String]
        attr_accessor :source
      
        # Type is authoritative. This refers to the CloudEvent type as it enters
        # into the eventing mesh.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @broker = args[:broker] if args.key?(:broker)
          @description = args[:description] if args.key?(:description)
          @importer = args[:importer] if args.key?(:importer)
          @schema = args[:schema] if args.key?(:schema)
          @source = args[:source] if args.key?(:source)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # ExecAction describes a "run in container" action.
      class ExecAction
        include Google::Apis::Core::Hashable
      
        # Command is the command line to execute inside the container, the working
        # directory for the command  is root ('/') in the container's filesystem. The
        # command is simply exec'd, it is not run inside a shell, so traditional
        # shell instructions ('|', etc) won't work. To use a shell, you need to
        # explicitly call out to that shell. Exit status of 0 is treated as
        # live/healthy and non-zero is unhealthy. +optional
        # Corresponds to the JSON property `command`
        # @return [String]
        attr_accessor :command
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @command = args[:command] if args.key?(:command)
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
      
      # HTTPGetAction describes an action based on HTTP Get requests.
      class HttpGetAction
        include Google::Apis::Core::Hashable
      
        # Host name to connect to, defaults to the pod IP. You probably want to set
        # "Host" in httpHeaders instead.
        # +optional
        # Corresponds to the JSON property `host`
        # @return [String]
        attr_accessor :host
      
        # Custom headers to set in the request. HTTP allows repeated headers.
        # +optional
        # Corresponds to the JSON property `httpHeaders`
        # @return [Array<Google::Apis::RunV1alpha1::HttpHeader>]
        attr_accessor :http_headers
      
        # Path to access on the HTTP server.
        # +optional
        # Corresponds to the JSON property `path`
        # @return [String]
        attr_accessor :path
      
        # IntOrString is a type that can hold an int32 or a string.  When used in
        # JSON or YAML marshalling and unmarshalling, it produces or consumes the
        # inner type.  This allows you to have, for example, a JSON field that can
        # accept a name or number.
        # Corresponds to the JSON property `port`
        # @return [Google::Apis::RunV1alpha1::IntOrString]
        attr_accessor :port
      
        # Scheme to use for connecting to the host.
        # Defaults to HTTP.
        # +optional
        # Corresponds to the JSON property `scheme`
        # @return [String]
        attr_accessor :scheme
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @host = args[:host] if args.key?(:host)
          @http_headers = args[:http_headers] if args.key?(:http_headers)
          @path = args[:path] if args.key?(:path)
          @port = args[:port] if args.key?(:port)
          @scheme = args[:scheme] if args.key?(:scheme)
        end
      end
      
      # HTTPHeader describes a custom header to be used in HTTP probes
      class HttpHeader
        include Google::Apis::Core::Hashable
      
        # The header field name
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The header field value
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # Handler defines a specific action that should be taken
      class Handler
        include Google::Apis::Core::Hashable
      
        # ExecAction describes a "run in container" action.
        # Corresponds to the JSON property `exec`
        # @return [Google::Apis::RunV1alpha1::ExecAction]
        attr_accessor :exec
      
        # HTTPGetAction describes an action based on HTTP Get requests.
        # Corresponds to the JSON property `httpGet`
        # @return [Google::Apis::RunV1alpha1::HttpGetAction]
        attr_accessor :http_get
      
        # TCPSocketAction describes an action based on opening a socket
        # Corresponds to the JSON property `tcpSocket`
        # @return [Google::Apis::RunV1alpha1::TcpSocketAction]
        attr_accessor :tcp_socket
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @exec = args[:exec] if args.key?(:exec)
          @http_get = args[:http_get] if args.key?(:http_get)
          @tcp_socket = args[:tcp_socket] if args.key?(:tcp_socket)
        end
      end
      
      # Initializer is information about an initializer that has not yet completed.
      class Initializer
        include Google::Apis::Core::Hashable
      
        # name of the process that is responsible for initializing this object.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Initializers tracks the progress of initialization.
      class Initializers
        include Google::Apis::Core::Hashable
      
        # Pending is a list of initializers that must execute in order before this
        # object is visible. When the last pending initializer is removed, and no
        # failing result is set, the initializers struct will be set to nil and the
        # object is considered as initialized and visible to all clients.
        # +patchMergeKey=name
        # +patchStrategy=merge
        # Corresponds to the JSON property `pending`
        # @return [Array<Google::Apis::RunV1alpha1::Initializer>]
        attr_accessor :pending
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @pending = args[:pending] if args.key?(:pending)
        end
      end
      
      # IntOrString is a type that can hold an int32 or a string.  When used in
      # JSON or YAML marshalling and unmarshalling, it produces or consumes the
      # inner type.  This allows you to have, for example, a JSON field that can
      # accept a name or number.
      class IntOrString
        include Google::Apis::Core::Hashable
      
        # The int value.
        # Corresponds to the JSON property `intVal`
        # @return [Fixnum]
        attr_accessor :int_val
      
        # The string value.
        # Corresponds to the JSON property `strVal`
        # @return [String]
        attr_accessor :str_val
      
        # The type of the value.
        # Corresponds to the JSON property `type`
        # @return [Fixnum]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @int_val = args[:int_val] if args.key?(:int_val)
          @str_val = args[:str_val] if args.key?(:str_val)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Maps a string key to a path within a volume.
      class KeyToPath
        include Google::Apis::Core::Hashable
      
        # The key to project.
        # Corresponds to the JSON property `key`
        # @return [String]
        attr_accessor :key
      
        # Mode bits to use on this file, must be a value between 0 and 0777. If not
        # specified, the volume defaultMode will be used. This might be in conflict
        # with other options that affect the file mode, like fsGroup, and the result
        # can be other mode bits set. +optional
        # Corresponds to the JSON property `mode`
        # @return [Fixnum]
        attr_accessor :mode
      
        # The relative path of the file to map the key to.
        # May not be an absolute path.
        # May not contain the path element '..'.
        # May not start with the string '..'.
        # Corresponds to the JSON property `path`
        # @return [String]
        attr_accessor :path
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @key = args[:key] if args.key?(:key)
          @mode = args[:mode] if args.key?(:mode)
          @path = args[:path] if args.key?(:path)
        end
      end
      
      # Lifecycle describes actions that the management system should take in
      # response to container lifecycle events. For the PostStart and PreStop
      # lifecycle handlers, management of the container blocks until the action is
      # complete, unless the container process fails, in which case the handler is
      # aborted.
      class Lifecycle
        include Google::Apis::Core::Hashable
      
        # Handler defines a specific action that should be taken
        # Corresponds to the JSON property `postStart`
        # @return [Google::Apis::RunV1alpha1::Handler]
        attr_accessor :post_start
      
        # Handler defines a specific action that should be taken
        # Corresponds to the JSON property `preStop`
        # @return [Google::Apis::RunV1alpha1::Handler]
        attr_accessor :pre_stop
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @post_start = args[:post_start] if args.key?(:post_start)
          @pre_stop = args[:pre_stop] if args.key?(:pre_stop)
        end
      end
      
      # A list of Authorized Domains.
      class ListAuthorizedDomainsResponse
        include Google::Apis::Core::Hashable
      
        # The authorized domains belonging to the user.
        # Corresponds to the JSON property `domains`
        # @return [Array<Google::Apis::RunV1alpha1::AuthorizedDomain>]
        attr_accessor :domains
      
        # Continuation token for fetching the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @domains = args[:domains] if args.key?(:domains)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # ListConfigurationsResponse is a list of Configuration resources.
      class ListConfigurationsResponse
        include Google::Apis::Core::Hashable
      
        # The API version for this call such as "serving.knative.dev/v1alpha1".
        # Corresponds to the JSON property `apiVersion`
        # @return [String]
        attr_accessor :api_version
      
        # List of Configurations.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::RunV1alpha1::Configuration>]
        attr_accessor :items
      
        # The kind of this resource, in this case "ConfigurationList".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # ListMeta describes metadata that synthetic resources must have, including
        # lists and various status objects. A resource may have only one of
        # `ObjectMeta, ListMeta`.
        # Corresponds to the JSON property `metadata`
        # @return [Google::Apis::RunV1alpha1::ListMeta]
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
      
      # ListDomainMappingsResponse is a list of DomainMapping resources.
      class ListDomainMappingsResponse
        include Google::Apis::Core::Hashable
      
        # The API version for this call such as "domains.cloudrun.com/v1alpha1".
        # Corresponds to the JSON property `apiVersion`
        # @return [String]
        attr_accessor :api_version
      
        # List of DomainMappings.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::RunV1alpha1::DomainMapping>]
        attr_accessor :items
      
        # The kind of this resource, in this case "DomainMappingList".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # ListMeta describes metadata that synthetic resources must have, including
        # lists and various status objects. A resource may have only one of
        # `ObjectMeta, ListMeta`.
        # Corresponds to the JSON property `metadata`
        # @return [Google::Apis::RunV1alpha1::ListMeta]
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
      
      # ListEventTypesResponse is a list of EventType resources.
      class ListEventTypesResponse
        include Google::Apis::Core::Hashable
      
        # The API version for this call such as "eventing.knative.dev/v1alpha1".
        # Corresponds to the JSON property `apiVersion`
        # @return [String]
        attr_accessor :api_version
      
        # List of EventTypes.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::RunV1alpha1::EventType>]
        attr_accessor :items
      
        # The kind of this resource, in this case "EventTypeList".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # ListMeta describes metadata that synthetic resources must have, including
        # lists and various status objects. A resource may have only one of
        # `ObjectMeta, ListMeta`.
        # Corresponds to the JSON property `metadata`
        # @return [Google::Apis::RunV1alpha1::ListMeta]
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
      
      # The response message for Locations.ListLocations.
      class ListLocationsResponse
        include Google::Apis::Core::Hashable
      
        # A list of locations that matches the specified filter in the request.
        # Corresponds to the JSON property `locations`
        # @return [Array<Google::Apis::RunV1alpha1::Location>]
        attr_accessor :locations
      
        # The standard List next-page token.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @locations = args[:locations] if args.key?(:locations)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
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
      
      # ListPubSubsResponse is a list of PubSub resources.
      class ListPubSubsResponse
        include Google::Apis::Core::Hashable
      
        # The API version for this call such as "events.cloud.google.com/v1alpha1".
        # Corresponds to the JSON property `apiVersion`
        # @return [String]
        attr_accessor :api_version
      
        # List of PubSubs.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::RunV1alpha1::PubSub>]
        attr_accessor :items
      
        # The kind of this resource, in this case "PubSubList".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # ListMeta describes metadata that synthetic resources must have, including
        # lists and various status objects. A resource may have only one of
        # `ObjectMeta, ListMeta`.
        # Corresponds to the JSON property `metadata`
        # @return [Google::Apis::RunV1alpha1::ListMeta]
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
      
      # ListRevisionsResponse is a list of Revision resources.
      class ListRevisionsResponse
        include Google::Apis::Core::Hashable
      
        # The API version for this call such as "serving.knative.dev/v1alpha1".
        # Corresponds to the JSON property `apiVersion`
        # @return [String]
        attr_accessor :api_version
      
        # List of Revisions.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::RunV1alpha1::Revision>]
        attr_accessor :items
      
        # The kind of this resource, in this case "RevisionList".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # ListMeta describes metadata that synthetic resources must have, including
        # lists and various status objects. A resource may have only one of
        # `ObjectMeta, ListMeta`.
        # Corresponds to the JSON property `metadata`
        # @return [Google::Apis::RunV1alpha1::ListMeta]
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
      
      # ListRoutesResponse is a list of Route resources.
      class ListRoutesResponse
        include Google::Apis::Core::Hashable
      
        # The API version for this call such as "serving.knative.dev/v1alpha1".
        # Corresponds to the JSON property `apiVersion`
        # @return [String]
        attr_accessor :api_version
      
        # List of Routes.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::RunV1alpha1::Route>]
        attr_accessor :items
      
        # The kind of this resource, in this case always "RouteList".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # ListMeta describes metadata that synthetic resources must have, including
        # lists and various status objects. A resource may have only one of
        # `ObjectMeta, ListMeta`.
        # Corresponds to the JSON property `metadata`
        # @return [Google::Apis::RunV1alpha1::ListMeta]
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
      
      # A list of Service resources.
      class ListServicesResponse
        include Google::Apis::Core::Hashable
      
        # The API version for this call such as "serving.knative.dev/v1alpha1".
        # Corresponds to the JSON property `apiVersion`
        # @return [String]
        attr_accessor :api_version
      
        # List of Services.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::RunV1alpha1::Service>]
        attr_accessor :items
      
        # The kind of this resource, in this case "ServiceList".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # ListMeta describes metadata that synthetic resources must have, including
        # lists and various status objects. A resource may have only one of
        # `ObjectMeta, ListMeta`.
        # Corresponds to the JSON property `metadata`
        # @return [Google::Apis::RunV1alpha1::ListMeta]
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
      
      # ListTriggersResponse is a list of Trigger resources.
      class ListTriggersResponse
        include Google::Apis::Core::Hashable
      
        # The API version for this call such as "eventing.knative.dev/v1alpha1".
        # Corresponds to the JSON property `apiVersion`
        # @return [String]
        attr_accessor :api_version
      
        # List of Triggers.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::RunV1alpha1::Trigger>]
        attr_accessor :items
      
        # The kind of this resource, in this case "TriggerList".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # ListMeta describes metadata that synthetic resources must have, including
        # lists and various status objects. A resource may have only one of
        # `ObjectMeta, ListMeta`.
        # Corresponds to the JSON property `metadata`
        # @return [Google::Apis::RunV1alpha1::ListMeta]
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
      
      # LocalObjectReference contains enough information to let you locate the
      # referenced object inside the same namespace.
      class LocalObjectReference
        include Google::Apis::Core::Hashable
      
        # Name of the referent.
        # More info:
        # https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # A resource that represents Google Cloud Platform location.
      class Location
        include Google::Apis::Core::Hashable
      
        # The friendly name for this location, typically a nearby city name.
        # For example, "Tokyo".
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # Cross-service attributes for the location. For example
        # `"cloud.googleapis.com/region": "us-east1"`
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # The canonical id for this location. For example: `"us-east1"`.
        # Corresponds to the JSON property `locationId`
        # @return [String]
        attr_accessor :location_id
      
        # Service-specific metadata. For example the available capacity at the given
        # location.
        # Corresponds to the JSON property `metadata`
        # @return [Hash<String,Object>]
        attr_accessor :metadata
      
        # Resource name for the location, which may vary between implementations.
        # For example: `"projects/example-project/locations/us-east1"`
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @display_name = args[:display_name] if args.key?(:display_name)
          @labels = args[:labels] if args.key?(:labels)
          @location_id = args[:location_id] if args.key?(:location_id)
          @metadata = args[:metadata] if args.key?(:metadata)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # ObjectMeta is metadata that all persisted resources must have, which includes
      # all objects users must create.
      class ObjectMeta
        include Google::Apis::Core::Hashable
      
        # Annotations is an unstructured key value map stored with a resource that
        # may be set by external tools to store and retrieve arbitrary metadata. They
        # are not queryable and should be preserved when modifying objects. More
        # info: http://kubernetes.io/docs/user-guide/annotations +optional
        # Corresponds to the JSON property `annotations`
        # @return [Hash<String,String>]
        attr_accessor :annotations
      
        # Not currently supported by Cloud Run.
        # The name of the cluster which the object belongs to.
        # This is used to distinguish resources with same name and namespace in
        # different clusters. This field is not set anywhere right now and apiserver
        # is going to ignore it if set in create or update request. +optional
        # Corresponds to the JSON property `clusterName`
        # @return [String]
        attr_accessor :cluster_name
      
        # CreationTimestamp is a timestamp representing the server time when this
        # object was created. It is not guaranteed to be set in happens-before order
        # across separate operations. Clients may not set this value. It is
        # represented in RFC3339 form and is in UTC.
        # Populated by the system.
        # Read-only.
        # Null for lists.
        # More info:
        # https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
        # +optional
        # Corresponds to the JSON property `creationTimestamp`
        # @return [String]
        attr_accessor :creation_timestamp
      
        # Not currently supported by Cloud Run.
        # Number of seconds allowed for this object to gracefully terminate before
        # it will be removed from the system. Only set when deletionTimestamp is also
        # set. May only be shortened. Read-only. +optional
        # Corresponds to the JSON property `deletionGracePeriodSeconds`
        # @return [Fixnum]
        attr_accessor :deletion_grace_period_seconds
      
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
        # +optional
        # Corresponds to the JSON property `deletionTimestamp`
        # @return [String]
        attr_accessor :deletion_timestamp
      
        # Not currently supported by Cloud Run.
        # Must be empty before the object is deleted from the registry. Each entry
        # is an identifier for the responsible component that will remove the entry
        # from the list. If the deletionTimestamp of the object is non-nil, entries
        # in this list can only be removed.
        # +optional
        # +patchStrategy=merge
        # Corresponds to the JSON property `finalizers`
        # @return [Array<String>]
        attr_accessor :finalizers
      
        # Not currently supported by Cloud Run.
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
        # +optional
        # string generateName = 2;
        # Corresponds to the JSON property `generateName`
        # @return [String]
        attr_accessor :generate_name
      
        # A sequence number representing a specific generation of the desired state.
        # Populated by the system. Read-only.
        # +optional
        # Corresponds to the JSON property `generation`
        # @return [Fixnum]
        attr_accessor :generation
      
        # Initializers tracks the progress of initialization.
        # Corresponds to the JSON property `initializers`
        # @return [Google::Apis::RunV1alpha1::Initializers]
        attr_accessor :initializers
      
        # Map of string keys and values that can be used to organize and categorize
        # (scope and select) objects. May match selectors of replication controllers
        # and routes.
        # More info: http://kubernetes.io/docs/user-guide/labels
        # +optional
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
      
        # List of objects that own this object. If ALL objects in the list have
        # been deleted, this object will be garbage collected.
        # +optional
        # Corresponds to the JSON property `ownerReferences`
        # @return [Array<Google::Apis::RunV1alpha1::OwnerReference>]
        attr_accessor :owner_references
      
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
        # +optional
        # Corresponds to the JSON property `resourceVersion`
        # @return [String]
        attr_accessor :resource_version
      
        # SelfLink is a URL representing this object.
        # Populated by the system.
        # Read-only.
        # +optional
        # string selfLink = 4;
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        # UID is the unique in time and space value for this object. It is typically
        # generated by the server on successful creation of a resource and is not
        # allowed to change on PUT operations.
        # Populated by the system.
        # Read-only.
        # More info: http://kubernetes.io/docs/user-guide/identifiers#uids
        # +optional
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
          @initializers = args[:initializers] if args.key?(:initializers)
          @labels = args[:labels] if args.key?(:labels)
          @name = args[:name] if args.key?(:name)
          @namespace = args[:namespace] if args.key?(:namespace)
          @owner_references = args[:owner_references] if args.key?(:owner_references)
          @resource_version = args[:resource_version] if args.key?(:resource_version)
          @self_link = args[:self_link] if args.key?(:self_link)
          @uid = args[:uid] if args.key?(:uid)
        end
      end
      
      # ObjectReference contains enough information to let you inspect or modify the
      # referred object.
      class ObjectReference
        include Google::Apis::Core::Hashable
      
        # API version of the referent.
        # +optional
        # Corresponds to the JSON property `apiVersion`
        # @return [String]
        attr_accessor :api_version
      
        # If referring to a piece of an object instead of an entire object, this
        # string should contain a valid JSON/Go field access statement, such as
        # desiredState.manifest.containers[2]. For example, if the object reference
        # is to a container within a pod, this would take on a value like:
        # "spec.containers`name`" (where "name" refers to the name of the container
        # that triggered the event) or if no container name is specified
        # "spec.containers[2]" (container with index 2 in this pod). This syntax is
        # chosen only to have some well-defined way of referencing a part of an
        # object.
        # Corresponds to the JSON property `fieldPath`
        # @return [String]
        attr_accessor :field_path
      
        # Kind of the referent.
        # More info:
        # https://git.k8s.io/community/contributors/devel/api-conventions.md#types-kinds
        # +optional
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Name of the referent.
        # More info:
        # https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
        # +optional
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Namespace of the referent.
        # More info:
        # https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/
        # +optional
        # Corresponds to the JSON property `namespace`
        # @return [String]
        attr_accessor :namespace
      
        # Specific resourceVersion to which this reference is made, if any.
        # More info:
        # https://git.k8s.io/community/contributors/devel/api-conventions.md#concurrency-
        # control-and-consistency
        # +optional
        # Corresponds to the JSON property `resourceVersion`
        # @return [String]
        attr_accessor :resource_version
      
        # UID of the referent.
        # More info:
        # https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#uids
        # +optional
        # Corresponds to the JSON property `uid`
        # @return [String]
        attr_accessor :uid
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @api_version = args[:api_version] if args.key?(:api_version)
          @field_path = args[:field_path] if args.key?(:field_path)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
          @namespace = args[:namespace] if args.key?(:namespace)
          @resource_version = args[:resource_version] if args.key?(:resource_version)
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
      
        # Specifies cloud audit logging configuration for this policy.
        # Corresponds to the JSON property `auditConfigs`
        # @return [Array<Google::Apis::RunV1alpha1::AuditConfig>]
        attr_accessor :audit_configs
      
        # Associates a list of `members` to a `role`. Optionally may specify a
        # `condition` that determines when binding is in effect.
        # `bindings` with no members will result in an error.
        # Corresponds to the JSON property `bindings`
        # @return [Array<Google::Apis::RunV1alpha1::Binding>]
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
          @audit_configs = args[:audit_configs] if args.key?(:audit_configs)
          @bindings = args[:bindings] if args.key?(:bindings)
          @etag = args[:etag] if args.key?(:etag)
          @version = args[:version] if args.key?(:version)
        end
      end
      
      # Probe describes a health check to be performed against a container to
      # determine whether it is alive or ready to receive traffic.
      class Probe
        include Google::Apis::Core::Hashable
      
        # Minimum consecutive failures for the probe to be considered failed after
        # having succeeded. Defaults to 3. Minimum value is 1. +optional
        # Corresponds to the JSON property `failureThreshold`
        # @return [Fixnum]
        attr_accessor :failure_threshold
      
        # Handler defines a specific action that should be taken
        # Corresponds to the JSON property `handler`
        # @return [Google::Apis::RunV1alpha1::Handler]
        attr_accessor :handler
      
        # Number of seconds after the container has started before liveness probes
        # are initiated. More info:
        # https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-
        # probes
        # +optional
        # Corresponds to the JSON property `initialDelaySeconds`
        # @return [Fixnum]
        attr_accessor :initial_delay_seconds
      
        # How often (in seconds) to perform the probe.
        # Default to 10 seconds. Minimum value is 1.
        # +optional
        # Corresponds to the JSON property `periodSeconds`
        # @return [Fixnum]
        attr_accessor :period_seconds
      
        # Minimum consecutive successes for the probe to be considered successful
        # after having failed. Defaults to 1. Must be 1 for liveness. Minimum value
        # is 1. +optional
        # Corresponds to the JSON property `successThreshold`
        # @return [Fixnum]
        attr_accessor :success_threshold
      
        # Number of seconds after which the probe times out.
        # Defaults to 1 second. Minimum value is 1.
        # More info:
        # https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-
        # probes
        # +optional
        # Corresponds to the JSON property `timeoutSeconds`
        # @return [Fixnum]
        attr_accessor :timeout_seconds
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @failure_threshold = args[:failure_threshold] if args.key?(:failure_threshold)
          @handler = args[:handler] if args.key?(:handler)
          @initial_delay_seconds = args[:initial_delay_seconds] if args.key?(:initial_delay_seconds)
          @period_seconds = args[:period_seconds] if args.key?(:period_seconds)
          @success_threshold = args[:success_threshold] if args.key?(:success_threshold)
          @timeout_seconds = args[:timeout_seconds] if args.key?(:timeout_seconds)
        end
      end
      
      # 
      class PubSub
        include Google::Apis::Core::Hashable
      
        # The API version for this call such as "events.cloud.google.com/v1alpha1".
        # Corresponds to the JSON property `apiVersion`
        # @return [String]
        attr_accessor :api_version
      
        # The kind of resource, in this case "PubSub".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # ObjectMeta is metadata that all persisted resources must have, which includes
        # all objects users must create.
        # Corresponds to the JSON property `metadata`
        # @return [Google::Apis::RunV1alpha1::ObjectMeta]
        attr_accessor :metadata
      
        # The desired state of the PubSub.
        # Corresponds to the JSON property `spec`
        # @return [Google::Apis::RunV1alpha1::PubSubSpec]
        attr_accessor :spec
      
        # PubSubStatus represents the current state of a PubSub.
        # Corresponds to the JSON property `status`
        # @return [Google::Apis::RunV1alpha1::PubSubStatus]
        attr_accessor :status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @api_version = args[:api_version] if args.key?(:api_version)
          @kind = args[:kind] if args.key?(:kind)
          @metadata = args[:metadata] if args.key?(:metadata)
          @spec = args[:spec] if args.key?(:spec)
          @status = args[:status] if args.key?(:status)
        end
      end
      
      # The desired state of the PubSub.
      class PubSubSpec
        include Google::Apis::Core::Hashable
      
        # AckDeadline is the default maximum time after a subscriber receives a
        # message before the subscriber should acknowledge the message. Defaults
        # to 30 seconds ('30s').
        # +optional
        # Corresponds to the JSON property `ackDeadline`
        # @return [String]
        attr_accessor :ack_deadline
      
        # CloudEventOverrides defines arguments for a Source that control the output
        # format of the CloudEvents produced by the Source.
        # Corresponds to the JSON property `ceOverrides`
        # @return [Google::Apis::RunV1alpha1::CloudEventOverrides]
        attr_accessor :ce_overrides
      
        # Project is the ID of the Google Cloud Project that the PubSub Topic exists
        # in. If omitted, defaults to same as the cluster. +optional
        # Corresponds to the JSON property `project`
        # @return [String]
        attr_accessor :project
      
        # Cloud Run fully managed: not supported
        # Cloud Run on GKE: supported
        # SecretKeySelector selects a key of a Secret.
        # Corresponds to the JSON property `pubsubSecret`
        # @return [Google::Apis::RunV1alpha1::SecretKeySelector]
        attr_accessor :pubsub_secret
      
        # RetainAckedMessages defines whether to retain acknowledged messages. If
        # true, acknowledged messages will not be expunged until they fall out of
        # the RetentionDuration window.
        # Corresponds to the JSON property `retainAckedMessages`
        # @return [Boolean]
        attr_accessor :retain_acked_messages
        alias_method :retain_acked_messages?, :retain_acked_messages
      
        # RetentionDuration defines how long to retain messages in backlog, from
        # the time of publish. If RetainAckedMessages is true, this duration
        # affects the retention of acknowledged messages, otherwise only
        # unacknowledged messages are retained. Cannot be longer than 7 days or
        # shorter than 10 minutes. Defaults to 7 days ('7d').
        # +optional
        # Corresponds to the JSON property `retentionDuration`
        # @return [String]
        attr_accessor :retention_duration
      
        # Cloud Run fully managed: not supported
        # Cloud Run on GKE: supported
        # SecretKeySelector selects a key of a Secret.
        # Corresponds to the JSON property `secret`
        # @return [Google::Apis::RunV1alpha1::SecretKeySelector]
        attr_accessor :secret
      
        # Sink is a reference to an object that will resolve to a domain name or a
        # URI directly to use as the sink.
        # Corresponds to the JSON property `sink`
        # @return [Google::Apis::RunV1alpha1::Destination]
        attr_accessor :sink
      
        # Topic is the ID of the PubSub Topic to Subscribe to. It must
        # be in the form of the unique identifier within the project, not the
        # entire name. E.g. it must be 'laconia', not
        # 'projects/my-proj/topics/laconia'.
        # Corresponds to the JSON property `topic`
        # @return [String]
        attr_accessor :topic
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @ack_deadline = args[:ack_deadline] if args.key?(:ack_deadline)
          @ce_overrides = args[:ce_overrides] if args.key?(:ce_overrides)
          @project = args[:project] if args.key?(:project)
          @pubsub_secret = args[:pubsub_secret] if args.key?(:pubsub_secret)
          @retain_acked_messages = args[:retain_acked_messages] if args.key?(:retain_acked_messages)
          @retention_duration = args[:retention_duration] if args.key?(:retention_duration)
          @secret = args[:secret] if args.key?(:secret)
          @sink = args[:sink] if args.key?(:sink)
          @topic = args[:topic] if args.key?(:topic)
        end
      end
      
      # PubSubStatus represents the current state of a PubSub.
      class PubSubStatus
        include Google::Apis::Core::Hashable
      
        # Array of observed PubSubConditions, indicating the current state
        # of the PubSub.
        # Corresponds to the JSON property `conditions`
        # @return [Array<Google::Apis::RunV1alpha1::Condition>]
        attr_accessor :conditions
      
        # ObservedGeneration is the 'Generation' of the PubSub that
        # was last processed by the controller.
        # Corresponds to the JSON property `observedGeneration`
        # @return [Fixnum]
        attr_accessor :observed_generation
      
        # SinkURI is the current active sink URI that has been configured for the
        # Source.
        # +optional
        # Corresponds to the JSON property `sinkUri`
        # @return [String]
        attr_accessor :sink_uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @conditions = args[:conditions] if args.key?(:conditions)
          @observed_generation = args[:observed_generation] if args.key?(:observed_generation)
          @sink_uri = args[:sink_uri] if args.key?(:sink_uri)
        end
      end
      
      # The view model of a single quantity, e.g. "800 MiB". Corresponds to
      # https://github.com/kubernetes/kubernetes/blob/master/staging/src/k8s.io/
      # apimachinery/pkg/api/resource/generated.proto
      class Quantity
        include Google::Apis::Core::Hashable
      
        # Stringified version of the quantity, e.g., "800 MiB".
        # Corresponds to the JSON property `string`
        # @return [String]
        attr_accessor :string
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @string = args[:string] if args.key?(:string)
        end
      end
      
      # A DNS resource record.
      class ResourceRecord
        include Google::Apis::Core::Hashable
      
        # Relative name of the object affected by this record. Only applicable for
        # `CNAME` records. Example: 'www'.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Data for this record. Values vary by record type, as defined in RFC 1035
        # (section 5) and RFC 1034 (section 3.6.1).
        # Corresponds to the JSON property `rrdata`
        # @return [String]
        attr_accessor :rrdata
      
        # Resource record type. Example: `AAAA`.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @rrdata = args[:rrdata] if args.key?(:rrdata)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # ResourceRequirements describes the compute resource requirements.
      class ResourceRequirements
        include Google::Apis::Core::Hashable
      
        # Limits describes the maximum amount of compute resources allowed.
        # The values of the map is string form of the 'quantity' k8s type:
        # https://github.com/kubernetes/kubernetes/blob/master/staging/src/k8s.io/
        # apimachinery/pkg/api/resource/quantity.go
        # Corresponds to the JSON property `limits`
        # @return [Hash<String,String>]
        attr_accessor :limits
      
        # Limits describes the maximum amount of compute resources allowed.
        # This is a temporary field created to migrate away from the
        # map<string, Quantity> limits field. This is done to become compliant
        # with k8s style API.
        # This field is deprecated in favor of limits field.
        # Corresponds to the JSON property `limitsInMap`
        # @return [Hash<String,Google::Apis::RunV1alpha1::Quantity>]
        attr_accessor :limits_in_map
      
        # Requests describes the minimum amount of compute resources required.
        # If Requests is omitted for a container, it defaults to Limits if that is
        # explicitly specified, otherwise to an implementation-defined value.
        # The values of the map is string form of the 'quantity' k8s type:
        # https://github.com/kubernetes/kubernetes/blob/master/staging/src/k8s.io/
        # apimachinery/pkg/api/resource/quantity.go
        # Corresponds to the JSON property `requests`
        # @return [Hash<String,String>]
        attr_accessor :requests
      
        # Requests describes the minimum amount of compute resources required.
        # If Requests is omitted for a container, it defaults to Limits if that is
        # explicitly specified, otherwise to an implementation-defined value.
        # This is a temporary field created to migrate away from the
        # map<string, Quantity> requests field. This is done to become compliant
        # with k8s style API.
        # This field is deprecated in favor of requests field.
        # Corresponds to the JSON property `requestsInMap`
        # @return [Hash<String,Google::Apis::RunV1alpha1::Quantity>]
        attr_accessor :requests_in_map
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @limits = args[:limits] if args.key?(:limits)
          @limits_in_map = args[:limits_in_map] if args.key?(:limits_in_map)
          @requests = args[:requests] if args.key?(:requests)
          @requests_in_map = args[:requests_in_map] if args.key?(:requests_in_map)
        end
      end
      
      # Revision is an immutable snapshot of code and configuration.  A revision
      # references a container image. Revisions are created by updates to a
      # Configuration.
      # Cloud Run does not currently support referencing a build that is responsible
      # for materializing the container image from source.
      # See also:
      # https://github.com/knative/serving/blob/master/docs/spec/overview.md#revision
      class Revision
        include Google::Apis::Core::Hashable
      
        # The API version for this call such as "serving.knative.dev/v1alpha1".
        # Corresponds to the JSON property `apiVersion`
        # @return [String]
        attr_accessor :api_version
      
        # The kind of this resource, in this case "Revision".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # ObjectMeta is metadata that all persisted resources must have, which includes
        # all objects users must create.
        # Corresponds to the JSON property `metadata`
        # @return [Google::Apis::RunV1alpha1::ObjectMeta]
        attr_accessor :metadata
      
        # RevisionSpec holds the desired state of the Revision (from the client).
        # Corresponds to the JSON property `spec`
        # @return [Google::Apis::RunV1alpha1::RevisionSpec]
        attr_accessor :spec
      
        # RevisionStatus communicates the observed state of the Revision (from the
        # controller).
        # Corresponds to the JSON property `status`
        # @return [Google::Apis::RunV1alpha1::RevisionStatus]
        attr_accessor :status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @api_version = args[:api_version] if args.key?(:api_version)
          @kind = args[:kind] if args.key?(:kind)
          @metadata = args[:metadata] if args.key?(:metadata)
          @spec = args[:spec] if args.key?(:spec)
          @status = args[:status] if args.key?(:status)
        end
      end
      
      # RevisionCondition defines a readiness condition for a Revision.
      class RevisionCondition
        include Google::Apis::Core::Hashable
      
        # Last time the condition transitioned from one status to another.
        # +optional
        # Corresponds to the JSON property `lastTransitionTime`
        # @return [String]
        attr_accessor :last_transition_time
      
        # Human readable message indicating details about the current status.
        # +optional
        # Corresponds to the JSON property `message`
        # @return [String]
        attr_accessor :message
      
        # One-word CamelCase reason for the condition's last transition.
        # +optional
        # Corresponds to the JSON property `reason`
        # @return [String]
        attr_accessor :reason
      
        # How to interpret failures of this condition, one of Error, Warning, Info
        # +optional
        # Corresponds to the JSON property `severity`
        # @return [String]
        attr_accessor :severity
      
        # Status of the condition, one of True, False, Unknown.
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        # RevisionConditionType is used to communicate the status of the
        # reconciliation process. See also:
        # https://github.com/knative/serving/blob/master/docs/spec/errors.md#error-
        # conditions-and-reporting
        # Types include:
        # * "Ready": True when the Revision is ready.
        # * "ResourcesAvailable": True when underlying resources have been
        # provisioned.
        # * "ContainerHealthy": True when the Revision readiness check completes.
        # * "Active": True when the Revision may receive traffic.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @last_transition_time = args[:last_transition_time] if args.key?(:last_transition_time)
          @message = args[:message] if args.key?(:message)
          @reason = args[:reason] if args.key?(:reason)
          @severity = args[:severity] if args.key?(:severity)
          @status = args[:status] if args.key?(:status)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # RevisionSpec holds the desired state of the Revision (from the client).
      class RevisionSpec
        include Google::Apis::Core::Hashable
      
        # ConcurrencyModel specifies the desired concurrency model
        # (Single or Multi) for the Revision. Defaults to Multi.
        # Deprecated in favor of ContainerConcurrency.
        # +optional
        # Corresponds to the JSON property `concurrencyModel`
        # @return [String]
        attr_accessor :concurrency_model
      
        # A single application container.
        # This specifies both the container to run, the command to run in the container
        # and the arguments to supply to it.
        # Note that additional arguments may be supplied by the system to the container
        # at runtime.
        # Corresponds to the JSON property `container`
        # @return [Google::Apis::RunV1alpha1::Container]
        attr_accessor :container
      
        # (Optional)
        # ContainerConcurrency specifies the maximum allowed in-flight (concurrent)
        # requests per container instance of the Revision.
        # Cloud Run fully managed: supported, defaults to 80
        # Cloud Run on GKE: supported, defaults to 0, which means concurrency
        # to the application is not limited, and the system decides the
        # target concurrency for the autoscaler.
        # Corresponds to the JSON property `containerConcurrency`
        # @return [Fixnum]
        attr_accessor :container_concurrency
      
        # Containers holds the single container that defines the unit of execution
        # for this Revision. In the context of a Revision, we disallow a number of
        # fields on this Container, including: name and lifecycle.
        # In Cloud Run, only a single container may be provided.
        # Corresponds to the JSON property `containers`
        # @return [Array<Google::Apis::RunV1alpha1::Container>]
        attr_accessor :containers
      
        # Deprecated and not currently populated by Cloud Run. See
        # metadata.generation instead, which is the sequence number containing the
        # latest generation of the desired state.
        # Read-only.
        # Corresponds to the JSON property `generation`
        # @return [Fixnum]
        attr_accessor :generation
      
        # Email address of the IAM service account associated with the revision
        # of the service. The service account represents the identity of the
        # running revision, and determines what permissions the revision has. If
        # not provided, the revision will use the project's default service account.
        # Corresponds to the JSON property `serviceAccountName`
        # @return [String]
        attr_accessor :service_account_name
      
        # ServingState holds a value describing the state the resources
        # are in for this Revision.
        # Users must not specify this when creating a revision. It is expected
        # that the system will manipulate this based on routability and load.
        # Populated by the system.
        # Read-only.
        # Corresponds to the JSON property `servingState`
        # @return [String]
        attr_accessor :serving_state
      
        # TimeoutSeconds holds the max duration the instance is allowed for
        # responding to a request.
        # Not currently used by Cloud Run.
        # Corresponds to the JSON property `timeoutSeconds`
        # @return [Fixnum]
        attr_accessor :timeout_seconds
      
        # 
        # Corresponds to the JSON property `volumes`
        # @return [Array<Google::Apis::RunV1alpha1::Volume>]
        attr_accessor :volumes
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @concurrency_model = args[:concurrency_model] if args.key?(:concurrency_model)
          @container = args[:container] if args.key?(:container)
          @container_concurrency = args[:container_concurrency] if args.key?(:container_concurrency)
          @containers = args[:containers] if args.key?(:containers)
          @generation = args[:generation] if args.key?(:generation)
          @service_account_name = args[:service_account_name] if args.key?(:service_account_name)
          @serving_state = args[:serving_state] if args.key?(:serving_state)
          @timeout_seconds = args[:timeout_seconds] if args.key?(:timeout_seconds)
          @volumes = args[:volumes] if args.key?(:volumes)
        end
      end
      
      # RevisionStatus communicates the observed state of the Revision (from the
      # controller).
      class RevisionStatus
        include Google::Apis::Core::Hashable
      
        # Conditions communicates information about ongoing/complete
        # reconciliation processes that bring the "spec" inline with the observed
        # state of the world.
        # As a Revision is being prepared, it will incrementally
        # update conditions "ResourcesAvailable", "ContainerHealthy", and "Active",
        # which contribute to the overall "Ready" condition.
        # Corresponds to the JSON property `conditions`
        # @return [Array<Google::Apis::RunV1alpha1::RevisionCondition>]
        attr_accessor :conditions
      
        # ImageDigest holds the resolved digest for the image specified
        # within .Spec.Container.Image. The digest is resolved during the creation
        # of Revision. This field holds the digest value regardless of whether
        # a tag or digest was originally specified in the Container object.
        # Corresponds to the JSON property `imageDigest`
        # @return [String]
        attr_accessor :image_digest
      
        # Specifies the generated logging url for this particular revision
        # based on the revision url template specified in the controller's config.
        # +optional
        # Corresponds to the JSON property `logUrl`
        # @return [String]
        attr_accessor :log_url
      
        # ObservedGeneration is the 'Generation' of the Revision that
        # was last processed by the controller.
        # Clients polling for completed reconciliation should poll until
        # observedGeneration = metadata.generation, and the Ready condition's status
        # is True or False.
        # Corresponds to the JSON property `observedGeneration`
        # @return [Fixnum]
        attr_accessor :observed_generation
      
        # Not currently used by Cloud Run.
        # Corresponds to the JSON property `serviceName`
        # @return [String]
        attr_accessor :service_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @conditions = args[:conditions] if args.key?(:conditions)
          @image_digest = args[:image_digest] if args.key?(:image_digest)
          @log_url = args[:log_url] if args.key?(:log_url)
          @observed_generation = args[:observed_generation] if args.key?(:observed_generation)
          @service_name = args[:service_name] if args.key?(:service_name)
        end
      end
      
      # RevisionTemplateSpec describes the data a revision should have when created
      # from a template. Based on:
      # https://github.com/kubernetes/api/blob/e771f807/core/v1/types.go#L3179-L3190
      class RevisionTemplate
        include Google::Apis::Core::Hashable
      
        # ObjectMeta is metadata that all persisted resources must have, which includes
        # all objects users must create.
        # Corresponds to the JSON property `metadata`
        # @return [Google::Apis::RunV1alpha1::ObjectMeta]
        attr_accessor :metadata
      
        # RevisionSpec holds the desired state of the Revision (from the client).
        # Corresponds to the JSON property `spec`
        # @return [Google::Apis::RunV1alpha1::RevisionSpec]
        attr_accessor :spec
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @metadata = args[:metadata] if args.key?(:metadata)
          @spec = args[:spec] if args.key?(:spec)
        end
      end
      
      # Route is responsible for configuring ingress over a collection of Revisions.
      # Some of the Revisions a Route distributes traffic over may be specified by
      # referencing the Configuration responsible for creating them; in these cases
      # the Route is additionally responsible for monitoring the Configuration for
      # "latest ready" revision changes, and smoothly rolling out latest revisions.
      # See also:
      # https://github.com/knative/serving/blob/master/docs/spec/overview.md#route
      # Cloud Run currently supports referencing a single Configuration to
      # automatically deploy the "latest ready" Revision from that Configuration.
      class Route
        include Google::Apis::Core::Hashable
      
        # The API version for this call such as "serving.knative.dev/v1alpha1".
        # Corresponds to the JSON property `apiVersion`
        # @return [String]
        attr_accessor :api_version
      
        # The kind of this resource, in this case always "Route".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # ObjectMeta is metadata that all persisted resources must have, which includes
        # all objects users must create.
        # Corresponds to the JSON property `metadata`
        # @return [Google::Apis::RunV1alpha1::ObjectMeta]
        attr_accessor :metadata
      
        # RouteSpec holds the desired state of the Route (from the client).
        # Corresponds to the JSON property `spec`
        # @return [Google::Apis::RunV1alpha1::RouteSpec]
        attr_accessor :spec
      
        # RouteStatus communicates the observed state of the Route (from the
        # controller).
        # Corresponds to the JSON property `status`
        # @return [Google::Apis::RunV1alpha1::RouteStatus]
        attr_accessor :status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @api_version = args[:api_version] if args.key?(:api_version)
          @kind = args[:kind] if args.key?(:kind)
          @metadata = args[:metadata] if args.key?(:metadata)
          @spec = args[:spec] if args.key?(:spec)
          @status = args[:status] if args.key?(:status)
        end
      end
      
      # RouteCondition defines a readiness condition for a Route.
      class RouteCondition
        include Google::Apis::Core::Hashable
      
        # Last time the condition transitioned from one status to another.
        # +optional
        # Corresponds to the JSON property `lastTransitionTime`
        # @return [String]
        attr_accessor :last_transition_time
      
        # Human-readable message indicating details about last transition.
        # +optional
        # Corresponds to the JSON property `message`
        # @return [String]
        attr_accessor :message
      
        # One-word CamelCase reason for the condition's last transition.
        # +optional
        # Corresponds to the JSON property `reason`
        # @return [String]
        attr_accessor :reason
      
        # How to interpret failures of this condition, one of Error, Warning, Info
        # +optional
        # Corresponds to the JSON property `severity`
        # @return [String]
        attr_accessor :severity
      
        # Status of the condition, one of "True", "False", "Unknown".
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        # RouteConditionType is used to communicate the status of the reconciliation
        # process. See also:
        # https://github.com/knative/serving/blob/master/docs/spec/errors.md#error-
        # conditions-and-reporting
        # Types include: "Ready".
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @last_transition_time = args[:last_transition_time] if args.key?(:last_transition_time)
          @message = args[:message] if args.key?(:message)
          @reason = args[:reason] if args.key?(:reason)
          @severity = args[:severity] if args.key?(:severity)
          @status = args[:status] if args.key?(:status)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # RouteSpec holds the desired state of the Route (from the client).
      class RouteSpec
        include Google::Apis::Core::Hashable
      
        # Deprecated and not currently populated by Cloud Run. See
        # metadata.generation instead, which is the sequence number containing the
        # latest generation of the desired state.
        # Read-only.
        # Corresponds to the JSON property `generation`
        # @return [Fixnum]
        attr_accessor :generation
      
        # Traffic specifies how to distribute traffic over a collection of Knative
        # Revisions and Configurations.
        # Cloud Run currently supports a single configurationName.
        # Corresponds to the JSON property `traffic`
        # @return [Array<Google::Apis::RunV1alpha1::TrafficTarget>]
        attr_accessor :traffic
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @generation = args[:generation] if args.key?(:generation)
          @traffic = args[:traffic] if args.key?(:traffic)
        end
      end
      
      # RouteStatus communicates the observed state of the Route (from the
      # controller).
      class RouteStatus
        include Google::Apis::Core::Hashable
      
        # Information for connecting over HTTP(s).
        # Corresponds to the JSON property `address`
        # @return [Google::Apis::RunV1alpha1::Addressable]
        attr_accessor :address
      
        # Conditions communicates information about ongoing/complete
        # reconciliation processes that bring the "spec" inline with the observed
        # state of the world.
        # Corresponds to the JSON property `conditions`
        # @return [Array<Google::Apis::RunV1alpha1::RouteCondition>]
        attr_accessor :conditions
      
        # Deprecated - use url instead.
        # Domain holds the top-level domain that will distribute traffic over the
        # provided targets.
        # Corresponds to the JSON property `domain`
        # @return [String]
        attr_accessor :domain
      
        # Deprecated - use address instead.
        # For Cloud Run, identifical to domain.
        # Corresponds to the JSON property `domainInternal`
        # @return [String]
        attr_accessor :domain_internal
      
        # ObservedGeneration is the 'Generation' of the Route that
        # was last processed by the controller.
        # Clients polling for completed reconciliation should poll until
        # observedGeneration = metadata.generation and the Ready condition's status
        # is True or False.
        # Note that providing a trafficTarget that only has a configurationName will
        # result in a Route that does not increment either its metadata.generation or
        # its observedGeneration, as new "latest ready" revisions from the
        # Configuration are processed without an update to the Route's spec.
        # Corresponds to the JSON property `observedGeneration`
        # @return [Fixnum]
        attr_accessor :observed_generation
      
        # Traffic holds the configured traffic distribution.
        # These entries will always contain RevisionName references.
        # When ConfigurationName appears in the spec, this will hold the
        # LatestReadyRevisionName that we last observed.
        # Corresponds to the JSON property `traffic`
        # @return [Array<Google::Apis::RunV1alpha1::TrafficTarget>]
        attr_accessor :traffic
      
        # URL holds the url that will distribute traffic over the provided traffic
        # targets. It generally has the form
        # https://`route-hash`-`project-hash`-`cluster-level-suffix`.a.run.app
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @address = args[:address] if args.key?(:address)
          @conditions = args[:conditions] if args.key?(:conditions)
          @domain = args[:domain] if args.key?(:domain)
          @domain_internal = args[:domain_internal] if args.key?(:domain_internal)
          @observed_generation = args[:observed_generation] if args.key?(:observed_generation)
          @traffic = args[:traffic] if args.key?(:traffic)
          @url = args[:url] if args.key?(:url)
        end
      end
      
      # SELinuxOptions are the labels to be applied to the container
      class SeLinuxOptions
        include Google::Apis::Core::Hashable
      
        # Level is SELinux level label that applies to the container.
        # +optional
        # Corresponds to the JSON property `level`
        # @return [String]
        attr_accessor :level
      
        # Role is a SELinux role label that applies to the container.
        # +optional
        # Corresponds to the JSON property `role`
        # @return [String]
        attr_accessor :role
      
        # Type is a SELinux type label that applies to the container.
        # +optional
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # User is a SELinux user label that applies to the container.
        # +optional
        # Corresponds to the JSON property `user`
        # @return [String]
        attr_accessor :user
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @level = args[:level] if args.key?(:level)
          @role = args[:role] if args.key?(:role)
          @type = args[:type] if args.key?(:type)
          @user = args[:user] if args.key?(:user)
        end
      end
      
      # SecretEnvSource selects a Secret to populate the environment
      # variables with.
      # The contents of the target Secret's Data field will represent the
      # key-value pairs as environment variables.
      class SecretEnvSource
        include Google::Apis::Core::Hashable
      
        # LocalObjectReference contains enough information to let you locate the
        # referenced object inside the same namespace.
        # Corresponds to the JSON property `localObjectReference`
        # @return [Google::Apis::RunV1alpha1::LocalObjectReference]
        attr_accessor :local_object_reference
      
        # Cloud Run fully managed: not supported
        # Cloud Run for Anthos: supported
        # The Secret to select from.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Cloud Run fully managed: not supported
        # Cloud Run for Anthos: supported
        # Specify whether the Secret must be defined
        # +optional
        # Corresponds to the JSON property `optional`
        # @return [Boolean]
        attr_accessor :optional
        alias_method :optional?, :optional
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @local_object_reference = args[:local_object_reference] if args.key?(:local_object_reference)
          @name = args[:name] if args.key?(:name)
          @optional = args[:optional] if args.key?(:optional)
        end
      end
      
      # Cloud Run fully managed: not supported
      # Cloud Run on GKE: supported
      # SecretKeySelector selects a key of a Secret.
      class SecretKeySelector
        include Google::Apis::Core::Hashable
      
        # Cloud Run fully managed: not supported
        # Cloud Run on GKE: supported
        # The key of the secret to select from.  Must be a valid secret key.
        # Corresponds to the JSON property `key`
        # @return [String]
        attr_accessor :key
      
        # LocalObjectReference contains enough information to let you locate the
        # referenced object inside the same namespace.
        # Corresponds to the JSON property `localObjectReference`
        # @return [Google::Apis::RunV1alpha1::LocalObjectReference]
        attr_accessor :local_object_reference
      
        # Cloud Run fully managed: not supported
        # Cloud Run on GKE: supported
        # The name of the secret in the pod's namespace to select from.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Cloud Run fully managed: not supported
        # Cloud Run on GKE: supported
        # Specify whether the Secret or its key must be defined
        # +optional
        # Corresponds to the JSON property `optional`
        # @return [Boolean]
        attr_accessor :optional
        alias_method :optional?, :optional
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @key = args[:key] if args.key?(:key)
          @local_object_reference = args[:local_object_reference] if args.key?(:local_object_reference)
          @name = args[:name] if args.key?(:name)
          @optional = args[:optional] if args.key?(:optional)
        end
      end
      
      # The contents of the target Secret's Data field will be presented in a volume
      # as files using the keys in the Data field as the file names.
      class SecretVolumeSource
        include Google::Apis::Core::Hashable
      
        # Mode bits to use on created files by default. Must be a value between 0 and
        # 0777. Defaults to 0644. Directories within the path are not affected by
        # this setting. This might be in conflict with other options that affect the
        # file mode, like fsGroup, and the result can be other mode bits set.
        # Corresponds to the JSON property `defaultMode`
        # @return [Fixnum]
        attr_accessor :default_mode
      
        # If unspecified, each key-value pair in the Data field of the referenced
        # Secret will be projected into the volume as a file whose name is the
        # key and content is the value. If specified, the listed keys will be
        # projected into the specified paths, and unlisted keys will not be
        # present. If a key is specified which is not present in the Secret,
        # the volume setup will error unless it is marked optional.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::RunV1alpha1::KeyToPath>]
        attr_accessor :items
      
        # Specify whether the Secret or its keys must be defined.
        # Corresponds to the JSON property `optional`
        # @return [Boolean]
        attr_accessor :optional
        alias_method :optional?, :optional
      
        # Name of the secret in the container's namespace to use.
        # Corresponds to the JSON property `secretName`
        # @return [String]
        attr_accessor :secret_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @default_mode = args[:default_mode] if args.key?(:default_mode)
          @items = args[:items] if args.key?(:items)
          @optional = args[:optional] if args.key?(:optional)
          @secret_name = args[:secret_name] if args.key?(:secret_name)
        end
      end
      
      # SecurityContext holds security configuration that will be applied to a
      # container. Some fields are present in both SecurityContext and
      # PodSecurityContext.  When both are set, the values in SecurityContext take
      # precedence.
      class SecurityContext
        include Google::Apis::Core::Hashable
      
        # AllowPrivilegeEscalation controls whether a process can gain more
        # privileges than its parent process. This bool directly controls if
        # the no_new_privs flag will be set on the container process.
        # AllowPrivilegeEscalation is true always when the container is:
        # 1) run as Privileged
        # 2) has CAP_SYS_ADMIN
        # +optional
        # Corresponds to the JSON property `allowPrivilegeEscalation`
        # @return [Boolean]
        attr_accessor :allow_privilege_escalation
        alias_method :allow_privilege_escalation?, :allow_privilege_escalation
      
        # Adds and removes POSIX capabilities from running containers.
        # Corresponds to the JSON property `capabilities`
        # @return [Google::Apis::RunV1alpha1::Capabilities]
        attr_accessor :capabilities
      
        # Run container in privileged mode.
        # Processes in privileged containers are essentially equivalent to root on
        # the host. Defaults to false. +optional
        # Corresponds to the JSON property `privileged`
        # @return [Boolean]
        attr_accessor :privileged
        alias_method :privileged?, :privileged
      
        # Whether this container has a read-only root filesystem.
        # Default is false.
        # +optional
        # Corresponds to the JSON property `readOnlyRootFilesystem`
        # @return [Boolean]
        attr_accessor :read_only_root_filesystem
        alias_method :read_only_root_filesystem?, :read_only_root_filesystem
      
        # The GID to run the entrypoint of the container process.
        # Uses runtime default if unset.
        # May also be set in PodSecurityContext.  If set in both SecurityContext and
        # PodSecurityContext, the value specified in SecurityContext takes
        # precedence. +optional
        # Corresponds to the JSON property `runAsGroup`
        # @return [Fixnum]
        attr_accessor :run_as_group
      
        # Indicates that the container must run as a non-root user.
        # If true, the Kubelet will validate the image at runtime to ensure that it
        # does not run as UID 0 (root) and fail to start the container if it does.
        # If unset or false, no such validation will be performed.
        # May also be set in PodSecurityContext.  If set in both SecurityContext and
        # PodSecurityContext, the value specified in SecurityContext takes
        # precedence. +optional
        # Corresponds to the JSON property `runAsNonRoot`
        # @return [Boolean]
        attr_accessor :run_as_non_root
        alias_method :run_as_non_root?, :run_as_non_root
      
        # The UID to run the entrypoint of the container process.
        # Defaults to user specified in image metadata if unspecified.
        # May also be set in PodSecurityContext.  If set in both SecurityContext and
        # PodSecurityContext, the value specified in SecurityContext takes
        # precedence. +optional
        # Corresponds to the JSON property `runAsUser`
        # @return [Fixnum]
        attr_accessor :run_as_user
      
        # SELinuxOptions are the labels to be applied to the container
        # Corresponds to the JSON property `seLinuxOptions`
        # @return [Google::Apis::RunV1alpha1::SeLinuxOptions]
        attr_accessor :se_linux_options
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @allow_privilege_escalation = args[:allow_privilege_escalation] if args.key?(:allow_privilege_escalation)
          @capabilities = args[:capabilities] if args.key?(:capabilities)
          @privileged = args[:privileged] if args.key?(:privileged)
          @read_only_root_filesystem = args[:read_only_root_filesystem] if args.key?(:read_only_root_filesystem)
          @run_as_group = args[:run_as_group] if args.key?(:run_as_group)
          @run_as_non_root = args[:run_as_non_root] if args.key?(:run_as_non_root)
          @run_as_user = args[:run_as_user] if args.key?(:run_as_user)
          @se_linux_options = args[:se_linux_options] if args.key?(:se_linux_options)
        end
      end
      
      # Service acts as a top-level container that manages a set of Routes and
      # Configurations which implement a network service. Service exists to provide a
      # singular abstraction which can be access controlled, reasoned about, and
      # which encapsulates software lifecycle decisions such as rollout policy and
      # team resource ownership. Service acts only as an orchestrator of the
      # underlying Routes and Configurations (much as a kubernetes Deployment
      # orchestrates ReplicaSets).
      # The Service's controller will track the statuses of its owned Configuration
      # and Route, reflecting their statuses and conditions as its own.
      # See also:
      # https://github.com/knative/serving/blob/master/docs/spec/overview.md#service
      class Service
        include Google::Apis::Core::Hashable
      
        # The API version for this call such as "serving.knative.dev/v1alpha1".
        # Corresponds to the JSON property `apiVersion`
        # @return [String]
        attr_accessor :api_version
      
        # The kind of resource, in this case "Service".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # ObjectMeta is metadata that all persisted resources must have, which includes
        # all objects users must create.
        # Corresponds to the JSON property `metadata`
        # @return [Google::Apis::RunV1alpha1::ObjectMeta]
        attr_accessor :metadata
      
        # ServiceSpec holds the desired state of the Route (from the client), which
        # is used to manipulate the underlying Route and Configuration(s).
        # Corresponds to the JSON property `spec`
        # @return [Google::Apis::RunV1alpha1::ServiceSpec]
        attr_accessor :spec
      
        # The current state of the Service. Output only.
        # Corresponds to the JSON property `status`
        # @return [Google::Apis::RunV1alpha1::ServiceStatus]
        attr_accessor :status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @api_version = args[:api_version] if args.key?(:api_version)
          @kind = args[:kind] if args.key?(:kind)
          @metadata = args[:metadata] if args.key?(:metadata)
          @spec = args[:spec] if args.key?(:spec)
          @status = args[:status] if args.key?(:status)
        end
      end
      
      # ServiceCondition defines a readiness condition for a Service.
      class ServiceCondition
        include Google::Apis::Core::Hashable
      
        # Last time the condition transitioned from one status to another.
        # +optional
        # Corresponds to the JSON property `lastTransitionTime`
        # @return [String]
        attr_accessor :last_transition_time
      
        # Human-readable message indicating details about last transition.
        # +optional
        # Corresponds to the JSON property `message`
        # @return [String]
        attr_accessor :message
      
        # One-word CamelCase reason for the condition's last transition.
        # +optional
        # Corresponds to the JSON property `reason`
        # @return [String]
        attr_accessor :reason
      
        # How to interpret failures of this condition, one of Error, Warning, Info
        # +optional
        # Corresponds to the JSON property `severity`
        # @return [String]
        attr_accessor :severity
      
        # Status of the condition, one of True, False, Unknown.
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        # ServiceConditionType is used to communicate the status of the
        # reconciliation process. See also:
        # https://github.com/knative/serving/blob/master/docs/spec/errors.md#error-
        # conditions-and-reporting
        # Types include: "Ready", "ConfigurationsReady", and "RoutesReady". "Ready"
        # will be true when the underlying Route and Configuration are ready.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @last_transition_time = args[:last_transition_time] if args.key?(:last_transition_time)
          @message = args[:message] if args.key?(:message)
          @reason = args[:reason] if args.key?(:reason)
          @severity = args[:severity] if args.key?(:severity)
          @status = args[:status] if args.key?(:status)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # ServiceSpec holds the desired state of the Route (from the client), which
      # is used to manipulate the underlying Route and Configuration(s).
      class ServiceSpec
        include Google::Apis::Core::Hashable
      
        # Deprecated and not currently populated by Cloud Run. See
        # metadata.generation instead, which is the sequence number containing the
        # latest generation of the desired state.
        # Read-only.
        # Corresponds to the JSON property `generation`
        # @return [Fixnum]
        attr_accessor :generation
      
        # ServiceSpecManualType contains the options for configuring a manual service.
        # See ServiceSpec for more details.
        # Not currently supported by Cloud Run.
        # Corresponds to the JSON property `manual`
        # @return [Google::Apis::RunV1alpha1::ServiceSpecManualType]
        attr_accessor :manual
      
        # ServiceSpecPinnedType Pins this service to a specific revision name. The
        # revision must be owned by the configuration provided.
        # Deprecated and not supported by Cloud Run.
        # Corresponds to the JSON property `pinned`
        # @return [Google::Apis::RunV1alpha1::ServiceSpecPinnedType]
        attr_accessor :pinned
      
        # ServiceSpecReleaseType contains the options for slowly releasing revisions.
        # See ServiceSpec for more details.
        # Not currently supported by Cloud Run.
        # Corresponds to the JSON property `release`
        # @return [Google::Apis::RunV1alpha1::ServiceSpecReleaseType]
        attr_accessor :release
      
        # ServiceSpecRunLatest contains the options for always having a route to the
        # latest configuration. See ServiceSpec for more details.
        # Corresponds to the JSON property `runLatest`
        # @return [Google::Apis::RunV1alpha1::ServiceSpecRunLatest]
        attr_accessor :run_latest
      
        # RevisionTemplateSpec describes the data a revision should have when created
        # from a template. Based on:
        # https://github.com/kubernetes/api/blob/e771f807/core/v1/types.go#L3179-L3190
        # Corresponds to the JSON property `template`
        # @return [Google::Apis::RunV1alpha1::RevisionTemplate]
        attr_accessor :template
      
        # Traffic specifies how to distribute traffic over a collection of Knative
        # Revisions and Configurations.
        # Corresponds to the JSON property `traffic`
        # @return [Array<Google::Apis::RunV1alpha1::TrafficTarget>]
        attr_accessor :traffic
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @generation = args[:generation] if args.key?(:generation)
          @manual = args[:manual] if args.key?(:manual)
          @pinned = args[:pinned] if args.key?(:pinned)
          @release = args[:release] if args.key?(:release)
          @run_latest = args[:run_latest] if args.key?(:run_latest)
          @template = args[:template] if args.key?(:template)
          @traffic = args[:traffic] if args.key?(:traffic)
        end
      end
      
      # ServiceSpecManualType contains the options for configuring a manual service.
      # See ServiceSpec for more details.
      # Not currently supported by Cloud Run.
      class ServiceSpecManualType
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # ServiceSpecPinnedType Pins this service to a specific revision name. The
      # revision must be owned by the configuration provided.
      # Deprecated and not supported by Cloud Run.
      class ServiceSpecPinnedType
        include Google::Apis::Core::Hashable
      
        # ConfigurationSpec holds the desired state of the Configuration (from the
        # client).
        # Corresponds to the JSON property `configuration`
        # @return [Google::Apis::RunV1alpha1::ConfigurationSpec]
        attr_accessor :configuration
      
        # The revision name to pin this service to until changed
        # to a different service type.
        # Corresponds to the JSON property `revisionName`
        # @return [String]
        attr_accessor :revision_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @configuration = args[:configuration] if args.key?(:configuration)
          @revision_name = args[:revision_name] if args.key?(:revision_name)
        end
      end
      
      # ServiceSpecReleaseType contains the options for slowly releasing revisions.
      # See ServiceSpec for more details.
      # Not currently supported by Cloud Run.
      class ServiceSpecReleaseType
        include Google::Apis::Core::Hashable
      
        # ConfigurationSpec holds the desired state of the Configuration (from the
        # client).
        # Corresponds to the JSON property `configuration`
        # @return [Google::Apis::RunV1alpha1::ConfigurationSpec]
        attr_accessor :configuration
      
        # Revisions is an ordered list of 1 or 2 revisions. The first is the current
        # revision, and the second is the candidate revision. If a single revision
        # is provided, traffic will be pinned at that revision.
        # "@latest" is a shortcut for usage that refers to the latest created
        # revision by the configuration.
        # Corresponds to the JSON property `revisions`
        # @return [Array<String>]
        attr_accessor :revisions
      
        # RolloutPercent is the percent of traffic that should be sent to the
        # candidate revision, i.e. the 2nd revision in the revisions list.
        # Valid values are between 0 and 99 inclusive.
        # Corresponds to the JSON property `rolloutPercent`
        # @return [Fixnum]
        attr_accessor :rollout_percent
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @configuration = args[:configuration] if args.key?(:configuration)
          @revisions = args[:revisions] if args.key?(:revisions)
          @rollout_percent = args[:rollout_percent] if args.key?(:rollout_percent)
        end
      end
      
      # ServiceSpecRunLatest contains the options for always having a route to the
      # latest configuration. See ServiceSpec for more details.
      class ServiceSpecRunLatest
        include Google::Apis::Core::Hashable
      
        # ConfigurationSpec holds the desired state of the Configuration (from the
        # client).
        # Corresponds to the JSON property `configuration`
        # @return [Google::Apis::RunV1alpha1::ConfigurationSpec]
        attr_accessor :configuration
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @configuration = args[:configuration] if args.key?(:configuration)
        end
      end
      
      # The current state of the Service. Output only.
      class ServiceStatus
        include Google::Apis::Core::Hashable
      
        # Information for connecting over HTTP(s).
        # Corresponds to the JSON property `address`
        # @return [Google::Apis::RunV1alpha1::Addressable]
        attr_accessor :address
      
        # Conditions communicates information about ongoing/complete
        # reconciliation processes that bring the "spec" inline with the observed
        # state of the world.
        # Corresponds to the JSON property `conditions`
        # @return [Array<Google::Apis::RunV1alpha1::ServiceCondition>]
        attr_accessor :conditions
      
        # From RouteStatus.
        # Domain holds the top-level domain that will distribute traffic over the
        # provided targets. It generally has the form
        # https://`route-hash`-`project-hash`-`cluster-level-suffix`.a.run.app
        # Corresponds to the JSON property `domain`
        # @return [String]
        attr_accessor :domain
      
        # From ConfigurationStatus.
        # LatestCreatedRevisionName is the last revision that was created from this
        # Service's Configuration. It might not be ready yet, for that use
        # LatestReadyRevisionName.
        # Corresponds to the JSON property `latestCreatedRevisionName`
        # @return [String]
        attr_accessor :latest_created_revision_name
      
        # From ConfigurationStatus.
        # LatestReadyRevisionName holds the name of the latest Revision stamped out
        # from this Service's Configuration that has had its "Ready" condition become
        # "True".
        # Corresponds to the JSON property `latestReadyRevisionName`
        # @return [String]
        attr_accessor :latest_ready_revision_name
      
        # ObservedGeneration is the 'Generation' of the Route that
        # was last processed by the controller.
        # Clients polling for completed reconciliation should poll until
        # observedGeneration = metadata.generation and the Ready condition's status
        # is True or False.
        # Corresponds to the JSON property `observedGeneration`
        # @return [Fixnum]
        attr_accessor :observed_generation
      
        # From RouteStatus.
        # Traffic holds the configured traffic distribution.
        # These entries will always contain RevisionName references.
        # When ConfigurationName appears in the spec, this will hold the
        # LatestReadyRevisionName that we last observed.
        # Corresponds to the JSON property `traffic`
        # @return [Array<Google::Apis::RunV1alpha1::TrafficTarget>]
        attr_accessor :traffic
      
        # From RouteStatus.
        # URL holds the url that will distribute traffic over the provided traffic
        # targets. It generally has the form
        # https://`route-hash`-`project-hash`-`cluster-level-suffix`.a.run.app
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @address = args[:address] if args.key?(:address)
          @conditions = args[:conditions] if args.key?(:conditions)
          @domain = args[:domain] if args.key?(:domain)
          @latest_created_revision_name = args[:latest_created_revision_name] if args.key?(:latest_created_revision_name)
          @latest_ready_revision_name = args[:latest_ready_revision_name] if args.key?(:latest_ready_revision_name)
          @observed_generation = args[:observed_generation] if args.key?(:observed_generation)
          @traffic = args[:traffic] if args.key?(:traffic)
          @url = args[:url] if args.key?(:url)
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
        # @return [Google::Apis::RunV1alpha1::Policy]
        attr_accessor :policy
      
        # OPTIONAL: A FieldMask specifying which fields of the policy to modify. Only
        # the fields in the mask will be modified. If no mask is provided, the
        # following default mask is used:
        # paths: "bindings, etag"
        # This field is only used by Cloud IAM.
        # Corresponds to the JSON property `updateMask`
        # @return [String]
        attr_accessor :update_mask
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @policy = args[:policy] if args.key?(:policy)
          @update_mask = args[:update_mask] if args.key?(:update_mask)
        end
      end
      
      # 
      class SubscriberSpec
        include Google::Apis::Core::Hashable
      
        # ObjectReference contains enough information to let you inspect or modify the
        # referred object.
        # Corresponds to the JSON property `ref`
        # @return [Google::Apis::RunV1alpha1::ObjectReference]
        attr_accessor :ref
      
        # Reference to a 'known' endpoint where no resolving is done.
        # http://k8s-service for example
        # http://myexternalhandler.example.com/foo/bar
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @ref = args[:ref] if args.key?(:ref)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # TCPSocketAction describes an action based on opening a socket
      class TcpSocketAction
        include Google::Apis::Core::Hashable
      
        # Optional: Host name to connect to, defaults to the pod IP.
        # +optional
        # Corresponds to the JSON property `host`
        # @return [String]
        attr_accessor :host
      
        # IntOrString is a type that can hold an int32 or a string.  When used in
        # JSON or YAML marshalling and unmarshalling, it produces or consumes the
        # inner type.  This allows you to have, for example, a JSON field that can
        # accept a name or number.
        # Corresponds to the JSON property `port`
        # @return [Google::Apis::RunV1alpha1::IntOrString]
        attr_accessor :port
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @host = args[:host] if args.key?(:host)
          @port = args[:port] if args.key?(:port)
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
      
      # TrafficTarget holds a single entry of the routing table for a Route.
      class TrafficTarget
        include Google::Apis::Core::Hashable
      
        # ConfigurationName of a configuration to whose latest revision we will
        # send this portion of traffic. When the "status.latestReadyRevisionName"
        # of the referenced configuration changes, we will automatically migrate
        # traffic from the prior "latest ready" revision to the new one. This field
        # is never set in Route's status, only its spec. This is mutually exclusive
        # with RevisionName.
        # Cloud Run currently supports a single ConfigurationName.
        # Corresponds to the JSON property `configurationName`
        # @return [String]
        attr_accessor :configuration_name
      
        # LatestRevision may be optionally provided to indicate that the latest
        # ready Revision of the Configuration should be used for this traffic
        # target. When provided LatestRevision must be true if RevisionName is
        # empty; it must be false when RevisionName is non-empty.
        # +optional
        # Corresponds to the JSON property `latestRevision`
        # @return [Boolean]
        attr_accessor :latest_revision
        alias_method :latest_revision?, :latest_revision
      
        # Name is optionally used to expose a dedicated hostname for referencing this
        # target exclusively.
        # Not currently supported by Cloud Run.
        # +optional
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Percent specifies percent of the traffic to this Revision or Configuration.
        # This defaults to zero if unspecified.
        # Cloud Run currently requires 100 percent for a single ConfigurationName
        # TrafficTarget entry.
        # Corresponds to the JSON property `percent`
        # @return [Fixnum]
        attr_accessor :percent
      
        # RevisionName of a specific revision to which to send this portion of
        # traffic. This is mutually exclusive with ConfigurationName.
        # Providing RevisionName in spec is not currently supported by Cloud Run.
        # Corresponds to the JSON property `revisionName`
        # @return [String]
        attr_accessor :revision_name
      
        # Tag is optionally used to expose a dedicated url for referencing
        # this target exclusively.
        # Not currently supported in Cloud Run.
        # +optional
        # Corresponds to the JSON property `tag`
        # @return [String]
        attr_accessor :tag
      
        # Output only. URL displays the URL for accessing named traffic targets. URL
        # is displayed in status, and is disallowed on spec. URL must contain a
        # scheme (e.g. http://) and a hostname, but may not contain anything else
        # (e.g. basic auth, url path, etc.
        # Not currently supported in Cloud Run.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @configuration_name = args[:configuration_name] if args.key?(:configuration_name)
          @latest_revision = args[:latest_revision] if args.key?(:latest_revision)
          @name = args[:name] if args.key?(:name)
          @percent = args[:percent] if args.key?(:percent)
          @revision_name = args[:revision_name] if args.key?(:revision_name)
          @tag = args[:tag] if args.key?(:tag)
          @url = args[:url] if args.key?(:url)
        end
      end
      
      # 
      class Trigger
        include Google::Apis::Core::Hashable
      
        # The API version for this call such as "eventing.knative.dev/v1alpha1".
        # Corresponds to the JSON property `apiVersion`
        # @return [String]
        attr_accessor :api_version
      
        # The kind of resource, in this case "Trigger".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # ObjectMeta is metadata that all persisted resources must have, which includes
        # all objects users must create.
        # Corresponds to the JSON property `metadata`
        # @return [Google::Apis::RunV1alpha1::ObjectMeta]
        attr_accessor :metadata
      
        # The desired state of the Trigger.
        # Corresponds to the JSON property `spec`
        # @return [Google::Apis::RunV1alpha1::TriggerSpec]
        attr_accessor :spec
      
        # TriggerStatus represents the current state of a Trigger.
        # Corresponds to the JSON property `status`
        # @return [Google::Apis::RunV1alpha1::TriggerStatus]
        attr_accessor :status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @api_version = args[:api_version] if args.key?(:api_version)
          @kind = args[:kind] if args.key?(:kind)
          @metadata = args[:metadata] if args.key?(:metadata)
          @spec = args[:spec] if args.key?(:spec)
          @status = args[:status] if args.key?(:status)
        end
      end
      
      # TriggerCondition contains state information for an Trigger.
      class TriggerCondition
        include Google::Apis::Core::Hashable
      
        # Last time the condition transitioned from one status to another.
        # +optional
        # Corresponds to the JSON property `lastTransitionTime`
        # @return [String]
        attr_accessor :last_transition_time
      
        # Human readable message indicating details about the current status.
        # +optional
        # Corresponds to the JSON property `message`
        # @return [String]
        attr_accessor :message
      
        # One-word CamelCase reason for the condition's current status.
        # +optional
        # Corresponds to the JSON property `reason`
        # @return [String]
        attr_accessor :reason
      
        # How to interpret failures of this condition, one of Error, Warning, Info
        # +optional
        # Corresponds to the JSON property `severity`
        # @return [String]
        attr_accessor :severity
      
        # Status of the condition, one of True, False, Unknown.
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        # Type of Trigger condition.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @last_transition_time = args[:last_transition_time] if args.key?(:last_transition_time)
          @message = args[:message] if args.key?(:message)
          @reason = args[:reason] if args.key?(:reason)
          @severity = args[:severity] if args.key?(:severity)
          @status = args[:status] if args.key?(:status)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # 
      class TriggerFilter
        include Google::Apis::Core::Hashable
      
        # Cloud Run fully managed: not supported
        # Cloud Run on GKE: supported
        # Attributes filters events by exact match on event context attributes.
        # Each key in the map is compared with the equivalent key in the event
        # context. An event passes the filter if all values are equal to the
        # specified values.
        # Nested context attributes are not supported as keys.
        # Only string values are supported.
        # +optional
        # Corresponds to the JSON property `attributes`
        # @return [Hash<String,String>]
        attr_accessor :attributes
      
        # TriggerFilterSourceAndType is DEPRECATED. Filters are now contained in the
        # map of attributes in TriggerFilter proto.
        # Corresponds to the JSON property `sourceAndType`
        # @return [Google::Apis::RunV1alpha1::TriggerFilterSourceAndType]
        attr_accessor :source_and_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @attributes = args[:attributes] if args.key?(:attributes)
          @source_and_type = args[:source_and_type] if args.key?(:source_and_type)
        end
      end
      
      # TriggerFilterSourceAndType is DEPRECATED. Filters are now contained in the
      # map of attributes in TriggerFilter proto.
      class TriggerFilterSourceAndType
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `source`
        # @return [String]
        attr_accessor :source
      
        # 
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @source = args[:source] if args.key?(:source)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # 
      class TriggerImporterSpec
        include Google::Apis::Core::Hashable
      
        # Arguments to use for the importer. These must match the parameters in the
        # EventType's importer.
        # Corresponds to the JSON property `arguments`
        # @return [Hash<String,String>]
        attr_accessor :arguments
      
        # Name of the EventType that this importer provides.
        # Corresponds to the JSON property `eventTypeName`
        # @return [String]
        attr_accessor :event_type_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @arguments = args[:arguments] if args.key?(:arguments)
          @event_type_name = args[:event_type_name] if args.key?(:event_type_name)
        end
      end
      
      # The desired state of the Trigger.
      class TriggerSpec
        include Google::Apis::Core::Hashable
      
        # Broker is the broker that this trigger receives events from. If not
        # specified, will default to 'default'.
        # Not currently supported by Cloud Run.
        # Corresponds to the JSON property `broker`
        # @return [String]
        attr_accessor :broker
      
        # Filter is the filter to apply against all events from the Broker. Only
        # events that pass this filter will be sent to the Subscriber.
        # Corresponds to the JSON property `filter`
        # @return [Google::Apis::RunV1alpha1::TriggerFilter]
        attr_accessor :filter
      
        # Specification of the importers that will provide events to the trigger.
        # Note, for Cloud Run, the importers will only be used if a filter is not
        # specified.
        # Corresponds to the JSON property `importers`
        # @return [Array<Google::Apis::RunV1alpha1::TriggerImporterSpec>]
        attr_accessor :importers
      
        # Subscriber is the addressable that receives events from the Broker that
        # pass the Filter. It is required.
        # E.g. https://us-central1-myproject.cloudfunctions.net/myfunction or
        # /namespaces/my-project/services/my-service.
        # Corresponds to the JSON property `subscriber`
        # @return [Google::Apis::RunV1alpha1::SubscriberSpec]
        attr_accessor :subscriber
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @broker = args[:broker] if args.key?(:broker)
          @filter = args[:filter] if args.key?(:filter)
          @importers = args[:importers] if args.key?(:importers)
          @subscriber = args[:subscriber] if args.key?(:subscriber)
        end
      end
      
      # TriggerStatus represents the current state of a Trigger.
      class TriggerStatus
        include Google::Apis::Core::Hashable
      
        # Array of observed TriggerConditions, indicating the current state
        # of the Trigger.
        # Corresponds to the JSON property `conditions`
        # @return [Array<Google::Apis::RunV1alpha1::TriggerCondition>]
        attr_accessor :conditions
      
        # ObservedGeneration is the 'Generation' of the Trigger that
        # was last processed by the controller.
        # Corresponds to the JSON property `observedGeneration`
        # @return [Fixnum]
        attr_accessor :observed_generation
      
        # SubscriberURI is the resolved URI of the receiver for this Trigger.
        # Corresponds to the JSON property `subscriberUri`
        # @return [String]
        attr_accessor :subscriber_uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @conditions = args[:conditions] if args.key?(:conditions)
          @observed_generation = args[:observed_generation] if args.key?(:observed_generation)
          @subscriber_uri = args[:subscriber_uri] if args.key?(:subscriber_uri)
        end
      end
      
      # Volume represents a named volume in a container.
      class Volume
        include Google::Apis::Core::Hashable
      
        # Adapts a ConfigMap into a volume.
        # The contents of the target ConfigMap's Data field will be presented in a
        # volume as files using the keys in the Data field as the file names, unless
        # the items element is populated with specific mappings of keys to paths.
        # Corresponds to the JSON property `configMap`
        # @return [Google::Apis::RunV1alpha1::ConfigMapVolumeSource]
        attr_accessor :config_map
      
        # Volume's name.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The contents of the target Secret's Data field will be presented in a volume
        # as files using the keys in the Data field as the file names.
        # Corresponds to the JSON property `secret`
        # @return [Google::Apis::RunV1alpha1::SecretVolumeSource]
        attr_accessor :secret
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @config_map = args[:config_map] if args.key?(:config_map)
          @name = args[:name] if args.key?(:name)
          @secret = args[:secret] if args.key?(:secret)
        end
      end
      
      # volumeDevice describes a mapping of a raw block device within a container.
      class VolumeDevice
        include Google::Apis::Core::Hashable
      
        # devicePath is the path inside of the container that the device will be
        # mapped to.
        # Corresponds to the JSON property `devicePath`
        # @return [String]
        attr_accessor :device_path
      
        # name must match the name of a persistentVolumeClaim in the pod
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @device_path = args[:device_path] if args.key?(:device_path)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # VolumeMount describes a mounting of a Volume within a container.
      class VolumeMount
        include Google::Apis::Core::Hashable
      
        # Path within the container at which the volume should be mounted.  Must
        # not contain ':'.
        # Corresponds to the JSON property `mountPath`
        # @return [String]
        attr_accessor :mount_path
      
        # mountPropagation determines how mounts are propagated from the host
        # to container and the other way around.
        # When not set, MountPropagationHostToContainer is used.
        # This field is beta in 1.10.
        # +optional
        # Corresponds to the JSON property `mountPropagation`
        # @return [String]
        attr_accessor :mount_propagation
      
        # This must match the Name of a Volume.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Mounted read-only if true, read-write otherwise (false or unspecified).
        # Defaults to false.
        # +optional
        # Corresponds to the JSON property `readOnly`
        # @return [Boolean]
        attr_accessor :read_only
        alias_method :read_only?, :read_only
      
        # Path within the volume from which the container's volume should be mounted.
        # Defaults to "" (volume's root).
        # +optional
        # Corresponds to the JSON property `subPath`
        # @return [String]
        attr_accessor :sub_path
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @mount_path = args[:mount_path] if args.key?(:mount_path)
          @mount_propagation = args[:mount_propagation] if args.key?(:mount_propagation)
          @name = args[:name] if args.key?(:name)
          @read_only = args[:read_only] if args.key?(:read_only)
          @sub_path = args[:sub_path] if args.key?(:sub_path)
        end
      end
    end
  end
end
