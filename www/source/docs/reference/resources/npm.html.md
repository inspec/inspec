---
title: About the npm Resource
platform: os
---

# npm

Use the `npm` Chef InSpec audit resource to test if a global NPM package is installed. NPM is the the package manager for [Node.js packages](https://docs.npmjs.com), such as Bower and StatsD.

<br>

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

A `npm` resource block declares a package and (optionally) a package version:

    describe npm('npm_package_name') do
      it { should be_installed }
    end

where

* `('npm_package_name')` must specify an NPM package, such as `'bower'` or `'statsd'`
* `be_installed` is a valid matcher for this resource

You can also specify additional options:

    describe npm('npm_package_name', path: '/path/to/project') do
      it { should be_installed }
    end

The `path` specifies a folder, that contains a `node_modules` subdirectory. It emulates running `npm` inside the specified folder. This way you can inspect local NPM installations as well as global ones.

<br>

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Verify that bower is installed, with a specific version

    describe npm('bower') do
      it { should be_installed }
      its('version') { should eq '1.4.1' }
    end

### Verify that statsd is not installed

    describe npm('statsd') do
      it { should_not be_installed }
    end

<br>

## Matchers

For a full list of available matchers, please visit our [matchers page](https://www.inspec.io/docs/reference/matchers/).

### be_installed

The `be_installed` matcher tests if the named Gem package and package version (if specified) is installed:

    it { should be_installed }

### version

The `version` matcher tests if the named package version is on the system:

    its('version') { should eq '1.2.3' }
