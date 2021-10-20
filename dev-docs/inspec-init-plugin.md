# About `inspec init plugin` CLI command

## Purpose

`inspec init plugin` generates the scaffold of InSpec plugin, which can extend the functionality of InSpec itself.

## Operational Notes

### Generating InSpec Plugin

`inspec init plugin --help`

```
Usage:
  inspec init plugin PLUGIN_NAME [options]

Options:
  [--prompt], [--no-prompt]      # Interactively prompt for information to put in your generated plugin.
                                 # Default: true
  [--detail=DETAIL]              # How detailed of a plugin to generate. 'full' is a normal full gem with tests; 'core' has tests but no gemspec; 'test-fixture' is stripped down for a test fixture.
                                 # Default: full
  [--author-email=AUTHOR_EMAIL]  # Author Email for gemspec
                                 # Default: you@example.com
  [--author-name=AUTHOR_NAME]    # Author Name for gemspec
                                 # Default: Your Name
  [--description=DESCRIPTION]    # Multi-line description of the plugin
  [--summary=SUMMARY]            # One-line summary of your plugin
                                 # Default: A plugin with a default summary
  [--license-name=LICENSE_NAME]  # The name of a license
                                 # Default: Apache-2.0
  [--activator=one two three]    # A list of plugin activator, in the form type1:name1, type2:name2, etc
                                 # Default: ["cli_command:my_command"]
  [--hook=one two three]         # Legacy name for --activator - Deprecated.
  [--homepage=HOMEPAGE]          # A URL for your project, often a GitHub link
  [--module-name=MODULE_NAME]    # Module Name for your plugin package.  Will change plugin name to CamelCase by default.
  [--copyright=COPYRIGHT]        # A copyright statement, to be added to LICENSE
  [--log-level=LOG_LEVEL]        # Set the log level: info (default), debug, warn, error
  [--log-location=LOG_LOCATION]  # Location to send diagnostic log messages to. (default: $stdout or Inspec::Log.error)

Generates an InSpec plugin, which can extend the functionality of InSpec itself.
```

### Options
  `inspec init plugin` command requires few details about the plugin to be added. This can be added using command line prompt or by passing them as the options like for e.g `--author-name`,`--author-email`, `--description`, `--module-name`, etc.

  `--detail` This option can be used to skip generation of test files or gemspec file. Available values `full`, `core` or `test-fixture`.

  `--activator` Available activator type are `cli_command` and `reporter`. The default activator type is "cli_command".
  Usage: `inspec init pluign <inspec-plugin-name> --activator "cli_command:my_test"`
    `OR`
  `inspec init plugin <inspec-plugin-reporter-name> --activator "reporter:my_reporter"`

  **Note:** The InSpec plugin generator can currently only generate one activator of each type.

  `--hook` Legacy name for `--activator` - Deprecated.
