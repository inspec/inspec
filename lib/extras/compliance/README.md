# InSpec Extension for Chef Compliance

This extensions offers the following features:

 - list profiles available in Chef Compliance
 - execute profiles from Chef Compliance
 - upload a local profile to Chef Compliance

To use the CLI, this extra package adds the following commands:

 * `$ inspec compliance login user password` - retieves a authentication token from Chef Compliance
 * `$ inspec compliance list` - list all available profiles in Chef Compliance
 * `$ inspec exec profile` - runs a profile that is stored on Chef Compliance
 * `$ inspec compliance upload path/to/local/profile` - uploads a local command to Chef Compliance
 * `$ inspec compliance logout` - removes the authentication token from the local cache and logs out of the Chef Compliance server
