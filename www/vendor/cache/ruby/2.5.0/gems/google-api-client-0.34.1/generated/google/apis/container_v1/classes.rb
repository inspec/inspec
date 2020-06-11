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
    module ContainerV1
      
      # AcceleratorConfig represents a Hardware Accelerator request.
      class AcceleratorConfig
        include Google::Apis::Core::Hashable
      
        # The number of the accelerator cards exposed to an instance.
        # Corresponds to the JSON property `acceleratorCount`
        # @return [Fixnum]
        attr_accessor :accelerator_count
      
        # The accelerator type resource name. List of supported accelerators
        # [here](/compute/docs/gpus)
        # Corresponds to the JSON property `acceleratorType`
        # @return [String]
        attr_accessor :accelerator_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @accelerator_count = args[:accelerator_count] if args.key?(:accelerator_count)
          @accelerator_type = args[:accelerator_type] if args.key?(:accelerator_type)
        end
      end
      
      # Configuration for the addons that can be automatically spun up in the
      # cluster, enabling additional functionality.
      class AddonsConfig
        include Google::Apis::Core::Hashable
      
        # Configuration options for the horizontal pod autoscaling feature, which
        # increases or decreases the number of replica pods a replication controller
        # has based on the resource usage of the existing pods.
        # Corresponds to the JSON property `horizontalPodAutoscaling`
        # @return [Google::Apis::ContainerV1::HorizontalPodAutoscaling]
        attr_accessor :horizontal_pod_autoscaling
      
        # Configuration options for the HTTP (L7) load balancing controller addon,
        # which makes it easy to set up HTTP load balancers for services in a cluster.
        # Corresponds to the JSON property `httpLoadBalancing`
        # @return [Google::Apis::ContainerV1::HttpLoadBalancing]
        attr_accessor :http_load_balancing
      
        # Configuration for the Kubernetes Dashboard.
        # Corresponds to the JSON property `kubernetesDashboard`
        # @return [Google::Apis::ContainerV1::KubernetesDashboard]
        attr_accessor :kubernetes_dashboard
      
        # Configuration for NetworkPolicy. This only tracks whether the addon
        # is enabled or not on the Master, it does not track whether network policy
        # is enabled for the nodes.
        # Corresponds to the JSON property `networkPolicyConfig`
        # @return [Google::Apis::ContainerV1::NetworkPolicyConfig]
        attr_accessor :network_policy_config
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @horizontal_pod_autoscaling = args[:horizontal_pod_autoscaling] if args.key?(:horizontal_pod_autoscaling)
          @http_load_balancing = args[:http_load_balancing] if args.key?(:http_load_balancing)
          @kubernetes_dashboard = args[:kubernetes_dashboard] if args.key?(:kubernetes_dashboard)
          @network_policy_config = args[:network_policy_config] if args.key?(:network_policy_config)
        end
      end
      
      # Configuration for returning group information from authenticators.
      class AuthenticatorGroupsConfig
        include Google::Apis::Core::Hashable
      
        # Whether this cluster should return group membership lookups
        # during authentication using a group of security groups.
        # Corresponds to the JSON property `enabled`
        # @return [Boolean]
        attr_accessor :enabled
        alias_method :enabled?, :enabled
      
        # The name of the security group-of-groups to be used. Only relevant
        # if enabled = true.
        # Corresponds to the JSON property `securityGroup`
        # @return [String]
        attr_accessor :security_group
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @enabled = args[:enabled] if args.key?(:enabled)
          @security_group = args[:security_group] if args.key?(:security_group)
        end
      end
      
      # AutoUpgradeOptions defines the set of options for the user to control how
      # the Auto Upgrades will proceed.
      class AutoUpgradeOptions
        include Google::Apis::Core::Hashable
      
        # [Output only] This field is set when upgrades are about to commence
        # with the approximate start time for the upgrades, in
        # [RFC3339](https://www.ietf.org/rfc/rfc3339.txt) text format.
        # Corresponds to the JSON property `autoUpgradeStartTime`
        # @return [String]
        attr_accessor :auto_upgrade_start_time
      
        # [Output only] This field is set when upgrades are about to commence
        # with the description of the upgrade.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @auto_upgrade_start_time = args[:auto_upgrade_start_time] if args.key?(:auto_upgrade_start_time)
          @description = args[:description] if args.key?(:description)
        end
      end
      
      # AutoprovisioningNodePoolDefaults contains defaults for a node pool created
      # by NAP.
      class AutoprovisioningNodePoolDefaults
        include Google::Apis::Core::Hashable
      
        # Scopes that are used by NAP when creating node pools. If oauth_scopes are
        # specified, service_account should be empty.
        # Corresponds to the JSON property `oauthScopes`
        # @return [Array<String>]
        attr_accessor :oauth_scopes
      
        # The Google Cloud Platform Service Account to be used by the node VMs. If
        # service_account is specified, scopes should be empty.
        # Corresponds to the JSON property `serviceAccount`
        # @return [String]
        attr_accessor :service_account
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @oauth_scopes = args[:oauth_scopes] if args.key?(:oauth_scopes)
          @service_account = args[:service_account] if args.key?(:service_account)
        end
      end
      
      # Parameters for using BigQuery as the destination of resource usage export.
      class BigQueryDestination
        include Google::Apis::Core::Hashable
      
        # The ID of a BigQuery Dataset.
        # Corresponds to the JSON property `datasetId`
        # @return [String]
        attr_accessor :dataset_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dataset_id = args[:dataset_id] if args.key?(:dataset_id)
        end
      end
      
      # Configuration for Binary Authorization.
      class BinaryAuthorization
        include Google::Apis::Core::Hashable
      
        # Enable Binary Authorization for this cluster. If enabled, all container
        # images will be validated by Binary Authorization.
        # Corresponds to the JSON property `enabled`
        # @return [Boolean]
        attr_accessor :enabled
        alias_method :enabled?, :enabled
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @enabled = args[:enabled] if args.key?(:enabled)
        end
      end
      
      # CancelOperationRequest cancels a single operation.
      class CancelOperationRequest
        include Google::Apis::Core::Hashable
      
        # The name (project, location, operation id) of the operation to cancel.
        # Specified in the format 'projects/*/locations/*/operations/*'.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Deprecated. The server-assigned `name` of the operation.
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `operationId`
        # @return [String]
        attr_accessor :operation_id
      
        # Deprecated. The Google Developers Console [project ID or project
        # number](https://support.google.com/cloud/answer/6158840).
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # Deprecated. The name of the Google Compute Engine
        # [zone](/compute/docs/zones#available) in which the operation resides.
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `zone`
        # @return [String]
        attr_accessor :zone
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @operation_id = args[:operation_id] if args.key?(:operation_id)
          @project_id = args[:project_id] if args.key?(:project_id)
          @zone = args[:zone] if args.key?(:zone)
        end
      end
      
      # CidrBlock contains an optional name and one CIDR block.
      class CidrBlock
        include Google::Apis::Core::Hashable
      
        # cidr_block must be specified in CIDR notation.
        # Corresponds to the JSON property `cidrBlock`
        # @return [String]
        attr_accessor :cidr_block
      
        # display_name is an optional field for users to identify CIDR blocks.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cidr_block = args[:cidr_block] if args.key?(:cidr_block)
          @display_name = args[:display_name] if args.key?(:display_name)
        end
      end
      
      # Configuration for client certificates on the cluster.
      class ClientCertificateConfig
        include Google::Apis::Core::Hashable
      
        # Issue a client certificate.
        # Corresponds to the JSON property `issueClientCertificate`
        # @return [Boolean]
        attr_accessor :issue_client_certificate
        alias_method :issue_client_certificate?, :issue_client_certificate
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @issue_client_certificate = args[:issue_client_certificate] if args.key?(:issue_client_certificate)
        end
      end
      
      # A Google Kubernetes Engine cluster.
      class Cluster
        include Google::Apis::Core::Hashable
      
        # Configuration for the addons that can be automatically spun up in the
        # cluster, enabling additional functionality.
        # Corresponds to the JSON property `addonsConfig`
        # @return [Google::Apis::ContainerV1::AddonsConfig]
        attr_accessor :addons_config
      
        # Configuration for returning group information from authenticators.
        # Corresponds to the JSON property `authenticatorGroupsConfig`
        # @return [Google::Apis::ContainerV1::AuthenticatorGroupsConfig]
        attr_accessor :authenticator_groups_config
      
        # ClusterAutoscaling contains global, per-cluster information
        # required by Cluster Autoscaler to automatically adjust
        # the size of the cluster and create/delete
        # node pools based on the current needs.
        # Corresponds to the JSON property `autoscaling`
        # @return [Google::Apis::ContainerV1::ClusterAutoscaling]
        attr_accessor :autoscaling
      
        # Configuration for Binary Authorization.
        # Corresponds to the JSON property `binaryAuthorization`
        # @return [Google::Apis::ContainerV1::BinaryAuthorization]
        attr_accessor :binary_authorization
      
        # The IP address range of the container pods in this cluster, in
        # [CIDR](http://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing)
        # notation (e.g. `10.96.0.0/14`). Leave blank to have
        # one automatically chosen or specify a `/14` block in `10.0.0.0/8`.
        # Corresponds to the JSON property `clusterIpv4Cidr`
        # @return [String]
        attr_accessor :cluster_ipv4_cidr
      
        # Which conditions caused the current cluster state.
        # Corresponds to the JSON property `conditions`
        # @return [Array<Google::Apis::ContainerV1::StatusCondition>]
        attr_accessor :conditions
      
        # [Output only] The time the cluster was created, in
        # [RFC3339](https://www.ietf.org/rfc/rfc3339.txt) text format.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # [Output only] The current software version of the master endpoint.
        # Corresponds to the JSON property `currentMasterVersion`
        # @return [String]
        attr_accessor :current_master_version
      
        # [Output only]  The number of nodes currently in the cluster. Deprecated.
        # Call Kubernetes API directly to retrieve node information.
        # Corresponds to the JSON property `currentNodeCount`
        # @return [Fixnum]
        attr_accessor :current_node_count
      
        # [Output only] Deprecated, use
        # [NodePools.version](/kubernetes-engine/docs/reference/rest/v1/projects.zones.
        # clusters.nodePools)
        # instead. The current version of the node software components. If they are
        # currently at multiple versions because they're in the process of being
        # upgraded, this reflects the minimum version of all nodes.
        # Corresponds to the JSON property `currentNodeVersion`
        # @return [String]
        attr_accessor :current_node_version
      
        # Configuration of etcd encryption.
        # Corresponds to the JSON property `databaseEncryption`
        # @return [Google::Apis::ContainerV1::DatabaseEncryption]
        attr_accessor :database_encryption
      
        # Constraints applied to pods.
        # Corresponds to the JSON property `defaultMaxPodsConstraint`
        # @return [Google::Apis::ContainerV1::MaxPodsConstraint]
        attr_accessor :default_max_pods_constraint
      
        # An optional description of this cluster.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Kubernetes alpha features are enabled on this cluster. This includes alpha
        # API groups (e.g. v1alpha1) and features that may not be production ready in
        # the kubernetes version of the master and nodes.
        # The cluster has no SLA for uptime and master/node upgrades are disabled.
        # Alpha enabled clusters are automatically deleted thirty days after
        # creation.
        # Corresponds to the JSON property `enableKubernetesAlpha`
        # @return [Boolean]
        attr_accessor :enable_kubernetes_alpha
        alias_method :enable_kubernetes_alpha?, :enable_kubernetes_alpha
      
        # Enable the ability to use Cloud TPUs in this cluster.
        # Corresponds to the JSON property `enableTpu`
        # @return [Boolean]
        attr_accessor :enable_tpu
        alias_method :enable_tpu?, :enable_tpu
      
        # [Output only] The IP address of this cluster's master endpoint.
        # The endpoint can be accessed from the internet at
        # `https://username:password@endpoint/`.
        # See the `masterAuth` property of this resource for username and
        # password information.
        # Corresponds to the JSON property `endpoint`
        # @return [String]
        attr_accessor :endpoint
      
        # [Output only] The time the cluster will be automatically
        # deleted in [RFC3339](https://www.ietf.org/rfc/rfc3339.txt) text format.
        # Corresponds to the JSON property `expireTime`
        # @return [String]
        attr_accessor :expire_time
      
        # The initial Kubernetes version for this cluster.  Valid versions are those
        # found in validMasterVersions returned by getServerConfig.  The version can
        # be upgraded over time; such upgrades are reflected in
        # currentMasterVersion and currentNodeVersion.
        # Users may specify either explicit versions offered by
        # Kubernetes Engine or version aliases, which have the following behavior:
        # - "latest": picks the highest valid Kubernetes version
        # - "1.X": picks the highest valid patch+gke.N patch in the 1.X version
        # - "1.X.Y": picks the highest valid gke.N patch in the 1.X.Y version
        # - "1.X.Y-gke.N": picks an explicit Kubernetes version
        # - "","-": picks the default Kubernetes version
        # Corresponds to the JSON property `initialClusterVersion`
        # @return [String]
        attr_accessor :initial_cluster_version
      
        # The number of nodes to create in this cluster. You must ensure that your
        # Compute Engine <a href="/compute/docs/resource-quotas">resource quota</a>
        # is sufficient for this number of instances. You must also have available
        # firewall and routes quota.
        # For requests, this field should only be used in lieu of a
        # "node_pool" object, since this configuration (along with the
        # "node_config") will be used to create a "NodePool" object with an
        # auto-generated name. Do not use this and a node_pool at the same time.
        # This field is deprecated, use node_pool.initial_node_count instead.
        # Corresponds to the JSON property `initialNodeCount`
        # @return [Fixnum]
        attr_accessor :initial_node_count
      
        # Deprecated. Use node_pools.instance_group_urls.
        # Corresponds to the JSON property `instanceGroupUrls`
        # @return [Array<String>]
        attr_accessor :instance_group_urls
      
        # Configuration for controlling how IPs are allocated in the cluster.
        # Corresponds to the JSON property `ipAllocationPolicy`
        # @return [Google::Apis::ContainerV1::IpAllocationPolicy]
        attr_accessor :ip_allocation_policy
      
        # The fingerprint of the set of labels for this cluster.
        # Corresponds to the JSON property `labelFingerprint`
        # @return [String]
        attr_accessor :label_fingerprint
      
        # Configuration for the legacy Attribute Based Access Control authorization
        # mode.
        # Corresponds to the JSON property `legacyAbac`
        # @return [Google::Apis::ContainerV1::LegacyAbac]
        attr_accessor :legacy_abac
      
        # [Output only] The name of the Google Compute Engine
        # [zone](/compute/docs/regions-zones/regions-zones#available) or
        # [region](/compute/docs/regions-zones/regions-zones#available) in which
        # the cluster resides.
        # Corresponds to the JSON property `location`
        # @return [String]
        attr_accessor :location
      
        # The list of Google Compute Engine
        # [zones](/compute/docs/zones#available) in which the cluster's nodes
        # should be located.
        # Corresponds to the JSON property `locations`
        # @return [Array<String>]
        attr_accessor :locations
      
        # The logging service the cluster should use to write logs.
        # Currently available options:
        # * "logging.googleapis.com/kubernetes" - the Google Cloud Logging
        # service with Kubernetes-native resource model
        # * `logging.googleapis.com` - the Google Cloud Logging service.
        # * `none` - no logs will be exported from the cluster.
        # * if left as an empty string,`logging.googleapis.com` will be used.
        # Corresponds to the JSON property `loggingService`
        # @return [String]
        attr_accessor :logging_service
      
        # MaintenancePolicy defines the maintenance policy to be used for the cluster.
        # Corresponds to the JSON property `maintenancePolicy`
        # @return [Google::Apis::ContainerV1::MaintenancePolicy]
        attr_accessor :maintenance_policy
      
        # The authentication information for accessing the master endpoint.
        # Authentication can be done using HTTP basic auth or using client
        # certificates.
        # Corresponds to the JSON property `masterAuth`
        # @return [Google::Apis::ContainerV1::MasterAuth]
        attr_accessor :master_auth
      
        # Configuration options for the master authorized networks feature. Enabled
        # master authorized networks will disallow all external traffic to access
        # Kubernetes master through HTTPS except traffic from the given CIDR blocks,
        # Google Compute Engine Public IPs and Google Prod IPs.
        # Corresponds to the JSON property `masterAuthorizedNetworksConfig`
        # @return [Google::Apis::ContainerV1::MasterAuthorizedNetworksConfig]
        attr_accessor :master_authorized_networks_config
      
        # The monitoring service the cluster should use to write metrics.
        # Currently available options:
        # * `monitoring.googleapis.com` - the Google Cloud Monitoring service.
        # * `none` - no metrics will be exported from the cluster.
        # * if left as an empty string, `monitoring.googleapis.com` will be used.
        # Corresponds to the JSON property `monitoringService`
        # @return [String]
        attr_accessor :monitoring_service
      
        # The name of this cluster. The name must be unique within this project
        # and location (e.g. zone or region), and can be up to 40 characters with
        # the following restrictions:
        # * Lowercase letters, numbers, and hyphens only.
        # * Must start with a letter.
        # * Must end with a number or a letter.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The name of the Google Compute Engine
        # [network](/compute/docs/networks-and-firewalls#networks) to which the
        # cluster is connected. If left unspecified, the `default` network
        # will be used.
        # Corresponds to the JSON property `network`
        # @return [String]
        attr_accessor :network
      
        # NetworkConfig reports the relative names of network & subnetwork.
        # Corresponds to the JSON property `networkConfig`
        # @return [Google::Apis::ContainerV1::NetworkConfig]
        attr_accessor :network_config
      
        # Configuration options for the NetworkPolicy feature.
        # https://kubernetes.io/docs/concepts/services-networking/networkpolicies/
        # Corresponds to the JSON property `networkPolicy`
        # @return [Google::Apis::ContainerV1::NetworkPolicy]
        attr_accessor :network_policy
      
        # Parameters that describe the nodes in a cluster.
        # Corresponds to the JSON property `nodeConfig`
        # @return [Google::Apis::ContainerV1::NodeConfig]
        attr_accessor :node_config
      
        # [Output only] The size of the address space on each node for hosting
        # containers. This is provisioned from within the `container_ipv4_cidr`
        # range. This field will only be set when cluster is in route-based network
        # mode.
        # Corresponds to the JSON property `nodeIpv4CidrSize`
        # @return [Fixnum]
        attr_accessor :node_ipv4_cidr_size
      
        # The node pools associated with this cluster.
        # This field should not be set if "node_config" or "initial_node_count" are
        # specified.
        # Corresponds to the JSON property `nodePools`
        # @return [Array<Google::Apis::ContainerV1::NodePool>]
        attr_accessor :node_pools
      
        # Configuration options for private clusters.
        # Corresponds to the JSON property `privateClusterConfig`
        # @return [Google::Apis::ContainerV1::PrivateClusterConfig]
        attr_accessor :private_cluster_config
      
        # The resource labels for the cluster to use to annotate any related
        # Google Compute Engine resources.
        # Corresponds to the JSON property `resourceLabels`
        # @return [Hash<String,String>]
        attr_accessor :resource_labels
      
        # Configuration for exporting cluster resource usages.
        # Corresponds to the JSON property `resourceUsageExportConfig`
        # @return [Google::Apis::ContainerV1::ResourceUsageExportConfig]
        attr_accessor :resource_usage_export_config
      
        # [Output only] Server-defined URL for the resource.
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        # [Output only] The IP address range of the Kubernetes services in
        # this cluster, in
        # [CIDR](http://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing)
        # notation (e.g. `1.2.3.4/29`). Service addresses are
        # typically put in the last `/16` from the container CIDR.
        # Corresponds to the JSON property `servicesIpv4Cidr`
        # @return [String]
        attr_accessor :services_ipv4_cidr
      
        # [Output only] The current status of this cluster.
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        # [Output only] Additional information about the current status of this
        # cluster, if available.
        # Corresponds to the JSON property `statusMessage`
        # @return [String]
        attr_accessor :status_message
      
        # The name of the Google Compute Engine
        # [subnetwork](/compute/docs/subnetworks) to which the
        # cluster is connected.
        # Corresponds to the JSON property `subnetwork`
        # @return [String]
        attr_accessor :subnetwork
      
        # [Output only] The IP address range of the Cloud TPUs in this cluster, in
        # [CIDR](http://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing)
        # notation (e.g. `1.2.3.4/29`).
        # Corresponds to the JSON property `tpuIpv4CidrBlock`
        # @return [String]
        attr_accessor :tpu_ipv4_cidr_block
      
        # VerticalPodAutoscaling contains global, per-cluster information
        # required by Vertical Pod Autoscaler to automatically adjust
        # the resources of pods controlled by it.
        # Corresponds to the JSON property `verticalPodAutoscaling`
        # @return [Google::Apis::ContainerV1::VerticalPodAutoscaling]
        attr_accessor :vertical_pod_autoscaling
      
        # [Output only] The name of the Google Compute Engine
        # [zone](/compute/docs/zones#available) in which the cluster
        # resides.
        # This field is deprecated, use location instead.
        # Corresponds to the JSON property `zone`
        # @return [String]
        attr_accessor :zone
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @addons_config = args[:addons_config] if args.key?(:addons_config)
          @authenticator_groups_config = args[:authenticator_groups_config] if args.key?(:authenticator_groups_config)
          @autoscaling = args[:autoscaling] if args.key?(:autoscaling)
          @binary_authorization = args[:binary_authorization] if args.key?(:binary_authorization)
          @cluster_ipv4_cidr = args[:cluster_ipv4_cidr] if args.key?(:cluster_ipv4_cidr)
          @conditions = args[:conditions] if args.key?(:conditions)
          @create_time = args[:create_time] if args.key?(:create_time)
          @current_master_version = args[:current_master_version] if args.key?(:current_master_version)
          @current_node_count = args[:current_node_count] if args.key?(:current_node_count)
          @current_node_version = args[:current_node_version] if args.key?(:current_node_version)
          @database_encryption = args[:database_encryption] if args.key?(:database_encryption)
          @default_max_pods_constraint = args[:default_max_pods_constraint] if args.key?(:default_max_pods_constraint)
          @description = args[:description] if args.key?(:description)
          @enable_kubernetes_alpha = args[:enable_kubernetes_alpha] if args.key?(:enable_kubernetes_alpha)
          @enable_tpu = args[:enable_tpu] if args.key?(:enable_tpu)
          @endpoint = args[:endpoint] if args.key?(:endpoint)
          @expire_time = args[:expire_time] if args.key?(:expire_time)
          @initial_cluster_version = args[:initial_cluster_version] if args.key?(:initial_cluster_version)
          @initial_node_count = args[:initial_node_count] if args.key?(:initial_node_count)
          @instance_group_urls = args[:instance_group_urls] if args.key?(:instance_group_urls)
          @ip_allocation_policy = args[:ip_allocation_policy] if args.key?(:ip_allocation_policy)
          @label_fingerprint = args[:label_fingerprint] if args.key?(:label_fingerprint)
          @legacy_abac = args[:legacy_abac] if args.key?(:legacy_abac)
          @location = args[:location] if args.key?(:location)
          @locations = args[:locations] if args.key?(:locations)
          @logging_service = args[:logging_service] if args.key?(:logging_service)
          @maintenance_policy = args[:maintenance_policy] if args.key?(:maintenance_policy)
          @master_auth = args[:master_auth] if args.key?(:master_auth)
          @master_authorized_networks_config = args[:master_authorized_networks_config] if args.key?(:master_authorized_networks_config)
          @monitoring_service = args[:monitoring_service] if args.key?(:monitoring_service)
          @name = args[:name] if args.key?(:name)
          @network = args[:network] if args.key?(:network)
          @network_config = args[:network_config] if args.key?(:network_config)
          @network_policy = args[:network_policy] if args.key?(:network_policy)
          @node_config = args[:node_config] if args.key?(:node_config)
          @node_ipv4_cidr_size = args[:node_ipv4_cidr_size] if args.key?(:node_ipv4_cidr_size)
          @node_pools = args[:node_pools] if args.key?(:node_pools)
          @private_cluster_config = args[:private_cluster_config] if args.key?(:private_cluster_config)
          @resource_labels = args[:resource_labels] if args.key?(:resource_labels)
          @resource_usage_export_config = args[:resource_usage_export_config] if args.key?(:resource_usage_export_config)
          @self_link = args[:self_link] if args.key?(:self_link)
          @services_ipv4_cidr = args[:services_ipv4_cidr] if args.key?(:services_ipv4_cidr)
          @status = args[:status] if args.key?(:status)
          @status_message = args[:status_message] if args.key?(:status_message)
          @subnetwork = args[:subnetwork] if args.key?(:subnetwork)
          @tpu_ipv4_cidr_block = args[:tpu_ipv4_cidr_block] if args.key?(:tpu_ipv4_cidr_block)
          @vertical_pod_autoscaling = args[:vertical_pod_autoscaling] if args.key?(:vertical_pod_autoscaling)
          @zone = args[:zone] if args.key?(:zone)
        end
      end
      
      # ClusterAutoscaling contains global, per-cluster information
      # required by Cluster Autoscaler to automatically adjust
      # the size of the cluster and create/delete
      # node pools based on the current needs.
      class ClusterAutoscaling
        include Google::Apis::Core::Hashable
      
        # The list of Google Compute Engine [zones](/compute/docs/zones#available)
        # in which the NodePool's nodes can be created by NAP.
        # Corresponds to the JSON property `autoprovisioningLocations`
        # @return [Array<String>]
        attr_accessor :autoprovisioning_locations
      
        # AutoprovisioningNodePoolDefaults contains defaults for a node pool created
        # by NAP.
        # Corresponds to the JSON property `autoprovisioningNodePoolDefaults`
        # @return [Google::Apis::ContainerV1::AutoprovisioningNodePoolDefaults]
        attr_accessor :autoprovisioning_node_pool_defaults
      
        # Enables automatic node pool creation and deletion.
        # Corresponds to the JSON property `enableNodeAutoprovisioning`
        # @return [Boolean]
        attr_accessor :enable_node_autoprovisioning
        alias_method :enable_node_autoprovisioning?, :enable_node_autoprovisioning
      
        # Contains global constraints regarding minimum and maximum
        # amount of resources in the cluster.
        # Corresponds to the JSON property `resourceLimits`
        # @return [Array<Google::Apis::ContainerV1::ResourceLimit>]
        attr_accessor :resource_limits
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @autoprovisioning_locations = args[:autoprovisioning_locations] if args.key?(:autoprovisioning_locations)
          @autoprovisioning_node_pool_defaults = args[:autoprovisioning_node_pool_defaults] if args.key?(:autoprovisioning_node_pool_defaults)
          @enable_node_autoprovisioning = args[:enable_node_autoprovisioning] if args.key?(:enable_node_autoprovisioning)
          @resource_limits = args[:resource_limits] if args.key?(:resource_limits)
        end
      end
      
      # ClusterUpdate describes an update to the cluster. Exactly one update can
      # be applied to a cluster with each request, so at most one field can be
      # provided.
      class ClusterUpdate
        include Google::Apis::Core::Hashable
      
        # Configuration for the addons that can be automatically spun up in the
        # cluster, enabling additional functionality.
        # Corresponds to the JSON property `desiredAddonsConfig`
        # @return [Google::Apis::ContainerV1::AddonsConfig]
        attr_accessor :desired_addons_config
      
        # Configuration for Binary Authorization.
        # Corresponds to the JSON property `desiredBinaryAuthorization`
        # @return [Google::Apis::ContainerV1::BinaryAuthorization]
        attr_accessor :desired_binary_authorization
      
        # ClusterAutoscaling contains global, per-cluster information
        # required by Cluster Autoscaler to automatically adjust
        # the size of the cluster and create/delete
        # node pools based on the current needs.
        # Corresponds to the JSON property `desiredClusterAutoscaling`
        # @return [Google::Apis::ContainerV1::ClusterAutoscaling]
        attr_accessor :desired_cluster_autoscaling
      
        # Configuration of etcd encryption.
        # Corresponds to the JSON property `desiredDatabaseEncryption`
        # @return [Google::Apis::ContainerV1::DatabaseEncryption]
        attr_accessor :desired_database_encryption
      
        # The desired image type for the node pool.
        # NOTE: Set the "desired_node_pool" field as well.
        # Corresponds to the JSON property `desiredImageType`
        # @return [String]
        attr_accessor :desired_image_type
      
        # IntraNodeVisibilityConfig contains the desired config of the intra-node
        # visibility on this cluster.
        # Corresponds to the JSON property `desiredIntraNodeVisibilityConfig`
        # @return [Google::Apis::ContainerV1::IntraNodeVisibilityConfig]
        attr_accessor :desired_intra_node_visibility_config
      
        # The desired list of Google Compute Engine
        # [zones](/compute/docs/zones#available) in which the cluster's nodes
        # should be located. Changing the locations a cluster is in will result
        # in nodes being either created or removed from the cluster, depending on
        # whether locations are being added or removed.
        # This list must always include the cluster's primary zone.
        # Corresponds to the JSON property `desiredLocations`
        # @return [Array<String>]
        attr_accessor :desired_locations
      
        # The logging service the cluster should use to write logs.
        # Currently available options:
        # * "logging.googleapis.com/kubernetes" - the Google Cloud Logging
        # service with Kubernetes-native resource model
        # * "logging.googleapis.com" - the Google Cloud Logging service
        # * "none" - no logs will be exported from the cluster
        # Corresponds to the JSON property `desiredLoggingService`
        # @return [String]
        attr_accessor :desired_logging_service
      
        # Configuration options for the master authorized networks feature. Enabled
        # master authorized networks will disallow all external traffic to access
        # Kubernetes master through HTTPS except traffic from the given CIDR blocks,
        # Google Compute Engine Public IPs and Google Prod IPs.
        # Corresponds to the JSON property `desiredMasterAuthorizedNetworksConfig`
        # @return [Google::Apis::ContainerV1::MasterAuthorizedNetworksConfig]
        attr_accessor :desired_master_authorized_networks_config
      
        # The Kubernetes version to change the master to.
        # Users may specify either explicit versions offered by
        # Kubernetes Engine or version aliases, which have the following behavior:
        # - "latest": picks the highest valid Kubernetes version
        # - "1.X": picks the highest valid patch+gke.N patch in the 1.X version
        # - "1.X.Y": picks the highest valid gke.N patch in the 1.X.Y version
        # - "1.X.Y-gke.N": picks an explicit Kubernetes version
        # - "-": picks the default Kubernetes version
        # Corresponds to the JSON property `desiredMasterVersion`
        # @return [String]
        attr_accessor :desired_master_version
      
        # The monitoring service the cluster should use to write metrics.
        # Currently available options:
        # * "monitoring.googleapis.com/kubernetes" - the Google Cloud Monitoring
        # service with Kubernetes-native resource model
        # * "monitoring.googleapis.com" - the Google Cloud Monitoring service
        # * "none" - no metrics will be exported from the cluster
        # Corresponds to the JSON property `desiredMonitoringService`
        # @return [String]
        attr_accessor :desired_monitoring_service
      
        # NodePoolAutoscaling contains information required by cluster autoscaler to
        # adjust the size of the node pool to the current cluster usage.
        # Corresponds to the JSON property `desiredNodePoolAutoscaling`
        # @return [Google::Apis::ContainerV1::NodePoolAutoscaling]
        attr_accessor :desired_node_pool_autoscaling
      
        # The node pool to be upgraded. This field is mandatory if
        # "desired_node_version", "desired_image_family" or
        # "desired_node_pool_autoscaling" is specified and there is more than one
        # node pool on the cluster.
        # Corresponds to the JSON property `desiredNodePoolId`
        # @return [String]
        attr_accessor :desired_node_pool_id
      
        # The Kubernetes version to change the nodes to (typically an
        # upgrade).
        # Users may specify either explicit versions offered by
        # Kubernetes Engine or version aliases, which have the following behavior:
        # - "latest": picks the highest valid Kubernetes version
        # - "1.X": picks the highest valid patch+gke.N patch in the 1.X version
        # - "1.X.Y": picks the highest valid gke.N patch in the 1.X.Y version
        # - "1.X.Y-gke.N": picks an explicit Kubernetes version
        # - "-": picks the Kubernetes master version
        # Corresponds to the JSON property `desiredNodeVersion`
        # @return [String]
        attr_accessor :desired_node_version
      
        # Configuration for exporting cluster resource usages.
        # Corresponds to the JSON property `desiredResourceUsageExportConfig`
        # @return [Google::Apis::ContainerV1::ResourceUsageExportConfig]
        attr_accessor :desired_resource_usage_export_config
      
        # VerticalPodAutoscaling contains global, per-cluster information
        # required by Vertical Pod Autoscaler to automatically adjust
        # the resources of pods controlled by it.
        # Corresponds to the JSON property `desiredVerticalPodAutoscaling`
        # @return [Google::Apis::ContainerV1::VerticalPodAutoscaling]
        attr_accessor :desired_vertical_pod_autoscaling
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @desired_addons_config = args[:desired_addons_config] if args.key?(:desired_addons_config)
          @desired_binary_authorization = args[:desired_binary_authorization] if args.key?(:desired_binary_authorization)
          @desired_cluster_autoscaling = args[:desired_cluster_autoscaling] if args.key?(:desired_cluster_autoscaling)
          @desired_database_encryption = args[:desired_database_encryption] if args.key?(:desired_database_encryption)
          @desired_image_type = args[:desired_image_type] if args.key?(:desired_image_type)
          @desired_intra_node_visibility_config = args[:desired_intra_node_visibility_config] if args.key?(:desired_intra_node_visibility_config)
          @desired_locations = args[:desired_locations] if args.key?(:desired_locations)
          @desired_logging_service = args[:desired_logging_service] if args.key?(:desired_logging_service)
          @desired_master_authorized_networks_config = args[:desired_master_authorized_networks_config] if args.key?(:desired_master_authorized_networks_config)
          @desired_master_version = args[:desired_master_version] if args.key?(:desired_master_version)
          @desired_monitoring_service = args[:desired_monitoring_service] if args.key?(:desired_monitoring_service)
          @desired_node_pool_autoscaling = args[:desired_node_pool_autoscaling] if args.key?(:desired_node_pool_autoscaling)
          @desired_node_pool_id = args[:desired_node_pool_id] if args.key?(:desired_node_pool_id)
          @desired_node_version = args[:desired_node_version] if args.key?(:desired_node_version)
          @desired_resource_usage_export_config = args[:desired_resource_usage_export_config] if args.key?(:desired_resource_usage_export_config)
          @desired_vertical_pod_autoscaling = args[:desired_vertical_pod_autoscaling] if args.key?(:desired_vertical_pod_autoscaling)
        end
      end
      
      # CompleteIPRotationRequest moves the cluster master back into single-IP mode.
      class CompleteIpRotationRequest
        include Google::Apis::Core::Hashable
      
        # Deprecated. The name of the cluster.
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `clusterId`
        # @return [String]
        attr_accessor :cluster_id
      
        # The name (project, location, cluster id) of the cluster to complete IP
        # rotation. Specified in the format 'projects/*/locations/*/clusters/*'.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Deprecated. The Google Developers Console [project ID or project
        # number](https://developers.google.com/console/help/new/#projectnumber).
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # Deprecated. The name of the Google Compute Engine
        # [zone](/compute/docs/zones#available) in which the cluster
        # resides.
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `zone`
        # @return [String]
        attr_accessor :zone
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cluster_id = args[:cluster_id] if args.key?(:cluster_id)
          @name = args[:name] if args.key?(:name)
          @project_id = args[:project_id] if args.key?(:project_id)
          @zone = args[:zone] if args.key?(:zone)
        end
      end
      
      # Parameters for controlling consumption metering.
      class ConsumptionMeteringConfig
        include Google::Apis::Core::Hashable
      
        # Whether to enable consumption metering for this cluster. If enabled, a
        # second BigQuery table will be created to hold resource consumption
        # records.
        # Corresponds to the JSON property `enabled`
        # @return [Boolean]
        attr_accessor :enabled
        alias_method :enabled?, :enabled
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @enabled = args[:enabled] if args.key?(:enabled)
        end
      end
      
      # CreateClusterRequest creates a cluster.
      class CreateClusterRequest
        include Google::Apis::Core::Hashable
      
        # A Google Kubernetes Engine cluster.
        # Corresponds to the JSON property `cluster`
        # @return [Google::Apis::ContainerV1::Cluster]
        attr_accessor :cluster
      
        # The parent (project and location) where the cluster will be created.
        # Specified in the format 'projects/*/locations/*'.
        # Corresponds to the JSON property `parent`
        # @return [String]
        attr_accessor :parent
      
        # Deprecated. The Google Developers Console [project ID or project
        # number](https://support.google.com/cloud/answer/6158840).
        # This field has been deprecated and replaced by the parent field.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # Deprecated. The name of the Google Compute Engine
        # [zone](/compute/docs/zones#available) in which the cluster
        # resides.
        # This field has been deprecated and replaced by the parent field.
        # Corresponds to the JSON property `zone`
        # @return [String]
        attr_accessor :zone
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cluster = args[:cluster] if args.key?(:cluster)
          @parent = args[:parent] if args.key?(:parent)
          @project_id = args[:project_id] if args.key?(:project_id)
          @zone = args[:zone] if args.key?(:zone)
        end
      end
      
      # CreateNodePoolRequest creates a node pool for a cluster.
      class CreateNodePoolRequest
        include Google::Apis::Core::Hashable
      
        # Deprecated. The name of the cluster.
        # This field has been deprecated and replaced by the parent field.
        # Corresponds to the JSON property `clusterId`
        # @return [String]
        attr_accessor :cluster_id
      
        # NodePool contains the name and configuration for a cluster's node pool.
        # Node pools are a set of nodes (i.e. VM's), with a common configuration and
        # specification, under the control of the cluster master. They may have a set
        # of Kubernetes labels applied to them, which may be used to reference them
        # during pod scheduling. They may also be resized up or down, to accommodate
        # the workload.
        # Corresponds to the JSON property `nodePool`
        # @return [Google::Apis::ContainerV1::NodePool]
        attr_accessor :node_pool
      
        # The parent (project, location, cluster id) where the node pool will be
        # created. Specified in the format
        # 'projects/*/locations/*/clusters/*'.
        # Corresponds to the JSON property `parent`
        # @return [String]
        attr_accessor :parent
      
        # Deprecated. The Google Developers Console [project ID or project
        # number](https://developers.google.com/console/help/new/#projectnumber).
        # This field has been deprecated and replaced by the parent field.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # Deprecated. The name of the Google Compute Engine
        # [zone](/compute/docs/zones#available) in which the cluster
        # resides.
        # This field has been deprecated and replaced by the parent field.
        # Corresponds to the JSON property `zone`
        # @return [String]
        attr_accessor :zone
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cluster_id = args[:cluster_id] if args.key?(:cluster_id)
          @node_pool = args[:node_pool] if args.key?(:node_pool)
          @parent = args[:parent] if args.key?(:parent)
          @project_id = args[:project_id] if args.key?(:project_id)
          @zone = args[:zone] if args.key?(:zone)
        end
      end
      
      # Time window specified for daily maintenance operations.
      class DailyMaintenanceWindow
        include Google::Apis::Core::Hashable
      
        # [Output only] Duration of the time window, automatically chosen to be
        # smallest possible in the given scenario.
        # Duration will be in [RFC3339](https://www.ietf.org/rfc/rfc3339.txt)
        # format "PTnHnMnS".
        # Corresponds to the JSON property `duration`
        # @return [String]
        attr_accessor :duration
      
        # Time within the maintenance window to start the maintenance operations.
        # Time format should be in [RFC3339](https://www.ietf.org/rfc/rfc3339.txt)
        # format "HH:MM", where HH : [00-23] and MM : [00-59] GMT.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @duration = args[:duration] if args.key?(:duration)
          @start_time = args[:start_time] if args.key?(:start_time)
        end
      end
      
      # Configuration of etcd encryption.
      class DatabaseEncryption
        include Google::Apis::Core::Hashable
      
        # Name of CloudKMS key to use for the encryption of secrets in etcd.
        # Ex. projects/my-project/locations/global/keyRings/my-ring/cryptoKeys/my-key
        # Corresponds to the JSON property `keyName`
        # @return [String]
        attr_accessor :key_name
      
        # Denotes the state of etcd encryption.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @key_name = args[:key_name] if args.key?(:key_name)
          @state = args[:state] if args.key?(:state)
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
      
      # GetJSONWebKeysResponse is a valid JSON Web Key Set as specififed in rfc 7517
      class GetJsonWebKeysResponse
        include Google::Apis::Core::Hashable
      
        # RFC-2616: cache control support
        # Corresponds to the JSON property `cacheHeader`
        # @return [Google::Apis::ContainerV1::HttpCacheControlResponseHeader]
        attr_accessor :cache_header
      
        # The public component of the keys used by the cluster to sign token
        # requests.
        # Corresponds to the JSON property `keys`
        # @return [Array<Google::Apis::ContainerV1::Jwk>]
        attr_accessor :keys
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cache_header = args[:cache_header] if args.key?(:cache_header)
          @keys = args[:keys] if args.key?(:keys)
        end
      end
      
      # GetOpenIDConfigResponse is an OIDC discovery document for the cluster.
      # See the OpenID Connect Discovery 1.0 specification for details.
      class GetOpenIdConfigResponse
        include Google::Apis::Core::Hashable
      
        # RFC-2616: cache control support
        # Corresponds to the JSON property `cacheHeader`
        # @return [Google::Apis::ContainerV1::HttpCacheControlResponseHeader]
        attr_accessor :cache_header
      
        # Supported claims.
        # Corresponds to the JSON property `claims_supported`
        # @return [Array<String>]
        attr_accessor :claims_supported
      
        # Supported grant types.
        # Corresponds to the JSON property `grant_types`
        # @return [Array<String>]
        attr_accessor :grant_types
      
        # supported ID Token signing Algorithms.
        # Corresponds to the JSON property `id_token_signing_alg_values_supported`
        # @return [Array<String>]
        attr_accessor :id_token_signing_alg_values_supported
      
        # OIDC Issuer.
        # Corresponds to the JSON property `issuer`
        # @return [String]
        attr_accessor :issuer
      
        # JSON Web Key uri.
        # Corresponds to the JSON property `jwks_uri`
        # @return [String]
        attr_accessor :jwks_uri
      
        # Supported response types.
        # Corresponds to the JSON property `response_types_supported`
        # @return [Array<String>]
        attr_accessor :response_types_supported
      
        # Supported subject types.
        # Corresponds to the JSON property `subject_types_supported`
        # @return [Array<String>]
        attr_accessor :subject_types_supported
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cache_header = args[:cache_header] if args.key?(:cache_header)
          @claims_supported = args[:claims_supported] if args.key?(:claims_supported)
          @grant_types = args[:grant_types] if args.key?(:grant_types)
          @id_token_signing_alg_values_supported = args[:id_token_signing_alg_values_supported] if args.key?(:id_token_signing_alg_values_supported)
          @issuer = args[:issuer] if args.key?(:issuer)
          @jwks_uri = args[:jwks_uri] if args.key?(:jwks_uri)
          @response_types_supported = args[:response_types_supported] if args.key?(:response_types_supported)
          @subject_types_supported = args[:subject_types_supported] if args.key?(:subject_types_supported)
        end
      end
      
      # Configuration options for the horizontal pod autoscaling feature, which
      # increases or decreases the number of replica pods a replication controller
      # has based on the resource usage of the existing pods.
      class HorizontalPodAutoscaling
        include Google::Apis::Core::Hashable
      
        # Whether the Horizontal Pod Autoscaling feature is enabled in the cluster.
        # When enabled, it ensures that a Heapster pod is running in the cluster,
        # which is also used by the Cloud Monitoring service.
        # Corresponds to the JSON property `disabled`
        # @return [Boolean]
        attr_accessor :disabled
        alias_method :disabled?, :disabled
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @disabled = args[:disabled] if args.key?(:disabled)
        end
      end
      
      # RFC-2616: cache control support
      class HttpCacheControlResponseHeader
        include Google::Apis::Core::Hashable
      
        # 14.6 response cache age, in seconds since the response is generated
        # Corresponds to the JSON property `age`
        # @return [Fixnum]
        attr_accessor :age
      
        # 14.9 request and response directives
        # Corresponds to the JSON property `directive`
        # @return [String]
        attr_accessor :directive
      
        # 14.21 response cache expires, in RFC 1123 date format
        # Corresponds to the JSON property `expires`
        # @return [String]
        attr_accessor :expires
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @age = args[:age] if args.key?(:age)
          @directive = args[:directive] if args.key?(:directive)
          @expires = args[:expires] if args.key?(:expires)
        end
      end
      
      # Configuration options for the HTTP (L7) load balancing controller addon,
      # which makes it easy to set up HTTP load balancers for services in a cluster.
      class HttpLoadBalancing
        include Google::Apis::Core::Hashable
      
        # Whether the HTTP Load Balancing controller is enabled in the cluster.
        # When enabled, it runs a small pod in the cluster that manages the load
        # balancers.
        # Corresponds to the JSON property `disabled`
        # @return [Boolean]
        attr_accessor :disabled
        alias_method :disabled?, :disabled
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @disabled = args[:disabled] if args.key?(:disabled)
        end
      end
      
      # Configuration for controlling how IPs are allocated in the cluster.
      class IpAllocationPolicy
        include Google::Apis::Core::Hashable
      
        # This field is deprecated, use cluster_ipv4_cidr_block.
        # Corresponds to the JSON property `clusterIpv4Cidr`
        # @return [String]
        attr_accessor :cluster_ipv4_cidr
      
        # The IP address range for the cluster pod IPs. If this field is set, then
        # `cluster.cluster_ipv4_cidr` must be left blank.
        # This field is only applicable when `use_ip_aliases` is true.
        # Set to blank to have a range chosen with the default size.
        # Set to /netmask (e.g. `/14`) to have a range chosen with a specific
        # netmask.
        # Set to a
        # [CIDR](http://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing)
        # notation (e.g. `10.96.0.0/14`) from the RFC-1918 private networks (e.g.
        # `10.0.0.0/8`, `172.16.0.0/12`, `192.168.0.0/16`) to pick a specific range
        # to use.
        # Corresponds to the JSON property `clusterIpv4CidrBlock`
        # @return [String]
        attr_accessor :cluster_ipv4_cidr_block
      
        # The name of the secondary range to be used for the cluster CIDR
        # block.  The secondary range will be used for pod IP
        # addresses. This must be an existing secondary range associated
        # with the cluster subnetwork.
        # This field is only applicable with use_ip_aliases is true and
        # create_subnetwork is false.
        # Corresponds to the JSON property `clusterSecondaryRangeName`
        # @return [String]
        attr_accessor :cluster_secondary_range_name
      
        # Whether a new subnetwork will be created automatically for the cluster.
        # This field is only applicable when `use_ip_aliases` is true.
        # Corresponds to the JSON property `createSubnetwork`
        # @return [Boolean]
        attr_accessor :create_subnetwork
        alias_method :create_subnetwork?, :create_subnetwork
      
        # This field is deprecated, use node_ipv4_cidr_block.
        # Corresponds to the JSON property `nodeIpv4Cidr`
        # @return [String]
        attr_accessor :node_ipv4_cidr
      
        # The IP address range of the instance IPs in this cluster.
        # This is applicable only if `create_subnetwork` is true.
        # Set to blank to have a range chosen with the default size.
        # Set to /netmask (e.g. `/14`) to have a range chosen with a specific
        # netmask.
        # Set to a
        # [CIDR](http://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing)
        # notation (e.g. `10.96.0.0/14`) from the RFC-1918 private networks (e.g.
        # `10.0.0.0/8`, `172.16.0.0/12`, `192.168.0.0/16`) to pick a specific range
        # to use.
        # Corresponds to the JSON property `nodeIpv4CidrBlock`
        # @return [String]
        attr_accessor :node_ipv4_cidr_block
      
        # This field is deprecated, use services_ipv4_cidr_block.
        # Corresponds to the JSON property `servicesIpv4Cidr`
        # @return [String]
        attr_accessor :services_ipv4_cidr
      
        # The IP address range of the services IPs in this cluster. If blank, a range
        # will be automatically chosen with the default size.
        # This field is only applicable when `use_ip_aliases` is true.
        # Set to blank to have a range chosen with the default size.
        # Set to /netmask (e.g. `/14`) to have a range chosen with a specific
        # netmask.
        # Set to a
        # [CIDR](http://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing)
        # notation (e.g. `10.96.0.0/14`) from the RFC-1918 private networks (e.g.
        # `10.0.0.0/8`, `172.16.0.0/12`, `192.168.0.0/16`) to pick a specific range
        # to use.
        # Corresponds to the JSON property `servicesIpv4CidrBlock`
        # @return [String]
        attr_accessor :services_ipv4_cidr_block
      
        # The name of the secondary range to be used as for the services
        # CIDR block.  The secondary range will be used for service
        # ClusterIPs. This must be an existing secondary range associated
        # with the cluster subnetwork.
        # This field is only applicable with use_ip_aliases is true and
        # create_subnetwork is false.
        # Corresponds to the JSON property `servicesSecondaryRangeName`
        # @return [String]
        attr_accessor :services_secondary_range_name
      
        # A custom subnetwork name to be used if `create_subnetwork` is true.  If
        # this field is empty, then an automatic name will be chosen for the new
        # subnetwork.
        # Corresponds to the JSON property `subnetworkName`
        # @return [String]
        attr_accessor :subnetwork_name
      
        # The IP address range of the Cloud TPUs in this cluster. If unspecified, a
        # range will be automatically chosen with the default size.
        # This field is only applicable when `use_ip_aliases` is true.
        # If unspecified, the range will use the default size.
        # Set to /netmask (e.g. `/14`) to have a range chosen with a specific
        # netmask.
        # Set to a
        # [CIDR](http://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing)
        # notation (e.g. `10.96.0.0/14`) from the RFC-1918 private networks (e.g.
        # `10.0.0.0/8`, `172.16.0.0/12`, `192.168.0.0/16`) to pick a specific range
        # to use.
        # Corresponds to the JSON property `tpuIpv4CidrBlock`
        # @return [String]
        attr_accessor :tpu_ipv4_cidr_block
      
        # Whether alias IPs will be used for pod IPs in the cluster.
        # Corresponds to the JSON property `useIpAliases`
        # @return [Boolean]
        attr_accessor :use_ip_aliases
        alias_method :use_ip_aliases?, :use_ip_aliases
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cluster_ipv4_cidr = args[:cluster_ipv4_cidr] if args.key?(:cluster_ipv4_cidr)
          @cluster_ipv4_cidr_block = args[:cluster_ipv4_cidr_block] if args.key?(:cluster_ipv4_cidr_block)
          @cluster_secondary_range_name = args[:cluster_secondary_range_name] if args.key?(:cluster_secondary_range_name)
          @create_subnetwork = args[:create_subnetwork] if args.key?(:create_subnetwork)
          @node_ipv4_cidr = args[:node_ipv4_cidr] if args.key?(:node_ipv4_cidr)
          @node_ipv4_cidr_block = args[:node_ipv4_cidr_block] if args.key?(:node_ipv4_cidr_block)
          @services_ipv4_cidr = args[:services_ipv4_cidr] if args.key?(:services_ipv4_cidr)
          @services_ipv4_cidr_block = args[:services_ipv4_cidr_block] if args.key?(:services_ipv4_cidr_block)
          @services_secondary_range_name = args[:services_secondary_range_name] if args.key?(:services_secondary_range_name)
          @subnetwork_name = args[:subnetwork_name] if args.key?(:subnetwork_name)
          @tpu_ipv4_cidr_block = args[:tpu_ipv4_cidr_block] if args.key?(:tpu_ipv4_cidr_block)
          @use_ip_aliases = args[:use_ip_aliases] if args.key?(:use_ip_aliases)
        end
      end
      
      # IntraNodeVisibilityConfig contains the desired config of the intra-node
      # visibility on this cluster.
      class IntraNodeVisibilityConfig
        include Google::Apis::Core::Hashable
      
        # Enables intra node visibility for this cluster.
        # Corresponds to the JSON property `enabled`
        # @return [Boolean]
        attr_accessor :enabled
        alias_method :enabled?, :enabled
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @enabled = args[:enabled] if args.key?(:enabled)
        end
      end
      
      # Jwk is a JSON Web Key as specified in RFC 7517
      class Jwk
        include Google::Apis::Core::Hashable
      
        # Algorithm.
        # Corresponds to the JSON property `alg`
        # @return [String]
        attr_accessor :alg
      
        # Used for ECDSA keys.
        # Corresponds to the JSON property `crv`
        # @return [String]
        attr_accessor :crv
      
        # Used for RSA keys.
        # Corresponds to the JSON property `e`
        # @return [String]
        attr_accessor :e
      
        # Key ID.
        # Corresponds to the JSON property `kid`
        # @return [String]
        attr_accessor :kid
      
        # Key Type.
        # Corresponds to the JSON property `kty`
        # @return [String]
        attr_accessor :kty
      
        # Used for RSA keys.
        # Corresponds to the JSON property `n`
        # @return [String]
        attr_accessor :n
      
        # Permitted uses for the public keys.
        # Corresponds to the JSON property `use`
        # @return [String]
        attr_accessor :use
      
        # Used for ECDSA keys.
        # Corresponds to the JSON property `x`
        # @return [String]
        attr_accessor :x
      
        # Used for ECDSA keys.
        # Corresponds to the JSON property `y`
        # @return [String]
        attr_accessor :y
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @alg = args[:alg] if args.key?(:alg)
          @crv = args[:crv] if args.key?(:crv)
          @e = args[:e] if args.key?(:e)
          @kid = args[:kid] if args.key?(:kid)
          @kty = args[:kty] if args.key?(:kty)
          @n = args[:n] if args.key?(:n)
          @use = args[:use] if args.key?(:use)
          @x = args[:x] if args.key?(:x)
          @y = args[:y] if args.key?(:y)
        end
      end
      
      # Configuration for the Kubernetes Dashboard.
      class KubernetesDashboard
        include Google::Apis::Core::Hashable
      
        # Whether the Kubernetes Dashboard is enabled for this cluster.
        # Corresponds to the JSON property `disabled`
        # @return [Boolean]
        attr_accessor :disabled
        alias_method :disabled?, :disabled
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @disabled = args[:disabled] if args.key?(:disabled)
        end
      end
      
      # Configuration for the legacy Attribute Based Access Control authorization
      # mode.
      class LegacyAbac
        include Google::Apis::Core::Hashable
      
        # Whether the ABAC authorizer is enabled for this cluster. When enabled,
        # identities in the system, including service accounts, nodes, and
        # controllers, will have statically granted permissions beyond those
        # provided by the RBAC configuration or IAM.
        # Corresponds to the JSON property `enabled`
        # @return [Boolean]
        attr_accessor :enabled
        alias_method :enabled?, :enabled
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @enabled = args[:enabled] if args.key?(:enabled)
        end
      end
      
      # ListClustersResponse is the result of ListClustersRequest.
      class ListClustersResponse
        include Google::Apis::Core::Hashable
      
        # A list of clusters in the project in the specified zone, or
        # across all ones.
        # Corresponds to the JSON property `clusters`
        # @return [Array<Google::Apis::ContainerV1::Cluster>]
        attr_accessor :clusters
      
        # If any zones are listed here, the list of clusters returned
        # may be missing those zones.
        # Corresponds to the JSON property `missingZones`
        # @return [Array<String>]
        attr_accessor :missing_zones
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @clusters = args[:clusters] if args.key?(:clusters)
          @missing_zones = args[:missing_zones] if args.key?(:missing_zones)
        end
      end
      
      # ListNodePoolsResponse is the result of ListNodePoolsRequest.
      class ListNodePoolsResponse
        include Google::Apis::Core::Hashable
      
        # A list of node pools for a cluster.
        # Corresponds to the JSON property `nodePools`
        # @return [Array<Google::Apis::ContainerV1::NodePool>]
        attr_accessor :node_pools
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @node_pools = args[:node_pools] if args.key?(:node_pools)
        end
      end
      
      # ListOperationsResponse is the result of ListOperationsRequest.
      class ListOperationsResponse
        include Google::Apis::Core::Hashable
      
        # If any zones are listed here, the list of operations returned
        # may be missing the operations from those zones.
        # Corresponds to the JSON property `missingZones`
        # @return [Array<String>]
        attr_accessor :missing_zones
      
        # A list of operations in the project in the specified zone.
        # Corresponds to the JSON property `operations`
        # @return [Array<Google::Apis::ContainerV1::Operation>]
        attr_accessor :operations
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @missing_zones = args[:missing_zones] if args.key?(:missing_zones)
          @operations = args[:operations] if args.key?(:operations)
        end
      end
      
      # ListUsableSubnetworksResponse is the response of
      # ListUsableSubnetworksRequest.
      class ListUsableSubnetworksResponse
        include Google::Apis::Core::Hashable
      
        # This token allows you to get the next page of results for list requests.
        # If the number of results is larger than `page_size`, use the
        # `next_page_token` as a value for the query parameter `page_token` in the
        # next request. The value will become empty when there are no more pages.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # A list of usable subnetworks in the specified network project.
        # Corresponds to the JSON property `subnetworks`
        # @return [Array<Google::Apis::ContainerV1::UsableSubnetwork>]
        attr_accessor :subnetworks
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @subnetworks = args[:subnetworks] if args.key?(:subnetworks)
        end
      end
      
      # MaintenancePolicy defines the maintenance policy to be used for the cluster.
      class MaintenancePolicy
        include Google::Apis::Core::Hashable
      
        # MaintenanceWindow defines the maintenance window to be used for the cluster.
        # Corresponds to the JSON property `window`
        # @return [Google::Apis::ContainerV1::MaintenanceWindow]
        attr_accessor :window
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @window = args[:window] if args.key?(:window)
        end
      end
      
      # MaintenanceWindow defines the maintenance window to be used for the cluster.
      class MaintenanceWindow
        include Google::Apis::Core::Hashable
      
        # Time window specified for daily maintenance operations.
        # Corresponds to the JSON property `dailyMaintenanceWindow`
        # @return [Google::Apis::ContainerV1::DailyMaintenanceWindow]
        attr_accessor :daily_maintenance_window
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @daily_maintenance_window = args[:daily_maintenance_window] if args.key?(:daily_maintenance_window)
        end
      end
      
      # The authentication information for accessing the master endpoint.
      # Authentication can be done using HTTP basic auth or using client
      # certificates.
      class MasterAuth
        include Google::Apis::Core::Hashable
      
        # [Output only] Base64-encoded public certificate used by clients to
        # authenticate to the cluster endpoint.
        # Corresponds to the JSON property `clientCertificate`
        # @return [String]
        attr_accessor :client_certificate
      
        # Configuration for client certificates on the cluster.
        # Corresponds to the JSON property `clientCertificateConfig`
        # @return [Google::Apis::ContainerV1::ClientCertificateConfig]
        attr_accessor :client_certificate_config
      
        # [Output only] Base64-encoded private key used by clients to authenticate
        # to the cluster endpoint.
        # Corresponds to the JSON property `clientKey`
        # @return [String]
        attr_accessor :client_key
      
        # [Output only] Base64-encoded public certificate that is the root of
        # trust for the cluster.
        # Corresponds to the JSON property `clusterCaCertificate`
        # @return [String]
        attr_accessor :cluster_ca_certificate
      
        # The password to use for HTTP basic authentication to the master endpoint.
        # Because the master endpoint is open to the Internet, you should create a
        # strong password.  If a password is provided for cluster creation, username
        # must be non-empty.
        # Corresponds to the JSON property `password`
        # @return [String]
        attr_accessor :password
      
        # The username to use for HTTP basic authentication to the master endpoint.
        # For clusters v1.6.0 and later, basic authentication can be disabled by
        # leaving username unspecified (or setting it to the empty string).
        # Corresponds to the JSON property `username`
        # @return [String]
        attr_accessor :username
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @client_certificate = args[:client_certificate] if args.key?(:client_certificate)
          @client_certificate_config = args[:client_certificate_config] if args.key?(:client_certificate_config)
          @client_key = args[:client_key] if args.key?(:client_key)
          @cluster_ca_certificate = args[:cluster_ca_certificate] if args.key?(:cluster_ca_certificate)
          @password = args[:password] if args.key?(:password)
          @username = args[:username] if args.key?(:username)
        end
      end
      
      # Configuration options for the master authorized networks feature. Enabled
      # master authorized networks will disallow all external traffic to access
      # Kubernetes master through HTTPS except traffic from the given CIDR blocks,
      # Google Compute Engine Public IPs and Google Prod IPs.
      class MasterAuthorizedNetworksConfig
        include Google::Apis::Core::Hashable
      
        # cidr_blocks define up to 50 external networks that could access
        # Kubernetes master through HTTPS.
        # Corresponds to the JSON property `cidrBlocks`
        # @return [Array<Google::Apis::ContainerV1::CidrBlock>]
        attr_accessor :cidr_blocks
      
        # Whether or not master authorized networks is enabled.
        # Corresponds to the JSON property `enabled`
        # @return [Boolean]
        attr_accessor :enabled
        alias_method :enabled?, :enabled
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cidr_blocks = args[:cidr_blocks] if args.key?(:cidr_blocks)
          @enabled = args[:enabled] if args.key?(:enabled)
        end
      end
      
      # Constraints applied to pods.
      class MaxPodsConstraint
        include Google::Apis::Core::Hashable
      
        # Constraint enforced on the max num of pods per node.
        # Corresponds to the JSON property `maxPodsPerNode`
        # @return [Fixnum]
        attr_accessor :max_pods_per_node
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @max_pods_per_node = args[:max_pods_per_node] if args.key?(:max_pods_per_node)
        end
      end
      
      # NetworkConfig reports the relative names of network & subnetwork.
      class NetworkConfig
        include Google::Apis::Core::Hashable
      
        # Whether Intra-node visibility is enabled for this cluster.
        # This makes same node pod to pod traffic visible for VPC network.
        # Corresponds to the JSON property `enableIntraNodeVisibility`
        # @return [Boolean]
        attr_accessor :enable_intra_node_visibility
        alias_method :enable_intra_node_visibility?, :enable_intra_node_visibility
      
        # Output only. The relative name of the Google Compute Engine
        # network(/compute/docs/networks-and-firewalls#networks) to which
        # the cluster is connected.
        # Example: projects/my-project/global/networks/my-network
        # Corresponds to the JSON property `network`
        # @return [String]
        attr_accessor :network
      
        # Output only. The relative name of the Google Compute Engine
        # [subnetwork](/compute/docs/vpc) to which the cluster is connected.
        # Example: projects/my-project/regions/us-central1/subnetworks/my-subnet
        # Corresponds to the JSON property `subnetwork`
        # @return [String]
        attr_accessor :subnetwork
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @enable_intra_node_visibility = args[:enable_intra_node_visibility] if args.key?(:enable_intra_node_visibility)
          @network = args[:network] if args.key?(:network)
          @subnetwork = args[:subnetwork] if args.key?(:subnetwork)
        end
      end
      
      # Configuration options for the NetworkPolicy feature.
      # https://kubernetes.io/docs/concepts/services-networking/networkpolicies/
      class NetworkPolicy
        include Google::Apis::Core::Hashable
      
        # Whether network policy is enabled on the cluster.
        # Corresponds to the JSON property `enabled`
        # @return [Boolean]
        attr_accessor :enabled
        alias_method :enabled?, :enabled
      
        # The selected network policy provider.
        # Corresponds to the JSON property `provider`
        # @return [String]
        attr_accessor :provider
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @enabled = args[:enabled] if args.key?(:enabled)
          @provider = args[:provider] if args.key?(:provider)
        end
      end
      
      # Configuration for NetworkPolicy. This only tracks whether the addon
      # is enabled or not on the Master, it does not track whether network policy
      # is enabled for the nodes.
      class NetworkPolicyConfig
        include Google::Apis::Core::Hashable
      
        # Whether NetworkPolicy is enabled for this cluster.
        # Corresponds to the JSON property `disabled`
        # @return [Boolean]
        attr_accessor :disabled
        alias_method :disabled?, :disabled
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @disabled = args[:disabled] if args.key?(:disabled)
        end
      end
      
      # Parameters that describe the nodes in a cluster.
      class NodeConfig
        include Google::Apis::Core::Hashable
      
        # A list of hardware accelerators to be attached to each node.
        # See https://cloud.google.com/compute/docs/gpus for more information about
        # support for GPUs.
        # Corresponds to the JSON property `accelerators`
        # @return [Array<Google::Apis::ContainerV1::AcceleratorConfig>]
        attr_accessor :accelerators
      
        # Size of the disk attached to each node, specified in GB.
        # The smallest allowed disk size is 10GB.
        # If unspecified, the default disk size is 100GB.
        # Corresponds to the JSON property `diskSizeGb`
        # @return [Fixnum]
        attr_accessor :disk_size_gb
      
        # Type of the disk attached to each node (e.g. 'pd-standard' or 'pd-ssd')
        # If unspecified, the default disk type is 'pd-standard'
        # Corresponds to the JSON property `diskType`
        # @return [String]
        attr_accessor :disk_type
      
        # The image type to use for this node. Note that for a given image type,
        # the latest version of it will be used.
        # Corresponds to the JSON property `imageType`
        # @return [String]
        attr_accessor :image_type
      
        # The map of Kubernetes labels (key/value pairs) to be applied to each node.
        # These will added in addition to any default label(s) that
        # Kubernetes may apply to the node.
        # In case of conflict in label keys, the applied set may differ depending on
        # the Kubernetes version -- it's best to assume the behavior is undefined
        # and conflicts should be avoided.
        # For more information, including usage and the valid values, see:
        # https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # The number of local SSD disks to be attached to the node.
        # The limit for this value is dependent upon the maximum number of
        # disks available on a machine per zone. See:
        # https://cloud.google.com/compute/docs/disks/local-ssd
        # for more information.
        # Corresponds to the JSON property `localSsdCount`
        # @return [Fixnum]
        attr_accessor :local_ssd_count
      
        # The name of a Google Compute Engine [machine
        # type](/compute/docs/machine-types) (e.g.
        # `n1-standard-1`).
        # If unspecified, the default machine type is
        # `n1-standard-1`.
        # Corresponds to the JSON property `machineType`
        # @return [String]
        attr_accessor :machine_type
      
        # The metadata key/value pairs assigned to instances in the cluster.
        # Keys must conform to the regexp [a-zA-Z0-9-_]+ and be less than 128 bytes
        # in length. These are reflected as part of a URL in the metadata server.
        # Additionally, to avoid ambiguity, keys must not conflict with any other
        # metadata keys for the project or be one of the reserved keys:
        # "cluster-location"
        # "cluster-name"
        # "cluster-uid"
        # "configure-sh"
        # "containerd-configure-sh"
        # "enable-os-login"
        # "gci-update-strategy"
        # "gci-ensure-gke-docker"
        # "instance-template"
        # "kube-env"
        # "startup-script"
        # "user-data"
        # "disable-address-manager"
        # "windows-startup-script-ps1"
        # "common-psm1"
        # "k8s-node-setup-psm1"
        # "install-ssh-psm1"
        # "user-profile-psm1"
        # "serial-port-logging-enable"
        # Values are free-form strings, and only have meaning as interpreted by
        # the image running in the instance. The only restriction placed on them is
        # that each value's size must be less than or equal to 32 KB.
        # The total size of all keys and values must be less than 512 KB.
        # Corresponds to the JSON property `metadata`
        # @return [Hash<String,String>]
        attr_accessor :metadata
      
        # Minimum CPU platform to be used by this instance. The instance may be
        # scheduled on the specified or newer CPU platform. Applicable values are the
        # friendly names of CPU platforms, such as
        # <code>minCpuPlatform: &quot;Intel Haswell&quot;</code> or
        # <code>minCpuPlatform: &quot;Intel Sandy Bridge&quot;</code>. For more
        # information, read [how to specify min CPU
        # platform](https://cloud.google.com/compute/docs/instances/specify-min-cpu-
        # platform)
        # Corresponds to the JSON property `minCpuPlatform`
        # @return [String]
        attr_accessor :min_cpu_platform
      
        # The set of Google API scopes to be made available on all of the
        # node VMs under the "default" service account.
        # The following scopes are recommended, but not required, and by default are
        # not included:
        # * `https://www.googleapis.com/auth/compute` is required for mounting
        # persistent storage on your nodes.
        # * `https://www.googleapis.com/auth/devstorage.read_only` is required for
        # communicating with **gcr.io**
        # (the [Google Container Registry](/container-registry/)).
        # If unspecified, no scopes are added, unless Cloud Logging or Cloud
        # Monitoring are enabled, in which case their required scopes will be added.
        # Corresponds to the JSON property `oauthScopes`
        # @return [Array<String>]
        attr_accessor :oauth_scopes
      
        # Whether the nodes are created as preemptible VM instances. See:
        # https://cloud.google.com/compute/docs/instances/preemptible for more
        # information about preemptible VM instances.
        # Corresponds to the JSON property `preemptible`
        # @return [Boolean]
        attr_accessor :preemptible
        alias_method :preemptible?, :preemptible
      
        # The Google Cloud Platform Service Account to be used by the node VMs. If
        # no Service Account is specified, the "default" service account is used.
        # Corresponds to the JSON property `serviceAccount`
        # @return [String]
        attr_accessor :service_account
      
        # A set of Shielded Instance options.
        # Corresponds to the JSON property `shieldedInstanceConfig`
        # @return [Google::Apis::ContainerV1::ShieldedInstanceConfig]
        attr_accessor :shielded_instance_config
      
        # The list of instance tags applied to all nodes. Tags are used to identify
        # valid sources or targets for network firewalls and are specified by
        # the client during cluster or node pool creation. Each tag within the list
        # must comply with RFC1035.
        # Corresponds to the JSON property `tags`
        # @return [Array<String>]
        attr_accessor :tags
      
        # List of kubernetes taints to be applied to each node.
        # For more information, including usage and the valid values, see:
        # https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/
        # Corresponds to the JSON property `taints`
        # @return [Array<Google::Apis::ContainerV1::NodeTaint>]
        attr_accessor :taints
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @accelerators = args[:accelerators] if args.key?(:accelerators)
          @disk_size_gb = args[:disk_size_gb] if args.key?(:disk_size_gb)
          @disk_type = args[:disk_type] if args.key?(:disk_type)
          @image_type = args[:image_type] if args.key?(:image_type)
          @labels = args[:labels] if args.key?(:labels)
          @local_ssd_count = args[:local_ssd_count] if args.key?(:local_ssd_count)
          @machine_type = args[:machine_type] if args.key?(:machine_type)
          @metadata = args[:metadata] if args.key?(:metadata)
          @min_cpu_platform = args[:min_cpu_platform] if args.key?(:min_cpu_platform)
          @oauth_scopes = args[:oauth_scopes] if args.key?(:oauth_scopes)
          @preemptible = args[:preemptible] if args.key?(:preemptible)
          @service_account = args[:service_account] if args.key?(:service_account)
          @shielded_instance_config = args[:shielded_instance_config] if args.key?(:shielded_instance_config)
          @tags = args[:tags] if args.key?(:tags)
          @taints = args[:taints] if args.key?(:taints)
        end
      end
      
      # NodeManagement defines the set of node management services turned on for the
      # node pool.
      class NodeManagement
        include Google::Apis::Core::Hashable
      
        # A flag that specifies whether the node auto-repair is enabled for the node
        # pool. If enabled, the nodes in this node pool will be monitored and, if
        # they fail health checks too many times, an automatic repair action will be
        # triggered.
        # Corresponds to the JSON property `autoRepair`
        # @return [Boolean]
        attr_accessor :auto_repair
        alias_method :auto_repair?, :auto_repair
      
        # A flag that specifies whether node auto-upgrade is enabled for the node
        # pool. If enabled, node auto-upgrade helps keep the nodes in your node pool
        # up to date with the latest release version of Kubernetes.
        # Corresponds to the JSON property `autoUpgrade`
        # @return [Boolean]
        attr_accessor :auto_upgrade
        alias_method :auto_upgrade?, :auto_upgrade
      
        # AutoUpgradeOptions defines the set of options for the user to control how
        # the Auto Upgrades will proceed.
        # Corresponds to the JSON property `upgradeOptions`
        # @return [Google::Apis::ContainerV1::AutoUpgradeOptions]
        attr_accessor :upgrade_options
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @auto_repair = args[:auto_repair] if args.key?(:auto_repair)
          @auto_upgrade = args[:auto_upgrade] if args.key?(:auto_upgrade)
          @upgrade_options = args[:upgrade_options] if args.key?(:upgrade_options)
        end
      end
      
      # NodePool contains the name and configuration for a cluster's node pool.
      # Node pools are a set of nodes (i.e. VM's), with a common configuration and
      # specification, under the control of the cluster master. They may have a set
      # of Kubernetes labels applied to them, which may be used to reference them
      # during pod scheduling. They may also be resized up or down, to accommodate
      # the workload.
      class NodePool
        include Google::Apis::Core::Hashable
      
        # NodePoolAutoscaling contains information required by cluster autoscaler to
        # adjust the size of the node pool to the current cluster usage.
        # Corresponds to the JSON property `autoscaling`
        # @return [Google::Apis::ContainerV1::NodePoolAutoscaling]
        attr_accessor :autoscaling
      
        # Which conditions caused the current node pool state.
        # Corresponds to the JSON property `conditions`
        # @return [Array<Google::Apis::ContainerV1::StatusCondition>]
        attr_accessor :conditions
      
        # Parameters that describe the nodes in a cluster.
        # Corresponds to the JSON property `config`
        # @return [Google::Apis::ContainerV1::NodeConfig]
        attr_accessor :config
      
        # The initial node count for the pool. You must ensure that your
        # Compute Engine <a href="/compute/docs/resource-quotas">resource quota</a>
        # is sufficient for this number of instances. You must also have available
        # firewall and routes quota.
        # Corresponds to the JSON property `initialNodeCount`
        # @return [Fixnum]
        attr_accessor :initial_node_count
      
        # [Output only] The resource URLs of the [managed instance
        # groups](/compute/docs/instance-groups/creating-groups-of-managed-instances)
        # associated with this node pool.
        # Corresponds to the JSON property `instanceGroupUrls`
        # @return [Array<String>]
        attr_accessor :instance_group_urls
      
        # NodeManagement defines the set of node management services turned on for the
        # node pool.
        # Corresponds to the JSON property `management`
        # @return [Google::Apis::ContainerV1::NodeManagement]
        attr_accessor :management
      
        # Constraints applied to pods.
        # Corresponds to the JSON property `maxPodsConstraint`
        # @return [Google::Apis::ContainerV1::MaxPodsConstraint]
        attr_accessor :max_pods_constraint
      
        # The name of the node pool.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # [Output only] The pod CIDR block size per node in this node pool.
        # Corresponds to the JSON property `podIpv4CidrSize`
        # @return [Fixnum]
        attr_accessor :pod_ipv4_cidr_size
      
        # [Output only] Server-defined URL for the resource.
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        # [Output only] The status of the nodes in this pool instance.
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        # [Output only] Additional information about the current status of this
        # node pool instance, if available.
        # Corresponds to the JSON property `statusMessage`
        # @return [String]
        attr_accessor :status_message
      
        # The version of the Kubernetes of this node.
        # Corresponds to the JSON property `version`
        # @return [String]
        attr_accessor :version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @autoscaling = args[:autoscaling] if args.key?(:autoscaling)
          @conditions = args[:conditions] if args.key?(:conditions)
          @config = args[:config] if args.key?(:config)
          @initial_node_count = args[:initial_node_count] if args.key?(:initial_node_count)
          @instance_group_urls = args[:instance_group_urls] if args.key?(:instance_group_urls)
          @management = args[:management] if args.key?(:management)
          @max_pods_constraint = args[:max_pods_constraint] if args.key?(:max_pods_constraint)
          @name = args[:name] if args.key?(:name)
          @pod_ipv4_cidr_size = args[:pod_ipv4_cidr_size] if args.key?(:pod_ipv4_cidr_size)
          @self_link = args[:self_link] if args.key?(:self_link)
          @status = args[:status] if args.key?(:status)
          @status_message = args[:status_message] if args.key?(:status_message)
          @version = args[:version] if args.key?(:version)
        end
      end
      
      # NodePoolAutoscaling contains information required by cluster autoscaler to
      # adjust the size of the node pool to the current cluster usage.
      class NodePoolAutoscaling
        include Google::Apis::Core::Hashable
      
        # Can this node pool be deleted automatically.
        # Corresponds to the JSON property `autoprovisioned`
        # @return [Boolean]
        attr_accessor :autoprovisioned
        alias_method :autoprovisioned?, :autoprovisioned
      
        # Is autoscaling enabled for this node pool.
        # Corresponds to the JSON property `enabled`
        # @return [Boolean]
        attr_accessor :enabled
        alias_method :enabled?, :enabled
      
        # Maximum number of nodes in the NodePool. Must be >= min_node_count. There
        # has to enough quota to scale up the cluster.
        # Corresponds to the JSON property `maxNodeCount`
        # @return [Fixnum]
        attr_accessor :max_node_count
      
        # Minimum number of nodes in the NodePool. Must be >= 1 and <=
        # max_node_count.
        # Corresponds to the JSON property `minNodeCount`
        # @return [Fixnum]
        attr_accessor :min_node_count
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @autoprovisioned = args[:autoprovisioned] if args.key?(:autoprovisioned)
          @enabled = args[:enabled] if args.key?(:enabled)
          @max_node_count = args[:max_node_count] if args.key?(:max_node_count)
          @min_node_count = args[:min_node_count] if args.key?(:min_node_count)
        end
      end
      
      # Kubernetes taint is comprised of three fields: key, value, and effect. Effect
      # can only be one of three types:  NoSchedule, PreferNoSchedule or NoExecute.
      # For more information, including usage and the valid values, see:
      # https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/
      class NodeTaint
        include Google::Apis::Core::Hashable
      
        # Effect for taint.
        # Corresponds to the JSON property `effect`
        # @return [String]
        attr_accessor :effect
      
        # Key for taint.
        # Corresponds to the JSON property `key`
        # @return [String]
        attr_accessor :key
      
        # Value for taint.
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @effect = args[:effect] if args.key?(:effect)
          @key = args[:key] if args.key?(:key)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # This operation resource represents operations that may have happened or are
      # happening on the cluster. All fields are output only.
      class Operation
        include Google::Apis::Core::Hashable
      
        # Which conditions caused the current cluster state.
        # Corresponds to the JSON property `clusterConditions`
        # @return [Array<Google::Apis::ContainerV1::StatusCondition>]
        attr_accessor :cluster_conditions
      
        # Detailed operation progress, if available.
        # Corresponds to the JSON property `detail`
        # @return [String]
        attr_accessor :detail
      
        # [Output only] The time the operation completed, in
        # [RFC3339](https://www.ietf.org/rfc/rfc3339.txt) text format.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # [Output only] The name of the Google Compute Engine
        # [zone](/compute/docs/regions-zones/regions-zones#available) or
        # [region](/compute/docs/regions-zones/regions-zones#available) in which
        # the cluster resides.
        # Corresponds to the JSON property `location`
        # @return [String]
        attr_accessor :location
      
        # The server-assigned ID for the operation.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Which conditions caused the current node pool state.
        # Corresponds to the JSON property `nodepoolConditions`
        # @return [Array<Google::Apis::ContainerV1::StatusCondition>]
        attr_accessor :nodepool_conditions
      
        # The operation type.
        # Corresponds to the JSON property `operationType`
        # @return [String]
        attr_accessor :operation_type
      
        # Server-defined URL for the resource.
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        # [Output only] The time the operation started, in
        # [RFC3339](https://www.ietf.org/rfc/rfc3339.txt) text format.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        # The current status of the operation.
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        # If an error has occurred, a textual description of the error.
        # Corresponds to the JSON property `statusMessage`
        # @return [String]
        attr_accessor :status_message
      
        # Server-defined URL for the target of the operation.
        # Corresponds to the JSON property `targetLink`
        # @return [String]
        attr_accessor :target_link
      
        # The name of the Google Compute Engine
        # [zone](/compute/docs/zones#available) in which the operation
        # is taking place.
        # This field is deprecated, use location instead.
        # Corresponds to the JSON property `zone`
        # @return [String]
        attr_accessor :zone
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cluster_conditions = args[:cluster_conditions] if args.key?(:cluster_conditions)
          @detail = args[:detail] if args.key?(:detail)
          @end_time = args[:end_time] if args.key?(:end_time)
          @location = args[:location] if args.key?(:location)
          @name = args[:name] if args.key?(:name)
          @nodepool_conditions = args[:nodepool_conditions] if args.key?(:nodepool_conditions)
          @operation_type = args[:operation_type] if args.key?(:operation_type)
          @self_link = args[:self_link] if args.key?(:self_link)
          @start_time = args[:start_time] if args.key?(:start_time)
          @status = args[:status] if args.key?(:status)
          @status_message = args[:status_message] if args.key?(:status_message)
          @target_link = args[:target_link] if args.key?(:target_link)
          @zone = args[:zone] if args.key?(:zone)
        end
      end
      
      # Configuration options for private clusters.
      class PrivateClusterConfig
        include Google::Apis::Core::Hashable
      
        # Whether the master's internal IP address is used as the cluster endpoint.
        # Corresponds to the JSON property `enablePrivateEndpoint`
        # @return [Boolean]
        attr_accessor :enable_private_endpoint
        alias_method :enable_private_endpoint?, :enable_private_endpoint
      
        # Whether nodes have internal IP addresses only. If enabled, all nodes are
        # given only RFC 1918 private addresses and communicate with the master via
        # private networking.
        # Corresponds to the JSON property `enablePrivateNodes`
        # @return [Boolean]
        attr_accessor :enable_private_nodes
        alias_method :enable_private_nodes?, :enable_private_nodes
      
        # The IP range in CIDR notation to use for the hosted master network. This
        # range will be used for assigning internal IP addresses to the master or
        # set of masters, as well as the ILB VIP. This range must not overlap with
        # any other ranges in use within the cluster's network.
        # Corresponds to the JSON property `masterIpv4CidrBlock`
        # @return [String]
        attr_accessor :master_ipv4_cidr_block
      
        # Output only. The internal IP address of this cluster's master endpoint.
        # Corresponds to the JSON property `privateEndpoint`
        # @return [String]
        attr_accessor :private_endpoint
      
        # Output only. The external IP address of this cluster's master endpoint.
        # Corresponds to the JSON property `publicEndpoint`
        # @return [String]
        attr_accessor :public_endpoint
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @enable_private_endpoint = args[:enable_private_endpoint] if args.key?(:enable_private_endpoint)
          @enable_private_nodes = args[:enable_private_nodes] if args.key?(:enable_private_nodes)
          @master_ipv4_cidr_block = args[:master_ipv4_cidr_block] if args.key?(:master_ipv4_cidr_block)
          @private_endpoint = args[:private_endpoint] if args.key?(:private_endpoint)
          @public_endpoint = args[:public_endpoint] if args.key?(:public_endpoint)
        end
      end
      
      # Contains information about amount of some resource in the cluster.
      # For memory, value should be in GB.
      class ResourceLimit
        include Google::Apis::Core::Hashable
      
        # Maximum amount of the resource in the cluster.
        # Corresponds to the JSON property `maximum`
        # @return [Fixnum]
        attr_accessor :maximum
      
        # Minimum amount of the resource in the cluster.
        # Corresponds to the JSON property `minimum`
        # @return [Fixnum]
        attr_accessor :minimum
      
        # Resource name "cpu", "memory" or gpu-specific string.
        # Corresponds to the JSON property `resourceType`
        # @return [String]
        attr_accessor :resource_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @maximum = args[:maximum] if args.key?(:maximum)
          @minimum = args[:minimum] if args.key?(:minimum)
          @resource_type = args[:resource_type] if args.key?(:resource_type)
        end
      end
      
      # Configuration for exporting cluster resource usages.
      class ResourceUsageExportConfig
        include Google::Apis::Core::Hashable
      
        # Parameters for using BigQuery as the destination of resource usage export.
        # Corresponds to the JSON property `bigqueryDestination`
        # @return [Google::Apis::ContainerV1::BigQueryDestination]
        attr_accessor :bigquery_destination
      
        # Parameters for controlling consumption metering.
        # Corresponds to the JSON property `consumptionMeteringConfig`
        # @return [Google::Apis::ContainerV1::ConsumptionMeteringConfig]
        attr_accessor :consumption_metering_config
      
        # Whether to enable network egress metering for this cluster. If enabled, a
        # daemonset will be created in the cluster to meter network egress traffic.
        # Corresponds to the JSON property `enableNetworkEgressMetering`
        # @return [Boolean]
        attr_accessor :enable_network_egress_metering
        alias_method :enable_network_egress_metering?, :enable_network_egress_metering
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bigquery_destination = args[:bigquery_destination] if args.key?(:bigquery_destination)
          @consumption_metering_config = args[:consumption_metering_config] if args.key?(:consumption_metering_config)
          @enable_network_egress_metering = args[:enable_network_egress_metering] if args.key?(:enable_network_egress_metering)
        end
      end
      
      # RollbackNodePoolUpgradeRequest rollbacks the previously Aborted or Failed
      # NodePool upgrade. This will be an no-op if the last upgrade successfully
      # completed.
      class RollbackNodePoolUpgradeRequest
        include Google::Apis::Core::Hashable
      
        # Deprecated. The name of the cluster to rollback.
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `clusterId`
        # @return [String]
        attr_accessor :cluster_id
      
        # The name (project, location, cluster, node pool id) of the node poll to
        # rollback upgrade.
        # Specified in the format 'projects/*/locations/*/clusters/*/nodePools/*'.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Deprecated. The name of the node pool to rollback.
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `nodePoolId`
        # @return [String]
        attr_accessor :node_pool_id
      
        # Deprecated. The Google Developers Console [project ID or project
        # number](https://support.google.com/cloud/answer/6158840).
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # Deprecated. The name of the Google Compute Engine
        # [zone](/compute/docs/zones#available) in which the cluster
        # resides.
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `zone`
        # @return [String]
        attr_accessor :zone
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cluster_id = args[:cluster_id] if args.key?(:cluster_id)
          @name = args[:name] if args.key?(:name)
          @node_pool_id = args[:node_pool_id] if args.key?(:node_pool_id)
          @project_id = args[:project_id] if args.key?(:project_id)
          @zone = args[:zone] if args.key?(:zone)
        end
      end
      
      # Kubernetes Engine service configuration.
      class ServerConfig
        include Google::Apis::Core::Hashable
      
        # Version of Kubernetes the service deploys by default.
        # Corresponds to the JSON property `defaultClusterVersion`
        # @return [String]
        attr_accessor :default_cluster_version
      
        # Default image type.
        # Corresponds to the JSON property `defaultImageType`
        # @return [String]
        attr_accessor :default_image_type
      
        # List of valid image types.
        # Corresponds to the JSON property `validImageTypes`
        # @return [Array<String>]
        attr_accessor :valid_image_types
      
        # List of valid master versions.
        # Corresponds to the JSON property `validMasterVersions`
        # @return [Array<String>]
        attr_accessor :valid_master_versions
      
        # List of valid node upgrade target versions.
        # Corresponds to the JSON property `validNodeVersions`
        # @return [Array<String>]
        attr_accessor :valid_node_versions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @default_cluster_version = args[:default_cluster_version] if args.key?(:default_cluster_version)
          @default_image_type = args[:default_image_type] if args.key?(:default_image_type)
          @valid_image_types = args[:valid_image_types] if args.key?(:valid_image_types)
          @valid_master_versions = args[:valid_master_versions] if args.key?(:valid_master_versions)
          @valid_node_versions = args[:valid_node_versions] if args.key?(:valid_node_versions)
        end
      end
      
      # SetAddonsConfigRequest sets the addons associated with the cluster.
      class SetAddonsConfigRequest
        include Google::Apis::Core::Hashable
      
        # Configuration for the addons that can be automatically spun up in the
        # cluster, enabling additional functionality.
        # Corresponds to the JSON property `addonsConfig`
        # @return [Google::Apis::ContainerV1::AddonsConfig]
        attr_accessor :addons_config
      
        # Deprecated. The name of the cluster to upgrade.
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `clusterId`
        # @return [String]
        attr_accessor :cluster_id
      
        # The name (project, location, cluster) of the cluster to set addons.
        # Specified in the format 'projects/*/locations/*/clusters/*'.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Deprecated. The Google Developers Console [project ID or project
        # number](https://support.google.com/cloud/answer/6158840).
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # Deprecated. The name of the Google Compute Engine
        # [zone](/compute/docs/zones#available) in which the cluster
        # resides.
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `zone`
        # @return [String]
        attr_accessor :zone
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @addons_config = args[:addons_config] if args.key?(:addons_config)
          @cluster_id = args[:cluster_id] if args.key?(:cluster_id)
          @name = args[:name] if args.key?(:name)
          @project_id = args[:project_id] if args.key?(:project_id)
          @zone = args[:zone] if args.key?(:zone)
        end
      end
      
      # SetLabelsRequest sets the Google Cloud Platform labels on a Google Container
      # Engine cluster, which will in turn set them for Google Compute Engine
      # resources used by that cluster
      class SetLabelsRequest
        include Google::Apis::Core::Hashable
      
        # Deprecated. The name of the cluster.
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `clusterId`
        # @return [String]
        attr_accessor :cluster_id
      
        # The fingerprint of the previous set of labels for this resource,
        # used to detect conflicts. The fingerprint is initially generated by
        # Kubernetes Engine and changes after every request to modify or update
        # labels. You must always provide an up-to-date fingerprint hash when
        # updating or changing labels. Make a <code>get()</code> request to the
        # resource to get the latest fingerprint.
        # Corresponds to the JSON property `labelFingerprint`
        # @return [String]
        attr_accessor :label_fingerprint
      
        # The name (project, location, cluster id) of the cluster to set labels.
        # Specified in the format 'projects/*/locations/*/clusters/*'.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Deprecated. The Google Developers Console [project ID or project
        # number](https://developers.google.com/console/help/new/#projectnumber).
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # The labels to set for that cluster.
        # Corresponds to the JSON property `resourceLabels`
        # @return [Hash<String,String>]
        attr_accessor :resource_labels
      
        # Deprecated. The name of the Google Compute Engine
        # [zone](/compute/docs/zones#available) in which the cluster
        # resides.
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `zone`
        # @return [String]
        attr_accessor :zone
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cluster_id = args[:cluster_id] if args.key?(:cluster_id)
          @label_fingerprint = args[:label_fingerprint] if args.key?(:label_fingerprint)
          @name = args[:name] if args.key?(:name)
          @project_id = args[:project_id] if args.key?(:project_id)
          @resource_labels = args[:resource_labels] if args.key?(:resource_labels)
          @zone = args[:zone] if args.key?(:zone)
        end
      end
      
      # SetLegacyAbacRequest enables or disables the ABAC authorization mechanism for
      # a cluster.
      class SetLegacyAbacRequest
        include Google::Apis::Core::Hashable
      
        # Deprecated. The name of the cluster to update.
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `clusterId`
        # @return [String]
        attr_accessor :cluster_id
      
        # Whether ABAC authorization will be enabled in the cluster.
        # Corresponds to the JSON property `enabled`
        # @return [Boolean]
        attr_accessor :enabled
        alias_method :enabled?, :enabled
      
        # The name (project, location, cluster id) of the cluster to set legacy abac.
        # Specified in the format 'projects/*/locations/*/clusters/*'.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Deprecated. The Google Developers Console [project ID or project
        # number](https://support.google.com/cloud/answer/6158840).
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # Deprecated. The name of the Google Compute Engine
        # [zone](/compute/docs/zones#available) in which the cluster
        # resides.
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `zone`
        # @return [String]
        attr_accessor :zone
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cluster_id = args[:cluster_id] if args.key?(:cluster_id)
          @enabled = args[:enabled] if args.key?(:enabled)
          @name = args[:name] if args.key?(:name)
          @project_id = args[:project_id] if args.key?(:project_id)
          @zone = args[:zone] if args.key?(:zone)
        end
      end
      
      # SetLocationsRequest sets the locations of the cluster.
      class SetLocationsRequest
        include Google::Apis::Core::Hashable
      
        # Deprecated. The name of the cluster to upgrade.
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `clusterId`
        # @return [String]
        attr_accessor :cluster_id
      
        # The desired list of Google Compute Engine
        # [zones](/compute/docs/zones#available) in which the cluster's nodes
        # should be located. Changing the locations a cluster is in will result
        # in nodes being either created or removed from the cluster, depending on
        # whether locations are being added or removed.
        # This list must always include the cluster's primary zone.
        # Corresponds to the JSON property `locations`
        # @return [Array<String>]
        attr_accessor :locations
      
        # The name (project, location, cluster) of the cluster to set locations.
        # Specified in the format 'projects/*/locations/*/clusters/*'.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Deprecated. The Google Developers Console [project ID or project
        # number](https://support.google.com/cloud/answer/6158840).
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # Deprecated. The name of the Google Compute Engine
        # [zone](/compute/docs/zones#available) in which the cluster
        # resides.
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `zone`
        # @return [String]
        attr_accessor :zone
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cluster_id = args[:cluster_id] if args.key?(:cluster_id)
          @locations = args[:locations] if args.key?(:locations)
          @name = args[:name] if args.key?(:name)
          @project_id = args[:project_id] if args.key?(:project_id)
          @zone = args[:zone] if args.key?(:zone)
        end
      end
      
      # SetLoggingServiceRequest sets the logging service of a cluster.
      class SetLoggingServiceRequest
        include Google::Apis::Core::Hashable
      
        # Deprecated. The name of the cluster to upgrade.
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `clusterId`
        # @return [String]
        attr_accessor :cluster_id
      
        # The logging service the cluster should use to write metrics.
        # Currently available options:
        # * "logging.googleapis.com" - the Google Cloud Logging service
        # * "none" - no metrics will be exported from the cluster
        # Corresponds to the JSON property `loggingService`
        # @return [String]
        attr_accessor :logging_service
      
        # The name (project, location, cluster) of the cluster to set logging.
        # Specified in the format 'projects/*/locations/*/clusters/*'.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Deprecated. The Google Developers Console [project ID or project
        # number](https://support.google.com/cloud/answer/6158840).
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # Deprecated. The name of the Google Compute Engine
        # [zone](/compute/docs/zones#available) in which the cluster
        # resides.
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `zone`
        # @return [String]
        attr_accessor :zone
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cluster_id = args[:cluster_id] if args.key?(:cluster_id)
          @logging_service = args[:logging_service] if args.key?(:logging_service)
          @name = args[:name] if args.key?(:name)
          @project_id = args[:project_id] if args.key?(:project_id)
          @zone = args[:zone] if args.key?(:zone)
        end
      end
      
      # SetMaintenancePolicyRequest sets the maintenance policy for a cluster.
      class SetMaintenancePolicyRequest
        include Google::Apis::Core::Hashable
      
        # The name of the cluster to update.
        # Corresponds to the JSON property `clusterId`
        # @return [String]
        attr_accessor :cluster_id
      
        # MaintenancePolicy defines the maintenance policy to be used for the cluster.
        # Corresponds to the JSON property `maintenancePolicy`
        # @return [Google::Apis::ContainerV1::MaintenancePolicy]
        attr_accessor :maintenance_policy
      
        # The name (project, location, cluster id) of the cluster to set maintenance
        # policy.
        # Specified in the format 'projects/*/locations/*/clusters/*'.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The Google Developers Console [project ID or project
        # number](https://support.google.com/cloud/answer/6158840).
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # The name of the Google Compute Engine
        # [zone](/compute/docs/zones#available) in which the cluster
        # resides.
        # Corresponds to the JSON property `zone`
        # @return [String]
        attr_accessor :zone
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cluster_id = args[:cluster_id] if args.key?(:cluster_id)
          @maintenance_policy = args[:maintenance_policy] if args.key?(:maintenance_policy)
          @name = args[:name] if args.key?(:name)
          @project_id = args[:project_id] if args.key?(:project_id)
          @zone = args[:zone] if args.key?(:zone)
        end
      end
      
      # SetMasterAuthRequest updates the admin password of a cluster.
      class SetMasterAuthRequest
        include Google::Apis::Core::Hashable
      
        # The exact form of action to be taken on the master auth.
        # Corresponds to the JSON property `action`
        # @return [String]
        attr_accessor :action
      
        # Deprecated. The name of the cluster to upgrade.
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `clusterId`
        # @return [String]
        attr_accessor :cluster_id
      
        # The name (project, location, cluster) of the cluster to set auth.
        # Specified in the format 'projects/*/locations/*/clusters/*'.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Deprecated. The Google Developers Console [project ID or project
        # number](https://support.google.com/cloud/answer/6158840).
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # The authentication information for accessing the master endpoint.
        # Authentication can be done using HTTP basic auth or using client
        # certificates.
        # Corresponds to the JSON property `update`
        # @return [Google::Apis::ContainerV1::MasterAuth]
        attr_accessor :update
      
        # Deprecated. The name of the Google Compute Engine
        # [zone](/compute/docs/zones#available) in which the cluster
        # resides.
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `zone`
        # @return [String]
        attr_accessor :zone
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @action = args[:action] if args.key?(:action)
          @cluster_id = args[:cluster_id] if args.key?(:cluster_id)
          @name = args[:name] if args.key?(:name)
          @project_id = args[:project_id] if args.key?(:project_id)
          @update = args[:update] if args.key?(:update)
          @zone = args[:zone] if args.key?(:zone)
        end
      end
      
      # SetMonitoringServiceRequest sets the monitoring service of a cluster.
      class SetMonitoringServiceRequest
        include Google::Apis::Core::Hashable
      
        # Deprecated. The name of the cluster to upgrade.
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `clusterId`
        # @return [String]
        attr_accessor :cluster_id
      
        # The monitoring service the cluster should use to write metrics.
        # Currently available options:
        # * "monitoring.googleapis.com/kubernetes" - the Google Cloud Monitoring
        # service with Kubernetes-native resource model
        # * "monitoring.googleapis.com" - the Google Cloud Monitoring service
        # * "none" - no metrics will be exported from the cluster
        # Corresponds to the JSON property `monitoringService`
        # @return [String]
        attr_accessor :monitoring_service
      
        # The name (project, location, cluster) of the cluster to set monitoring.
        # Specified in the format 'projects/*/locations/*/clusters/*'.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Deprecated. The Google Developers Console [project ID or project
        # number](https://support.google.com/cloud/answer/6158840).
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # Deprecated. The name of the Google Compute Engine
        # [zone](/compute/docs/zones#available) in which the cluster
        # resides.
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `zone`
        # @return [String]
        attr_accessor :zone
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cluster_id = args[:cluster_id] if args.key?(:cluster_id)
          @monitoring_service = args[:monitoring_service] if args.key?(:monitoring_service)
          @name = args[:name] if args.key?(:name)
          @project_id = args[:project_id] if args.key?(:project_id)
          @zone = args[:zone] if args.key?(:zone)
        end
      end
      
      # SetNetworkPolicyRequest enables/disables network policy for a cluster.
      class SetNetworkPolicyRequest
        include Google::Apis::Core::Hashable
      
        # Deprecated. The name of the cluster.
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `clusterId`
        # @return [String]
        attr_accessor :cluster_id
      
        # The name (project, location, cluster id) of the cluster to set networking
        # policy. Specified in the format 'projects/*/locations/*/clusters/*'.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Configuration options for the NetworkPolicy feature.
        # https://kubernetes.io/docs/concepts/services-networking/networkpolicies/
        # Corresponds to the JSON property `networkPolicy`
        # @return [Google::Apis::ContainerV1::NetworkPolicy]
        attr_accessor :network_policy
      
        # Deprecated. The Google Developers Console [project ID or project
        # number](https://developers.google.com/console/help/new/#projectnumber).
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # Deprecated. The name of the Google Compute Engine
        # [zone](/compute/docs/zones#available) in which the cluster
        # resides.
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `zone`
        # @return [String]
        attr_accessor :zone
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cluster_id = args[:cluster_id] if args.key?(:cluster_id)
          @name = args[:name] if args.key?(:name)
          @network_policy = args[:network_policy] if args.key?(:network_policy)
          @project_id = args[:project_id] if args.key?(:project_id)
          @zone = args[:zone] if args.key?(:zone)
        end
      end
      
      # SetNodePoolAutoscalingRequest sets the autoscaler settings of a node pool.
      class SetNodePoolAutoscalingRequest
        include Google::Apis::Core::Hashable
      
        # NodePoolAutoscaling contains information required by cluster autoscaler to
        # adjust the size of the node pool to the current cluster usage.
        # Corresponds to the JSON property `autoscaling`
        # @return [Google::Apis::ContainerV1::NodePoolAutoscaling]
        attr_accessor :autoscaling
      
        # Deprecated. The name of the cluster to upgrade.
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `clusterId`
        # @return [String]
        attr_accessor :cluster_id
      
        # The name (project, location, cluster, node pool) of the node pool to set
        # autoscaler settings. Specified in the format
        # 'projects/*/locations/*/clusters/*/nodePools/*'.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Deprecated. The name of the node pool to upgrade.
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `nodePoolId`
        # @return [String]
        attr_accessor :node_pool_id
      
        # Deprecated. The Google Developers Console [project ID or project
        # number](https://support.google.com/cloud/answer/6158840).
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # Deprecated. The name of the Google Compute Engine
        # [zone](/compute/docs/zones#available) in which the cluster
        # resides.
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `zone`
        # @return [String]
        attr_accessor :zone
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @autoscaling = args[:autoscaling] if args.key?(:autoscaling)
          @cluster_id = args[:cluster_id] if args.key?(:cluster_id)
          @name = args[:name] if args.key?(:name)
          @node_pool_id = args[:node_pool_id] if args.key?(:node_pool_id)
          @project_id = args[:project_id] if args.key?(:project_id)
          @zone = args[:zone] if args.key?(:zone)
        end
      end
      
      # SetNodePoolManagementRequest sets the node management properties of a node
      # pool.
      class SetNodePoolManagementRequest
        include Google::Apis::Core::Hashable
      
        # Deprecated. The name of the cluster to update.
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `clusterId`
        # @return [String]
        attr_accessor :cluster_id
      
        # NodeManagement defines the set of node management services turned on for the
        # node pool.
        # Corresponds to the JSON property `management`
        # @return [Google::Apis::ContainerV1::NodeManagement]
        attr_accessor :management
      
        # The name (project, location, cluster, node pool id) of the node pool to set
        # management properties. Specified in the format
        # 'projects/*/locations/*/clusters/*/nodePools/*'.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Deprecated. The name of the node pool to update.
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `nodePoolId`
        # @return [String]
        attr_accessor :node_pool_id
      
        # Deprecated. The Google Developers Console [project ID or project
        # number](https://support.google.com/cloud/answer/6158840).
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # Deprecated. The name of the Google Compute Engine
        # [zone](/compute/docs/zones#available) in which the cluster
        # resides.
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `zone`
        # @return [String]
        attr_accessor :zone
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cluster_id = args[:cluster_id] if args.key?(:cluster_id)
          @management = args[:management] if args.key?(:management)
          @name = args[:name] if args.key?(:name)
          @node_pool_id = args[:node_pool_id] if args.key?(:node_pool_id)
          @project_id = args[:project_id] if args.key?(:project_id)
          @zone = args[:zone] if args.key?(:zone)
        end
      end
      
      # SetNodePoolSizeRequest sets the size a node
      # pool.
      class SetNodePoolSizeRequest
        include Google::Apis::Core::Hashable
      
        # Deprecated. The name of the cluster to update.
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `clusterId`
        # @return [String]
        attr_accessor :cluster_id
      
        # The name (project, location, cluster, node pool id) of the node pool to set
        # size.
        # Specified in the format 'projects/*/locations/*/clusters/*/nodePools/*'.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The desired node count for the pool.
        # Corresponds to the JSON property `nodeCount`
        # @return [Fixnum]
        attr_accessor :node_count
      
        # Deprecated. The name of the node pool to update.
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `nodePoolId`
        # @return [String]
        attr_accessor :node_pool_id
      
        # Deprecated. The Google Developers Console [project ID or project
        # number](https://support.google.com/cloud/answer/6158840).
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # Deprecated. The name of the Google Compute Engine
        # [zone](/compute/docs/zones#available) in which the cluster
        # resides.
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `zone`
        # @return [String]
        attr_accessor :zone
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cluster_id = args[:cluster_id] if args.key?(:cluster_id)
          @name = args[:name] if args.key?(:name)
          @node_count = args[:node_count] if args.key?(:node_count)
          @node_pool_id = args[:node_pool_id] if args.key?(:node_pool_id)
          @project_id = args[:project_id] if args.key?(:project_id)
          @zone = args[:zone] if args.key?(:zone)
        end
      end
      
      # A set of Shielded Instance options.
      class ShieldedInstanceConfig
        include Google::Apis::Core::Hashable
      
        # Defines whether the instance has integrity monitoring enabled.
        # Enables monitoring and attestation of the boot integrity of the instance.
        # The attestation is performed against the integrity policy baseline. This
        # baseline is initially derived from the implicitly trusted boot image when
        # the instance is created.
        # Corresponds to the JSON property `enableIntegrityMonitoring`
        # @return [Boolean]
        attr_accessor :enable_integrity_monitoring
        alias_method :enable_integrity_monitoring?, :enable_integrity_monitoring
      
        # Defines whether the instance has Secure Boot enabled.
        # Secure Boot helps ensure that the system only runs authentic software by
        # verifying the digital signature of all boot components, and halting the
        # boot process if signature verification fails.
        # Corresponds to the JSON property `enableSecureBoot`
        # @return [Boolean]
        attr_accessor :enable_secure_boot
        alias_method :enable_secure_boot?, :enable_secure_boot
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @enable_integrity_monitoring = args[:enable_integrity_monitoring] if args.key?(:enable_integrity_monitoring)
          @enable_secure_boot = args[:enable_secure_boot] if args.key?(:enable_secure_boot)
        end
      end
      
      # StartIPRotationRequest creates a new IP for the cluster and then performs
      # a node upgrade on each node pool to point to the new IP.
      class StartIpRotationRequest
        include Google::Apis::Core::Hashable
      
        # Deprecated. The name of the cluster.
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `clusterId`
        # @return [String]
        attr_accessor :cluster_id
      
        # The name (project, location, cluster id) of the cluster to start IP
        # rotation. Specified in the format 'projects/*/locations/*/clusters/*'.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Deprecated. The Google Developers Console [project ID or project
        # number](https://developers.google.com/console/help/new/#projectnumber).
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # Whether to rotate credentials during IP rotation.
        # Corresponds to the JSON property `rotateCredentials`
        # @return [Boolean]
        attr_accessor :rotate_credentials
        alias_method :rotate_credentials?, :rotate_credentials
      
        # Deprecated. The name of the Google Compute Engine
        # [zone](/compute/docs/zones#available) in which the cluster
        # resides.
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `zone`
        # @return [String]
        attr_accessor :zone
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cluster_id = args[:cluster_id] if args.key?(:cluster_id)
          @name = args[:name] if args.key?(:name)
          @project_id = args[:project_id] if args.key?(:project_id)
          @rotate_credentials = args[:rotate_credentials] if args.key?(:rotate_credentials)
          @zone = args[:zone] if args.key?(:zone)
        end
      end
      
      # StatusCondition describes why a cluster or a node pool has a certain status
      # (e.g., ERROR or DEGRADED).
      class StatusCondition
        include Google::Apis::Core::Hashable
      
        # Machine-friendly representation of the condition
        # Corresponds to the JSON property `code`
        # @return [String]
        attr_accessor :code
      
        # Human-friendly representation of the condition
        # Corresponds to the JSON property `message`
        # @return [String]
        attr_accessor :message
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @code = args[:code] if args.key?(:code)
          @message = args[:message] if args.key?(:message)
        end
      end
      
      # UpdateClusterRequest updates the settings of a cluster.
      class UpdateClusterRequest
        include Google::Apis::Core::Hashable
      
        # Deprecated. The name of the cluster to upgrade.
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `clusterId`
        # @return [String]
        attr_accessor :cluster_id
      
        # The name (project, location, cluster) of the cluster to update.
        # Specified in the format 'projects/*/locations/*/clusters/*'.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Deprecated. The Google Developers Console [project ID or project
        # number](https://support.google.com/cloud/answer/6158840).
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # ClusterUpdate describes an update to the cluster. Exactly one update can
        # be applied to a cluster with each request, so at most one field can be
        # provided.
        # Corresponds to the JSON property `update`
        # @return [Google::Apis::ContainerV1::ClusterUpdate]
        attr_accessor :update
      
        # Deprecated. The name of the Google Compute Engine
        # [zone](/compute/docs/zones#available) in which the cluster
        # resides.
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `zone`
        # @return [String]
        attr_accessor :zone
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cluster_id = args[:cluster_id] if args.key?(:cluster_id)
          @name = args[:name] if args.key?(:name)
          @project_id = args[:project_id] if args.key?(:project_id)
          @update = args[:update] if args.key?(:update)
          @zone = args[:zone] if args.key?(:zone)
        end
      end
      
      # UpdateMasterRequest updates the master of the cluster.
      class UpdateMasterRequest
        include Google::Apis::Core::Hashable
      
        # Deprecated. The name of the cluster to upgrade.
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `clusterId`
        # @return [String]
        attr_accessor :cluster_id
      
        # The Kubernetes version to change the master to.
        # Users may specify either explicit versions offered by Kubernetes Engine or
        # version aliases, which have the following behavior:
        # - "latest": picks the highest valid Kubernetes version
        # - "1.X": picks the highest valid patch+gke.N patch in the 1.X version
        # - "1.X.Y": picks the highest valid gke.N patch in the 1.X.Y version
        # - "1.X.Y-gke.N": picks an explicit Kubernetes version
        # - "-": picks the default Kubernetes version
        # Corresponds to the JSON property `masterVersion`
        # @return [String]
        attr_accessor :master_version
      
        # The name (project, location, cluster) of the cluster to update.
        # Specified in the format 'projects/*/locations/*/clusters/*'.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Deprecated. The Google Developers Console [project ID or project
        # number](https://support.google.com/cloud/answer/6158840).
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # Deprecated. The name of the Google Compute Engine
        # [zone](/compute/docs/zones#available) in which the cluster
        # resides.
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `zone`
        # @return [String]
        attr_accessor :zone
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cluster_id = args[:cluster_id] if args.key?(:cluster_id)
          @master_version = args[:master_version] if args.key?(:master_version)
          @name = args[:name] if args.key?(:name)
          @project_id = args[:project_id] if args.key?(:project_id)
          @zone = args[:zone] if args.key?(:zone)
        end
      end
      
      # UpdateNodePoolRequests update a node pool's image and/or version.
      class UpdateNodePoolRequest
        include Google::Apis::Core::Hashable
      
        # Deprecated. The name of the cluster to upgrade.
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `clusterId`
        # @return [String]
        attr_accessor :cluster_id
      
        # The desired image type for the node pool.
        # Corresponds to the JSON property `imageType`
        # @return [String]
        attr_accessor :image_type
      
        # The name (project, location, cluster, node pool) of the node pool to
        # update. Specified in the format
        # 'projects/*/locations/*/clusters/*/nodePools/*'.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Deprecated. The name of the node pool to upgrade.
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `nodePoolId`
        # @return [String]
        attr_accessor :node_pool_id
      
        # The Kubernetes version to change the nodes to (typically an
        # upgrade).
        # Users may specify either explicit versions offered by Kubernetes Engine or
        # version aliases, which have the following behavior:
        # - "latest": picks the highest valid Kubernetes version
        # - "1.X": picks the highest valid patch+gke.N patch in the 1.X version
        # - "1.X.Y": picks the highest valid gke.N patch in the 1.X.Y version
        # - "1.X.Y-gke.N": picks an explicit Kubernetes version
        # - "-": picks the Kubernetes master version
        # Corresponds to the JSON property `nodeVersion`
        # @return [String]
        attr_accessor :node_version
      
        # Deprecated. The Google Developers Console [project ID or project
        # number](https://support.google.com/cloud/answer/6158840).
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # Deprecated. The name of the Google Compute Engine
        # [zone](/compute/docs/zones#available) in which the cluster
        # resides.
        # This field has been deprecated and replaced by the name field.
        # Corresponds to the JSON property `zone`
        # @return [String]
        attr_accessor :zone
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cluster_id = args[:cluster_id] if args.key?(:cluster_id)
          @image_type = args[:image_type] if args.key?(:image_type)
          @name = args[:name] if args.key?(:name)
          @node_pool_id = args[:node_pool_id] if args.key?(:node_pool_id)
          @node_version = args[:node_version] if args.key?(:node_version)
          @project_id = args[:project_id] if args.key?(:project_id)
          @zone = args[:zone] if args.key?(:zone)
        end
      end
      
      # UsableSubnetwork resource returns the subnetwork name, its associated network
      # and the primary CIDR range.
      class UsableSubnetwork
        include Google::Apis::Core::Hashable
      
        # The range of internal addresses that are owned by this subnetwork.
        # Corresponds to the JSON property `ipCidrRange`
        # @return [String]
        attr_accessor :ip_cidr_range
      
        # Network Name.
        # Example: projects/my-project/global/networks/my-network
        # Corresponds to the JSON property `network`
        # @return [String]
        attr_accessor :network
      
        # Secondary IP ranges.
        # Corresponds to the JSON property `secondaryIpRanges`
        # @return [Array<Google::Apis::ContainerV1::UsableSubnetworkSecondaryRange>]
        attr_accessor :secondary_ip_ranges
      
        # A human readable status message representing the reasons for cases where
        # the caller cannot use the secondary ranges under the subnet. For example if
        # the secondary_ip_ranges is empty due to a permission issue, an insufficient
        # permission message will be given by status_message.
        # Corresponds to the JSON property `statusMessage`
        # @return [String]
        attr_accessor :status_message
      
        # Subnetwork Name.
        # Example: projects/my-project/regions/us-central1/subnetworks/my-subnet
        # Corresponds to the JSON property `subnetwork`
        # @return [String]
        attr_accessor :subnetwork
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @ip_cidr_range = args[:ip_cidr_range] if args.key?(:ip_cidr_range)
          @network = args[:network] if args.key?(:network)
          @secondary_ip_ranges = args[:secondary_ip_ranges] if args.key?(:secondary_ip_ranges)
          @status_message = args[:status_message] if args.key?(:status_message)
          @subnetwork = args[:subnetwork] if args.key?(:subnetwork)
        end
      end
      
      # Secondary IP range of a usable subnetwork.
      class UsableSubnetworkSecondaryRange
        include Google::Apis::Core::Hashable
      
        # The range of IP addresses belonging to this subnetwork secondary range.
        # Corresponds to the JSON property `ipCidrRange`
        # @return [String]
        attr_accessor :ip_cidr_range
      
        # The name associated with this subnetwork secondary range, used when adding
        # an alias IP range to a VM instance.
        # Corresponds to the JSON property `rangeName`
        # @return [String]
        attr_accessor :range_name
      
        # This field is to determine the status of the secondary range programmably.
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @ip_cidr_range = args[:ip_cidr_range] if args.key?(:ip_cidr_range)
          @range_name = args[:range_name] if args.key?(:range_name)
          @status = args[:status] if args.key?(:status)
        end
      end
      
      # VerticalPodAutoscaling contains global, per-cluster information
      # required by Vertical Pod Autoscaler to automatically adjust
      # the resources of pods controlled by it.
      class VerticalPodAutoscaling
        include Google::Apis::Core::Hashable
      
        # Enables vertical pod autoscaling.
        # Corresponds to the JSON property `enabled`
        # @return [Boolean]
        attr_accessor :enabled
        alias_method :enabled?, :enabled
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @enabled = args[:enabled] if args.key?(:enabled)
        end
      end
    end
  end
end
