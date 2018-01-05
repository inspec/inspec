---
title: About InSpec Profile Dependencies
---

# Profile Dependencies

An InSpec profile can bring in the controls and custom resources from another InSpec profile. Additionally, when inheriting the controls of another profile, a profile can skip or even modify those included controls.

## Defining the Dependencies

Before a profile can use controls from another profile, the to-be-included profile needs to be specified in the including profile’s `inspec.yml` file in the `depends` section. For each profile to be included, a location for the profile from where to be fetched and a name for the profile should be included. For example:

    depends:
    - name: linux-baseline
      url: https://github.com/dev-sec/linux-baseline/archive/master.tar.gz
    - name: ssh-baseline
      url: https://github.com/dev-sec/ssh-baseline/archive/master.tar.gz

InSpec supports a number of dependency sources.

### path

The `path` setting defines a profile that is located on disk. This setting is typically used during development of profiles and when debugging profiles.

    depends:
    - name: my-profile
      path: /absolute/path
    - name: another
      path: ../relative/path

### url

The `url` setting specifies a profile that is located at an HTTP- or HTTPS-based URL. The profile must be accessible via a HTTP GET operation and must be a valid profile archive (zip, tar, or tar.gz format).

    depends:
    - name: my-profile
      url: https://my.domain/path/to/profile.tgz
    - name: profile-via-git
      url: https://github.com/myusername/myprofile-repo/archive/master.tar.gz

### git

A `git` setting specifies a profile that is located in a git repository, with optional settings for branch, tag, commit, and version. The source location is translated into a URL upon resolution. This type of dependency supports version constraints via semantic versioning as git tags.

For example:

    depends:
    - name: git-profile
      git: http://url/to/repo
      branch:  desired_branch
      tag:     desired_version
      commit:  pinned_commit
      version: semver_via_tags

### supermarket

A `supermarket` setting specifies a profile that is located in a cookbook hosted on Chef Supermarket. The source location is translated into a URL upon resolution.

For example:

    depends:
    - name: supermarket-profile
      supermarket: supermarket-username/supermarket-profile

Available Supermarket profiles can be listed with `inspec supermarket profiles`.

### compliance

A `compliance` setting specifies a profile that is located on the Chef Automate or Chef Compliance server.

For example:

    depends:
      - name: linux
        compliance: base/linux

## Vendoring Dependencies

When you execute a local profile, the `inspec.yml` file will be read in order to source any profile dependencies. It will then cache the dependencies locally and generate an `inspec.lock` file.

If you add or update dependencies in `inspec.yml`, dependencies may be re-vendored and the lockfile updated with `inspec vendor --overwrite`

## Using Controls from an Included Profile

Once defined in the `inspec.yml`, controls from the included profiles can be used! Let’s look at some examples.

### Including All Controls from a Profile

With the `include_controls` command in a profile, all controls from the named profile will be executed every time the including profile is executed.

![Include Controls](/images/profile_inheritance/include_controls.png)

In the example above, every time `my-app-profile` is executed, all the controls from `my-baseline` are also executed. Therefore, the following controls would be executed:

 * myapp-1
 * myapp-2
 * myapp-3
 * baseline-1
 * baseline-2

This is a great reminder that having a good naming convention for your controls is helpful to avoid confusion when
including controls from other profiles!

### Skipping a Control from a Profile

What if one of the controls from the included profile does not apply to your environment? Luckily, it is not necessary to maintain a slightly-modified copy of the included profile just to delete a control. The `skip_control` command tells InSpec to not run a particular control.

![Include Controls with Skip](/images/profile_inheritance/include_controls_with_skip.png)

In the above example, all controls from `my-app-profile` and `my-baseline` profile will be executed every time `my-app-profile` is executed **except** for control `baseline-2` from the `my-baseline` profile.

### Modifying a Control

Let's say a particular control from an included profile should still be run, but the impact isn't appropriate? Perhaps the test should still run, but if it fails, it should be treated as low severity instead of high severity?

When a control is included, it can also be modified!

![Include Controls with Modification](/images/profile_inheritance/include_controls_with_mod.png)

In the above example, all controls from `my-baseline` are executed along with all the controls from the including profile, `my-app-profile`. However, should control `baseline-1` fail, it will be raised with an impact of `0.5` instead of the originally-intended impact of `1.0`.

### Selectively Including Controls from a Profile

If there are only a handful of controls that should be executed from an included profile, it's not necessarily to skip all the unneeded controls, or worse, copy/paste those controls bit-for-bit into your profile. Instead, use the `require_controls` command.

![Require Controls](/images/profile_inheritance/require_controls.png)

Whenever `my-app-profile` is executed, in addition to its own controls, it will run only the controls specified in the `require_controls` block. In the case, the following controls would be executed:

 * myapp-1
 * myapp-2
 * myapp-3
 * baseline-2
 * baseline-4

Controls `baseline-1`, `baseline-3`, and `baseline-5` would not be run, just as if they were manually skipped. This method of including specific controls ensures only the controls specified are executed; if new controls are added to a later version of `my-baseline`, they would not be run.

And, just the way its possible to modify controls when using `include_controls`, controls can be modified as well.

![Require Controls with Modification](/images/profile_inheritance/require_controls_with_mod.png)

As with the prior example, only `baseline-2` and `baseline-4` are executed, but if `baseline-2` fails, it will report with an impact of `0.5` instead of the originally-intended `1.0` impact.

## Using Resources from an Included Profile

By default, all of the custom resources from a listed dependency are available
for use in your profile. If two of your dependencies provide a resource with
the same name, you can use the `require_resource` DSL function to
disambiguate the two:

    require_resource(profile: 'my_dep', resource: 'my_res',
                     as: 'my_res2')

This will allow you to reference the resource `my_res` from the
profile `my_dep` using the name `my_res2`.


