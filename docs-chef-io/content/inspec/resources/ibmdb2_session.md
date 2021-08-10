+++
title = "ibmdb2_session resource"
draft = false
gh_repo = "inspec"
platform = "os"

[menu]
  [menu.inspec]
    title = "ibmdb2_session"
    identifier = "inspec/resources/os/ibmdb2_session.md ibmdb2_session resource"
    parent = "inspec/resources/os"
+++

Use the `ibmdb2_session` Chef InSpec audit resource to test SQL commands run against an IBM Db2 database.
Make sure you are using the database instance user credentials to run the InSpec test.

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

## Syntax

A `ibmdb2_session` resource block declares the db2_executable_file_path, db_instance and db_name to use for the session, and then the query to be run:

    describe ibmdb2_session(db2_executable_file_path: "/opt/ibm/db2/V11.5/bin/db2", db_instance: "db2inst1", db_name: "sample").query("select rolename from syscat.roleauth") do
      its("output") { should match(/SYSTS_MGR/) }
    end

where

- `ibmdb2_session` declares a db2_executable_file_path, db_instance and db_name to connect.
- `db2_executable_file_path` is the path of the db2 binary file.
- `db_instance` is the name of the database instance.
- `db_name` is the name of the database to query on.
- `query('QUERY')` contains the query to be run.
- `its('output') { should eq(/expected-result/) }` compares the results of the query against the expected result in the test.

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test for matching role name

    describe ibmdb2_session(db2_executable_file_path: "/opt/ibm/db2/V11.5/bin/db2", db_instance: "db2inst1", db_name: "sample").query("select rolename from syscat.roleauth") do
      its("output") { should match(/SYSTS_MGR/) }
    end

### Test for matching database

    describe ibmdb2_session(db2_executable_file_path: "/opt/ibm/db2/V11.5/bin/db2", db_instance: "db2inst1", db_name: "sample").query("list database directory") do
      its("output") { should match(/SAMPLE/) }
    end

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).
