+++
title = "License Chef InSpec"
draft = false
gh_repo = "inspec"

[menu]
  [menu.inspec]
    title = "License"
    identifier = "inspec/install/license"
    parent = "inspec/install"
    weight = 30
+++

Before running Chef InSpec, you must accept the Chef EULA and---starting with **Chef InSpec 6**---add a license key.

Chef InSpec accepts a license key using one of two methods:

- by setting a license key with an [environment variable or using the InSpec CLI](#license-key)
- by retrieving a license key from a [Chef Local License Service URL](#chef-local-license-service)

For more information on Chef licenses, see [Chef's licensing documentation](/licensing/).

You can [request a trial license](https://www.chef.io/licensing/inspec/license-generation-free-trial) if you'd like to try out InSpec.

## Accept the Chef EULA

You must accept the [Chef End User License Agreement (EULA)](https://www.chef.io/end-user-license-agreement) before running Chef InSpec using one of two methods.

- [command line option](#command-line-option)
- [environment variable](#environment-variable)

If no command line argument or environment variable is set, Chef InSpec requests acceptance through an interactive prompt. If the prompt can't be displayed, then the product will fail with exit code 172.

If the product attempts to persist the accepted license and fails, Chef InSpec sends a message to STDOUT and continues to run. In a future invocation, you will need to accept the license again.

### Command line option

Use the `--chef-license <value>` argument to accept the Chef EULA.

```sh
inspec exec <PROFILE_NAME> --chef-license <value>
```

Replace `<value>` with one of the following options.

`accept`
: Accept the license and attempts to persist a marker file locally. Persisting these marker files means future invocations don't require accepting the license again.

`accept-silent`
: Similar to `accept`, but no messaging is sent to STDOUT.

`accept-no-persist`
: Similar to `accept-silent`, but no marker file is persisted. Future invocation will require accepting the license again.

### Environment variable

Use the `CHEF_LICENSE="<value>"` environment variable to accept the Chef EULA.

```sh
export CHEF_LICENSE="<value>"
inspec exec <PROFILE_NAME>
```

Replace `<value>` with one of the following options.

`accept`
: Accept the license and attempts to persist a marker file locally. Persisting these marker files means future invocations don't require accepting the license again.

`accept-silent`
: Similar to `accept`, but no messaging is sent to STDOUT.

`accept-no-persist`
: Similar to `accept-silent`, but no marker file is persisted. Future invocation will require accepting the license again.

## License key

You can add a license key to Chef InSpec using one of three methods:

- [interactive license dialog](#interactive-license-dialog)
- [command line option](#command-line-option-1)
- [environment variable](#environment-variable-1)

{{< note >}}

Existing commercial customers of Progress Chef may use an asset serial number from the [Progress support portal](https://community.progress.com/s/products/chef) as a license key.

{{< /note >}}

### Interactive license dialog

The easiest way to provide a license key to Chef InSpec is to run Chef InSpec.
Run any major top-level command (such as `inspec exec`, `inspec check`, or `inspec shell`) and InSpec will start an interactive licensing dialog
if no license key is already set and it doesn't detect an automated method of setting the license key.

1. To start the interactive licensing dialog, run a top-level command such as `inspec shell`.

1. At the first prompt, select **I already have a license ID**.

    ```bash
    inspec shell
    ------------------------------------------------------------
      License ID Validation

      To continue using Chef InSpec, a license ID is required.
      (Free, Trial, or Commercial)

      If you generated a license previously, you might
      have received it in an email.

      If you are a commercial user, you can also find it in the
      supportlink.chef.io portal.
    ------------------------------------------------------------

    Please choose one of the options below (Press ↑/↓ arrow to move and Enter to select)
    ‣ I already have a license ID
      I don't have a license ID and would like to generate a new license ID
      Skip
    ```

1. Enter your license key at the second prompt.

   ```bash
   Please choose one of the options below I already have a license ID
   Please enter your license ID:  <LICENSE_KEY>
   ✔ [Success] License validated successfully.
   ------------------------------------------------------------
   License Details
     Asset Name       : InSpec
     License ID       : <LICENSE_KEY>
     Type             : Trial
     Status           : Active
     Validity         : Unlimited
     No. Of Units     : 10 Targets
   ------------------------------------------------------------
   Welcome to the interactive InSpec Shell
   To find out how to use it, type: help

   You are currently running on:

       Name:      mac_os_x
       Families:  darwin, bsd, unix, os
       Release:   22.5.0
       Arch:      arm64

   inspec> exit
   ```

Chef InSpec validates the license key, displays information about the license entitlements, and then runs `inspec shell` as requested.
Chef InSpec stores license keys for future use and will not prompt you for the license key for the duration of your license.

### Command line option

You can set the license key in the command line using the `--chef-license-key` option.
You may provide this argument to most Chef InSpec CLI main commands, however some plugins may not support the flag.

```bash
inspec exec <PROFILE_NAME> --chef-license-key <LICENSE_KEY>
```

### Environment variable

You can set the license key using the `CHEF_LICENSE_KEY` environment variable.
Chef InSpec will read the license key from the variable and attempt to validate the key.
If successful, InSpec saves the key and will not prompt you for it the next time you run InSpec.

```bash
export CHEF_LICENSE_KEY=<LICENSE_KEY>
inspec exec <PROFILE_NAME>
```

## Chef Local License Service

For large or isolated (air-gapped) fleets, Chef InSpec can retrieve a license key from a [Chef Local License Service](/licensing/local_license_service/).
With Chef Local License Service, InSpec users do not need to know a license key---only the service URL(s).

Chef InSpec sends a request to the Local License Service for a list of license keys and then uses that response to license itself during execution.
InSpec will not prompt you for a license key.
Chef InSpec does not store license keys for long-term use when they are retrieved from a Chef Local License Service.

Use one of the following methods to set a Local License Service URL.

- [command line option](#command-line-option-2)
- [environment variable](#environment-variable-2)

### Command line option

Use the `--chef-license-server` command line option to set a Chef Local License Service URL.

```bash
inspec exec <PROFILE_NAME> --chef-license-server https://license-server.example.com
```

### Environment variable

Use the `CHEF_LICENSE_SERVER` environment variable to set a Chef Local License Service URL.

```bash
export CHEF_LICENSE_SERVER=https://license-server.example.com
inspec exec <PROFILE_NAME>
```

#### Multiple license servers

You can set multiple Chef Local License Services, which provides resiliency and redundancy for managing licenses.

Enter up to five Chef Local License Service URLs as a comma-separated list. Chef InSpec will try each URL and use the first one that works.

```bash
export CHEF_LICENSE_SERVER=https://license-server-01.example.com,https://license-server-02.example.com
inspec exec <PROFILE_NAME>
```

This capability is basic and you must synchronize the license servers, otherwise you may get inconsistent results.

## Licensing Telemetry service

The Chef Licensing Telemetry service gathers product activation, product usage trends and statistics, environment information, bugs, and other data related to the use of Chef InSpec.

This feature is enabled for free and trial tiers only and isn't enabled for commercial users.

For more information on the data gathered by the Licensing Telemetry service, see the [Progress Privacy Policy](https://www.progress.com/legal/privacy-policy).
