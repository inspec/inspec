+++
title = "google_dataproc_cluster resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_dataproc_cluster"
    identifier = "inspec/resources/gcp/google_dataproc_cluster.md google_dataproc_cluster resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_dataproc_cluster` is used to test a Google Cluster resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_dataproc_cluster(project: 'chef-gcp-inspec', region: 'europe-west2', cluster_name: 'inspec-dataproc-cluster') do
  it { should exist }
  its('labels') { should include('label' => 'value') }
  its('config.master_config.num_instances') { should cmp '1' }
  its('config.worker_config.num_instances') { should cmp '2' }
  its('config.master_config.machine_type_uri') { should match 'n1-standard-1' }
  its('config.worker_config.machine_type_uri') { should match 'n1-standard-1' }
  its('config.software_config.properties') { should include('dataproc:dataproc.allow.zero.workers' => 'true') }
end

describe google_dataproc_cluster(project: 'chef-gcp-inspec', region: 'europe-west2', cluster_name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_dataproc_cluster` resource:

`cluster_name`
: The name of the cluster, unique within the project and region.

`labels`
: Labels to apply to this cluster. A list of key->value pairs.

`config`
: Configuration for the cluster

  `config_bucket`
  : The Cloud Storage staging bucket used to stage files, such as Hadoop jars, between client machines and the cluster.

  `gce_cluster_config`
  : Common config settings for resources of Google Compute Engine cluster instances, applicable to all instances in the cluster.

    `zone_uri`
    : The zone where the Compute Engine cluster will be located

    `network_uri`
    : The Compute Engine network to be used for machine communications

    `subnetwork_uri`
    : The Compute Engine subnetwork to be used for machine communications

    `internal_ip_only`
    : If true, all instances int he cluster will only have internal IP addresses

    `service_account_scopes`
    : The URIs of service account scopes to be included in Compute Engine instances The following base set of scopes is always included:  https://www.googleapis.com/auth/cloud.useraccounts.readonly  https://www.googleapis.com/auth/devstorage.read_write  https://www.googleapis.com/auth/logging.write

    `tags`
    : The Compute Engine tags to add to all instances

    `metadata`
    : The map of metadata entries to add to all instances

  `master_config`
  : The config settings for Compute Engine resources in an instance group, such as a master or worker group.

    `num_instances`
    : The number of VM instances in the instance group. For master instance groups, must be set to 1.

    `instance_names`
    : The list of instance names.

    `image_uri`
    : The Compute Engine image resource used for cluster instances.

    `machine_type_uri`
    : The Compute Engine machine type used for cluster instances

    `disk_config`
    : Disk option config settings

      `boot_disk_type`
      : Type of the boot disk. Valid values are "pd-ssd" or "pd-standard"

      `boot_disk_size_gb`
      : Size in GB of the boot disk.

      `num_local_ssds`
      : Number of attached SSDs, from 0 to 4.

    `is_preemptible`
    : Specifies if this instance group contains preemptible instances.

    `managed_group_config`
    : The config for Compute Engine Instance Group Manager that manages this group. This is only used for preemptible instance groups.

      `instance_template_name`
      : The name of the Instance Template used for the Managed Instance Group.

      `instance_group_manager_name`
      : The name of the Instance Group Manager for this group

  `worker_config`
  : The config settings for Compute Engine resources in an instance group, such as a master or worker group.

    `num_instances`
    : The number of VM instances in the instance group. For master instance groups, must be set to 1.

    `instance_names`
    : The list of instance names.

    `image_uri`
    : The Compute Engine image resource used for cluster instances.

    `machine_type_uri`
    : The Compute Engine machine type used for cluster instances

    `disk_config`
    : Disk option config settings

      `boot_disk_type`
      : Type of the boot disk. Valid values are "pd-ssd" or "pd-standard"

      `boot_disk_size_gb`
      : Size in GB of the boot disk.

      `num_local_ssds`
      : Number of attached SSDs, from 0 to 4.

    `is_preemptible`
    : Specifies if this instance group contains preemptible instances.

    `managed_group_config`
    : The config for Compute Engine Instance Group Manager that manages this group. This is only used for preemptible instance groups.

      `instance_template_name`
      : The name of the Instance Template used for the Managed Instance Group.

      `instance_group_manager_name`
      : The name of the Instance Group Manager for this group

  `secondary_worker_config`
  : The config settings for Compute Engine resources in an instance group, such as a master or worker group.

    `num_instances`
    : The number of VM instances in the instance group. For master instance groups, must be set to 1.

    `instance_names`
    : The list of instance names.

    `image_uri`
    : The Compute Engine image resource used for cluster instances.

    `machine_type_uri`
    : The Compute Engine machine type used for cluster instances

    `disk_config`
    : Disk option config settings

      `boot_disk_type`
      : Type of the boot disk. Valid values are "pd-ssd" or "pd-standard"

      `boot_disk_size_gb`
      : Size in GB of the boot disk.

      `num_local_ssds`
      : Number of attached SSDs, from 0 to 4.

    `is_preemptible`
    : Specifies if this instance group contains preemptible instances.

    `managed_group_config`
    : The config for Compute Engine Instance Group Manager that manages this group. This is only used for preemptible instance groups.

      `instance_template_name`
      : The name of the Instance Template used for the Managed Instance Group.

      `instance_group_manager_name`
      : The name of the Instance Group Manager for this group

  `software_config`
  : Specifies the selection and config of software inside the cluster

    `image_version`
    : The version of software inside the cluster. It must be one of the supported Cloud Dataproc Versions, such as "1.2" (including a subminor version, such as "1.2.29"), or the "preview" version.

    `properties`
    : The properties to set on daemon config files. Property keys are specified in the prefix:property format, for example `core:hadoop.tmp.dir`

    `optional_components`
    : The set of optional components to activate on the cluster.

      Possible values:
      - COMPONENT_UNSPECIFIED
      - ANACONDA
      - HBASE
      - RANGER
      - SOLR
      - HIVE_WEBHCAT
      - JUPYTER
      - ZEPPELIN

  `initialization_actions`
  : Specifies an executable to run on a fully configured node and a timeout period for executable completion.

    `executable_file`
    : Cloud Storage URI of the executable file

    `execution_timeout`
    : Amount of time executable has to complete

  `encryption_config`
  : Encryption settings for the cluster.

    `gce_pd_kms_key_name`
    : The Cloud KMS key name to use for PD disk encyption for all instances in the cluster.

  `security_config`
  : Kerberos config holder.

    `kerberos_config`
    : Kerberos related configuration.

      `enable_kerberos`
      : Flag to indicate whether to Kerberize the cluster.

      `rootprincipal_password_uri`
      : The cloud Storage URI of a KMS encrypted file containing the root principal password.

      `kms_key_uri`
      : The uri of the KMS key used to encrypt various sensitive files.

      `keystore_uri`
      : The Cloud Storage URI of the keystore file used for SSL encryption.

      `truststore_uri`
      : The Cloud Storage URI of a KMS encrypted file containing the password to the user provided keystore.

      `key_password_uri`
      : The Cloud Storage URI of a KMS encrypted file containing the password to the user provided key.

      `truststore_password_uri`
      : The Cloud Storage URI of a KMS encrypted file containing the password to the user provided truststore.

      `cross_realm_trust_realm`
      : The remote realm the Dataproc on-cluster KDC will trust, should the user enable cross realm trust.

      `cross_realm_trust_admin_server`
      : The admin server (IP or hostname) for the remote trusted realm in a cross realm trust relationship.

      `cross_realm_trust_shared_password_uri`
      : The Cloud Storage URI of a KMS encrypted file containing the shared password between the on-cluster Kerberos realm and the remote trusted realm, in a cross realm trust relationship.

      `kdc_db_key_uri`
      : The Cloud Storage URI of a KMS encrypted file containing the master key of the KDC database.

      `tgt_lifetime_hours`
      : The lifetime of the ticket granting ticket, in hours.

      `realm`
      : The name of the on-cluster Kerberos realm.

`region`
: The region in which the cluster and associated nodes will be created in.

## GCP Permissions

Ensure the [Cloud Dataproc API](https://console.cloud.google.com/apis/library/dataproc.googleapis.com) is enabled for the current project.
