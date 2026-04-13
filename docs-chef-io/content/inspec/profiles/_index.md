+++
title = "About Chef InSpec Profiles"
draft = false
gh_repo = "inspec"

[menu]
  [menu.inspec]
    title = "About Profiles"
    identifier = "inspec/profiles/Overview"
    parent = "inspec/profiles"
    weight = 10
+++

A Chef InSpec profile organizes multiple controls into a reusable artifact that can be described and versioned.
Each profile is a standalone structure with its own distribution and execution flow.

Chef InSpec supports complex test and compliance profiles, which organize controls to support dependency management and code reuse.

For hands-on examples, check out [Test Expectations with Chef InSpec](https://learn.chef.io/courses/course-v1:chef+Inspec101+Perpetual/about) on Learn Chef to learn more about how profiles are structured.

## Initialize a new profile

Use the InSpec CLI to generate a new profile.

```sh
inspec init profile <PROFILE NAME>
```

### Platforms

You can an initialize profiles that are configured for Google Cloud, Azure, or AWS using the `--platform` option.

```sh
inspec init profile --platform <PLATFORM> <PROFILE NAME>
```

Replace:

- `<PROFILE NAME>` with the name of your profile
- `<PLATFORM>` with one of the following:
  - `aws`
  - `azure`
  - `gcp`

## Profile structure

A profile has following structure:

```yaml
profile
├── README.md
├── controls
│   ├── example.rb
│   └── control_etc.rb
├── libraries
│   └── extension.rb
|── files
│   └── extras.conf
└── inspec.yml
```

`inspec.yml`
: The [`inspec.yml` file](inspec_yml) describes the profile.

  Required

`controls`
: The [`controls` directory](controls) contains all tests.

  Required

`libraries`
: The `libraries` directory contains all Chef InSpec [resource extensions](custom_resources).

  Optional

`files`
: The [`files` directory](files) contains additional files that a profile can access.

  Optional

`README.md`
: The `README.md` explains the profile, its scope, and usage.

  Optional

## Verify profiles

Use the `inspec check` command to verify the implementation of a profile:

```bash
inspec check examples/profile
```

## Execute a profile

Use the `exec` subcommand to execute a profile.

```sh
inspec exec <PROFILE>
```

`inspec exec` accepts profiles from several sources, including a local directory, Git repositories, and web-hosted tar files.
See the [`inspec exec` documentation](/inspec/cli#exec) for more information.

You can format the results of an audit using [InSpec reporters](/inspec/reporters/).

## Example profiles

See the `inspec` repository for some [example profiles](https://github.com/inspec/inspec/tree/main/examples).
