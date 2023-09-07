+++
title = "Install Chef InSpec"
draft = false
gh_repo = "inspec"

[menu]
  [menu.inspec]
    title = "Install"
    identifier = "inspec/Install"
    parent = "inspec"
    weight = 20
+++

You can install Chef InSpec on MacOS, Windows, and Linux systems.

## Install

You can download the latest Chef InSpec package relevant to your operating system
from [our Downloads Page](https://www.chef.io/downloads).

You can also install Chef InSpec using an installer, script, or package
manager.

### macOS

#### CLI

You can install Chef InSpec using a curl script.

```bash
curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -P inspec
```

### Windows

#### Installer

Download a Windows Chef InSpec package from [Chef Downloads](https://www.chef.io/downloads),
then double-click on the `.msi` file to launch the installer and follow the prompts.

#### Powershell

You can install Chef InSpec using the following Powershell script.

```powershell
. { iwr -useb https://omnitruck.chef.io/install.ps1 } | iex; install -project inspec
```

Once you have installed Chef InSpec, run `inspec version` to verify that the installation
was successful.

### Linux

#### CLI

The following curl script will install Chef InSpec for Ubuntu and Red Hat Enterprise Linux:

```bash
curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -P inspec
```

If you prefer, you can use a package manager to install Chef InSpec.
Once you downloaded the latest [Chef InSpec package](https://www.chef.io/downloads)
relevant to your Linux-based platform, use the command for the respective package
manager listed below. Replace the example file path with the file path leading to
your downloaded package.

For Ubuntu, use the following command to install Chef InSpec:

```bash
sudo dpkg -i /path/to/inspec.deb
```

For Red Hat Enterprise Linux, use the following command to install Chef InSpec:

```bash
sudo rpm -U /path-to/inspec.rpm
```

For SUSE Linux Enterprise Server, use the following command to install Chef InSpec:

```bash
sudo zypper install /path-to/inspec.rpm
```

## Add a license

Starting with **Chef InSpec 6**, you must set a Chef license key the first time you run Chef InSpec.
Chef licenses are available in several tiers. For more information, please see LINK TODO.

You can [request a trial license](https://www.chef.io/licensing/inspec/license-genertation-free-trial) if you'd like to try out InSpec.

Chef InSpec provides several ways to set a license key.

{{< note >}}

Existing commercial customers of Progress Chef may use an asset serial number from the [Progress support portal](https://community.progress.com/s/products/chef) as a license key.

{{< /note >}}

### Interactive license dialog

The easiest way to provide a license key to Chef InSpec is to run Chef InSpec.
Run any major top-level command (such as `inspec exec`, `inspec check`, or `inspec shell`) and InSpec will start an interactive licensing dialog
if no license key is already set, and it doesn't detect an automated method of setting the license key.

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
Chef InSpec stores license keys for future use, and InSpec will not prompt you for the license key for the duration of your license.

### Command line option

You can set the license key in the command line using the `--chef-license-key` option.
You may provide this argument to most Chef InSpec CLI main commands, however some plugins may not support the flag.

```bash
inspec exec profile_name --chef-license-key <LICENSE_KEY>
```

### Environment variable

You can set the license key as an environment variable using the `CHEF_LICENSE_KEY`
Chef InSpec will read the license key from the variable and attempt to validate the key.
If successful, InSpec saves the key and will not prompt you for it the next time you run InSpec.

```bash
export CHEF_LICENSE_KEY=<LICENSE_KEY>
inspec exec profile_name
```

### Chef Private License Server

For large or isolated (air-gapped) fleets, Chef InSpec can retrieve a license key from a Chef Private License Server.
With a Chef Private License Server, InSpec users do not need to know a license key -- only the URL(s) of the server.

Chef InSpec sends a request to the Private License Server for a list of license keys and then uses that response to license itself during execution.
InSpec will not prompt you for a license key.
Chef InSpec does not store license keys for long-term use when they are retrieved from a Chef Private License Server.

You can set the URL of a Chef Private License Server using an [environment variable](#environment-variable-1) or with a [command line option](#command-line-option-1).

For details about how to obtain, setup, and run a Chef Private License Server, please contact LINK TODO.

#### Environment variable

Use the `CHEF_LICENSE_SERVER` environment variable to set a Chef Private License Server URL.

```bash
export CHEF_LICENSE_SERVER=https://license-server.example.com
inspec exec profile_name
```

#### Command line option

Use the `--chef-license-server` command line option to set a Chef Private License Server URL.

```bash
inspec exec profile_name --chef-license-server https://license-server.example.com
```

#### Multiple license servers

You can set multiple Chef Private License Servers which provides resiliency and redundancy for managing licenses.

Enter up to five Chef Private License Server URLS as a comma-separated list. Chef InSpec will try each URL and use the first one that works.

```bash
export CHEF_LICENSE_SERVER=https://license-server-01.example.com,https://license-server-02.example.com
inspec exec profile_name
```

This capability is basic and you must synchronize the license servers, otherwise you may get inconsistent results.

## Uninstall Chef InSpec

You can uninstall Chef InSpec using the steps below that are appropriate for the
method of Chef InSpec installation.

### macOS

#### Homebrew

Use the following *destructive* command to remove the Chef InSpec standalone Homebrew package:

```bash
brew cask uninstall inspec
```

#### CLI

Use the following *destructive* command in your terminal to remove the Chef InSpec package:

```bash
sudo rm -rf /opt/inspec
```

### Windows

#### Installer

Use *Add / Remove Programs* to remove Chef InSpec.

### Linux

#### CLI

Use the following *destructive* commands to uninstall Chef InSpec from Linux-based platforms.

For Ubuntu, use the following *destructive* command to uninstall Chef InSpec:

```bash
sudo dpkg -P inspec
```

For Red Hat Enterprise Linux, use the following *destructive* command to uninstall Chef InSpec:

```bash
sudo rpm -e inspec
```

For SUSE Linux Enterprise Server, use the following *destructive* command to uninstall Chef InSpec:

```bash
sudo zypper remove inspec
```
