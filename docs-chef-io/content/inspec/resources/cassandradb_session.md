+++
title = "cassandradb_session resource"
draft = false
gh_repo = "inspec"
platform = "os"

[menu]
  [menu.inspec]
    title = "cassandradb_session"
    identifier = "inspec/resources/os/cassandradb_session.md cassandradb_session resource"
    parent = "inspec/resources/os"
+++

Use the `cassandradb_session` Chef InSpec audit resource to test Cassandra Query Language (CQL) commands run against a Cassandra database.

## Availability

### Install

{{< readfile file="content/inspec/reusable/md/inspec_installation.md" >}}

## Syntax

A `cassandradb_session` resource block declares the username, password, host, and port to use for the session, and then the command to be run:

    describe cassandradb_session(user: 'USERNAME', password: 'PASSWORD', host: 'localhost', port: 9042).query('QUERY') do
      its('value') { should eq('EXPECTED') }
    end

where

- `cassandradb_session` declares a username, password, host and port to run the query.
- `query('QUERY')` contains the query to be run.
- `its('value') { should eq('expected') }` compares the results of the query against the expected result in the test.

### Optional Parameters

The `cassandradb_session` InSpec resource accepts `user`, `password`, `host`, and `port` parameters.

In Particular:

#### `user`

Default value: `cassandra`.

#### `password`

Default value: `cassandra`.

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test for matching values using a Cassandra query

```ruby
cql = cassandradb_session(user: 'MY_USER', password: 'PASSWORD', host: 'localhost', port: 9042)

describe cql.query("SELECT cluster_name FROM system.local") do
  its('output') { should match /Test Cluster/ }
end
```

### Test for matching values using a Cassandra query from a sample database

```ruby
cql = cassandradb_session(user: 'MY_USER', password: 'PASSWORD', host: 'localhost', port: 9042)

describe cql.query("use SAMPLEDB; SELECT name FROM SAMPLETABLE") do
  its('output') { should match /Test Name/ }
end
```

## Matchers

{{< readfile file="content/inspec/reusable/md/inspec_matchers_link.md" >}}
