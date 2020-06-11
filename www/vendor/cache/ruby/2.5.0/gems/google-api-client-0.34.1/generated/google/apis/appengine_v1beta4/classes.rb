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
    module AppengineV1beta4
      
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
      
        # Hostname used to reach the application, as resolved by App Engine.@OutputOnly
        # Corresponds to the JSON property `defaultHostname`
        # @return [String]
        attr_accessor :default_hostname
      
        # HTTP path dispatch rules for requests to the application that do not
        # explicitly target a module or version. Rules are order-dependent.@OutputOnly
        # Corresponds to the JSON property `dispatchRules`
        # @return [Array<Google::Apis::AppengineV1beta4::UrlDispatchRule>]
        attr_accessor :dispatch_rules
      
        # Identity-Aware Proxy
        # Corresponds to the JSON property `iap`
        # @return [Google::Apis::AppengineV1beta4::IdentityAwareProxy]
        attr_accessor :iap
      
        # Identifier of the Application resource. This identifier is equivalent to the
        # project ID of the Google Cloud Platform project where you want to deploy your
        # application. Example: myapp.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Location from which this application will be run. Application instances will
        # run out of data centers in the chosen location, which is also where all of the
        # application's end user content is stored.Defaults to us-central.Options are:us-
        # central - Central USeurope-west - Western Europeus-east1 - Eastern US
        # Corresponds to the JSON property `location`
        # @return [String]
        attr_accessor :location
      
        # Full path to the Application resource in the API. Example: apps/myapp.@
        # OutputOnly
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
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
          @iap = args[:iap] if args.key?(:iap)
          @id = args[:id] if args.key?(:id)
          @location = args[:location] if args.key?(:location)
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
        # @return [Google::Apis::AppengineV1beta4::CpuUtilization]
        attr_accessor :cpu_utilization
      
        # Target scaling by disk usage. Only applicable for VM runtimes.
        # Corresponds to the JSON property `diskUtilization`
        # @return [Google::Apis::AppengineV1beta4::DiskUtilization]
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
      
        # Maximum number of instances that should be started to handle requests.
        # Corresponds to the JSON property `maxTotalInstances`
        # @return [Fixnum]
        attr_accessor :max_total_instances
      
        # Minimum number of idle instances that should be maintained for this version.
        # Only applicable for the default version of a module.
        # Corresponds to the JSON property `minIdleInstances`
        # @return [Fixnum]
        attr_accessor :min_idle_instances
      
        # Minimum amount of time a request should wait in the pending queue before
        # starting a new instance to handle it.
        # Corresponds to the JSON property `minPendingLatency`
        # @return [String]
        attr_accessor :min_pending_latency
      
        # Minimum number of instances that should be maintained for this version.
        # Corresponds to the JSON property `minTotalInstances`
        # @return [Fixnum]
        attr_accessor :min_total_instances
      
        # Target scaling by network usage. Only applicable for VM runtimes.
        # Corresponds to the JSON property `networkUtilization`
        # @return [Google::Apis::AppengineV1beta4::NetworkUtilization]
        attr_accessor :network_utilization
      
        # Target scaling by request utilization. Only applicable for VM runtimes.
        # Corresponds to the JSON property `requestUtilization`
        # @return [Google::Apis::AppengineV1beta4::RequestUtilization]
        attr_accessor :request_utilization
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cool_down_period = args[:cool_down_period] if args.key?(:cool_down_period)
          @cpu_utilization = args[:cpu_utilization] if args.key?(:cpu_utilization)
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
        end
      end
      
      # A module with basic scaling will create an instance when the application
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
      
        # Docker image that is used to create a container and start a VM instance for
        # the version that you deploy. Only applicable for instances running in the App
        # Engine flexible environment.
        # Corresponds to the JSON property `container`
        # @return [Google::Apis::AppengineV1beta4::ContainerInfo]
        attr_accessor :container
      
        # Manifest of the files stored in Google Cloud Storage that are included as part
        # of this version. All files must be readable using the credentials supplied
        # with this call.
        # Corresponds to the JSON property `files`
        # @return [Hash<String,Google::Apis::AppengineV1beta4::FileInfo>]
        attr_accessor :files
      
        # Origin of the source code for this deployment. There can be more than one
        # source reference per version if source code is distributed among multiple
        # repositories.
        # Corresponds to the JSON property `sourceReferences`
        # @return [Array<Google::Apis::AppengineV1beta4::SourceReference>]
        attr_accessor :source_references
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @container = args[:container] if args.key?(:container)
          @files = args[:files] if args.key?(:files)
          @source_references = args[:source_references] if args.key?(:source_references)
        end
      end
      
      # Target scaling by disk usage. Only applicable for VM runtimes.
      class DiskUtilization
        include Google::Apis::Core::Hashable
      
        # Target bytes read per second.
        # Corresponds to the JSON property `targetReadBytesPerSec`
        # @return [Fixnum]
        attr_accessor :target_read_bytes_per_sec
      
        # Target ops read per second.
        # Corresponds to the JSON property `targetReadOpsPerSec`
        # @return [Fixnum]
        attr_accessor :target_read_ops_per_sec
      
        # Target bytes written per second.
        # Corresponds to the JSON property `targetWriteBytesPerSec`
        # @return [Fixnum]
        attr_accessor :target_write_bytes_per_sec
      
        # Target ops written per second.
        # Corresponds to the JSON property `targetWriteOpsPerSec`
        # @return [Fixnum]
        attr_accessor :target_write_ops_per_sec
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @target_read_bytes_per_sec = args[:target_read_bytes_per_sec] if args.key?(:target_read_bytes_per_sec)
          @target_read_ops_per_sec = args[:target_read_ops_per_sec] if args.key?(:target_read_ops_per_sec)
          @target_write_bytes_per_sec = args[:target_write_bytes_per_sec] if args.key?(:target_write_bytes_per_sec)
          @target_write_ops_per_sec = args[:target_write_ops_per_sec] if args.key?(:target_write_ops_per_sec)
        end
      end
      
      # Cloud Endpoints (https://cloud.google.com/endpoints) configuration. The
      # Endpoints API Service provides tooling for serving Open API and gRPC endpoints
      # via an NGINX proxy. Only valid for App Engine Flexible environment deployments.
      # .The fields here refer to the name and configuration id of a "service"
      # resource in the Service Management API (https://cloud.google.com/service-
      # management/overview).
      class EndpointsApiService
        include Google::Apis::Core::Hashable
      
        # Endpoints service configuration id as specified by the Service Management API.
        # For example "2016-09-19r1"By default, the Endpoints service configuration id
        # is fixed and config_id must be specified. To keep the Endpoints service
        # configuration id updated with each rollout, specify RolloutStrategy.MANAGED
        # and omit config_id.
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
      
        # For security reasons, this value cannot be retrieved via the API. Instead, the
        # SHA-256 hash of the value is returned in the oauth2_client_secret_sha256 field.
        # @InputOnly
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
      
        # Full path to the Instance resource in the API. Example: apps/myapp/modules/
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
        # Corresponds to the JSON property `startTimestamp`
        # @return [String]
        attr_accessor :start_timestamp
      
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
      
        # Whether this instance is in debug mode. Only applicable for instances in App
        # Engine flexible environment.@OutputOnly
        # Corresponds to the JSON property `vmUnlocked`
        # @return [Boolean]
        attr_accessor :vm_unlocked
        alias_method :vm_unlocked?, :vm_unlocked
      
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
          @start_timestamp = args[:start_timestamp] if args.key?(:start_timestamp)
          @vm_id = args[:vm_id] if args.key?(:vm_id)
          @vm_ip = args[:vm_ip] if args.key?(:vm_ip)
          @vm_name = args[:vm_name] if args.key?(:vm_name)
          @vm_status = args[:vm_status] if args.key?(:vm_status)
          @vm_unlocked = args[:vm_unlocked] if args.key?(:vm_unlocked)
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
      
      # Response message for Instances.ListInstances.
      class ListInstancesResponse
        include Google::Apis::Core::Hashable
      
        # The instances belonging to the requested version.
        # Corresponds to the JSON property `instances`
        # @return [Array<Google::Apis::AppengineV1beta4::Instance>]
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
        # @return [Array<Google::Apis::AppengineV1beta4::Location>]
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
      
      # Response message for Modules.ListModules.
      class ListModulesResponse
        include Google::Apis::Core::Hashable
      
        # The modules belonging to the requested application.
        # Corresponds to the JSON property `modules`
        # @return [Array<Google::Apis::AppengineV1beta4::Module>]
        attr_accessor :modules
      
        # Continuation token for fetching the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @modules = args[:modules] if args.key?(:modules)
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
        # @return [Array<Google::Apis::AppengineV1beta4::Operation>]
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
      
      # Response message for Versions.ListVersions.
      class ListVersionsResponse
        include Google::Apis::Core::Hashable
      
        # Continuation token for fetching the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The versions belonging to the requested module.
        # Corresponds to the JSON property `versions`
        # @return [Array<Google::Apis::AppengineV1beta4::Version>]
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
      
      # A module with manual scaling runs continuously, allowing you to perform
      # complex initialization and rely on the state of its memory over time.
      class ManualScaling
        include Google::Apis::Core::Hashable
      
        # Number of instances to assign to the module at the start. This number can
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
      
      # A Module resource is a logical component of an application that can share
      # state and communicate in a secure fashion with other modules. For example, an
      # application that handles customer requests might include separate modules to
      # handle tasks such as backend data analysis or API requests from mobile devices.
      # Each module has a collection of versions that define a specific set of code
      # used to implement the functionality of that module.
      class Module
        include Google::Apis::Core::Hashable
      
        # Relative name of the module within the application. Example: default.@
        # OutputOnly
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Full path to the Module resource in the API. Example: apps/myapp/modules/
        # default.@OutputOnly
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Traffic routing configuration for versions within a single module. Traffic
        # splits define how traffic directed to the module is assigned to versions.
        # Corresponds to the JSON property `split`
        # @return [Google::Apis::AppengineV1beta4::TrafficSplit]
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
      
      # Extra network settings. Only applicable for VM runtimes.
      class Network
        include Google::Apis::Core::Hashable
      
        # List of ports, or port pairs, to forward from the virtual machine to the
        # application container.
        # Corresponds to the JSON property `forwardedPorts`
        # @return [Array<String>]
        attr_accessor :forwarded_ports
      
        # Tag to apply to the VM instance during creation.
        # Corresponds to the JSON property `instanceTag`
        # @return [String]
        attr_accessor :instance_tag
      
        # Google Cloud Platform network where the virtual machines are created. Specify
        # the short name, not the resource path.Defaults to default.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @forwarded_ports = args[:forwarded_ports] if args.key?(:forwarded_ports)
          @instance_tag = args[:instance_tag] if args.key?(:instance_tag)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Target scaling by network usage. Only applicable for VM runtimes.
      class NetworkUtilization
        include Google::Apis::Core::Hashable
      
        # Target bytes received per second.
        # Corresponds to the JSON property `targetReceivedBytesPerSec`
        # @return [Fixnum]
        attr_accessor :target_received_bytes_per_sec
      
        # Target packets received per second.
        # Corresponds to the JSON property `targetReceivedPacketsPerSec`
        # @return [Fixnum]
        attr_accessor :target_received_packets_per_sec
      
        # Target bytes sent per second.
        # Corresponds to the JSON property `targetSentBytesPerSec`
        # @return [Fixnum]
        attr_accessor :target_sent_bytes_per_sec
      
        # Target packets sent per second.
        # Corresponds to the JSON property `targetSentPacketsPerSec`
        # @return [Fixnum]
        attr_accessor :target_sent_packets_per_sec
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @target_received_bytes_per_sec = args[:target_received_bytes_per_sec] if args.key?(:target_received_bytes_per_sec)
          @target_received_packets_per_sec = args[:target_received_packets_per_sec] if args.key?(:target_received_packets_per_sec)
          @target_sent_bytes_per_sec = args[:target_sent_bytes_per_sec] if args.key?(:target_sent_bytes_per_sec)
          @target_sent_packets_per_sec = args[:target_sent_packets_per_sec] if args.key?(:target_sent_packets_per_sec)
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
        # (https://github.com/grpc). The error model is designed to be:
        # Simple to use and understand for most users
        # Flexible enough to meet unexpected needsOverviewThe Status message contains
        # three pieces of data: error code, error message, and error details. The error
        # code should be an enum value of google.rpc.Code, but it may accept additional
        # error codes if needed. The error message should be a developer-facing English
        # message that helps developers understand and resolve the error. If a localized
        # user-facing error message is needed, put the localized message in the error
        # details or localize it in the client. The optional error details may contain
        # arbitrary information about the error. There is a predefined set of error
        # detail types in the package google.rpc that can be used for common error
        # conditions.Language mappingThe Status message is the logical representation of
        # the error model, but it is not necessarily the actual wire format. When the
        # Status message is exposed in different client libraries and different wire
        # protocols, it can be mapped differently. For example, it will likely be mapped
        # to some exceptions in Java, but more likely mapped to some error codes in C.
        # Other usesThe error model and the Status message can be used in a variety of
        # environments, either with or without APIs, to provide a consistent developer
        # experience across different environments.Example uses of this error model
        # include:
        # Partial errors. If a service needs to return partial errors to the client, it
        # may embed the Status in the normal response to indicate the partial errors.
        # Workflow errors. A typical workflow has multiple steps. Each step may have a
        # Status message for error reporting.
        # Batch operations. If a client uses batch request and batch response, the
        # Status message should be used directly inside batch response, one for each
        # error sub-response.
        # Asynchronous operations. If an API call embeds asynchronous operation results
        # in its response, the status of those operations should be represented directly
        # using the Status message.
        # Logging. If some API errors are stored in logs, the message Status could be
        # used directly after any stripping needed for security/privacy reasons.
        # Corresponds to the JSON property `error`
        # @return [Google::Apis::AppengineV1beta4::Status]
        attr_accessor :error
      
        # Service-specific metadata associated with the operation. It typically contains
        # progress information and common metadata such as create time. Some services
        # might not provide such metadata. Any method that returns a long-running
        # operation should document the metadata type, if any.
        # Corresponds to the JSON property `metadata`
        # @return [Hash<String,Object>]
        attr_accessor :metadata
      
        # The server-assigned name, which is only unique within the same service that
        # originally returns it. If you use the default HTTP mapping, the name should
        # have the format of operations/some/unique/name.
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
      class OperationMetadata
        include Google::Apis::Core::Hashable
      
        # Timestamp that this operation completed.@OutputOnly
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # Timestamp that this operation was created.@OutputOnly
        # Corresponds to the JSON property `insertTime`
        # @return [String]
        attr_accessor :insert_time
      
        # API method that initiated this operation. Example: google.appengine.v1beta4.
        # Version.CreateVersion.@OutputOnly
        # Corresponds to the JSON property `method`
        # @return [String]
        attr_accessor :method_prop
      
        # Type of this operation. Deprecated, use method field instead. Example: "
        # create_version".@OutputOnly
        # Corresponds to the JSON property `operationType`
        # @return [String]
        attr_accessor :operation_type
      
        # Name of the resource that this operation is acting on. Example: apps/myapp/
        # modules/default.@OutputOnly
        # Corresponds to the JSON property `target`
        # @return [String]
        attr_accessor :target
      
        # User who requested this operation.@OutputOnly
        # Corresponds to the JSON property `user`
        # @return [String]
        attr_accessor :user
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_time = args[:end_time] if args.key?(:end_time)
          @insert_time = args[:insert_time] if args.key?(:insert_time)
          @method_prop = args[:method_prop] if args.key?(:method_prop)
          @operation_type = args[:operation_type] if args.key?(:operation_type)
          @target = args[:target] if args.key?(:target)
          @user = args[:user] if args.key?(:user)
        end
      end
      
      # Metadata for the given google.longrunning.Operation.
      class OperationMetadataV1
        include Google::Apis::Core::Hashable
      
        # Metadata for the given google.longrunning.Operation during a google.appengine.
        # v1.CreateVersionRequest.
        # Corresponds to the JSON property `createVersionMetadata`
        # @return [Google::Apis::AppengineV1beta4::CreateVersionMetadataV1]
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
        # @return [Google::Apis::AppengineV1beta4::CreateVersionMetadataV1Alpha]
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
        # @return [Google::Apis::AppengineV1beta4::CreateVersionMetadataV1Beta]
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
      
      # Metadata for the given google.longrunning.Operation.
      class OperationMetadataV1Beta5
        include Google::Apis::Core::Hashable
      
        # Timestamp that this operation completed.@OutputOnly
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # Timestamp that this operation was created.@OutputOnly
        # Corresponds to the JSON property `insertTime`
        # @return [String]
        attr_accessor :insert_time
      
        # API method name that initiated this operation. Example: google.appengine.
        # v1beta5.Version.CreateVersion.@OutputOnly
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
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_time = args[:end_time] if args.key?(:end_time)
          @insert_time = args[:insert_time] if args.key?(:insert_time)
          @method_prop = args[:method_prop] if args.key?(:method_prop)
          @target = args[:target] if args.key?(:target)
          @user = args[:user] if args.key?(:user)
        end
      end
      
      # Target scaling by request utilization. Only applicable for VM runtimes.
      class RequestUtilization
        include Google::Apis::Core::Hashable
      
        # Target number of concurrent requests.
        # Corresponds to the JSON property `targetConcurrentRequests`
        # @return [Fixnum]
        attr_accessor :target_concurrent_requests
      
        # Target requests per second.
        # Corresponds to the JSON property `targetRequestCountPerSec`
        # @return [Fixnum]
        attr_accessor :target_request_count_per_sec
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @target_concurrent_requests = args[:target_concurrent_requests] if args.key?(:target_concurrent_requests)
          @target_request_count_per_sec = args[:target_request_count_per_sec] if args.key?(:target_request_count_per_sec)
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
        # @return [Array<Google::Apis::AppengineV1beta4::Volume>]
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
      
      # Reference to a particular snapshot of the source tree used to build and deploy
      # the application.
      class SourceReference
        include Google::Apis::Core::Hashable
      
        # URI string identifying the repository. Example: "https://source.developers.
        # google.com/p/app-123/r/default"
        # Corresponds to the JSON property `repository`
        # @return [String]
        attr_accessor :repository
      
        # The canonical, persistent identifier of the deployed revision. Aliases that
        # include tags or branch names are not allowed. Example (git): "
        # 2198322f89e0bb2e25021667c2ed489d1fd34e6b"
        # Corresponds to the JSON property `revisionId`
        # @return [String]
        attr_accessor :revision_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @repository = args[:repository] if args.key?(:repository)
          @revision_id = args[:revision_id] if args.key?(:revision_id)
        end
      end
      
      # Files served directly to the user for a given URL, such as images, CSS
      # stylesheets, or JavaScript source files. Static directory handlers make it
      # easy to serve the entire contents of a directory as static files.
      class StaticDirectoryHandler
        include Google::Apis::Core::Hashable
      
        # Whether files should also be uploaded as code data. By default, files declared
        # in static directory handlers are uploaded as static data and are only served
        # to end users; they cannot be read by the application. If enabled, uploads are
        # charged against both your code and static data storage resource quotas.
        # Corresponds to the JSON property `applicationReadable`
        # @return [Boolean]
        attr_accessor :application_readable
        alias_method :application_readable?, :application_readable
      
        # Path to the directory containing the static files from the application root
        # directory. Everything after the end of the matched URL pattern is appended to
        # static_dir to form the full path to the requested file.
        # Corresponds to the JSON property `directory`
        # @return [String]
        attr_accessor :directory
      
        # Time a static file served by this handler should be cached.
        # Corresponds to the JSON property `expiration`
        # @return [String]
        attr_accessor :expiration
      
        # HTTP headers to use for all responses from these URLs.
        # Corresponds to the JSON property `httpHeaders`
        # @return [Hash<String,String>]
        attr_accessor :http_headers
      
        # MIME type used to serve all files served by this handler. Defaults to file-
        # specific MIME types, which are direved from each file's filename extension.
        # Corresponds to the JSON property `mimeType`
        # @return [String]
        attr_accessor :mime_type
      
        # Whether this handler should match the request if the file referenced by the
        # handler does not exist.
        # Corresponds to the JSON property `requireMatchingFile`
        # @return [Boolean]
        attr_accessor :require_matching_file
        alias_method :require_matching_file?, :require_matching_file
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @application_readable = args[:application_readable] if args.key?(:application_readable)
          @directory = args[:directory] if args.key?(:directory)
          @expiration = args[:expiration] if args.key?(:expiration)
          @http_headers = args[:http_headers] if args.key?(:http_headers)
          @mime_type = args[:mime_type] if args.key?(:mime_type)
          @require_matching_file = args[:require_matching_file] if args.key?(:require_matching_file)
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
      
        # Time a static file served by this handler should be cached.
        # Corresponds to the JSON property `expiration`
        # @return [String]
        attr_accessor :expiration
      
        # HTTP headers to use for all responses from these URLs.
        # Corresponds to the JSON property `httpHeaders`
        # @return [Hash<String,String>]
        attr_accessor :http_headers
      
        # MIME type used to serve all files served by this handler. Defaults to file-
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
      # (https://github.com/grpc). The error model is designed to be:
      # Simple to use and understand for most users
      # Flexible enough to meet unexpected needsOverviewThe Status message contains
      # three pieces of data: error code, error message, and error details. The error
      # code should be an enum value of google.rpc.Code, but it may accept additional
      # error codes if needed. The error message should be a developer-facing English
      # message that helps developers understand and resolve the error. If a localized
      # user-facing error message is needed, put the localized message in the error
      # details or localize it in the client. The optional error details may contain
      # arbitrary information about the error. There is a predefined set of error
      # detail types in the package google.rpc that can be used for common error
      # conditions.Language mappingThe Status message is the logical representation of
      # the error model, but it is not necessarily the actual wire format. When the
      # Status message is exposed in different client libraries and different wire
      # protocols, it can be mapped differently. For example, it will likely be mapped
      # to some exceptions in Java, but more likely mapped to some error codes in C.
      # Other usesThe error model and the Status message can be used in a variety of
      # environments, either with or without APIs, to provide a consistent developer
      # experience across different environments.Example uses of this error model
      # include:
      # Partial errors. If a service needs to return partial errors to the client, it
      # may embed the Status in the normal response to indicate the partial errors.
      # Workflow errors. A typical workflow has multiple steps. Each step may have a
      # Status message for error reporting.
      # Batch operations. If a client uses batch request and batch response, the
      # Status message should be used directly inside batch response, one for each
      # error sub-response.
      # Asynchronous operations. If an API call embeds asynchronous operation results
      # in its response, the status of those operations should be represented directly
      # using the Status message.
      # Logging. If some API errors are stored in logs, the message Status could be
      # used directly after any stripping needed for security/privacy reasons.
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
      
      # Traffic routing configuration for versions within a single module. Traffic
      # splits define how traffic directed to the module is assigned to versions.
      class TrafficSplit
        include Google::Apis::Core::Hashable
      
        # Mapping from version IDs within the module to fractional (0.000, 1]
        # allocations of traffic for that version. Each version can be specified only
        # once, but some versions in the module may not have any traffic allocation.
        # Modules that have traffic allocated cannot be deleted until either the module
        # is deleted or their traffic allocation is removed. Allocations must sum to 1.
        # Up to two decimal place precision is supported for IP-based splits and up to
        # three decimal places is supported for cookie-based splits.
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
      
      # Rules to match an HTTP request and dispatch that request to a module.
      class UrlDispatchRule
        include Google::Apis::Core::Hashable
      
        # Domain name to match against. The wildcard "*" is supported if specified
        # before a period: "*.".Defaults to matching all domains: "*".
        # Corresponds to the JSON property `domain`
        # @return [String]
        attr_accessor :domain
      
        # Resource ID of a module in this application that should serve the matched
        # request. The module must already exist. Example: default.
        # Corresponds to the JSON property `module`
        # @return [String]
        attr_accessor :module
      
        # Pathname within the host. Must start with a "/". A single "*" can be included
        # at the end of the path. The sum of the lengths of the domain and path may not
        # exceed 100 characters.
        # Corresponds to the JSON property `path`
        # @return [String]
        attr_accessor :path
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @domain = args[:domain] if args.key?(:domain)
          @module = args[:module] if args.key?(:module)
          @path = args[:path] if args.key?(:path)
        end
      end
      
      # URL pattern and description of how the URL should be handled. App Engine can
      # handle URLs by executing application code, or by serving static files uploaded
      # with the version, such as images, CSS, or JavaScript.
      class UrlMap
        include Google::Apis::Core::Hashable
      
        # Uses Google Cloud Endpoints to handle requests.
        # Corresponds to the JSON property `apiEndpoint`
        # @return [Google::Apis::AppengineV1beta4::ApiEndpointHandler]
        attr_accessor :api_endpoint
      
        # Action to take when users access resources that require authentication.
        # Defaults to redirect.
        # Corresponds to the JSON property `authFailAction`
        # @return [String]
        attr_accessor :auth_fail_action
      
        # Level of login required to access this resource.
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
        # @return [Google::Apis::AppengineV1beta4::ScriptHandler]
        attr_accessor :script
      
        # Security (HTTPS) enforcement for this URL.
        # Corresponds to the JSON property `securityLevel`
        # @return [String]
        attr_accessor :security_level
      
        # Files served directly to the user for a given URL, such as images, CSS
        # stylesheets, or JavaScript source files. Static directory handlers make it
        # easy to serve the entire contents of a directory as static files.
        # Corresponds to the JSON property `staticDirectory`
        # @return [Google::Apis::AppengineV1beta4::StaticDirectoryHandler]
        attr_accessor :static_directory
      
        # Files served directly to the user for a given URL, such as images, CSS
        # stylesheets, or JavaScript source files. Static file handlers describe which
        # files in the application directory are static files, and which URLs serve them.
        # Corresponds to the JSON property `staticFiles`
        # @return [Google::Apis::AppengineV1beta4::StaticFilesHandler]
        attr_accessor :static_files
      
        # A URL prefix. Uses regular expression syntax, which means regexp special
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
          @static_directory = args[:static_directory] if args.key?(:static_directory)
          @static_files = args[:static_files] if args.key?(:static_files)
          @url_regex = args[:url_regex] if args.key?(:url_regex)
        end
      end
      
      # A Version resource is a specific set of source code and configuration files
      # that are deployed into a module.
      class Version
        include Google::Apis::Core::Hashable
      
        # Google Cloud Endpoints (https://cloud.google.com/appengine/docs/python/
        # endpoints/) configuration for API handlers.
        # Corresponds to the JSON property `apiConfig`
        # @return [Google::Apis::AppengineV1beta4::ApiConfigHandler]
        attr_accessor :api_config
      
        # Automatic scaling is based on request rate, response latencies, and other
        # application metrics.
        # Corresponds to the JSON property `automaticScaling`
        # @return [Google::Apis::AppengineV1beta4::AutomaticScaling]
        attr_accessor :automatic_scaling
      
        # A module with basic scaling will create an instance when the application
        # receives a request. The instance will be turned down when the app becomes idle.
        # Basic scaling is ideal for work that is intermittent or driven by user
        # activity.
        # Corresponds to the JSON property `basicScaling`
        # @return [Google::Apis::AppengineV1beta4::BasicScaling]
        attr_accessor :basic_scaling
      
        # Metadata settings that are supplied to this version to enable beta runtime
        # features.
        # Corresponds to the JSON property `betaSettings`
        # @return [Hash<String,String>]
        attr_accessor :beta_settings
      
        # Time that this version was created.@OutputOnly
        # Corresponds to the JSON property `creationTime`
        # @return [String]
        attr_accessor :creation_time
      
        # Duration that static files should be cached by web proxies and browsers. Only
        # applicable if the corresponding StaticFilesHandler (https://cloud.google.com/
        # appengine/docs/admin-api/reference/rest/v1/apps.services.versions#
        # staticfileshandler) does not specify its own expiration time.Only returned in
        # GET requests if view=FULL is set.
        # Corresponds to the JSON property `defaultExpiration`
        # @return [String]
        attr_accessor :default_expiration
      
        # Email address of the user who created this version.@OutputOnly
        # Corresponds to the JSON property `deployer`
        # @return [String]
        attr_accessor :deployer
      
        # Code and application artifacts used to deploy a version to App Engine.
        # Corresponds to the JSON property `deployment`
        # @return [Google::Apis::AppengineV1beta4::Deployment]
        attr_accessor :deployment
      
        # Cloud Endpoints (https://cloud.google.com/endpoints) configuration. The
        # Endpoints API Service provides tooling for serving Open API and gRPC endpoints
        # via an NGINX proxy. Only valid for App Engine Flexible environment deployments.
        # .The fields here refer to the name and configuration id of a "service"
        # resource in the Service Management API (https://cloud.google.com/service-
        # management/overview).
        # Corresponds to the JSON property `endpointsApiService`
        # @return [Google::Apis::AppengineV1beta4::EndpointsApiService]
        attr_accessor :endpoints_api_service
      
        # App Engine execution environment to use for this version.Defaults to 1.
        # Corresponds to the JSON property `env`
        # @return [String]
        attr_accessor :env
      
        # Environment variables made available to the application.Only returned in GET
        # requests if view=FULL is set.
        # Corresponds to the JSON property `envVariables`
        # @return [Hash<String,String>]
        attr_accessor :env_variables
      
        # Custom static error pages. Limited to 10KB per page.Only returned in GET
        # requests if view=FULL is set.
        # Corresponds to the JSON property `errorHandlers`
        # @return [Array<Google::Apis::AppengineV1beta4::ErrorHandler>]
        attr_accessor :error_handlers
      
        # An ordered list of URL-matching patterns that should be applied to incoming
        # requests. The first matching URL handles the request and other request
        # handlers are not attempted.Only returned in GET requests if view=FULL is set.
        # Corresponds to the JSON property `handlers`
        # @return [Array<Google::Apis::AppengineV1beta4::UrlMap>]
        attr_accessor :handlers
      
        # Health checking configuration for VM instances. Unhealthy instances are killed
        # and replaced with new instances. Only applicable for instances in App Engine
        # flexible environment.
        # Corresponds to the JSON property `healthCheck`
        # @return [Google::Apis::AppengineV1beta4::HealthCheck]
        attr_accessor :health_check
      
        # Relative name of the version within the module. Example: v1. Version names can
        # contain only lowercase letters, numbers, or hyphens. Reserved names: "default",
        # "latest", and any name with the prefix "ah-".
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
      
        # Configuration for third-party Python runtime libraries required by the
        # application.Only returned in GET requests if view=FULL is set.
        # Corresponds to the JSON property `libraries`
        # @return [Array<Google::Apis::AppengineV1beta4::Library>]
        attr_accessor :libraries
      
        # A module with manual scaling runs continuously, allowing you to perform
        # complex initialization and rely on the state of its memory over time.
        # Corresponds to the JSON property `manualScaling`
        # @return [Google::Apis::AppengineV1beta4::ManualScaling]
        attr_accessor :manual_scaling
      
        # Full path to the Version resource in the API. Example: apps/myapp/modules/
        # default/versions/v1.@OutputOnly
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Extra network settings. Only applicable for VM runtimes.
        # Corresponds to the JSON property `network`
        # @return [Google::Apis::AppengineV1beta4::Network]
        attr_accessor :network
      
        # Files that match this pattern will not be built into this version. Only
        # applicable for Go runtimes.Only returned in GET requests if view=FULL is set.
        # Corresponds to the JSON property `nobuildFilesRegex`
        # @return [String]
        attr_accessor :nobuild_files_regex
      
        # Machine resources for a version.
        # Corresponds to the JSON property `resources`
        # @return [Google::Apis::AppengineV1beta4::Resources]
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
      
        # Whether to deploy this version in a container on a virtual machine.
        # Corresponds to the JSON property `vm`
        # @return [Boolean]
        attr_accessor :vm
        alias_method :vm?, :vm
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @api_config = args[:api_config] if args.key?(:api_config)
          @automatic_scaling = args[:automatic_scaling] if args.key?(:automatic_scaling)
          @basic_scaling = args[:basic_scaling] if args.key?(:basic_scaling)
          @beta_settings = args[:beta_settings] if args.key?(:beta_settings)
          @creation_time = args[:creation_time] if args.key?(:creation_time)
          @default_expiration = args[:default_expiration] if args.key?(:default_expiration)
          @deployer = args[:deployer] if args.key?(:deployer)
          @deployment = args[:deployment] if args.key?(:deployment)
          @endpoints_api_service = args[:endpoints_api_service] if args.key?(:endpoints_api_service)
          @env = args[:env] if args.key?(:env)
          @env_variables = args[:env_variables] if args.key?(:env_variables)
          @error_handlers = args[:error_handlers] if args.key?(:error_handlers)
          @handlers = args[:handlers] if args.key?(:handlers)
          @health_check = args[:health_check] if args.key?(:health_check)
          @id = args[:id] if args.key?(:id)
          @inbound_services = args[:inbound_services] if args.key?(:inbound_services)
          @instance_class = args[:instance_class] if args.key?(:instance_class)
          @libraries = args[:libraries] if args.key?(:libraries)
          @manual_scaling = args[:manual_scaling] if args.key?(:manual_scaling)
          @name = args[:name] if args.key?(:name)
          @network = args[:network] if args.key?(:network)
          @nobuild_files_regex = args[:nobuild_files_regex] if args.key?(:nobuild_files_regex)
          @resources = args[:resources] if args.key?(:resources)
          @runtime = args[:runtime] if args.key?(:runtime)
          @runtime_api_version = args[:runtime_api_version] if args.key?(:runtime_api_version)
          @runtime_main_executable_path = args[:runtime_main_executable_path] if args.key?(:runtime_main_executable_path)
          @serving_status = args[:serving_status] if args.key?(:serving_status)
          @threadsafe = args[:threadsafe] if args.key?(:threadsafe)
          @vm = args[:vm] if args.key?(:vm)
        end
      end
      
      # Volumes mounted within the app container. Only applicable for VM runtimes.
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
    end
  end
end
