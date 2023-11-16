+++
title = "About Chef InSpec and Train Plugins"
draft = false
gh_repo = "inspec"

[menu]
  [menu.inspec]
    title = "Plugins"
    identifier = "inspec/Plugins"
    parent = "inspec"
    weight = 90
+++

## What are Chef InSpec plugins?

Chef InSpec plugins are optional software components that extend the capabilities of InSpec.
For example, [`inspec-iggy`](https://github.com/inspec/inspec-iggy) is a plugin project that aims to generate Chef InSpec controls from infrastructure-as-code files.
Plugins are distributed as RubyGems, and Chef InSpec manages their installation.
Chef InSpec plugins always begin with the prefix 'inspec-'.

## What are Train plugins?

Train plugins allow Chef InSpec to speak to new kinds of targets (typically new
remote targets or APIs, but you could treat the local system in a new way if you
wished to). For example, if you wanted to audit a Kubernetes cluster, you might
want a transport that can talk to the supervisor API. You would develop a Train
plugin for that, and install it using the Chef InSpec command line. Train plugins
always begin with the prefix 'train-'.

## What can plugins do?

Currently, each plugin can offer one or more of these capabilities:

- define new output formats ("reporters")
- input sources
- define a new command-line-interface (CLI) command suite (`inspec` plugins)
- connectivity to new types of hosts or cloud providers (`train` plugins)
- DSL extensions at the file, control, describe block, or test level
- DSL extensions for custom resources

## Find available plugins

The Chef InSpec CLI can tell you which plugins are available:

```bash
inspec plugin search inspec-
```

## Install and manage plugins

The Chef InSpec command line now offers a new subcommand just for managing plugins.

You can install a plugin by running:

```bash
inspec plugin install inspec-some-plugin
inspec plugin install train-some-plugin
```

For more details on what the `plugin` command can do, run `inspec plugin help`.

## Use a different Gem server

You can specify an alternate source by passing the base of your Gem repository to
the `--source` parameter:

```bash
inspec plugin search --source https://private.example.com inspec-private
inspec plugin install --source https:/private.example.com inspec-private-plugin
```

## Write a plugin

For details on creating a Chef InSpec plugin, see the
[InSpec developer documentation](https://github.com/inspec/inspec/blob/main/dev-docs/plugins.md)

For details on creating a Train plugin, see the
[Train developer documentation](https://github.com/inspec/train/blob/main/docs/plugins.md)
