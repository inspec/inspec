# Developing InSpec Plugins for the v2 plugin API

## Introduction

### Inspiration

The software design of the Inspec Plugin v2 API is deeply inspired by the Vagrant plugin v2 system.  While the Inspec Plugin v2 system is an independent implementation, acknowledgements are due to the Hashicorp team for such a well-thought-out design.

### Note About versions

"v2" refers to the second major version of the Plugin API.  It doesn't refer to the Inspec release number.

### Design Goals

* Load-on-demand. Improve `inspec` startup time by making plugins load heavy libraries only if they are being used.
* Independent velocity. Enable passionate community members to contribute at their own pace by shifting core development into plugin development
* Increase dogfooding. Convert internal components into plugins to reduce core complexity and allow testing in isolation

### Design Anti-goals

* Don't implement resources in plugins; use resource packs for that.

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

### A Typical Plugin File Layout

```
inspec-my-plugin.gemspec
lib/
  inspec-my-plugin.rb  # Entry point
  inspec-my-plugin/
    cli.rb             # An implementation file
    plugin.rb          # Plugin definition file
    heavyweight.rb     # A support file
```

Generally, except for the entry point, you may name these files anything you like; however, the above example is the typical convention.

### Gemspec and Plugin Dependencies

This is a normal Gem specification file. When you release your plugin as a gem, you can declare dependencies here, and Inspec will automatically install them along with your plugin.

If you are using a path-based install, Inspec will not manage your dependencies.

### Entry Point

The entry point is the file that will be `require`d at load time (*not* activation time; see Plugin Lifecycle, below).  You should load the bare minimum here - only the plugin definition file. Do not load any plugin dependencies in this file.

```ruby
# lib/inspec-my-plugin.rb
require_relative 'inspec-my-plugin/plugin'
```

### Plugin Definition File

The plugin definition file uses the plugin DSL to declare a small amount of metadata, followed by as many activation hooks as your plugin needs.

While you may use any valid Ruby module name, we encourage you to namespace your plugin under `InspecPlugins::YOUR_PLUGIN`.

```ruby
# lib/inspec-my-plugin/plugin.rb
module InspecPlugins
  module MyPlugin
    # Class name doesn't matter, but this is a reasonable default name
    class PluginDefinition < Inspec.plugin(2)

      # Metadata
      # Must match entry in plugins.json
      plugin_name :'inspec-my-plugin'

      # Activation hooks
      # TODO
    end
  end
end
```

### Implementation Files

TODO

## Plugin Lifecycle

All queries regarding plugin state should be directed to Inspec::Plugin::V2::Registry.instance, a singleton object.

```ruby
registry = Inspec::Plugin::V2::Registry.instance
plugin_status = registry[:'inspec-meaning-of-life']
```

### Discovery (Known Plugins)

If a plugin is mentioned in `plugins.json`, it is *known*.  You can get its status, a `Inspec::Plugin::V2::Status` object.

Reading the plugins.json file is handled by the Loader when Loader.new is called; at that point the registry should know about plugins.

### Loading

Next, we load plugins.  Loading means that we `require` the entry point determined from the plugins.json. Your plugin definition file will thus execute.

If things go right, the Status now has a bunch of Activators, each with a block that has not yet executed.

If things go wrong, have a look at `status.load_exception`.

### Activation

Depending on the plugin type, activation may be triggered by a number of different events.

TODO

### Execution

Depending on the plugin type, execution may be triggered by a number of different events.

TODO
