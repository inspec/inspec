+++
title = "aide_conf resource"
draft = false
gh_repo = "inspec"
platform = "linux"

[menu]
  [menu.inspec]
    title = "aide_conf"
    identifier = "inspec/resources/os/aide_conf.md aide_conf resource"
    parent = "inspec/resources/os"
+++

Use the `aide_conf` Chef InSpec audit resource to test the rules established for the file integrity tool AIDE. Controlled by the aide.conf file typically at /etc/aide.conf.

## Availability

### Installation

{{% inspec/inspec_installation %}}

### Version

This resource first became available in v1.37.6 of InSpec.

## Syntax

An `aide_conf` resource block can be used to determine if the selection lines contain one (or more) directories whose files should be added to the aide database:

    describe aide_conf('path') do
      its('selection_lines') { should include '/sbin' }
    end

where

- `'selection_lines'` refers to all selection lines found in the aide.conf file
- `('path')` is the non-default path to the `aide.conf` file (optional)
- `should include 'value'` is the value that is expected

Use the where clause to match a selection_line to one rule or a particular set of rules found in the aide.conf file:

    describe aide_conf.where { selection_line == '/bin' } do
      its('rules.flatten') { should include 'r' }
    end

    describe aide_conf.where { selection_line == '/sbin' } do
      its('rules') { should include ['p', 'i', 'l', 'n', 'u', 'g', 'sha512'] }
    end

## Properties

### `rules`

The `rules` property returns the list of rules set in the `aide.conf` file.

    its('rules') { should include ['r', 'sha512'] }

### `all_have_rule`

The `all_have_rule` property returns the all selected lines from `aide.conf` file e.g. 'p', 'i' etc.

    aide_conf.all_have_rule('sha512')

### `selection_lines`

The `selection_lines` property returns the list of lines from `aide.conf` file.

    its('selection_lines') { should include '/sbin' }

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test if all selection lines contain the `xattr` rule

    describe aide_conf.all_have_rule('xattr') do
      it { should eq true }
    end

### Test whether selection line for /bin contains a particular rule

    describe aide_conf.where { selection_line == '/bin' } do
      its('rules.flatten') { should include 'r' }
    end

### Test whether the selection line for `/sbin` consists of a particular set of rules

    describe aide_conf.where { selection_line == '/sbin' } do
      its('rules') { should include ['r', 'sha512'] }
    end

### The usage of all_have_rule will return whether or not all selection lines in audit.conf contain a particular rule:

    describe aide_conf.all_have_rule('sha512') do
      it { should eq true }
    end

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).
