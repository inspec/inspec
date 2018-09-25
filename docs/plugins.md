---
title: About InSpec Plugins
---

# InSpec Plugins

## What are InSpec Plugins?

Plugins are optional software components that extend the capabilities of InSpec. For example, `inspec-iggy` is a plugin project that aims to generate InSpec controls from infrastructure-as-code.  Plugins are distributed as RubyGems, and InSpec manages their installation.

## What can plugins do?

Currently, each plugin can offer one or more of these capabilities:

 * define a new command-line-interface (CLI) command suite

Future work might include new capability types, such as:

 * connectivity to new types of hosts or cloud providers (`train` transports)
 * reporters (output generators)
 * DSL extensions at the file, control, or test level
 * attribute fetchers to allow reading InSpec attributes from new sources (for example, a remote, encrypted key-value store)

## How do I find out which plugins are available?

The InSpec CLI can tell you which plugins are available:

```bash
$ inspec plugin search
```

## How do I install and manage plugins?

The InSpec command line now offers a new subcommand just for managing plugins.

You can install a plugin by running:

```bash
$ inspec plugin install inspec-some-plugin
```

For more details on what the `plugin` command can do, see the [online help](https://www.inspec.io/docs/reference/cli/#plugin), or run `inspec plugin help`.

## How do I write a plugin?

For details on how to author a Plugin, see the [developer documentation](https://github.com/inspec/inspec/blob/master/docs/dev/plugins.md)