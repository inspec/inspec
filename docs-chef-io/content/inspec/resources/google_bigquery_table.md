+++
title = "google_bigquery_table resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_bigquery_table"
    identifier = "inspec/resources/gcp/google_bigquery_table.md google_bigquery_table resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_bigquery_table` is used to test a Google Table resource

## Examples

```ruby
describe google_bigquery_table(project: 'chef-gcp-inspec', dataset: 'inspec_gcp_dataset', name: 'inspec_gcp_bigquery_table') do
  it { should exist }

  its('expiration_time') { should cmp '1738882264000' }
  its('time_partitioning.type') { should eq 'DAY' }
  its('description') { should eq 'A BigQuery table' }
end

describe google_bigquery_table(project: 'chef-gcp-inspec', dataset: 'inspec_gcp_dataset', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_bigquery_table` resource:

`table_reference`
: Reference describing the ID of this table

`dataset_id`
: The ID of the dataset containing this table

`project_id`
: The ID of the project containing this table

`table_id`
: The ID of the the table

`clustering`
: One or more fields on which data should be clustered. Only top-level, non-repeated, simple-type fields are supported. When you cluster a table using multiple columns, the order of columns you specify is important. The order of the specified columns determines the sort order of the data.

`creation_time`
: The time when this dataset was created, in milliseconds since the epoch.

`description`
: A user-friendly description of the dataset

`friendly_name`
: A descriptive name for this table

`id`
: An opaque ID uniquely identifying the table.

`labels`
: The labels associated with this dataset. You can use these to organize and group your datasets

`last_modified_time`
: The time when this table was last modified, in milliseconds since the epoch.

`location`
: The geographic location where the table resides. This value is inherited from the dataset.

`name`
: Name of the table

`num_bytes`
: The size of this table in bytes, excluding any data in the streaming buffer.

`num_long_term_bytes`
: The number of bytes in the table that are considered "long-term storage".

`num_rows`
: The number of rows of data in this table, excluding any data in the streaming buffer.

`require_partition_filter`
: If set to true, queries over this table require a partition filter that can be used for partition elimination to be specified.

`type`
: Describes the table type

  Possible values:

  - TABLE
  - VIEW
  - EXTERNAL

`view`
: The view definition.

`use_legacy_sql`
: Specifies whether to use BigQuery's legacy SQL for this view

