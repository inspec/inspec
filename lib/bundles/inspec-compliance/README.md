# InSpec Extension for Chef Compliance

This extensions offers the following features:

 - list available profiles in Chef Compliance
 - execute profiles directly from Chef Compliance locally
 - upload a local profile to Chef Compliance

To use the CLI, this InSpec add-on adds the following commands:

 * `$ inspec compliance api_token server --token TOKEN --user USER` - save the Chef Compliance API token for user
 * `$ inspec compliance login` - authentication of the API token against Chef Compliance
 * `$ inspec compliance profiles` - list all available Chef Compliance profiles
 * `$ inspec compliance exec profile` - runs a Chef Compliance profile
 * `$ inspec compliance upload path/to/local/profile` - uploads a local profile to Chef Compliance
 * `$ inspec compliance logout` - logout of Chef Compliance

Compliance profiles can be executed in two mays:

- via compliance exec: `inspec compliance exec profile`
- via compliance scheme: `inspec exec compliance://profile`

## Integration Tests

At this point of time, InSpec is not able to pick up the token directly, therefore the integration test is semi-automatic at this point of time:

 * run `kitchen converge`
 * open https://192.168.251.2 and log in with user `admin` and password `admin`
 * click on user->about and obtain the refresh token
 * run `kitchen verify` with the required env variables:

```
COMPLIANCE_REFRESH_TOKEN=myrefreshtoken COMPLIANCE_ACCESS_TOKEN=mycompliancetoken b kitchen verify
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
