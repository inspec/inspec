# InSpec Extension for Chef Compliance

This extensions offers the following features:

 - list available profiles in Chef Compliance
 - execute profiles directly from Chef Compliance locally
 - upload a local profile to Chef Compliance

To use the CLI, this InSpec add-on adds the following commands:

 * `$ inspec compliance login user password` - authentication against Chef Compliance
 * `$ inspec compliance profiles` - list all available Chef Compliance profiles
 * `$ inspec compliance exec profile` - runs a Chef Compliance profile
 * `$ inspec compliance upload path/to/local/profile` - uploads a local profile to Chef Compliance
 * `$ inspec compliance logout` - logout of Chef Compliance

Compliance profiles can be executed in two mays:

- via compliance exec: `inspec compliance exec profile`
- via compliance scheme: `inspec exec compliance://profile`