`user_defined_function_resources`
: Describes user-defined function resources used in the query.

  `inline_code`
  : An inline resource that contains code for a user-defined function (UDF). Providing a inline code resource is equivalent to providing a URI for a file containing the same code.

  `resource_uri`
  : A code resource to load from a Google Cloud Storage URI (gs://bucket/path).

`time_partitioning`
: If specified, configures time-based partitioning for this table.

`expiration_ms`
: Number of milliseconds for which to keep the storage for a partition.

`field`
: If not set, the table is partitioned by pseudo column, referenced via either '\_PARTITIONTIME' as TIMESTAMP type, or '\_PARTITIONDATE' as DATE type. If field is specified, the table is instead partitioned by this field. The field must be a top-level TIMESTAMP or DATE field. Its mode must be NULLABLE or REQUIRED.

`type`
: The only type supported is DAY, which will generate one partition per day.

  Possible values:

  - DAY

`streaming_buffer`
: Contains information regarding this table's streaming buffer, if one is present. This field will be absent if the table is not being streamed to or if there is no data in the streaming buffer.

`estimated_bytes`
: A lower-bound estimate of the number of bytes currently in the streaming buffer.

`estimated_rows`
: A lower-bound estimate of the number of rows currently in the streaming buffer.

`oldest_entry_time`
: Contains the timestamp of the oldest entry in the streaming buffer, in milliseconds since the epoch, if the streaming buffer is available.

`schema`
: Describes the schema of this table

`fields`
: Describes the fields in a table.

  `description`
  : The field description. The maximum length is 1,024 characters.

  `fields`
  : Describes the nested schema fields if the type property is set to RECORD.

  `mode`
  : The field mode

    Possible values:

    - NULLABLE
    - REQUIRED
    - REPEATED

  `name`
  : The field name

  `type`
  : The field data type

    Possible values:
    - STRING
    - BYTES
    - INTEGER
    - FLOAT
    - TIMESTAMP
    - DATE
    - TIME
    - DATETIME
    - RECORD

`encryption_configuration`
: Custom encryption configuration

`kms_key_name`
: Describes the Cloud KMS encryption key that will be used to protect destination BigQuery table. The BigQuery Service Account associated with your project requires access to this encryption key.

`expiration_time`
: The time when this table expires, in milliseconds since the epoch. If not present, the table will persist indefinitely.

`external_data_configuration`
: Describes the data format, location, and other properties of a table stored outside of BigQuery. By defining these properties, the data source can then be queried as if it were a standard BigQuery table.

`autodetect`
: Try to detect schema and format options automatically. Any option specified explicitly will be honored.

`compression`
: The compression type of the data source

  Possible values:

  - GZIP
  - NONE

`ignore_unknown_values`
: Indicates if BigQuery should allow extra values that are not represented in the table schema

`max_bad_records`
: The maximum number of bad records that BigQuery can ignore when reading data

`source_format`
: The data format

  Possible values:

  - CSV
  - GOOGLE_SHEETS
  - NEWLINE_DELIMITED_JSON
  - AVRO
  - DATASTORE_BACKUP
  - BIGTABLE

`source_uris`
: The fully-qualified URIs that point to your data in Google Cloud. For Google Cloud Storage URIs: Each URI can contain one '_' wildcard character and it must come after the 'bucket' name. Size limits related to load jobs apply to external data sources. For Google Cloud Bigtable URIs: Exactly one URI can be specified and it has be a fully specified and valid HTTPS URL for a Google Cloud Bigtable table. For Google Cloud Datastore backups, exactly one URI can be specified. Also, the '_' wildcard character is not allowed.

`schema`
: The schema for the data. Schema is required for CSV and JSON formats

  `fields`
  : Describes the fields in a table.

    `description`
    : The field description

    `fields`
    : Describes the nested schema fields if the type property is set to RECORD

    `mode`
    : Field mode.
      Possible values:

      - NULLABLE
      - REQUIRED
      - REPEATED

    `name`
    : Field name

    `type`
    : Field data type

      Possible values:
      - STRING
      - BYTES
      - INTEGER
      - FLOAT
      - TIMESTAMP
      - DATE
      - TIME
      - DATETIME
      - RECORD

`google_sheets_options`
: Additional options if sourceFormat is set to GOOGLE_SHEETS.

  `skip_leading_rows`
  : The number of rows at the top of a Google Sheet that BigQuery will skip when reading the data.

`csv_options`
: Additional properties to set if sourceFormat is set to CSV.

  `allow_jagged_rows`
  : Indicates if BigQuery should accept rows that are missing trailing optional columns

  `allow_quoted_newlines`
  : Indicates if BigQuery should allow quoted data sections that contain newline characters in a CSV file

  `encoding`
  : The character encoding of the data

    Possible values:

    - UTF-8
    - ISO-8859-1

  `field_delimiter`
  : The separator for fields in a CSV file

  `quote`
  : The value that is used to quote data sections in a CSV file

  `skip_leading_rows`
  : The number of rows at the top of a CSV file that BigQuery will skip when reading the data.

`bigtable_options`
: Additional options if sourceFormat is set to BIGTABLE.

  `ignore_unspecified_column_families`
  : If field is true, then the column families that are not specified in columnFamilies list are not exposed in the table schema

  `read_rowkey_as_string`
  : If field is true, then the rowkey column families will be read and converted to string.

  `column_families`
  : List of column families to expose in the table schema along with their types.

    `columns`
    : Lists of columns that should be exposed as individual fields as opposed to a list of (column name, value) pairs.

      `encoding`
      : The encoding of the values when the type is not STRING

        Possible values:

        - TEXT
        - BINARY

      `field_name`
      : If the qualifier is not a valid BigQuery field identifier, a valid identifier must be provided as the column field name and is used as field name in queries.

      `only_read_latest`
      : If this is set, only the latest version of value in this column are exposed

      `qualifier_string`
      : Qualifier of the column

      `type`
      : The type to convert the value in cells of this column

        Possible values:
        - BYTES
        - STRING
        - INTEGER
        - FLOAT
        - BOOLEAN

    `encoding`
    : The encoding of the values when the type is not STRING

      Possible values:

      - TEXT
      - BINARY

    `family_id`
    : Identifier of the column family.

    `only_read_latest`
    : If this is set only the latest version of value are exposed for all columns in this column family

    `type`
    : The type to convert the value in cells of this column family

      Possible values:
      - BYTES
      - STRING
      - INTEGER
      - FLOAT
      - BOOLEAN

`dataset`
: Name of the dataset

## GCP Permissions

Ensure the [BigQuery API](https://console.cloud.google.com/apis/library/bigquery-json.googleapis.com/) is enabled for the current project.
