+++
title = "opa_api resource"
draft = false
gh_repo = "inspec"
platform = "os"

[menu]
  [menu.inspec]
    title = "opa_api"
    identifier = "inspec/resources/os/opa_api.md opa_api resource"
    parent = "inspec/resources/os"
+++

Use the `opa_api` Chef InSpec audit resource to query Open Policy Agent (OPA) using the OPA URL and data.

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

## Syntax

An `opa_api` resource block declares OPA policy configurations that can be tested.

    describe opa_api(url: "localhost:8181/v1/data/example/violation", data: "input.json") do
      its(["result"]) { should eq 'value' }
    end

where

- `'url'` specifies the url of the OPA server on which OPA is running.
- `'data'` specifies the json formatted data or json file.
- `its(["returned_result"]) { should eq 'expected_result' }` compares the results of the query against the expected result in the test.

## parameters

The `opa_api` resource InSpec resource requires a `url` and `data` as a JSON file or a string in JSON format.

### `url` _(required)_

The URL of the OPA API server.

### `data` _(required)_

An OPA query as a JSON data file or a string in JSON format.

## Examples

The following examples show how to use this Chef InSpec audit resource.

    describe opa_api(url: "localhost:8181/v1/data/example/allow", data: "input.json") do
      its(["result"]) { should eq true }
      its("allow") { should eq "true" }
    end

The above example shows how the `allow` value can be fetched in two ways.

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

## Properties

### allow

The `allow` property checks if specific input is as per the policy defined in OPA. If `allow` is not defined in the policy file then this matcher will not work.

    its('allow') { should eq 'value' }
