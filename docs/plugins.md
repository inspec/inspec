---
title: About InSpec and Train Plugins
---

# InSpec and Train Plugins

## What are InSpec Plugins?

InSpec Plugins are optional software components that extend the capabilities of InSpec. For example, `inspec-iggy` is a plugin project that aims to generate InSpec controls from infrastructure-as-code.  Plugins are distributed as RubyGems, and InSpec manages their installation. InSpec plugins always begin with the prefix 'inspec-'.

## What are Train Plugins?

Train plugins allow InSpec to speak to new kinds of remote targets.  For example, if you wanted to audit a Kubernetes cluster, you might want a transport that can talk to the supervisor API.  You'd develop a train plugin for that, and install it using the InSpec command line. Train plugins always begin with the prefix 'train-'.

## What can plugins do?

Currently, each plugin can offer one or more of these capabilities:

 * define a new command-line-interface (CLI) command suite
 * connectivity to new types of hosts or cloud providers (`train` plugins)

Future work might include new capability types, such as:

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
$ inspec plugin install train-some-plugin
```

For more details on what the `plugin` command can do, see the [online help](https://www.inspec.io/docs/reference/cli/#plugin), or run `inspec plugin help`.

## How do I write a plugin?

### InSpec Plugins

For details on how to author an InSpec Plugin, see the [developer documentation](https://github.com/inspec/inspec/blob/master/docs/dev/plugins.md)

### Train Plugins

For details on how to author a Train Plugin, see the [developer documentation](https://github.com/inspec/train/blob/master/docs/dev/plugins.md)