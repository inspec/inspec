+++
title = "postgres_session resource"
draft = false
gh_repo = "inspec"
platform = "os"

[menu]
  [menu.inspec]
    title = "postgres_session"
    identifier = "inspec/resources/os/postgres_session.md postgres_session resource"
    parent = "inspec/resources/os"
+++

Use the `postgres_session` Chef InSpec audit resource to test SQL commands run against a PostgreSQL database.

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

A `postgres_session` resource block declares the username and password to use for the session, and then the command to be run:

    # Create a PostgreSQL session:
    sql = postgres_session('username', 'password', 'host', 'port')

    # default values:
    #   username: 'postgres'
    #   host: 'localhost'
    #   port: 5432

    # Run an SQL query with an optional database to execute
    sql.query('sql_query', ['database_name'])`

A full example is:

    sql = postgres_session('username', 'password', 'host', 'port')
    describe sql.query('SELECT * FROM pg_shadow WHERE passwd IS NULL;') do
      its('output') { should eq '' }
    end

where `its('output') { should eq '' }` compares the results of the query against the expected result in the test

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test the PostgreSQL shadow password

    sql = postgres_session('my_user', 'password', '192.168.1.2', 5432)

    describe sql.query('SELECT * FROM pg_shadow WHERE passwd IS NULL;', ['testdb']) do
      its('output') { should eq('') }
    end

### Test for risky database entries

    describe postgres_session('my_user', 'password').query('SELECT count (*)
                  FROM pg_language
                  WHERE lanpltrusted = \'f\'
                  AND lanname!=\'internal\'
                  AND lanname!=\'c\';', ['postgres']) do
      its('output') { should eq '0' }
    end

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### output

The `output` matcher tests the results of the query:

    its('output') { should eq(/^0/) }
