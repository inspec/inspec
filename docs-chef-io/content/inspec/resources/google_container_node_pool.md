+++
title = "google_container_node_pool resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_container_node_pool"
    identifier = "inspec/resources/gcp/google_container_node_pool.md google_container_node_pool resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_container_node_pool` is used to test a Google NodePool resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_container_node_pool(project: 'chef-gcp-inspec', location: 'europe-west2-a', cluster_name: 'gcp-inspec-kube-cluster', nodepool_name: 'inspec-gcp-regional-node-pool') do
  it { should exist }
  its('initial_node_count') { should eq '1'}
end

describe google_container_node_pool(project: 'chef-gcp-inspec', location: 'europe-west2-a', cluster_name: 'gcp-inspec-kube-cluster', nodepool_name: 'nonexistent') do
  it { should_not exist }
end
```

### Test that a GCP container node pool is in a particular state e.g. "RUNNING"

    describe google_container_node_pool(project: 'chef-inspec-gcp', locations: 'europe-west2-a', cluster_name: 'inspec-gcp-kube-cluster', nodepool_name: 'inspec-gcp-kube-node-pool') do
      its('status') { should eq 'RUNNING' }
    end

### Test GCP container node pool disk size in GB is as expected

    describe google_container_node_pool(project: 'chef-inspec-gcp', locations: 'europe-west2-a', cluster_name: 'inspec-gcp-kube-cluster', nodepool_name: 'inspec-gcp-kube-node-pool') do
      its('node_config.disk_size_gb'){should eq 100}
    end

### Test GCP container node pool machine type is as expected

    describe google_container_node_pool(project: 'chef-inspec-gcp', locations: 'europe-west2-a', cluster_name: 'inspec-gcp-kube-cluster', nodepool_name: 'inspec-gcp-kube-node-pool') do
      its('node_config.machine_type'){should eq "n1-standard-1"}
    end

### Test GCP container node pool node image type is as expected

    describe google_container_node_pool(project: 'chef-inspec-gcp', locations: 'europe-west2-a', cluster_name: 'inspec-gcp-kube-cluster', nodepool_name: 'inspec-gcp-kube-node-pool') do
      its('node_config.image_type'){should eq "COS"}
    end

### Test GCP container node pool initial node count is as expected

    describe google_container_node_pool(project: 'chef-inspec-gcp', locations: 'europe-west2-a', cluster_name: 'inspec-gcp-kube-cluster', nodepool_name: 'inspec-gcp-kube-node-pool') do
      its('initial_node_count'){should eq 3}
    end

## Properties

Properties that can be accessed from the `google_container_node_pool` resource:

`name`
: The name of the node pool.

`config`
: The node configuration of the pool.

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
: A list of hardware accelerators to be attached to each node

  `accelerator_count`
  : The number of the accelerator cards exposed to an instance.

  `accelerator_type`
  : The accelerator type resource name

`disk_type`
: Type of the disk attached to each node (e.g. 'pd-standard' or 'pd-ssd') If unspecified, the default disk type is 'pd-standard'

`min_cpu_platform`
: Minimum CPU platform to be used by this instance. The instance may be scheduled on the specified or newer CPU platform

`taints`
: List of kubernetes taints to be applied to each node.

  `key`
  : Key for taint

  `value`
  : Value for taint

  `effect`
  : Effect for taint

`initial_node_count`
: The initial node count for the pool. You must ensure that your Compute Engine resource quota is sufficient for this number of instances. You must also have available firewall and routes quota.

`status`
: Status of nodes in this pool instance

`status_message`
: Additional information about the current status of this node pool instance

`version`
: The version of the Kubernetes of this node.

`autoscaling`
: Autoscaler configuration for this NodePool. Autoscaler is enabled only if a valid configuration is present.

`enabled`
: Is autoscaling enabled for this node pool.

`min_node_count`
: Minimum number of nodes in the NodePool. Must be >= 1 and <= maxNodeCount.

`max_node_count`
: Maximum number of nodes in the NodePool. Must be >= minNodeCount. There has to enough quota to scale up the cluster.

`management`
: Management configuration for this NodePool.

`auto_upgrade`
: A flag that specifies whether node auto-upgrade is enabled for the node pool. If enabled, node auto-upgrade helps keep the nodes in your node pool up to date with the latest release version of Kubernetes.

`auto_repair`
: A flag that specifies whether the node auto-repair is enabled for the node pool. If enabled, the nodes in this node pool will be monitored and, if they fail health checks too many times, an automatic repair action will be triggered.

`upgrade_options`
: Specifies the Auto Upgrade knobs for the node pool.

  `auto_upgrade_start_time`
  : This field is set when upgrades are about to commence with the approximate start time for the upgrades, in RFC3339 text format.

  `description`
  : This field is set when upgrades are about to commence with the description of the upgrade.

`max_pods_constraint`
: The constraint on the maximum number of pods that can be run simultaneously on a node in the node pool.

`max_pods_per_node`
: Constraint enforced on the max num of pods per node.

`conditions`
: Which conditions caused the current node pool state.

`code`
: Machine-friendly representation of the condition.

  Possible values:

  - UNKNOWN
  - GCE_STOCKOUT
  - GKE_SERVICE_ACCOUNT_DELETED
  - GCE_QUOTA_EXCEEDED
  - SET_BY_OPERATOR

`pod_ipv4_cidr_size`
: The pod CIDR block size per node in this node pool.

`cluster`
: The cluster this node pool belongs to.

`location`
: The location where the node pool is deployed

## GCP Permissions

Ensure the [Kubernetes Engine API](https://console.cloud.google.com/apis/library/container.googleapis.com/) is enabled for the current project.
