+++
title = "yum resource"
draft = false
gh_repo = "inspec"
platform = "linux"

[menu]
  [menu.inspec]
    title = "yum"
    identifier = "inspec/resources/os/yum.md yum resource"
    parent = "inspec/resources/os"
+++

Use the `yum` Chef InSpec audit resource to test packages in the Yum repository.

## Availability

### Installation

{{% inspec/inspec_installation %}}

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

A `yum` resource block declares a package repo, tests if the package repository is present, and if it that package repository is a valid package source (i.e. "is enabled"):

    describe yum.repo('name') do
      it { should exist }
      it { should be_enabled }
    end

where

- `repo('name')` is the (optional) name of a package repo, using either a full identifier (`'updates/7/x86_64'`) or a short identifier (`'updates'`)

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test if the yum repo exists

    describe yum do
      its('repos') { should exist }
    end

### Test if the 'base/7/x86_64' repo exists and is enabled

    describe yum do
      its('repos') { should include 'base/7/x86_64' }
      its('epel') { should exist }
      its('epel') { should be_enabled }
    end

### Test if a specific yum repo exists

    describe yum.repo('epel') do
      it { should exist }
      it { should be_enabled }
    end

### Test a particular repository configuration, such as its Base URL

    describe yum.repo('mycompany-artifacts') do
      it { should exist }
      it { should be_enabled }
      its('baseurl') { should include 'mycompany.biz' }
    end

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### be_enabled

The `be_enabled` matcher tests if the package repository is a valid package source:

    it { should be_enabled }

### exist

The `exist` matcher tests if the package repository exists:

    it { should exist }

### repo('name')

The `repo('name')` matcher names a specific package repository:

    describe yum.repo('epel') do
      ...
    end

### repos

The `repos` matcher tests if a named repo, using either a full identifier (`'updates/7/x86_64'`) or a short identifier (`'updates'`), is included in the Yum repo:

    its('repos') { should include 'some_repo' }

### shortname

The `shortname` matcher names a specific package repository's group identifier. For example, if a repository's group name is "Directory Server", the corresponding group identifier is typically "directory-server":

    describe yum.repo('Directory Server') do
      its('shortname') { should eq 'directory-server' }
    end
