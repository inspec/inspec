+++
title = "cgroup resource"
draft = false
gh_repo = "inspec"
platform = "linux"

[menu]
  [menu.inspec]
    title = "cgroup"
    identifier = "inspec/resources/os/cgroup.md cgroup resource"
    parent = "inspec/resources/os"
+++

Use the `cgroup` Chef InSpec audit resource to test the different parameters values of the control group (cgroup) resource controllers. A cgroup is a Linux kernel feature that limits, accounts, and isolates the resource usage (such as CPU, memory, disk I/O, network) of a collection of processes.

## Availability

### Installation

This resource is distributed with Chef InSpec.

## Syntax

    describe cgroup("CARROTKING") do
      its("cpuset.cpus") { should eq 0 }
    end
where

- `cpuset.cpus` is a property of this resource and a parameter of the *cpuset* resource controller.
- `CARROTKING` is the name of cgroup directory.

## Properties

- All parameters of the cgroup resource controller are valid properties of this resource. Some of them are: `cpuset.cpus`, `memory.limit_in_bytes`, `memory.stat`, `freezer.state`, `cpu.stat`, `cpuacct.usage`, `pids.current`, `blkio.throttle.io_service_bytes`.

## Matchers

- For a full list of available matchers, refer [matchers page](https://docs.chef.io/inspec/matchers/).
- The matchers applicable for this resource are: `eq`, `cmp`, and `match`.

### eq

`eq` tests whether the two values are of same data type and includes configuration entries that are numbers. It fails if the types do not match. Use `cmp` for less restrictive comparisons that ignores data type while comparing.

### cmp

Unlike `eq`, `cmp` is a matcher for less-restrictive comparisons. This matcher attempts to fit the actual value to the comparing type and meant to relieve the user from having to write type-casts and resolutions.

### match

`match` checks if a string matches a regular expression. Use `match` when the output of `cgget -n -r [subsystem.parameters] [cgroup-name]` is a multi-line output.

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Example 1

Use `eq` to test for parameters that have a single line integer value. The value considered is the output obtained on `cgget -n -r [subsystem.parameters] [cgroup-name]`.

    describe cgroup("CARROTKING") do
      its("cpuset.cpus") { should eq 0 }
    end

### Example 2

Use `cmp` to test for parameters with less-restrictive comparisons and has a single line integer value. The value considered is the output obtained on `cgget -n -r [subsystem.parameters] [cgroup-name]`.

    describe cgroup("CARROTKING") do
      its("memory.limit_in_bytes") { should cmp 9223372036854771712 }
    end

### Example 3

Use `match` to test for parameters that have multi-line values and can be passed as *regex*. The value considered is the output obtained on `cgget -n -r [subsystem.parameters] [cgroup-name]`.

    describe cgroup("CARROTKING") do
      its("memory.stat") { should match /\bhierarchical_memory_limit 9223372036854771712\b/ }
    end
