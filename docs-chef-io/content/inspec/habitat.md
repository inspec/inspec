+++
title = "Chef InSpec Integration with Chef Habitat"
draft = false
gh_repo = "inspec"

[menu]
  [menu.inspec]
    title = "Chef Habitat Integration"
    identifier = "inspec/reference/habitat.md Habitat Integration"
    parent = "inspec/reference"
    weight = 120
+++

Chef InSpec provides an easy method to create an executable Chef Habitat package for a Chef InSpec profile. When run via the Chef Habitat Supervisor, the package will run Chef InSpec with your profile and write out its findings to the supervisor log. This provides the ability to ship your compliance controls alongside your Chef Habitat-packaged application and continuously run InSpec, providing you *Continuous Compliance.*

## What is Chef Habitat

Chef Habitat by Chef Software is our new Application Automation tool that aims
to make it easy, safe, and fast to build, deploy, and manage applications. From
build dependencies, runtime dependencies, dynamic configuration, and service
discovery (just to name a few), Chef Habitat packages the automation with the
application instead of relying on an underlying platform.

To learn more about Chef Habitat and try our demos and tutorials, visit
[https://www.habitat.sh](https://www.habitat.sh).

## Using the Chef Habitat Integration

After creating a Chef Habitat package for a Chef InSpec profile (see CLI commands
below) and uploading the package to a Chef Habitat Depot or manually distributing
to a host, start the Chef Habitat Supervisor with your package:

```bash
hab start effortless/audit-baseline
```

The Chef Habitat Supervisor will install Chef InSpec and execute your profile in
a loop. The loop is controlled by two variables: the `interval` and the `splay`.
The `interval` is a set time you want InSpec to run and its default is `1800`
seconds. The `splay` is a randomly generated sleep time that prevents a thundering
herd problem, or resource starvation scenario, when sending your report to an
external server like Chef Automate. The default for the `splay` is also `1800`
seconds. Alternatively, the `splay_first_run` can be set to wait a random period
of time between 0 and the number set for the `splay_first_run` before running
InSpec when your Habitat package is started or updated. The default of the
`splay_first_run` is `0` seconds.

```bash
HAB_INSPEC_PROFILE_FRONTEND1="interval = 60" hab start effortless/audit-baseline
```

The Chef Habitat Supervisor will display output like this:

```text
hab start effortless/audit-baseline
∵ Missing package for core/hab-sup/0.17.0
» Installing core/hab-sup/0.17.0
↓ Downloading core/hab-sup/0.17.0/20170214235450
    1.68 MB / 1.68 MB - [=========================================================================] 100.00 % 7.43 MB/s

... more Chef Habitat output here ...

hab-sup(MN): Starting effortless/audit-baseline/0.1.0/20170328173005
hab-sup(CS): effortless/audit-baseline/0.1.0/20170328173005 is not installed
↓ Downloading adamleff-20160617201047 public origin key
    79 B / 79 B | [===============================================================================] 100.00 % 2.64 MB/s
☑ Cached adamleff-20160617201047 public origin key
↓ Downloading chef/inspec/1.17.0/20170321214949
    16.93 MB / 16.93 MB / [======================================================================] 100.00 % 10.49 MB/s

... more Chef Habitat output here ...

★ Install of effortless/audit-baseline/0.1.0/20170328173005 complete with 9 new packages installed.
hab-sup(MR): Butterfly Member ID d9bd761e18c144469d755b1b97406eb2
hab-sup(MR): Starting butterfly on 0.0.0.0:9638
hab-sup(MR): Starting http-gateway on 0.0.0.0:9631
inspec-profile-frontend1.default(SR): Initializing
inspec-profile-frontend1.default(SV): Starting process as user=hab, group=hab
inspec-profile-frontend1.default(O): Executing InSpec  effortless/audit-baseline
inspec-profile-frontend1.default(O): InSpec run completed successfully.
inspec-profile-frontend1.default(O): sleeping for 2134 seconds
```

The above sample output shows the supervisor starting, downloading the necessary dependencies for the supervisor and the Chef InSpec profile, and then shows the supervisor running Chef InSpec successfully.

Chef InSpec will write a JSON file in the `${svc_var_path}/inspec_results` directory containing the results of the last Chef InSpec run. For example, for the `effortless/audit-baseline` package, the Chef InSpec results will be at:

```text
/hab/svc/inspec-profile-frontend1/var/inspec_results/inspec-profile-frontend1.json
```

## Chef InSpec Chef Habitat CLI Commands

### inspec habitat profile create

Create a Chef Habitat package for a Chef InSpec profile. Chef InSpec will
validate the profile, fetch and vendor any dependencies (if necessary), and build
the Chef Habitat package with a dependency on the latest InSpec. The resulting
package will be saved to the current working directory.

The package can then be manually uploaded to a Chef Habitat Depot or manually
distributed to a host and installed via `hab pkg install`.

The package file will be named:

```text
HABITAT_ORIGIN-inspec-profile-PROFILE_NAME-PROFILE_VERSION-BUILD_ID-x86_64-linux.hart
```

For example:

```text
adamleff-inspec-profile-frontend1-0.1.0-20170328173005-x86_64-linux.hart
```

#### Syntax

```bash
inspec habitat profile create PROFILE_DIRECTORY
```

#### Example

```bash
inspec habitat profile create ~/profiles/frontend1
```

#### Example Output

```text
$ habitat profile create ~/profiles/frontend1
[2017-03-28T13:29:32-04:00] INFO: Creating a Habitat artifact for profile: /Users/aleff/profiles/frontend1
[2017-03-28T13:29:32-04:00] INFO: Checking to see if Habitat is installed...
[2017-03-28T13:29:32-04:00] INFO: Copying profile contents to the work directory...
[2017-03-28T13:29:32-04:00] INFO: Generating Habitat plan at /var/folders/v5/z54gb76j2rs3wrn65hmtyf1r0000gp/T/inspec-habitat-exporter20170328-4932-kg2ltd/habitat/plan.sh...
[2017-03-28T13:29:32-04:00] INFO: Generating a Habitat run hook at /var/folders/v5/z54gb76j2rs3wrn65hmtyf1r0000gp/T/inspec-habitat-exporter20170328-4932-kg2ltd/habitat/hooks/run...
[2017-03-28T13:29:32-04:00] INFO: Generating Habitat's default.toml configuration...
[2017-03-28T13:29:32-04:00] INFO: Building our Habitat artifact...
   hab-studio: Destroying Studio at /hab/studios/src (default)
   hab-studio: Creating Studio at /hab/studios/src (default)
   hab-studio: Importing adamleff secret origin key
» Importing origin key from standard input
★ Imported secret origin key adamleff-20160617201047.
» Installing core/hab-backline
↓ Downloading core/hab-backline/0.19.0/20170311034116
    2.17 KB / 2.17 KB / [=========================================================================] 100.00 % 4.33 MB/s

... more Chef Habitat output here...

[2017-03-28T13:30:18-04:00] INFO: Copying artifact to /Users/aleff...
```

### inspec habitat profile setup

Create a Chef Habitat directory that includes a plan file in a profile directory.

This is the same process that is used by `inspec habitat profile create` - but
this adds the generated Chef Habitat directory and file to your system so that
you can commit them to source control. If you commit these files to GitHub, you
can connect that plan to the [Chef Habitat Builder Service](https://www.habitat.sh/docs/using-builder/).

#### Syntax

```bash
inspec habitat profile setup PROFILE_DIRECTORY
```

#### Example

```bash
inspec habitat profile setup ~/profiles/frontend1
```

#### Example Output

```bash
[2018-10-31T23:45:59+00:00] INFO: Setting up profile at /home/nell/profiles/frontend1/ for Habitat...
[2018-10-31T23:45:59+00:00] INFO: Checking to see if the profile is valid...
[2018-10-31T23:45:59+00:00] INFO: Profile is valid.
[2018-10-31T23:45:59+00:00] INFO: Profile's dependencies are already vendored, skipping vendor process.
[2018-10-31T23:45:59+00:00] INFO: Generating Habitat plan at /home/nell/profiles/frontend1/habitat/plan.sh...
```

### inspec habitat profile upload

Create and then upload a Chef Habitat package for a Chef InSpec profile. Like
the `inspec habitat profile create` command, Chef InSpec will validate the profile,
fetch and vendor any dependencies (if necessary), and build the Chef Habitat
package with a dependency on the latest InSpec. However, instead of saving the
package locally to the workstation, Chef InSpec will upload it to the depot
defined in the `HAB_DEPOT` environment variable. If `HAB_DEPOT` is not defined,
the package will be uploaded to the public Chef Habitat depot at
[https://app.habitat.sh](https://app.habitat.sh).

#### Syntax

```bash
inspec habitat profile upload PROFILE_DIRECTORY
```

#### Example

```bash
inspec habitat profile upload ~/profiles/frontend1
```

#### Example Output

```text
[2017-03-28T13:29:32-04:00] INFO: Creating a Habitat artifact for profile: /Users/aleff/profiles/frontend1
[2017-03-28T13:29:32-04:00] INFO: Checking to see if Habitat is installed...
[2017-03-28T13:29:32-04:00] INFO: Copying profile contents to the work directory...
[2017-03-28T13:29:32-04:00] INFO: Generating Habitat plan at /var/folders/v5/z54gb76j2rs3wrn65hmtyf1r0000gp/T/inspec-habitat-exporter20170328-4932-kg2ltd/habitat/plan.sh...
[2017-03-28T13:29:32-04:00] INFO: Generating a Habitat run hook at /var/folders/v5/z54gb76j2rs3wrn65hmtyf1r0000gp/T/inspec-habitat-exporter20170328-4932-kg2ltd/habitat/hooks/run...
[2017-03-28T13:29:32-04:00] INFO: Generating Habitat's default.toml configuration...
[2017-03-28T13:29:32-04:00] INFO: Building our Habitat artifact...
   hab-studio: Destroying Studio at /hab/studios/src (default)
   hab-studio: Creating Studio at /hab/studios/src (default)
   hab-studio: Importing adamleff secret origin key
» Importing origin key from standard input
★ Imported secret origin key adamleff-20160617201047.
» Installing core/hab-backline
↓ Downloading core/hab-backline/0.19.0/20170311034116
    2.17 KB / 2.17 KB / [=========================================================================] 100.00 % 4.33 MB/s

... more Chef Habitat output here...

[2017-03-28T13:30:18-04:00] INFO: Uploading the Habitat artifact to our Depot...
[2017-03-28T13:30:23-04:00] INFO: Upload complete!
```
