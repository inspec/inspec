# Developing InSpec Plugins

## Plugins are gems

## How InSpec finds plugins

### ~/.inspec.d/plugins.yaml

This file describes the plugins that InSpec knows about.  When you install, update, or uninstall a plugin, InSpec updates this file.

You can tell inspec to use a different config directory using the `--config-dir` option (available to all `inspec` CLI commands).  By default, this is `~/.inspec.d/`

If you are developing a CLI plugin (which adds custom subcommands and options), you can tell InSpec to look for a config dir using the INSPEC_CONFIG_DIR environment variable.

###