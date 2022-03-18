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

Use the `cgroup` Chef InSpec audit resource to test different parameters values of the cgroup resource controllers. A control group (cgroup) is a Linux kernel feature that limits, accounts for, and isolates the resource usage (CPU, memory, disk I/O, network, and so on) of a collection of processes.


## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

## Syntax

A `cgroup` Chef InSpec audit resource tests different parameters value of the cgroup resource controllers.

    describe cgroup("carrotking") do
      its("cupset.cpus") { should eq 0 }
    end
where

- `'cupset.cpus'` is a property of this resource and a parameter of the cpuset resource controller
- `'carrotking'` is the name of cgroup directory

## Properties

- All parameters of the cgroup resource controller are valid properties of this resource. Some of them are: `cupset.cpus`, `memory.limit_in_bytes`, `memory.stat`, `freezer.state`, `cpu.stat`, `cpuacct.usage`, `pids.current`, `blkio.throttle.io_service_bytes`, etc.

## Matchers
- For a full list of available matchers, please visit our [matchers page](https://docs.chef.io/inspec/matchers/).
- The matchers applicable for this resource are: `eq`, `cmp`, `match`.

### eq
`eq` tests for exact equality of two values. It fails if types don’t match. Please keep this in mind, when comparing configuration entries that are numbers. For less restrictive comparisons, please use `cmp`

### cmp
Unlike `eq`, `cmp` is a matcher for less-restrictive comparisons. It will try to fit the actual value to the type you are comparing it to. This is meant to relieve the user from having to write type-casts and resolutions.

### match
`match` checks if a string matches a regular expression. Use `match` when the output of `cgget -n -r [subsytem.parameters] [cgroup-name]` is a multi-line output.

## Examples
The following examples show how to use this Chef InSpec audit resource.

### Example 1

Use `eq` to test for parameters that have an integer value

    describe cgroup("carrotking") do
      its("cupset.cpus") { should eq 0 }
    end
### Example 2

Use `cmp` to test for parameters with less-restrictive comparisons

    describe cgroup("carrotking") do
      its("memory.limit_in_bytes") { should cmp 9223372036854771712 }
    end

### Example 3

Use `match` to test for parameters that have multi-line values

    describe cgroup("carrotking") do
      its("memory.stat") { should match /\bhierarchical_memory_limit 9223372036854771712\b/ }
    end


**Note**: Use appropriate matchers while testing. Resource controller parameters having single-line integer values can be tested using `eq` or `cmp` whereas `match` can be used for testing multi-line values where the value to be checked can be passed as regex. The value here considered is the output obtained on `cgget -n -r [subsytem.parameters] [cgroup-name]`

