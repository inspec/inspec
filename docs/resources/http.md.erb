---
title: About the http Resource
platform: linux
---

# http

Use the `http` Chef InSpec audit resource to test an http endpoint.

<br>

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.10.0 of InSpec.

## Syntax

An `http` resource block declares the configuration settings to be tested:

    describe http('url', auth: {user: 'user', pass: 'test'}, params: {params}, method: 'method', headers: {headers}, data: data, open_timeout: 60, read_timeout: 60, ssl_verify: true, max_redirects: 3) do
      its('status') { should eq number }
      its('body') { should eq 'body' }
      its('headers.name') { should eq 'header' }
    end

where

* `('url')` is the url to test
* `auth: { user: 'user', pass: 'test' }` may be specified for basic auth request
* `{params}` may be specified for http request parameters
* `'method'` may be specified for http request method (default to 'GET')
* `{headers}` may be specified for http request headers
* `data` may be specified for http request body
* `open_timeout` may be specified for a timeout for opening connections (default to 60)
* `read_timeout` may be specified for a timeout for reading connections (default to 60)
* `ssl_verify` may be specified to enable or disable verification of SSL certificates (default to `true`)
* `max_redirects` may be specified to control how many HTTP Redirects to follow (defaults to `0`)

<br>

## Example

The following examples show how to use this Chef InSpec audit resource. An `http` resource block declares the configuration settings to be tested:

### Simple http test

For example, a service is listening on default http port can be tested like this:

    describe http('http://localhost') do
      its('status') { should cmp 200 }
    end

### Complex http test

    describe http('http://localhost:8080/ping',
                  auth: {user: 'user', pass: 'test'},
                  params: {format: 'html'},
                  method: 'POST',
                  headers: {'Content-Type' => 'application/json'},
                  data: '{"data":{"a":"1","b":"five"}}') do
      its('status') { should cmp 200 }
      its('body') { should cmp 'pong' }
      its('headers.Content-Type') { should cmp 'text/html' }
    end

<br>

## Local vs. Remote

Beginning with Chef InSpec 1.41, you can enable the ability to have the HTTP test execute on the remote target:

    describe http('http://www.example.com', enable_remote_worker: true) do
      its('body') { should cmp 'awesome' }
    end

In Chef InSpec 2.0, the HTTP test will automatically execute remotely whenever Chef InSpec is testing a remote node.

<br>

## Parameters

* `url`, `auth`, `params`, `method`, `headers`, `data`, `open_timeout`, `read_timeout`, `ssl_verify`, `max_redirects`

## Parameter Examples

### url

`('url')` is the url to test.

    describe http('http://localhost:8080/ping') do
      ...
    end

### auth

`auth: { user: 'user', pass: 'test' }` may be specified for basic auth request.

    describe http('http://localhost:8080/ping',
                  auth: {user: 'user', pass: 'test'}) do
      ...
    end

### params

`{params}` may be specified for http request parameters.

    describe http('http://localhost:8080/ping',
                  params: {format: 'html'}) do
      ...
    end

### method

`'method'` may be specified for http request method (default to 'GET').

    describe http('http://localhost:8080/ping',
                  method: 'POST') do
      ...
    end

### headers

`{headers}` may be specified for http request headers.

    describe http('http://localhost:8080/ping',
                  headers: {'Content-Type' => 'application/json'}) do
      ...
    end

### data

`data` may be specified for http request body.

        describe http('http://localhost:8080/ping',
                  data: '{"data":{"a":"1","b":"five"}}') do
          ...
        end

### open_timeout

`open_timeout` may be specified for a timeout for opening connections (default to 60).

    describe http('http://localhost:8080/ping',
                  open_timeout: '90') do
      ...
    end

### read_timeout

`read_timeout` may be specified for a timeout for reading connections (default to 60).

    describe http('http://localhost:8080/ping',
                  read_timeout: '90') do
      ...
    end

### ssl_verify

`ssl_verify` may be specified to enable or disable verification of SSL certificates (default to `true`).

    describe http('http://localhost:8080/ping',
                  ssl_verify: true) do
      ...
    end

<br>

### max_redirects

`max_redirects` may be specified to control how many HTTP Redirects to follow (default to 0).

    describe http('http://localhost:8080/ping',
                  max_redirects: 3) do
      ...
    end

<br>

## Properties

* `body`, `headers`, `http_method`, `status`,

<br>

## Property Examples

### body

The `body` matcher tests body content of http response:

    its('body') { should eq 'hello\n' }

### headers

The `headers` matcher returns an hash of all http headers:

    its('headers') { should eq {} }

Individual headers can be tested via:

    its('headers.Content-Type') { should cmp 'text/html' }

### status

The `status` matcher tests status of the http response:

    its('status') { should eq 200 }

<br>

## Matchers

For a full list of available matchers, please visit our [matchers page](https://www.inspec.io/docs/reference/matchers/).
