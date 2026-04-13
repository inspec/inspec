# About InSpec's Continuous Integration and Continuous Delivery Setup

## Major Components

### Expeditor

[Expeditor](https://expeditor.chef.io/) is the main coordinator of all CI-CD activity at Chef. It is configured through a [YAML file](https://github.com/inspec/inspec/blob/main/.expeditor/config.yml).

### BuildKite

[Buildkite](https://buildkite.com/chef) is the engine that actually executes all of the tests and builds for InSpec. While Buildkite coordinates all of the work, the actual infrastructure is managed by Chef in a variety of locations, including various clouds and datacenters.

Buildkite is divided into two orgs, [Chef](https://buildkite.com/chef) and [Chef-OSS](https://buildkite.com/chef-oss) (Open Source Software). Chef is private and Chef-OSS is public.

You will need to have an account on BuildKite and be a member of both orgs to fully utilize the system.

### Rakefile

The [Rakefile](https://github.com/inspec/inspec/blob/main/Rakefile) defines the tests harness to be run. Most of the test scripts come down to executing "rake test" or similar.

### Rubygems

InSpec is published as a set of 4 gems - inspec, inspec-core, inspec-bin, and inspec-core-bin. When we release a new version to the public (a process we call "promotion" and typically happens on Wednesdays), we publish to rubygems.org.

Rubygems are configured by declaring them in the expeditor configuration file in the `rubygems` section.

### Artifactory

Artifactory stores build artifacts (such as RPMs, MSIs, and gems) on a temporary basis. Artifactory is protected by the Progress VPN. [Artifactory inspec package search](http://artifactory.chef.co/ui/packages?name=inspec&type=packages).

## What Happens when...

### A PR is opened

When a PR is opened, the subscription [workload: pull_request_opened:{{agent_id}}:*](https://github.com/inspec/inspec/blob/cb2abf2e10906bba4df24b2ed18ec51b0931eff2/.expeditor/config.yml#L173) is activated. In addition, several defaults also apply.

One default pipeline that gets activated is the Buildkite [master verify pipeline](https://buildkite.com/chef-oss/inspec-inspec-master-verify). This default is documented [here](https://expeditor.chef.io/docs/pipelines/verify/).

#### verify pipeline

The verify pipeline runs the linter, the unit tests, and the functional tests. It verifies that the code being submitted is sound.

The verify pipeline is defined first in the [verify.pipeline.yml](https://github.com/inspec/inspec/blob/master/.expeditor/verify.pipeline.yml) file, which defines the separate Ruby versions, platforms, and environment variables to be passed to each one. Each runner calls a shell script, either [verify.sh](https://github.com/inspec/inspec/blob/master/.expeditor/buildkite/verify.sh) or [verify.ps1](https://github.com/inspec/inspec/blob/main/.expeditor/buildkite/verify.ps1). These scripts are thin wrappers that install Bundler dependencies from a cache, then call into the Rakefile.

#### habitat artifact pipeline

The habitat artifact pipeline runs a smoke test to verify that the habitat build of inspec is valid.

The habitat artifact pipeline is defined first in the [artifact.habitat.yml](https://github.com/inspec/inspec/blob/master/.expeditor/artifact.habitat.yml) file. It simply defines a linux runner and a windows runner, each with a dedicated script, [artifact.habitat.test.sh](https://github.com/inspec/inspec/blob/master/.expeditor/buildkite/artifact.habitat.test.sh) or [artifact.habitat.test.ps1](https://github.com/inspec/inspec/blob/master/.expeditor/buildkite/artifact.habitat.test.ps1). The scripts install habitat, setup an origin key, build the package, and then run a [Rakefile](https://github.com/inspec/inspec/blob/main/test/artifact/Rakefile)


### A PR is merged

When a PR is merged, the Expeditor actions under `merge_actions` are executed.

Watch the Slack channel #inspec-notify for messages about the success or failure of various steps.

Connect to the Progress VPN to fetch Expeditor logs in the event of a failure.

#### Version Bumping

This is controlled by the `built_in:bump_version` and `bash:.expeditor/update_version.sh` subscriptions.

If there are no GitHub labels on the PR, the patchlevel of the version will be bumped by executing the [.expeditor/update_version.sh](https://github.com/inspec/inspec/blob/main/.expeditor/update_version.sh) script.  First the VERSION file is updated, then the script runs to update the versions in the Ruby files.

`built_in:bump_version` is in charge of bumping versions in VERSION, and is controlled by GitHub labels on the PR.  Most, though not all, PRs should not have any Expeditor control labels.

Here are the Expeditor control labels, and the circumstances under which they should be used:

 * Expeditor: Bump Minor Version - Use when a significant new feature is being released.
 * Expeditor: Bump Major Version - Use when a major release is made - rarely used.
 * Expeditor: Skip Version Bump - Use for non-code-change PRs, such as website or CI changes.

#### Chef Habitat Build

The Chef Habitat build creates Habitat .hart packages for Linux and Windows. The [Expeditor configuration](https://github.com/inspec/inspec/blob/44fe144732e1e0abb2594957a880c5f1821e7774/.expeditor/config.yml#L138) drives a [Buildkite configuration](https://github.com/inspec/inspec/blob/main/.expeditor/build.habitat.yml).

When the hab build succeeds, the packages will be placed on the Hab builder in the `unstable` channel for public consumption.

#### Docker Image Built and Released

We also release a Docker image (see [expeditor config](https://github.com/inspec/inspec/blob/44fe144732e1e0abb2594957a880c5f1821e7774/.expeditor/config.yml#L150)), which contains a Linux system and Chef InSpec installed from a gem, with the ENTRYPOINT of the Docker image being `inspec` (see [Dockerfile](https://github.com/inspec/inspec/blob/main/Dockerfile)). It's a simple way to ship the dependencies of `inspec`.

When it succeeds, the Docker build is labeled as `current`.

#### Gems Built and Placed on Artifactory

The `inspec`, `inspec-bin`, `inspec-core`, and `inspec-core-bin` gems are all built and placed on the internal Chef [Artifactory](http://artifactory.chef.co/ui/packages?name=inspec&type=packages) (VPN required) server.  During promotion later, they publish to rubygems.org.

The difference between the gems is as follows:

 * `inspec` is a library gem, with full heavyweight dependencies, not encumbered by commercial licensing
 * `inspec-bin` contains an `inspec` executable and is encumbered by commercial licensing
 * `inspec-core` is a library gem, with lightweight dependencies and no compilation required at install time, and is not encumbered by commercial licensing
 * `inspec-core-bin` contains an `inspec` executable and is encumbered by commercial licensing

### A release is promoted

When a release is promoted, using the slack command `/expeditor promote inspec/inspec:inspec-7 7.0.108` (for example), Expeditor fires the `project_promoted` workload. This triggers the following actions:

- **`built_in:rollover_changelog`** — Rolls over the CHANGELOG for the next release cycle.
- **`built_in:publish_rubygems`** — Publishes the `inspec`, `inspec-bin`, `inspec-core`, and `inspec-core-bin` gems to rubygems.org.
- **`built_in:promote_habitat_packages`** — Promotes the Habitat `.hart` packages from the `base-2025-current` channel to the `base-2025` channel. Note: when a Hab build completes after a PR merge, packages are first promoted from `unstable` to `base-2025-current`; the `project_promoted` step moves them from `base-2025-current` to `base-2025`.
- **`purge_packages_chef_io_fastly`** — Purges the Fastly CDN cache for the promoted channel so downloads.chef.io reflects the new release immediately.
- **`built_in:notify_chefio_slack_channels`** — Sends a Slack notification to the relevant Chef.io channels on successful promotion.

Some of the more important downstream effects:

#### Update and publish the docker image

The Dockerfile is updated - mainly to update version numbers - and then the published Docker image is tagged with the labels "stable" and "latest".

#### Rubygems are published to rubygems,org

The gems are taken from Artifactory and published to Rubygems.org. This is done using an Expeditor built-in action. The gems must be owned by the user `chef`.
