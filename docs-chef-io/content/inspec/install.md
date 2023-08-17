+++
title = "Install Chef InSpec"
draft = false
gh_repo = "inspec"

[menu]
  [menu.inspec]
    title = "Install"
    identifier = "inspec/install.md Install and Uninstall"
    parent = "inspec"
    weight = 20
+++

You can install Chef InSpec on MacOS, Windows, and Linux systems.

## Install Chef InSpec

You can download the latest Chef InSpec package relevant to your operating system
from [our Downloads Page](https://www.chef.io/downloads).

You can also install Chef InSpec using an installer, script, or package
manager.

### macOS

#### Homebrew

Chef InSpec is available as a standalone [Homebrew](https://brew.sh/) package.
Run the following command in your terminal to install Chef InSpec:

```bash
brew install chef/chef/inspec
```

While this command is running, Homebrew may prompt you to enter your macOS user account and
password to complete the installation.

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

## License management

Starting with **Chef InSpec 6**, you must provide a Chef License key the first time you run Chef InSpec. If you don't already have a license key, you will have the opportunity to [generate one]().

Chef Licenses are available in several tiers. For more information, please see LINK TODO.

### Provide a License Key

Note: If you are an individual and do not have a license key, please see the next section, Generating a License Key.

Note: If you are an existing commercial customer of Progress Chef, you may use your asset number from the support portal as your license key. For further details, see LINK TODO.

#### Providing a License Key Interactively

The easiest way to provide a License Key to Chef InSpec is to simply run Chef InSpec. Running any major top-level command, such as `inspec exec`, `inspec check`, or `inspec shell` (among others) will trigger the interactive licensing dialog if no license key has previously been set, and no automated method of setting the license key was detected.

This example shows how to interactively provide a license key using the `inspec shell` command.

```bash
inspec shell
------------------------------------------------------------
  License ID Validation

  To continue using Chef Inspec, a license ID is required.
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
Please enter your license ID:  tmns-34514522-bfe3-4fe7-850c-3fea317c810b-8089
✔ [Success] License validated successfully.
------------------------------------------------------------
License Details
  Asset Name       : InSpec
  License ID       : tmns-34514522-bfe3-4fe7-850c-3fea317c810b-8089
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

#### Providing a License Key Automatically - Single Node

To avoid being prompted, you may provide the license key as an environment variable (CHEF_LICENSE_KEY) or as a command line argument (--chef-license-key).

If the environment variable CHEF_LICENSE_KEY is set, then Chef InSpec will read the license key from the variable and attempt to validate the key. If successful, the key will be saved for future use. The user is not interactively prompted.

This example shows setting a trial license key.

```bash
export CHEF_LICENSE_KEY=tmns-34514522-bfe3-4fe7-850c-3fea317c810b-8089
inspec exec myprofile
```

Similarly, you may provide the license key as a command-line argument, --chef-license-key. You may provide this argument to most Chef InSpec CLI main commands; some plugins may not support the flag.

This example shows setting a license key formatted as a Commercial Asset Number.

```bash
inspec exec myprofile --chef-license-key 9QSVFT5YD9M4D55VXWPZZG13T4
```

#### Providing a License Key Automatically - Bulk Deployment

##### Setting the Key Using an Environment Variable in Bulk

One option is to set the license key in the execution context using an environment variable, CHEF_LICENSE_KEY. Many modern compute platforms, such as Windows, AWS, Kubernetes and vmWare, and most CI systems such as Jenkins and BuildKite support setting environment variables for compute environments in one way or another. This approach often allows further integration with secrets management systems such as AWS Secrets Manager or Hashicorp Vault. For details on the effects of setting CHEF_LICENSE_KEY, see Providing a License Key Automatically - Single Node. (LINK TODO)

##### Using a Local License Server to Set the License Key in Bulk

For large or isolated (airgapped) fleets, Chef InSpec 6 and later also supports providing the license key by contacting a Local License Server. In this modality, Chef InSpec deployers do not need to know the license key - only the URL(s) of the local license servers. This has several advantages:

 * Deployers can control network communications to the internet, as the local license server is designed to work in isolation along with the Chef InSpec scanning instances. 
 * There is no need to manage a secret on each Chef InSpec scanning node, and the local license server URL changes less frequently than the license key
 * Freedom to scale along with the workload

For details about how to obtain, setup and run the Local License Server, please contact LINK TODO.

###### The CHEF_LICENSE_SERVER Setting - Basics

To tell Chef InSpec to use a Local License Server, you may use the environment variable CHEF_LICENSE_SERVER or the CLI argument --chef-license-server. 

If the CHEF_LICENSE_SERVER variable or `--chef-license-server` option is present, then Chef InSpec will first ask the Local License Server for a list of license keys, and then use that response to license itself for the duration of execution. The user is not interactively prompted for a license key at all. The keys are not stored for long-term use.

```bash
export CHEF_LICENSE_SERVER=https://my-licensing.mycorp.com
inspec exec myprofile
```

###### The CHEF_LICENSE_SERVER Setting - Advanced Use

For deployers looking to improve the resiliency and redundancy of the Local Licensing Service, Chef InSpec offers a modest local failover capability. 

If the value of CHEF_LICENSE_SERVER appears to be a comma-separated list of up to 5 URLs, then Chef InSpec will try each URL in turn, using the first that works.

```bash
export CHEF_LICENSE_SERVER=https://lic-01.mycorp.com,https://lic-02.mycorp.com
inspec exec myprofile
```

This capability is basic and requires the license servers to be synchronized, otherwise incosistent results will occur.

### Generate a license key

If you are interested in the Free or Trial License Tiers, you may interactively generate a license at the command prompt. It will be emailed to you, and then you may provide the key in several ways to InSpec - see Providing a License Key LINK TODO.

To generate a license, simply run a Chef InSpec command, such as `inspec shell` or `inspec exec`. You can also use the `inspec license add` command to explicitly trigger the license UI.

This example uses `inspec shell` to generate a license.

```bash
wolfe@KM216D6CNF inspec-6 % inspec shell
------------------------------------------------------------
  License ID Validation

  To continue using Chef Inspec, a license ID is required.
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

Choose "I don't have a license ID and would like to generate a new license ID".

```bash
Thank you for taking interest in Inspec.

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
Please enter your license ID:  tmns-34514522-bfe3-4fe7-850c-3fea317c810b-8089
✔ [Success] License validated successfully.
------------------------------------------------------------
License Details
  Asset Name       : InSpec
  License ID       : tmns-34514522-bfe3-4fe7-850c-3fea317c810b-8089
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

Chef Inspec will display the license entitlement details and then run `inspec shell`. Because you have entered a license key, you will not be prompted again for a key the next time you run Chef Inspec.

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
