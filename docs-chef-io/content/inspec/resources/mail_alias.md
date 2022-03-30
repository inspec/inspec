+++
title = "mail_alias resource"
draft = false
gh_repo = "inspec"
platform = "unix"

[menu]
  [menu.inspec]
    title = "mail_alias"
    identifier = "inspec/resources/os/mail_alias.md mail_alias resource"
    parent = "inspec/resources/os"
+++

Use the `mail_alias` Chef InSpec audit resource to test mail alias present in the aliases file.

## Availability

### Installation

This resource is distributed along with Chef InSpec itself.

## Syntax

A `mail_alias` Chef InSpec audit resource allows to test mail alias present in the aliases file.

    describe mail_alias("daemon") do
        it { should be_aliased_to "root" }
    end
where

- `'daemon'` is an alias present in `/etc/aliases` of the target system
- `'root'` is the value assigned to the alias
- `be_aliased_to` is a matcher of this resource

## Matchers

For a full list of available matchers, please visit our [matchers page](https://docs.chef.io/inspec/matchers/). The specific matchers of this resource is: `be_aliased_to`.

### be_aliased_to

The `be_aliased_to` matcher tests if the given input value is assigned to the initialized alias.

    it { should be_aliased_to "root" }

## Examples
The following examples show how to use this Chef InSpec audit resource.

### Check if the alias `daemon` is aliased to `root`

    describe mail_alias("daemon") do
      it { should be_aliased_to "root" }
    end

### Check if the alias `mailadmin` are aliased to `inspecadmin@chef.io` and `chefadmin@chef.io`

    describe mail_alias("mailadmin") do
      it { should be_aliased_to "inspecadmin@chef.io" }
      it { should be_aliased_to "chefadmin@chef.io" }
    end