+++
title = "InSpec Profile Dependencies"
draft = false
gh_repo = "inspec"

[menu]
  [menu.inspec]
    title = "Dependencies"
    identifier = "inspec/profiles/depends"
    parent = "inspec/profiles"
    weight = 70
+++

A Chef InSpec profile can bring in the controls and custom resources from another
Chef InSpec profile. Additionally, when inheriting the controls of another profile,
a profile can skip or even modify those included controls.

For hands-on examples, check out [Extending InSpec: InSpec Wrappers and Custom Resources](https://learn.chef.io/courses/course-v1:chef+InSpec201+Perpetual/about) on Learn Chef.

## Define dependencies

Before a profile can use controls from another profile, the to-be-included profile
needs to be specified in the including profile’s `inspec.yml` file in the `depends`
section. For each profile to be included, a location for the profile from where
to be fetched and a name for the profile should be included. For example:

```yaml
depends:
- name: linux-baseline
  url: https://github.com/dev-sec/linux-baseline/archive/master.tar.gz
- name: ssh-baseline
  url: https://github.com/dev-sec/ssh-baseline/archive/master.tar.gz
```

Chef InSpec supports a number of dependency sources.

### path

The `path` setting defines a profile that is located on disk. This setting is
typically used during development of profiles and when debugging profiles.

```yaml
depends:
- name: my-profile
  path: /absolute/path
- name: another
  path: ../relative/path
```

### url

The `url` setting specifies a profile that is located at an HTTP- or HTTPS-based
URL. The profile must be accessible via a HTTP GET operation and must be a valid
profile archive (zip, tar, or tar.gz format).

```yaml
depends:
- name: my-profile
  url: https://example.com/path/to/profile.tgz
- name: profile-via-git
  url: https://github.com/username/myprofile-repo/archive/master.tar.gz
```

`url` also supports basic authentication.

```yaml
depends:
- name: my-profile
  url: https://example.com/path/to/profile.tgz
  username: user
  password: password
```

### git

A `git` setting specifies a profile that is located in a Git repository, with
optional settings for `branch`, `tag`, `commit`, `version`, and `relative_path`. The source
location is translated into a URL upon resolution. This type of dependency supports
version constraints via semantic versioning as Git tags.

```yaml
depends:
- name: git-profile
  git: http://example.com/path/to/repo
  branch:  desired_branch
  tag:     desired_version
  commit:  pinned_commit
  version: semver_via_tags
  relative_path: relative/optional/path/to/profile
```

### supermarket

A `supermarket` setting specifies a profile that is located in a cookbook hosted
on Chef Supermarket. The source location is translated into a URL upon resolution.

For example:

```yaml
depends:
- name: supermarket-profile
  supermarket: supermarket-username/supermarket-profile
```

Available Supermarket profiles can be listed with `inspec supermarket profiles`.

### compliance

A `compliance` setting specifies a profile that is located on the Chef Automate
or Chef Compliance server.

For example:

```yaml
depends:
- name: linux
  compliance: base/linux
```

## Gem dependencies

Any profile with Ruby gem dependencies that need to be installed can be specified using the `gem_dependencies` settings in the `inspec.yml` metadata file.

For example, if you required any Ruby library in a custom resource that needs a specific gem to be installed, then you can specify those gems in the metadata file.
Chef InSpec will prompt to install the gems to `~/.inspec/gems` when you run your profile the first time.
To skip the prompt and automatically install, pass the `--auto-install-gems` option to `inspec exec`.

```yaml
gem_dependencies:
  - name: "mongo"
    version: ">= 2.3.12"
```

## Vendor dependencies

When you execute a local profile, Inspec reads the `inspec.yml` file in order to
source any profile dependencies. It then caches the dependencies locally and
generates an `inspec.lock` file.

If you add or update dependencies in `inspec.yml`, dependencies may be re-vendored
and the lockfile updated with `inspec vendor --overwrite`

## Alternate resource names

By default, all [custom resources](/inspec/profiles/custom_resources/) from a listed dependency are available for use in a profile.
If two of your dependencies provide a resource with the same name, you can use the `require_resource` InSpec DSL function to disambiguate the two:

```ruby
require_resource(
  profile: '<DEPENDENCY_NAME>',
  resource: '<RESOURCE_NAME>',
  as: '<ALTERNATE_RESOURCE_NAME>'
)
```

where:

- `<DEPENDENCY_NAME>` is the dependent profile
- `<RESOURCE_NAME>` is the resource name in the dependent profile
- `<ALTERNATE_RESOURCE_NAME>` is an alternate name for that resource


## Use controls from a dependent profile

To use controls from a dependent profile, see the [controls documentation](/inspec/profiles/controls/#use-controls-from-an-included-profile).
