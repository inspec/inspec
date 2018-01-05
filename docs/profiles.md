---
title: About InSpec Profiles
---

# InSpec Profiles

InSpec supports the creation of complex test and compliance profiles, which organize controls to support dependency management and code reuse. Each profile is a standalone structure with its own distribution and execution flow.

# Profile Structure

A profile should have the following structure::

    examples/profile
    ├── README.md
    ├── controls
    │   ├── example.rb
    │   └── control_etc.rb
    ├── libraries
    │   └── extension.rb
    |── files
    │   └── extras.conf
    └── inspec.yml

where:

* `inspec.yml` includes the profile description (required)
* `controls` is the directory in which all tests are located (required)
* `libraries` is the directory in which all InSpec resource extensions are located (optional)
* `files` is the directory with additional files that a profile can access (optional)
* `README.md` should be used to explain the profile, its scope, and usage

See a complete example profile in the InSpec open source repository: https://github.com/chef/inspec/tree/master/examples/profile

## inspec.yml

Each profile must have an `inspec.yml` file that defines the following information:

 * Use `name` to specify a unique name for the profile. Required.
 * Use `title` to specify a human-readable name for the profile.
 * Use `maintainer` to specify the profile maintainer.
 * Use `copyright` to specify the copyright holder.
 * Use `copyright_email` to specify support contact information for the profile, typically an email address.
 * Use `license` to specify the license for the profile.
 * Use `summary` to specify a one line summary for the profile.
 * Use `description` to specify a multiple line description of the profile.
 * Use `version` to specify the profile version.
 * Use `supports` to specify a list of supported platform targets.
 * Use `depends` to define a list of profiles on which this profile depends.

`name` is required; all other profile settings are optional. For example:

    name: ssh
    title: Basic SSH
    maintainer: Chef Software, Inc.
    copyright: Chef Software, Inc.
    copyright_email: support@chef.io
    license: Proprietary, All rights reserved
    summary: Verify that SSH Server and SSH Client are configured securely
    version: 1.0.0
    supports:
      - os-family: linux
    depends:
      - name: profile
        path: ../path/to/profile

## Verify Profiles

Use the `inspec check` command to verify the implementation of a profile:

    $ inspec check examples/profile

# Platform Support

Use the `supports` setting in the `inspec.yml` file to specify one (or more) platforms for which a profile is targeting. The list of supported platforms may contain simple names, names and versions, or detailed flags, and may be combined arbitrarily. For example, to target anything running Debian Linux:

    name: ssh
    supports:
      - os-name: debian

and to target only Ubuntu version 14.04

    name: ssh
    supports:
      - os-name: ubuntu
        release: 14.04

and to target the entire RedHat platform (including CentOS and Oracle Linux):

    name: ssh
    supports:
      - os-family: redhat

and to target anything running on Amazon AWS:

    name: ssh
    supports:
      - platform: aws

and to target all of these examples in a single `inspec.yml` file:

    name: ssh
    supports:
      - os-name: debian
      - os-name: ubuntu
        release: 14.04
      - os-family: redhat
      - platform: aws

# Profile Dependencies

An InSpec profile can bring in the controls and custom resources from another InSpec profile. Additionally, when inheriting the controls of another profile, a profile can skip or even modify those included controls. For a more detailed explanation, see [Profile Dependencies](/profile_dependencies)

# "should" vs. "expect" syntax

Users familiar with the RSpec testing framework may know that there are two ways to write test statements: `should` and `expect`. The RSpec community decided that `expect` is the preferred syntax. However, InSpec recommends the `should` syntax as it tends to read more easily to those users who are not as technical.

InSpec will continue to support both methods of writing tests. Consider this `file` test:

    describe file('/tmp/test.txt') do
      it { should be_file }
    end

This can be re-written with `expect` syntax

    describe file('/tmp/test.txt') do
      it 'should be a file' do
        expect(subject).to(be_file)
      end
    end

The output of both of the above examples looks like this:

    File /tmp/test.txt
       ✔  should be a file

In addition, you can make use of the `subject` keyword to further control your output if you choose:

    describe 'test file' do
      subject { file('/tmp/test.txt') }
      it 'should be a file' do
        expect(subject).to(be_file)
      end
    end

... which will render the following output:

    test file
      ✔  should be a file