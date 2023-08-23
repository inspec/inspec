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

## License key management

Starting with **Chef InSpec 6**, you must provide a Chef License key the first time you run Chef InSpec.
If you don't already have one, you can [generate a license key](#generate-a-license-key) in the Chef InSpec CLI.

Chef Licenses are available in several tiers. For more information, please see LINK TODO.

{{< note >}}

Existing commercial customers of Progress Chef may use your asset serial number from the [Progress support portal](https://community.progress.com/s/products/chef) as a license key. For further details, see LINK TODO.

{{< /note >}}

### Set a License Key

Chef InSpec provides several ways to set a license key.

#### Interactive license dialog

The easiest way to provide a license key to Chef InSpec is to simply run Chef InSpec. Running any major top-level command, such as `inspec exec`, `inspec check`, or `inspec shell` (among others) will trigger the interactive licensing dialog if no license key has previously been set, and no automated method of setting the license key was detected.

This example shows how to interactively provide a license key using the `inspec shell` command.

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

At the first prompt, choose "I already have a license ID". You are then prompted to enter your license key.

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

Chef InSpec will validate the license key, display information about the license entitlements, and then proceed to run `inspec shell` as requested. The license key will be stored for future use, and the user will not be prompted again when they run another major Chef InSpec command.

Chef InSpec tries to detect a human operator because it is often run under test automation environments such as CI systems. If no human operator was detected and no license key was provided, Chef InSpec will exit with error code 173. If Chef InSpec thinks there is a human there but gets no response for 60 seconds, it will give up and exit with code 173. To set a license key in ways that are friendly to CI, please read the following sections.

#### Command line option

You can set the license key in the command line using the `--chef-license-key` option. You may provide this argument to most Chef InSpec CLI main commands; some plugins may not support the flag.

This example shows setting a license key formatted as a Commercial Asset Number.

```bash
inspec exec profile_name --chef-license-key <LICENSE_KEY>
```

#### Environment variable

You can set the license key as an environment variable using the `CHEF_LICENSE_KEY`
Chef InSpec will read the license key from the variable and attempt to validate the key. If successful, the key will be saved for future use. The user is not interactively prompted.

This example shows setting a trial license key.

```bash
export CHEF_LICENSE_KEY=<LICENSE_KEY>
inspec exec profile_name
```

#### Chef Local License Server

For large or isolated (air-gapped) fleets, Chef InSpec can retrieve a license key from a Chef Local License Server.
With this method, Chef InSpec users do not need to know the license key -- only the URL(s) of the local license servers.

Chef InSpec sends a request to the Local License Server for a list of license keys and then uses that response to license itself during execution.
The user is not interactively prompted for a license key at all. The keys are not stored for long-term use.

For details about how to obtain, setup, and run a Chef Local License Server, please contact LINK TODO.

##### Environment Variable

You can use the `CHEF_LICENSE_SERVER` environment variable to set a license server.

```bash
export CHEF_LICENSE_SERVER=https://license-server.example.com
inspec exec profile_name
```

##### Command line option

You can use the `--chef-license-server` command line option to set a Local License Server URL.

```bash
inspec exec profile_name --chef-license-server https://license-server.example.com
```

##### Multiple license servers

You can set multiple license servers, which provides resiliency and redundancy for managing licenses.

If the value of `CHEF_LICENSE_SERVER` appears to be a comma-separated list of up to five URLs, then Chef InSpec will try each URL in turn, and use the first that works.

```bash
export CHEF_LICENSE_SERVER=https://license-server-01.example.com,https://license-server-02.example.com
inspec exec profile_name
```

This capability is basic and requires the license servers to be synchronized, otherwise incosistent results will occur.

### Generate a license key

If you are interested in a free or trial license, you may generate a license at the command prompt. The license will be emailed to you and then you must [set the license key](#set-a-license-key) to make it active.

To generate a license, run a Chef InSpec command, such as `inspec shell` or `inspec exec`. You can also use the `inspec license add` command to explicitly trigger the license UI.

This example uses the `inspec shell` command to trigger the interactive license dialog.

```bash
$ inspec shell
------------------------------------------------------------
  License ID Validation

  To continue using Chef InSpec, a license ID is required.
  (Free, Trial, or Commercial)

  If you generated a license previously, you might
  have received it in an email.

  If you are a commercial user, you can also find it in the
  supportlink.chef.io portal.
------------------------------------------------------------

Please choose one of the options below
  I already have a license ID
‣ I don't have a license ID and would like to generate a new license ID
  Skip
```

Choose **I don't have a license ID and would like to generate a new license ID**.

```bash
Thank you for taking interest in InSpec.

We have the following types of licenses.
Select the type of license below and then enter user details

  1. Free License
     Validity: Unlimited
     No. of units: 10 targets

‣ 2. Trial License
     Validity: 30 Days
     No. of units: Unlimited targets

  3. Commercial License

  4. Quit license generation
```

You may choose either Free or Trial to generate a license; this example chooses Trial.

You'll next be asked for your user details. A valid company email is required.

```bash
Select the type of license below and then enter user details
 2. Trial License
     Validity: 30 Days
     No. of units: Unlimited targets

Please enter the following details:
First Name, Last Name, Email, Company, Phone
Enter First Name:  Alice
Enter Last Name:  Scanswell
Enter Email Address (Business email is mandatory for a trial license): alice@example.com
Enter Company Name:  Example Company
Enter phone number:  4155551212
------------------------------------------------------------
Review the details below and confirm to proceed.
------------------------------------------------------------
License Details

  Type: Trial License
  Validity: 30 days
  No. of units: Unlimited targets

User Details

  First Name: Alice
  Last Name: Scanswell
  Email: alice@example.com
  Company: Example Company
  Phone number: 4155551212
------------------------------------------------------------
Please select (Press ↑/↓ arrow to move and Enter to select)
‣ Confirm the details and proceed
  Reselect the license type
  Edit user details
  Quit the license generation process
```

Confirm the details and proceed. The license key will be emailed to you. You may enter it immediately.

```bash
Please select Confirm the details and proceed
✔ [Success] License generated successfully

The license ID has been sent to alice@example.com.
Please enter your license ID:  <LICENSE_KEY>
✔ [Success] License validated successfully.
------------------------------------------------------------
License Details
  Asset Name       : InSpec
  License ID       : <LICENSE_KEY>
  Type             : Trial
  Status           : Active
  Validity         : 30 Days
  No. Of Units     : Unlimited
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

Chef InSpec will display the license entitlement details and then run `inspec shell`. Because you have entered a license key, you will not be prompted again for a key the next time you run Chef InSpec.

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
