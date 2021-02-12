+++
title = "google_container_regional_cluster resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_container_regional_cluster"
    identifier = "inspec/resources/gcp/google_container_regional_cluster.md google_container_regional_cluster resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_container_regional_cluster` is used to test a Google RegionalCluster resource

## Examples

```ruby
describe google_container_regional_cluster(project: 'chef-gcp-inspec', location: 'europe-west2', name: 'inspec-gcp-regional-cluster') do
  it { should exist }
  its('initial_node_count') { should eq '1'}
  its('location') { should eq 'europe-west2'}
end

describe google_container_regional_cluster(project: 'chef-gcp-inspec', location: 'europe-west2', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_container_regional_cluster` resource:

`name`
: The name of this cluster. The name must be unique within this project and location, and can be up to 40 characters. Must be Lowercase letters, numbers, and hyphens only. Must start with a letter. Must end with a number or a letter.

`description`
: An optional description of this cluster.

`initial_node_count`
: The number of nodes to create in this cluster. You must ensure that your Compute Engine resource quota is sufficient for this number of instances. You must also have available firewall and routes quota. For requests, this field should only be used in lieu of a "nodePool" object, since this configuration (along with the "nodeConfig") will be used to create a "NodePool" object with an auto-generated name. Do not use this and a nodePool at the same time. This field has been deprecated. Please use nodePool.initial_node_count instead.

`node_config`
: Parameters used in creating the cluster's nodes. For requests, this field should only be used in lieu of a "nodePool" object, since this configuration (along with the "initialNodeCount") will be used to create a "NodePool" object with an auto-generated name. Do not use this and a nodePool at the same time. For responses, this field will be populated with the node configuration of the first node pool. If unspecified, the defaults are used.

`machine_type`
: The name of a Google Compute Engine machine type (e.g. n1-standard-1). If unspecified, the default machine type is n1-standard-1.

`disk_size_gb`
: Size of the disk attached to each node, specified in GB. The smallest allowed disk size is 10GB. If unspecified, the default disk size is 100GB.

`oauth_scopes`
: The set of Google API scopes to be made available on all of the node VMs under the "default" service account. The following scopes are recommended, but not required, and by default are not included: https://www.googleapis.com/auth/compute is required for mounting persistent storage on your nodes. https://www.googleapis.com/auth/devstorage.read_only is required for communicating with gcr.io (the Google Container Registry). If unspecified, no scopes are added, unless Cloud Logging or Cloud Monitoring are enabled, in which case their required scopes will be added.

`service_account`
: The Google Cloud Platform Service Account to be used by the node VMs. If no Service Account is specified, the "default" service account is used.

`metadata`
: The metadata key/value pairs assigned to instances in the cluster. Keys must conform to the regexp [a-zA-Z0-9-_]+ and be less than 128 bytes in length. These are reflected as part of a URL in the metadata server. Additionally, to avoid ambiguity, keys must not conflict with any other metadata keys for the project or be one of the four reserved keys: "instance-template", "kube-env", "startup-script", and "user-data" Values are free-form strings, and only have meaning as interpreted by the image running in the instance. The only restriction placed on them is that each value's size must be less than or equal to 32 KB. The total size of all keys and values must be less than 512 KB. An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }.

`image_type`
: The image type to use for this node. Note that for a given image type, the latest version of it will be used.

`labels`
: The map of Kubernetes labels (key/value pairs) to be applied to each node. These will added in addition to any default label(s) that Kubernetes may apply to the node. In case of conflict in label keys, the applied set may differ depending on the Kubernetes version -- it's best to assume the behavior is undefined and conflicts should be avoided. For more information, including usage and the valid values, see: http://kubernetes.io/v1.1/docs/user-guide/labels.html An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }.

`local_ssd_count`
: The number of local SSD disks to be attached to the node. The limit for this value is dependant upon the maximum number of disks available on a machine per zone. See: https://cloud.google.com/compute/docs/disks/local-ssd#local_ssd_limits for more information.

`tags`
: The list of instance tags applied to all nodes. Tags are used to identify valid sources or targets for network firewalls and are specified by the client during cluster or node pool creation. Each tag within the list must comply with RFC1035.

`preemptible`
: Whether the nodes are created as preemptible VM instances. See: https://cloud.google.com/compute/docs/instances/preemptible for more information about preemptible VM instances.

`accelerators`
: A list of hardware accelerators to be attached to each node. See https://cloud.google.com/compute/docs/gpus for more information about support for GPUs.

  `accelerator_count`
  : The number of accelerator cards exposed to an instance.

  `accelerator_type`
  : The accelerator type resource name

