+++
title = "selinux resource"
draft = false
gh_repo = "inspec"
platform = "linux"

[menu]
  [menu.inspec]
    title = "selinux"
    identifier = "inspec/resources/os/selinux.md selinux resource"
    parent = "inspec/resources/os"
+++

Use the `selinux` Chef InSpec audit resource to test the state/mode of SELinux policy.

SELinux resource extracts and exposes data reported by the command 'sestatus'

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

## Syntax

An `selinux` Chef InSpec audit resource block extracts configuration settings that should be tested:

    describe selinux do
      it { should be_installed }
      it { should be_enabled }
      it { should be_enforcing }
      it { should be_permissive }
    end

## Properties

## Property Examples

