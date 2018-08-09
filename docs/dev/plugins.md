# Developing InSpec Plugins for the v2 plugin API

## Introduction

### Inspiration

The software design of the Inspec Plugin v2 API is deeply inspired by the Vagrant plugin v2 system.  While the Inspec Plugin v2 system is an independent implementation, acknowledgements are due to the Hashicorp team for such a well-thought-out design.

### Note About versions

"v2" refers to the second major version of the Plugin API.  It doesn't refer to the Inspec release number.

## How Plugins are Located and Loaded

### Plugins are usually gems

The normal distribution and installation method is via gems, handled by the `inspec plugin` command.

TODO: give basic overview of `inspec plugin` and link to docs

### Plugins may also be found by path

For local development or site-specific installations, you can also 'install' a plugin by path using `inspec plugin`, or edit `~/.inspec/plugins.json` directly to add a plugin.

### The plugins.json file

Inspec stores its list of known plugins in a file, `~/.inspec/plugins.json`. The purpose of this file is avoid having to do a gem path filesystem scan to locate plugins.  When you install, update, or uninstall a plugin using `inspec plugin`, InSpec updates this file.

You can tell inspec to use a different config directory using the INSPEC_CONFIG_DIR environment variable.

Top-level entries in the JSON file:

 * `plugins_config_version` - must have the value "1.0.0". Reserved for future format changes.
 * `plugins` - an Array of Hashes, each containing information about plugins that are expected to be installed

Each plugin entry may have the following keys:

 * `name` - Required.  String name of the plugin.  Internal machine name of the plugin. Must match `plugin_name` DSL call (see Plugin class below).
 * `installation_type` - Optional, default "gem".  Selects a loading mechanism, may be either "path" or "gem"
 * `installation_path` - Required if installation_type is "path".  A `require` will be attempted against this path.  It may be absolute or relative; Inspec adds both the process current working directory as well as the Inspec installation root to the load path.

TODO: keys for gem installations

Putting this all together, here is a plugins.json file from the Inspec test suite:

```json
{
  "plugins_config_version" : "1.0.0",
  "plugins": [
    {
      "name": "inspec-meaning-of-life",
      "installation_type": "path",
      "installation_path": "test/unit/mock/plugins/meaning_of_life_path_mode/inspec-meaning-of-life"
    }
  ]
}
```

## Plugin Parts

TODO

### A Typical Plugin File Layout

### Entry Point

### Plugin File

### Implementation Files

## Plugin Lifecycle

All queries regarding plugin state should be directed to Inspec::Plugin::V2::Registry.instance, a singleton object.

```ruby
registry = Inspec::Plugin::V2::Registry.instance
plugin_status = registry[:'inspec-meaning-of-life']
```


### Known Plugins

If a plugin is mentioned in `plugins.json`, it is *known*.  You can get its status, a `Inspec::Plugin::V2::Status` object.

Reading the plugins.json file is handled by the Loader when Loader.new is called; at that point the registry should know about plugins.

### Loaded Plugins

Next, we load plugins.  Loading means that we `require` the entry point determined from the plugins.json, and

TODO

### Activated Plugins
