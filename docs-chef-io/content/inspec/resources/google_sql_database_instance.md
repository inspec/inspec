+++
title = "google_sql_database_instance resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_sql_database_instance"
    identifier = "inspec/resources/gcp/google_sql_database_instance.md google_sql_database_instance resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_sql_database_instance` is used to test a Google DatabaseInstance resource

## Examples

```ruby

describe google_sql_database_instance(project: 'chef-gcp-inspec', database: 'my-database') do
  it { should exist }
  its('state') { should eq 'RUNNABLE' }
  its('backend_type') { should eq 'SECOND_GEN' }
  its('database_version') { should eq 'MYSQL_5_7' }
end
```

### Test that a GCP Cloud SQL Database instance is in the expected state

    describe google_sql_database_instance(project: 'chef-inspec-gcp',  database: 'my-database') do
      its('state') { should eq 'RUNNABLE' }
    end

### Test that a GCP Cloud SQL Database instance generation type

    describe google_sql_database_instance(project: 'chef-inspec-gcp',  database: 'my-database') do
      its('backend_type') { should eq "SECOND_GEN" }
    end

### Test that a GCP Cloud SQL Database instance connection name is as expected

    describe google_sql_database_instance(project: 'spaterson-project',  database: 'gcp-inspec-db-instance') do
      its('connection_name') { should eq "spaterson-project:europe-west2:gcp-inspec-db-instance" }
    end

### Confirm that a GCP Cloud SQL Database instance has the correct version

    describe google_sql_database_instance(project: 'spaterson-project',  database: 'gcp-inspec-db-instance') do
      its('database_version') { should eq "MYSQL_5_7" }
    end

### Confirm that a GCP Cloud SQL Database instance is running in the desired region and zone

    describe google_sql_database_instance(project: 'spaterson-project',  database: 'gcp-inspec-db-instance') do
      its('gce_zone') { should eq "europe-west2-a" }
      its('region') { should eq "europe-west2" }
    end

## Properties

Properties that can be accessed from the `google_sql_database_instance` resource:

`backend_type`
: Possible values:
  - FIRST_GEN: First Generation instance. MySQL only.
  - SECOND_GEN: Second Generation instance or PostgreSQL instance.
  - EXTERNAL: A database server that is not managed by Google.

`connection_name`
: Connection name of the Cloud SQL instance used in connection strings.

`database_version`
: The database engine type and version. For First Generation instances, can be MYSQL_5_5, or MYSQL_5_6. For Second Generation instances, can be MYSQL_5_6 or MYSQL_5_7. Defaults to MYSQL_5_6. PostgreSQL instances: POSTGRES_9_6 The databaseVersion property can not be changed after instance creation.

  Possible values:

  - MYSQL_5_5
  - MYSQL_5_6
  - MYSQL_5_7
  - POSTGRES_9_6


`failover_replica`
: The name and status of the failover replica. This property is applicable only to Second Generation instances.

  `available`
  : The availability status of the failover replica. A false status indicates that the failover replica is out of sync. The master can only failover to the failover replica when the status is true.

  `name`
  : The name of the failover replica. If specified at instance creation, a failover replica is created for the instance. The name doesn't include the project ID. This property is applicable only to Second Generation instances.

`instance_type`
: The instance type. This can be one of the following. _ CLOUD_SQL_INSTANCE: A Cloud SQL instance that is not replicating from a master. _ ON_PREMISES_INSTANCE: An instance running on the customer's premises. _ READ_REPLICA_INSTANCE: A Cloud SQL instance configured as a read-replica.

  Possible values:

  - CLOUD_SQL_INSTANCE
  - ON_PREMISES_INSTANCE
  - READ_REPLICA_INSTANCE


`ip_addresses`
: The assigned IP addresses for the instance.

  `ip_address`
  : The IP address assigned.

  `time_to_retire`
  : The due time for this IP to be retired in RFC 3339 format, for example 2012-11-15T16:19:00.094Z. This field is only available when the IP is scheduled to be retired.

  `type`
  : The type of this IP address. A PRIMARY address is an address that can accept incoming connections. An OUTGOING address is the source address of connections originating from the instance, if supported.

    Possible values:
    - PRIMARY
    - OUTGOING

`ipv6_address`
: The IPv6 address assigned to the instance. This property is applicable only to First Generation instances.

`master_instance_name`
: The name of the instance which will act as master in the replication setup.

`max_disk_size`
: The maximum disk size of the instance in bytes.

`name`
: Name of the Cloud SQL instance. This does not include the project ID.

`region`
: The geographical region. Defaults to us-central or us-central1 depending on the instance type (First Generation or Second Generation/PostgreSQL).

