+++
title = "opa_cli resource"
draft = false
gh_repo = "inspec"
platform = "os"

[menu]
  [menu.inspec]
    title = "opa_cli"
    identifier = "inspec/resources/os/opa_cli.md opa_cli resource"
    parent = "inspec/resources/os"
+++

Use the `opa_cli` Chef InSpec audit resource to query Open Policy Agent (OPA) using an OPA policy file, a data file, and a query.

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

## Syntax

An `opa_cli` resource block declares OPA policy configurations that can be tested.

    describe opa_cli(policy: "example.rego", data: "input.json", query: "data.example.allow") do
      its(["result"]) { should eq "value" }
    end

where

- `data` specifies the json formatted input data or file path.
- `policy` the path to policy file.
- `query` specifies the query to be run.
- `its(["result"]) { should eq "value" }` compares the results of the query against the expected result in the test

## parameters

The `opa_cli` resource InSpec resource accepts `policy`, `data`, `query`, and `opa_executable_path` as parameters.

### `policy` _(required)_

The path to the OPA policy file.

### `data` _(required)_

An OPA query as a JSON data file or a string in JSON format.

### `query` _(required)_

The query to be evaluated against policy and input data.

### `opa_executable_path`

This is the full path to the OPA binary or EXE file used for running the OPA CLI or OPA commands. By default it will consider that the path is added in PATH variable.

## Properties

### result

The `result` property checks whether the resource query returns an empty result.

    its('result') { should be nil }

### allow

The `allow` property checks if specific input matches the policy defined in OPA. This matcher will not work if `allow` is not defined in the policy file.

    its('allow') { should eq 'value' }

## Examples

The following examples show how to use this Chef InSpec audit resource:

    describe opa_cli(query: "data.example.allow", policy: "example.rego", data: "input.json", opa_executable_path: "./opa") do
      its("result") { shoule_not be nil }
      its(["result", 0, "expressions", 0, "value"]) { should eq true }
      its("allow") { should eq "true" }
    end

The above example shows how the `allow` value can be fetched in two ways.

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).
