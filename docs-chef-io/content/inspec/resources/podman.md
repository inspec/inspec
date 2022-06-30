+++
title = "podman resource"
draft = false
gh_repo = "inspec"
platform = "unix"

[menu]
  [menu.inspec]
    title = "podman"
    identifier = "inspec/resources/os/podman.md podman resource"
    parent = "inspec/resources/os"
+++

Use the `podman` Chef InSpec audit resource to test the configuration data for the Podman resources.

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

## Syntax

A `podman` Chef InSpec audit resource ...

    describe podman.containers do
      its('ids') { should include "591270d8d80d26671fd6ed622f367fbe19004d16e3b519c292313feb5f22e7f7" }
      its('images) { should include "docker.io/library/ubuntu:latest" }
    end

or:

    describe podman.containers.where(id: "591270d8d80d26671fd6ed622f367fbe19004d16e3b519c292313feb5f22e7f7") do
      its('status') { should include "Up 44 hours ago" }
    end

where

- `.where()` may specify a specific item and value, to which the resource parameters are compared
- `auto_remove`, `commands`, `created_at`, `ids`, `images`, `names`, `status`, `exited`, `exit_code`, `image_ids`, `labels`, `mounts`,     `namespaces`, `pids`, `pods`, `podnames`, `ports`, `sizes`, `started_at`, `states` and `created` are valid parameters for `containers`



