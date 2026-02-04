+++
title = "mssql_session resource"
draft = false
gh_repo = "inspec"
platform = "windows"

[menu]
  [menu.inspec]
    title = "mssql_session"
    identifier = "inspec/resources/os/mssql_session.md mssql_session resource"
    parent = "inspec/resources/os"
+++

Use the `mssql_session` Chef InSpec audit resource to test SQL commands run against a Microsoft SQL database.

## Availability

### Install

{{< readfile file="content/inspec/reusable/md/inspec_installation.md" >}}

### Version

This resource first became available in v1.24.0 of InSpec.

## Syntax

A `mssql_session` resource block declares the username and password to use for the session, and then the command to be run:

    describe mssql_session(user: 'username', password: 'password').query('QUERY').row(0).column('result') do
      its('value') { should eq('') }
    end

where

- `mssql_session` declares credentials and connection settings with permission to run the query.
- `query('QUERY')` contains the query to be run
- `its('value') { should eq('') }` compares the results of the query against the expected result in the test

### Optional Parameters

The `mssql_session` resource accepts `user`, `password`, `pass`, `host`, `port`, `instance`, `db_name`, `local_mode`, and `trust_server_certificate`.

#### `user`

The SQL Server user name for SQL authentication.

If `user` or `password` is omitted, `mssql_session` uses Windows authentication as the user running Chef InSpec.

#### `password`

The SQL Server password for SQL authentication.

#### `pass` (deprecated)

Deprecated alias for `password`. Use `password` instead.

#### `host`

The SQL Server host name. Default value: `localhost`.

#### `port`

The SQL Server port. By default, no explicit port is passed.

#### `instance`

The SQL Server instance name. By default, the server's default instance is used.

#### `db_name`

The database name to connect to before running the query.

#### `local_mode`

Set to `true` to run in local mode.

In local mode, the resource does not pass host or port to `sqlcmd`.

#### `trust_server_certificate`

Set `trust_server_certificate: true` to pass `-C` to the underlying `sqlcmd`.

Use this when you need encrypted connectivity, but certificate validation would otherwise fail due to missing certificate-chain configuration (for example, SQL Server uses a self-signed certificate or a private CA that isn't available in the runner trust store).

This option is less secure than full certificate validation because it trusts the server certificate without strict verification. Use it only when necessary, and prefer installing the correct CA/server certificates on the target system when possible.

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test for matching databases

    sql = mssql_session(user: 'my_user', password: 'password')

    describe sql.query("SELECT SERVERPROPERTY('ProductVersion') as result").row(0).column('result') do
      its("value") { should cmp > '12.00.4457' }
    end

### Test using Windows authentication

    sql = mssql_session

    describe sql.query("SELECT SERVERPROPERTY('ProductVersion') as result").row(0).column('result') do
      its("value") { should cmp > '12.00.4457' }
    end

### Test a specific host and instance

    sql = mssql_session(user: 'my_user', password: 'password', host: 'ms-sql-server', instance: 'foo')

    describe sql.query("SELECT SERVERPROPERTY('ProductVersion') as result").row(0).column('result') do
      its("value") { should cmp > '12.00.4457' }
    end

### Test a specific database

    sql = mssql_session(user: 'my_user', password: 'password', db_name: 'test')

    describe sql.query("SELECT Name AS result FROM Product WHERE ProductID == 1").row(0).column('result') do
      its("value") { should eq 'foo' }
    end

### Trust the SQL Server certificate

    sql = mssql_session(user: 'my_user', password: 'password', trust_server_certificate: true)

    describe sql.query("SELECT SERVERPROPERTY('ProductVersion') as result").row(0).column('result') do
      its("value") { should_not be_empty }
    end

## Matchers

{{< readfile file="content/inspec/reusable/md/inspec_matchers_link.md" >}}
