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

A profile dependency is needed when:

 * using `include_controls` or `require_controls` in order to load controls defined in another profile
 * using a custom InSpec resource defined in another profile

Use the `depends` setting in the `inspec.yml` file to specify one (or more) profiles on which this profile depends. A profile dependency may be sourced from a path, URL, a git repo, a cookbook located on Chef Supermarket or on GitHub, or a profile located on the Chef Compliance server.

## Path

The `path` setting defines a profile that is located on disk. This setting is typically used during development of profiles and when debugging profiles. This setting does not support version constraints. If the location of the profile does not exist, an error is returned.

For example:

    depends:
    - name: my-profile
      path: /absolute/path
    - name: another
      path: ../relative/path

## URL

The `url` setting specifies a profile that is located at an HTTP- or HTTPS-based URL. The profile must be accessible via a HTTP GET operation and must be a valid profile archive (zip, tar, tar.gz format). If the download fails, the profile is inaccessible, or not in the correct format, an error is returned.

For example:

    depends:
    - name: my-profile
      url: https://my.domain/path/to/profile.tgz

## git

A `git` setting specifies a profile that is located in a git repository, with optional settings for branch, tag, commit, and version. The source location is translated into a URL upon resolution. This type of dependency supports version indexing via semantic versioning as git tags.

For example:

    depends:
    - name: git-profile
      git: http://url/to/repo
      branch:  desired_branch
      tag:     desired_version
      commit:  pinned_commit
      version: semver_via_tags

## Chef Supermarket

A `supermarket` setting specifies a profile that is located in a cookbook hosted on Chef Supermarket. The source location is translated into a URL upon resolution.

For example:

    depends:
    - name: supermarket-profile
      supermarket: supermarket-username/supermarket-profile

Available Supermarket profiles can be listed with `inspec supermarket profiles`.

## GitHub

A `github` setting specifies a profile that is located in a repository hosted on GitHub. The source location is translated into a URL upon resolution.

For example:

    depends:
    - name: gh-profile
      github: username/project

A path to a Git commit or tag on GitHub can also be used:

    dev-sec/linux-baseline
    dev-sec/linux-baseline/tree/2.0
    dev-sec/linux-baseline/tree/48bd4388ddffde68badd83aefa654e7af3231876

would all download profiles corresponding to the GitHub URL, https://github.com/dev-sec/linux-baseline/tree/48bd4388ddffde68badd83aefa654e7af3231876, for example.

## Chef Compliance

A `compliance` setting specifies a profile that is located on the Chef Compliance server.

For example:

    depends:
      - name: linux
        compliance: base/linux

You need to `inspec vendor` the profile before uploading it to Chef Compliance version 1.7.7 or newer. The vendor subcommand fetches all dependent profiles and stores them in the `vendor` directory.

## Define in inspec.yml

Use the `depends` setting in the `inspec.yml` file to define any combination of profile dependencies. For example:

    depends:
      - name: ssh-hardening
        supermarket: hardening/ssh-hardening
        version: '= 2.0.0'
      - name: os-hardening
        url: https://github.com/dev-sec/tests-os-hardening/archive/master.zip
      - name: ssl-benchmark
        git: https://github.com/dev-sec/ssl-benchmark.git
        version: '< 2.0'
      - name: windows-patch-benchmark
        git: https://github.com/chris-rock/windows-patch-benchmark.git
        version: '~> 0.6'
      - name: linux
        compliance: base/linux

## Vendoring Dependencies

When you execute a local profile, the `inspec.yml` file will be read in order to source any profile dependencies. It will then cache the dependencies locally and generate an `inspec.lock` file. If you add or update dependencies in `inspec.yml`, please refresh the lock file by either:

 * running `inspec vendor` inside the profile directory; or
 * deleting `inspec.lock` before running `inspec exec`

# Profile Inheritance

When a profile is run, it may include controls that are defined in other profiles. Controls may also be required.

This requires an `inspec.yml` dependency to the profile you inherit from.

## include_controls

The `include_controls` keyword may be used in a profile to import all rules from the named profile.

For example, to include controls from the `cis-level-1` profile when running the `cis-fs-2.7` profile:

    include_controls 'cis-level-1' do

      control "cis-fs-2.7" do
        impact 1.0
      ...

    end

To include controls from the `cis-level-1` profile, but skipping two controls within that profile:

    include_controls 'cis-level-1' do

      skip_control "cis-fs-2.1"
      skip_control "cis-fs-2.2"

    end

## require_controls

The `require_controls` keyword may be used to load only specific controls from the named profile.

For example, to require that controls `cis-fs-2.1` and `cis-fs-2.2` be loaded from the `cis-level-1` profile:

    require_controls 'cis-level-1' do

      control "cis-fs-2.1"
      control "cis-fs-2.2"

    end


## require_resource

By default, all of the resources from a listed dependency are available
for use in your profile. If two of your dependencies provide a resource with
the same name, you can use the `require_resource` DSL function to
disambiguate the two:

    require_resource(profile: 'my_dep', resource: 'my_res',
                     as: 'my_res2')

This will allow you to reference the resource `my_res` from the
profile `my_dep` using the name `my_res2`.

# Profile Attributes

Attributes may be used in profiles to define secrets, such as user names and passwords, that should not otherwise be stored in plain-text in a cookbook. First specify a variable in the control for each secret, then add the secret to a Yaml file located on the local machine, and then run `inspec exec` and specify the path to that Yaml file using the `--attrs` attribute.

For example, a control:

    val_user = attribute('user', default: 'alice', description: 'An identification for the user')
    val_password = attribute('password', description: 'A value for the password')

    describe val_user do
      it { should eq 'bob' }
    end

    describe val_password do
      it { should eq 'secret' }
    end

And a Yaml file named `profile-attribute.yml`:

    user: bob
    password: secret

The following command runs the tests and applies the secrets specified in `profile-attribute.yml`:

    $ inspec exec examples/profile-attribute --attrs examples/profile-attribute.yml

See the full example in the InSpec open source repository: https://github.com/chef/inspec/tree/master/examples/profile-attribute

# Profile files

An InSpec profile may contain additional files that can be accessed during tests. This covers use-cases where e.g. a list of ports is provided to be tested.

To access these files, they must be stored in the `files` directory at the root of a profile. They are accessed by their name relative to this folder with `inspec.profile.file(...)`.

Here is an example for reading and testing a list of ports. The folder structure is:

    examples/profile
    ├── controls
    │   ├── example.rb
    |── files
    │   └── services.yml
    └── inspec.yml

With `services.yml` containing:

    - service_name: httpd-alpha
      port: 80
    - service_name: httpd-beta
      port: 8080

The tests in `example.rb` can now access this file:

    my_services = yaml(content: inspec.profile.file('services.yml')).params

    my_services.each do |s|
      describe service(s['name']) do
        it { should be_running }
      end

      describe port(s['port']) do
        it { should be_listening }
      end
    end
