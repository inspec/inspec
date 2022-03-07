+++
title = "ibmdb2_conf resource"
draft = false
gh_repo = "inspec"
platform = "os"

[menu]
  [menu.inspec]
    title = "ibmdb2_conf"
    identifier = "inspec/resources/os/ibmdb2_conf.md ibmdb2_conf resource"
    parent = "inspec/resources/os"
+++

Use the `ibmdb2_conf` Chef InSpec audit resource to test the configuration settings. Make sure you are using the IBM Db2 database instance user credentials to run the InSpec test.

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

## Syntax

A `ibmdb2_conf` resource block declares db2_executable_file_path, db_instance to connect and then runs command to get the configuration values and compares it to the value stated in the test:

    describe ibmdb2_conf(db2_executable_file_path: "/opt/ibm/db2/V11.5/bin/db2", db_instance: "db2inst1") do
     its("output") { should_not be_empty }
     its("output") { should include("Audit buffer size (4KB) (AUDIT_BUF_SZ) = 0")}
    end

Windows

    describe ibmdb2_conf do
     its("output") { should_not be_empty }
     its("output") { should include("Audit buffer size (4KB) (AUDIT_BUF_SZ) = 0")}
    end

where

- `ibmdb2_session` declares a db2_executable_file_path, db_instance and db_name to connect.
- `db2_executable_file_path` is the path of the db2 binary file. For Windows this is not required.
- `db_instance` is the name of the database instance. For Windows this is not required.
- `its("output") { should include("expected_settings")}` compares the results of the output against the expected result in the test.

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test the audit buffer size configuration settings of IBM Db2 database

    describe ibmdb2_conf(db2_executable_file_path: "/opt/ibm/db2/V11.5/bin/db2", db_instance: "db2inst1") do
     its("output") { should_not be_empty }
     its("output") { should include("Audit buffer size (4KB) (AUDIT_BUF_SZ) = 1000")}
    end

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).
