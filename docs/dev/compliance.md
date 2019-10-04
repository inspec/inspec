# About `inspec compliance`

## Purpose

The `compliance` set of subcommands handle user-initiated communication with Chef Automate. The commands are provided so that a user can interact with an Automate installation.

`inspec compliance` is somewhat analogous to `knife` in that it can be used to upload, download, and manage profiles for distribution to other clients.

When Automate initiates scans, the `compliance` subcommand is not used.

## Operational Notes

### Obtaining an a test Automate server

You'll need a test Chef Automate server. https://learn.chef.io/modules/try-chef-automate#/setup is one way of setting one up locally.

### Getting an API token

After starting Automate, registering, and starting a trial license, you will need to setup an API token. You will use API token with `login`, which is required for most other commands. To setup an API token within the Automate UI:

 1. Click the "Settings" tab. A new set of menus appears on the left.
 2. Choose "API Tokens" from the left menu.
 3. Create a new API token. Your choice of name and ID don't really matter. After creation, select the new token, click the three dots to reveal the extended menu, and choose "Copy Token".

## Implementation Notes

### Code Location

#### as a CLI command plugin

The codebase is located in `inspec/lib/plugins/inspec-compliance/`. It is a minimally converted v2 plugin, meaning that it works fine as a plugin but little was done to clean it up.

#### Legacy external require location for audit cookbook

The audit cookbook requires in the compliance plugin, using a legacy path at `inspec/lib/bundles/inspec-compliance`.  There are several stub files at that location. Because we cannot control which combination of inspec and audit cookbook are being used, even if we removed or updated the location in audit cookbook, we'd still need to leave the old stubs for a while.

### Important files

#### lib/cli.rb

This file defines the Thor subcommand CLI UX. Look at this file for all commands and options. Most command implementation is right here inline, which makes this file large and noisy. Some implementation, pertaining to interaction with the actual Automate service, is pushed out to a class `InspecPlugins::Compliance::API`; class methods are used to perform actions.

#### lib/configuration.rb

A fairly straightforward data container with JSON marshalling. Used to store CLI options as well as to write credentials to disk.

#### lib/api.rb

This is the wrapper around the Automate API. The approach is to present class methods which take as an argument a stateful config object.
The code is brittle, being highly conditionalized for products that have been sunsetted, such as Compliance and the soon to sunsetted Automate1. In some cases there are conditionals for versions that have been sunsetted as well.

Actual HTTP communication is handled by `InspecPlugins::Compliance::HTTP`, again using class methods.

#### lib/http.rb

This is probably unneccesary. It is a wrapper around Net:HTTP. Instead, we should probably be using a REST API wrapper or something similar.

#### lib/support.rb

Tries to map versions to feature support for the API. Does not appear to be relied on very much. Duplicate functionality may be in lib/configuration.rb .

## Subcommands

There are several other minor commands not listed here - see `lib/cli.rb` for a complete listing.

### login

Saves a credentials file locally. Future invocations of `inspec compliance` use the credentials file to authenticate.

`be inspec compliance login --user=admin --token='1234567890asdfghjkl' --insecure https://chef-automate.test`

Here are the results of running login, from `.inspec/compliance/config.json`:

```json
{
	"automate": {
		"ent": "automate",
		"token_type": "dctoken"
	},
	"server": "https://chef-automate.test/api/v0",
	"user": "admin",
	"owner": "admin",
	"insecure": true,
	"server_type": "automate2",
	"token": "1234567890asdfghjkl",
	"version": "0"
}
```

#### login code trace

Thor code in `lib/cli.rb` stores the passed-in server URL in the config object, and then passes everything to `InspecPlugins::Compliance::API.login`. That class method is actually defined in `lib/api/login.rb` and is quite large because it immediately conditionalizes on supporting three products - Compliance, A1, and A2.

Next, the options passed in are lightly validated. A config object is created and the creds are stored, then saved to disk as JSON.

NOTE: At no point are the credentials tested by attempting to reach the Automate server (https://github.com/inspec/inspec/issues/3535). Learn Chef Rally materials suggest using the `profiles` command to verify your creds.

### profiles

Lists available profiles on the Automate server. Appears to only list those that have been "activated" (you have clicked "get" in the Automate UI). Uses the Inspec::UI code via the legacy calling patterns.

#### profile code trace

First, a new Config object is created, which reads the config from disk. Then, `loggedin(config)` is called, which does a very thin check - it only determines if a setting is present in the config for the server URL, but it does not actually contact the server. Finally, `InspecPlugins::Compliance::API.profiles` is called with the config, and with a lot of conditional logic, eventually returns a hash of profile metadata, which gets parsed and displayed.

### upload

Like knife cookbook upload, this command sends an artifact to be stored for retrieval by other clients. Chef Automate then runs `inspec check` on the profile on the server side, and if OK, stores the profile. The new profile is included in the list when running `profiles`.

#### upload code trace

Calls `vendor_deps()` from `inspec/lib/base_cli.rb` (OUTSIDE the plugin) - this vendors the profile.
Checks the profile. The way that the errors in the profile are traced is unusual; it's accumulated using a lambda.
Tar up the profile if it a directory.
Calls `InspecPlugins::Compliance::API.upload` which, after conditionalizing on the URL and headers, does a POST.

### exec

Simply adds the `compliance://` schema to the beginning of the profile name then performs a normal run.
Apparently there is a fetcher that can handle that, but I have not found that yet.
