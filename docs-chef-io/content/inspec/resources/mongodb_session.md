+++
title = "mongodb_session resource"
draft = false
gh_repo = "inspec"
platform = "os"

[menu]
  [menu.inspec]
    title = "mongodb_session"
    identifier = "inspec/resources/os/mongodb_session.md mongodb_session resource"
    parent = "inspec/resources/os"
+++

Use the `mongodb_session` Chef InSpec audit resource to run MongoDB command against a MongoDB Database.

## Availability

### Install

{{< readfile file="content/inspec/reusable/md/inspec_installation.md" >}}

## Syntax

A `mongodb_session` resource block declares the `user`, `password`, and `database` to use for the session and then the command to be run:

  describe mongodb_session(user: "username", password: "password", database: "test").query(key: value) do
    its("params") { should match(/expected-result/) }
  end

where

- `mongodb_session` declares a user, password, and database, connecting locally, with permission to run the query.
- `query` contains the query to be run.
- `its("params") { should eq(/expected-result/) }` compares the results of the query against the expected result in the test

### Optional Parameters

The `mongodb_session` InSpec resource accepts `user`, `password`, `host`, `port`, `auth_source`, `auth_mech`, `ssl`, `ssl_cert`, `ssl_ca_cert`, and `auth_mech_properties` parameters.

In Particular:

#### `host`

The server host IP address. Default value: `127.0.0.1`.

#### `port`

The server port. Default value: `27017`.

#### `auth_mech`

The authentication mechanism. The available options are: `:scram`, `:scram256`, `:mongodb_x509`, and `:aws`. Default value: `:scram`.

See the MongoDB documentation on [Ruby driver authentication](https://docs.mongodb.com/ruby-driver/current/reference/authentication/) for more information.

#### `auth_source`

The database where the user’s authentication credentials are stored. The default value is the database name that is passed as a parameter to the resource.

#### `ssl`

Whether to use the SSL security protocol or not. Set to `true` to use SSL transport, default value: `false`.  See the MongoDB documentation on [Ruby Driver authentication](https://docs.mongodb.com/ruby-driver/current/reference/authentication/#client-certificate-x-509) for more information.

#### 'ssl_cert'

Path to the SSL certificate file.

#### `ssl_ca_cert`

Path to the SSL Certificate Authority (CA) certificate file.

#### `ssl_key`

Path to SSL key file.

#### `auth_mech_properties`

A hash of the authentication mechanism properties. This option is generally used with the AWS authentication mechanism. See the MongoDB documentation on [Ruby Driver authentication using AWS](https://docs.mongodb.com/ruby-driver/current/reference/authentication/#aws) for more information.

### MongoDB Query Reference Documentation

This resource uses the [MongoDB Ruby Driver](https://docs.mongodb.com/ruby-driver/current/reference/authentication/) to fetch the data.

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test the roles information using the `rolesInfo` command in MongoDB

    describe mongodb_session(user: "foo", password: "bar", database: "test").query(rolesInfo: "dbAdmin").params["roles"].first do
      its(["role"]) { should eq "dbAdmin" }
    end

### Test the MongoDB user role

    describe mongodb_session(user: "foo", password: "bar", database: "test").query(usersInfo: "foo").params["users"].first["roles"].first do
      its(["role"]) { should eq "readWrite" }
    end

### Test the database parameters

    describe mongodb_session(user: "foo", password: "bar", database: "test").query(rolesInfo: "dbAdmin") do
      its("params") { should_not be_empty }
      its("params") { should include "roles" }
    end

## Matchers

{{< readfile file="content/inspec/reusable/md/inspec_matchers_link.md" >}}

This resource has the following special matchers.

### params

The `params` contains all the query data.