`replica_configuration`
: Configuration specific to failover replicas and read replicas.

  `failover_target`
  : Specifies if the replica is the failover target. If the field is set to true the replica will be designated as a failover replica. In case the master instance fails, the replica instance will be promoted as the new master instance.  Only one replica can be specified as failover target, and the replica has to be in different zone with the master instance.

  `mysql_replica_configuration`
  : MySQL specific configuration when replicating from a MySQL on-premises master. Replication configuration information such as the username, password, certificates, and keys are not stored in the instance metadata.  The configuration information is used only to set up the replication connection and is stored by MySQL in a file named master.info in the data directory.

    `ca_certificate`
    : PEM representation of the trusted CA's x509 certificate.

    `client_certificate`
    : PEM representation of the slave's x509 certificate

    `client_key`
    : PEM representation of the slave's private key. The corresponding public key is encoded in the client's certificate.

    `connect_retry_interval`
    : Seconds to wait between connect retries. MySQL's default is 60 seconds.

    `dump_file_path`
    : Path to a SQL dump file in Google Cloud Storage from which the slave instance is to be created. The URI is in the form gs://bucketName/fileName. Compressed gzip files (.gz) are also supported. Dumps should have the binlog coordinates from which replication should begin. This can be accomplished by setting --master-data to 1 when using mysqldump.

    `master_heartbeat_period`
    : Interval in milliseconds between replication heartbeats.

    `password`
    : The password for the replication connection.

    `ssl_cipher`
    : A list of permissible ciphers to use for SSL encryption.

    `username`
    : The username for the replication connection.

    `verify_server_certificate`
    : Whether or not to check the master's Common Name value in the certificate that it sends during the SSL handshake.

  `replica_names`
  : The replicas of the instance.

  `service_account_email_address`
  : The service account email address assigned to the instance. This property is applicable only to Second Generation instances.

`settings`
: The user settings.

  `database_flags`
  : The database flags passed to the instance at startup

    `name`
    : The name of the flag. These flags are passed at instance startup, so include both server options and system variables for MySQL. Flags should be specified with underscores, not hyphens.

    `value`
    : The value of the flag. Booleans should be set to on for true and off for false. This field must be omitted if the flag doesn't take a value.

  `ip_configuration`
  : The settings for IP Management. This allows to enable or disable the instance IP and manage which external networks can connect to the instance. The IPv4 address cannot be disabled for Second Generation instances.

    `ipv4_enabled`
    : Whether the instance should be assigned an IP address or not.

    `authorized_networks`
    : The list of external networks that are allowed to connect to the instance using the IP. In CIDR notation, also known as 'slash' notation (e.g. 192.168.100.0/24).

      `expiration_time`
      : The time when this access control entry expires in RFC 3339 format, for example 2012-11-15T16:19:00.094Z.

      `name`
      : An optional label to identify this entry.

      `value`
      : The whitelisted value for the access control list. For example, to grant access to a client from an external IP (IPv4 or IPv6) address or subnet, use that address or subnet here.

    `require_ssl`
    : Whether the mysqld should default to 'REQUIRE X509' for users connecting over IP.

  `tier`
  : The tier or machine type for this instance, for example db-n1-standard-1. For MySQL instances, this field determines whether the instance is Second Generation (recommended) or First Generation.

  `availability_type`
  : The availabilityType define if your postgres instance is run zonal  or regional.
  Possible values:
    * ZONAL
    * REGIONAL

  `backup_configuration`
  : The daily backup configuration for the instance.

    `enabled`
    : Enable Autobackup for your instance.

    `binary_log_enabled`
    : Whether binary log is enabled. If backup configuration  is disabled, binary log must be disabled as well. MySQL only.

    `start_time`
    : Define the backup start time in UTC (HH:MM)

  `settings_version`
  : The version of instance settings. This is a required field for  update method to make sure concurrent updates are handled properly.  During update, use the most recent settingsVersion value for this  instance and do not try to update this value.

  `user_labels`
  : User-provided labels, represented as a dictionary where each label is a single key value pair.

`gce_zone`
: The Compute Engine zone that the instance is currently serving from. This value could be different from the zone that was specified when the instance was created if the instance has failed over to its secondary zone.

`state`
: The current serving state of the database instance.

  Possible values:

  - SQL_INSTANCE_STATE_UNSPECIFIED
  - RUNNABLE
  - SUSPENDED
  - PENDING_DELETE
  - PENDING_CREATE
  - MAINTENANCE
  - FAILED

## GCP Permissions

Ensure the [Cloud SQL Admin API](https://console.cloud.google.com/apis/library/sqladmin.googleapis.com/) is enabled for the current project.
