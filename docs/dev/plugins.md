# Developing InSpec Plugins

## Plugins are gems

## How InSpec finds plugins

### ~/.inspec/plugins.yaml

This file describes the plugins that InSpec knows about.  When you install, update, or uninstall a plugin, InSpec updates this file.

You can tell inspec to use a different config directory using the `--user-dir` option (available to all `inspec` CLI commands).

###