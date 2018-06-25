# InSpec Extension for Chef Compliance

This extensions offers the following features:

 - list available profiles in Chef Automate/Chef Compliance
 - execute profiles directly from Chef Automate/Chef Compliance locally
 - upload a local profile to Chef Automate/Chef Compliance

To use the CLI, this InSpec add-on adds the following commands:

 * `$ inspec compliance login` - authentication of the API token against Chef Automate/Chef Compliance
 * `$ inspec compliance profiles` - list all available Compliance profiles
 * `$ inspec exec compliance://profile` - runs a Compliance profile
 * `$ inspec compliance upload path/to/local/profile` - uploads a local profile to Chef Automate/Chef Compliance
 * `$ inspec compliance logout` - logout of Chef Automate/Chef Compliance

Compliance profiles can be executed in two ways:

- via compliance exec: `inspec compliance exec profile`
- via compliance scheme: `inspec exec compliance://profile`


## Usage

### Command options

```
$ inspec compliance
Commands:
  inspec compliance download PROFILE  # downloads a profile from Chef Compliance
  inspec compliance exec PROFILE      # executes a Chef Compliance profile
  inspec compliance help [COMMAND]    # Describe subcommands or one specific subcommand
  inspec compliance login SERVER      # Log in to a Chef Automate/Chef Compliance SERVER
  inspec compliance logout            # user logout from Chef Compliance
  inspec compliance profiles          # list all available profiles in Chef Compliance
  inspec compliance upload PATH       # uploads a local profile to Chef Compliance
  inspec compliance version           # displays the version of the Chef Compliance server
```

### Login with Chef Automate 2

You will need an API token for authentication. You can retrieve one via the admin section of your A2 web gui.

```
$ inspec compliance login https://automate2.compliance.test --insecure --user 'admin' --token 'zuop..._KzE'
```

#### Login with Chef Automate 2 via json-config

With automate 2 you can automatically login by passing a json config via `--json-config`

Example:
```json
"compliance": {
    "server" : "https://YOUR_A2_URL",
    "token" : "YOUR_A2_ADMIN_TOKEN",
    "user" : "YOUR_A2_USER",
    "insecure" : true
}
```

### Login with Chef Automate

You will need an access token for authentication. You can retrieve one via [UI](https://docs.chef.io/api_delivery.html) or [CLI](https://docs.chef.io/ctl_delivery.html#delivery-token).

```
$ inspec compliance login https://automate.compliance.test --insecure --user 'admin' --ent 'brewinc' --token 'zuop..._KzE'
```

### Login with Chef Compliance

You will need an access token for authentication. You can retrieve one via:

![Chef Compliance Token](images/cc-token.png)

You can choose the access token (`--token`) or the refresh token (`--refresh_token`)

```
$ inspec compliance login https://compliance.test --user admin --insecure --token '...'
```

### List available profiles via Chef Compliance / Automate

```
$ inspec compliance profiles
Available profiles:
-------------------
 * base/apache
 * base/linux
 * base/mysql
 * base/postgres
 * base/ssh
 * base/windows
 * cis/cis-centos6-level1
 * cis/cis-centos6-level2
 * cis/cis-centos7-level1
 * cis/cis-centos7-level2
 * cis/cis-rhel7-level1
 * cis/cis-rhel7-level2
 * cis/cis-ubuntu12.04lts-level1
 * cis/cis-ubuntu12.04lts-level2
 * cis/cis-ubuntu14.04lts-level1
 * cis/cis-ubuntu14.04lts-level2
```

### Upload a profile to Chef Compliance / Automate

```
$ inspec compliance version
Chef Compliance version: 1.0.11
➜  inspec git:(chris-rock/cc-error-not-loggedin) ✗ b inspec compliance upload examples/profile
I, [2016-05-06T14:27:20.907547 #37592]  INFO -- : Checking profile in examples/profile
I, [2016-05-06T14:27:20.907668 #37592]  INFO -- : Metadata OK.
I, [2016-05-06T14:27:20.968584 #37592]  INFO -- : Found 4 controls.
I, [2016-05-06T14:27:20.968638 #37592]  INFO -- : Control definitions OK.
Profile is valid
Generate temporary profile archive at /var/folders/jy/2bnrfb4s36jbjtzllvhhyqhw0000gn/T/profile20160506-37592-1tf326f.tar.gz
I, [2016-05-06T14:27:21.020017 #37592]  INFO -- : Generate archive /var/folders/jy/2bnrfb4s36jbjtzllvhhyqhw0000gn/T/profile20160506-37592-1tf326f.tar.gz.
I, [2016-05-06T14:27:21.024837 #37592]  INFO -- : Finished archive generation.
Start upload to admin/profile
Uploading to Chef Compliance
Successfully uploaded profile

# display all profiles
$ inspec compliance profiles
Available profiles:
-------------------
 * admin/profile
 * base/apache
 * base/linux
 * base/mysql
 * base/postgres
 * base/ssh
 * base/windows
 * cis/cis-centos6-level1
 * cis/cis-centos6-level2
 * cis/cis-centos7-level1
 * cis/cis-centos7-level2
 * cis/cis-rhel7-level1
 * cis/cis-rhel7-level2
 * cis/cis-ubuntu12.04lts-level1
 * cis/cis-ubuntu12.04lts-level2
 * cis/cis-ubuntu14.04lts-level1
 * cis/cis-ubuntu14.04lts-level2
```

### Run a profile from Chef Compliance / Chef Automate on Workstation

```
$ inspec exec compliance://admin/profile
.*...

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) gordon_config Can't find file "/tmp/gordon/config.yaml"
     # Not yet implemented
     # ./lib/inspec/runner.rb:157


Finished in 0.02862 seconds (files took 0.62628 seconds to load)
5 examples, 0 failures, 1 pending
```

Exec a specific version(2.0.1) of a profile when logged in with Automate:

```
$ inspec exec compliance://admin/apache-baseline#2.0.1
```

Download a specific version(2.0.2) of a profile when logged in with Automate:
```
$ inspec compliance download compliance://admin/apache-baseline#2.0.2
```

### To Logout from Chef Compliance

```
$ inspec compliance logout
Successfully logged out
```

## Integration Tests

At this point of time, InSpec is not able to pick up the token directly, therefore the integration test is semi-automatic at this point of time:

 * run `kitchen converge`
 * open https://192.168.251.2 and log in with user `admin` and password `admin`
 * click on user->about and obtain the access token and the refresh token
 * run `kitchen verify` with the required env variables:

```
# both token need to be set, since the test suite runs for each token type
export COMPLIANCE_ACCESSTOKEN='mycompliancetoken'
export COMPLIANCE_REFRESHTOKEN='myrefreshtoken'
kitchen verify
-----> Starting Kitchen (v1.7.3)
-----> Verifying <default-ubuntu-1404>...
       Search `/Users/chartmann/Development/compliance/inspec/lib/bundles/inspec-compliance/test/integration/default` for tests
..................................

Finished in 6.35 seconds (files took 0.40949 seconds to load)
34 examples, 0 failures

       Finished verifying <default-ubuntu-1404> (0m6.62s).
-----> Kitchen is finished. (0m7.02s)
zlib(finalizer): the stream was freed prematurely.
```
