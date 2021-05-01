---
title: About the mysql_session Resource
platform: os
---

# mysql_session

Use the `mysql_session` Chef InSpec audit resource to test SQL commands run against a MySQL database.

<br>

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

A `mysql_session` resource block declares the username and password to use for the session, and then the command to be run:

    describe mysql_session('username', 'password').query('QUERY') do
      its('stdout') { should match(/expected-result/) }
    end

where

* `mysql_session` declares a username and password, connecting locally, with permission to run the query
* `query('QUERY')` contains the query to be run
* `its('stdout') { should eq(/expected-result/) }` compares the results of the query against the expected result in the test

<br>

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test for matching databases

    sql = mysql_session('my_user','password')

    describe sql.query('show databases like \'test\';') do
      its('stdout') { should_not match(/test/) }
    end

### Alternate Connection: Different Host

    sql = mysql_session('my_user','password','db.example.com')

### Alternate Connection: Different Port

    sql = mysql_session('my_user','password','localhost',3307)

### Alternate Connection: Using a socket

    sql = mysql_session('my_user','password', nil, nil, '/var/lib/mysql-default/mysqld.sock')

### Test for a successful query

    describe mysql_session('my_user','password').query('show tables in existing_database;') do
      its('exit_status') { should eq(0) }
    end

### Test for a failing query

    describe mysql_session('my_user','password').query('show tables in non_existent_database;') do
      its('exit_status') { should_not eq(0) }
    end

### Test for specific error message

    describe mysql_session('my_user','password').query('show tables in non_existent_database;') do
      its('stderr') { should match(/Unknown database/) }
    end

<br>

## Matchers

This Chef InSpec audit resource builds a [command](https://www.inspec.io/docs/reference/resources/command) object and returns the the result object. For a full list of available matchers, please visit our [matchers page](https://www.inspec.io/docs/reference/matchers/).
