---
title: About the os_env Resource
platform: os
---

# os_env

Use the `os_env` Chef InSpec audit resource to test the environment variables for the platform on which the system is running.

<br>

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

A `os_env` resource block declares an environment variable, and then declares its value:

    describe os_env('VARIABLE') do
      its('property') { should eq 1 }
    end

where

* `('VARIABLE')` must specify an environment variable, such as `PATH`
* `matcher` is a valid matcher for this resource

<br>

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test the PATH environment variable

    describe os_env('PATH') do
      its('split') { should_not include('') }
      its('split') { should_not include('.') }
    end

### Test the Path environment variable by specifying the target Environment (Windows)

On windows a User's environment variable may obscure the local machine (system) environment variable.  The correct environment variable may be tested as follows:

    describe os_env('PATH', 'target') do
      its('split') { should_not include('') }
      its('split') { should_not include('.') }
    end

where

* `'target'` may be either `system` or `user`

### Test Chef Habitat environment variables

Chef Habitat uses the `os_env` resource to test environment variables. The environment variables are first defined in a whitespace array, after which each environment variable is tested:

    hab_env_vars = %w(HAB_AUTH_TOKEN
                      HAB_CACHE_KEY_PATH
                      HAB_DEPOT_URL
                      HAB_ORG
                      HAB_ORIGIN
                      HAB_ORIGIN_KEYS
                      HAB_RING
                      HAB_RING_KEY
                      HAB_STUDIOS_HOME
                      HAB_STUDIO_ROOT
                      HAB_USER)

    hab_env_vars.each do |e|
      describe os_env(e) do
        its('content') { should eq nil }
      end
    end

<br>

## Matchers

For a full list of available matchers, please visit our [matchers page](https://www.inspec.io/docs/reference/matchers/).

### content

The `content` matcher return the value of the environment variable:

    its('content') { should eq '/usr/local/bin:/usr/local/sbin:/usr/sbin:/usr/bin:/sbin' }

### split

The `split` matcher splits the value of the environment variable with the `:` deliminator (use the `;` deliminator if Windows):

    its('split') { should include ('/usr/bin') }

Note: the `split` matcher returns an array including `""` for cases where there is a trailing colon (`:`), such as `dir1::dir2:`
