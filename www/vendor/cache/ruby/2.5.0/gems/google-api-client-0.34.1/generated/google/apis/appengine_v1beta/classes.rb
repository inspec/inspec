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
    module AppengineV1beta
      
      # Google Cloud Endpoints (https://cloud.google.com/appengine/docs/python/
      # endpoints/) configuration for API handlers.
      class ApiConfigHandler
        include Google::Apis::Core::Hashable
      
        # Action to take when users access resources that require authentication.
        # Defaults to redirect.
        # Corresponds to the JSON property `authFailAction`
        # @return [String]
        attr_accessor :auth_fail_action
      
        # Level of login required to access this resource. Defaults to optional.
        # Corresponds to the JSON property `login`
        # @return [String]
        attr_accessor :login
      
        # Path to the script from the application root directory.
        # Corresponds to the JSON property `script`
        # @return [String]
        attr_accessor :script
      
        # Security (HTTPS) enforcement for this URL.
        # Corresponds to the JSON property `securityLevel`
        # @return [String]
        attr_accessor :security_level
      
        # URL to serve the endpoint at.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @auth_fail_action = args[:auth_fail_action] if args.key?(:auth_fail_action)
          @login = args[:login] if args.key?(:login)
          @script = args[:script] if args.key?(:script)
          @security_level = args[:security_level] if args.key?(:security_level)
          @url = args[:url] if args.key?(:url)
        end
      end
      
      # Uses Google Cloud Endpoints to handle requests.
      class ApiEndpointHandler
        include Google::Apis::Core::Hashable
      
        # Path to the script from the application root directory.
        # Corresponds to the JSON property `scriptPath`
        # @return [String]
        attr_accessor :script_path
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @script_path = args[:script_path] if args.key?(:script_path)
        end
      end
      
      # An Application resource contains the top-level configuration of an App Engine
      # application.
      class Application
        include Google::Apis::Core::Hashable
      
        # Google Apps authentication domain that controls which users can access this
        # application.Defaults to open access for any Google Account.
        # Corresponds to the JSON property `authDomain`
        # @return [String]
        attr_accessor :auth_domain
      
        # Google Cloud Storage bucket that can be used for storing files associated with
        # this application. This bucket is associated with the application and can be
        # used by the gcloud deployment commands.@OutputOnly
        # Corresponds to the JSON property `codeBucket`
        # @return [String]
        attr_accessor :code_bucket
      
        # Google Cloud Storage bucket that can be used by this application to store
        # content.@OutputOnly
        # Corresponds to the JSON property `defaultBucket`
        # @return [String]
        attr_accessor :default_bucket
      
        # Cookie expiration policy for this application.
        # Corresponds to the JSON property `defaultCookieExpiration`
        # @return [String]
        attr_accessor :default_cookie_expiration
      
        # Hostname used to reach this application, as resolved by App Engine.@OutputOnly
        # Corresponds to the JSON property `defaultHostname`
        # @return [String]
        attr_accessor :default_hostname
      
        # HTTP path dispatch rules for requests to the application that do not
        # explicitly target a service or version. Rules are order-dependent. Up to 20
        # dispatch rules can be supported.
        # Corresponds to the JSON property `dispatchRules`
        # @return [Array<Google::Apis::AppengineV1beta::UrlDispatchRule>]
        attr_accessor :dispatch_rules
      
        # The feature specific settings to be used in the application. These define
        # behaviors that are user configurable.
        # Corresponds to the JSON property `featureSettings`
        # @return [Google::Apis::AppengineV1beta::FeatureSettings]
        attr_accessor :feature_settings
      
        # The Google Container Registry domain used for storing managed build docker
        # images for this application.
        # Corresponds to the JSON property `gcrDomain`
        # @return [String]
        attr_accessor :gcr_domain
      
        # Identity-Aware Proxy
        # Corresponds to the JSON property `iap`
        # @return [Google::Apis::AppengineV1beta::IdentityAwareProxy]
        attr_accessor :iap
      
        # Identifier of the Application resource. This identifier is equivalent to the
        # project ID of the Google Cloud Platform project where you want to deploy your
        # application. Example: myapp.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Location from which this application runs. Application instances run out of
        # the data centers in the specified location, which is also where all of the
        # application's end user content is stored.Defaults to us-central.View the list
        # of supported locations (https://cloud.google.com/appengine/docs/locations).
        # Corresponds to the JSON property `locationId`
        # @return [String]
        attr_accessor :location_id
      
        # Full path to the Application resource in the API. Example: apps/myapp.@
        # OutputOnly
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Serving status of this application.
        # Corresponds to the JSON property `servingStatus`
        # @return [String]
        attr_accessor :serving_status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @auth_domain = args[:auth_domain] if args.key?(:auth_domain)
          @code_bucket = args[:code_bucket] if args.key?(:code_bucket)
          @default_bucket = args[:default_bucket] if args.key?(:default_bucket)
          @default_cookie_expiration = args[:default_cookie_expiration] if args.key?(:default_cookie_expiration)
          @default_hostname = args[:default_hostname] if args.key?(:default_hostname)
          @dispatch_rules = args[:dispatch_rules] if args.key?(:dispatch_rules)
          @feature_settings = args[:feature_settings] if args.key?(:feature_settings)
          @gcr_domain = args[:gcr_domain] if args.key?(:gcr_domain)
          @iap = args[:iap] if args.key?(:iap)
          @id = args[:id] if args.key?(:id)
          @location_id = args[:location_id] if args.key?(:location_id)
          @name = args[:name] if args.key?(:name)
          @serving_status = args[:serving_status] if args.key?(:serving_status)
        end
      end
      
      # An SSL certificate that a user has been authorized to administer. A user is
      # authorized to administer any certificate that applies to one of their
      # authorized domains.
      class AuthorizedCertificate
        include Google::Apis::Core::Hashable
      
        # An SSL certificate obtained from a certificate authority.
        # Corresponds to the JSON property `certificateRawData`
        # @return [Google::Apis::AppengineV1beta::CertificateRawData]
        attr_accessor :certificate_raw_data
      
        # The user-specified display name of the certificate. This is not guaranteed to
        # be unique. Example: My Certificate.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # Aggregate count of the domain mappings with this certificate mapped. This
        # count includes domain mappings on applications for which the user does not
        # have VIEWER permissions.Only returned by GET or LIST requests when
        # specifically requested by the view=FULL_CERTIFICATE option.@OutputOnly
        # Corresponds to the JSON property `domainMappingsCount`
        # @return [Fixnum]
        attr_accessor :domain_mappings_count
      
        # Topmost applicable domains of this certificate. This certificate applies to
        # these domains and their subdomains. Example: example.com.@OutputOnly
        # Corresponds to the JSON property `domainNames`
        # @return [Array<String>]
        attr_accessor :domain_names
      
        # The time when this certificate expires. To update the renewal time on this
        # certificate, upload an SSL certificate with a different expiration time using
        # AuthorizedCertificates.UpdateAuthorizedCertificate.@OutputOnly
        # Corresponds to the JSON property `expireTime`
        # @return [String]
        attr_accessor :expire_time
      
        # Relative name of the certificate. This is a unique value autogenerated on
        # AuthorizedCertificate resource creation. Example: 12345.@OutputOnly
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # A certificate managed by App Engine.
        # Corresponds to the JSON property `managedCertificate`
        # @return [Google::Apis::AppengineV1beta::ManagedCertificate]
        attr_accessor :managed_certificate
      
        # Full path to the AuthorizedCertificate resource in the API. Example: apps/
        # myapp/authorizedCertificates/12345.@OutputOnly
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The full paths to user visible Domain Mapping resources that have this
        # certificate mapped. Example: apps/myapp/domainMappings/example.com.This may
        # not represent the full list of mapped domain mappings if the user does not
        # have VIEWER permissions on all of the applications that have this certificate
        # mapped. See domain_mappings_count for a complete count.Only returned by GET or
        # LIST requests when specifically requested by the view=FULL_CERTIFICATE option.@
        # OutputOnly
        # Corresponds to the JSON property `visibleDomainMappings`
        # @return [Array<String>]
        attr_accessor :visible_domain_mappings
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @certificate_raw_data = args[:certificate_raw_data] if args.key?(:certificate_raw_data)
          @display_name = args[:display_name] if args.key?(:display_name)
          @domain_mappings_count = args[:domain_mappings_count] if args.key?(:domain_mappings_count)
          @domain_names = args[:domain_names] if args.key?(:domain_names)
          @expire_time = args[:expire_time] if args.key?(:expire_time)
          @id = args[:id] if args.key?(:id)
          @managed_certificate = args[:managed_certificate] if args.key?(:managed_certificate)
          @name = args[:name] if args.key?(:name)
          @visible_domain_mappings = args[:visible_domain_mappings] if args.key?(:visible_domain_mappings)
        end
      end
      
      # A domain that a user has been authorized to administer. To authorize use of a
      # domain, verify ownership via Webmaster Central (https://www.google.com/
      # webmasters/verification/home).
      class AuthorizedDomain
        include Google::Apis::Core::Hashable
      
        # Fully qualified domain name of the domain authorized for use. Example: example.
        # com.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Full path to the AuthorizedDomain resource in the API. Example: apps/myapp/
        # authorizedDomains/example.com.@OutputOnly
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
      
      # Automatic scaling is based on request rate, response latencies, and other
      # application metrics.
      class AutomaticScaling
        include Google::Apis::Core::Hashable
      
        # The time period that the Autoscaler (https://cloud.google.com/compute/docs/
        # autoscaler/) should wait before it starts collecting information from a new
        # instance. This prevents the autoscaler from collecting information when the
        # instance is initializing, during which the collected usage would not be
        # reliable. Only applicable in the App Engine flexible environment.
        # Corresponds to the JSON property `coolDownPeriod`
        # @return [String]
        attr_accessor :cool_down_period
      
        # Target scaling by CPU usage.
        # Corresponds to the JSON property `cpuUtilization`
        # @return [Google::Apis::AppengineV1beta::CpuUtilization]
        attr_accessor :cpu_utilization
      
        # Target scaling by user-provided metrics. Only applicable in the App Engine
        # flexible environment.
        # Corresponds to the JSON property `customMetrics`
        # @return [Array<Google::Apis::AppengineV1beta::CustomMetric>]
        attr_accessor :custom_metrics
      
        # Target scaling by disk usage. Only applicable in the App Engine flexible
        # environment.
        # Corresponds to the JSON property `diskUtilization`
        # @return [Google::Apis::AppengineV1beta::DiskUtilization]
        attr_accessor :disk_utilization
      
        # Number of concurrent requests an automatic scaling instance can accept before
        # the scheduler spawns a new instance.Defaults to a runtime-specific value.
        # Corresponds to the JSON property `maxConcurrentRequests`
        # @return [Fixnum]
        attr_accessor :max_concurrent_requests
      
        # Maximum number of idle instances that should be maintained for this version.
        # Corresponds to the JSON property `maxIdleInstances`
        # @return [Fixnum]
        attr_accessor :max_idle_instances
      
        # Maximum amount of time that a request should wait in the pending queue before
        # starting a new instance to handle it.
        # Corresponds to the JSON property `maxPendingLatency`
        # @return [String]
        attr_accessor :max_pending_latency
      
        # Maximum number of instances that should be started to handle requests for this
        # version.
        # Corresponds to the JSON property `maxTotalInstances`
        # @return [Fixnum]
        attr_accessor :max_total_instances
      
        # Minimum number of idle instances that should be maintained for this version.
        # Only applicable for the default version of a service.
        # Corresponds to the JSON property `minIdleInstances`
        # @return [Fixnum]
        attr_accessor :min_idle_instances
      
        # Minimum amount of time a request should wait in the pending queue before
        # starting a new instance to handle it.
        # Corresponds to the JSON property `minPendingLatency`
        # @return [String]
        attr_accessor :min_pending_latency
      
        # Minimum number of running instances that should be maintained for this version.
        # Corresponds to the JSON property `minTotalInstances`
        # @return [Fixnum]
        attr_accessor :min_total_instances
      
        # Target scaling by network usage. Only applicable in the App Engine flexible
        # environment.
        # Corresponds to the JSON property `networkUtilization`
        # @return [Google::Apis::AppengineV1beta::NetworkUtilization]
        attr_accessor :network_utilization
      
        # Target scaling by request utilization. Only applicable in the App Engine
        # flexible environment.
        # Corresponds to the JSON property `requestUtilization`
        # @return [Google::Apis::AppengineV1beta::RequestUtilization]
        attr_accessor :request_utilization
      
        # Scheduler settings for standard environment.
        # Corresponds to the JSON property `standardSchedulerSettings`
        # @return [Google::Apis::AppengineV1beta::StandardSchedulerSettings]
        attr_accessor :standard_scheduler_settings
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cool_down_period = args[:cool_down_period] if args.key?(:cool_down_period)
          @cpu_utilization = args[:cpu_utilization] if args.key?(:cpu_utilization)
          @custom_metrics = args[:custom_metrics] if args.key?(:custom_metrics)
          @disk_utilization = args[:disk_utilization] if args.key?(:disk_utilization)
          @max_concurrent_requests = args[:max_concurrent_requests] if args.key?(:max_concurrent_requests)
          @max_idle_instances = args[:max_idle_instances] if args.key?(:max_idle_instances)
          @max_pending_latency = args[:max_pending_latency] if args.key?(:max_pending_latency)
          @max_total_instances = args[:max_total_instances] if args.key?(:max_total_instances)
          @min_idle_instances = args[:min_idle_instances] if args.key?(:min_idle_instances)
          @min_pending_latency = args[:min_pending_latency] if args.key?(:min_pending_latency)
          @min_total_instances = args[:min_total_instances] if args.key?(:min_total_instances)
          @network_utilization = args[:network_utilization] if args.key?(:network_utilization)
          @request_utilization = args[:request_utilization] if args.key?(:request_utilization)
          @standard_scheduler_settings = args[:standard_scheduler_settings] if args.key?(:standard_scheduler_settings)
        end
      end
      
      # A service with basic scaling will create an instance when the application
      # receives a request. The instance will be turned down when the app becomes idle.
      # Basic scaling is ideal for work that is intermittent or driven by user
      # activity.
      class BasicScaling
        include Google::Apis::Core::Hashable
      
        # Duration of time after the last request that an instance must wait before the
        # instance is shut down.
        # Corresponds to the JSON property `idleTimeout`
        # @return [String]
        attr_accessor :idle_timeout
      
        # Maximum number of instances to create for this version.
        # Corresponds to the JSON property `maxInstances`
        # @return [Fixnum]
        attr_accessor :max_instances
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @idle_timeout = args[:idle_timeout] if args.key?(:idle_timeout)
          @max_instances = args[:max_instances] if args.key?(:max_instances)
        end
      end
      
      # Request message for Firewall.BatchUpdateIngressRules.
      class BatchUpdateIngressRulesRequest
        include Google::Apis::Core::Hashable
      
        # A list of FirewallRules to replace the existing set.
        # Corresponds to the JSON property `ingressRules`
        # @return [Array<Google::Apis::AppengineV1beta::FirewallRule>]
        attr_accessor :ingress_rules
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @ingress_rules = args[:ingress_rules] if args.key?(:ingress_rules)
        end
      end
      
      # Response message for Firewall.UpdateAllIngressRules.
      class BatchUpdateIngressRulesResponse
        include Google::Apis::Core::Hashable
      
        # The full list of ingress FirewallRules for this application.
        # Corresponds to the JSON property `ingressRules`
        # @return [Array<Google::Apis::AppengineV1beta::FirewallRule>]
        attr_accessor :ingress_rules
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @ingress_rules = args[:ingress_rules] if args.key?(:ingress_rules)
        end
      end
      
      # Google Cloud Build information.
      class BuildInfo
        include Google::Apis::Core::Hashable
      
        # The Google Cloud Build id. Example: "f966068f-08b2-42c8-bdfe-74137dff2bf9"
        # Corresponds to the JSON property `cloudBuildId`
        # @return [String]
        attr_accessor :cloud_build_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cloud_build_id = args[:cloud_build_id] if args.key?(:cloud_build_id)
        end
      end
      
      # An SSL certificate obtained from a certificate authority.
      class CertificateRawData
        include Google::Apis::Core::Hashable
      
        # Unencrypted PEM encoded RSA private key. This field is set once on certificate
        # creation and then encrypted. The key size must be 2048 bits or fewer. Must
        # include the header and footer. Example: <pre> -----BEGIN RSA PRIVATE KEY----- <
        # unencrypted_key_value> -----END RSA PRIVATE KEY----- </pre> @InputOnly
        # Corresponds to the JSON property `privateKey`
        # @return [String]
        attr_accessor :private_key
      
        # PEM encoded x.509 public key certificate. This field is set once on
        # certificate creation. Must include the header and footer. Example: <pre> -----
        # BEGIN CERTIFICATE----- <certificate_value> -----END CERTIFICATE----- </pre>
        # Corresponds to the JSON property `publicCertificate`
        # @return [String]
        attr_accessor :public_certificate
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @private_key = args[:private_key] if args.key?(:private_key)
          @public_certificate = args[:public_certificate] if args.key?(:public_certificate)
        end
      end
      
      # Options for the build operations performed as a part of the version deployment.
      # Only applicable for App Engine flexible environment when creating a version
      # using source code directly.
      class CloudBuildOptions
        include Google::Apis::Core::Hashable
      
        # Path to the yaml file used in deployment, used to determine runtime
        # configuration details.Required for flexible environment builds.See https://
        # cloud.google.com/appengine/docs/standard/python/config/appref for more details.
        # Corresponds to the JSON property `appYamlPath`
        # @return [String]
        attr_accessor :app_yaml_path
      
        # The Cloud Build timeout used as part of any dependent builds performed by
        # version creation. Defaults to 10 minutes.
        # Corresponds to the JSON property `cloudBuildTimeout`
        # @return [String]
        attr_accessor :cloud_build_timeout
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @app_yaml_path = args[:app_yaml_path] if args.key?(:app_yaml_path)
          @cloud_build_timeout = args[:cloud_build_timeout] if args.key?(:cloud_build_timeout)
        end
      end
      
      # Docker image that is used to create a container and start a VM instance for
      # the version that you deploy. Only applicable for instances running in the App
      # Engine flexible environment.
      class ContainerInfo
        include Google::Apis::Core::Hashable
      
        # URI to the hosted container image in Google Container Registry. The URI must
        # be fully qualified and include a tag or digest. Examples: "gcr.io/my-project/
        # image:tag" or "gcr.io/my-project/image@digest"
        # Corresponds to the JSON property `image`
        # @return [String]
        attr_accessor :image
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @image = args[:image] if args.key?(:image)
        end
      end
      
      # Target scaling by CPU usage.
      class CpuUtilization
        include Google::Apis::Core::Hashable
      
        # Period of time over which CPU utilization is calculated.
        # Corresponds to the JSON property `aggregationWindowLength`
        # @return [String]
        attr_accessor :aggregation_window_length
      
        # Target CPU utilization ratio to maintain when scaling. Must be between 0 and 1.
        # Corresponds to the JSON property `targetUtilization`
        # @return [Float]
        attr_accessor :target_utilization
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @aggregation_window_length = args[:aggregation_window_length] if args.key?(:aggregation_window_length)
          @target_utilization = args[:target_utilization] if args.key?(:target_utilization)
        end
      end
      
      # Metadata for the given google.longrunning.Operation during a google.appengine.
      # v1.CreateVersionRequest.
      class CreateVersionMetadataV1
        include Google::Apis::Core::Hashable
      
        # The Cloud Build ID if one was created as part of the version create. @
        # OutputOnly
        # Corresponds to the JSON property `cloudBuildId`
        # @return [String]
        attr_accessor :cloud_build_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cloud_build_id = args[:cloud_build_id] if args.key?(:cloud_build_id)
        end
      end
      
      # Metadata for the given google.longrunning.Operation during a google.appengine.
      # v1alpha.CreateVersionRequest.
      class CreateVersionMetadataV1Alpha
        include Google::Apis::Core::Hashable
      
        # The Cloud Build ID if one was created as part of the version create. @
        # OutputOnly
        # Corresponds to the JSON property `cloudBuildId`
        # @return [String]
        attr_accessor :cloud_build_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cloud_build_id = args[:cloud_build_id] if args.key?(:cloud_build_id)
        end
      end
      
      # Metadata for the given google.longrunning.Operation during a google.appengine.
      # v1beta.CreateVersionRequest.
      class CreateVersionMetadataV1Beta
        include Google::Apis::Core::Hashable
      
        # The Cloud Build ID if one was created as part of the version create. @
        # OutputOnly
        # Corresponds to the JSON property `cloudBuildId`
        # @return [String]
        attr_accessor :cloud_build_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cloud_build_id = args[:cloud_build_id] if args.key?(:cloud_build_id)
        end
      end
      
      # Allows autoscaling based on Stackdriver metrics.
      class CustomMetric
        include Google::Apis::Core::Hashable
      
        # Allows filtering on the metric's fields.
        # Corresponds to the JSON property `filter`
        # @return [String]
        attr_accessor :filter
      
        # The name of the metric.
        # Corresponds to the JSON property `metricName`
        # @return [String]
        attr_accessor :metric_name
      
        # May be used instead of target_utilization when an instance can handle a
        # specific amount of work/resources and the metric value is equal to the current
        # amount of work remaining. The autoscaler will try to keep the number of
        # instances equal to the metric value divided by single_instance_assignment.
        # Corresponds to the JSON property `singleInstanceAssignment`
        # @return [Float]
        attr_accessor :single_instance_assignment
      
        # The type of the metric. Must be a string representing a Stackdriver metric
        # type e.g. GAGUE, DELTA_PER_SECOND, etc.
        # Corresponds to the JSON property `targetType`
        # @return [String]
        attr_accessor :target_type
      
        # The target value for the metric.
        # Corresponds to the JSON property `targetUtilization`
        # @return [Float]
        attr_accessor :target_utilization
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @filter = args[:filter] if args.key?(:filter)
          @metric_name = args[:metric_name] if args.key?(:metric_name)
          @single_instance_assignment = args[:single_instance_assignment] if args.key?(:single_instance_assignment)
          @target_type = args[:target_type] if args.key?(:target_type)
          @target_utilization = args[:target_utilization] if args.key?(:target_utilization)
        end
      end
      
      # Request message for Instances.DebugInstance.
      class DebugInstanceRequest
        include Google::Apis::Core::Hashable
      
        # Public SSH key to add to the instance. Examples:
        # [USERNAME]:ssh-rsa [KEY_VALUE] [USERNAME]
        # [USERNAME]:ssh-rsa [KEY_VALUE] google-ssh `"userName":"[USERNAME]","expireOn":"
        # [EXPIRE_TIME]"`For more information, see Adding and Removing SSH Keys (https://
        # cloud.google.com/compute/docs/instances/adding-removing-ssh-keys).
        # Corresponds to the JSON property `sshKey`
        # @return [String]
        attr_accessor :ssh_key
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @ssh_key = args[:ssh_key] if args.key?(:ssh_key)
        end
      end
      
      # Code and application artifacts used to deploy a version to App Engine.
      class Deployment
        include Google::Apis::Core::Hashable
      
        # Google Cloud Build information.
        # Corresponds to the JSON property `build`
        # @return [Google::Apis::AppengineV1beta::BuildInfo]
        attr_accessor :build
      
        # Options for the build operations performed as a part of the version deployment.
        # Only applicable for App Engine flexible environment when creating a version
        # using source code directly.
        # Corresponds to the JSON property `cloudBuildOptions`
        # @return [Google::Apis::AppengineV1beta::CloudBuildOptions]
        attr_accessor :cloud_build_options
      
        # Docker image that is used to create a container and start a VM instance for
        # the version that you deploy. Only applicable for instances running in the App
        # Engine flexible environment.
        # Corresponds to the JSON property `container`
        # @return [Google::Apis::AppengineV1beta::ContainerInfo]
        attr_accessor :container
      
        # Manifest of the files stored in Google Cloud Storage that are included as part
        # of this version. All files must be readable using the credentials supplied
        # with this call.
        # Corresponds to the JSON property `files`
        # @return [Hash<String,Google::Apis::AppengineV1beta::FileInfo>]
        attr_accessor :files
      
        # The zip file information for a zip deployment.
        # Corresponds to the JSON property `zip`
        # @return [Google::Apis::AppengineV1beta::ZipInfo]
        attr_accessor :zip
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @build = args[:build] if args.key?(:build)
          @cloud_build_options = args[:cloud_build_options] if args.key?(:cloud_build_options)
          @container = args[:container] if args.key?(:container)
          @files = args[:files] if args.key?(:files)
          @zip = args[:zip] if args.key?(:zip)
        end
      end
      
      # Target scaling by disk usage. Only applicable in the App Engine flexible
      # environment.
      class DiskUtilization
        include Google::Apis::Core::Hashable
      
        # Target bytes read per second.
        # Corresponds to the JSON property `targetReadBytesPerSecond`
        # @return [Fixnum]
        attr_accessor :target_read_bytes_per_second
      
        # Target ops read per seconds.
        # Corresponds to the JSON property `targetReadOpsPerSecond`
        # @return [Fixnum]
        attr_accessor :target_read_ops_per_second
      
        # Target bytes written per second.
        # Corresponds to the JSON property `targetWriteBytesPerSecond`
        # @return [Fixnum]
        attr_accessor :target_write_bytes_per_second
      
        # Target ops written per second.
        # Corresponds to the JSON property `targetWriteOpsPerSecond`
        # @return [Fixnum]
        attr_accessor :target_write_ops_per_second
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @target_read_bytes_per_second = args[:target_read_bytes_per_second] if args.key?(:target_read_bytes_per_second)
          @target_read_ops_per_second = args[:target_read_ops_per_second] if args.key?(:target_read_ops_per_second)
          @target_write_bytes_per_second = args[:target_write_bytes_per_second] if args.key?(:target_write_bytes_per_second)
          @target_write_ops_per_second = args[:target_write_ops_per_second] if args.key?(:target_write_ops_per_second)
        end
      end
      
      # A domain serving an App Engine application.
      class DomainMapping
        include Google::Apis::Core::Hashable
      
        # Relative name of the domain serving the application. Example: example.com.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Full path to the DomainMapping resource in the API. Example: apps/myapp/
        # domainMapping/example.com.@OutputOnly
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The resource records required to configure this domain mapping. These records
        # must be added to the domain's DNS configuration in order to serve the
        # application via this domain mapping.@OutputOnly
        # Corresponds to the JSON property `resourceRecords`
        # @return [Array<Google::Apis::AppengineV1beta::ResourceRecord>]
        attr_accessor :resource_records
      
        # SSL configuration for a DomainMapping resource.
        # Corresponds to the JSON property `sslSettings`
        # @return [Google::Apis::AppengineV1beta::SslSettings]
        attr_accessor :ssl_settings
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @id = args[:id] if args.key?(:id)
          @name = args[:name] if args.key?(:name)
          @resource_records = args[:resource_records] if args.key?(:resource_records)
          @ssl_settings = args[:ssl_settings] if args.key?(:ssl_settings)
        end
      end
      
      # A generic empty message that you can re-use to avoid defining duplicated empty
      # messages in your APIs. A typical example is to use it as the request or the
      # response type of an API method. For instance:
      # service Foo `
      # rpc Bar(google.protobuf.Empty) returns (google.protobuf.Empty);
      # `
      # The JSON representation for Empty is empty JSON object ``.
      class Empty
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Cloud Endpoints (https://cloud.google.com/endpoints) configuration. The
      # Endpoints API Service provides tooling for serving Open API and gRPC endpoints
      # via an NGINX proxy. Only valid for App Engine Flexible environment deployments.
      # The fields here refer to the name and configuration ID of a "service" resource
      # in the Service Management API (https://cloud.google.com/service-management/
      # overview).
      class EndpointsApiService
        include Google::Apis::Core::Hashable
      
        # Endpoints service configuration ID as specified by the Service Management API.
        # For example "2016-09-19r1".By default, the rollout strategy for Endpoints is
        # RolloutStrategy.FIXED. This means that Endpoints starts up with a particular
        # configuration ID. When a new configuration is rolled out, Endpoints must be
        # given the new configuration ID. The config_id field is used to give the
        # configuration ID and is required in this case.Endpoints also has a rollout
        # strategy called RolloutStrategy.MANAGED. When using this, Endpoints fetches
        # the latest configuration and does not need the configuration ID. In this case,
        # config_id must be omitted.
        # Corresponds to the JSON property `configId`
        # @return [String]
        attr_accessor :config_id
      
        # Enable or disable trace sampling. By default, this is set to false for enabled.
        # Corresponds to the JSON property `disableTraceSampling`
        # @return [Boolean]
        attr_accessor :disable_trace_sampling
        alias_method :disable_trace_sampling?, :disable_trace_sampling
      
        # Endpoints service name which is the name of the "service" resource in the
        # Service Management API. For example "myapi.endpoints.myproject.cloud.goog"
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Endpoints rollout strategy. If FIXED, config_id must be specified. If MANAGED,
        # config_id must be omitted.
        # Corresponds to the JSON property `rolloutStrategy`
        # @return [String]
        attr_accessor :rollout_strategy
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @config_id = args[:config_id] if args.key?(:config_id)
          @disable_trace_sampling = args[:disable_trace_sampling] if args.key?(:disable_trace_sampling)
          @name = args[:name] if args.key?(:name)
          @rollout_strategy = args[:rollout_strategy] if args.key?(:rollout_strategy)
        end
      end
      
      # The entrypoint for the application.
      class Entrypoint
        include Google::Apis::Core::Hashable
      
        # The format should be a shell command that can be fed to bash -c.
        # Corresponds to the JSON property `shell`
        # @return [String]
        attr_accessor :shell
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @shell = args[:shell] if args.key?(:shell)
        end
      end
      
      # Custom static error page to be served when an error occurs.
      class ErrorHandler
        include Google::Apis::Core::Hashable
      
        # Error condition this handler applies to.
        # Corresponds to the JSON property `errorCode`
        # @return [String]
        attr_accessor :error_code
      
        # MIME type of file. Defaults to text/html.
        # Corresponds to the JSON property `mimeType`
        # @return [String]
        attr_accessor :mime_type
      
        # Static file content to be served for this error.
        # Corresponds to the JSON property `staticFile`
        # @return [String]
        attr_accessor :static_file
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error_code = args[:error_code] if args.key?(:error_code)
          @mime_type = args[:mime_type] if args.key?(:mime_type)
          @static_file = args[:static_file] if args.key?(:static_file)
        end
      end
      
      # The feature specific settings to be used in the application. These define
      # behaviors that are user configurable.
      class FeatureSettings
        include Google::Apis::Core::Hashable
      
        # Boolean value indicating if split health checks should be used instead of the
        # legacy health checks. At an app.yaml level, this means defaulting to '
        # readiness_check' and 'liveness_check' values instead of 'health_check' ones.
        # Once the legacy 'health_check' behavior is deprecated, and this value is
        # always true, this setting can be removed.
        # Corresponds to the JSON property `splitHealthChecks`
        # @return [Boolean]
        attr_accessor :split_health_checks
        alias_method :split_health_checks?, :split_health_checks
      
        # If true, use Container-Optimized OS (https://cloud.google.com/container-
        # optimized-os/) base image for VMs, rather than a base Debian image.
        # Corresponds to the JSON property `useContainerOptimizedOs`
        # @return [Boolean]
        attr_accessor :use_container_optimized_os
        alias_method :use_container_optimized_os?, :use_container_optimized_os
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @split_health_checks = args[:split_health_checks] if args.key?(:split_health_checks)
          @use_container_optimized_os = args[:use_container_optimized_os] if args.key?(:use_container_optimized_os)
        end
      end
      
      # Single source file that is part of the version to be deployed. Each source
      # file that is deployed must be specified separately.
      class FileInfo
        include Google::Apis::Core::Hashable
      
        # The MIME type of the file.Defaults to the value from Google Cloud Storage.
        # Corresponds to the JSON property `mimeType`
        # @return [String]
        attr_accessor :mime_type
      
        # The SHA1 hash of the file, in hex.
        # Corresponds to the JSON property `sha1Sum`
        # @return [String]
        attr_accessor :sha1_sum
      
        # URL source to use to fetch this file. Must be a URL to a resource in Google
        # Cloud Storage in the form 'http(s)://storage.googleapis.com/<bucket>/<object>'.
        # Corresponds to the JSON property `sourceUrl`
        # @return [String]
        attr_accessor :source_url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @mime_type = args[:mime_type] if args.key?(:mime_type)
          @sha1_sum = args[:sha1_sum] if args.key?(:sha1_sum)
          @source_url = args[:source_url] if args.key?(:source_url)
        end
      end
      
      # A single firewall rule that is evaluated against incoming traffic and provides
      # an action to take on matched requests.
      class FirewallRule
        include Google::Apis::Core::Hashable
      
        # The action to take on matched requests.
        # Corresponds to the JSON property `action`
        # @return [String]
        attr_accessor :action
      
        # An optional string description of this rule. This field has a maximum length
        # of 100 characters.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # A positive integer between 1, Int32.MaxValue-1 that defines the order of rule
        # evaluation. Rules with the lowest priority are evaluated first.A default rule
        # at priority Int32.MaxValue matches all IPv4 and IPv6 traffic when no previous
        # rule matches. Only the action of this rule can be modified by the user.
        # Corresponds to the JSON property `priority`
        # @return [Fixnum]
        attr_accessor :priority
      
        # IP address or range, defined using CIDR notation, of requests that this rule
        # applies to. You can use the wildcard character "*" to match all IPs equivalent
        # to "0/0" and "::/0" together. Examples: 192.168.1.1 or 192.168.0.0/16 or 2001:
        # db8::/32  or 2001:0db8:0000:0042:0000:8a2e:0370:7334.<p>Truncation will be
        # silently performed on addresses which are not properly truncated. For example,
        # 1.2.3.4/24 is accepted as the same address as 1.2.3.0/24. Similarly, for IPv6,
        # 2001:db8::1/32 is accepted as the same address as 2001:db8::/32.
        # Corresponds to the JSON property `sourceRange`
        # @return [String]
        attr_accessor :source_range
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @action = args[:action] if args.key?(:action)
          @description = args[:description] if args.key?(:description)
          @priority = args[:priority] if args.key?(:priority)
          @source_range = args[:source_range] if args.key?(:source_range)
        end
      end
      
      # Health checking configuration for VM instances. Unhealthy instances are killed
      # and replaced with new instances. Only applicable for instances in App Engine
      # flexible environment.
      class HealthCheck
        include Google::Apis::Core::Hashable
      
        # Interval between health checks.
        # Corresponds to the JSON property `checkInterval`
        # @return [String]
        attr_accessor :check_interval
      
        # Whether to explicitly disable health checks for this instance.
        # Corresponds to the JSON property `disableHealthCheck`
        # @return [Boolean]
        attr_accessor :disable_health_check
        alias_method :disable_health_check?, :disable_health_check
      
        # Number of consecutive successful health checks required before receiving
        # traffic.
        # Corresponds to the JSON property `healthyThreshold`
        # @return [Fixnum]
        attr_accessor :healthy_threshold
      
        # Host header to send when performing an HTTP health check. Example: "myapp.
        # appspot.com"
        # Corresponds to the JSON property `host`
        # @return [String]
        attr_accessor :host
      
        # Number of consecutive failed health checks required before an instance is
        # restarted.
        # Corresponds to the JSON property `restartThreshold`
        # @return [Fixnum]
        attr_accessor :restart_threshold
      
        # Time before the health check is considered failed.
        # Corresponds to the JSON property `timeout`
        # @return [String]
        attr_accessor :timeout
      
        # Number of consecutive failed health checks required before removing traffic.
        # Corresponds to the JSON property `unhealthyThreshold`
        # @return [Fixnum]
        attr_accessor :unhealthy_threshold
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @check_interval = args[:check_interval] if args.key?(:check_interval)
          @disable_health_check = args[:disable_health_check] if args.key?(:disable_health_check)
          @healthy_threshold = args[:healthy_threshold] if args.key?(:healthy_threshold)
          @host = args[:host] if args.key?(:host)
          @restart_threshold = args[:restart_threshold] if args.key?(:restart_threshold)
          @timeout = args[:timeout] if args.key?(:timeout)
          @unhealthy_threshold = args[:unhealthy_threshold] if args.key?(:unhealthy_threshold)
        end
      end
      
      # Identity-Aware Proxy
      class IdentityAwareProxy
        include Google::Apis::Core::Hashable
      
        # Whether the serving infrastructure will authenticate and authorize all
        # incoming requests.If true, the oauth2_client_id and oauth2_client_secret
        # fields must be non-empty.
        # Corresponds to the JSON property `enabled`
        # @return [Boolean]
        attr_accessor :enabled
        alias_method :enabled?, :enabled
      
        # OAuth2 client ID to use for the authentication flow.
        # Corresponds to the JSON property `oauth2ClientId`
        # @return [String]
        attr_accessor :oauth2_client_id
      
        # InputOnly OAuth client info required to generate client id to be used for IAP.
        # Corresponds to the JSON property `oauth2ClientInfo`
        # @return [Google::Apis::AppengineV1beta::OAuth2ClientInfo]
        attr_accessor :oauth2_client_info
      
        # OAuth2 client secret to use for the authentication flow.For security reasons,
        # this value cannot be retrieved via the API. Instead, the SHA-256 hash of the
        # value is returned in the oauth2_client_secret_sha256 field.@InputOnly
        # Corresponds to the JSON property `oauth2ClientSecret`
        # @return [String]
        attr_accessor :oauth2_client_secret
      
        # Hex-encoded SHA-256 hash of the client secret.@OutputOnly
        # Corresponds to the JSON property `oauth2ClientSecretSha256`
        # @return [String]
        attr_accessor :oauth2_client_secret_sha256
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @enabled = args[:enabled] if args.key?(:enabled)
          @oauth2_client_id = args[:oauth2_client_id] if args.key?(:oauth2_client_id)
          @oauth2_client_info = args[:oauth2_client_info] if args.key?(:oauth2_client_info)
          @oauth2_client_secret = args[:oauth2_client_secret] if args.key?(:oauth2_client_secret)
          @oauth2_client_secret_sha256 = args[:oauth2_client_secret_sha256] if args.key?(:oauth2_client_secret_sha256)
        end
      end
      
      # An Instance resource is the computing unit that App Engine uses to
      # automatically scale an application.
      class Instance
        include Google::Apis::Core::Hashable
      
        # App Engine release this instance is running on.@OutputOnly
        # Corresponds to the JSON property `appEngineRelease`
        # @return [String]
        attr_accessor :app_engine_release
      
        # Availability of the instance.@OutputOnly
        # Corresponds to the JSON property `availability`
        # @return [String]
        attr_accessor :availability
      
        # Average latency (ms) over the last minute.@OutputOnly
        # Corresponds to the JSON property `averageLatency`
        # @return [Fixnum]
        attr_accessor :average_latency
      
        # Number of errors since this instance was started.@OutputOnly
        # Corresponds to the JSON property `errors`
        # @return [Fixnum]
        attr_accessor :errors
      
        # Relative name of the instance within the version. Example: instance-1.@
        # OutputOnly
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Total memory in use (bytes).@OutputOnly
        # Corresponds to the JSON property `memoryUsage`
        # @return [Fixnum]
        attr_accessor :memory_usage
      
        # Full path to the Instance resource in the API. Example: apps/myapp/services/
        # default/versions/v1/instances/instance-1.@OutputOnly
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Average queries per second (QPS) over the last minute.@OutputOnly
        # Corresponds to the JSON property `qps`
        # @return [Float]
        attr_accessor :qps
      
        # Number of requests since this instance was started.@OutputOnly
        # Corresponds to the JSON property `requests`
        # @return [Fixnum]
        attr_accessor :requests
      
        # Time that this instance was started.@OutputOnly
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        # Whether this instance is in debug mode. Only applicable for instances in App
        # Engine flexible environment.@OutputOnly
        # Corresponds to the JSON property `vmDebugEnabled`
        # @return [Boolean]
        attr_accessor :vm_debug_enabled
        alias_method :vm_debug_enabled?, :vm_debug_enabled
      
        # Virtual machine ID of this instance. Only applicable for instances in App
        # Engine flexible environment.@OutputOnly
        # Corresponds to the JSON property `vmId`
        # @return [String]
        attr_accessor :vm_id
      
        # The IP address of this instance. Only applicable for instances in App Engine
        # flexible environment.@OutputOnly
        # Corresponds to the JSON property `vmIp`
        # @return [String]
        attr_accessor :vm_ip
      
        # Name of the virtual machine where this instance lives. Only applicable for
        # instances in App Engine flexible environment.@OutputOnly
        # Corresponds to the JSON property `vmName`
        # @return [String]
        attr_accessor :vm_name
      
        # Status of the virtual machine where this instance lives. Only applicable for
        # instances in App Engine flexible environment.@OutputOnly
        # Corresponds to the JSON property `vmStatus`
        # @return [String]
        attr_accessor :vm_status
      
        # Zone where the virtual machine is located. Only applicable for instances in
        # App Engine flexible environment.@OutputOnly
        # Corresponds to the JSON property `vmZoneName`
        # @return [String]
        attr_accessor :vm_zone_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @app_engine_release = args[:app_engine_release] if args.key?(:app_engine_release)
          @availability = args[:availability] if args.key?(:availability)
          @average_latency = args[:average_latency] if args.key?(:average_latency)
          @errors = args[:errors] if args.key?(:errors)
          @id = args[:id] if args.key?(:id)
          @memory_usage = args[:memory_usage] if args.key?(:memory_usage)
          @name = args[:name] if args.key?(:name)
          @qps = args[:qps] if args.key?(:qps)
          @requests = args[:requests] if args.key?(:requests)
          @start_time = args[:start_time] if args.key?(:start_time)
          @vm_debug_enabled = args[:vm_debug_enabled] if args.key?(:vm_debug_enabled)
          @vm_id = args[:vm_id] if args.key?(:vm_id)
          @vm_ip = args[:vm_ip] if args.key?(:vm_ip)
          @vm_name = args[:vm_name] if args.key?(:vm_name)
          @vm_status = args[:vm_status] if args.key?(:vm_status)
          @vm_zone_name = args[:vm_zone_name] if args.key?(:vm_zone_name)
        end
      end
      
      # Third-party Python runtime library that is required by the application.
      class Library
        include Google::Apis::Core::Hashable
      
        # Name of the library. Example: "django".
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Version of the library to select, or "latest".
        # Corresponds to the JSON property `version`
        # @return [String]
        attr_accessor :version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @version = args[:version] if args.key?(:version)
        end
      end
      
      # Response message for AuthorizedCertificates.ListAuthorizedCertificates.
      class ListAuthorizedCertificatesResponse
        include Google::Apis::Core::Hashable
      
        # The SSL certificates the user is authorized to administer.
        # Corresponds to the JSON property `certificates`
        # @return [Array<Google::Apis::AppengineV1beta::AuthorizedCertificate>]
        attr_accessor :certificates
      
        # Continuation token for fetching the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @certificates = args[:certificates] if args.key?(:certificates)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Response message for AuthorizedDomains.ListAuthorizedDomains.
      class ListAuthorizedDomainsResponse
        include Google::Apis::Core::Hashable
      
        # The authorized domains belonging to the user.
        # Corresponds to the JSON property `domains`
        # @return [Array<Google::Apis::AppengineV1beta::AuthorizedDomain>]
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
      
      # Response message for DomainMappings.ListDomainMappings.
      class ListDomainMappingsResponse
        include Google::Apis::Core::Hashable
      
        # The domain mappings for the application.
        # Corresponds to the JSON property `domainMappings`
        # @return [Array<Google::Apis::AppengineV1beta::DomainMapping>]
        attr_accessor :domain_mappings
      
        # Continuation token for fetching the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @domain_mappings = args[:domain_mappings] if args.key?(:domain_mappings)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Response message for Firewall.ListIngressRules.
      class ListIngressRulesResponse
        include Google::Apis::Core::Hashable
      
        # The ingress FirewallRules for this application.
        # Corresponds to the JSON property `ingressRules`
        # @return [Array<Google::Apis::AppengineV1beta::FirewallRule>]
        attr_accessor :ingress_rules
      
        # Continuation token for fetching the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @ingress_rules = args[:ingress_rules] if args.key?(:ingress_rules)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Response message for Instances.ListInstances.
      class ListInstancesResponse
        include Google::Apis::Core::Hashable
      
        # The instances belonging to the requested version.
        # Corresponds to the JSON property `instances`
        # @return [Array<Google::Apis::AppengineV1beta::Instance>]
        attr_accessor :instances
      
        # Continuation token for fetching the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @instances = args[:instances] if args.key?(:instances)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # The response message for Locations.ListLocations.
      class ListLocationsResponse
        include Google::Apis::Core::Hashable
      
        # A list of locations that matches the specified filter in the request.
        # Corresponds to the JSON property `locations`
        # @return [Array<Google::Apis::AppengineV1beta::Location>]
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
      
      # The response message for Operations.ListOperations.
      class ListOperationsResponse
        include Google::Apis::Core::Hashable
      
        # The standard List next-page token.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # A list of operations that matches the specified filter in the request.
        # Corresponds to the JSON property `operations`
        # @return [Array<Google::Apis::AppengineV1beta::Operation>]
        attr_accessor :operations
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @operations = args[:operations] if args.key?(:operations)
        end
      end
      
      # Response message for Services.ListServices.
      class ListServicesResponse
        include Google::Apis::Core::Hashable
      
        # Continuation token for fetching the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The services belonging to the requested application.
        # Corresponds to the JSON property `services`
        # @return [Array<Google::Apis::AppengineV1beta::Service>]
        attr_accessor :services
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @services = args[:services] if args.key?(:services)
        end
      end
      
      # Response message for Versions.ListVersions.
      class ListVersionsResponse
        include Google::Apis::Core::Hashable
      
        # Continuation token for fetching the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The versions belonging to the requested service.
        # Corresponds to the JSON property `versions`
        # @return [Array<Google::Apis::AppengineV1beta::Version>]
        attr_accessor :versions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @versions = args[:versions] if args.key?(:versions)
        end
      end
      
      # Health checking configuration for VM instances. Unhealthy instances are killed
      # and replaced with new instances.
      class LivenessCheck
        include Google::Apis::Core::Hashable
      
        # Interval between health checks.
        # Corresponds to the JSON property `checkInterval`
        # @return [String]
        attr_accessor :check_interval
      
        # Number of consecutive failed checks required before considering the VM
        # unhealthy.
        # Corresponds to the JSON property `failureThreshold`
        # @return [Fixnum]
        attr_accessor :failure_threshold
      
        # Host header to send when performing a HTTP Liveness check. Example: "myapp.
        # appspot.com"
        # Corresponds to the JSON property `host`
        # @return [String]
        attr_accessor :host
      
        # The initial delay before starting to execute the checks.
        # Corresponds to the JSON property `initialDelay`
        # @return [String]
        attr_accessor :initial_delay
      
        # The request path.
        # Corresponds to the JSON property `path`
        # @return [String]
        attr_accessor :path
      
        # Number of consecutive successful checks required before considering the VM
        # healthy.
        # Corresponds to the JSON property `successThreshold`
        # @return [Fixnum]
        attr_accessor :success_threshold
      
        # Time before the check is considered failed.
        # Corresponds to the JSON property `timeout`
        # @return [String]
        attr_accessor :timeout
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @check_interval = args[:check_interval] if args.key?(:check_interval)
          @failure_threshold = args[:failure_threshold] if args.key?(:failure_threshold)
          @host = args[:host] if args.key?(:host)
          @initial_delay = args[:initial_delay] if args.key?(:initial_delay)
          @path = args[:path] if args.key?(:path)
          @success_threshold = args[:success_threshold] if args.key?(:success_threshold)
          @timeout = args[:timeout] if args.key?(:timeout)
        end
      end
      
      # A resource that represents Google Cloud Platform location.
      class Location
        include Google::Apis::Core::Hashable
      
        # The friendly name for this location, typically a nearby city name. For example,
        # "Tokyo".
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # Cross-service attributes for the location. For example
        # `"cloud.googleapis.com/region": "us-east1"`
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # The canonical id for this location. For example: "us-east1".
        # Corresponds to the JSON property `locationId`
        # @return [String]
        attr_accessor :location_id
      
        # Service-specific metadata. For example the available capacity at the given
        # location.
        # Corresponds to the JSON property `metadata`
        # @return [Hash<String,Object>]
        attr_accessor :metadata
      
        # Resource name for the location, which may vary between implementations. For
        # example: "projects/example-project/locations/us-east1"
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
      
      # Metadata for the given google.cloud.location.Location.
      class LocationMetadata
        include Google::Apis::Core::Hashable
      
        # App Engine flexible environment is available in the given location.@OutputOnly
        # Corresponds to the JSON property `flexibleEnvironmentAvailable`
        # @return [Boolean]
        attr_accessor :flexible_environment_available
        alias_method :flexible_environment_available?, :flexible_environment_available
      
        # App Engine standard environment is available in the given location.@OutputOnly
        # Corresponds to the JSON property `standardEnvironmentAvailable`
        # @return [Boolean]
        attr_accessor :standard_environment_available
        alias_method :standard_environment_available?, :standard_environment_available
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @flexible_environment_available = args[:flexible_environment_available] if args.key?(:flexible_environment_available)
          @standard_environment_available = args[:standard_environment_available] if args.key?(:standard_environment_available)
        end
      end
      
      # A certificate managed by App Engine.
      class ManagedCertificate
        include Google::Apis::Core::Hashable
      
        # Time at which the certificate was last renewed. The renewal process is fully
        # managed. Certificate renewal will automatically occur before the certificate
        # expires. Renewal errors can be tracked via ManagementStatus.@OutputOnly
        # Corresponds to the JSON property `lastRenewalTime`
        # @return [String]
        attr_accessor :last_renewal_time
      
        # Status of certificate management. Refers to the most recent certificate
        # acquisition or renewal attempt.@OutputOnly
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @last_renewal_time = args[:last_renewal_time] if args.key?(:last_renewal_time)
          @status = args[:status] if args.key?(:status)
        end
      end
      
      # A service with manual scaling runs continuously, allowing you to perform
      # complex initialization and rely on the state of its memory over time.
      class ManualScaling
        include Google::Apis::Core::Hashable
      
        # Number of instances to assign to the service at the start. This number can
        # later be altered by using the Modules API (https://cloud.google.com/appengine/
        # docs/python/modules/functions) set_num_instances() function.
        # Corresponds to the JSON property `instances`
        # @return [Fixnum]
        attr_accessor :instances
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @instances = args[:instances] if args.key?(:instances)
        end
      end
      
      # Extra network settings. Only applicable in the App Engine flexible environment.
      class Network
        include Google::Apis::Core::Hashable
      
        # List of ports, or port pairs, to forward from the virtual machine to the
        # application container. Only applicable in the App Engine flexible environment.
        # Corresponds to the JSON property `forwardedPorts`
        # @return [Array<String>]
        attr_accessor :forwarded_ports
      
        # Tag to apply to the instance during creation. Only applicable in the App
        # Engine flexible environment.
        # Corresponds to the JSON property `instanceTag`
        # @return [String]
        attr_accessor :instance_tag
      
        # Google Compute Engine network where the virtual machines are created. Specify
        # the short name, not the resource path.Defaults to default.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Enable session affinity. Only applicable in the App Engine flexible
        # environment.
        # Corresponds to the JSON property `sessionAffinity`
        # @return [Boolean]
        attr_accessor :session_affinity
        alias_method :session_affinity?, :session_affinity
      
        # Google Cloud Platform sub-network where the virtual machines are created.
        # Specify the short name, not the resource path.If a subnetwork name is
        # specified, a network name will also be required unless it is for the default
        # network.
        # If the network that the instance is being created in is a Legacy network, then
        # the IP address is allocated from the IPv4Range.
        # If the network that the instance is being created in is an auto Subnet Mode
        # Network, then only network name should be specified (not the subnetwork_name)
        # and the IP address is created from the IPCidrRange of the subnetwork that
        # exists in that zone for that network.
        # If the network that the instance is being created in is a custom Subnet Mode
        # Network, then the subnetwork_name must be specified and the IP address is
        # created from the IPCidrRange of the subnetwork.If specified, the subnetwork
        # must exist in the same region as the App Engine flexible environment
        # application.
        # Corresponds to the JSON property `subnetworkName`
        # @return [String]
        attr_accessor :subnetwork_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @forwarded_ports = args[:forwarded_ports] if args.key?(:forwarded_ports)
          @instance_tag = args[:instance_tag] if args.key?(:instance_tag)
          @name = args[:name] if args.key?(:name)
          @session_affinity = args[:session_affinity] if args.key?(:session_affinity)
          @subnetwork_name = args[:subnetwork_name] if args.key?(:subnetwork_name)
        end
      end
      
      # Target scaling by network usage. Only applicable in the App Engine flexible
      # environment.
      class NetworkUtilization
        include Google::Apis::Core::Hashable
      
        # Target bytes received per second.
        # Corresponds to the JSON property `targetReceivedBytesPerSecond`
        # @return [Fixnum]
        attr_accessor :target_received_bytes_per_second
      
        # Target packets received per second.
        # Corresponds to the JSON property `targetReceivedPacketsPerSecond`
        # @return [Fixnum]
        attr_accessor :target_received_packets_per_second
      
        # Target bytes sent per second.
        # Corresponds to the JSON property `targetSentBytesPerSecond`
        # @return [Fixnum]
        attr_accessor :target_sent_bytes_per_second
      
        # Target packets sent per second.
        # Corresponds to the JSON property `targetSentPacketsPerSecond`
        # @return [Fixnum]
        attr_accessor :target_sent_packets_per_second
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @target_received_bytes_per_second = args[:target_received_bytes_per_second] if args.key?(:target_received_bytes_per_second)
          @target_received_packets_per_second = args[:target_received_packets_per_second] if args.key?(:target_received_packets_per_second)
          @target_sent_bytes_per_second = args[:target_sent_bytes_per_second] if args.key?(:target_sent_bytes_per_second)
          @target_sent_packets_per_second = args[:target_sent_packets_per_second] if args.key?(:target_sent_packets_per_second)
        end
      end
      
      # 
      class OAuth2ClientInfo
        include Google::Apis::Core::Hashable
      
        # Application name to be used in OAuth consent screen.
        # Corresponds to the JSON property `applicationName`
        # @return [String]
        attr_accessor :application_name
      
        # Nameof the client to be generated. Optional - If not provided, the name will
        # be autogenerated by the backend.
        # Corresponds to the JSON property `clientName`
        # @return [String]
        attr_accessor :client_name
      
        # Developer's information to be used in OAuth consent screen.
        # Corresponds to the JSON property `developerEmailAddress`
        # @return [String]
        attr_accessor :developer_email_address
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @application_name = args[:application_name] if args.key?(:application_name)
          @client_name = args[:client_name] if args.key?(:client_name)
          @developer_email_address = args[:developer_email_address] if args.key?(:developer_email_address)
        end
      end
      
      # This resource represents a long-running operation that is the result of a
      # network API call.
      class Operation
        include Google::Apis::Core::Hashable
      
        # If the value is false, it means the operation is still in progress. If true,
        # the operation is completed, and either error or response is available.
        # Corresponds to the JSON property `done`
        # @return [Boolean]
        attr_accessor :done
        alias_method :done?, :done
      
        # The Status type defines a logical error model that is suitable for different
        # programming environments, including REST APIs and RPC APIs. It is used by gRPC
        # (https://github.com/grpc). Each Status message contains three pieces of data:
        # error code, error message, and error details.You can find out more about this
        # error model and how to work with it in the API Design Guide (https://cloud.
        # google.com/apis/design/errors).
        # Corresponds to the JSON property `error`
        # @return [Google::Apis::AppengineV1beta::Status]
        attr_accessor :error
      
        # Service-specific metadata associated with the operation. It typically contains
        # progress information and common metadata such as create time. Some services
        # might not provide such metadata. Any method that returns a long-running
        # operation should document the metadata type, if any.
        # Corresponds to the JSON property `metadata`
        # @return [Hash<String,Object>]
        attr_accessor :metadata
      
        # The server-assigned name, which is only unique within the same service that
        # originally returns it. If you use the default HTTP mapping, the name should be
        # a resource name ending with operations/`unique_id`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The normal response of the operation in case of success. If the original
        # method returns no data on success, such as Delete, the response is google.
        # protobuf.Empty. If the original method is standard Get/Create/Update, the
        # response should be the resource. For other methods, the response should have
        # the type XxxResponse, where Xxx is the original method name. For example, if
        # the original method name is TakeSnapshot(), the inferred response type is
        # TakeSnapshotResponse.
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
      
      # Metadata for the given google.longrunning.Operation.
      class OperationMetadataV1
        include Google::Apis::Core::Hashable
      
        # Metadata for the given google.longrunning.Operation during a google.appengine.
        # v1.CreateVersionRequest.
        # Corresponds to the JSON property `createVersionMetadata`
        # @return [Google::Apis::AppengineV1beta::CreateVersionMetadataV1]
        attr_accessor :create_version_metadata
      
        # Time that this operation completed.@OutputOnly
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # Ephemeral message that may change every time the operation is polled. @
        # OutputOnly
        # Corresponds to the JSON property `ephemeralMessage`
        # @return [String]
        attr_accessor :ephemeral_message
      
        # Time that this operation was created.@OutputOnly
        # Corresponds to the JSON property `insertTime`
        # @return [String]
        attr_accessor :insert_time
      
        # API method that initiated this operation. Example: google.appengine.v1.
        # Versions.CreateVersion.@OutputOnly
        # Corresponds to the JSON property `method`
        # @return [String]
        attr_accessor :method_prop
      
        # Name of the resource that this operation is acting on. Example: apps/myapp/
        # services/default.@OutputOnly
        # Corresponds to the JSON property `target`
        # @return [String]
        attr_accessor :target
      
        # User who requested this operation.@OutputOnly
        # Corresponds to the JSON property `user`
        # @return [String]
        attr_accessor :user
      
        # Durable messages that persist on every operation poll. @OutputOnly
        # Corresponds to the JSON property `warning`
        # @return [Array<String>]
        attr_accessor :warning
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_version_metadata = args[:create_version_metadata] if args.key?(:create_version_metadata)
          @end_time = args[:end_time] if args.key?(:end_time)
          @ephemeral_message = args[:ephemeral_message] if args.key?(:ephemeral_message)
          @insert_time = args[:insert_time] if args.key?(:insert_time)
          @method_prop = args[:method_prop] if args.key?(:method_prop)
          @target = args[:target] if args.key?(:target)
          @user = args[:user] if args.key?(:user)
          @warning = args[:warning] if args.key?(:warning)
        end
      end
      
      # Metadata for the given google.longrunning.Operation.
      class OperationMetadataV1Alpha
        include Google::Apis::Core::Hashable
      
        # Metadata for the given google.longrunning.Operation during a google.appengine.
        # v1alpha.CreateVersionRequest.
        # Corresponds to the JSON property `createVersionMetadata`
        # @return [Google::Apis::AppengineV1beta::CreateVersionMetadataV1Alpha]
        attr_accessor :create_version_metadata
      
        # Time that this operation completed.@OutputOnly
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # Ephemeral message that may change every time the operation is polled. @
        # OutputOnly
        # Corresponds to the JSON property `ephemeralMessage`
        # @return [String]
        attr_accessor :ephemeral_message
      
        # Time that this operation was created.@OutputOnly
        # Corresponds to the JSON property `insertTime`
        # @return [String]
        attr_accessor :insert_time
      
        # API method that initiated this operation. Example: google.appengine.v1alpha.
        # Versions.CreateVersion.@OutputOnly
        # Corresponds to the JSON property `method`
        # @return [String]
        attr_accessor :method_prop
      
        # Name of the resource that this operation is acting on. Example: apps/myapp/
        # services/default.@OutputOnly
        # Corresponds to the JSON property `target`
        # @return [String]
        attr_accessor :target
      
        # User who requested this operation.@OutputOnly
        # Corresponds to the JSON property `user`
        # @return [String]
        attr_accessor :user
      
        # Durable messages that persist on every operation poll. @OutputOnly
        # Corresponds to the JSON property `warning`
        # @return [Array<String>]
        attr_accessor :warning
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_version_metadata = args[:create_version_metadata] if args.key?(:create_version_metadata)
          @end_time = args[:end_time] if args.key?(:end_time)
          @ephemeral_message = args[:ephemeral_message] if args.key?(:ephemeral_message)
          @insert_time = args[:insert_time] if args.key?(:insert_time)
          @method_prop = args[:method_prop] if args.key?(:method_prop)
          @target = args[:target] if args.key?(:target)
          @user = args[:user] if args.key?(:user)
          @warning = args[:warning] if args.key?(:warning)
        end
      end
      
      # Metadata for the given google.longrunning.Operation.
      class OperationMetadataV1Beta
        include Google::Apis::Core::Hashable
      
        # Metadata for the given google.longrunning.Operation during a google.appengine.
        # v1beta.CreateVersionRequest.
        # Corresponds to the JSON property `createVersionMetadata`
        # @return [Google::Apis::AppengineV1beta::CreateVersionMetadataV1Beta]
        attr_accessor :create_version_metadata
      
        # Time that this operation completed.@OutputOnly
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # Ephemeral message that may change every time the operation is polled. @
        # OutputOnly
        # Corresponds to the JSON property `ephemeralMessage`
        # @return [String]
        attr_accessor :ephemeral_message
      
        # Time that this operation was created.@OutputOnly
        # Corresponds to the JSON property `insertTime`
        # @return [String]
        attr_accessor :insert_time
      
        # API method that initiated this operation. Example: google.appengine.v1beta.
        # Versions.CreateVersion.@OutputOnly
        # Corresponds to the JSON property `method`
        # @return [String]
        attr_accessor :method_prop
      
        # Name of the resource that this operation is acting on. Example: apps/myapp/
        # services/default.@OutputOnly
        # Corresponds to the JSON property `target`
        # @return [String]
        attr_accessor :target
      
        # User who requested this operation.@OutputOnly
        # Corresponds to the JSON property `user`
        # @return [String]
        attr_accessor :user
      
        # Durable messages that persist on every operation poll. @OutputOnly
        # Corresponds to the JSON property `warning`
        # @return [Array<String>]
        attr_accessor :warning
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_version_metadata = args[:create_version_metadata] if args.key?(:create_version_metadata)
          @end_time = args[:end_time] if args.key?(:end_time)
          @ephemeral_message = args[:ephemeral_message] if args.key?(:ephemeral_message)
          @insert_time = args[:insert_time] if args.key?(:insert_time)
          @method_prop = args[:method_prop] if args.key?(:method_prop)
          @target = args[:target] if args.key?(:target)
          @user = args[:user] if args.key?(:user)
          @warning = args[:warning] if args.key?(:warning)
        end
      end
      
      # Readiness checking configuration for VM instances. Unhealthy instances are
      # removed from traffic rotation.
      class ReadinessCheck
        include Google::Apis::Core::Hashable
      
        # A maximum time limit on application initialization, measured from moment the
        # application successfully replies to a healthcheck until it is ready to serve
        # traffic.
        # Corresponds to the JSON property `appStartTimeout`
        # @return [String]
        attr_accessor :app_start_timeout
      
        # Interval between health checks.
        # Corresponds to the JSON property `checkInterval`
        # @return [String]
        attr_accessor :check_interval
      
        # Number of consecutive failed checks required before removing traffic.
        # Corresponds to the JSON property `failureThreshold`
        # @return [Fixnum]
        attr_accessor :failure_threshold
      
        # Host header to send when performing a HTTP Readiness check. Example: "myapp.
        # appspot.com"
        # Corresponds to the JSON property `host`
        # @return [String]
        attr_accessor :host
      
        # The request path.
        # Corresponds to the JSON property `path`
        # @return [String]
        attr_accessor :path
      
        # Number of consecutive successful checks required before receiving traffic.
        # Corresponds to the JSON property `successThreshold`
        # @return [Fixnum]
        attr_accessor :success_threshold
      
        # Time before the check is considered failed.
        # Corresponds to the JSON property `timeout`
        # @return [String]
        attr_accessor :timeout
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @app_start_timeout = args[:app_start_timeout] if args.key?(:app_start_timeout)
          @check_interval = args[:check_interval] if args.key?(:check_interval)
          @failure_threshold = args[:failure_threshold] if args.key?(:failure_threshold)
          @host = args[:host] if args.key?(:host)
          @path = args[:path] if args.key?(:path)
          @success_threshold = args[:success_threshold] if args.key?(:success_threshold)
          @timeout = args[:timeout] if args.key?(:timeout)
        end
      end
      
      # Request message for 'Applications.RepairApplication'.
      class RepairApplicationRequest
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Target scaling by request utilization. Only applicable in the App Engine
      # flexible environment.
      class RequestUtilization
        include Google::Apis::Core::Hashable
      
        # Target number of concurrent requests.
        # Corresponds to the JSON property `targetConcurrentRequests`
        # @return [Fixnum]
        attr_accessor :target_concurrent_requests
      
        # Target requests per second.
        # Corresponds to the JSON property `targetRequestCountPerSecond`
        # @return [Fixnum]
        attr_accessor :target_request_count_per_second
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @target_concurrent_requests = args[:target_concurrent_requests] if args.key?(:target_concurrent_requests)
          @target_request_count_per_second = args[:target_request_count_per_second] if args.key?(:target_request_count_per_second)
        end
      end
      
      # A DNS resource record.
      class ResourceRecord
        include Google::Apis::Core::Hashable
      
        # Relative name of the object affected by this record. Only applicable for CNAME
        # records. Example: 'www'.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Data for this record. Values vary by record type, as defined in RFC 1035 (
        # section 5) and RFC 1034 (section 3.6.1).
        # Corresponds to the JSON property `rrdata`
        # @return [String]
        attr_accessor :rrdata
      
        # Resource record type. Example: AAAA.
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
      
      # Machine resources for a version.
      class Resources
        include Google::Apis::Core::Hashable
      
        # Number of CPU cores needed.
        # Corresponds to the JSON property `cpu`
        # @return [Float]
        attr_accessor :cpu
      
        # Disk size (GB) needed.
        # Corresponds to the JSON property `diskGb`
        # @return [Float]
        attr_accessor :disk_gb
      
        # Memory (GB) needed.
        # Corresponds to the JSON property `memoryGb`
        # @return [Float]
        attr_accessor :memory_gb
      
        # User specified volumes.
        # Corresponds to the JSON property `volumes`
        # @return [Array<Google::Apis::AppengineV1beta::Volume>]
        attr_accessor :volumes
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cpu = args[:cpu] if args.key?(:cpu)
          @disk_gb = args[:disk_gb] if args.key?(:disk_gb)
          @memory_gb = args[:memory_gb] if args.key?(:memory_gb)
          @volumes = args[:volumes] if args.key?(:volumes)
        end
      end
      
      # Executes a script to handle the request that matches the URL pattern.
      class ScriptHandler
        include Google::Apis::Core::Hashable
      
        # Path to the script from the application root directory.
        # Corresponds to the JSON property `scriptPath`
        # @return [String]
        attr_accessor :script_path
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @script_path = args[:script_path] if args.key?(:script_path)
        end
      end
      
      # A Service resource is a logical component of an application that can share
      # state and communicate in a secure fashion with other services. For example, an
      # application that handles customer requests might include separate services to
      # handle tasks such as backend data analysis or API requests from mobile devices.
      # Each service has a collection of versions that define a specific set of code
      # used to implement the functionality of that service.
      class Service
        include Google::Apis::Core::Hashable
      
        # Relative name of the service within the application. Example: default.@
        # OutputOnly
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Full path to the Service resource in the API. Example: apps/myapp/services/
        # default.@OutputOnly
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Traffic routing configuration for versions within a single service. Traffic
        # splits define how traffic directed to the service is assigned to versions.
        # Corresponds to the JSON property `split`
        # @return [Google::Apis::AppengineV1beta::TrafficSplit]
        attr_accessor :split
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @id = args[:id] if args.key?(:id)
          @name = args[:name] if args.key?(:name)
          @split = args[:split] if args.key?(:split)
        end
      end
      
      # SSL configuration for a DomainMapping resource.
      class SslSettings
        include Google::Apis::Core::Hashable
      
        # ID of the AuthorizedCertificate resource configuring SSL for the application.
        # Clearing this field will remove SSL support.By default, a managed certificate
        # is automatically created for every domain mapping. To omit SSL support or to
        # configure SSL manually, specify SslManagementType.MANUAL on a CREATE or UPDATE
        # request. You must be authorized to administer the AuthorizedCertificate
        # resource to manually map it to a DomainMapping resource. Example: 12345.
        # Corresponds to the JSON property `certificateId`
        # @return [String]
        attr_accessor :certificate_id
      
        # ID of the managed AuthorizedCertificate resource currently being provisioned,
        # if applicable. Until the new managed certificate has been successfully
        # provisioned, the previous SSL state will be preserved. Once the provisioning
        # process completes, the certificate_id field will reflect the new managed
        # certificate and this field will be left empty. To remove SSL support while
        # there is still a pending managed certificate, clear the certificate_id field
        # with an UpdateDomainMappingRequest.@OutputOnly
        # Corresponds to the JSON property `pendingManagedCertificateId`
        # @return [String]
        attr_accessor :pending_managed_certificate_id
      
        # SSL management type for this domain. If AUTOMATIC, a managed certificate is
        # automatically provisioned. If MANUAL, certificate_id must be manually
        # specified in order to configure SSL for this domain.
        # Corresponds to the JSON property `sslManagementType`
        # @return [String]
        attr_accessor :ssl_management_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @certificate_id = args[:certificate_id] if args.key?(:certificate_id)
          @pending_managed_certificate_id = args[:pending_managed_certificate_id] if args.key?(:pending_managed_certificate_id)
          @ssl_management_type = args[:ssl_management_type] if args.key?(:ssl_management_type)
        end
      end
      
      # Scheduler settings for standard environment.
      class StandardSchedulerSettings
        include Google::Apis::Core::Hashable
      
        # Maximum number of instances to run for this version. Set to zero to disable
        # max_instances configuration.
        # Corresponds to the JSON property `maxInstances`
        # @return [Fixnum]
        attr_accessor :max_instances
      
        # Minimum number of instances to run for this version. Set to zero to disable
        # min_instances configuration.
        # Corresponds to the JSON property `minInstances`
        # @return [Fixnum]
        attr_accessor :min_instances
      
        # Target CPU utilization ratio to maintain when scaling.
        # Corresponds to the JSON property `targetCpuUtilization`
        # @return [Float]
        attr_accessor :target_cpu_utilization
      
        # Target throughput utilization ratio to maintain when scaling
        # Corresponds to the JSON property `targetThroughputUtilization`
        # @return [Float]
        attr_accessor :target_throughput_utilization
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @max_instances = args[:max_instances] if args.key?(:max_instances)
          @min_instances = args[:min_instances] if args.key?(:min_instances)
          @target_cpu_utilization = args[:target_cpu_utilization] if args.key?(:target_cpu_utilization)
          @target_throughput_utilization = args[:target_throughput_utilization] if args.key?(:target_throughput_utilization)
        end
      end
      
      # Files served directly to the user for a given URL, such as images, CSS
      # stylesheets, or JavaScript source files. Static file handlers describe which
      # files in the application directory are static files, and which URLs serve them.
      class StaticFilesHandler
        include Google::Apis::Core::Hashable
      
        # Whether files should also be uploaded as code data. By default, files declared
        # in static file handlers are uploaded as static data and are only served to end
        # users; they cannot be read by the application. If enabled, uploads are charged
        # against both your code and static data storage resource quotas.
        # Corresponds to the JSON property `applicationReadable`
        # @return [Boolean]
        attr_accessor :application_readable
        alias_method :application_readable?, :application_readable
      
        # Time a static file served by this handler should be cached by web proxies and
        # browsers.
        # Corresponds to the JSON property `expiration`
        # @return [String]
        attr_accessor :expiration
      
        # HTTP headers to use for all responses from these URLs.
        # Corresponds to the JSON property `httpHeaders`
        # @return [Hash<String,String>]
        attr_accessor :http_headers
      
        # MIME type used to serve all files served by this handler.Defaults to file-
        # specific MIME types, which are derived from each file's filename extension.
        # Corresponds to the JSON property `mimeType`
        # @return [String]
        attr_accessor :mime_type
      
        # Path to the static files matched by the URL pattern, from the application root
        # directory. The path can refer to text matched in groupings in the URL pattern.
        # Corresponds to the JSON property `path`
        # @return [String]
        attr_accessor :path
      
        # Whether this handler should match the request if the file referenced by the
        # handler does not exist.
        # Corresponds to the JSON property `requireMatchingFile`
        # @return [Boolean]
        attr_accessor :require_matching_file
        alias_method :require_matching_file?, :require_matching_file
      
        # Regular expression that matches the file paths for all files that should be
        # referenced by this handler.
        # Corresponds to the JSON property `uploadPathRegex`
        # @return [String]
        attr_accessor :upload_path_regex
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @application_readable = args[:application_readable] if args.key?(:application_readable)
          @expiration = args[:expiration] if args.key?(:expiration)
          @http_headers = args[:http_headers] if args.key?(:http_headers)
          @mime_type = args[:mime_type] if args.key?(:mime_type)
          @path = args[:path] if args.key?(:path)
          @require_matching_file = args[:require_matching_file] if args.key?(:require_matching_file)
          @upload_path_regex = args[:upload_path_regex] if args.key?(:upload_path_regex)
        end
      end
      
      # The Status type defines a logical error model that is suitable for different
      # programming environments, including REST APIs and RPC APIs. It is used by gRPC
      # (https://github.com/grpc). Each Status message contains three pieces of data:
      # error code, error message, and error details.You can find out more about this
      # error model and how to work with it in the API Design Guide (https://cloud.
      # google.com/apis/design/errors).
      class Status
        include Google::Apis::Core::Hashable
      
        # The status code, which should be an enum value of google.rpc.Code.
        # Corresponds to the JSON property `code`
        # @return [Fixnum]
        attr_accessor :code
      
        # A list of messages that carry the error details. There is a common set of
        # message types for APIs to use.
        # Corresponds to the JSON property `details`
        # @return [Array<Hash<String,Object>>]
        attr_accessor :details
      
        # A developer-facing error message, which should be in English. Any user-facing
        # error message should be localized and sent in the google.rpc.Status.details
        # field, or localized by the client.
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
      
      # Traffic routing configuration for versions within a single service. Traffic
      # splits define how traffic directed to the service is assigned to versions.
      class TrafficSplit
        include Google::Apis::Core::Hashable
      
        # Mapping from version IDs within the service to fractional (0.000, 1]
        # allocations of traffic for that version. Each version can be specified only
        # once, but some versions in the service may not have any traffic allocation.
        # Services that have traffic allocated cannot be deleted until either the
        # service is deleted or their traffic allocation is removed. Allocations must
        # sum to 1. Up to two decimal place precision is supported for IP-based splits
        # and up to three decimal places is supported for cookie-based splits.
        # Corresponds to the JSON property `allocations`
        # @return [Hash<String,Float>]
        attr_accessor :allocations
      
        # Mechanism used to determine which version a request is sent to. The traffic
        # selection algorithm will be stable for either type until allocations are
        # changed.
        # Corresponds to the JSON property `shardBy`
        # @return [String]
        attr_accessor :shard_by
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @allocations = args[:allocations] if args.key?(:allocations)
          @shard_by = args[:shard_by] if args.key?(:shard_by)
        end
      end
      
      # Rules to match an HTTP request and dispatch that request to a service.
      class UrlDispatchRule
        include Google::Apis::Core::Hashable
      
        # Domain name to match against. The wildcard "*" is supported if specified
        # before a period: "*.".Defaults to matching all domains: "*".
        # Corresponds to the JSON property `domain`
        # @return [String]
        attr_accessor :domain
      
        # Pathname within the host. Must start with a "/". A single "*" can be included
        # at the end of the path.The sum of the lengths of the domain and path may not
        # exceed 100 characters.
        # Corresponds to the JSON property `path`
        # @return [String]
        attr_accessor :path
      
        # Resource ID of a service in this application that should serve the matched
        # request. The service must already exist. Example: default.
        # Corresponds to the JSON property `service`
        # @return [String]
        attr_accessor :service
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @domain = args[:domain] if args.key?(:domain)
          @path = args[:path] if args.key?(:path)
          @service = args[:service] if args.key?(:service)
        end
      end
      
      # URL pattern and description of how the URL should be handled. App Engine can
      # handle URLs by executing application code or by serving static files uploaded
      # with the version, such as images, CSS, or JavaScript.
      class UrlMap
        include Google::Apis::Core::Hashable
      
        # Uses Google Cloud Endpoints to handle requests.
        # Corresponds to the JSON property `apiEndpoint`
        # @return [Google::Apis::AppengineV1beta::ApiEndpointHandler]
        attr_accessor :api_endpoint
      
        # Action to take when users access resources that require authentication.
        # Defaults to redirect.
        # Corresponds to the JSON property `authFailAction`
        # @return [String]
        attr_accessor :auth_fail_action
      
        # Level of login required to access this resource. Not supported for Node.js in
        # the App Engine standard environment.
        # Corresponds to the JSON property `login`
        # @return [String]
        attr_accessor :login
      
        # 30x code to use when performing redirects for the secure field. Defaults to
        # 302.
        # Corresponds to the JSON property `redirectHttpResponseCode`
        # @return [String]
        attr_accessor :redirect_http_response_code
      
        # Executes a script to handle the request that matches the URL pattern.
        # Corresponds to the JSON property `script`
        # @return [Google::Apis::AppengineV1beta::ScriptHandler]
        attr_accessor :script
      
        # Security (HTTPS) enforcement for this URL.
        # Corresponds to the JSON property `securityLevel`
        # @return [String]
        attr_accessor :security_level
      
        # Files served directly to the user for a given URL, such as images, CSS
        # stylesheets, or JavaScript source files. Static file handlers describe which
        # files in the application directory are static files, and which URLs serve them.
        # Corresponds to the JSON property `staticFiles`
        # @return [Google::Apis::AppengineV1beta::StaticFilesHandler]
        attr_accessor :static_files
      
        # URL prefix. Uses regular expression syntax, which means regexp special
        # characters must be escaped, but should not contain groupings. All URLs that
        # begin with this prefix are handled by this handler, using the portion of the
        # URL after the prefix as part of the file path.
        # Corresponds to the JSON property `urlRegex`
        # @return [String]
        attr_accessor :url_regex
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @api_endpoint = args[:api_endpoint] if args.key?(:api_endpoint)
          @auth_fail_action = args[:auth_fail_action] if args.key?(:auth_fail_action)
          @login = args[:login] if args.key?(:login)
          @redirect_http_response_code = args[:redirect_http_response_code] if args.key?(:redirect_http_response_code)
          @script = args[:script] if args.key?(:script)
          @security_level = args[:security_level] if args.key?(:security_level)
          @static_files = args[:static_files] if args.key?(:static_files)
          @url_regex = args[:url_regex] if args.key?(:url_regex)
        end
      end
      
      # A Version resource is a specific set of source code and configuration files
      # that are deployed into a service.
      class Version
        include Google::Apis::Core::Hashable
      
        # Google Cloud Endpoints (https://cloud.google.com/appengine/docs/python/
        # endpoints/) configuration for API handlers.
        # Corresponds to the JSON property `apiConfig`
        # @return [Google::Apis::AppengineV1beta::ApiConfigHandler]
        attr_accessor :api_config
      
        # Automatic scaling is based on request rate, response latencies, and other
        # application metrics.
        # Corresponds to the JSON property `automaticScaling`
        # @return [Google::Apis::AppengineV1beta::AutomaticScaling]
        attr_accessor :automatic_scaling
      
        # A service with basic scaling will create an instance when the application
        # receives a request. The instance will be turned down when the app becomes idle.
        # Basic scaling is ideal for work that is intermittent or driven by user
        # activity.
        # Corresponds to the JSON property `basicScaling`
        # @return [Google::Apis::AppengineV1beta::BasicScaling]
        attr_accessor :basic_scaling
      
        # Metadata settings that are supplied to this version to enable beta runtime
        # features.
        # Corresponds to the JSON property `betaSettings`
        # @return [Hash<String,String>]
        attr_accessor :beta_settings
      
        # Time that this version was created.@OutputOnly
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Email address of the user who created this version.@OutputOnly
        # Corresponds to the JSON property `createdBy`
        # @return [String]
        attr_accessor :created_by
      
        # Duration that static files should be cached by web proxies and browsers. Only
        # applicable if the corresponding StaticFilesHandler (https://cloud.google.com/
        # appengine/docs/admin-api/reference/rest/v1beta/apps.services.versions#
        # StaticFilesHandler) does not specify its own expiration time.Only returned in
        # GET requests if view=FULL is set.
        # Corresponds to the JSON property `defaultExpiration`
        # @return [String]
        attr_accessor :default_expiration
      
        # Code and application artifacts used to deploy a version to App Engine.
        # Corresponds to the JSON property `deployment`
        # @return [Google::Apis::AppengineV1beta::Deployment]
        attr_accessor :deployment
      
        # Total size in bytes of all the files that are included in this version and
        # currently hosted on the App Engine disk.@OutputOnly
        # Corresponds to the JSON property `diskUsageBytes`
        # @return [Fixnum]
        attr_accessor :disk_usage_bytes
      
        # Cloud Endpoints (https://cloud.google.com/endpoints) configuration. The
        # Endpoints API Service provides tooling for serving Open API and gRPC endpoints
        # via an NGINX proxy. Only valid for App Engine Flexible environment deployments.
        # The fields here refer to the name and configuration ID of a "service" resource
        # in the Service Management API (https://cloud.google.com/service-management/
        # overview).
        # Corresponds to the JSON property `endpointsApiService`
        # @return [Google::Apis::AppengineV1beta::EndpointsApiService]
        attr_accessor :endpoints_api_service
      
        # The entrypoint for the application.
        # Corresponds to the JSON property `entrypoint`
        # @return [Google::Apis::AppengineV1beta::Entrypoint]
        attr_accessor :entrypoint
      
        # App Engine execution environment for this version.Defaults to standard.
        # Corresponds to the JSON property `env`
        # @return [String]
        attr_accessor :env
      
        # Environment variables available to the application.Only returned in GET
        # requests if view=FULL is set.
        # Corresponds to the JSON property `envVariables`
        # @return [Hash<String,String>]
        attr_accessor :env_variables
      
        # Custom static error pages. Limited to 10KB per page.Only returned in GET
        # requests if view=FULL is set.
        # Corresponds to the JSON property `errorHandlers`
        # @return [Array<Google::Apis::AppengineV1beta::ErrorHandler>]
        attr_accessor :error_handlers
      
        # An ordered list of URL-matching patterns that should be applied to incoming
        # requests. The first matching URL handles the request and other request
        # handlers are not attempted.Only returned in GET requests if view=FULL is set.
        # Corresponds to the JSON property `handlers`
        # @return [Array<Google::Apis::AppengineV1beta::UrlMap>]
        attr_accessor :handlers
      
        # Health checking configuration for VM instances. Unhealthy instances are killed
        # and replaced with new instances. Only applicable for instances in App Engine
        # flexible environment.
        # Corresponds to the JSON property `healthCheck`
        # @return [Google::Apis::AppengineV1beta::HealthCheck]
        attr_accessor :health_check
      
        # Relative name of the version within the service. Example: v1. Version names
        # can contain only lowercase letters, numbers, or hyphens. Reserved names: "
        # default", "latest", and any name with the prefix "ah-".
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Before an application can receive email or XMPP messages, the application must
        # be configured to enable the service.
        # Corresponds to the JSON property `inboundServices`
        # @return [Array<String>]
        attr_accessor :inbound_services
      
        # Instance class that is used to run this version. Valid values are:
        # AutomaticScaling: F1, F2, F4, F4_1G
        # ManualScaling or BasicScaling: B1, B2, B4, B8, B4_1GDefaults to F1 for
        # AutomaticScaling and B1 for ManualScaling or BasicScaling.
        # Corresponds to the JSON property `instanceClass`
        # @return [String]
        attr_accessor :instance_class
      
        # Configuration for third-party Python runtime libraries that are required by
        # the application.Only returned in GET requests if view=FULL is set.
        # Corresponds to the JSON property `libraries`
        # @return [Array<Google::Apis::AppengineV1beta::Library>]
        attr_accessor :libraries
      
        # Health checking configuration for VM instances. Unhealthy instances are killed
        # and replaced with new instances.
        # Corresponds to the JSON property `livenessCheck`
        # @return [Google::Apis::AppengineV1beta::LivenessCheck]
        attr_accessor :liveness_check
      
        # A service with manual scaling runs continuously, allowing you to perform
        # complex initialization and rely on the state of its memory over time.
        # Corresponds to the JSON property `manualScaling`
        # @return [Google::Apis::AppengineV1beta::ManualScaling]
        attr_accessor :manual_scaling
      
        # Full path to the Version resource in the API. Example: apps/myapp/services/
        # default/versions/v1.@OutputOnly
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Extra network settings. Only applicable in the App Engine flexible environment.
        # Corresponds to the JSON property `network`
        # @return [Google::Apis::AppengineV1beta::Network]
        attr_accessor :network
      
        # Files that match this pattern will not be built into this version. Only
        # applicable for Go runtimes.Only returned in GET requests if view=FULL is set.
        # Corresponds to the JSON property `nobuildFilesRegex`
        # @return [String]
        attr_accessor :nobuild_files_regex
      
        # Readiness checking configuration for VM instances. Unhealthy instances are
        # removed from traffic rotation.
        # Corresponds to the JSON property `readinessCheck`
        # @return [Google::Apis::AppengineV1beta::ReadinessCheck]
        attr_accessor :readiness_check
      
        # Machine resources for a version.
        # Corresponds to the JSON property `resources`
        # @return [Google::Apis::AppengineV1beta::Resources]
        attr_accessor :resources
      
        # Desired runtime. Example: python27.
        # Corresponds to the JSON property `runtime`
        # @return [String]
        attr_accessor :runtime
      
        # The version of the API in the given runtime environment. Please see the app.
        # yaml reference for valid values at https://cloud.google.com/appengine/docs/
        # standard/<language>/config/appref
        # Corresponds to the JSON property `runtimeApiVersion`
        # @return [String]
        attr_accessor :runtime_api_version
      
        # The channel of the runtime to use. Only available for some runtimes. Defaults
        # to the default channel.
        # Corresponds to the JSON property `runtimeChannel`
        # @return [String]
        attr_accessor :runtime_channel
      
        # The path or name of the app's main executable.
        # Corresponds to the JSON property `runtimeMainExecutablePath`
        # @return [String]
        attr_accessor :runtime_main_executable_path
      
        # Current serving status of this version. Only the versions with a SERVING
        # status create instances and can be billed.SERVING_STATUS_UNSPECIFIED is an
        # invalid value. Defaults to SERVING.
        # Corresponds to the JSON property `servingStatus`
        # @return [String]
        attr_accessor :serving_status
      
        # Whether multiple requests can be dispatched to this version at once.
        # Corresponds to the JSON property `threadsafe`
        # @return [Boolean]
        attr_accessor :threadsafe
        alias_method :threadsafe?, :threadsafe
      
        # Serving URL for this version. Example: "https://myversion-dot-myservice-dot-
        # myapp.appspot.com"@OutputOnly
        # Corresponds to the JSON property `versionUrl`
        # @return [String]
        attr_accessor :version_url
      
        # Whether to deploy this version in a container on a virtual machine.
        # Corresponds to the JSON property `vm`
        # @return [Boolean]
        attr_accessor :vm
        alias_method :vm?, :vm
      
        # VPC access connector specification.
        # Corresponds to the JSON property `vpcAccessConnector`
        # @return [Google::Apis::AppengineV1beta::VpcAccessConnector]
        attr_accessor :vpc_access_connector
      
        # The Google Compute Engine zones that are supported by this version in the App
        # Engine flexible environment. Deprecated.
        # Corresponds to the JSON property `zones`
        # @return [Array<String>]
        attr_accessor :zones
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @api_config = args[:api_config] if args.key?(:api_config)
          @automatic_scaling = args[:automatic_scaling] if args.key?(:automatic_scaling)
          @basic_scaling = args[:basic_scaling] if args.key?(:basic_scaling)
          @beta_settings = args[:beta_settings] if args.key?(:beta_settings)
          @create_time = args[:create_time] if args.key?(:create_time)
          @created_by = args[:created_by] if args.key?(:created_by)
          @default_expiration = args[:default_expiration] if args.key?(:default_expiration)
          @deployment = args[:deployment] if args.key?(:deployment)
          @disk_usage_bytes = args[:disk_usage_bytes] if args.key?(:disk_usage_bytes)
          @endpoints_api_service = args[:endpoints_api_service] if args.key?(:endpoints_api_service)
          @entrypoint = args[:entrypoint] if args.key?(:entrypoint)
          @env = args[:env] if args.key?(:env)
          @env_variables = args[:env_variables] if args.key?(:env_variables)
          @error_handlers = args[:error_handlers] if args.key?(:error_handlers)
          @handlers = args[:handlers] if args.key?(:handlers)
          @health_check = args[:health_check] if args.key?(:health_check)
          @id = args[:id] if args.key?(:id)
          @inbound_services = args[:inbound_services] if args.key?(:inbound_services)
          @instance_class = args[:instance_class] if args.key?(:instance_class)
          @libraries = args[:libraries] if args.key?(:libraries)
          @liveness_check = args[:liveness_check] if args.key?(:liveness_check)
          @manual_scaling = args[:manual_scaling] if args.key?(:manual_scaling)
          @name = args[:name] if args.key?(:name)
          @network = args[:network] if args.key?(:network)
          @nobuild_files_regex = args[:nobuild_files_regex] if args.key?(:nobuild_files_regex)
          @readiness_check = args[:readiness_check] if args.key?(:readiness_check)
          @resources = args[:resources] if args.key?(:resources)
          @runtime = args[:runtime] if args.key?(:runtime)
          @runtime_api_version = args[:runtime_api_version] if args.key?(:runtime_api_version)
          @runtime_channel = args[:runtime_channel] if args.key?(:runtime_channel)
          @runtime_main_executable_path = args[:runtime_main_executable_path] if args.key?(:runtime_main_executable_path)
          @serving_status = args[:serving_status] if args.key?(:serving_status)
          @threadsafe = args[:threadsafe] if args.key?(:threadsafe)
          @version_url = args[:version_url] if args.key?(:version_url)
          @vm = args[:vm] if args.key?(:vm)
          @vpc_access_connector = args[:vpc_access_connector] if args.key?(:vpc_access_connector)
          @zones = args[:zones] if args.key?(:zones)
        end
      end
      
      # Volumes mounted within the app container. Only applicable in the App Engine
      # flexible environment.
      class Volume
        include Google::Apis::Core::Hashable
      
        # Unique name for the volume.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Volume size in gigabytes.
        # Corresponds to the JSON property `sizeGb`
        # @return [Float]
        attr_accessor :size_gb
      
        # Underlying volume type, e.g. 'tmpfs'.
        # Corresponds to the JSON property `volumeType`
        # @return [String]
        attr_accessor :volume_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @size_gb = args[:size_gb] if args.key?(:size_gb)
          @volume_type = args[:volume_type] if args.key?(:volume_type)
        end
      end
      
      # VPC access connector specification.
      class VpcAccessConnector
        include Google::Apis::Core::Hashable
      
        # Full Serverless VPC Access Connector name e.g. /projects/my-project/locations/
        # us-central1/connectors/c1.
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
      
      # The zip file information for a zip deployment.
      class ZipInfo
        include Google::Apis::Core::Hashable
      
        # An estimate of the number of files in a zip for a zip deployment. If set, must
        # be greater than or equal to the actual number of files. Used for optimizing
        # performance; if not provided, deployment may be slow.
        # Corresponds to the JSON property `filesCount`
        # @return [Fixnum]
        attr_accessor :files_count
      
        # URL of the zip file to deploy from. Must be a URL to a resource in Google
        # Cloud Storage in the form 'http(s)://storage.googleapis.com/<bucket>/<object>'.
        # Corresponds to the JSON property `sourceUrl`
        # @return [String]
        attr_accessor :source_url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @files_count = args[:files_count] if args.key?(:files_count)
          @source_url = args[:source_url] if args.key?(:source_url)
        end
      end
    end
  end
end
