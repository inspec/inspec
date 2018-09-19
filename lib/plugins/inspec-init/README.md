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

Errors
------

Warnings
--------
```
