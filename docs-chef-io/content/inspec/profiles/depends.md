+++
title = "InSpec Profile Dependencies"
draft = false
gh_repo = "inspec"

[menu]
  [menu.inspec]
    title = "Dependencies"
    identifier = "inspec/profiles/depends"
    parent = "inspec/profiles"
    weight = 50
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

After you define a dependent profile in the `inspec.yml` file, you can use controls from those profiles.

See the `inspec` repository for an [example profile](https://github.com/inspec/inspec/tree/main/examples/inheritance) that inherits controls from another profile.

The following examples show you how to include controls from a dependent profile.

### Include all controls

With the `include_controls` command in a profile, all controls from the named
profile will be executed every time the including profile is executed.

For example, if you have a profile called `baseline-profile` with the following controls:

- baseline-1
- baseline-2

And `app-profile` with the following controls:

- app-1
- app-2
- app-3

Add `baseline-profile` as dependency of `app-profile`, then include the `baseline-profile` controls using `include_controls` in the control code of `app-profile`:

```ruby
include_controls 'baseline-profile'
```

Every time you execute `app-profile`, InSpec also executes all the controls from `baseline-profile`:

- app-1
- app-2
- app-3
- baseline-1
- baseline-2

This is a great reminder that having a good naming convention for your controls
is helpful to avoid confusion when including controls from other profiles!

### Skip a control

What if one of the controls from the included profile does not apply to your environment?
Luckily, it is not necessary to maintain a slightly-modified copy of the included profile just to delete a control.
The `skip_control` command tells Chef InSpec to not run a particular control.

For example, if you have a profile called `baseline-profile` with the following controls:

- baseline-1
- baseline-2

And `app-profile` with the following controls:

- app-1
- app-2
- app-3

Add `baseline-profile` as dependency of `app-profile`, then include the `baseline-profile` controls using `include_controls` and `skip_control` to exclude the profile you don't want execute:

```ruby
include_controls 'baseline-profile' do
  skip_control 'baseline-2'
end
```

Every time you execute `app-profile`, InSpec also executes all the controls from `baseline-profile` except `baseline-2`:

- app-1
- app-2
- app-3
- baseline-1

### Modify a control

Let's say a particular control from an included profile should still be run, but
the impact isn't appropriate? Perhaps the test should still run, but if it fails,
it should be treated as low severity instead of high severity?

When a control is included, it can also be modified!

For example, if you have a profile called `baseline-profile` with the following controls:

- baseline-1
- baseline-2

And `baseline-1` has an `impact` of `1.0` defined in `baseline-profile`:

```ruby
control 'baseline-1' do
  impact 1.0
  ...
end
```

Add `baseline-profile` as dependency of `app-profile`, then include the `baseline-profile` controls to `app-profile` using `include_controls` and redefine the impact of `baseline-1`:

```ruby
include_controls 'baseline-profile' do
  control 'baseline-1' do
    impact 0.5
  end
end
```

In the above example, all controls from `baseline-profile` are executed along with all the controls from the including profile, `app-profile`.
However, should control `baseline-1` fail, it will be raised with an impact of `0.5` instead of the originally intended impact of `1.0`.

### Selectively include controls

Use the `require_controls` command selectively include certain controls from an included
profile. You don't have to skip all the unneeded controls, or worse,
copy/paste those controls bit-for-bit into your profile.

For example, if you have a profile called `baseline-profile` with the following controls:

- baseline-1
- baseline-2
- baseline-3
- baseline-4
- baseline-5

And `app-profile` with the following controls:

- app-1
- app-2
- app-3

Add `baseline-profile` as dependency of `app-profile`, then include specific `baseline-profile` controls using `require_controls` in the control code of `app-profile`:

```ruby
require_controls 'baseline-profile' do
  control 'baseline-2'
  control 'baseline-4'
end
```

Every time you execute `app-profile`, InSpec executes the controls `app-profile` and the controls specified in the `require_controls` block:

- app-1
- app-2
- app-3
- baseline-2
- baseline-4

Controls `baseline-1`, `baseline-3`, and `baseline-5` are not run, just as if they were manually skipped.
This method of including specific controls ensures only the controls specified are executed; if new controls are added to a later version of `baseline-profile`, they would not be run.

And, just the way its possible to modify controls when using `include_controls`,
controls can be modified with `require_controls` as well.

```ruby
require_controls 'baseline-profile' do
  control 'baseline-2' do
    impact 0.5
  end
  control 'baseline-4'
end
```

As with the prior example, only `baseline-2` and `baseline-4` are executed, but
if `baseline-2` fails, it will report with an impact of `0.5` instead of the
originally-intended `1.0` impact.

## Include controls from different profile versions

When a Chef InSpec profile has dependency on another profile to its specific version, then the controls can be included or selected by using the profile name and version separated by `-`.

Here, `profile-a` has following dependency:

```yaml
name: profile-a
depends:
  - name: ssh
    git: https://github.com/dev-sec/ssh-baseline.git
    tag: 2.6.0
```

And `profile-b` has following dependency:

```yaml
name: profile-b
depends:
  - name: ssh
    git: https://github.com/dev-sec/ssh-baseline.git
    tag: 2.7.0
```

You can include or require controls of these profiles in a following manner:

```ruby
include_controls "ssh-2.6.0"
include_controls "ssh-2.7.0"
```

OR

```ruby
require_controls "ssh-2.6.0"
require_controls "ssh-2.7.0"
```

## Vendor dependencies

When you execute a local profile, Inspec reads the `inspec.yml` file in order to
source any profile dependencies. It then caches the dependencies locally and
generates an `inspec.lock` file.

If you add or update dependencies in `inspec.yml`, dependencies may be re-vendored
and the lockfile updated with `inspec vendor --overwrite`
