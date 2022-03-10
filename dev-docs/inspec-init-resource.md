# About `inspec init resource` CLI command

## Purpose

`inspec init resource` generates the scaffold of InSpec core resources or resource pack, which can extend the scope of InSpec resources support.

## Operational Notes

### Generating InSpec Resource

`inspec init resource --help`

```
Usage:
  inspec init resource RESOURCE_NAME [options]

Options:
  [--prompt], [--no-prompt]                # Interactively prompt for information to put in your generated resource.
                                           # Default: true
  [--overwrite], [--no-overwrite]          # Overwrite existing files
  [--layout=LAYOUT]                        # File layout, either 'resource-pack' or 'core'
                                           # Default: resource-pack
  [--template=TEMPLATE]                    # Which type of resource template to use
                                           # Default: basic
  [--supports-platform=SUPPORTS_PLATFORM]  # the platform supported by this resource
                                           # Default: linux
  [--description=DESCRIPTION]              # the description of this resource
                                           # Default: Resource description ...
  [--class-name=CLASS_NAME]                # Class Name for your resource.
                                           # Default: MyCustomResource
  [--path=PATH]                            # Subdirectory under which to create files
                                           # Default: .
  [--log-level=LOG_LEVEL]                  # Set the log level: info (default), debug, warn, error
  [--log-location=LOG_LOCATION]            # Location to send diagnostic log messages to. (default: $stdout or Inspec::Log.error)

Generates an InSpec resource, which can extend the scope of InSpec resources support
```

### Options
  `inspec init resource` command requires few details about the resource to be added. This can be added using command line prompt or by passing them as the options like for e.g `--layout`,`--template`, `--description`, `--class-name`, etc.

  `--layout` Available layout type are `resource-pack` and `core`. The default layout type is "resource-pack".

   `--template` Available resource template type are `plural` and `basic`. The default layout type is "basic".

### Usage: 
   
- `inspec init resource <inspec-resource-name> --layout "resource-pack" --template "basic" --prompt false`
- `inspec init resource <inspec-resource-name> --layout "resource-pack" --template "plural" --prompt false`
- `inspec init resource <inspec-resource-name> --layout "core" --template "basic" --prompt false`
- `inspec init resource <inspec-resource-name> --layout "core" --template "plural" --prompt false`