`disk_type`
: Type of the disk attached to each node (e.g. 'pd-standard' or 'pd-ssd') If unspecified, the default disk type is 'pd-standard'

`min_cpu_platform`
: Minimum CPU platform to be used by this instance. The instance may be scheduled on the specified or newer CPU platform.

`taints`
: List of kubernetes taints to be applied to each node. For more information, including usage and the valid values, see: https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/

  `key`
  : Key for taint

  `value`
  : Value for taint

  `effect`
  : Effect for taint

`master_auth`
: The authentication information for accessing the master endpoint.

  `username`
  : The username to use for HTTP basic authentication to the master endpoint.

  `password`
  : The password to use for HTTP basic authentication to the master endpoint. Because the master endpoint is open to the Internet, you should create a strong password with a minimum of 16 characters.

  `client_certificate_config`
  : Configuration for client certificate authentication on the cluster. For clusters before v1.12, if no configuration is specified, a client certificate is issued.

    `issue_client_certificate`
    : Issue a client certificate.

  `cluster_ca_certificate`
  : Base64-encoded public certificate that is the root of trust for the cluster.

  `client_certificate`
  : Base64-encoded public certificate used by clients to authenticate to the cluster endpoint.

  `client_key`
  : Base64-encoded private key used by clients to authenticate to the cluster endpoint.

`logging_service`
: The logging service the cluster should use to write logs. Currently available options: logging.googleapis.com - the Google Cloud Logging service. none - no logs will be exported from the cluster. if left as an empty string,logging.googleapis.com will be used.

`monitoring_service`
: The monitoring service the cluster should use to write metrics. Currently available options: monitoring.googleapis.com - the Google Cloud Monitoring service. none - no metrics will be exported from the cluster. if left as an empty string, monitoring.googleapis.com will be used.

`network`
: The name of the Google Compute Engine network to which the cluster is connected. If left unspecified, the default network will be used.

`private_cluster_config`
: Configuration for a private cluster.

`enable_private_nodes`
: Whether nodes have internal IP addresses only. If enabled, all nodes are given only RFC 1918 private addresses and communicate with the master via private networking.

`enable_private_endpoint`
: Whether the master's internal IP address is used as the cluster endpoint.

`master_ipv4_cidr_block`
: The IP range in CIDR notation to use for the hosted master network. This range will be used for assigning internal IP addresses to the master or set of masters, as well as the ILB VIP. This range must not overlap with any other ranges in use within the cluster's network.

`private_endpoint`
: The internal IP address of this cluster's master endpoint.

`public_endpoint`
: The external IP address of this cluster's master endpoint.

`cluster_ipv4_cidr`
: The IP address range of the container pods in this cluster, in CIDR notation (e.g. 10.96.0.0/14). Leave blank to have one automatically chosen or specify a /14 block in 10.0.0.0/8.

`enable_tpu`
: (Optional) Whether to enable Cloud TPU resources in this cluster. See the official documentation - https://cloud.google.com/tpu/docs/kubernetes-engine-setup

