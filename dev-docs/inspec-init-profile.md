# About `inspec init profile` CLI command

## Purpose

`inspec init profile` generates the scaffold of InSpec profile.

## Operational Notes

### Generating InSpec Plugin

`inspec init profile --help`

```
Usage:
  inspec init profile [OPTIONS] NAME

Options:
  p, [--platform=PLATFORM]                        # Which platform to generate a profile for: choose from alicloud, aws, azure, gcp, os
                                                  # Default: os
     [--overwrite], [--no-overwrite]              # Overwrites existing directory
  r, [--resource-dependency=RESOURCE_DEPENDENCY]  # Generate a resource dependency with the profile
     [--log-level=LOG_LEVEL]                      # Set the log level: info (default), debug, warn, error
     [--log-location=LOG_LOCATION]                # Location to send diagnostic log messages to. (default: $stdout or Inspec::Log.error)

Generate a new profile
```

### Options
  `inspec init profile` command requires few details about the profile to be added. This can be added using command line prompt or by passing them as the options like for e.g `--platform`,`--resource-dependency`, etc.

  `--resource-dependency` This option can be used to generate profiles with gem dependency.


### Usage:

- `inspec init profile <inspec-profile-name> --resource-dependency <inspec-resource-dependency-name>`

    The generated `inspec.yml` file automatically points to the InSpec resource dependency gem:

    ```yaml
    name: <inspec-profile-name>
    title: InSpec Profile
    maintainer: The Authors
    copyright: The Authors
    copyright_email: you@example.com
    license: Apache-2.0
    summary: An InSpec Compliance Profile
    version: 0.1.0
    depends:
      - name: <inspec-resource-dependency-name>
        gem: <inspec-resource-dependency-name>
    supports:
      platform: os
    ```
