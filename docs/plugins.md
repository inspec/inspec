---
title: About Chef InSpec and Train Plugins
---

# Chef InSpec and Train Plugins

## What are Chef InSpec Plugins?

Chef InSpec Plugins are optional software components that extend the capabilities of InSpec. For example, [`inspec-iggy`](https://github.com/inspec/inspec-iggy) is a Plugin project that aims to generate Chef InSpec controls from infrastructure-as-code files. Plugins are distributed as RubyGems, and Chef InSpec manages their installation. Chef InSpec Plugins always begin with the prefix 'inspec-'.

## What are Train Plugins?

Train Plugins allow Chef InSpec to speak to new kinds of targets (typically new remote targets or APIs, but you could treat the local system in a new way if you wished to). For example, if you wanted to audit a Kubernetes cluster, you might want a transport that can talk to the supervisor API. You would develop a Train Plugin for that, and install it using the Chef InSpec command line. Train Plugins always begin with the prefix 'train-'.

## What can plugins do?

Currently, each plugin can offer one or more of these capabilities:

 * define a new command-line-interface (CLI) command suite (`inspec` plugins)
 * connectivity to new types of hosts or cloud providers (`train` plugins)
 * DSL extensions at the file, control, describe block, or test level
* DSL extensions for custom resources

Future work might include new capability types, such as:

 * reporters (output generators)
 * attribute fetchers to allow reading Chef InSpec attributes from new sources (for example, a remote encrypted key-value store)

## How do I find out which plugins are available?

The Chef InSpec CLI can tell you which plugins are available:

```bash
$ inspec plugin search inspec-
```

## How do I install and manage plugins?

The Chef InSpec command line now offers a new subcommand just for managing plugins.

You can install a plugin by running:

```bash
$ inspec plugin install inspec-some-plugin
$ inspec plugin install train-some-plugin
```

For more details on what the `plugin` command can do, see the [online help](https://www.inspec.io/docs/reference/cli/#plugin), or run `inspec plugin help`.

## How do I write a plugin?

### Chef InSpec Plugins

For details on how to author an Chef InSpec Plugin, see the [developer documentation](https://github.com/inspec/inspec/blob/master/docs/dev/plugins.md)

### Train Plugins

For details on how to author a Train Plugin, see the [developer documentation](https://github.com/inspec/train/blob/master/docs/plugins.md)
