+++
title = "InSpec Configuration File"
draft = false
gh_repo = "inspec"

[menu]
  [menu.inspec]
    title = "Configure"
    identifier = "inspec/config.md Configuration"
    parent = "inspec"
    weight = 30
+++

This documents how to create a configuration file for Chef InSpec. A config file is **optional**.

There are two config file versions, 1.1 and 1.2.

## Config File Location

By default, Chef InSpec looks for a config file in `~/.inspec/config.json`.

You may also specify the location using `--config`.  For example, to run the shell using a config file in `/etc/inspec`, use `inspec shell --config /etc/inspec/config.json`.

## Versions

There are two possible versions for this config file, `1.1` or `1.2`. Only version `1.2` accepts the `plugins` setting.

## Example

```json
{
  "version": "1.2",
  "cli_options":{
    "color": "true"
  },
  "credentials": {
    "ssh": {
      "my-target": {
        "host":"somewhere.example.com",
        "user":"bob"
      }
    }
  },
  "reporter": {
    "automate" : {
      "stdout" : false,
      "url" : "https://AUTOMATE_URL/data-collector/v0/",
      "token" : "AUTOMATE_API_TOKEN",
      "insecure" : true,
      "node_name" : "inspec_test_node",
      "environment" : "prod"
    }
  },
  "plugins": {
      "inspec-training-wheels":{
         "diameter":"4 inches"
      },
      "inspec-input-secrets":{
         "security-tokens":[
            "123456789",
            "abcdef252875"
         ]
      }
   }
}
```

### Properties

`version`
: **required**

  The file format version.

  Allowed values: `1.1` or `1.2`

`cli_options`
: Any long-form command line option, without the leading dashes.

`credentials`
: Train-transport-specific options. Store the options keyed first by transport name, then by a name you'll use later on. The combination of transport name and your chosen name can be used in the `--target` option to `inspec exec`, as `--target transport-name://connection-name`.

  For example, if the config file contains:

  ```json
  {
    "credentials": {
      "winrm": {
        "myconn": {
          "user": "Administrator",
          "host": "prod01.east.example.com",
          "disable_sspi": true,
          "connection_retries": 10
        }
      }
    }
  }
  ```

  Then use `-t winrm://myconn` to connect to the host, with the given extra options.

  Each Train transport offers a variety of options. By using the credential set facility, you are able to set options that are not accessible via the Train URI.

  You may have as many credential sets in the config file as you require.

  If you use a target URI and the portion after the `://` cannot be matched to credential set name, Chef InSpec will send the URI to Train to be parsed as a Train URI.  Thus, you can still do `ssh://someuser@example.com`.

  You can use a credential set, and then override individual options using command line options.

  Credential sets are intended to work hand-in-hand with the underlying credentials storage facility of the transport. For example, if you have a `~/.ssh/config` file specifying that the sally-key.pem file should be used with the host `example.com`, and you have a credential set that specifies that host, then when Train tries to connect to that host, the SSH library will automatically use the SSH config file to use the indicated key.

`reporter`
: Formats and delivers the results of a Chef InSpec audit run. For information on configuring reporters, see the [InSpec reporters documentation](/inspec/reporters/).

`plugins`

: Provide configuration settings to plugins that you use with Chef InSpec.
  Refer to the documentation of the plugin you are using for details regarding what settings are available.

  Each plugin will have a key-value are that it may use as it sees fit - Chef InSpec does not specify the structure.

  Set the config file to **version 1.2** to use this setting.

  For more information on plugins, see the [Chef InSpec plugins documentation](/inspec/plugins/).
