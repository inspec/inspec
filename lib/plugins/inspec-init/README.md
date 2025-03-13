# InSpec Extension to create new profiles

This extensions helps you to easily create a new profile

## Usage

```
$ inspec init profile examples/new-profile
Create new profile at /Users/chartmann/Development/compliance/inspec/examples/new-profile
  * Create directory controls
  * Create file controls/example.rb
  * Create file inspec.yml
  * Create directory libraries
  * Create file README.md
  * Create file libraries/.gitkeep

$ inspec check examples/new-profile
Summary
-------
Location: examples/new-profile
Profile: examples/new-profile
Controls: 2
Timestamp: 2016-05-06T14:39:47+02:00
Valid: true

$ inspec init profile examples/new-profile --resource-dependency inspec-example-resource

Creating new profile at /Users/chartmann/Development/compliance/inspec/examples/new-profile
  * Creating file README.md
  * Creating file controls/example.rb
  * Creating file inspec.yml
  * Creating file libraries/.gitkeep

  The generated `inspec.yml` file automatically points to the InSpec resource dependency gem:

  ```yaml
  name: new-profile
  title: InSpec Profile
  maintainer: The Authors
  copyright: The Authors
  copyright_email: you@example.com
  license: Apache-2.0
  summary: An InSpec Compliance Profile
  version: 0.1.0
  depends:
    - name: inspec-example-resource
      gem: inspec-example-resource
  supports:
    platform: os
  ```

Errors
------

Warnings
--------
```
