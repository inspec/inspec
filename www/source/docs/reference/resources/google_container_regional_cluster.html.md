---
title: About the google_container_regional_cluster resource
platform: gcp
---

## Syntax
A `google_container_regional_cluster` is used to test a Google RegionalCluster resource

## Examples
```
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

  * `name`: The name of this cluster. The name must be unique within this project and location, and can be up to 40 characters. Must be Lowercase letters, numbers, and hyphens only. Must start with a letter. Must end with a number or a letter.

  * `description`: An optional description of this cluster.

  * `initial_node_count`: The number of nodes to create in this cluster. You must ensure that your Compute Engine resource quota is sufficient for this number of instances. You must also have available firewall and routes quota. For requests, this field should only be used in lieu of a "nodePool" object, since this configuration (along with the "nodeConfig") will be used to create a "NodePool" object with an auto-generated name. Do not use this and a nodePool at the same time.

  * `node_config`: Parameters used in creating the cluster's nodes.  For requests, this field should only be used in lieu of a "nodePool" object, since this configuration (along with the "initialNodeCount") will be used to create a "NodePool" object with an auto-generated name. Do not use this and a nodePool at the same time. For responses, this field will be populated with the node configuration of the first node pool. If unspecified, the defaults are used.

    * `machineType`: The name of a Google Compute Engine machine type (e.g. n1-standard-1).  If unspecified, the default machine type is n1-standard-1.

    * `diskSizeGb`: Size of the disk attached to each node, specified in GB. The smallest allowed disk size is 10GB. If unspecified, the default disk size is 100GB.

    * `oauthScopes`: The set of Google API scopes to be made available on all of the node VMs under the "default" service account.  The following scopes are recommended, but not required, and by default are not included:  https://www.googleapis.com/auth/compute is required for mounting persistent storage on your nodes. https://www.googleapis.com/auth/devstorage.read_only is required for communicating with gcr.io (the Google Container Registry).  If unspecified, no scopes are added, unless Cloud Logging or Cloud Monitoring are enabled, in which case their required scopes will be added.

    * `serviceAccount`: The Google Cloud Platform Service Account to be used by the node VMs.  If no Service Account is specified, the "default" service account is used.

    * `metadata`: The metadata key/value pairs assigned to instances in the cluster.  Keys must conform to the regexp [a-zA-Z0-9-_]+ and be less than 128 bytes in length. These are reflected as part of a URL in the metadata server. Additionally, to avoid ambiguity, keys must not conflict with any other metadata keys for the project or be one of the four reserved keys: "instance-template", "kube-env", "startup-script", and "user-data"  Values are free-form strings, and only have meaning as interpreted by the image running in the instance. The only restriction placed on them is that each value's size must be less than or equal to 32 KB.  The total size of all keys and values must be less than 512 KB.  An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }.

    * `imageType`: The image type to use for this node.  Note that for a given image type, the latest version of it will be used.

    * `labels`: The map of Kubernetes labels (key/value pairs) to be applied to each node. These will added in addition to any default label(s) that Kubernetes may apply to the node. In case of conflict in label keys, the applied set may differ depending on the Kubernetes version -- it's best to assume the behavior is undefined and conflicts should be avoided. For more information, including usage and the valid values, see:   http://kubernetes.io/v1.1/docs/user-guide/labels.html  An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }.

    * `localSsdCount`: The number of local SSD disks to be attached to the node.  The limit for this value is dependant upon the maximum number of disks available on a machine per zone. See:  https://cloud.google.com/compute/docs/disks/local-ssd#local_ssd_limits  for more information.

    * `tags`: The list of instance tags applied to all nodes. Tags are used to identify valid sources or targets for network firewalls and are specified by the client during cluster or node pool creation. Each tag within the list must comply with RFC1035.

    * `preemptible`: Whether the nodes are created as preemptible VM instances. See: https://cloud.google.com/compute/docs/instances/preemptible for more information about preemptible VM instances.

  * `master_auth`: The authentication information for accessing the master endpoint.

    * `username`: The username to use for HTTP basic authentication to the master endpoint.

    * `password`: The password to use for HTTP basic authentication to the master endpoint. Because the master endpoint is open to the Internet, you should create a strong password.

    * `clusterCaCertificate`: Base64-encoded public certificate that is the root of trust for the cluster.

    * `clientCertificate`: Base64-encoded public certificate used by clients to authenticate to the cluster endpoint.

    * `clientKey`: Base64-encoded private key used by clients to authenticate to the cluster endpoint.

  * `logging_service`: The logging service the cluster should use to write logs. Currently available options:  logging.googleapis.com - the Google Cloud Logging service. none - no logs will be exported from the cluster.  if left as an empty string,logging.googleapis.com will be used.

  * `monitoring_service`: The monitoring service the cluster should use to write metrics. Currently available options:  monitoring.googleapis.com - the Google Cloud Monitoring service. none - no metrics will be exported from the cluster.  if left as an empty string, monitoring.googleapis.com will be used.

  * `network`: The name of the Google Compute Engine network to which the cluster is connected. If left unspecified, the default network will be used.

  * `cluster_ipv4_cidr`: The IP address range of the container pods in this cluster, in CIDR notation (e.g. 10.96.0.0/14). Leave blank to have one automatically chosen or specify a /14 block in 10.0.0.0/8.

  * `addons_config`: Configurations for the various addons available to run in the cluster.

    * `httpLoadBalancing`: Configuration for the HTTP (L7) load balancing controller addon, which makes it easy to set up HTTP load balancers for services in a cluster.

    * `horizontalPodAutoscaling`: Configuration for the horizontal pod autoscaling feature, which increases or decreases the number of replica pods a replication controller has based on the resource usage of the existing pods.

  * `subnetwork`: The name of the Google Compute Engine subnetwork to which the cluster is connected.

  * `endpoint`: The IP address of this cluster's master endpoint.  The endpoint can be accessed from the internet at https://username:password@endpoint/  See the masterAuth property of this resource for username and password information.

  * `initial_cluster_version`: The software version of the master endpoint and kubelets used in the cluster when it was first created. The version can be upgraded over time.

  * `current_master_version`: The current software version of the master endpoint.

  * `current_node_version`: The current version of the node software components. If they are currently at multiple versions because they're in the process of being upgraded, this reflects the minimum version of all nodes.

  * `create_time`: The time the cluster was created, in RFC3339 text format.

  * `node_ipv4_cidr_size`: The size of the address space on each node for hosting containers. This is provisioned from within the container_ipv4_cidr range.

  * `services_ipv4_cidr`: The IP address range of the Kubernetes services in this cluster, in CIDR notation (e.g. 1.2.3.4/29). Service addresses are typically put in the last /16 from the container CIDR.

  * `current_node_count`: The number of nodes currently in the cluster.

  * `expire_time`: The time the cluster will be automatically deleted in RFC3339 text format.

  * `location`: The location where the cluster is deployed