`tpu_ipv4_cidr_block`
: The IP address range of the Cloud TPUs in this cluster, in [CIDR](http://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing) notation (e.g. `1.2.3.4/29`).

`addons_config`
: Configurations for the various addons available to run in the cluster.

`http_load_balancing`
: Configuration for the HTTP (L7) load balancing controller addon, which makes it easy to set up HTTP load balancers for services in a cluster.

  `disabled`
  : Whether the HTTP Load Balancing controller is enabled in the cluster. When enabled, it runs a small pod in the cluster that manages the load balancers.

`horizontal_pod_autoscaling`
: Configuration for the horizontal pod autoscaling feature, which increases or decreases the number of replica pods a replication controller has based on the resource usage of the existing pods.

  `disabled`
  : Whether the Horizontal Pod Autoscaling feature is enabled in the cluster. When enabled, it ensures that a Heapster pod is running in the cluster, which is also used by the Cloud Monitoring service.

`kubernetes_dashboard`
: Configuration for the Kubernetes Dashboard. This addon is deprecated, and will be disabled in 1.15. It is recommended to use the Cloud Console to manage and monitor your Kubernetes clusters, workloads and applications.

  `disabled`
  : Whether the Kubernetes Dashboard is enabled for this cluster.

`network_policy_config`
: Configuration for NetworkPolicy. This only tracks whether the addon is enabled or not on the Master, it does not track whether network policy is enabled for the nodes.

  `disabled`
  : Whether NetworkPolicy is enabled for this cluster.

`subnetwork`
: The name of the Google Compute Engine subnetwork to which the cluster is connected.

`locations`
: The list of Google Compute Engine zones in which the cluster's nodes should be located.

`resource_labels`
: The resource labels for the cluster to use to annotate any related Google Compute Engine resources.

`label_fingerprint`
: The fingerprint of the set of labels for this cluster.

`legacy_abac`
: Configuration for the legacy ABAC authorization mode.

`enabled`
: Whether the ABAC authorizer is enabled for this cluster. When enabled, identities in the system, including service accounts, nodes, and controllers, will have statically granted permissions beyond those provided by the RBAC configuration or IAM.

`network_policy`
: Configuration options for the NetworkPolicy feature.

`provider`
: The selected network policy provider.

`enabled`
: Whether network policy is enabled on the cluster.

`default_max_pods_constraint`
: The default constraint on the maximum number of pods that can be run simultaneously on a node in the node pool of this cluster. Only honored if cluster created with IP Alias support.

`max_pods_per_node`
: Constraint enforced on the max num of pods per node.

`ip_allocation_policy`
: Configuration for controlling how IPs are allocated in the cluster

`use_ip_aliases`
: Whether alias IPs will be used for pod IPs in the cluster

`create_subnetwork`
: Whether a new subnetwork will be created automatically for the cluster

`subnetwork_name`
: A custom subnetwork name to be used if createSubnetwork is true. If this field is empty, then an automatic name will be chosen for the new subnetwork.

`cluster_secondary_range_name`
: The name of the secondary range to be used for the cluster CIDR block. The secondary range will be used for pod IP addresses. This must be an existing secondary range associated with the cluster subnetwork

`services_secondary_range_name`
: The name of the secondary range to be used as for the services CIDR block. The secondary range will be used for service ClusterIPs. This must be an existing secondary range associated with the cluster subnetwork.

`cluster_ipv4_cidr_block`
: The IP address range for the cluster pod IPs. If this field is set, then cluster.cluster_ipv4_cidr must be left blank. This field is only applicable when useIpAliases is true. Set to blank to have a range chosen with the default size. Set to /netmask (e.g. /14) to have a range chosen with a specific netmask.

`node_ipv4_cidr_block`
: The IP address range of the instance IPs in this cluster. This is applicable only if createSubnetwork is true. Set to blank to have a range chosen with the default size. Set to /netmask (e.g. /14) to have a range chosen with a specific netmask.

`services_ipv4_cidr_block`
: The IP address range of the services IPs in this cluster. If blank, a range will be automatically chosen with the default size. This field is only applicable when useIpAliases is true. Set to blank to have a range chosen with the default size. Set to /netmask (e.g. /14) to have a range chosen with a specific netmask.

`tpu_ipv4_cidr_block`
: The IP address range of the Cloud TPUs in this cluster. If unspecified, a range will be automatically chosen with the default size. This field is only applicable when useIpAliases is true. If unspecified, the range will use the default size. Set to /netmask (e.g. /14) to have a range chosen with a specific netmask.

`endpoint`
: The IP address of this cluster's master endpoint. The endpoint can be accessed from the internet at https://username:password@endpoint/ See the masterAuth property of this resource for username and password information.

`initial_cluster_version`
: The software version of the master endpoint and kubelets used in the cluster when it was first created. The version can be upgraded over time.

`current_master_version`
: The current software version of the master endpoint.

`current_node_version`
: The current version of the node software components. If they are currently at multiple versions because they're in the process of being upgraded, this reflects the minimum version of all nodes.

`create_time`
: The time the cluster was created, in RFC3339 text format.

`status`
: The current status of this cluster.

`status_message`
: Additional information about the current status of this cluster, if available.

`node_ipv4_cidr_size`
: The size of the address space on each node for hosting containers. This is provisioned from within the container_ipv4_cidr range.

`services_ipv4_cidr`
: The IP address range of the Kubernetes services in this cluster, in CIDR notation (e.g. 1.2.3.4/29). Service addresses are typically put in the last /16 from the container CIDR.

`current_node_count`
: The number of nodes currently in the cluster.

`expire_time`
: The time the cluster will be automatically deleted in RFC3339 text format.

`conditions`
: Which conditions caused the current cluster state.

`code`
: Machine-friendly representation of the condition

`message`
: Human-friendly representation of the condition

`master_authorized_networks_config`
: Configuration for controlling how IPs are allocated in the cluster

`enabled`
: Whether or not master authorized networks is enabled.

`cidr_blocks`
: Define up to 50 external networks that could access Kubernetes master through HTTPS.

  `display_name`
  : Optional field used to identify cidr blocks

  `cidr_block`
  : Block specified in CIDR notation

`location`
: The location where the cluster is deployed

## GCP Permissions

Ensure the [Kubernetes Engine API](https://console.cloud.google.com/apis/library/container.googleapis.com/) is enabled for the current project.
