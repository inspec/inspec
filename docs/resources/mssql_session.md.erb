---
title: About the mssql_session Resource
platform: windows
---

# mssql_session

Use the `mssql_session` Chef InSpec audit resource to test SQL commands run against a Microsoft SQL database.

<br>

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.24.0 of InSpec.

## Syntax

A `mssql_session` resource block declares the username and password to use for the session, and then the command to be run:

    describe mssql_session(user: 'username', password: 'password').query('QUERY').row(0).column('result') do
      its('value') { should eq('') }
    end

where

* `mssql_session` declares a username and password with permission to run the query.  Omitting the username or password parameters results in the use of Windows authentication as the user Chef InSpec is executing as.  You may also optionally pass a host and instance name.  If omitted, they will default to host: localhost and the default instance.
* `query('QUERY')` contains the query to be run
* `its('value') { should eq('') }` compares the results of the query against the expected result in the test

<br>

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

    sql = mssql_session(user: 'my_user', password: 'password', host: 'mssqlserver', instance: 'foo')

    describe sql.query("SELECT SERVERPROPERTY('ProductVersion') as result").row(0).column('result') do
      its("value") { should cmp > '12.00.4457' }
    end
  
### Test a specific database

    sql = mssql_session(user: 'my_user', password: 'password', db_name: 'test')

    describe sql.query("SELECT Name AS result FROM Product WHERE ProductID == 1").row(0).column('result') do
      its("value") { should eq 'foo' }
    end

<br>

## Matchers

For a full list of available matchers, please visit our [matchers page](https://www.inspec.io/docs/reference/matchers/).
