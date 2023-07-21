+++
title = "Install Chef InSpec 5"
gh_repo = "inspec"
+++

You can install Chef InSpec on MacOS, Windows, and Linux systems.

## Install Chef InSpec 5

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
