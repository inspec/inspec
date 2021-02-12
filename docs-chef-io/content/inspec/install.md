+++
title = "Install and Uninstall"
draft = false
gh_repo = "inspec"

[menu]
  [menu.inspec]
    title = "Install and Uninstall"
    identifier = "inspec/install.md Install and Uninstall"
    parent = "inspec"
    weight = 20
+++

Users can choose between operating systems of MacOS, Windows, and Linux for Chef InSpec.

## Install Chef InSpec

You can download the latest Chef InSpec package relevant to your operating system
at [our Downloads Page](https://downloads.chef.io/inspec).

Alternatively, Chef InSpec can be installed via installer, script, or package
manager, according to your operating system and method as listed below.

### macOS

#### Homebrew

Chef InSpec is available as a standalone [Homebrew](https://brew.sh/) package.
Run the following command in your terminal to install Chef InSpec:

```
brew install chef/chef/inspec
```

While this command is running, you may be prompted to enter your macOS user account
password for installation to complete.

#### CLI

You can download Chef InSpec via curl script:

```
curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -P inspec
```

### Windows

#### Installer

Once you downloaded the latest [Chef InSpec package](https://downloads.chef.io/inspec)
relevant to your Microsoft version, double-click the `.msi` file to launch the
installer and follow the prompts.

#### Powershell

Use the following command to install Chef InSpec via Powershell script:

```powershell
. { iwr -useb https://omnitruck.chef.io/install.ps1 } | iex; install -project inspec
```

Once Chef InSpec is installed, run `inspec version` to verify that the installation
was successful.

### Linux

#### CLI

The following curl script will install Chef InSpec for Ubuntu and Red Hat Enterprise Linux:

```
curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -P inspec
```

If you prefer, you can use a package manager to install Chef InSpec.
Once you downloaded the latest [Chef InSpec package](https://downloads.chef.io/inspec)
relevant to your Linux-based platform, use the command for the respective package
manager listed below. Replace the example file path with the file path leading to
your downloaded package.

For Ubuntu, use the following command to install Chef InSpec:

```
sudo dpkg -i /path/to/inspec.deb
```

For Red Hat Enterprise Linux, use the following command to install Chef InSpec:

```
sudo rpm -U /path-to/inspec.rpm
```

For SUSE Linux Enterprise Server, use the following command to install Chef InSpec:

```
sudo zypper install /path-to/inspec.rpm
```


## Uninstall Chef InSpec

Chef InSpec can be uninstalled using the steps below that are appropriate for the
method of Chef InSpec installation.

### macOS

#### Homebrew

Use the following *destructive* command to remove the Chef InSpec standalone Homebrew package:

```
brew cask uninstall inspec
```

#### CLI

Use the following *destructive* command in your terminal to remove the Chef InSpec package:

```
sudo rm -rf /opt/inspec
```

### Windows

#### Installer

Use *Add / Remove Programs* to remove Chef InSpec.

### Linux

#### CLI

The supported Linux-based platforms and their respective *destructive* command
for their package manager are listed below.

For Ubuntu, use the following *destructive* command to uninstall:

```
sudo dpkg -P inspec
```

For Red Hat Enterprise Linux, use the following *destructive* command to uninstall:

```
sudo rpm -e inspec
```

For SUSE Linux Enterprise Server, use the following *destructive* command to uninstall Chef InSpec:

```
sudo zypper remove inspec
```
