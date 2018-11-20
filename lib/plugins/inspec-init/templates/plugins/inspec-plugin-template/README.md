# InSpec Plugin Example - Resource Lister

This plugin provides an example of building a plugin for use with [InSpec](https://inspec.io). Its functionality is simple, but useful: list resources included with InSpec.

## To Install this as a User

You will need InSpec v2.3 or later.

If you want to just use this (not learn how to write a plugin), you can do so by simply running:

```
you@machine $ inspec plugin install inspec-resource-lister
```

You can then run:

```
you@machine $ inspec plugin help listresources
# ... Usage info

you@machine $ inspec plugin listresources core
aide_conf
apache
apache_conf
... snip ...
yumrepo
zfs_dataset
zfs_pool
------------------------------
160 resources total
```

## Features of This Example Kit

This example plugin is a full-fledged plugin example, with everything a real-world, industrial grade plugin would have, including:

* an implementation of an InSpec CLI Command, using the InSpec PluginV2 API
* documentation (you are reading it now)
* tests, at the unit and functional level
* a .gemspec, for packaging and publishing it as a gem
* a Gemfile, for managing its dependencies
* a Rakefile, for running development tasks
* Rubocop linting support for using the base InSpec project rubocop.yml (See Rakefile)

You are encouraged to use this plugin as a starting point for real plugins.

## Development of a Plugin

[Plugin Development](https://github.com/inspec/inspec/blob/master/docs/dev/plugins.md) is documented on the `inspec` project on GitHub.  Additionally, this example
plugin has extensive comments explaining what is happening, and why.

### A Tour of the Plugin

One nice circuit of the plugin might be:
 * look at the gemspec, to see what the plugin thinks it does
 * look at the functional tests, to see the plugin proving it does what it says
 * look at the unit tests, to see how the plugin claims it is internally structured
 * look at the Rakefile, to see how to interact with the project
 * look at lib/inspec-resource-lister.rb, the entry point which InSpec will always load if the plugin is installed
 * look at lib/inspec-resource-lister/plugin.rb, the plugin definition which InSpec uses to understand what the plugin _can_ do.
 * look at lib/inspec-resource-lister/cli_command.rb, the CLI Command implementation itself.

